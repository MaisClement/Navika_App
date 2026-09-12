import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart' as material;
import 'package:flutter/material.dart' hide Visibility;
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:navika/src/class/geocoords.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/extensions/hexcolor.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter/foundation.dart';
import 'package:navika/src/utils.dart';
import 'package:screenshot/screenshot.dart';

enum PositionState {
  defined, // Défini
  acquiring, // En cours d'acquisition
  permissionDenied, // Permission rejetée
  servicesDisabled, // Services désactivés
  unknown // Inconnu
}

class MapboxController {
  final MapboxMap mapboxMap;

  // Position tracking
  geolocator.Position? _position;
  StreamSubscription<geolocator.Position>? _positionStream;
  StreamSubscription<CompassEvent>? _compassStream;
  PositionState _positionState = PositionState.unknown;
  bool _locationIndicatorAdded = false;
  double _lastCompass = 0;

  // Screenshot controller pour capturer les icônes
  final ScreenshotController _screenshotController = ScreenshotController();

  // Callbacks pour notifier l'UI des changements
  Function? onPositionStateChanged;
  Function? onPositionChanged;
  Function? onMarkersChanged;
  Function? onCompassChanged;
  Function? onMarkerTapped; // Callback pour les clics sur les marqueurs (type, id)

  // Gestionnaire des marqueurs de points d'intérêt
  // id -> PointAnnotation
  final Map<String, PointAnnotation> _pointAnnotations = {};
  // id -> { type, id, name, coord: {lat, lon} }
  final Map<String, Map> _markerMetadata = {};
  PointAnnotationManager? _pointAnnotationManager;
  // annotation.id (assigné par le SDK natif) -> notre id métier de marqueur
  final Map<String, String> _annotationIdToMarkerId = {};
  Cancelable? _tapEventsSubscription;
  DateTime? _lastAnnotationTapAt;

  // Cache d'images chargées depuis les assets (chemin -> bytes)
  final Map<String, Uint8List> _imageCache = {};

  // Verrou pour éviter les mises à jour de marqueurs concurrentes
  Completer<void>? _markerUpdateLock;

  // Gestionnaire des shapes (lignes GeoJSON)
  final List<String> _shapeLayers = []; // Liste des couches de shapes ajoutées
  // Stockage des features bruts et du niveau de simplification appliqué
  final Map<String, Map> _shapeOriginal = {}; // shapeId -> feature original (GeoJSON Feature)
  final Map<String, int> _shapeAppliedBucket = {}; // shapeId -> bucket de simplification actuel

  MapboxController(this.mapboxMap);

  MapboxMap getInstance() {
    return mapboxMap;
  }

  /// Définit l'angle de rotation (bearing) de la caméra
  Future<void> setBearing(double bearing, [double? pitch]) async {
    CameraState camera = await mapboxMap.getCameraState();
    CameraOptions cameraOptions = camera.toCameraOptions();
    cameraOptions.bearing = bearing;
    if (pitch != null) {
      cameraOptions.pitch = pitch;
    }

    mapboxMap.flyTo(cameraOptions, MapAnimationOptions(duration: 700));
  }

  /// Convertit des pixels RGBA bruts en PNG (nécessaire car Android attend du PNG dans addStyleImage)
  Future<Uint8List> _rgbaToPng(int width, int height, Uint8List rgbaPixels) async {
    final completer = Completer<ui.Image>();
    ui.decodeImageFromPixels(
      rgbaPixels,
      width,
      height,
      ui.PixelFormat.rgba8888,
      (result) => completer.complete(result),
    );
    final image = await completer.future;
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    image.dispose();
    return byteData!.buffer.asUint8List();
  }

  /// Génère une image RGBA de cercle plein avec bordure pour l'indicateur de position
  Uint8List _generateCirclePixels(int size, material.Color fillColor, material.Color borderColor, int borderWidth) {
    final pixels = Uint8List(size * size * 4);
    final center = size / 2.0;
    final outerRadius = size / 2.0;
    final innerRadius = outerRadius - borderWidth;

    // Extraire les composantes en 0-255
    final fR = (fillColor.r * 255).round();
    final fG = (fillColor.g * 255).round();
    final fB = (fillColor.b * 255).round();
    final fA = (fillColor.a * 255).round();
    final bR = (borderColor.r * 255).round();
    final bG = (borderColor.g * 255).round();
    final bB = (borderColor.b * 255).round();
    final bA = (borderColor.a * 255).round();

    for (int y = 0; y < size; y++) {
      for (int x = 0; x < size; x++) {
        final dx = x + 0.5 - center;
        final dy = y + 0.5 - center;
        final dist = math.sqrt(dx * dx + dy * dy);
        final idx = (y * size + x) * 4;

        if (dist <= innerRadius) {
          pixels[idx] = fR;
          pixels[idx + 1] = fG;
          pixels[idx + 2] = fB;
          pixels[idx + 3] = fA;
        } else if (dist <= outerRadius) {
          pixels[idx] = bR;
          pixels[idx + 1] = bG;
          pixels[idx + 2] = bB;
          pixels[idx + 3] = bA;
        }
      }
    }
    return pixels;
  }

  /// Enregistre les images nécessaires à l'indicateur de position dans le style Mapbox
  Future<void> _registerLocationImages() async {
    // Image principale : cercle bleu avec bordure blanche
    const int dotSize = 36;
    final dotPixels = _generateCirclePixels(
      dotSize,
      const material.Color.fromARGB(255, 0, 122, 255), // Bleu
      const material.Color.fromARGB(255, 255, 255, 255), // Bordure blanche
      5,
    );
    // Android attend du PNG encodé dans addStyleImage (malgré la doc MbxImage qui dit RGBA)
    final dotPng = await _rgbaToPng(dotSize, dotSize, dotPixels);
    final dotImage = MbxImage(width: dotSize, height: dotSize, data: dotPng);

    bool hasDot = await mapboxMap.style.hasStyleImage('navika-position-dot');
    if (!hasDot) {
      await mapboxMap.style.addStyleImage('navika-position-dot', 1.0, dotImage, false, [], [], null);
    }
  }

  /// Ajoute un indicateur de position à l'emplacement spécifié
  Future<void> addLocationIndicator(double latitude, double longitude, double altitude, double accuracy) async {
    // Enregistrer les images si ce n'est pas déjà fait
    await _registerLocationImages();

    if (_locationIndicatorAdded) {
      // La couche existe déjà, mettre à jour
      await updateLocationIndicator(latitude, longitude, altitude, accuracy, _lastCompass);
      return;
    }

    try {
      bool exists = await mapboxMap.style.styleLayerExists('locationIndicator');
      if (exists) {
        await updateLocationIndicator(latitude, longitude, altitude, accuracy, _lastCompass);
        _locationIndicatorAdded = true;
        return;
      }
    } catch (_) {}

    await mapboxMap.style.addLayer(LocationIndicatorLayer(
      id: 'locationIndicator',
      location: [latitude, longitude, altitude],
      accuracyRadius: accuracy.clamp(0, 10000),
      visibility: Visibility.VISIBLE,
      topImage: 'navika-position-dot',
      topImageSize: 0.45,
      accuracyRadiusColor: const Color.fromARGB(40, 0, 122, 255).toARGB32(),
      accuracyRadiusBorderColor: const Color.fromARGB(80, 0, 122, 255).toARGB32(),
    ));
    _locationIndicatorAdded = true;
  }

  Future<void> updateLocationIndicator(double latitude, double longitude, double altitude, double accuracy, double compass) async {
    _lastCompass = compass;
    if (!_locationIndicatorAdded) return;

    try {
      await mapboxMap.style.setStyleLayerProperty(
        'locationIndicator',
        'location',
        [latitude, longitude, altitude],
      );
      await mapboxMap.style.setStyleLayerProperty(
        'locationIndicator',
        'accuracy-radius',
        accuracy.clamp(0, 10000),
      );
    } catch (e) {
      debugPrint('Erreur updateLocationIndicator: $e');
    }
  }

  Future<GeoCoordinates> getCenterCoordinates() async {
    CameraState camera = await mapboxMap.getCameraState();
    return GeoCoordinates(camera.center.coordinates.lat as double, camera.center.coordinates.lng as double);
  }

  Future<double> getDistanceInMeters(material.BuildContext context, double latitude, double zoom) async {
    Projection projection = mapboxMap.projection;
    double metersPerPixel = await projection.getMetersPerPixelAtLatitude(latitude, zoom);
    double screenWidthInPixels = material.MediaQuery.of(context).size.width;
    double distanceInMeters = metersPerPixel * screenWidthInPixels;

    return distanceInMeters;
  }

  Future<double> getZoomLevel() async {
    CameraState camera = await mapboxMap.getCameraState();
    return camera.zoom;
  }

  Future<void> zoomToLocation(
    double latitude,
    double longitude,
    double? zoom, {
    bool animate = true,
    int duration = 1000,
    Map? padding,
    bool keepExistingPadding = true,
  }) async {
    CameraState cameraState = await mapboxMap.getCameraState();

    zoom ??= cameraState.zoom;

    MbxEdgeInsets? edgeInsets;
    if (padding != null) {
      edgeInsets = MbxEdgeInsets(
        top: padding['top'] ?? 0,
        bottom: padding['bottom'] ?? 0,
        left: padding['left'] ?? 0,
        right: padding['right'] ?? 0,
      );
    } else if (keepExistingPadding) {
      try {
        final existing = cameraState.padding;
        edgeInsets = MbxEdgeInsets(
          top: existing.top,
          bottom: existing.bottom,
          left: existing.left,
          right: existing.right,
        );
      } catch (_) {}
    }

    final cameraOptions = CameraOptions(
      center: Point(coordinates: Position(longitude, latitude)),
      zoom: zoom,
      padding: edgeInsets,
    );

    if (animate) {
      await mapboxMap.flyTo(cameraOptions, MapAnimationOptions(duration: duration));
    } else {
      await mapboxMap.setCamera(cameraOptions);
    }
  }

  Future<void> hideScaleBar() async {
    await mapboxMap.scaleBar.updateSettings(
      ScaleBarSettings(
        enabled: false,
      ),
    );
  }

  Future<void> hideCompass() async {
    await mapboxMap.compass.updateSettings(
      CompassSettings(
        enabled: false,
      ),
    );
  }

  // Getters pour l'état
  geolocator.Position? get position => _position;
  PositionState get positionState => _positionState;

  Future<void> checkLocationPermissionAndInitialize(material.BuildContext context, {bool zoomCamera = true}) async {
    bool askGps = await globals.hiveBox?.get('askGps') ?? false;
    bool allowGps = await globals.hiveBox?.get('allowGps') ?? false;

    if (askGps && allowGps) {
      await initializeLocationAndZoom(context, zoomCamera: zoomCamera);
    } else {
      if (!askGps) {
        RouteStateScope.of(context).go('/position');
      }
    }
  }

  /// Initialise la localisation et effectue le zoom approprié
  Future<void> initializeLocationAndZoom(material.BuildContext context, {bool zoomCamera = true}) async {
    bool serviceEnabled;
    geolocator.LocationPermission permission;

    // Vérifier si les services de localisation sont activés
    serviceEnabled = await geolocator.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _updatePositionState(PositionState.servicesDisabled);
      return;
    }

    // Vérifier les permissions
    permission = await geolocator.Geolocator.checkPermission();
    if (permission == geolocator.LocationPermission.deniedForever || permission == geolocator.LocationPermission.denied) {
      _updatePositionState(PositionState.permissionDenied);
      RouteStateScope.of(context).go('/position');
      return;
    }

    _updatePositionState(PositionState.acquiring);

    try {
      // 1. D'abord récupérer la dernière position connue et zoomer dessus
      geolocator.Position? lastKnownPosition = await geolocator.Geolocator.getLastKnownPosition();
      if (lastKnownPosition != null) {
        _position = lastKnownPosition;
        if (zoomCamera) {
          await zoomToLocation(lastKnownPosition.latitude, lastKnownPosition.longitude, 12.0, animate: !globals.hasOpenedMapOnce, duration: 1000);
        }
        await addLocationIndicator(lastKnownPosition.latitude, lastKnownPosition.longitude, lastKnownPosition.altitude, lastKnownPosition.accuracy);
      }

      // 2. Ensuite obtenir la position actuelle précise
      geolocator.LocationSettings locationSettings = const geolocator.LocationSettings(
        accuracy: geolocator.LocationAccuracy.high,
      );
      if (lastKnownPosition == null) {
        locationSettings = geolocator.AndroidSettings(accuracy: geolocator.LocationAccuracy.high);
      }

      geolocator.Position currentPosition = await geolocator.Geolocator.getCurrentPosition(locationSettings: locationSettings);
      _position = currentPosition;
      onPositionChanged?.call(currentPosition);

      // 3. Zoomer plus précisément sur la position actuelle (optionnel)
      if (zoomCamera) {
        await zoomToLocation(
          currentPosition.latitude,
          currentPosition.longitude,
          15,
          duration: 1500,
          padding: {'top': kToolbarHeight, 'bottom': MediaQuery.of(context).size.height * 0.55},
        );
      }
      await addLocationIndicator(currentPosition.latitude, currentPosition.longitude, currentPosition.altitude, currentPosition.accuracy);

      _updatePositionState(PositionState.defined);

      // 4. Démarrer le suivi de position en temps réel
      _positionStream = geolocator.Geolocator.getPositionStream(locationSettings: locationSettings).listen((geolocator.Position? newPosition) {
        if (newPosition != null) {
          _position = newPosition;
          onPositionChanged?.call(newPosition);
          updateLocationIndicator(newPosition.latitude, newPosition.longitude, newPosition.altitude, newPosition.accuracy, _lastCompass);
          globals.position = newPosition;
        }
      });

      // 5. Démarrer le suivi de la boussole
      _compassStream = FlutterCompass.events?.listen((CompassEvent compassEvent) {
        // Notifier le home via un callback
        onCompassChanged?.call(compassEvent);
      });

      // await getNearPoints(context);
    } catch (e) {
      _updatePositionState(PositionState.unknown);
    }
  }

  /// Vérifie si l'utilisateur est actuellement visible dans la vue de la caméra
  Future<bool> isUserInView() async {
    if (_position == null) return false;

    try {
      CameraState cameraState = await mapboxMap.getCameraState();
      CameraOptions cameraOptions = cameraState.toCameraOptions();
      CoordinateBounds bounds = await mapboxMap.coordinateBoundsForCamera(cameraOptions);

      bool isInBounds = _position!.latitude <= bounds.northeast.coordinates.lat &&
          _position!.latitude >= bounds.southwest.coordinates.lat &&
          _position!.longitude <= bounds.northeast.coordinates.lng &&
          _position!.longitude >= bounds.southwest.coordinates.lng;

      // Vérifier si on est suffisamment zoomé (niveau de zoom > 12) - seuil plus permissif
      double zoomLevel = await getZoomLevel();
      bool isZoomedIn = zoomLevel > 12;

      return isInBounds && isZoomedIn;
    } catch (e) {
      return false;
    }
  }

  /// Effectue un zoom sur l'indicateur de position avec orientation 3D
  Future<void> zoomOnLocationIndicator(bool is3dMap, double compass, {int duration = 1000, Map? padding}) async {
    if (_position == null) return;

    final cameraOptions = CameraOptions(
      center: Point(coordinates: Position(_position!.longitude, _position!.latitude)),
      zoom: is3dMap ? 17 : 15,
      bearing: compass,
      pitch: is3dMap ? 50 : 0,
      padding: padding != null
          ? MbxEdgeInsets(
              top: padding['top'] ?? 0,
              bottom: padding['bottom'] ?? 0,
              left: padding['left'] ?? 0,
              right: padding['right'] ?? 0,
            )
          : null,
    );

    await mapboxMap.flyTo(cameraOptions, MapAnimationOptions(duration: duration));
  }

  /// Initialise le gestionnaire de marqueurs de points
  Future<void> initializePointAnnotationManager() async {
    if (_pointAnnotationManager == null) {
      _pointAnnotationManager = await mapboxMap.annotations.createPointAnnotationManager();
      _tapEventsSubscription = _pointAnnotationManager!.tapEvents(onTap: _handleAnnotationTap);
    }
  }

  /// Charge une image depuis les assets avec cache
  Future<Uint8List?> _loadMarkerImage(String assetPath) async {
    if (_imageCache.containsKey(assetPath)) {
      return _imageCache[assetPath];
    }
    try {
      final ByteData bytes = await rootBundle.load(assetPath);
      final Uint8List imageData = bytes.buffer.asUint8List();
      _imageCache[assetPath] = imageData;
      return imageData;
    } catch (e) {
      debugPrint('Erreur chargement image $assetPath : $e');
      return null;
    }
  }

  /// Acquiert le verrou de mise à jour des marqueurs (attend si déjà occupé)
  Future<void> _acquireMarkerLock() async {
    while (_markerUpdateLock != null) {
      await _markerUpdateLock!.future;
    }
    _markerUpdateLock = Completer<void>();
  }

  /// Relâche le verrou de mise à jour des marqueurs
  void _releaseMarkerLock() {
    final lock = _markerUpdateLock;
    _markerUpdateLock = null;
    lock?.complete();
  }

  /// Résout un clic natif sur une annotation (callback du SDK, O(1)) vers son
  /// type/id métier et notifie l'UI via [onMarkerTapped].
  void _handleAnnotationTap(PointAnnotation annotation) {
    final markerId = _annotationIdToMarkerId[annotation.id];
    if (markerId == null) return;
    final metadata = _markerMetadata[markerId];
    if (metadata == null) return;

    _lastAnnotationTapAt = DateTime.now();

    final type = metadata['type'] ?? '';
    final id = metadata['id'] ?? '';
    final lat = metadata['coord']['lat'] ?? '';
    final lon = metadata['coord']['lon'] ?? '';

    onMarkerTapped?.call(type, id, lat, lon);
  }

  /// Indique si une annotation vient d'être cliquée. Utilisé par le listener général
  /// de tap de la carte pour ignorer un tap déjà traité comme clic sur un marqueur
  /// (les deux listeners peuvent être déclenchés pour le même geste natif).
  bool wasAnnotationTappedRecently({Duration within = const Duration(milliseconds: 300)}) {
    final last = _lastAnnotationTapAt;
    if (last == null) return false;
    return DateTime.now().difference(last) < within;
  }

  Future<void> addBikeMarker(String id, double latitude, double longitude, String name, context) async {
    if (_pointAnnotationManager == null) return;
    await removeMarker(id);

    MarkerMode mode = getMarkerMode(['bike']);
    double zoom = await getZoomLevel();
    MarkerSize size = getMarkerSize(mode, zoom);

    String? img = getMarkerImageByType(mode, size, context);
    if (img == null) return;

    final Uint8List? imageData = await _loadMarkerImage(img);
    if (imageData == null) return;

    final pointAnnotationOptions = PointAnnotationOptions(
      geometry: Point(coordinates: Position(longitude, latitude)),
      image: imageData,
      iconSize: getSizeForMarker(size),
      iconAnchor: IconAnchor.BOTTOM,
    );

    try {
      final annotation = await _pointAnnotationManager!.create(pointAnnotationOptions);
      _pointAnnotations[id] = annotation;
      _markerMetadata[id] = {
        'type': 'bike',
        'id': id,
        'name': name,
        'coord': {'lat': latitude, 'lon': longitude}
      };
      _annotationIdToMarkerId[annotation.id] = id;
    } catch (e) {
      debugPrint('Erreur lors de l\'ajout du marqueur bike $id : $e');
    }
  }

  Future<void> addStopMarker(String id, double latitude, double longitude, Map stop, material.BuildContext context) async {
    if (_pointAnnotationManager == null) return;
    await removeMarker(id);

    MarkerMode mode = getMarkerMode(stop['modes']);
    double zoom = await getZoomLevel();
    MarkerSize size = getMarkerSize(mode, zoom);

    String? img = getMarkerImageByType(mode, size, context);
    if (img == null) return;

    final Uint8List? imageData = await _loadMarkerImage(img);
    if (imageData == null) return;

    final pointAnnotationOptions = PointAnnotationOptions(
      geometry: Point(coordinates: Position(longitude, latitude)),
      image: imageData,
      iconSize: getSizeForMarker(size),
      iconAnchor: IconAnchor.BOTTOM,
    );

    try {
      final annotation = await _pointAnnotationManager!.create(pointAnnotationOptions);
      _pointAnnotations[id] = annotation;
      _markerMetadata[id] = {
        'type': 'stop',
        'id': id,
        'name': stop['name'] ?? '',
        'coord': {'lat': latitude, 'lon': longitude}
      };
      _annotationIdToMarkerId[annotation.id] = id;
    } catch (e) {
      debugPrint('Erreur lors de l\'ajout du marqueur stop $id : $e');
    }
  }

  /// Met à jour de façon différentielle les marqueurs Vélib
  /// Protégé contre les appels concurrents via un verrou
  Future<void> updateBikeMarkers(List bikes, material.BuildContext context) async {
    await _acquireMarkerLock();
    try {
      await _updateBikeMarkersInternal(bikes, context);
    } finally {
      _releaseMarkerLock();
    }
  }

  Future<void> _updateBikeMarkersInternal(List bikes, material.BuildContext context) async {
    if (_pointAnnotationManager == null) return;
    final Set<String> expected = bikes.map((b) => b['id'].toString()).toSet();

    // Supprimer les marqueurs 'bike' qui ne sont plus attendus (suppression groupée)
    final idsToRemove = _markerMetadata.entries
        .where((e) => e.value['type'] == 'bike' && !expected.contains(e.key))
        .map((e) => e.key)
        .toList();
    await _removeMarkers(idsToRemove);

    // Pré-charger l'image une seule fois pour le zoom actuel
    MarkerMode mode = getMarkerMode(['bike']);
    double zoom = await getZoomLevel();
    MarkerSize size = getMarkerSize(mode, zoom);
    String? img = getMarkerImageByType(mode, size, context);
    Uint8List? imageData;
    if (img != null) {
      imageData = await _loadMarkerImage(img);
    }

    if (imageData == null) return;

    final double iconSize = getSizeForMarker(size);

    final List<String> newIds = [];
    final List<PointAnnotationOptions> newOptions = [];
    final List<Map> newMeta = [];

    for (final bike in bikes) {
      final String id = bike['id'].toString();
      final double lat = (bike['coord']['lat'] as num).toDouble();
      final double lon = (bike['coord']['lon'] as num).toDouble();
      final String name = (bike['name'] ?? '').toString();

      // Si déjà présent avec mêmes coordonnées, ne rien faire
      final meta = _markerMetadata[id];
      if (meta != null && meta['type'] == 'bike') {
        final ml = (meta['coord']['lat'] as num).toDouble();
        final mg = (meta['coord']['lon'] as num).toDouble();
        if ((ml - lat).abs() < 1e-6 && (mg - lon).abs() < 1e-6) {
          continue;
        }
        // Coordonnées changées : supprimer l'ancien
        await removeMarker(id);
      }

      newIds.add(id);
      newOptions.add(PointAnnotationOptions(
        geometry: Point(coordinates: Position(lon, lat)),
        image: imageData,
        iconSize: iconSize,
        iconAnchor: IconAnchor.BOTTOM,
      ));
      newMeta.add({
        'type': 'bike',
        'id': id,
        'name': name,
        'coord': {'lat': lat, 'lon': lon}
      });
    }

    await _createMarkers(newIds, newOptions, newMeta);
  }

  /// Met à jour de façon différentielle les marqueurs d'arrêts
  /// Protégé contre les appels concurrents via un verrou
  Future<void> updateStopMarkers(List stops, material.BuildContext context) async {
    await _acquireMarkerLock();
    try {
      await _updateStopMarkersInternal(stops, context);
    } finally {
      _releaseMarkerLock();
    }
  }

  Future<void> _updateStopMarkersInternal(List stops, material.BuildContext context) async {
    if (_pointAnnotationManager == null) return;
    final Set<String> expected = stops.map((s) => s['id'].toString()).toSet();

    // Supprimer les marqueurs 'stop' qui ne sont plus attendus (suppression groupée)
    final idsToRemove = _markerMetadata.entries
        .where((e) => e.value['type'] == 'stop' && !expected.contains(e.key))
        .map((e) => e.key)
        .toList();
    await _removeMarkers(idsToRemove);

    // Pré-calculer le zoom une seule fois
    double zoom = await getZoomLevel();

    final List<String> newIds = [];
    final List<PointAnnotationOptions> newOptions = [];
    final List<Map> newMeta = [];

    for (final stop in stops) {
      final String id = stop['id'].toString();
      final double lat = (stop['coord']['lat'] as num).toDouble();
      final double lon = (stop['coord']['lon'] as num).toDouble();

      final meta = _markerMetadata[id];
      if (meta != null && meta['type'] == 'stop') {
        final ml = (meta['coord']['lat'] as num).toDouble();
        final mg = (meta['coord']['lon'] as num).toDouble();
        if ((ml - lat).abs() < 1e-6 && (mg - lon).abs() < 1e-6) {
          continue;
        }
        await removeMarker(id);
      }

      MarkerMode mode = getMarkerMode(stop['modes']);
      MarkerSize size = getMarkerSize(mode, zoom);
      String? img = getMarkerImageByType(mode, size, context);
      if (img == null) continue;

      final Uint8List? imageData = await _loadMarkerImage(img);
      if (imageData == null) continue;

      newIds.add(id);
      newOptions.add(PointAnnotationOptions(
        geometry: Point(coordinates: Position(lon, lat)),
        image: imageData,
        iconSize: getSizeForMarker(size),
        iconAnchor: IconAnchor.BOTTOM,
      ));
      newMeta.add({
        'type': 'stop',
        'id': id,
        'name': stop['name'] ?? '',
        'coord': {'lat': lat, 'lon': lon}
      });
    }

    await _createMarkers(newIds, newOptions, newMeta);
  }

  // (Ancienne fonction _filterLinesByZoom supprimée car non utilisée)

  /// Crée en une seule fois (batch) les annotations dont les options sont fournies,
  /// et peuple les maps de suivi (id métier <-> annotation) à partir du résultat.
  /// [ids] et [meta] doivent être dans le même ordre que [options].
  Future<void> _createMarkers(List<String> ids, List<PointAnnotationOptions> options, List<Map> meta) async {
    if (options.isEmpty || _pointAnnotationManager == null) return;
    try {
      final created = await _pointAnnotationManager!.createMulti(options);
      for (var i = 0; i < created.length; i++) {
        final annotation = created[i];
        if (annotation == null) continue;
        final id = ids[i];
        _pointAnnotations[id] = annotation;
        _markerMetadata[id] = meta[i];
        _annotationIdToMarkerId[annotation.id] = id;
      }
    } catch (e) {
      debugPrint('Erreur lors de la création groupée de marqueurs : $e');
    }
  }

  /// Supprime en une seule fois (batch) les marqueurs correspondant aux [ids] donnés.
  Future<void> _removeMarkers(List<String> ids) async {
    if (ids.isEmpty) return;
    final annotations = [for (final id in ids) _pointAnnotations[id]].whereType<PointAnnotation>().toList();

    if (annotations.isNotEmpty) {
      try {
        await _pointAnnotationManager?.deleteMulti(annotations);
      } catch (e) {
        debugPrint('Erreur lors de la suppression groupée de marqueurs : $e');
      }
    }

    for (final id in ids) {
      final annotation = _pointAnnotations[id];
      if (annotation != null) {
        _annotationIdToMarkerId.remove(annotation.id);
      }
      _pointAnnotations.remove(id);
      _markerMetadata.remove(id);
    }
  }

  Future<void> removeMarker(String id) async {
    if (_pointAnnotations.containsKey(id)) {
      try {
        await _pointAnnotationManager?.delete(_pointAnnotations[id]!);
      } catch (e) {
        debugPrint('Erreur lors de la suppression du marqueur $id : $e');
      } finally {
        // Toujours nettoyer les références locales, même si le delete Mapbox échoue
        final annotation = _pointAnnotations[id];
        if (annotation != null) {
          _annotationIdToMarkerId.remove(annotation.id);
        }
        _pointAnnotations.remove(id);
        _markerMetadata.remove(id);
      }
    }
  }

  /// Supprime tous les marqueurs
  Future<void> clearAllMarkers() async {
    if (_pointAnnotations.isEmpty) return;
    // Tenter un deleteAll via le manager (plus fiable et rapide)
    try {
      await _pointAnnotationManager?.deleteAll();
    } catch (e) {
      debugPrint('Erreur deleteAll: $e');
    }
    _pointAnnotations.clear();
    _markerMetadata.clear();
    _annotationIdToMarkerId.clear();
  }

  /// Supprime tous les marqueurs de vélos
  Future<void> clearBikeMarkers() async {
    if (_markerMetadata.isEmpty) return;
    await _acquireMarkerLock();
    try {
      final ids = _markerMetadata.entries
          .where((e) => e.value['type'] == 'bike')
          .map((e) => e.key)
          .toList();
      await _removeMarkers(ids);
    } finally {
      _releaseMarkerLock();
    }
  }

  /// Supprime tous les marqueurs d'arrêts
  Future<void> clearStopMarkers() async {
    if (_markerMetadata.isEmpty) return;
    await _acquireMarkerLock();
    try {
      final ids = _markerMetadata.entries
          .where((e) => e.value['type'] == 'stop')
          .map((e) => e.key)
          .toList();
      await _removeMarkers(ids);
    } finally {
      _releaseMarkerLock();
    }
  }

  /// Ajuste le padding de la caméra pour éviter que le contenu soit masqué
  Future<void> adjustCameraPadding({required double top, required double bottom, int duration = 700}) async {
    CameraState camera = await mapboxMap.getCameraState();
    CameraOptions cameraOptions = camera.toCameraOptions();

    cameraOptions.padding = MbxEdgeInsets(
      top: top,
      bottom: bottom,
      left: 0,
      right: 0,
    );

    // Utilise flyTo pour animer le changement de padding
    await mapboxMap.flyTo(cameraOptions, MapAnimationOptions(duration: duration));
  }

  /// Ajoute un marqueur de point personnalisé sur la carte
  Future<void> addPointMarker(double latitude, double longitude, {String? markerId}) async {
    if (_pointAnnotationManager == null) return;
    final id = markerId ?? 'point_marker';
    
    // Supprimer le marqueur existant s'il y en a un
    await removePointMarker(id);

    // Charger l'image du marqueur (avec cache)
    final Uint8List? imageData = await _loadMarkerImage('assets/img/marker/marker.png');
    if (imageData == null) return;

    final pointAnnotationOptions = PointAnnotationOptions(
      geometry: Point(coordinates: Position(longitude, latitude)),
      image: imageData,
      iconSize: 1.7,
      iconAnchor: IconAnchor.BOTTOM,
    );

    try {
      final annotation = await _pointAnnotationManager!.create(pointAnnotationOptions);
      _pointAnnotations[id] = annotation;

      _markerMetadata[id] = {
        'type': 'point',
        'id': id,
        'name': 'Point marker',
        'coord': {'lat': latitude, 'lon': longitude}
      };
      _annotationIdToMarkerId[annotation.id] = id;

      // Sauvegarder la référence dans globals pour compatibilité
      globals.pointMarker = annotation;
    } catch (e) {
      debugPrint('Erreur lors de l\'ajout du marqueur de point : $e');
    }
  }

  /// Ajoute un marqueur d'arrêt de trajet (petit rond couleur ligne + nom)
  Future<void> addTripStopMarker(String id, double latitude, double longitude, String name, String lineColor) async {
    // Supprimer si déjà présent (type trip_stop avec même id)
    await removeMarker('trip_stop_$id');

    try {
      final imageData = await _screenshotController.captureFromWidget(
        material.Container(
          padding: const material.EdgeInsets.only(right: 2, top: 2, bottom: 2),
          decoration: const material.BoxDecoration(color: material.Colors.transparent),
          child: material.Row(
            mainAxisSize: material.MainAxisSize.min,
            crossAxisAlignment: material.CrossAxisAlignment.center,
            children: [
              material.Container(
                width: 10,
                height: 10,
                decoration: material.BoxDecoration(
                  color: HexColor.fromHex(lineColor),
                  shape: material.BoxShape.circle,
                  border: material.Border.all(color: material.Colors.white, width: 2),
                ),
              ),
              const material.SizedBox(width: 4),
              material.ConstrainedBox(
                constraints: const material.BoxConstraints(maxWidth: 120),
                child: material.Container(
                  padding: const material.EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: material.BoxDecoration(
                    color: material.Colors.white,
                    borderRadius: material.BorderRadius.circular(3),
                    boxShadow: const [
                      material.BoxShadow(
                        color: material.Color(0x33000000),
                        blurRadius: 2,
                        offset: material.Offset(1, 1),
                      ),
                    ],
                  ),
                  child: material.Text(
                    name,
                    maxLines: 1,
                    overflow: material.TextOverflow.ellipsis,
                    style: const material.TextStyle(
                      fontSize: 10,
                      color: material.Colors.black,
                      fontWeight: material.FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        delay: const Duration(milliseconds: 60),
      );

      final pointAnnotationOptions = PointAnnotationOptions(
        geometry: Point(coordinates: Position(longitude, latitude)),
        image: imageData,
        iconSize: 1.0,
        // Ancre au centre-gauche: aligner le marqueur sur le point coloré
        iconAnchor: IconAnchor.LEFT,
      );

      final annotation = await _pointAnnotationManager!.create(pointAnnotationOptions);
      _pointAnnotations['trip_stop_$id'] = annotation;
      _markerMetadata['trip_stop_$id'] = {
        'type': 'trip_stop',
        'id': id,
        'name': name,
        'coord': {'lat': latitude, 'lon': longitude}
      };
      _annotationIdToMarkerId[annotation.id] = 'trip_stop_$id';
    } catch (e) {
      debugPrint('Erreur lors de l\'ajout du marqueur d\'arrêt $id : $e');
    }
  }

  /// Ajoute un marqueur affichant un widget personnalisé (ex: badge de ligne) capturé en image.
  /// [id] doit identifier de façon unique le marqueur (ex: index de la section dans le trajet).
  Future<void> addLineMarker(String id, double latitude, double longitude, material.Widget icon) async {
    if (_pointAnnotationManager == null) return;
    await removeMarker('line_marker_$id');

    try {
      final imageData = await _screenshotController.captureFromWidget(
        icon,
        delay: const Duration(milliseconds: 60),
      );

      final pointAnnotationOptions = PointAnnotationOptions(
        geometry: Point(coordinates: Position(longitude, latitude)),
        image: imageData,
        iconSize: 1.0,
        iconAnchor: IconAnchor.CENTER,
      );

      final annotation = await _pointAnnotationManager!.create(pointAnnotationOptions);
      _pointAnnotations['line_marker_$id'] = annotation;
      _markerMetadata['line_marker_$id'] = {
        'type': 'line_marker',
        'id': id,
        'coord': {'lat': latitude, 'lon': longitude},
      };
      _annotationIdToMarkerId[annotation.id] = 'line_marker_$id';
    } catch (e) {
      debugPrint('Erreur lors de l\'ajout du marqueur de ligne $id : $e');
    }
  }

  /// Supprime tous les marqueurs de ligne ajoutés via [addLineMarker]
  Future<void> clearLineMarkers() async {
    if (_markerMetadata.isEmpty) return;
    final ids = _markerMetadata.entries
        .where((e) => e.value['type'] == 'line_marker')
        .map((e) => e.key)
        .toList();
    for (final id in ids) {
      await removeMarker(id);
    }
  }

  /// Supprime tous les marqueurs d'arrêts de trajet
  Future<void> clearTripStopMarkers() async {
    if (_markerMetadata.isEmpty) return;
    final ids = _markerMetadata.entries
        .where((e) => e.value['type'] == 'trip_stop')
        .map((e) => e.key)
        .toList();
    for (final id in ids) {
      await removeMarker(id);
    }
  }

  /// Ajuste la caméra pour englober la liste de coordonnées fournie.
  /// Conserve par défaut le padding existant (panel bas) afin que l'ensemble reste visible au-dessus du panneau.
  /// [padding] contrôle le padding appliqué de chaque côté si fourni via Map {'top':..,'bottom':..,'left':..,'right':..}.
  /// Si seul un double [padding] est donné (ancienne signature), on applique ce même padding sur tous les côtés
  /// tout en empilant avec le padding bas existant si celui-ci est supérieur (pour ne pas perdre l'espace du panel).
  Future<void> fitCameraToCoordinates(
    List coords, {
    double padding = 60,
    int duration = 1000,
    Map<String, double>? edgePadding,
    bool keepExistingPadding = true,
    material.BuildContext? context, // Optionnel : permet un calcul de zoom plus précis
  }) async {
    if (coords.isEmpty) return;
    if (coords.length == 1) {
      await zoomToLocation(coords.first.dy, coords.first.dx, 15, animate: true, duration: duration);
      return;
    }

    double minLat = coords.first.dy;
    double maxLat = coords.first.dy;
    double minLon = coords.first.dx;
    double maxLon = coords.first.dx;
    for (final c in coords) {
      if (c.dy < minLat) minLat = c.dy;
      if (c.dy > maxLat) maxLat = c.dy;
      if (c.dx < minLon) minLon = c.dx;
      if (c.dx > maxLon) maxLon = c.dx;
    }

    final centerLat = (minLat + maxLat) / 2.0;
    final centerLon = (minLon + maxLon) / 2.0;

    double diagonalMeters = calculateDistance(minLat, minLon, maxLat, maxLon);

    CameraState current = await mapboxMap.getCameraState();
    MbxEdgeInsets? existing = current.padding;

    double topP;
    double bottomP;
    double leftP;
    double rightP;

    if (edgePadding != null) {
      topP = edgePadding['top'] ?? 0;
      bottomP = edgePadding['bottom'] ?? 0;
      leftP = edgePadding['left'] ?? 0;
      rightP = edgePadding['right'] ?? 0;
    } else {
      // Ancien comportement: même padding sur tous les côtés
      topP = padding;
      bottomP = padding;
      leftP = padding;
      rightP = padding;

      // Si on conserve le padding existant: on prend le max pour bottom (panel) et top
      if (keepExistingPadding && existing != null) {
        bottomP = math.max(bottomP, existing.bottom);
        topP = math.max(topP, existing.top);
      }
    }

    double zoom = _computePreciseZoom(
      minLat,
      minLon,
      maxLat,
      maxLon,
      context: context,
      padding: 0,
      edgePadding: {'top': topP, 'bottom': bottomP, 'left': leftP, 'right': rightP},
      diagonalMetersFallback: diagonalMeters,
    );

    final MbxEdgeInsets finalPadding = MbxEdgeInsets(
      top: topP,
      bottom: bottomP,
      left: leftP,
      right: rightP,
    );

    final cameraOptions = CameraOptions(
      center: Point(coordinates: Position(centerLon, centerLat)),
      zoom: zoom,
      padding: finalPadding,
    );

    await mapboxMap.flyTo(cameraOptions, MapAnimationOptions(duration: duration));
  }

  /// Calcule un zoom "fit bounds" précis pour englober le rectangle [minLat,minLon] - [maxLat,maxLon]
  /// en respectant le padding. Utilise WebMercator (même logique que Mapbox GL) :
  /// - Pour la largeur: lonSpan -> nombre de pixels requis
  /// - Pour la hauteur: projection mercator des latitudes -> span Y
  /// On prend le zoom minimal qui fait tenir le bbox dans le viewport.
  /// Fallback: si aucun contexte n'est donné, on revient à un mapping heuristique sur la diagonale.
  double _computePreciseZoom(
    double minLat,
    double minLon,
    double maxLat,
    double maxLon, {
    material.BuildContext? context,
    double padding = 0,
    Map<String, double>? edgePadding,
    double? diagonalMetersFallback,
  }) {
    final size = material.MediaQuery.of(context!).size;
    double viewportWidth = size.width;
    double viewportHeight = size.height;

    // Déterminer padding final (même logique que plus bas mais simplifiée pour calcul zoom)
    double padTop = edgePadding?['top'] ?? padding;
    double padBottom = edgePadding?['bottom'] ?? padding;
    double padLeft = edgePadding?['left'] ?? padding;
    double padRight = edgePadding?['right'] ?? padding;

    // Zone utilisable réelle
    double usableWidth = (viewportWidth - padLeft - padRight).clamp(50, viewportWidth);
    double usableHeight = (viewportHeight - padTop - padBottom).clamp(50, viewportHeight);

    // Spans géographiques
    double lonSpan = (maxLon - minLon).abs().clamp(1e-9, 360.0);
    double latSpan = (maxLat - minLat).abs().clamp(1e-9, 170.0);

    // Conversion latitudes -> Mercator Y
    double _latToMercatorY(double lat) {
      final rad = lat * math.pi / 180.0;
      return math.log(math.tan(rad / 2.0 + math.pi / 4.0));
    }

    final mercatorMinY = _latToMercatorY(minLat);
    final mercatorMaxY = _latToMercatorY(maxLat);
    double mercatorSpan = (mercatorMaxY - mercatorMinY).abs().clamp(1e-12, 10.0);

    // Paramètres WebMercator
    const double tileSize = 512.0; // Mapbox GL par défaut (HiDPI)
    // Largeur: tileSize * 2^zoom * (lonSpan / 360) >= usableWidth
    // => 2^zoom >= usableWidth * 360 / (tileSize * lonSpan)
    double zoomLon = math.log(usableWidth * 360.0 / (tileSize * lonSpan)) / math.log(2);

    // Hauteur: tileSize * 2^zoom * (mercatorSpan / (2π)) >= usableHeight
    // => 2^zoom >= usableHeight * 2π / (tileSize * mercatorSpan)
    double zoomLat = math.log(usableHeight * (2 * math.pi) / (tileSize * mercatorSpan)) / math.log(2);

    // Prendre le plus petit pour que tout tienne
    double zoom = math.min(zoomLon, zoomLat);

    // Clamp aux limites raisonnables Mapbox (0..22)
    if (zoom.isNaN || !zoom.isFinite) {
      zoom = 12; // fallback
    } else {
      zoom = zoom.clamp(0.0, 22.0);
    }

    // Ajustement empirique: léger retrait pour respirer (5%)
    zoom -= 0.05;

    // Sur des très petites spans, on veut quand même un zoom élevé mais pas >17 pour performance
    if (lonSpan < 0.0008 && latSpan < 0.0008) {
      zoom = zoom.clamp(0.0, 19.0);
    }

    return zoom;
  }

  /// Calcule la diagonale visible (en mètres) pour un niveau de zoom donné,
  /// en tenant compte du viewport et du padding (inverse pratique de _computePreciseZoom).
  ///
  /// Contrat:
  /// - Entrées: zoom (si null, récupéré depuis la caméra), centerLat (si null, récupéré),
  ///   context OU (viewportWidth/viewportHeight), padding ou edgePadding.
  /// - Sortie: longueur de la diagonale visible (en mètres) dans la zone utilisable (viewport - padding).
  /// - Erreurs: si aucune info de taille n'est disponible (ni context, ni width/height), renvoie 0.
  Future<double> computePreciseDiagonal({
    double? zoom,
    double? centerLat,
    double? centerLon, // non requis pour le calcul; gardé pour symétrie/évolutions
    material.BuildContext? context,
    double padding = 0,
    Map<String, double>? edgePadding,
    double? viewportWidth,
    double? viewportHeight,
  }) async {
    // Récupérer état caméra si besoin
    try {
      if (zoom == null || centerLat == null || centerLon == null) {
        final camera = await mapboxMap.getCameraState();
        zoom ??= camera.zoom;
        centerLat ??= (camera.center.coordinates.lat as double);
        centerLon ??= (camera.center.coordinates.lng as double);
      }
    } catch (_) {
      // Si on ne peut pas récupérer la caméra, fallback safe
      zoom ??= 12.0;
      centerLat ??= 0.0;
      centerLon ??= 0.0;
    }

    // Déterminer la taille du viewport
    double vw;
    double vh;
    if (context != null) {
      final size = material.MediaQuery.of(context).size;
      vw = size.width;
      vh = size.height;
    } else if (viewportWidth != null && viewportHeight != null) {
      vw = viewportWidth;
      vh = viewportHeight;
    } else {
      // Impossible de calculer précisément sans dimensions
      return 0;
    }

    // Résoudre le padding effectif
    final double padTop = edgePadding?['top'] ?? padding;
    final double padBottom = edgePadding?['bottom'] ?? padding;
    final double padLeft = edgePadding?['left'] ?? padding;
    final double padRight = edgePadding?['right'] ?? padding;

    // Zone utilisable
    final double usableWidth = (vw - padLeft - padRight).clamp(0, vw);
    final double usableHeight = (vh - padTop - padBottom).clamp(0, vh);
    if (usableWidth <= 0 || usableHeight <= 0) {
      return 0;
    }

    // Utiliser la projection Mapbox pour obtenir mètres/pixel à une latitude donnée
    try {
  // centerLat et zoom ont été renseignés plus haut (fallback si nécessaire)
  final mpp = await mapboxMap.projection.getMetersPerPixelAtLatitude(centerLat, zoom);
      final diagPx = math.sqrt(usableWidth * usableWidth + usableHeight * usableHeight);
      final diagMeters = mpp * diagPx;
      return diagMeters.isFinite ? diagMeters : 0;
    } catch (_) {
      // Fallback si la projection échoue
      return 0;
    }
  }

  /// Supprime le marqueur de point personnalisé
  Future<void> removePointMarker([String? markerId]) async {
    final id = markerId ?? 'point_marker';
    await removeMarker(id);
    
    // Nettoyer la référence dans globals
    if (globals.pointMarker != null) {
      globals.pointMarker = null;
    }
  }

  /// Ajoute des shapes GeoJSON sur la carte
  Future<void> addShapes(Map shapesData) async {
    print(['INFO_addShapes', shapesData]);
    for (var feature in shapesData['features']) {
      await _addSingleShape(feature);
    }

    try {
      final z = await getZoomLevel();
      await updateShapesForZoom(z);
    } catch (_) {}
  }

  /// Ajoute un shape GeoJSON individuel sur la carte
  Future<void> _addSingleShape(Map shape) async {
    final String shapeId = shape['properties']['shape_id'];
    final String color = shape['properties']['route']['color'];

    // Supprimer le shape s'il existe déjà
    await removeShape(shapeId);

    // Conserver la feature originale pour une simplification dynamique
    _shapeOriginal[shapeId] = shape;

    // Calculer le bucket de simplification depuis le zoom courant
    double zoom;
    try {
      zoom = await getZoomLevel();
    } catch (_) {
      zoom = 12.0;
    }
    final int bucket = _computeSimplifyBucket(zoom);
    final Map simplified = _simplifyFeature(shape, bucket);

    await mapboxMap.style.addSource(GeoJsonSource(id: shapeId, data: jsonEncode(simplified)));
    // Set initial visibility according to mode and current zoom
    Visibility initialVisibility = Visibility.VISIBLE;
    try {
      final mode = _getModeFromFeature(shape);
      if (_isMetro(mode) && zoom > 11) {
        initialVisibility = Visibility.NONE;
      }
      if (_isTram(mode) && zoom > 10) {
        initialVisibility = Visibility.NONE;
      }
    } catch (_) {}

    await mapboxMap.style.addLayer(LineLayer(
      id: shapeId,
      sourceId: shapeId,
      lineJoin: LineJoin.ROUND,
      lineCap: LineCap.ROUND,
      lineColor: HexColor.fromHex(color).toARGB32(),
      lineWidth: 5.0,
      visibility: initialVisibility,
    ));

    _shapeLayers.add(shapeId);
    _shapeAppliedBucket[shapeId] = bucket;
  }

  /// Supprime un shape spécifique de la carte
  Future<void> removeShape(String shapeId) async {
    try {
      // Ici, les IDs de layer et de source == shapeId
      try {
        await mapboxMap.style.removeStyleLayer(shapeId);
      } catch (_) {}
      try {
        await mapboxMap.style.removeStyleSource(shapeId);
      } catch (_) {}

      _shapeLayers.remove(shapeId);
      _shapeAppliedBucket.remove(shapeId);
      _shapeOriginal.remove(shapeId);
    } catch (e) {
      debugPrint('Erreur lors de la suppression du shape $shapeId : $e');
    }
  }

  /// Supprime tous les shapes de la carte
  Future<void> clearAllShapes() async {
    final shapesToRemove = List<String>.from(_shapeLayers);
    for (final id in shapesToRemove) {
      try {
        await mapboxMap.style.removeStyleLayer(id);
      } catch (_) {}
      try {
        await mapboxMap.style.removeStyleSource(id);
      } catch (_) {}
    }

    _shapeLayers.clear();
    _shapeAppliedBucket.clear();
    _shapeOriginal.clear();
  }

  /// Met à jour la visibilité et la simplification selon le niveau de zoom
  Future<void> updateShapesForZoom(double zoom) async {
    final int bucket = _computeSimplifyBucket(zoom);

    for (final shapeId in List<String>.from(_shapeLayers)) {
      // 1) Visibilité par mode
      try {
        final layer = await mapboxMap.style.getLayer(shapeId) as LineLayer;
        final feature = _shapeOriginal[shapeId];
        if (feature != null) {
          final mode = _getModeFromFeature(feature);
          bool visible = true;
          // Inverted logic requested: hide metro when zoom < 11; hide tram when zoom < 10
          if (_isMetro(mode) && zoom < 11) {
            visible = false;
          }
          if (_isTram(mode) && zoom < 10) {
            visible = false;
          }
          layer.visibility = visible ? Visibility.VISIBLE : Visibility.NONE;
          await mapboxMap.style.updateLayer(layer);
        }
      } catch (_) {}

      // 2) Simplification: seulement si bucket change
      final last = _shapeAppliedBucket[shapeId];
      if (last != bucket) {
        final orig = _shapeOriginal[shapeId];
        if (orig != null) {
          final simplified = _simplifyFeature(orig, bucket);
          try {
            await mapboxMap.style.setStyleSourceProperty(shapeId, 'data', jsonEncode(simplified));
            _shapeAppliedBucket[shapeId] = bucket;
          } catch (e) {
            // Fallback: si setStyleSourceProperty échoue, recréer la source
            try {
              await mapboxMap.style.removeStyleSource(shapeId);
              await mapboxMap.style.addSource(GeoJsonSource(id: shapeId, data: jsonEncode(simplified)));
              _shapeAppliedBucket[shapeId] = bucket;
            } catch (_) {}
          }
        }
      }
    }
  }

  // --- Utils de simplification et détection ---
  int _computeSimplifyBucket(double zoom) {
    if (zoom > 15) return 5; // détail max
    if (zoom > 13) return 4;
    if (zoom > 11) return 3;
    if (zoom > 9) return 2;
    return 1; // très simplifié
  }

  Map _simplifyFeature(Map feature, int bucket) {
    final Map out = Map.from(feature);
    final geom = feature['geometry'] ?? feature['geojson'] ?? feature['geometry'];
    if (geom == null) return out;

    final type = geom['type'];
    final int decimals = switch (bucket) { 1 => 4, 2 => 5, 3 => 6, 4 => 7, _ => 7 };
    final int everyN = switch (bucket) { 1 => 5, 2 => 3, 3 => 2, _ => 1 };

    Map newGeom = Map.from(geom);
    if (type == 'LineString') {
      newGeom['coordinates'] = _simplifyLineCoords(List.from(geom['coordinates']), decimals, everyN);
    } else if (type == 'MultiLineString') {
      newGeom['coordinates'] = (geom['coordinates'] as List)
          .map((line) => _simplifyLineCoords(List.from(line), decimals, everyN))
          .toList();
    } else if (type == 'Polygon') {
      newGeom['coordinates'] = (geom['coordinates'] as List)
          .map((ring) => _simplifyLineCoords(List.from(ring), decimals, everyN, isClosed: true))
          .toList();
    } else if (type == 'MultiPolygon') {
      newGeom['coordinates'] = (geom['coordinates'] as List)
          .map((poly) => (poly as List)
              .map((ring) => _simplifyLineCoords(List.from(ring), decimals, everyN, isClosed: true))
              .toList())
          .toList();
    }

    out['geometry'] = newGeom;
    return out;
  }

  List _simplifyLineCoords(List coords, int decimals, int everyN, {bool isClosed = false}) {
    if (coords.length <= 2) return coords;

    List out = [];
    for (int i = 0; i < coords.length; i++) {
      if (everyN > 1 && i % everyN != 0 && i != coords.length - 1) continue;
      final c = coords[i];
      if (c is List && c.length >= 2) {
        final lon = _roundDouble((c[0] as num).toDouble(), decimals);
        final lat = _roundDouble((c[1] as num).toDouble(), decimals);
        out.add([lon, lat]);
      } else {
        out.add(c);
      }
    }

    // S'assurer de conserver début/fin
    if (out.isEmpty || (out.first[0] != coords.first[0] || out.first[1] != coords.first[1])) {
      out.insert(0, coords.first);
    }
    if (out.last[0] != coords.last[0] || out.last[1] != coords.last[1]) {
      out.add(coords.last);
    }

    // Fermer l'anneau pour les polygones
    if (isClosed) {
      if (out.first[0] != out.last[0] || out.first[1] != out.last[1]) {
        out.add(out.first);
      }
    }

    return out;
  }

  double _roundDouble(double v, int decimals) {
    final p = math.pow(10, decimals).toDouble();
    return (v * p).roundToDouble() / p;
  }

  String _getModeFromFeature(Map feature) {
    final props = feature['properties'] ?? {};
    final route = props['route'] ?? {};
    return (route['mode'] ?? route['physical_mode'] ?? props['mode'] ?? props['physical_mode'] ?? '').toString();
  }

  bool _isMetro(String mode) => mode.toLowerCase().contains('metro');
  bool _isTram(String mode) => mode.toLowerCase().contains('tram');

  /// Dispose les ressources
  void dispose() {
    // Fermer le listener de position
    _positionStream?.cancel();
    _positionStream = null;

    // Fermer le listener de boussole
    _compassStream?.cancel();
    _compassStream = null;

    // Fermer l'abonnement aux clics sur les annotations
    _tapEventsSubscription?.cancel();
    _tapEventsSubscription = null;

    // Nettoyer les shapes (de manière synchrone pour dispose)
    _shapeLayers.clear();

    // Nettoyer le cache et les marqueurs
    _imageCache.clear();
    _pointAnnotations.clear();
    _markerMetadata.clear();
    _annotationIdToMarkerId.clear();

    // Relâcher un éventuel verrou en cours
    if (_markerUpdateLock != null && !_markerUpdateLock!.isCompleted) {
      _markerUpdateLock!.complete();
    }
    _markerUpdateLock = null;
  }

  // Méthodes privées
  void _updatePositionState(PositionState newState) {
    _positionState = newState;
    onPositionStateChanged?.call(newState);
  }
}
