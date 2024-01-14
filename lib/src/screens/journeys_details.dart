import 'dart:async';

import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:location/location.dart' as gps;
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:navika/src/data.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/route/body.dart';
import 'package:navika/src/widgets/route/header.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_compass/flutter_compass.dart';

import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/controller/here_map_controller.dart';
import 'package:navika/src/style/style.dart';

void saveJourney(String uniqueId, context) {
  List journeys = globals.hiveBox.get('journeys');
  
  if (isSavedJourney(uniqueId)){
    journeys.removeWhere((element) => element['unique_id'] == uniqueId);
    FloatingSnackBar(
      message: 'Itinéraire retiré.',
      context: context,
      textColor: mainColor(context),
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: const Color(0xff272727),
    );
  } else {
    journeys.add(globals.journey);
    FloatingSnackBar(
      message: 'Itinéraire enregistré, les détails sont désormais disponibles même hors connexion.',
      context: context,
      textColor: mainColor(context),
      textStyle: snackBarText,
      duration: const Duration(milliseconds: 4000),
      backgroundColor: const Color(0xff272727),
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

Map? getSavedJourney(String uniqueId) {
  List journeys = globals.hiveBox.get('journeys');
  for (var journey in journeys) {
    if (journey['unique_id'] == uniqueId) {
      return journey;
    }
  }
  return null;
}

List sortJourneys(List journeys) {
  journeys.sort((a, b) {
    DateTime aDt = DateTime.parse(a['departure_date_time']);
    DateTime bDt = DateTime.parse(b['departure_date_time']);
    return aDt.compareTo(bDt);
  });

  return journeys;
}

List getFutureJourneys(List journeys) {
  List futureJourneys = [];
  for (var journey in journeys) {
    if (DateTime.parse(journey['arrival_date_time']).isAfter(DateTime.now())) {
      futureJourneys.add(journey);
    }
  }
  return futureJourneys;
}

List getPastJourneys(List journeys) {
  List futureJourneys = [];
  for (var journey in journeys) {
    if (DateTime.parse(journey['arrival_date_time']).isBefore(DateTime.now())) {
      futureJourneys.add(journey);
    }
  }
  return futureJourneys;
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
  gps.Location location = gps.Location();

  CompassEvent? compassEvent;
  double compassHeading = 0;

  bool isPanned = false;
  bool is3dMap = false;
  bool _isInBox = false;
  late Timer _timer;

  double panelButtonBottomOffsetClosed = 120;
  double panelButtonBottomOffset = 120;
  double _position = 0;
  Map journey = globals.journey;

  Map getToCoords() {
    return journey['sections'][0]['from']['coord'];
  }

  Map getFromCoords() {
    return journey['sections'][journey['sections'].length - 1]['to']['coord'];
  }

  void _createGeoJson(Map journey) {
    for (var section in journey['sections']) {
      if (section['geojson'] != null) {
        _createPolylines(section['geojson'],
            getLineWidthByType(section['type']), getColorByType(section));
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
    if (section['informations'] != null &&
        section['informations']['line']['id'] != null) {
      GeoCoordinates stopCoords = GeoCoordinates(
        section['geojson']['coordinates'][0][1].toDouble(),
        section['geojson']['coordinates'][0][0].toDouble(),
      );
      Metadata metadata = Metadata();

      _controller?.addMapMarker(
        stopCoords,
        getIconLine(context, LINES.getLinesById(section['informations']['line']['id'])),
        metadata,
      );
    }
  }

  void _createPolylines(Map geojson, double width, Color lineColor) {
    List<GeoCoordinates> coordinates = [];

    for (var coords in geojson['coordinates']) {
      coordinates.add(GeoCoordinates(coords[1], coords[0]));
    }

    GeoPolyline geoPolyline = GeoPolyline(coordinates);
    //MapPolyline mapPolyline = MapPolyline(geoPolyline, width, lineColor);
    MapPolyline mapPolyline = MapPolyline.withRepresentation(
      geoPolyline,
      MapPolylineSolidRepresentation(
          MapMeasureDependentRenderSize.withSingleSize(
              RenderSizeUnit.pixels, width),
          lineColor,
          LineCap.round),
    );

    _controller?.addMapPolylines(mapPolyline);
  }

  Future<void> _getLocation(isResume) async {
    bool serviceEnabled;
    gps.LocationData locationData;

    bool? allowGps = await globals.hiveBox?.get('allowGps');
    if (allowGps == false) {
      return;
    }

    if (!globals.isSetLocation) {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }
    } 

    locationData = await location.getLocation();
    camGeoCoords = GeoCoordinates(locationData.latitude ?? 0, locationData.longitude ?? 0);
      
    FlutterCompass.events?.listen((CompassEvent compassEvent) {
      _updateCompass(compassEvent);
    });
    if (!isResume) {
      _addLocationIndicator(locationData);
    }
    location.onLocationChanged.listen((gps.LocationData currentLocation) {
      _updateLocationIndicator(currentLocation);
    });
  }

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              Theme.of(context).colorScheme.brightness == Brightness.dark
                  ? Brightness.light
                  : Brightness.dark,
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
                maxHeight: MediaQuery.of(context).size.height - 80,
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
                        child: const Text(
                          'Itinéraire',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Segoe Ui',
                              fontSize: 22),
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
                      shadowColor:
                          Colors.black.withOpacity(getOpacity(_position)),
                      color: Theme.of(context).colorScheme.surface,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(500),
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back, 
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
                  right: 0,
                  child: SafeArea(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, right: 8, bottom: 15),
                      width: 40,
                      height: 40,
                      child: Material(
                        borderRadius: BorderRadius.circular(500),
                        elevation: 4.0,
                        shadowColor:
                            Colors.black.withOpacity(getOpacity(_position)),
                        color: Theme.of(context).colorScheme.surface,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(500),
                          onTap: () => saveJourney(journey['unique_id'], context),
                          child: isSavedJourney(journey['unique_id']) ? Icon(
                            NavikaIcons.saved, 
                            color: Theme.of(context).colorScheme.onSurface,
                          )
                          : Icon(
                            NavikaIcons.save, 
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Positioned(
                right: 20,
                bottom: panelButtonBottomOffset,
                child: Opacity(
                  opacity: getOpacity(_position),
                  child: FloatingActionButton(
                    backgroundColor:
                        Theme.of(context).colorScheme.onSecondaryContainer,
                    child: _isInBox
                        ? Icon(NavikaIcons.localisation,
                            color: Theme.of(context).colorScheme.onSurface, size: 30)
                        : Icon(NavikaIcons.localisationNull,
                            color: Theme.of(context).colorScheme.onSurface, size: 30),
                    onPressed: () {
                      _zoomOn();
                      closePanel();
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
    GeoCoordinates geoCoords = GeoCoordinates(
        globals.locationData?.latitude ?? 0,
        globals.locationData?.longitude ?? 0);
    isInBox = _controller?.isOverLocation(geoCoords) ?? false;
    setState(() {
      _isInBox = isInBox;
    });
  }

  void _onMapCreated(HereMapController hereMapController) {
    //THEME
    MapScheme mapScheme = Brightness.dark == Theme.of(context).colorScheme.brightness
            ? MapScheme.normalNight
            : MapScheme.normalDay;

    hereMapController.mapScene.loadSceneForMapScheme(mapScheme,(MapError? error) {
      if (error != null) {
        return;
      }

      _controller = HereController(hereMapController);
      _getLocation(globals.isSetLocation);

      GeoCoordinates geoCoords;
      //double distanceToEarthInMeters = 100000;
      geoCoords = getCenterPoint(
        getFromCoords()['lat'], 
        getFromCoords()['lon'],
        getToCoords()['lat'], 
        getToCoords()['lon']
      );

      double distanceToEarthInMeters = getDistance(
        getFromCoords()['lat'],
        getFromCoords()['lon'],
        getToCoords()['lat'],
        getToCoords()['lon']
      );

      MapMeasure mapMeasureZoom =MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);
      hereMapController.camera.lookAtPointWithMeasure(geoCoords, mapMeasureZoom);

      _controller?.addLocationIndicator(
        globals.locationData,
        LocationIndicatorIndicatorStyle.pedestrian,
        globals.compassHeading,
        false,
        false,
      );

      _createGeoJson(journey);
    });
  }

  void _addLocationIndicator(gps.LocationData locationData) {
    _controller?.addLocationIndicator(
        locationData,
        LocationIndicatorIndicatorStyle.pedestrian,
        globals.compassHeading,
        false);
  }

  void _updateLocationIndicator(gps.LocationData locationData) {
    _controller?.updateLocationIndicator(locationData, globals.compassHeading);
  }

  void _updateCompass(CompassEvent compassEvent) {
    var heading = compassEvent.heading ?? 0;
    if (mounted) {
      setState(() {
        compassHeading = heading;
      });
    }
    globals.compassHeading = heading;

    if (is3dMap) {
      if (!isPanned) {
        // si on a touché l'écran
        _controller?.zoomOnLocationIndicator(is3dMap);
      }
    }
    _controller?.updateLocationIndicator(globals.locationData, heading);
  }

  void _zoomOn() {
    GeoCoordinates geoCoords = GeoCoordinates(
        globals.locationData?.latitude ?? 0,
        globals.locationData?.longitude ?? 0);
    var isOverLocation = _controller?.isOverLocation(geoCoords) ?? false;
    if (isOverLocation) {
      setState(() {
        is3dMap = !is3dMap;
        isPanned = false;
      });
    }
    _controller?.zoomOnLocationIndicator(is3dMap);
  }

  void zoomTo(double lat, double lon) {
    GeoCoordinatesUpdate geoCoords = GeoCoordinatesUpdate(lat, lon);
    _controller?.zoomTo(geoCoords);
    panelController.animatePanelToSnapPoint();
  }

  void onPanelSlide(position) {
    setState(() {
      panelButtonBottomOffset = panelButtonBottomOffsetClosed +
          ((MediaQuery.of(context).size.height - 180) * position);
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
