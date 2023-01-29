import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:here_sdk/gestures.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart' as gps;
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:navika/src/icons/scaffold_icon_icons.dart';
import 'package:navika/src/routing/route_state.dart';
import 'package:navika/src/style/style.dart';
import 'package:navika/src/widgets/bike/body.dart';
import 'package:navika/src/widgets/bike/header.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_compass/flutter_compass.dart';

import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/controller/here_map_controller.dart';

import 'package:navika/src/widgets/home/body.dart';
import 'package:navika/src/widgets/home/header.dart';
import 'package:navika/src/widgets/schedules/body.dart';
import 'package:navika/src/widgets/schedules/header.dart';

enum MarkerSize { hidden, small, large }

enum MarkerMode { bike, bus, cable, metro, boat, noctilien, rer, train, tram }

String getMarkerImageByType(MarkerMode mode, MarkerSize size, context) {
  String assets = 'assets/marker/';

  if (size == MarkerSize.hidden) {
    return 'assets/null.png';
  }

  if (size == MarkerSize.small) {
    if (mode == MarkerMode.bike) {
      assets = '${assets}mini_bike';
    } else {
      assets = '${assets}mini';
    }
  }

  if (size == MarkerSize.large) {
    if (mode == MarkerMode.train) {
      assets = '${assets}marker_train';
    } else if (mode == MarkerMode.metro) {
      assets = '${assets}marker_metro';
    } else if (mode == MarkerMode.tram) {
      assets = '${assets}marker_tram';
    } else if (mode == MarkerMode.cable) {
      assets = '${assets}marker_cable';
    } else if (mode == MarkerMode.boat) {
      assets = '${assets}marker_boat';
    } else if (mode == MarkerMode.bus) {
      assets = '${assets}marker_bus';
    } else if (mode == MarkerMode.bike) {
      assets = '${assets}marker_bike';
    }
  }

  if (Brightness.dark == Theme.of(context).colorScheme.brightness) {
    assets = '${assets}_light.png';
  } else {
    assets = '${assets}_dark.png';
  }

  return assets;
}

MarkerMode getMarkerMode(List modes) {
  if (modes.contains('nationalrail') || modes.contains('rail')) {
    return MarkerMode.train;
  } else if (modes.contains('metro')) {
    return MarkerMode.metro;
  } else if (modes.contains('tram')) {
    return MarkerMode.tram;
  } else if (modes.contains('cablecar')) {
    return MarkerMode.cable;
  } else if (modes.contains('boat')) {
    return MarkerMode.boat;
  } else if (modes.contains('bus')) {
    return MarkerMode.bus;
  } else if (modes.contains('bike')) {
    return MarkerMode.bike;
  } else {
    return MarkerMode.bus;
  }
}

MarkerSize getMarkerSize(MarkerMode mode, double zoom) {
  if (zoom > 15000 && (mode == MarkerMode.train || mode == MarkerMode.rer)) {
    return MarkerSize.small;
  }
  if (zoom > 15000) {
    return MarkerSize.hidden;
  }
  if (zoom > 3000 && mode == MarkerMode.bike) {
    return MarkerSize.hidden;
  }
  if (zoom > 6000 && (mode != MarkerMode.train && mode != MarkerMode.rer)) {
    return MarkerSize.small;
  }
  if (zoom > 3000 && mode == MarkerMode.bus) {
    return MarkerSize.small;
  }
  if (zoom > 2000 && mode == MarkerMode.bike) {
    return MarkerSize.small;
  }
  return MarkerSize.large;
}

int getSizeForMarker(MarkerSize size) {
  if (size == MarkerSize.hidden) {
    return 0;
  }
  if (size == MarkerSize.small) {
    return 20;
  }
  return 100;
}

double getAppBarOpacity(double position) {
  double res = (((position * -1) + 1) * -3.33) + 1;
  if (res < 0) {
    return 0.0;
  } else if (res > 1.0) {
    return 1;
  }
  return res;
}

double getOpacity(position) {
  double res =
      ((1 / position - 1.1) * 2.33) > 1 ? 1 : ((1 / position - 1.1) * 2.33);
  if (res < 0) {
    return 0.0;
  } else if (res > 1.0) {
    return 1;
  }
  return res;
}

class Home extends StatefulWidget {
  final String? displayType;

  const Home({
    this.displayType,
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

  CompassEvent? compassEvent;
  double compassHeading = 0;

  bool isPanned = false;
  bool is3dMap = false;
  bool _isInBox = false;
  late Timer _timer;

  double panelButtonBottomOffsetClosed = 120;
  double panelButtonBottomOffset = 120;
  double _position = 0;

  List stopsNearby = [];
  List bikeNearby = [];
  List markers = [];
  Map index = {};
  List favs = globals.hiveBox?.get('stopsFavorites') ?? [];
  List address = globals.hiveBox?.get('AddressFavorites') ?? [];

  Future<void> _getLocation() async {
    bool serviceEnabled;
    gps.PermissionStatus permissionGranted;
    gps.LocationData locationData;

    if (!globals.isSetLocation) {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == gps.PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != gps.PermissionStatus.granted) {
          return;
        }
      }

      locationData = await location.getLocation();
      FlutterCompass.events?.listen((CompassEvent compassEvent) {
        _updateCompass(compassEvent);
      });
      _addLocationIndicator(locationData);
      location.onLocationChanged.listen((gps.LocationData currentLocation) {
        _updateLocationIndicator(currentLocation);
      });
      await _getPoints();
    } else {
      locationData = await location.getLocation();

      FlutterCompass.events?.listen((CompassEvent compassEvent) {
        _updateCompass(compassEvent);
      });
      location.onLocationChanged.listen((gps.LocationData currentLocation) {
        _updateLocationIndicator(currentLocation);
      });
      await _getPoints();
    }
  }

  Future<void> _getPoints() async {
    final response = await http.get(Uri.parse(
        '${globals.API_NEAR}?lat=${camGeoCoords.latitude == 0 ? globals.locationData?.latitude : camGeoCoords.latitude}&lon=${camGeoCoords.longitude == 0 ? globals.locationData?.longitude : camGeoCoords.longitude}'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (mounted) {
        setState(() {
          stopsNearby = data['stops'];
          bikeNearby = data['bike'];
        });
      }

      _setMarker();
    }
  }

  void _clearMarker() {
    for (var marker in markers) {
      _controller?.removeMapMarker(marker);
    }
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
        metadata.setString('capacity', bike['capacity']);
        metadata.setDouble('lat', bike['coord']['lat'].toDouble());
        metadata.setDouble('lon', bike['coord']['lon'].toDouble());

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
      GeoCoordinates stopCoords = GeoCoordinates(
          stop['coord']['lat'].toDouble(), stop['coord']['lon'].toDouble());

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
    } else {
      try {
        final response = await http
            .get(Uri.parse('${globals.API_INDEX}?v=${globals.VERSION}'));
        if (response.statusCode == 200) {
          final data = json.decode(response.body);

          if (mounted) {
            setState(() {
              index = data;
            });
            globals.index = data;
          }
        } else {
          var snackBar = const SnackBar(
            content: Text('Récupération des actualités impossible.'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } catch (e) {
        var snackBar = const SnackBar(
          content: Text(
              "Une erreur s'est produite lors de la récupération des actualités."),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  Future<void> _getFavorites() async {
    var box = await Hive.openBox('Home');

    setState(() {
      favs = box.get('stopsFavorites');
      address = box.get('AddressFavorites');
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
                color: backgroundColor(context),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
                snapPoint: 0.55,
                minHeight: widget.displayType != null ? 75 : 100,
                maxHeight: (MediaQuery.of(context).size.height - 130),
                controller: panelController,
                onPanelSlide: (position) => _onPanelSlide(position),
                header: widget.displayType == null
                    ? HomePannel(tooglePanel: _tooglePanel)
                    : widget.displayType == 'stops'
                        ? SchedulesPannel(tooglePanel: _tooglePanel)
                        : BikePannel(tooglePanel: _tooglePanel),
                panelBuilder: (ScrollController scrollController) =>
                    widget.displayType == null
                        ? HomeBody(
                            scrollController: scrollController,
                            index: index,
                            address: address,
                            favs: favs,
                            update: _updateFavorites,
                          )
                        : Container(
                            margin: const EdgeInsets.only(top: 40),
                            child: widget.displayType == 'stops'
                                ? SchedulesBody(
                                    scrollController: scrollController)
                                : BikeBody(scrollController: scrollController),
                          ),
                body: HereMap(onMapCreated: _onMapCreated),
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
                        ? Icon(ScaffoldIcon.location_indicator,
                            //color: Color(0xff000000),
                            color: tabLabelColor(context),
                            size: 30)
                        : Icon(ScaffoldIcon.locate,
                            color: tabLabelColor(context), size: 30),
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
      _getPoints();
      _getInBox();
      panelController.animatePanelToSnapPoint();
      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        _getInBox();
        _getFavorites();
      });
    });
  }

  @override
  void dispose() async {
    super.dispose();
    globals.isSetLocation = false;
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
        geoCoords = GeoCoordinates(globals.hiveBox.get('latitude') ?? 48.859481,
            globals.hiveBox.get('longitude') ?? 2.346711);
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
            _getPoints();
          }
        }
      });

      hereMapController.gestures.pinchRotateListener = PinchRotateListener(
          (GestureState state, Point2D pinchOrigin, Point2D rotationOrigin,
              double twoFingerDistance, Angle rotation) {
        if (state == GestureState.end) {
          _clearMarker();
          _setMarker();
        }
      });

      _controller?.addLocationIndicator(
          globals.locationData,
          LocationIndicatorIndicatorStyle.pedestrian,
          globals.compassHeading,
          false);
      _addTapListener();
      _getPoints();
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
          globals.schedulesStopArea = metadata.getString('id') ?? '';
          globals.schedulesStopName = metadata.getString('name') ?? '';
          globals.schedulesStopModes =
              json.decode(metadata.getString('modes') ?? '');
          GeoCoordinatesUpdate geoCoords = GeoCoordinatesUpdate(
              metadata.getDouble('lat') ?? 0, metadata.getDouble('lon') ?? 0);
          _controller?.zoomTo(geoCoords);
          panelController.animatePanelToSnapPoint();
          RouteStateScope.of(context).go('/stops/${metadata.getString("id")}');
          return;
        } else if (metadata.getString('type') == 'bike') {
          globals.schedulesStopArea = metadata.getString('id') ?? '';
          globals.schedulesStopName = metadata.getString('name') ?? '';
          GeoCoordinatesUpdate geoCoords = GeoCoordinatesUpdate(
              metadata.getDouble('lat') ?? 0, metadata.getDouble('lon') ?? 0);
          _controller?.zoomTo(geoCoords);
          panelController.animatePanelToSnapPoint();
          RouteStateScope.of(context).go('/bike/${metadata.getString("id")}');
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
}
