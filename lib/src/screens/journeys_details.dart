// 🎯 Dart imports:
import 'dart:async';
import 'dart:math' as math;

// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:navika/l10n/app_localizations.dart';

// 🌎 Project imports:
import 'package:navika/src/controller/mapbox_controller.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icon.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/screens/navigation_bar.dart';
import 'package:navika/src/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/bottom_sheets/journey.dart';
import 'package:navika/src/widgets/icons/icons.dart';
import 'package:navika/src/widgets/journey/body.dart';
import 'package:navika/src/widgets/journey/header.dart';

void saveJourney(String uniqueId, context) {
  List journeys = globals.hiveBox.get('journeys');

  if (isSavedJourney(uniqueId)) {
    journeys.removeWhere((element) => element['unique_id'] == uniqueId);
    floatingSnackBar(
      message: AppLocalizations.of(context)!.route_removed,
      context: context,
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: mainColor(context),
    );
  } else {
    journeys.add(globals.journey);
    floatingSnackBar(
      message: AppLocalizations.of(context)!.saved_route,
      context: context,
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: mainColor(context),
    );
  }

  globals.hiveBox.put('journeys', journeys);
}

bool isSavedJourney(String uniqueId) {
  List journeys = globals.hiveBox.get('journeys');
  for (var journey in journeys) {
    if (journey['unique_id'] == uniqueId) {
      return true;
    }
  }
  return false;
}

void removeRecurrentJourney(Map journey, context) {
  List journeys = globals.hiveBox.get('recurrentJourneys');

  journeys.removeWhere((element) => element['from']['id'] == journey['from']['id'] &&
                                      element['to']['id'] == journey['to']['id']);
  floatingSnackBar(
    message: AppLocalizations.of(context)!.route_removed,
    context: context,
    textStyle: snackBarText,
    duration: const Duration(milliseconds: 4000),
    backgroundColor: mainColor(context),
  );

  globals.hiveBox.put('recurrentJourneys', journeys);
}

bool isSavedRecurrentJourney() {
  List journeys = globals.hiveBox.get('recurrentJourneys');
  for (var journey in journeys) {
    if (journey['from']['id'] == globals.route['from']['id'] &&
        journey['to']['id'] == globals.route['to']['id']) {
      return true;
    }
  }
  return false;
}

void save(BuildContext context, journey) {
  if (isSavedJourney(journey['unique_id'])) {
    saveJourney(journey['unique_id'], context);

  } else if (isSavedRecurrentJourney()) {
    removeRecurrentJourney(globals.route, context);

  } else {
    showModalBottomSheet<void>(
        shape: const RoundedRectangleBorder(
          borderRadius: bottomSheetBorder,
        ),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) => BottomJourney(journey: journey));
  }
}

Map? getSavedJourney(String uniqueId) {
  List journeys = globals.hiveBox.get('journeys');
  for (var journey in journeys) {
    if (journey['unique_id'] == uniqueId) {
      return journey;
    }
  }
  return null;
}

List getLineByJourney(journey) {
  List res = [];
  for (var section in journey['sections']) {
    if (section['type'] == 'public_transport' && section['informations'] != null && section['informations']['line'] != null) {
      res.add(section['informations']['line']);
    }
  }
  return res;
}

bool allowNavi(journey) {
  return false;
}

const double kPanelFullyOpenThreshold = 0.6;

class JourneysDetails extends StatefulWidget {
  const JourneysDetails({super.key});

  @override
  State<JourneysDetails> createState() => _JourneysDetailsState();
}

class _JourneysDetailsState extends State<JourneysDetails> {
  MapboxController? _controller;
  DraggableScrollableController panelController = DraggableScrollableController();

  late CameraOptions camera;
  geolocator.Position? position;

  CompassEvent? compassEvent;
  double compass = 0;
  double bearing = 0;

  bool isPanned = false;
  bool is3dMap = false;
  bool isInBounds = false;

  double panelButtonBottomOffsetClosed = 110;
  double panelButtonBottomOffset = 10;
  double _position = 0;

  Size? _scaffoldSize;
  double _minChildSize = 0;
  double _maxChildSize = 1;
  double minChildSize = 0;
  double _lastDragExtent = 0;

  Timer? _panelSnapTimer;
  Timer? _panelAnimationSafetyTimer;
  bool _isPanelAnimating = false;
  bool _draggingPanel = false;

  int minSize = 82;

  Brightness? _lastBrightness;

  Map journey = globals.journey;

  CameraOptions _buildInitialCamera() {
    try {
      final sections = journey['sections'];
      if (sections != null && sections.isNotEmpty) {
        final lastSection = sections[sections.length - 1];
        final coord = lastSection['to']?['coord'];
        if (coord != null) {
          final lat = (coord['lat'] as num).toDouble();
          final lon = (coord['lon'] as num).toDouble();
          return CameraOptions(center: Point(coordinates: Position(lon, lat)), zoom: 14, bearing: 0, pitch: 0);
        }
      }
    } catch (_) {}
    return CameraOptions(center: Point(coordinates: Position(2.346711, 48.859481)), zoom: 12, bearing: 0, pitch: 0);
  }

  @override
  void initState() {
    super.initState();
    camera = _buildInitialCamera();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openPanel();
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

  void _applyMapBrightness(Brightness brightness) {
    final map = _controller?.getInstance();
    if (map == null) return;
    map.style.setStyleImportConfigProperty('basemap', 'lightPreset', brightness == Brightness.dark ? 'night' : 'day');
  }

  @override
  void dispose() {
    super.dispose();
    _panelSnapTimer?.cancel();
    _panelAnimationSafetyTimer?.cancel();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Theme.of(context).colorScheme.brightness == Brightness.dark ? Brightness.light : Brightness.dark,
        ),
        child: Scaffold(
          bottomNavigationBar: getNavigationBar(context),
          body: LayoutBuilder(
            builder: (context, constraints) {
              _layoutBuilderChange(constraints);
              return Stack(
                alignment: Alignment.topCenter,
                children: [
                  MapWidget(
                    cameraOptions: camera,
                    onMapCreated: _onMapCreated,
                    onCameraChangeListener: _onCameraChangeListener,
                    onScrollListener: _onMapScrollListener,
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
                          final topMargin = _getTopMargin();
                          final powerSaving = MediaQuery.of(context).disableAnimations || globals.isPowerSaveMode;

                          return ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                            child: blurredContainer(
                              context: context,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: Theme.of(context).colorScheme.brightness == Brightness.dark
                                        ? [Colors.black.withOpacity(powerSaving ? 1 : 0.7), Colors.black.withOpacity(powerSaving ? 1 : 0.7)]
                                        : [Colors.white.withOpacity(powerSaving ? 1 : 0.5), Colors.white.withOpacity(powerSaving ? 1 : 0.5)],
                                  ),
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
                                            SizedBox(height: topMargin),
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                margin: const EdgeInsets.only(top: 8),
                                                width: 40,
                                                height: 5,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[400]?.withOpacity(getOpacity(_position)),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: topMargin),
                                              child: RoutePanel(journey: journey),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: RouteBody(
                                          scrollController: scrollController,
                                          journey: journey,
                                          zoomTo: _zoomTo,
                                        ),
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
                  Positioned( // Bouton retour
                    top: 0,
                    left: 0,
                    child: SafeArea(
                      child: Container(
                        margin: const EdgeInsets.only(top: 0, left: 8, bottom: 15),
                        width: 40,
                        height: 40,
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
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                              arrowBack,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                                ),
                              ),
                            ),
                          ),
                      ),
                    ),
                  ),
                  Positioned( // Titre
                    top: 5,
                    left: 58,
                    child: SafeArea(
                      child: Opacity(
                        opacity: getReverseOpacity(_position, kPanelFullyOpenThreshold),
                        child: Text(
                          AppLocalizations.of(context)!.route,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            fontFamily: fontFamily,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (journey['unique_id'] != null)
                    Positioned(
                    top: 0,
                    right: 0,
                    child: SafeArea(
                      child: Container(
                          margin: const EdgeInsets.only(top: 0, right: 10, bottom: 15),
                        width: 40,
                        height: 40,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(500)),
                          child: blurredContainer(
                            context: context,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: getButtonGradient(context),
                              ),
                              child: InkWell(
                              child: isSavedJourney(journey['unique_id']) || isSavedRecurrentJourney()
                                  ? Icon(
                                      NavikaIcons.saved,
                                      color: Theme.of(context).colorScheme.onSurface,
                                    )
                                  : Icon(
                                      NavikaIcons.star,
                                      color: Theme.of(context).colorScheme.onSurface,
                                    ),
                              onTap: () => saveJourney(journey['unique_id'], context),
                              // onTap: () => save(context, journey),
                            ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    right: 0,
                    child: SafeArea(
                      child: Opacity(
                        opacity: getOpacity(_position, kPanelFullyOpenThreshold),
                      child: AnimatedOpacity(
                        opacity: (isPanned && bearing != 0) ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                            margin: const EdgeInsets.only(top: 0, right: 10, bottom: 15),
                          width: 40,
                          height: 40,
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
                        opacity: getOpacity(_position, kPanelFullyOpenThreshold),
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
                      opacity: getOpacity(_position, kPanelFullyOpenThreshold),
                      child: SvgPicture.asset(
                        mapBoxIcon(),
                        width: 70,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      );

  void _layoutBuilderChange(BoxConstraints constraints) {
    final Size scaffoldSize = Size(
      width: constraints.maxWidth,
      height: constraints.maxHeight,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && (_scaffoldSize == null || _scaffoldSize != scaffoldSize)) {
        setState(() {
          _minChildSize = minSize / scaffoldSize.height;
          _maxChildSize = 1.0; // Prend tout l'écran
          minChildSize = minSize / scaffoldSize.height;
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

  double _getTopMargin() {
    if (_position < kPanelFullyOpenThreshold) {
      return 0;
    }
    final mediaQuery = MediaQuery.of(context);
    final safeAreaTop = mediaQuery.padding.top;
    final targetMargin = safeAreaTop - 20;

    final progress = (_position - kPanelFullyOpenThreshold) / (1.0 - kPanelFullyOpenThreshold); // 0 à 1
    return targetMargin * progress.clamp(0.0, 1.0);
  }

  Future<void> _onMapCreated(MapboxMap map) async {
    _controller = MapboxController(map);

    _controller!.onPositionChanged = (newPosition) {
      setState(() {
        position = newPosition;
      });
    };

    _controller!.onCompassChanged = (compassEvent) {
      _updateCompass(compassEvent);
    };

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
    map.style.setStyleImportConfigProperty('basemap', 'showPointOfInterestLabels', false);
    map.style.setStyleImportConfigProperty('basemap', 'show3dObjects', true);

    _applyMapBrightness(Theme.of(context).colorScheme.brightness);

    _controller?.hideScaleBar();
    _controller?.hideCompass();

    _controller?.checkLocationPermissionAndInitialize(context, zoomCamera: false);

    // Créer les tracés de l'itinéraire
    await _createRouteOnMap();

    // Zoomer sur l'itinéraire complet
    await _zoomToRoute();
  }

  Future<void> _createRouteOnMap() async {
    if (_controller == null) return;

    List<Map> features = [];
    int shapeIndex = 0;

    // Créer les polylignes pour chaque section
    for (var section in journey['sections']) {
      if (section['geojson'] != null) {
        final geojson = section['geojson'];
        final color = getColorByType(context, section);
        final width = getLineWidthByType(section['type']);

        List<List<double>> coordinates = [];
        for (var coord in geojson['coordinates']) {
          coordinates.add([(coord[0] as num).toDouble(), (coord[1] as num).toDouble()]);
        }

        features.add({
          'type': 'Feature',
          'geometry': {
            'type': 'LineString',
            'coordinates': coordinates,
          },
          'properties': {
            'shape_id': 'journey_shape_$shapeIndex',
            'route': {
              'color': color.value.toRadixString(16).substring(2),
            },
            'line_width': width,
          }
        });

        shapeIndex++;
      }
    }

    if (features.isNotEmpty) {
      await _controller!.addShapes({'features': features});
    }

    // Initialiser le gestionnaire d'annotations seulement après les tracés : les couches Mapbox
    // sont empilées dans l'ordre d'ajout, il faut donc que la couche d'annotations (icônes de ligne)
    // soit créée après les LineLayer pour s'afficher au-dessus d'elles, pas en dessous.
    await _controller!.initializePointAnnotationManager();

    // Ajouter les marqueurs de lignes
    await _addLineMarkers();
  }

  Future<void> _addLineMarkers() async {
    if (_controller == null) return;
    final brightness = Theme.of(context).colorScheme.brightness;

    int index = 0;
    for (var section in journey['sections']) {
      if (section['type'] == 'public_transport' &&
          section['informations'] != null &&
          section['informations']['line'] != null &&
          section['geojson'] != null &&
          section['geojson']['coordinates'] != null &&
          section['geojson']['coordinates'].isNotEmpty) {
        final coord = section['geojson']['coordinates'][0];
        final lat = (coord[1] as num).toDouble();
        final lon = (coord[0] as num).toDouble();

        await _controller!.addLineMarker(
          'journey_line_$index',
          lat,
          lon,
          Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
              child: Icones(
                line: section['informations']['line'],
                i: 0,
                brightness: brightness,
                size: 20,
              ),
            ),
          ),
        );
        index++;
      }
    }
  }

  Future<void> _zoomToRoute() async {
    if (_controller == null || journey['sections'] == null || journey['sections'].isEmpty) return;
    if (!mounted) return;

    // Calculer les limites de l'itinéraire
    double? minLat, maxLat, minLon, maxLon;

    for (var section in journey['sections']) {
      if (section['geojson'] != null && section['geojson']['coordinates'] != null) {
        for (var coord in section['geojson']['coordinates']) {
          final lat = coord[1].toDouble();
          final lon = coord[0].toDouble();

          minLat = minLat == null ? lat : math.min(minLat, lat);
          maxLat = maxLat == null ? lat : math.max(maxLat, lat);
          minLon = minLon == null ? lon : math.min(minLon, lon);
          maxLon = maxLon == null ? lon : math.max(maxLon, lon);
        }
      }
    }

    if (minLat == null || maxLat == null || minLon == null || maxLon == null) return;

    // Calcule un zoom précis (basé sur la taille réelle de l'écran, pas un palier de distance)
    // pour que tout le trajet tienne dans la zone visible, au-dessus du panneau et sous la barre du haut.
    await _controller!.fitCameraToCoordinates(
      [Offset(minLon, minLat), Offset(maxLon, maxLat)],
      edgePadding: {
        'top': kToolbarHeight + MediaQuery.of(context).padding.top,
        'bottom': MediaQuery.of(context).size.height * 0.55,
        'left': 40,
        'right': 40,
      },
      context: context,
      keepExistingPadding: false,
    );
  }

  Future<void> _onMapScrollListener(MapContentGestureContext gestureContext) async {
    setState(() {
      isPanned = true;
    });
  }

  void _onCameraChangeListener(CameraChangedEventData cameraChangeEvent) async {
    setState(() {
      bearing = cameraChangeEvent.cameraState.bearing;
      if (bearing < 1 || bearing > 359) {
        bearing = 0;
      }
    });

    if (position != null && _controller != null) {
      bool inBounds = await _controller!.isUserInView();
      setState(() {
        isInBounds = inBounds;
      });
    }
  }

  Future<void> _updateCompass(CompassEvent compassEvent) async {
    double heading = compassEvent.heading ?? 0;
    if (mounted) {
      setState(() {
        compass = heading;
      });
    }

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

  void _zoomTo(double lat, double lon) async {
    if (_controller != null) {
      await _controller!.zoomToLocation(lat, lon, 15);
      _openPanel();
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

  void _closePanel() {
    _animatePanelTo(_minChildSize);
  }

  void _openPanel() {
    _animatePanelTo(_computeSnapPoints()[1]);
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

    _animatePanelTo(nearest);

    double bottomPadding = (nearest == _minChildSize) ? 0 : MediaQuery.of(context).size.height * nearest;
    _controller?.adjustCameraPadding(top: MediaQuery.of(context).viewPadding.top, bottom: bottomPadding);
  }

  Future<void> _animatePanelTo(double size) async {
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
}


//NOPE class _JourneysDetailsState extends State<JourneysDetails> {
//NOPE   HereController? _controller;
//NOPE   PanelController panelController = PanelController();
//NOPE 
//NOPE   GeoCoordinates camGeoCoords = GeoCoordinates(0, 0);
//NOPE 
//NOPE   PositionState state = PositionState.unknown;
//NOPE   Position? position;
//NOPE   StreamSubscription<Position>? positionStream;
//NOPE 
//NOPE   CompassEvent? compassEvent;
//NOPE   double compass = 0;
//NOPE   double bearing = 0;
//NOPE 
//NOPE   bool isPanned = false;
//NOPE   bool is3dMap = false;
//NOPE   bool _isInBox = false;
//NOPE   final bool _allowNavi = allowNavi(globals.journey);
//NOPE   late Timer _timer;
//NOPE 
//NOPE   double panelButtonBottomOffsetClosed = 110;
//NOPE   double panelButtonBottomOffset = 120;
//NOPE   double saveButtonRightOffset = 0;
//NOPE   double _position = 0;
//NOPE 
//NOPE   Map journey = globals.journey;
//NOPE 
//NOPE   Map getToCoords() {
//NOPE     return journey['sections'][0]['from']['coord'];
//NOPE   }
//NOPE 
//NOPE   Map getFromCoords() {
//NOPE     return journey['sections'][journey['sections'].length - 1]['to']['coord'];
//NOPE   }
//NOPE 
//NOPE   void _createGeoJson(BuildContext context, Map journey) {
//NOPE     for (var section in journey['sections']) {
//NOPE       if (section['geojson'] != null) {
//NOPE         _createPolylines(section['geojson'], getLineWidthByType(section['type']), getColorByType(context, section));
//NOPE       }
//NOPE     }
//NOPE     for (var section in journey['sections']) {
//NOPE       if (section['geojson'] != null) {
//NOPE         try {
//NOPE           _addLineMarker(section);
//NOPE         } catch (e) {
//NOPE           // print({'INFO_', e});
//NOPE         }
//NOPE       }
//NOPE     }
//NOPE   }
//NOPE 
//NOPE   void _addLineMarker(section) {
//NOPE     if (section['informations'] != null && section['informations']['line']['id'] != null) {
//NOPE       GeoCoordinates stopCoords = GeoCoordinates(
//NOPE         section['geojson']['coordinates'][0][1].toDouble(),
//NOPE         section['geojson']['coordinates'][0][0].toDouble(),
//NOPE       );
//NOPE       _controller!.addMapWidget(
//NOPE           Material(
//NOPE               elevation: 4,
//NOPE               borderRadius: BorderRadius.circular(10),
//NOPE               child: Container(
//NOPE                 decoration: BoxDecoration(
//NOPE                   color: Theme.of(context).colorScheme.surface,
//NOPE                   borderRadius: BorderRadius.circular(10),
//NOPE                 ),
//NOPE                 padding: const EdgeInsets.only(
//NOPE                   left: 5,
//NOPE                   right: 5,
//NOPE                   top: 2,
//NOPE                   bottom: 2,
//NOPE                 ),
//NOPE                 child: Icones(
//NOPE                     line: section['informations']['line'],
//NOPE                     prevLine: section['informations']['line'],
//NOPE                     i: 0,
//NOPE                     brightness: Theme.of(context).colorScheme.brightness),
//NOPE               )),
//NOPE           stopCoords);
//NOPE     }
//NOPE   }
//NOPE 
//NOPE   void _createPolylines(Map geojson, double width, Color lineColor) {
//NOPE     List<GeoCoordinates> coordinates = [];
//NOPE 
//NOPE     for (var coords in geojson['coordinates']) {
//NOPE       coordinates.add(GeoCoordinates(coords[1], coords[0]));
//NOPE     }
//NOPE 
//NOPE     GeoPolyline geoPolyline = GeoPolyline(coordinates);
//NOPE     MapPolyline mapPolyline = MapPolyline.withRepresentation(
//NOPE       geoPolyline,
//NOPE       MapPolylineSolidRepresentation(
//NOPE         MapMeasureDependentRenderSize.withSingleSize(RenderSizeUnit.pixels, width),
//NOPE         lineColor,
//NOPE         LineCap.round,
//NOPE       ),
//NOPE     );
//NOPE 
//NOPE     _controller?.addMapPolylines(mapPolyline);
//NOPE   }
//NOPE 
//NOPE   Future<void> _getLocation() async {
//NOPE     bool serviceEnabled;
//NOPE     LocationPermission permission;
//NOPE     LocationSettings locationSettings = const LocationSettings(
//NOPE       accuracy: LocationAccuracy.high,
//NOPE     );
//NOPE 
//NOPE     bool askGps = await globals.hiveBox?.get('askGps') ?? false;
//NOPE     bool allowGps = await globals.hiveBox?.get('allowGps') ?? false;
//NOPE     if (!askGps) {
//NOPE       RouteStateScope.of(context).go('/position');
//NOPE       state = PositionState.permissionDenied;
//NOPE       return;
//NOPE     }
//NOPE     if (!allowGps) {
//NOPE       state = PositionState.permissionDenied;
//NOPE       return;
//NOPE     }
//NOPE 
//NOPE     // Check if location services are enabled
//NOPE     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//NOPE     if (!serviceEnabled) {
//NOPE       state = PositionState.servicesDisabled;
//NOPE       return;
//NOPE     }
//NOPE 
//NOPE     // Check if app we have location permission
//NOPE     permission = await Geolocator.checkPermission();
//NOPE     if (permission == LocationPermission.deniedForever || permission == LocationPermission.denied) {
//NOPE       RouteStateScope.of(context).go('/position');
//NOPE       state = PositionState.permissionDenied;
//NOPE       return;
//NOPE     }
//NOPE 
//NOPE     // Check if we have a recent position
//NOPE     state = PositionState.acquiring;
//NOPE 
//NOPE     Position? lastKnownLocation = await Geolocator.getLastKnownPosition();
//NOPE     if (lastKnownLocation != null) {
//NOPE       position = lastKnownLocation;
//NOPE       _addLocationIndicator(lastKnownLocation, false, false);
//NOPE     } else {
//NOPE       locationSettings = AndroidSettings(
//NOPE         accuracy: LocationAccuracy.high
//NOPE       );
//NOPE       position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
//NOPE       if (position != null) {
//NOPE         _addLocationIndicator(position!, true, false);
//NOPE       }
//NOPE     }
//NOPE     state = PositionState.defined;
//NOPE 
//NOPE     if (position != null) {
//NOPE       camGeoCoords = GeoCoordinates(position!.latitude, position!.longitude);
//NOPE     }
//NOPE 
//NOPE     if (mounted) {
//NOPE       positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen((Position? newPosition) {
//NOPE         if (mounted) {
//NOPE           setState(() {
//NOPE             position = newPosition;
//NOPE           });
//NOPE         }
//NOPE         _updateLocationIndicator(newPosition!);
//NOPE       });
//NOPE       FlutterCompass.events?.listen((CompassEvent compassEvent) {
//NOPE         _updateCompass(compassEvent);
//NOPE       });
//NOPE     }
//NOPE   }
//NOPE 
//NOPE   Icon getLocationIcon() {
//NOPE     IconData icon = NavikaIcons.localisationNull;
//NOPE 
//NOPE     switch (state) {
//NOPE       case PositionState.defined:
//NOPE         if (_isInBox) {
//NOPE           icon = NavikaIcons.localisation;
//NOPE         } else {
//NOPE           icon = NavikaIcons.localisationNull;
//NOPE         }
//NOPE         break;
//NOPE       case PositionState.acquiring:
//NOPE         icon = NavikaIcons.position_unknow;
//NOPE         break;
//NOPE       case PositionState.permissionDenied:
//NOPE         icon = NavikaIcons.position_unavailable;
//NOPE         break;
//NOPE       case PositionState.servicesDisabled:
//NOPE         icon = NavikaIcons.position_unavailable;
//NOPE         break;
//NOPE       case PositionState.unknown:
//NOPE         icon = NavikaIcons.position_unknow;
//NOPE         break;
//NOPE     }
//NOPE 
//NOPE     return Icon(icon, color: Theme.of(context).colorScheme.onSurface, size: 30);
//NOPE   }
//NOPE 
//NOPE   @override
//NOPE   Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
//NOPE         value: SystemUiOverlayStyle(
//NOPE           statusBarColor: Colors.transparent,
//NOPE           statusBarIconBrightness: Theme.of(context).colorScheme.brightness == Brightness.dark ? Brightness.light : Brightness.dark,
//NOPE         ),
//NOPE         child: Scaffold(
//NOPE           body: Stack(
//NOPE             alignment: Alignment.topCenter,
//NOPE             children: [
//NOPE               SlidingUpPanel(
//NOPE                 parallaxEnabled: true,
//NOPE                 parallaxOffset: 0.6,
//NOPE                 color: Theme.of(context).colorScheme.surface,
//NOPE                 borderRadius: const BorderRadius.only(
//NOPE                   topLeft: Radius.circular(10),
//NOPE                   topRight: Radius.circular(10),
//NOPE                   bottomLeft: Radius.zero,
//NOPE                   bottomRight: Radius.zero,
//NOPE                 ),
//NOPE                 snapPoint: 0.55,
//NOPE                 minHeight: 85,
//NOPE                 maxHeight: availableHeightReduced(context),
//NOPE                 controller: panelController,
//NOPE                 onPanelSlide: (position) => onPanelSlide(position),
//NOPE                 header: RoutePanel(
//NOPE                   journey: globals.journey,
//NOPE                 ),
//NOPE                 panelBuilder: (ScrollController scrollController) => RouteBody(
//NOPE                   scrollController: scrollController,
//NOPE                   journey: globals.journey,
//NOPE                   zoomTo: zoomTo,
//NOPE                 ),
//NOPE                 body: HereMap(onMapCreated: _onMapCreated),
//NOPE               ),
//NOPE               Positioned(
//NOPE                 left: 10,
//NOPE                 bottom: panelButtonBottomOffset - 20,
//NOPE                 child: Opacity(
//NOPE                   opacity: getOpacity(_position),
//NOPE                   child: SvgPicture.asset(
//NOPE                     hereIcon(context),
//NOPE                     width: 50,
//NOPE                   ),
//NOPE                 ),
//NOPE               ),
//NOPE               Positioned(
//NOPE                 top: 0,
//NOPE                 child: Opacity(
//NOPE                   opacity: getAppBarOpacity(_position),
//NOPE                   child: Container(
//NOPE                     width: MediaQuery.of(context).size.width,
//NOPE                     color: Theme.of(context).colorScheme.surface,
//NOPE                     child: SafeArea(
//NOPE                       child: Container(
//NOPE                         margin: const EdgeInsets.only(top: 12, left: 73, bottom: 15),
//NOPE                         child: Text(
//NOPE                           AppLocalizations.of(context)!.route,
//NOPE                           style: TextStyle(fontWeight: FontWeight.w800, fontFamily: fontFamily, fontSize: 22),
//NOPE                         ),
//NOPE                       ),
//NOPE                     ),
//NOPE                   ),
//NOPE                 ),
//NOPE               ),
//NOPE               Positioned(
//NOPE                 top: 0,
//NOPE                 left: 0,
//NOPE                 child: SafeArea(
//NOPE                   child: Container(
//NOPE                     margin: const EdgeInsets.only(top: 10, left: 8, bottom: 15),
//NOPE                     width: 40,
//NOPE                     height: 40,
//NOPE                     child: Material(
//NOPE                       borderRadius: BorderRadius.circular(500),
//NOPE                       elevation: 4.0,
//NOPE                       shadowColor: Colors.black.withOpacity(getOpacity(_position)),
//NOPE                       color: Theme.of(context).colorScheme.surface,
//NOPE                       child: InkWell(
//NOPE                         borderRadius: BorderRadius.circular(500),
//NOPE                         onTap: () {
//NOPE                           Navigator.pop(context);
//NOPE                         },
//NOPE                         child: Icon(
//NOPE                           arrowBack,
//NOPE                           color: Theme.of(context).colorScheme.onSurface,
//NOPE                         ),
//NOPE                       ),
//NOPE                     ),
//NOPE                   ),
//NOPE                 ),
//NOPE               ),
//NOPE               if (journey['unique_id'] != null)
//NOPE                 Positioned(
//NOPE                   top: 0,
//NOPE                   right: _allowNavi ? saveButtonRightOffset : 0,
//NOPE                   child: SafeArea(
//NOPE                     child: Container(
//NOPE                       margin: const EdgeInsets.only(top: 10, right: 10, bottom: 15),
//NOPE                       width: 40,
//NOPE                       height: 40,
//NOPE                       child: Material(
//NOPE                         borderRadius: BorderRadius.circular(500),
//NOPE                         elevation: 4.0,
//NOPE                         shadowColor: Colors.black.withOpacity(getOpacity(_position)),
//NOPE                         color: Theme.of(context).colorScheme.surface,
//NOPE                         child: InkWell(
//NOPE                           borderRadius: BorderRadius.circular(500),
//NOPE                           child: isSavedJourney(journey['unique_id'])
//NOPE                               ? Icon(
//NOPE                                   NavikaIcons.saved,
//NOPE                                   color: Theme.of(context).colorScheme.onSurface,
//NOPE                                 )
//NOPE                               : Icon(
//NOPE                                   NavikaIcons.star,
//NOPE                                   color: Theme.of(context).colorScheme.onSurface,
//NOPE                                 ),
//NOPE                           onTap: () => saveJourney(journey['unique_id'], context),
//NOPE                           // onTap: () => save(context, journey),
//NOPE                         ),
//NOPE                       ),
//NOPE                     ),
//NOPE                   ),
//NOPE                 ),
//NOPE                 Positioned(
//NOPE                 top: 60,
//NOPE                 right: 0,
//NOPE                 child: Opacity(
//NOPE                   opacity: getOpacity(_position),
//NOPE                   child: AnimatedOpacity(
//NOPE                     // If the widget is visible, animate to 0.0
//NOPE                     // If the widget is hidden, animate to 1.0 
//NOPE                     opacity: (bearing != 0) ? 1.0 : 0.0,
//NOPE                     duration: const Duration(milliseconds: 500),
//NOPE                     child: SafeArea(
//NOPE                       child: Container(
//NOPE                         margin: const EdgeInsets.only(top: 10, right: 8),
//NOPE                         width: 45,
//NOPE                         height: 45,
//NOPE                         child: Material(
//NOPE                           borderRadius: BorderRadius.circular(500),
//NOPE                           elevation: 4.0,
//NOPE                           shadowColor: Colors.black.withOpacity(getOpacity(_position)),
//NOPE                           color: Theme.of(context).colorScheme.onSecondaryContainer,
//NOPE                           child: InkWell(
//NOPE                             borderRadius: BorderRadius.circular(500),
//NOPE                             onTap: () {
//NOPE                               setBearing(0);
//NOPE                             },
//NOPE                             child: Transform.rotate(
//NOPE                               angle: -(bearing * (math.pi / 180)),
//NOPE                               child: Icon(
//NOPE                                 NavikaIcons.north,
//NOPE                                 color: Theme.of(context).colorScheme.onSurface,
//NOPE                               ),
//NOPE                             ),
//NOPE                           ),
//NOPE                         ),
//NOPE                       ),
//NOPE                     ),
//NOPE                   ),
//NOPE                 ),
//NOPE               ),
//NOPE               Positioned(
//NOPE                 right: 15,
//NOPE                 bottom: panelButtonBottomOffset + 22,
//NOPE                 child: Opacity(
//NOPE                   opacity: getOpacity(_position),
//NOPE                   child: FloatingActionButton(
//NOPE                     backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
//NOPE                     child: getLocationIcon(),
//NOPE                     onPressed: () {
//NOPE                       _zoomOn();
//NOPE                       closePanel();
//NOPE                     },
//NOPE                   ),
//NOPE                 ),
//NOPE               ),
//NOPE               if (_allowNavi)
//NOPE                 Positioned(
//NOPE                   right: 15,
//NOPE                   bottom: panelButtonBottomOffset - 47,
//NOPE                   child: Center(
//NOPE                     child: FloatingActionButton(
//NOPE                       backgroundColor: const Color(0xff1f8837),
//NOPE                       child: const Icon(NavikaIcons.navi, color: Colors.white, size: 30),
//NOPE                       onPressed: () {
//NOPE                         NavikaAppNavigator.startNavi(context);
//NOPE                         panelController.animatePanelToSnapPoint();
//NOPE                       },
//NOPE                     ),
//NOPE                   ),
//NOPE                 ),
//NOPE             ],
//NOPE           ),
//NOPE         ),
//NOPE       );
//NOPE 
//NOPE   @override
//NOPE   void initState() {
//NOPE     super.initState();
//NOPE     WidgetsBinding.instance.addPostFrameCallback((_) {
//NOPE       _getInBox();
//NOPE       panelController.animatePanelToSnapPoint();
//NOPE       _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
//NOPE         _getInBox();
//NOPE       });
//NOPE     });
//NOPE   }
//NOPE 
//NOPE   @override
//NOPE   void dispose() async {
//NOPE     super.dispose();
//NOPE     _timer.cancel();
//NOPE   }
//NOPE 
//NOPE   void _getInBox() {
//NOPE     if (position != null) {
//NOPE       GeoCoordinates geoCoords = GeoCoordinates(position!.latitude, position!.longitude);
//NOPE       setState(() {
//NOPE         _isInBox = _controller?.isOverLocation(geoCoords) ?? false;
//NOPE         bearing = _controller?.getBearing() ?? 0;
//NOPE         if (bearing < 1 || bearing > 359) {
//NOPE           bearing = 0;
//NOPE         }
//NOPE       });
//NOPE     }
//NOPE   }
//NOPE 
//NOPE   void setBearing(double bearing) {
//NOPE     _controller?.setBearing(bearing);
//NOPE   }
//NOPE 
//NOPE   void _onMapCreated(HereMapController hereMapController) {
//NOPE     //THEME
//NOPE     MapScheme mapScheme = Brightness.dark == Theme.of(context).colorScheme.brightness ? MapScheme.normalNight : MapScheme.normalDay;
//NOPE 
//NOPE     hereMapController.mapScene.loadSceneForMapScheme(mapScheme, (MapError? error) {
//NOPE       if (error != null) {
//NOPE         return;
//NOPE       }
//NOPE 
//NOPE       _controller = HereController(hereMapController);
//NOPE       _getLocation();
//NOPE 
//NOPE       GeoCoordinates geoCoords;
//NOPE       //double distanceToEarthInMeters = 100000;
//NOPE       geoCoords = getCenterPoint(getFromCoords()['lat'], getFromCoords()['lon'], getToCoords()['lat'], getToCoords()['lon']);
//NOPE 
//NOPE       double distanceToEarthInMeters = getDistance(getFromCoords()['lat'], getFromCoords()['lon'], getToCoords()['lat'], getToCoords()['lon']);
//NOPE 
//NOPE       MapMeasure mapMeasureZoom = MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);
//NOPE       hereMapController.camera.lookAtPointWithMeasure(geoCoords, mapMeasureZoom);
//NOPE 
//NOPE       _createGeoJson(context, journey);
//NOPE     });
//NOPE   }
//NOPE 
//NOPE   void _addLocationIndicator(Position position, [isActive = true, zoomAuto = true]) {
//NOPE     if (mounted) {
//NOPE       _controller?.addLocationIndicator(position, LocationIndicatorIndicatorStyle.pedestrian, compass, isActive, zoomAuto);
//NOPE     }
//NOPE   }
//NOPE 
//NOPE   void _updateLocationIndicator(Position position) async {
//NOPE     _controller?.updateLocationIndicator(position, compass);
//NOPE   }
//NOPE 
//NOPE   void _updateCompass(CompassEvent compassEvent) {
//NOPE     var heading = compassEvent.heading ?? 0;
//NOPE     if (mounted) {
//NOPE       setState(() {
//NOPE         compass = heading;
//NOPE       });
//NOPE     }
//NOPE 
//NOPE     if (is3dMap && !isPanned) {
//NOPE       // si on a touché l'écran
//NOPE       if (position != null) {
//NOPE         _controller?.zoomOnLocationIndicator(is3dMap, position!, compass);
//NOPE       }
//NOPE     }
//NOPE     _controller?.updateLocationIndicator(position, heading);
//NOPE   }
//NOPE 
//NOPE   void _zoomOn() {
//NOPE     if (globals.position != null) {
//NOPE       GeoCoordinates geoCoords = GeoCoordinates(globals.position?.latitude ?? 0, globals.position?.longitude ?? 0);
//NOPE       var isOverLocation = _controller?.isOverLocation(geoCoords) ?? false;
//NOPE       if (isOverLocation) {
//NOPE         setState(() {
//NOPE           is3dMap = !is3dMap;
//NOPE           isPanned = false;
//NOPE         });
//NOPE       }
//NOPE       _controller?.zoomOnLocationIndicator(is3dMap, globals.position!, compass);
//NOPE     }
//NOPE   }
//NOPE 
//NOPE   void zoomTo(double lat, double lon) {
//NOPE     GeoCoordinatesUpdate geoCoords = GeoCoordinatesUpdate(lat, lon);
//NOPE     _controller?.zoomTo(geoCoords);
//NOPE     panelController.animatePanelToSnapPoint();
//NOPE   }
//NOPE 
//NOPE   void onPanelSlide(position) {
//NOPE     setState(() {
//NOPE       panelButtonBottomOffset = panelButtonBottomOffsetClosed + ((MediaQuery.of(context).size.height - 180) * position);
//NOPE       saveButtonRightOffset = position > 0.55 ? (145 * (position - 0.55)).toDouble() : 0;
//NOPE       _position = position;
//NOPE     });
//NOPE   }
//NOPE 
//NOPE   void tooglePanel() {
//NOPE     if (panelController.isPanelOpen) {
//NOPE       panelController.close();
//NOPE     } else {
//NOPE       panelController.open();
//NOPE     }
//NOPE   }
//NOPE 
//NOPE   void closePanel() {
//NOPE     panelController.close();
//NOPE   }
//NOPE }
