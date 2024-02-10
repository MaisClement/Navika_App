import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:here_sdk/gestures.dart';
import 'package:location/location.dart' as gps;
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/screens/journeys.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/address/body.dart';
import 'package:navika/src/widgets/address/header.dart';
import 'package:navika/src/widgets/bike/body.dart';
import 'package:navika/src/widgets/bike/header.dart';
import 'package:navika/src/widgets/map/icone.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_compass/flutter_compass.dart';

import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/controller/here_map_controller.dart';

import 'package:navika/src/widgets/home/body.dart';
import 'package:navika/src/widgets/home/header.dart';
import 'package:navika/src/widgets/schedules/body.dart';
import 'package:navika/src/widgets/schedules/header.dart';

class Home extends StatefulWidget {
  final String? displayType;
  final String? id;

  const Home({
    this.displayType,
    this.id,
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HereController? _controller;
  PanelController panelController = PanelController();

  GeoCoordinates camGeoCoords = GeoCoordinates(0, 0);
  gps.Location location = gps.Location();

  late StreamSubscription<ConnectivityResult> connection;

  CompassEvent? compassEvent;
  double compassHeading = 0;

  bool isPanned = false;
  bool is3dMap = false;
  bool _isInBox = false;
  late Timer _timer;
  bool isConnected = true;

  double panelButtonBottomOffsetClosed = 120;
  double panelButtonBottomOffset = 120;
  double _position = 0;

  GeoCoordinates _oldcamGeoCoords = GeoCoordinates(0, 0);
  ScreenshotController screenshotController = ScreenshotController(); 

  Map markersList = {}; //Update List<WidgetPin> markers = [];
  MapMarker? pointMarker;
  Map index = {};
  List favs = globals.hiveBox?.get('stopsFavorites');
  List address = globals.hiveBox?.get('addressFavorites');
  List lines = globals.hiveBox?.get('linesFavorites');
  List journeys = getFutureJourneys( sortJourneys( globals.hiveBox?.get('journeys') ) );
  List blocks = globals.hiveBox?.get('homeOrder');
  List trafic = [];

  Future<void> _getLocation(isResume) async {
    bool serviceEnabled;
    gps.LocationData locationData;

    bool? askGps = await globals.hiveBox?.get('askGps');
    bool? allowGps = await globals.hiveBox?.get('allowGps');
    if (askGps == false) {
      RouteStateScope.of(context).go('/position');
      return;
    }

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
    await _getNearPoints();
  }

  Future<void> _getNearPoints() async {
    double zoom = _controller?.getZoomLevel() ?? 0;

    if (_oldcamGeoCoords == camGeoCoords) {
      return;
    }
    _oldcamGeoCoords = camGeoCoords;

    List bikeNearby = [];
    List stopsNearby = [];
    List areaNearby = [];

    if (zoom < 200000) {
      NavikaApi navikaApi = NavikaApi();
      Map result = await navikaApi.getNearPoints(zoom, camGeoCoords);

      if (result['status'] == ApiStatus.ok && mounted) {
        setState(() {
          if (result['value']?['stops'] != null) {
            stopsNearby = result['value']?['stops'];
          } else {
            stopsNearby = [];
          }

          if (result['value']?['area'] != null) {
            areaNearby = result['value']?['area'];
          } else {
            areaNearby = [];
          }
          
          if (result['value']?['bike'] != null) {
            bikeNearby = result['value']?['bike'];
          } else {
            bikeNearby = [];
          }
        });
      }
      setState(() {
        markersList = _setMarker(markersList, bikeNearby, stopsNearby, areaNearby);
      });
    } else {
      _clearMarker(markersList);
      setState(() {
        markersList = {};
      });
    }
  }

  void _clearMarker(Map markers) {
    markers.forEach((key, value) {
      if (value is MapMarker) {
        _controller?.removeMapMarker(value);
      }
    });
  }

  void _removePointMarker() {
    if (pointMarker != null) {
      _controller?.removeMapMarker(pointMarker!);
    }
  }

  Map _setMarker(Map markers, List bikeNearby, List stopsNearby, List areaNearby) {
    Map newMarkers = Map.from(markers);

    for (var bike in bikeNearby) {
      GeoCoordinates bikeCoords = GeoCoordinates(bike['coord']['lat'].toDouble(), bike['coord']['lon'].toDouble());
    
      if (_controller?.isOverLocation(bikeCoords) == true) {
        Metadata metadata = Metadata();
        metadata.setString('type', 'bike');
        metadata.setString('id', bike['id']);
        metadata.setString('name', bike['name']);
        metadata.setInteger('capacity', bike['capacity']);
        metadata.setDouble('lat', bike['coord']['lat']);
        metadata.setDouble('lon', bike['coord']['lon']);
    
        MarkerMode mode = getMarkerMode(['bike']);
        double zoom = _controller?.getZoomLevel() ?? 1000;
        MarkerSize size = getMarkerSize(mode, zoom);
    
        if (size != MarkerSize.hidden) {
          if (newMarkers[bike['id']] == null) {
            newMarkers[bike['id']] = _controller?.addMapMarker(
                bikeCoords,
                getMarkerImageByType(mode, size, context),
                metadata,
                getSizeForMarker(size)
              );
          } else {
            markers.remove(bike['id']);
            newMarkers.remove(bike['id']);
          }
        }
      }
    }

    for (var stop in stopsNearby) {
      GeoCoordinates stopCoords = GeoCoordinates(stop['coord']['lat'].toDouble(), stop['coord']['lon'].toDouble());

      if (_controller?.isOverLocation(stopCoords) == true) {
        Metadata metadata = Metadata();
        metadata.setString('type', 'stop');
        metadata.setString('id', stop['id']);
        metadata.setString('name', stop['name']);
        metadata.setString('modes', json.encode(stop['modes']));
        metadata.setDouble('lat', stop['coord']['lat'].toDouble());
        metadata.setDouble('lon', stop['coord']['lon'].toDouble());

        MarkerMode mode = getMarkerMode(stop['modes']);
        double zoom = _controller?.getZoomLevel() ?? 1000;
        MarkerSize size = getMarkerSize(mode, zoom);

        String id = '${stop['id']}_${size.toString()}';

        if (size != MarkerSize.hidden) {
          if (newMarkers[id] == null) {
            newMarkers[id] = _controller?.addMapMarker(
              stopCoords,
              getMarkerImageByType(mode, size, context),
              metadata,
              getSizeForMarker(size)
            );
          } else {
            markers.remove(id);
          }
        }
      }
    }

    for (var area in areaNearby) {
      area['stops'].forEach((stop) {
        GeoCoordinates stopCoords = GeoCoordinates(stop['coord']['lat'].toDouble(), stop['coord']['lon'].toDouble());

        Metadata metadata = Metadata();
        metadata.setString('type', 'stop');
        metadata.setString('id', stop['id']);
        metadata.setString('name', stop['name']);
        metadata.setString('modes', json.encode(stop['modes']));
        metadata.setDouble('lat', stop['coord']['lat'].toDouble());
        metadata.setDouble('lon', stop['coord']['lon'].toDouble());

        if (newMarkers[stop['id']] == null) {
          screenshotController.captureFromWidget(
              MapIcone(
                stop: stop,
                update: () {},
              ),
              delay: const Duration(milliseconds: 0)
            )
            .then((capturedImage) {
              newMarkers[stop['id']] = _controller?.addMapImage(
                stopCoords,
                capturedImage,
                metadata);
            }
          );
        } else {
          markers.remove(stop['id']);
        }        
      });
    }

    markers.forEach((key, value) {
      if (value is MapMarker) {
        _controller?.removeMapMarker(value);
      }
      newMarkers.remove(key);
    });

    return newMarkers;
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

  Future<void> _getTrafic() async {
    if (lines.isEmpty) {
      return;
    }

    List list = [];
    for (var fav in lines) {
      list.add(fav['id']);
    }

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getTrafic(list);

    if (mounted) {
      if (result['value']?['trafic'] != null) {
        setState(() {
          trafic = result['value']?['trafic'];
        });
      }
    }
  }

  Widget? getPannel(displayType, id) {
    if (displayType == 'stops') {
      return SchedulesPannel(
        id: widget.id!
      );
    } else if (displayType == 'bike') {
      return const BikePannel();
    } else if (displayType == 'address') {
      return const AddressPannel();
    } 
    return null;
  } 

  Widget? getBody(displayType, id, scrollController) {
    if (displayType == 'stops') {
      return SchedulesBody(
        id: id!,
        addMargin: true,
        scrollController: scrollController,
      );
    } else if (displayType == 'bike') {
      return BikeBody(
        id: id!,
        scrollController: scrollController,
      );
    } else if (displayType == 'address') {
      return AddressBody(
        id: id!,
        scrollController: scrollController,
        onDispose: _removePointMarker,
      );
    }
    return null;
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
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
                snapPoint: 0.55,
                minHeight: widget.displayType == 'null' ? 80 : 90,
                maxHeight: MediaQuery.of(context).size.height - 130,
                controller: panelController,
                onPanelSlide: (position) => _onPanelSlide(position),
                header: widget.displayType == null
                    ? const HomePannel()
                    : Container(
                        child: getPannel(widget.displayType, widget.id),
                      ),
                panelBuilder: (ScrollController scrollController) =>
                    widget.displayType != null && widget.id != null
                        ? Container(
                            child: getBody(widget.displayType, widget.id, scrollController),
                          )
                        : HomeBody(
                            scrollController: scrollController,
                            index: index,
                            address: address,
                            favs: favs,
                            lines: lines,
                            trafic: trafic,
                            journeys: journeys,
                            blocks: blocks,
                            update: _updateFavorites,
                          ),
                body: HereMap(onMapCreated: _onMapCreated),
              ),
              if (!isConnected)
                Positioned(
                  top: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.amber,
                    child: SafeArea(
                      child: Container(
                        margin: const EdgeInsets.only( top: 12, left: 73, bottom: 15),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/img/cloud_off.svg',
                              color: Theme.of(context).colorScheme.onSurface,
                              height: 18,
                            ),
                            const SizedBox(width: 10),
                            const Text('Aucune connexion internet',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Segoe Ui',
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
                left: 0,
                child: Opacity(
                  opacity: getOpacity(_position),
                  child: SafeArea(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, left: 8),
                      width: 40,
                      height: 40,
                      child: Material(
                        borderRadius: BorderRadius.circular(500),
                        elevation: 4.0,
                        shadowColor: Colors.black.withOpacity(getOpacity(_position)),
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(500),
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
              Positioned(
                top: 0,
                right: 0,
                child: Opacity(
                  opacity: getOpacity(_position),
                  child: SafeArea(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, right: 8),
                      width: 40,
                      height: 40,
                      child: Material(
                        borderRadius: BorderRadius.circular(500),
                        elevation: 4.0,
                        shadowColor: Colors.black.withOpacity(getOpacity(_position)),
                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(500),
                          onTap: () {
                            RouteStateScope.of(context).go('/changes');
                          },
                          child: Icon(
                            NavikaIcons.stars,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
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
                    backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
                    child: _isInBox
                        ? Icon(NavikaIcons.localisation, color: Theme.of(context).colorScheme.onSurface, size: 30)
                        : Icon(NavikaIcons.localisationNull, color: Theme.of(context).colorScheme.onSurface, size: 30),
                    onPressed: () {
                      _zoomOn();
                      _closePanel();
                    },
                  ),
                ),
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
            ],
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getIndex();
      _getTrafic();
      _getNearPoints();
      _getInBox();
      panelController.animatePanelToSnapPoint();
      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        _getInBox();
      });
      _initializeConnectivity();
      connection = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
        _setConnectivity(result);
      });
    });
  }

  @override
  void dispose() async {
    super.dispose();
    globals.isSetLocation = false;
    connection.cancel();
    _timer.cancel();
  }

  void _getInBox() {
    GeoCoordinates geoCoords = GeoCoordinates(
      globals.locationData?.latitude ?? 0,
      globals.locationData?.longitude ?? 0
    );
    setState(() {
      _isInBox = _controller?.isOverLocation(geoCoords) ?? false;
    });
  }

  void _onMapCreated(HereMapController hereMapController) {
    //THEME
    MapScheme mapScheme = Brightness.dark == Theme.of(context).colorScheme.brightness
      ? MapScheme.normalNight
      : MapScheme.normalDay;

    hereMapController.mapScene.loadSceneForMapScheme(mapScheme, (MapError? error) {
      if (error != null) {
        return;
      }

      _controller = HereController(hereMapController);
      _getLocation(globals.isSetLocation);

      GeoCoordinates geoCoords;
      double distanceToEarthInMeters = 10000;
      if (globals.isSetLocation) {
        // Resume Map
        geoCoords = GeoCoordinates(globals.locationData?.latitude ?? 48.859481, globals.locationData?.longitude ?? 2.346711);
        distanceToEarthInMeters = 1000;
      } else if (globals.hiveBox?.get('latitude') != null && globals.hiveBox?.get('longitude') != null) {
        // Opening App
        geoCoords = GeoCoordinates(globals.hiveBox.get('latitude'), globals.hiveBox.get('longitude'));
        distanceToEarthInMeters = 10000;
      } else {
        geoCoords = GeoCoordinates(48.859481, 2.346711);
        _controller?.addLocationIndicator(
          globals.locationData,
          LocationIndicatorIndicatorStyle.pedestrian,
          globals.compassHeading,
          true
        );
      }

      MapMeasure mapMeasureZoom = MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);
      hereMapController.camera.lookAtPointWithMeasure(geoCoords, mapMeasureZoom);

      hereMapController.gestures.panListener = PanListener((GestureState state, Point2D origin, Point2D translation, double velocity) {
        if (mounted) {
          if (state == GestureState.begin) {
            setState(() {
              isPanned = true;
            });
          }
          if (state == GestureState.end) {
            setState(() {
              camGeoCoords = _controller?.getOverLocation() ?? camGeoCoords;
            });
            _getNearPoints();
          }
        }
      });

      hereMapController.gestures.pinchRotateListener = PinchRotateListener((GestureState state, Point2D pinchOrigin, Point2D rotationOrigin,double twoFingerDistance, Angle rotation) {
        if (state == GestureState.end) {
          setState(() {
            camGeoCoords = _controller?.getOverLocation() ?? camGeoCoords;
          });
          _getNearPoints();
        }
      });

      hereMapController.gestures.longPressListener = LongPressListener((GestureState state, Point2D point) {
        GeoCoordinates geoCoordinates = _controller!.viewToGeoCoordinates(point);   
        
        if (state == GestureState.begin) {
          GeoCoordinatesUpdate geoCoords = GeoCoordinatesUpdate(geoCoordinates.latitude, geoCoordinates.longitude);
          _controller?.zoomTo(geoCoords);
          panelController.animatePanelToSnapPoint();

          _removePointMarker();

          pointMarker = _controller?.addMapMarker(
            geoCoordinates,
            'assets/img/marker/marker.png',
            Metadata(),
            100,
          );
      
          RouteStateScope.of(context).go('/address/${geoCoordinates.latitude};${geoCoordinates.longitude}');
          return;
        }
      });

    _controller?.addLocationIndicator(
        globals.locationData,
        LocationIndicatorIndicatorStyle.pedestrian,
        globals.compassHeading,
        false);
      _addTapListener();
      _getNearPoints();
    });
  }

  void _addTapListener() {
    var tapListener = TapListener((Point2D touchPoint) {
      _pickMapMarker(touchPoint);
    });
    _controller?.addTapListener(tapListener);
  }

  void _pickMapMarker(Point2D touchPoint) {
    double radiusInPixel = 2;
    _controller?.pickMapItems(touchPoint, radiusInPixel, (pickMapItemsResult) {
      if (pickMapItemsResult == null) {
        return;
      }
      List<MapMarker> mapMarkerList = pickMapItemsResult.markers;
      if (mapMarkerList.isEmpty) {
        return;
      }

      MapMarker topmostMapMarker = mapMarkerList.first;
      Metadata? metadata = topmostMapMarker.metadata;

      if (mounted) {
        setState(() {
          isPanned = true;
        });
      }

      if (metadata != null) {
        if (metadata.getString('type') == 'stop') {
          globals.schedulesStopName = metadata.getString('name') ?? '';
          GeoCoordinatesUpdate geoCoords = GeoCoordinatesUpdate(metadata.getDouble('lat') ?? 0, metadata.getDouble('lon') ?? 0);
          _controller?.zoomTo(geoCoords);
          panelController.animatePanelToSnapPoint();
          RouteStateScope.of(context).go('/stops/${metadata.getString('id')}');
          return;
        } else if (metadata.getString('type') == 'bike') {
          globals.schedulesStopName = metadata.getString('name') ?? '';
          GeoCoordinatesUpdate geoCoords = GeoCoordinatesUpdate(metadata.getDouble('lat') ?? 0, metadata.getDouble('lon') ?? 0);
          _controller?.zoomTo(geoCoords);
          panelController.animatePanelToSnapPoint();
          RouteStateScope.of(context).go('/bike/${metadata.getString('id')}');
          return;
        }
      }
    });
  }

  void _addLocationIndicator(gps.LocationData locationData) {
    _controller?.addLocationIndicator(locationData, LocationIndicatorIndicatorStyle.pedestrian, globals.compassHeading);
  }

  void _updateLocationIndicator(gps.LocationData locationData) async {
    _controller?.updateLocationIndicator(locationData, globals.compassHeading);
    await _getNearPoints();
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

  void _updateFavorites() {
    setState(() {
      favs = globals.hiveBox.get('stopsFavorites');
    });
  }

  void _zoomOn() {
    GeoCoordinates geoCoords = GeoCoordinates(
      globals.locationData?.latitude ?? 0,
      globals.locationData?.longitude ?? 0
    );
    var isOverLocation = _controller?.isOverLocation(geoCoords) ?? false;
    if (isOverLocation) {
      setState(() {
        is3dMap = !is3dMap;
        isPanned = false;
      });
    }
    _controller?.zoomOnLocationIndicator(is3dMap);
  }

  void _onPanelSlide(position) {
    setState(() {
      panelButtonBottomOffset = panelButtonBottomOffsetClosed + ((MediaQuery.of(context).size.height - 230) * position);
      _position = position;
    });
  }

  void _closePanel() {
    panelController.close();
  }

  Future<void> _initializeConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    _setConnectivity(connectivityResult);
  }

  void _setConnectivity(connectivity) {
    setState(() {
      isConnected = !(connectivity == ConnectivityResult.none);
    });
  }
}
