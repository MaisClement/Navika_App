// 🎯 Dart imports:
import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:flutter_compass/flutter_compass.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:navika/l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:navika/src/class/geocoords.dart';
import 'package:navika/src/controller/mapbox_controller.dart';
import 'package:screenshot/screenshot.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// 🌎 Project imports:
import 'package:navika/src/api.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/home/head.dart';
import 'package:navika/src/widgets/home/panel.dart';

class Home extends StatefulWidget {
  final String? displayType;
  final String? id;
  final String? routeId;
  final String? fromId;
  final String? toId;

  const Home({
    this.displayType,
    this.id,
    this.routeId,
    this.fromId,
    this.toId,
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MapboxController? _controller;
  DraggableScrollableController panelController = DraggableScrollableController();

  CameraOptions camera = CameraOptions(center: Point(coordinates: Position(2.346711, 48.859481)), zoom: 2, bearing: 0, pitch: 0);
  geolocator.Position? position;

  CompassEvent? compassEvent;
  double compass = 0;
  double bearing = 0;

  late StreamSubscription connection;

  bool isPanned = false;
  bool is3dMap = false;
  bool isInBounds = false;
  bool isConnected = true;

  double panelButtonBottomOffsetClosed = 110;
  double panelButtonBottomOffset = 10;
  double _position = 0;

  ScreenshotController screenshotController = ScreenshotController();

  Map markersList = {};
  Map index = {};

  dynamic _data;
  dynamic _color;

  ui.Size? _scaffoldSize;
  double _minChildSize = 0;
  double _maxChildSize = 1;
  double minChildSize = 0;
  double minExtendedChildSize = 0;
  double _lastDragExtent = 0;

  Timer? _getNearPointsTimer;
  bool _isGettingNearPoints = false;
  GeoCoordinates? _lastNearCoords;
  double? _lastNearDistance;

  Timer? _panelSnapTimer;
  Timer? _panelAnimationSafetyTimer;
  bool _isPanelAnimating = false;
  bool _draggingPanel = false;

  int minSize = 82;
  int extendedMinSize = 97;

  Brightness? _lastBrightness;

  void removePointMarker() {
    if (_controller != null) {
      _controller!.removePointMarker();
    }
  }

  Future<void> openMapPoint(double lat, double lon, [bool setMarker = false, Map? padding]) async {
    if (_controller != null) {
      await _controller!.zoomToLocation(lat, lon, 15, padding: padding);

      if (setMarker) {
        removePointMarker();
        await _controller!.addPointMarker(lat, lon);
      }
    }
  }

  Future<void> moveMap(double lat, double lon, {double zoom = 12}) async {
    if (_controller != null) {
      await _controller!.zoomToLocation(lat, lon, zoom, keepExistingPadding: true);
    }
  }

  void setData(data) {
    setState(() {
      _data = data;
      if (data == null) {
        _color = null;
      }
    });
  }

  void setColor(color) {
    setState(() {
      _color = color;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getIndex();
      _initializeConnectivity();
      connection = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
        for (var result in results) {
          _setConnectivity(result);
        }
      });
      _registerMarkerCallbacks();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final brightness = Theme.of(context).colorScheme.brightness;
    // Le style de la carte natif n'est pas reconstruit par setState : si le thème de
    // l'app change pendant que la carte est déjà affichée (bascule manuelle ou suivi
    // du thème système), il faut réappliquer le lightPreset explicitement.
    if (_lastBrightness != null && _lastBrightness != brightness) {
      _applyMapBrightness(brightness);
    }
    _lastBrightness = brightness;
  }

  @override
  void didUpdateWidget(Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.id != oldWidget.id || widget.displayType != oldWidget.displayType) {
      setData(null);
    }

    if (widget.displayType != oldWidget.displayType) {
      double current = panelController.size;

      if (widget.displayType != null) {
        if (current == minChildSize) {
          int _attempts = 0;
          const int _maxAttempts = 20;
          const Duration _interval = Duration(milliseconds: 200);
          final double _targetSize = _computeSnapPoints()[1];
          Timer.periodic(_interval, (timer) async {
            if (!mounted) {
              timer.cancel();
              return;
            }

            double current = minChildSize;
            try {
              current = panelController.size;
            } catch (_) {}

            if ((current - _targetSize).abs() < 0.001) {
              timer.cancel();
              return;
            }

            if (_attempts >= _maxAttempts) {
              timer.cancel();
              return;
            }
            _attempts++;

            try {
              await _animatePanelTo(_targetSize);
            } catch (_) {}
          });
        }
      }
      if (widget.displayType == null) {
        if (current == minExtendedChildSize) {
          Future.delayed(const Duration(milliseconds: 200), () {
            _animatePanelTo(minChildSize);
          });
        }
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    connection.cancel();
    _getNearPointsTimer?.cancel();
    _panelSnapTimer?.cancel();
    _panelAnimationSafetyTimer?.cancel();

    // Remove marker callbacks
    globals.openMapPointCallback = null;
    globals.removePointMarkerCallback = null;
    globals.mapController = null;
    globals.addShapesCallback = null;
    globals.clearAllShapesCallback = null;
    globals.zoomToCallback = null;

    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Theme.of(context).colorScheme.brightness == Brightness.dark ? Brightness.light : Brightness.dark,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            _layoutBuilderChange(constraints);
            return Scaffold(
              body: Stack(
                alignment: Alignment.topCenter,
                children: [
                  MapWidget(
                    cameraOptions: camera,
                    onMapCreated: _onMapCreated,
                    onStyleLoadedListener: _onStyleLoaded,
                    onCameraChangeListener: _onCameraChangeListener,
                    onScrollListener: _onMapScrollListener,
                    onZoomListener: _onMapZoomListener,
                    onMapIdleListener: _onMapIdleListener,
                    onTapListener: _onMapTapListener,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: NotificationListener<DraggableScrollableNotification>(
                      onNotification: (notification) {
                        _onPanelSlide(notification.extent);
                        _maybeSnapPanel(notification.extent);
                        return false;
                      },
                      child: DraggableScrollableSheet(
                        controller: panelController,
                        initialChildSize: _minChildSize,
                        minChildSize: _minChildSize,
                        maxChildSize: _maxChildSize,
                        expand: true,
                        builder: (context, scrollController) {
                          return ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                            child: blurredContainer(
                              context: context,
                              child: AnimatedContainer(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeInOut,
                                decoration: BoxDecoration(
                                  gradient: getPanelGradient(context, _color),
                                ),
                                child: MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  removeBottom: true,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onVerticalDragStart: _onPanelVerticalDragStart,
                                        onVerticalDragUpdate: _onPanelDragUpdate,
                                        onVerticalDragEnd: _onPanelVerticalDragEnd,
                                        onLongPressEnd: _onPanelLongPressEnd,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                  top: 15,
                                                  bottom: 10,
                                                ),
                                                child: Container(
                                                  width: 40,
                                                  height: 5,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[400],
                                                    borderRadius: BorderRadius.circular(30),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            HomeHeader(
                                              key: ValueKey(
                                                  'header-${widget.displayType ?? 'null'}-${widget.id ?? 'null'}-${widget.routeId ?? 'null'}-${widget.fromId ?? 'null'}-${widget.toId ?? 'null'}'),
                                              id: widget.id,
                                              type: widget.displayType,
                                              routeId: widget.routeId,
                                              fromId: widget.fromId,
                                              toId: widget.toId,
                                              removePointMarker: removePointMarker,
                                              setData: setData,
                                              data: _data,
                                              setColor: setColor,
                                              color: _color,
                                              refreshMap: () => {},
                                              moveMap: moveMap,
                                              openPanel: _openPanel,
                                              panelController: panelController,
                                              getMapController: () => _controller,
                                            ),
                                          ],
                                        ),
                                      ),
                                      HomePanel(
                                        key: ValueKey(
                                            'panel-${widget.displayType ?? 'null'}-${widget.id ?? 'null'}-${widget.routeId ?? 'null'}-${widget.fromId ?? 'null'}-${widget.toId ?? 'null'}'),
                                        id: widget.id,
                                        type: widget.displayType,
                                        routeId: widget.routeId,
                                        fromId: widget.fromId,
                                        toId: widget.toId,
                                        index: index,
                                        setData: setData,
                                        data: _data,
                                        setColor: setColor,
                                        color: _color,
                                        refreshMap: () => {},
                                        moveMap: moveMap,
                                        openPanel: _openPanel,
                                        panelController: panelController,
                                        scrollController: scrollController,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  if (!isConnected)
                    Positioned(
                      top: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.amber,
                        child: SafeArea(
                          child: Container(
                            margin: const EdgeInsets.only(top: 12, left: 73, bottom: 15),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/img/cloud_off.svg',
                                  color: Theme.of(context).colorScheme.onSurface,
                                  height: 18,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  AppLocalizations.of(context)!.no_internet_connection,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontFamily: fontFamily,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Opacity(
                      opacity: getOpacity(_position),
                      child: SafeArea(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, right: 8),
                          width: 45,
                          height: 45,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(500)),
                            child: blurredContainer(
                              context: context,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: getButtonGradient(context),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    RouteStateScope.of(context).go('/settings');
                                  },
                                  child: Icon(
                                    NavikaIcons.settingsFilled,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
  top: 60,
  right: 0,
  child: Opacity(
    opacity: getOpacity(_position),
    child: AnimatedOpacity(
      opacity: (isPanned && bearing != 0) ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 10, right: 8),
        width: 45,
        height: 45,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(500)),
          child: blurredContainer(
            context: context,
            child: Container(
              decoration: BoxDecoration(
                gradient: getButtonGradient(context),
              ),
              child: InkWell(
              borderRadius: BorderRadius.circular(500),
              onTap: () {
                _setBearing(0);
              },
              child: Transform.rotate(
                angle: -(bearing * (math.pi / 180)),
                child: Icon(
                  NavikaIcons.north,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
            ),
          ),
        ),
      ),
    ),
    ),

  ),
),
                  Positioned(
                    right: 20,
                    bottom: _getPanelButtonBottomOffset(),
                    child: SafeArea(
                      child: Opacity(
                        opacity: getOpacity(_position),
                        child: SizedBox(
                          width: 56,
                          height: 56,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            child: blurredContainer(
                              context: context,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: getButtonGradient(context),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    _zoomOn();
                                    _closePanel();
                                  },
                                  child: _getLocationIcon(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    bottom: _getPanelButtonBottomOffset(),
                    child: Opacity(
                      opacity: getOpacity(_position),
                      child: SvgPicture.asset(
                        mapBoxIcon(),
                        width: 70,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );

  void _layoutBuilderChange(BoxConstraints constraints) {
    final ui.Size scaffoldSize = ui.Size(
      constraints.maxWidth,
      constraints.maxHeight,
    );
    const double maxSize = kToolbarHeight;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && (_scaffoldSize == null || _scaffoldSize != scaffoldSize)) {
        setState(() {
          _minChildSize = minSize / scaffoldSize.height;
          _maxChildSize = (1 - (maxSize / scaffoldSize.height));
          minChildSize = minSize / scaffoldSize.height;
          minExtendedChildSize = extendedMinSize / scaffoldSize.height;
          _scaffoldSize = scaffoldSize;
        });
      }
    });
  }

  Icon _getLocationIcon() {
    IconData icon = NavikaIcons.localisationNull;

    PositionState state = _controller?.positionState ?? PositionState.unknown;
    switch (state) {
      case PositionState.defined:
        if (isInBounds) {
          icon = NavikaIcons.localisation;
        } else {
          icon = NavikaIcons.localisationNull;
        }
        break;
      case PositionState.acquiring:
        icon = NavikaIcons.position_unknow;
        break;
      case PositionState.permissionDenied:
        icon = NavikaIcons.position_unavailable;
        break;
      case PositionState.servicesDisabled:
        icon = NavikaIcons.position_unavailable;
        break;
      case PositionState.unknown:
        icon = NavikaIcons.position_unknow;
        break;
    }

    return Icon(
      icon,
      color: Theme.of(context).colorScheme.onSurface,
      size: 30,
    );
  }

  double _getPanelButtonBottomOffset() {
    return panelButtonBottomOffset;
  }

  Future<void> _onMapCreated(MapboxMap map) async {
    _controller = MapboxController(map);

    _controller!.onPositionChanged = (newPosition) {
      position = newPosition;
    };

    _controller!.onMarkersChanged = (newMarkers) {
      markersList = newMarkers;
    };

    _controller!.onCompassChanged = (compassEvent) {
      _updateCompass(compassEvent);
    };

    _controller!.onMarkerTapped = (type, id, lat, lon) {
      if (type == 'bike') {
        RouteStateScope.of(context).go('/bike/$id');
      } else if (type == 'stop') {
        RouteStateScope.of(context).go('/stops/$id');
      }

      // Centrer directement sur le padding final (celui du panneau une fois ouvert),
      // pour éviter que le point ne soit masqué par le panneau après son ouverture.
      final double targetExtent = _computeSnapPoints()[1];
      _controller?.zoomToLocation(
        lat,
        lon,
        15,
        padding: {
          'top': MediaQuery.of(context).viewPadding.top,
          'bottom': _bottomPaddingForExtent(targetExtent),
        },
      );
      _openPanel(syncCameraPadding: false);
    };

    globals.panelController = panelController;

    AttributionSettings attributionSettings = AttributionSettings(
      position: OrnamentPosition.BOTTOM_LEFT,
      marginBottom: 88,
      iconColor: Theme.of(context).colorScheme.onSurface.toARGB32(),
    );
    LogoSettings logoSettings = LogoSettings(
      enabled: false,
    );

    map.attribution.updateSettings(attributionSettings);
    map.logo.updateSettings(logoSettings);

    _controller?.hideScaleBar();
    _controller?.hideCompass();

    final bool isHome = widget.displayType == null && widget.id == null;

    globals.zoomToCallback = (double lat, double lon, [double? zoom]) async {
      if (_controller != null) {
        await _controller!.zoomToLocation(lat, lon, zoom ?? 12);
      }
    };

    _controller?.checkLocationPermissionAndInitialize(context, zoomCamera: isHome);
    _controller?.initializePointAnnotationManager();

    _openPanel();
  }

  void _onStyleLoaded(StyleLoadedEventData event) {
    if (!mounted) return;
    final map = _controller?.getInstance();
    if (map == null) return;

    map.style.setStyleImportConfigProperty('basemap', 'showPointOfInterestLabels', false);
    map.style.setStyleImportConfigProperty('basemap', 'show3dObjects', true);

    _applyMapBrightness(Theme.of(context).colorScheme.brightness);

    // La carte est stylée et visible : afficher les points proches sans attendre un geste utilisateur.
    _scheduleNearPointsRefresh(delayMs: 0);
  }

  void _applyMapBrightness(Brightness brightness) {
    final map = _controller?.getInstance();
    if (map == null) return;
    map.style.setStyleImportConfigProperty('basemap', 'lightPreset', brightness == Brightness.dark ? 'night' : 'day');
  }

  void _onMapScrollListener(MapContentGestureContext gestureContext) {
    if (!isPanned) {
      setState(() {
        isPanned = true;
      });
    }
  }

  void _onMapZoomListener(MapContentGestureContext gestureContext) {
    if (!isPanned) {
      setState(() {
        isPanned = true;
      });
    }
  }

  /// Déclenché quand la caméra s'est stabilisée, quel que soit le geste à l'origine
  /// du mouvement (pan, pinch-zoom, fling, ou déplacement programmatique type flyTo).
  /// C'est le point d'entrée unique pour rafraîchir les points proches.
  void _onMapIdleListener(MapIdleEventData event) {
    _scheduleNearPointsRefresh();
  }

  /// Planifie un rafraîchissement des points proches avec debounce unique.
  /// Un seul timer à la fois, annule le précédent.
  void _scheduleNearPointsRefresh({int delayMs = 200}) {
    _getNearPointsTimer?.cancel();
    _getNearPointsTimer = Timer(Duration(milliseconds: delayMs), () async {
      if (!mounted || _controller == null) return;
      if (_isGettingNearPoints) return;
      _isGettingNearPoints = true;
      try {
        await _getNearPoints(context);
      } finally {
        _isGettingNearPoints = false;
      }
    });
  }

  void _onMapTapListener(MapContentGestureContext gestureContext) async {
    if (_controller != null) {
      // Un tap sur un marqueur est déjà géré nativement par le callback tapEvents()
      // du PointAnnotationManager (voir onMarkerTapped). On ignore ici ce même
      // geste pour ne pas déclencher en plus le flux "tap dans le vide".
      if (_controller!.wasAnnotationTappedRecently()) return;

      final lat = gestureContext.point.coordinates.lat as double;
      final lon = gestureContext.point.coordinates.lng as double;

      final double targetExtent = _computeSnapPoints()[1];
      await openMapPoint(lat, lon, true, {
        'top': MediaQuery.of(context).viewPadding.top,
        'bottom': _bottomPaddingForExtent(targetExtent),
      });
      _openPanel(syncCameraPadding: false);

      RouteStateScope.of(context).go('/address/${lat};${lon}');
    }
  }

  void _onCameraChangeListener(CameraChangedEventData cameraChangeEvent) async {
    double newBearing = cameraChangeEvent.cameraState.bearing;
    if (newBearing < 1 || newBearing > 359) {
      newBearing = 0;
    }
    if (newBearing != bearing) {
      setState(() {
        bearing = newBearing;
      });
    }

    if (position != null && _controller != null) {
      bool inBounds = await _controller!.isUserInView();
      if (mounted && inBounds != isInBounds) {
        setState(() {
          isInBounds = inBounds;
        });
      }
    }
  }

  void _registerMarkerCallbacks() {
    globals.openMapPointCallback = openMapPoint;
    globals.removePointMarkerCallback = removePointMarker;
    globals.mapController = _controller;

    globals.addShapesCallback = (Map shapes) async {
      if (_controller != null) {
        await _controller!.addShapes(shapes);
      }
    };
    globals.clearAllShapesCallback = () async {
      if (_controller != null) {
        await _controller!.clearAllShapes();
      }
    };
  }

  Future<void> _getNearPoints(context) async {
    if (!mounted || _controller == null) return;

    GeoCoordinates coords = await _controller!.getCenterCoordinates();
    double zoom = await _controller!.getZoomLevel();

    if (zoom < 13) {
      _lastNearCoords = null;
      _lastNearDistance = null;
      await _controller!.clearBikeMarkers();
      await _controller!.clearStopMarkers();
      return;
    }

    if (!mounted) return;

    // Utiliser la diagonale visible (en mètres) plutôt que la largeur, en tenant compte du panneau en bas
    final double bottomPadding = MediaQuery.of(context).size.height * _position;
    double distanceInMeters = await _controller!.computePreciseDiagonal(
      context: context,
      edgePadding: {
        'top': MediaQuery.of(context).viewPadding.top,
        'bottom': bottomPadding,
        'left': 0,
        'right': 0,
      },
    );

    if (distanceInMeters >= 200000) {
      _lastNearCoords = null;
      _lastNearDistance = null;
      await _controller!.clearBikeMarkers();
      await _controller!.clearStopMarkers();
      return;
    }

    // La caméra peut redevenir "idle" sans avoir réellement bougé (ex: mise à jour du
    // style pour l'indicateur de position à chaque tick GPS/boussole, ou après l'ajout
    // des marqueurs ci-dessous) : on évite de rappeler l'API si la zone visible n'a pas
    // changé depuis le dernier appel, sous peine de la spammer en continu.
    const double coordEpsilon = 0.00003; // ~3 mètres
    if (_lastNearCoords != null &&
        _lastNearDistance != null &&
        (coords.latitude - _lastNearCoords!.latitude).abs() < coordEpsilon &&
        (coords.longitude - _lastNearCoords!.longitude).abs() < coordEpsilon &&
        (distanceInMeters - _lastNearDistance!).abs() < 5) {
      return;
    }
    _lastNearCoords = coords;
    _lastNearDistance = distanceInMeters;

    final NavikaApi navikaApi = NavikaApi();
    final Map result = await navikaApi.getNearPoints(distanceInMeters, coords);

    if (!mounted || _controller == null) return;

    if (result['status'] == ApiStatus.ok) {
      final data = result['value'];

      final List bikes = (data['bike'] ?? []) as List;
      // À fort zoom (diagonale visible < 1000m), le back renvoie des groupes "area"
      // (plusieurs arrêts proches regroupés autour d'un centroïde) au lieu de "stops".
      // On les aplatit en objets "stop-like" pour réutiliser le même pipeline d'icônes
      // et le même flux de tap (navigation vers /stops/:id de l'arrêt parent).
      final List areas = (data['area'] ?? []) as List;
      final List stops = [
        ...(data['stops'] ?? []) as List,
        for (final area in areas) _flattenAreaToStop(area),
      ];

      await _controller!.updateBikeMarkers(bikes, context);
      await _controller!.updateStopMarkers(stops, context);
    }
  }

  /// Transforme un groupe "area" (arrêts proches regroupés par le back) en objet
  /// "stop-like" centré sur le centroïde du groupe, avec l'union des modes de transport
  /// des arrêts regroupés pour choisir la bonne icône.
  Map _flattenAreaToStop(Map area) {
    final List areaStops = (area['stops'] ?? []) as List;
    final Set<String> modes = {};
    for (final stop in areaStops) {
      final List stopModes = (stop['modes'] ?? []) as List;
      modes.addAll(stopModes.map((m) => m.toString()));
    }

    return {
      'id': area['id'],
      'name': area['name'],
      'coord': area['coord'],
      'modes': modes.toList(),
    };
  }

  Future<void> _getIndex() async {
    if (globals.index != null) {
      setState(() {
        index = globals.index!;
      });
      return;
    }

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getIndex();

    if (result['status'] == ApiStatus.ok && mounted) {
      setState(() {
        index = result['value']!;
      });
      globals.index = result['value']!;
    }
  }

  Future<void> _updateCompass(CompassEvent compassEvent) async {
    double heading = compassEvent.heading ?? 0;
    // compass n'est pas utilisé dans build(), pas besoin de setState
    compass = heading;

    if (is3dMap && !isPanned && position != null) {
      _controller?.zoomOnLocationIndicator(is3dMap, compass, duration: 100, padding: {'top': kToolbarHeight, 'bottom': MediaQuery.of(context).size.height * _position});
    }

    if (position != null) {
      _controller?.updateLocationIndicator(position!.latitude, position!.longitude, position!.altitude, position!.accuracy, compass);
    }
  }

  Future<void> _zoomOn() async {
    if (position != null && _controller != null) {
      if (!isPanned) {
        setState(() {
          is3dMap = !is3dMap;
          isPanned = false;
        });
      } else {
        setState(() {
          isPanned = false;
          is3dMap = false;
        });
      }
      await _controller!.zoomOnLocationIndicator(is3dMap, 0, padding: {'top': kToolbarHeight, 'bottom': MediaQuery.of(context).size.height * _position});
      // Utiliser le debounce unifié pour rafraîchir les points proches après le zoom
      _scheduleNearPointsRefresh(delayMs: 800);
    }
  }

  void _setBearing(double newBearing) {
    if (_controller != null) {
      setState(() {
        is3dMap = false;
        isPanned = true;
      });

      _controller!.setBearing(newBearing, 0);
    }
  }

  void _onPanelSlide(double position) {
    setState(() {
      final scaffoldHeight = _scaffoldSize?.height ?? MediaQuery.of(context).size.height;
      // Le panneau (DraggableScrollableSheet) occupe exactement `position * scaffoldHeight`
      // pixels depuis le bas : on aligne le bouton directement sur cette valeur pour qu'il
      // reste collé au-dessus du panneau à toutes les positions, pas seulement aux bornes.
      panelButtonBottomOffset = (position * scaffoldHeight) + 10;
      _position = position;
    });
  }

  /// Padding bas de caméra correspondant à une extension de panneau donnée
  /// (fraction de la hauteur d'écran occupée par le panneau). Centralisé ici
  /// pour rester cohérent entre le snap au drag et l'ouverture programmatique.
  double _bottomPaddingForExtent(double extent) {
    return (extent == _minChildSize) ? 0 : MediaQuery.of(context).size.height * extent;
  }

  void _closePanel() {
    _animatePanelTo(_minChildSize);
  }

  /// Ouvre le panneau au snap "mi-hauteur" et resynchronise le padding caméra dessus.
  /// [syncCameraPadding] doit être mis à `false` quand l'appelant vient déjà de lancer
  /// sa propre animation de caméra (ex: centrage sur un point) avec le padding cible :
  /// lancer un 2e flyTo ici interromprait celui déjà en cours et annulerait le centrage.
  void _openPanel({bool syncCameraPadding = true}) {
    final double targetExtent = _computeSnapPoints()[1];
    _animatePanelTo(targetExtent);
    if (syncCameraPadding) {
      _controller?.adjustCameraPadding(
        top: MediaQuery.of(context).viewPadding.top,
        bottom: _bottomPaddingForExtent(targetExtent),
      );
    }
  }

  void _onPanelDragUpdate(DragUpdateDetails details) {
    final double dragDelta = -details.delta.dy;
    final double sensitivity = 1 / (MediaQuery.of(context).size.height);
    final double extentDelta = dragDelta * sensitivity * 1.2;

    double current = _minChildSize;
    try {
      current = panelController.size;
    } catch (_) {}

    double target = (current + extentDelta).clamp(_minChildSize, _maxChildSize);

    _lastDragExtent = target;

    _onPanelSlide(target);

    try {
      panelController.jumpTo(target);
    } catch (_) {}
  }

  void _onPanelDragEnd(DragEndDetails details) {
    double current = _minChildSize;
    if (_lastDragExtent > 0) {
      current = _lastDragExtent;
    } else {
      try {
        current = panelController.size;
      } catch (_) {}
    }

    _lastDragExtent = 0;

    _maybeSnapPanel(current, force: true);
  }

  void _onPanelVerticalDragStart(DragStartDetails details) {
    _draggingPanel = true;
  }

  void _onPanelVerticalDragEnd(DragEndDetails details) {
    _onPanelDragEnd(details);
    _draggingPanel = false;
  }

  void _onPanelLongPressEnd(LongPressEndDetails details) {
    if (!_draggingPanel) {
      double current = _minChildSize;
      try {
        current = panelController.size;
      } catch (_) {}
      _maybeSnapPanel(current, force: true);
    }
    _draggingPanel = false;
  }

  List<double> _computeSnapPoints() {
    final double min = _scaffoldSize != null ? _minChildSize : 0.1;
    final double max = _scaffoldSize != null ? _maxChildSize : 0.9;
    final double mid = 0.55;
    if (widget.displayType != null) {
      return [minExtendedChildSize, mid, max];
    }
    return [min, mid, max];
  }

  void _maybeSnapPanel(double extent, {bool force = false}) {
    if (_isPanelAnimating) return;

    if (!force) {
      _panelSnapTimer?.cancel();
      _panelSnapTimer = Timer(const Duration(milliseconds: 120), () {
        _maybeSnapPanel(extent, force: true);
      });
      return;
    }

    final snaps = _computeSnapPoints();
    double nearest = snaps.first;
    double best = (extent - nearest).abs();
    for (final s in snaps) {
      final d = (extent - s).abs();
      if (d < best) {
        best = d;
        nearest = s;
      }
    }

    final double allowedMin = widget.displayType != null ? minExtendedChildSize : _minChildSize;
    if (nearest < allowedMin) {
      nearest = allowedMin;
    }

    _animatePanelTo(nearest);

    _controller?.adjustCameraPadding(
      top: MediaQuery.of(context).viewPadding.top,
      bottom: _bottomPaddingForExtent(nearest),
    );
  }

  Future<void> _animatePanelTo(double size) async {
    debugPrint(panelController.size.toString());
    _isPanelAnimating = true;

    _panelAnimationSafetyTimer?.cancel();
    _panelAnimationSafetyTimer = Timer(const Duration(milliseconds: 300), () {
      _isPanelAnimating = false;
    });

    try {
      await panelController.animateTo(
        size,
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
      );
    } catch (_) {
      _isPanelAnimating = false;
    } finally {
      _panelAnimationSafetyTimer?.cancel();
      _isPanelAnimating = false;
    }
  }

  Future<void> _initializeConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _setConnectivity(connectivityResult);
  }

  void _setConnectivity(connectivity) {
    final bool newValue = connectivity != ConnectivityResult.none;

    if (newValue != isConnected) {
      setState(() {
        isConnected = newValue;
      });
    }
  }
}
