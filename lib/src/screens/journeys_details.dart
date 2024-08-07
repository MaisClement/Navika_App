// 🎯 Dart imports:
import 'dart:async';

// 🐦 Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 📦 Package imports:
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// 🌎 Project imports:
import 'package:navika/src/controller/here_map_controller.dart';
import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/icon.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/screens/home.dart';
import 'package:navika/src/screens/navigator.dart';
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

void save(BuildContext context, journey) {
  if (isSavedJourney(journey['unique_id'])) {
    saveJourney(journey['unique_id'], context);
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
  //DISABLED bool? allowGps = globals.hiveBox?.get('allowGps');
  //DISABLED if (allowGps == false) {
  //DISABLED   return false;
  //DISABLED }
  //DISABLED if (isInPast(journey['arrival_date_time'])) {
  //DISABLED   return false;
  //DISABLED }
  //DISABLED if (getTimeDifference(journey['departure_date_time']) > 120) {
  //DISABLED   return false;
  //DISABLED }
  //DISABLED
  //DISABLED return true;
}

class JourneysDetails extends StatefulWidget {
  const JourneysDetails({super.key});

  @override
  State<JourneysDetails> createState() => _JourneysDetailsState();
}

class _JourneysDetailsState extends State<JourneysDetails> {
  HereController? _controller;
  PanelController panelController = PanelController();

  GeoCoordinates camGeoCoords = GeoCoordinates(0, 0);

  PositionState state = PositionState.unknown;
  Position? position;
  StreamSubscription<Position>? positionStream;

  CompassEvent? compassEvent;
  double compass = 0;

  bool isPanned = false;
  bool is3dMap = false;
  bool _isInBox = false;
  final bool _allowNavi = allowNavi(globals.journey);
  late Timer _timer;

  double panelButtonBottomOffsetClosed = 110;
  double panelButtonBottomOffset = 120;
  double saveButtonRightOffset = 0;
  double _position = 0;

  Map journey = globals.journey;

  Map getToCoords() {
    return journey['sections'][0]['from']['coord'];
  }

  Map getFromCoords() {
    return journey['sections'][journey['sections'].length - 1]['to']['coord'];
  }

  void _createGeoJson(BuildContext context, Map journey) {
    for (var section in journey['sections']) {
      if (section['geojson'] != null) {
        _createPolylines(section['geojson'], getLineWidthByType(section['type']), getColorByType(context, section));
      }
    }
    for (var section in journey['sections']) {
      if (section['geojson'] != null) {
        try {
          _addLineMarker(section);
        } catch (e) {
          // print({'INFO_', e});
        }
      }
    }
  }

  void _addLineMarker(section) {
    if (section['informations'] != null && section['informations']['line']['id'] != null) {
      GeoCoordinates stopCoords = GeoCoordinates(
        section['geojson']['coordinates'][0][1].toDouble(),
        section['geojson']['coordinates'][0][0].toDouble(),
      );
      _controller!.addMapWidget(
          Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                  top: 2,
                  bottom: 2,
                ),
                child: Icones(
                    line: section['informations']['line'],
                    prevLine: section['informations']['line'],
                    i: 0,
                    brightness: Theme.of(context).colorScheme.brightness),
              )),
          stopCoords);
    }
  }

  void _createPolylines(Map geojson, double width, Color lineColor) {
    List<GeoCoordinates> coordinates = [];

    for (var coords in geojson['coordinates']) {
      coordinates.add(GeoCoordinates(coords[1], coords[0]));
    }

    GeoPolyline geoPolyline = GeoPolyline(coordinates);
    MapPolyline mapPolyline = MapPolyline.withRepresentation(
      geoPolyline,
      MapPolylineSolidRepresentation(
        MapMeasureDependentRenderSize.withSingleSize(RenderSizeUnit.pixels, width),
        lineColor,
        LineCap.round,
      ),
    );

    _controller?.addMapPolylines(mapPolyline);
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
    );

    bool askGps = await globals.hiveBox?.get('askGps') ?? false;
    bool allowGps = await globals.hiveBox?.get('allowGps') ?? false;
    if (!askGps) {
      RouteStateScope.of(context).go('/position');
      state = PositionState.permissionDenied;
      return;
    }
    if (!allowGps) {
      state = PositionState.permissionDenied;
      return;
    }

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      state = PositionState.servicesDisabled;
      return;
    }

    // Check if app we have location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever || permission == LocationPermission.denied) {
      RouteStateScope.of(context).go('/position');
      state = PositionState.permissionDenied;
      return;
    }

    // Check if we have a recent position
    state = PositionState.acquiring;

    Position? lastKnownLocation = await Geolocator.getLastKnownPosition();
    if (lastKnownLocation != null) {
      position = lastKnownLocation;
      _addLocationIndicator(lastKnownLocation, false, false);
    } else {
      position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      if (position != null) {
        _addLocationIndicator(position!, true, false);
      }
    }
    state = PositionState.defined;

    if (position != null) {
      camGeoCoords = GeoCoordinates(position!.latitude, position!.longitude);
    }

    if (mounted) {
      positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen((Position? newPosition) {
        if (mounted) {
          setState(() {
            position = newPosition;
          });
        }
        _updateLocationIndicator(newPosition!);
      });
      FlutterCompass.events?.listen((CompassEvent compassEvent) {
        _updateCompass(compassEvent);
      });
    }
  }

  Icon getLocationIcon() {
    IconData icon = NavikaIcons.localisationNull;

    switch (state) {
      case PositionState.defined:
        if (_isInBox) {
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

    return Icon(icon, color: Theme.of(context).colorScheme.onSurface, size: 30);
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Theme.of(context).colorScheme.brightness == Brightness.dark ? Brightness.light : Brightness.dark,
        ),
        child: Scaffold(
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              SlidingUpPanel(
                parallaxEnabled: true,
                parallaxOffset: 0.6,
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
                snapPoint: 0.55,
                minHeight: 85,
                maxHeight: availableHeightReduced(context),
                controller: panelController,
                onPanelSlide: (position) => onPanelSlide(position),
                header: RoutePannel(
                  journey: globals.journey,
                ),
                panelBuilder: (ScrollController scrollController) => RouteBody(
                  scrollController: scrollController,
                  journey: globals.journey,
                  zoomTo: zoomTo,
                ),
                body: HereMap(onMapCreated: _onMapCreated),
              ),
              Positioned(
                left: 10,
                bottom: panelButtonBottomOffset - 20,
                child: Opacity(
                  opacity: getOpacity(_position),
                  child: SvgPicture.asset(
                    hereIcon(context),
                    width: 50,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Opacity(
                  opacity: getAppBarOpacity(_position),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).colorScheme.surface,
                    child: SafeArea(
                      child: Container(
                        margin: const EdgeInsets.only(top: 12, left: 73, bottom: 15),
                        child: Text(
                          AppLocalizations.of(context)!.route,
                          style: TextStyle(fontWeight: FontWeight.w600, fontFamily: fontFamily, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: SafeArea(
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, left: 8, bottom: 15),
                    width: 40,
                    height: 40,
                    child: Material(
                      borderRadius: BorderRadius.circular(500),
                      elevation: 4.0,
                      shadowColor: Colors.black.withOpacity(getOpacity(_position)),
                      color: Theme.of(context).colorScheme.surface,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(500),
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
              if (journey['unique_id'] != null)
                Positioned(
                  top: 0,
                  right: _allowNavi ? saveButtonRightOffset : 0,
                  child: SafeArea(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, right: 10, bottom: 15),
                      width: 40,
                      height: 40,
                      child: Material(
                        borderRadius: BorderRadius.circular(500),
                        elevation: 4.0,
                        shadowColor: Colors.black.withOpacity(getOpacity(_position)),
                        color: Theme.of(context).colorScheme.surface,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(500),
                          child: isSavedJourney(journey['unique_id'])
                              ? Icon(
                                  NavikaIcons.saved,
                                  color: Theme.of(context).colorScheme.onSurface,
                                )
                              : Icon(
                                  NavikaIcons.star,
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                          onTap: () => saveJourney(journey['unique_id'], context),
                          //TODO onTap: () => save(context, journey),
                        ),
                      ),
                    ),
                  ),
                ),
              Positioned(
                right: 15,
                bottom: panelButtonBottomOffset + 22,
                child: Opacity(
                  opacity: getOpacity(_position),
                  child: FloatingActionButton(
                    backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                    child: getLocationIcon(),
                    onPressed: () {
                      _zoomOn();
                      closePanel();
                    },
                  ),
                ),
              ),
              if (_allowNavi)
                Positioned(
                  right: 15,
                  bottom: panelButtonBottomOffset - 47,
                  child: Center(
                    child: FloatingActionButton(
                      backgroundColor: const Color(0xff1f8837),
                      child: const Icon(NavikaIcons.navi, color: Colors.white, size: 30),
                      onPressed: () {
                        NavikaAppNavigator.startNavi(context);
                        panelController.animatePanelToSnapPoint();
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getInBox();
      panelController.animatePanelToSnapPoint();
      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        _getInBox();
      });
    });
  }

  @override
  void dispose() async {
    super.dispose();
    _timer.cancel();
  }

  void _getInBox() {
    bool isInBox;
    GeoCoordinates geoCoords = GeoCoordinates(globals.position?.latitude ?? 0, globals.position?.longitude ?? 0);
    isInBox = _controller?.isOverLocation(geoCoords) ?? false;
    setState(() {
      _isInBox = isInBox;
    });
  }

  void _onMapCreated(HereMapController hereMapController) {
    //THEME
    MapScheme mapScheme = Brightness.dark == Theme.of(context).colorScheme.brightness ? MapScheme.normalNight : MapScheme.normalDay;

    hereMapController.mapScene.loadSceneForMapScheme(mapScheme, (MapError? error) {
      if (error != null) {
        return;
      }

      _controller = HereController(hereMapController);
      _getLocation();

      GeoCoordinates geoCoords;
      //double distanceToEarthInMeters = 100000;
      geoCoords = getCenterPoint(getFromCoords()['lat'], getFromCoords()['lon'], getToCoords()['lat'], getToCoords()['lon']);

      double distanceToEarthInMeters = getDistance(getFromCoords()['lat'], getFromCoords()['lon'], getToCoords()['lat'], getToCoords()['lon']);

      MapMeasure mapMeasureZoom = MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);
      hereMapController.camera.lookAtPointWithMeasure(geoCoords, mapMeasureZoom);

      _createGeoJson(context, journey);
    });
  }

  void _addLocationIndicator(Position position, [isActive = true, zoomAuto = true]) {
    if (mounted) {
      _controller?.addLocationIndicator(position, LocationIndicatorIndicatorStyle.pedestrian, compass, isActive, zoomAuto);
    }
  }

  void _updateLocationIndicator(Position position) async {
    _controller?.updateLocationIndicator(position, compass);
  }

  void _updateCompass(CompassEvent compassEvent) {
    var heading = compassEvent.heading ?? 0;
    if (mounted) {
      setState(() {
        compass = heading;
      });
    }

    if (is3dMap && !isPanned) {
      // si on a touché l'écran
      if (position != null) {
        _controller?.zoomOnLocationIndicator(is3dMap, position!, compass);
      }
    }
    _controller?.updateLocationIndicator(position, heading);
  }

  void _zoomOn() {
    if (globals.position != null) {
      GeoCoordinates geoCoords = GeoCoordinates(globals.position?.latitude ?? 0, globals.position?.longitude ?? 0);
      var isOverLocation = _controller?.isOverLocation(geoCoords) ?? false;
      if (isOverLocation) {
        setState(() {
          is3dMap = !is3dMap;
          isPanned = false;
        });
      }
      _controller?.zoomOnLocationIndicator(is3dMap, globals.position!, compass);
    }
  }

  void zoomTo(double lat, double lon) {
    GeoCoordinatesUpdate geoCoords = GeoCoordinatesUpdate(lat, lon);
    _controller?.zoomTo(geoCoords);
    panelController.animatePanelToSnapPoint();
  }

  void onPanelSlide(position) {
    setState(() {
      panelButtonBottomOffset = panelButtonBottomOffsetClosed + ((MediaQuery.of(context).size.height - 180) * position);
      saveButtonRightOffset = position > 0.55 ? (145 * (position - 0.55)).toDouble() : 0;
      _position = position;
    });
  }

  void tooglePanel() {
    if (panelController.isPanelOpen) {
      panelController.close();
    } else {
      panelController.open();
    }
  }

  void closePanel() {
    panelController.close();
  }
}
