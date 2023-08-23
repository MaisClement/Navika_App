import 'dart:async';
import 'dart:convert';

import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:here_sdk/gestures.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:location/location.dart' as gps;
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:navika/src/api.dart';
import 'package:navika/src/icons/navika_icons_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/utils.dart';
import 'package:navika/src/widgets/bike/body.dart';
import 'package:navika/src/widgets/bike/header.dart';
import 'package:navika/src/widgets/error_block.dart';
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

  List stopsNearby = [];
  List bikeNearby = [];
  List markers = [];
  Map index = {};
  List favs = globals.hiveBox?.get('stopsFavorites') ?? [];
  List address = globals.hiveBox?.get('addressFavorites') ?? [];

  Future<void> _getLocation() async {
    bool serviceEnabled;
    gps.PermissionStatus permissionGranted;
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

      if (allowGps == null) {
        RouteStateScope.of(context).go('/position');
        return;
      }
      permissionGranted = await location.hasPermission();

      locationData = await location.getLocation();
      FlutterCompass.events?.listen((CompassEvent compassEvent) {
        _updateCompass(compassEvent);
      });
      _addLocationIndicator(locationData);
      location.onLocationChanged.listen((gps.LocationData currentLocation) {
        _updateLocationIndicator(currentLocation);
      });
      await _getNearPoints();
    } else {
      locationData = await location.getLocation();

      FlutterCompass.events?.listen((CompassEvent compassEvent) {
        _updateCompass(compassEvent);
      });
      location.onLocationChanged.listen((gps.LocationData currentLocation) {
        _updateLocationIndicator(currentLocation);
      });
      await _getNearPoints();
    }
  }

  Future<void> _getNearPoints() async {
    double zoom = _controller?.getZoomLevel() ?? 0;

    NavikaApi navikaApi = NavikaApi();
    Map result = await navikaApi.getNearPoints(zoom, camGeoCoords);
    
    if (mounted) {
      setState(() {
        stopsNearby = result['value']?['stops'];
        
        if (result['value']?['bike'] != null) {
          bikeNearby = result['value']?['bike'];
        } else {
          bikeNearby = [];
        }
      });
    }

    _setMarker();
  }

  void _clearMarker() {
    for (var marker in markers) {
      _controller?.removeMapMarker(marker);
    }
    setState(() {
      markers = [];
    });
  }

  void _setMarker() {
    for (var bike in bikeNearby) {
      GeoCoordinates bikeCoords = GeoCoordinates(
          bike['coord']['lat'].toDouble(), bike['coord']['lon'].toDouble());

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
          setState(() {
            markers.add(_controller?.addMapMarker(
                bikeCoords,
                getMarkerImageByType(mode, size, context),
                metadata,
                getSizeForMarker(size)));
          });
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

        if (size != MarkerSize.hidden) {
          setState(() {
            markers.add(_controller?.addMapMarker(
                stopCoords,
                getMarkerImageByType(mode, size, context),
                metadata,
                getSizeForMarker(size)));
          });
        }
      }
    }
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
    
    if (mounted) {
      setState(() {
        index = result['value']!;
      });
      globals.index = result['value']!;
    }

    if (result['status'] != ApiStatus.ok) {
      FloatingSnackBar(
        message: getErrorText(result['status']),
        context: context,
        textColor: mainColor(context),
        textStyle: snackBarText,
        duration: const Duration(milliseconds: 4000),
        backgroundColor: const Color(0xff272727),
      );
    }
  }

  Future<void> _getFavorites() async {
    var box = await Hive.openBox('Home');

    setState(() {
      favs = box.get('stopsFavorites');
      address = box.get('addressFavorites');
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
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
                snapPoint: widget.displayType == 'bike' ? 0.25 : 0.55,
                minHeight: widget.displayType == 'null' ? 80 : 90,
                maxHeight: MediaQuery.of(context).size.height - 130,
                controller: panelController,
                onPanelSlide: (position) => _onPanelSlide(position),
                header: widget.displayType == null
                    ? HomePannel(tooglePanel: _tooglePanel)
                    : widget.displayType == 'stops'
                        ? SchedulesPannel(
                            id: widget.id!,
                            tooglePanel: _tooglePanel)
                        : BikePannel(
                            tooglePanel: _tooglePanel
                          ),
                panelBuilder: (ScrollController scrollController) =>
                    widget.displayType != null && widget.id != null
                        ? Container(
                            child: widget.displayType == 'stops'
                                ? SchedulesBody(
                                    id: widget.id!,
                                    addMargin: true,
                                    scrollController: scrollController)
                                : BikeBody(
                                    id: widget.id!,
                                    scrollController: scrollController
                                  ),
                          )
                        : HomeBody(
                            scrollController: scrollController,
                            index: index,
                            address: address,
                            favs: favs,
                            update: _updateFavorites,
                          ),
                body: HereMap(onMapCreated: _onMapCreated),
              ),
              if (!isConnected)
                Positioned(
                  top: 0,
                  child: Opacity(
                    opacity: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.amber,
                      child: SafeArea(
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 12, left: 73, bottom: 15),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/img/cloud_off.svg',
                                color: Theme.of(context).colorScheme.onSurface,
                                height: 18,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Aucune connexion internet',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Segoe Ui',
                                    fontSize: 18),
                              ),
                            ],
                          ),
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
                      margin:
                          const EdgeInsets.only(top: 10, left: 8),
                      width: 40,
                      height: 40,
                      child: Material(
                        borderRadius: BorderRadius.circular(500),
                        elevation: 4.0,
                        shadowColor:
                            Colors.black.withOpacity(getOpacity(_position)),
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(500),
                          onTap: () {
                            RouteStateScope.of(context).go('/settings');
                          },
                          child: Icon(
                            NavikaIcons.settings_filled,
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
                    backgroundColor:
                        Theme.of(context).colorScheme.onSecondaryContainer,
                    child: _isInBox
                        ? Icon(NavikaIcons.localisation,
                            color: Theme.of(context).colorScheme.onSurface, size: 30)
                        : Icon(NavikaIcons.localisation_null,
                            color: Theme.of(context).colorScheme.onSurface, size: 30),
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
      _getFavorites();
      _getNearPoints();
      _getInBox();
      panelController.animatePanelToSnapPoint();
      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        _getInBox();
        _getFavorites();
      });
      _initializeConnectivity();
      connection = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) {
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
    MapScheme mapScheme =
        Brightness.dark == Theme.of(context).colorScheme.brightness
            ? MapScheme.normalNight
            : MapScheme.normalDay;
    hereMapController.mapScene.loadSceneForMapScheme(mapScheme,
        (MapError? error) {
      if (error != null) {
        return;
      }

      _controller = HereController(hereMapController);
      _getLocation();

      GeoCoordinates geoCoords;
      double distanceToEarthInMeters = 10000;
      if (globals.isSetLocation) {
        // Resume Map
        geoCoords = GeoCoordinates(globals.locationData?.latitude ?? 48.859481,
            globals.locationData?.longitude ?? 2.346711);
        distanceToEarthInMeters = 1000;
      } else if (globals.hiveBox?.get('latitude') != null &&
          globals.hiveBox?.get('longitude') != null) {
        // Opening App
        geoCoords = GeoCoordinates(globals.hiveBox.get('latitude'),
            globals.hiveBox.get('longitude'));
        distanceToEarthInMeters = 10000;
      } else {
        geoCoords = GeoCoordinates(48.859481, 2.346711);
        _controller?.addLocationIndicator(
            globals.locationData,
            LocationIndicatorIndicatorStyle.pedestrian,
            globals.compassHeading,
            true);
      }

      MapMeasure mapMeasureZoom =
          MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);
      hereMapController.camera
          .lookAtPointWithMeasure(geoCoords, mapMeasureZoom);

      hereMapController.gestures.panListener = PanListener((GestureState state,
          Point2D origin, Point2D translation, double velocity) {
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

      hereMapController.gestures.pinchRotateListener = PinchRotateListener(
          (GestureState state, Point2D pinchOrigin, Point2D rotationOrigin,
              double twoFingerDistance, Angle rotation) {
        if (state == GestureState.end) {
          _clearMarker();
          _setMarker();
          _getNearPoints();
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
          GeoCoordinatesUpdate geoCoords = GeoCoordinatesUpdate(
              metadata.getDouble('lat') ?? 0, metadata.getDouble('lon') ?? 0);
          _controller?.zoomTo(geoCoords);
          panelController.animatePanelToSnapPoint();
          RouteStateScope.of(context).go('/stops/${metadata.getString('id')}');
          return;
        } else if (metadata.getString('type') == 'bike') {
          globals.schedulesStopName = metadata.getString('name') ?? '';
          GeoCoordinatesUpdate geoCoords = GeoCoordinatesUpdate(
              metadata.getDouble('lat') ?? 0, metadata.getDouble('lon') ?? 0);
          _controller?.zoomTo(geoCoords);
          panelController.animatePanelToSnapPoint();
          RouteStateScope.of(context).go('/bike/${metadata.getString('id')}');
          return;
        }
      }
    });
  }

  void _addLocationIndicator(gps.LocationData locationData) {
    _controller?.addLocationIndicator(locationData,
        LocationIndicatorIndicatorStyle.pedestrian, globals.compassHeading);
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

  void _updateFavorites() {
    setState(() {
      favs = globals.hiveBox.get('stopsFavorites');
    });
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

  void _onPanelSlide(position) {
    setState(() {
      panelButtonBottomOffset = panelButtonBottomOffsetClosed +
          ((MediaQuery.of(context).size.height - 210) * position);
      _position = position;
    });
  }

  void _tooglePanel() {
    if (panelController.isPanelOpen) {
      panelController.close();
    } else {
      panelController.open();
    }
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
