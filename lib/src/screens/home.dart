import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:here_sdk/gestures.dart';
import 'package:http/http.dart' as http; 
import 'package:location/location.dart' as gps;
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_compass/flutter_compass.dart';

import '../data/global.dart' as globals;
import '../controller/here_map_controller.dart';

class HomeScreen extends StatefulWidget {
	const HomeScreen({super.key});

	@override
	State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HereController? _controller;
  PanelController panelController = PanelController();

  GeoCoordinates camGeoCoords = GeoCoordinates(0, 0);
  gps.Location location = gps.Location();

  CompassEvent? compassEvent;
  double compassHeading = 0;

  bool isPanned = false;
  bool is3dMap = false;
  bool isInBox = false;
  late Timer _timer;

  double panelButtonBottomOffsetOpen = 400;
  double panelButtonBottomOffsetClosed = 120;
  double panelButtonBottomOffset = 120;

  List pointNearby = [];

  Future<void> _getLocation() async {
    bool serviceEnabled;
    gps.PermissionStatus permissionGranted;
    gps.LocationData locationData;

    if (!globals.isSetLocation){
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

      FlutterCompass.events?.listen((CompassEvent _compassEvent ) {
        _updateCompass(_compassEvent);
      });

      _addLocationIndicator(locationData);

      location.onLocationChanged.listen((gps.LocationData currentLocation) {
        _updateLocationIndicator(currentLocation);
      });

      await _getPoints();
      
    } else {
      locationData = await location.getLocation();

      FlutterCompass.events?.listen((CompassEvent _compassEvent ) {
        _updateCompass(_compassEvent);
      });

      location.onLocationChanged.listen((gps.LocationData currentLocation) {
        _updateLocationIndicator(currentLocation);
      });

      await _getPoints();
    }
	}

  Future<void> _getPoints() async {
    final response = await http.get(Uri.parse('${globals.API_POINTS}?lat=${camGeoCoords.latitude == 0 ? globals.locationData?.latitude : camGeoCoords.latitude}&lon=${camGeoCoords.longitude == 0 ? globals.locationData?.longitude : camGeoCoords.longitude}'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (mounted) {
        setState(() {
          pointNearby = data['points'];
        });
      }

      for (var stop in data['points']) {
        GeoCoordinates stopCoords = GeoCoordinates(stop['coord']['lat'], stop['coord']['lon']);
        // _controller?.addMapMarker(stopCoords, "assets/idfm/BUS_dark.png");
        print({'INFO_', stopCoords.latitude, stopCoords.longitude});
      }
    }
	}

  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      alignment: Alignment.topCenter,
      children: [
        SlidingUpPanel(
          parallaxEnabled: true,
          parallaxOffset: 0.6,
          color: Color(0xfffafafa),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
          controller: panelController,
          onPanelSlide: (position) => setState( () {
            panelButtonBottomOffset = panelButtonBottomOffsetClosed + (panelButtonBottomOffsetOpen * position); 
          }),

          header: headerPanel(),

          //panel: BodyPanel(),
          panelBuilder: (ScrollController _scrollController) => bodyPanel(_scrollController),

          body: HereMap(onMapCreated: _onMapCreated),
          
        ),
        Positioned(
          right: 20,
          bottom: panelButtonBottomOffset,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            child: isInBox ? 
              Image(
                width: 30,
                image: AssetImage('assets/location-indicator.png'),
              ) : 
              Image(
                width: 30,
                image: AssetImage('assets/locate.png'),
              ),
            onPressed: () {
              _zoomOn();
              closePanel();
            }
          )
        ),
        Positioned(
          left: 10,
          bottom: panelButtonBottomOffset - 20,
          child: Image(
            width: 50,
            image: AssetImage('assets/Here.png')
          )
        ),
      ],
    ),
  );

  Widget headerPanel() => SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Column(
      children: [
        Container(
          height: 20,
        ),
        GestureDetector(
          onTap: tooglePanel,
          child: Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(30),
              ),
            ),
        ),
        Container(
          height: 20,
        ),
        const Text('Bienvenue !',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        Container(
          height: 20,
        ),
      ],
    ),
  );

  Widget bodyPanel(ScrollController _scrollController) => Container(
    padding: const EdgeInsets.only(top:50),
    child: ListView(
      controller: _scrollController,
      children: [
        for (var point in pointNearby)
          Text(point['name'] ?? '',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Parisine',
              color: Theme.of(context).colorScheme.secondary,
            ),
          )
      ],
    )
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getPoints();
      getInBox();
    });
  }
  @override
  void dispose() async {
    super.dispose();
    globals.isSetLocation = false;
    _timer.cancel();
  }
  void getInBox(){
    bool _isInBox;
    _isInBox = _controller?.isOverLocation() ?? false;

    setState(() {
      isInBox = _isInBox;
    });

    _timer = Timer(const Duration(milliseconds: 100), () {
      getInBox();
    });
  }

  void _onMapCreated(HereMapController hereMapController) {
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay, (MapError? error) {
      if (error != null) {
        print("Map scene not loaded. MapError: " + error.toString());
        return;
      }

      _controller = HereController(hereMapController);
      _getLocation();

      GeoCoordinates geoCoords;
      bool isActive = false;
      double distanceToEarthInMeters = 10000;
      if (globals.isSetLocation) { // Resume Map
        geoCoords = GeoCoordinates(globals.locationData?.latitude ?? 48.859481, globals.locationData?.longitude ?? 2.346711);
        distanceToEarthInMeters = 1000;

      } else if (globals.hiveBox?.get('latitude') != null && globals.hiveBox?.get('longitude') != null){ // Opening App
        geoCoords = GeoCoordinates(globals.hiveBox.get('latitude') ?? 48.859481, globals.hiveBox.get('longitude') ?? 2.346711);
        distanceToEarthInMeters = 10000;

      } else {
        geoCoords = GeoCoordinates(48.859481, 2.346711);
        _controller?.addLocationIndicator(globals.locationData, LocationIndicatorIndicatorStyle.pedestrian, globals.compassHeading, true);
      
      }

      MapMeasure mapMeasureZoom = MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);
      hereMapController.camera.lookAtPointWithMeasure(geoCoords, mapMeasureZoom);

      hereMapController.gestures.panListener = PanListener((GestureState state, Point2D origin, Point2D translation, double velocity) {
        if (mounted){
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
      } );

      _controller?.addLocationIndicator(globals.locationData, LocationIndicatorIndicatorStyle.pedestrian, globals.compassHeading, false);

      _getPoints();
    });
  }
  void _addLocationIndicator(gps.LocationData locationData) {
    _controller?.addLocationIndicator(locationData, LocationIndicatorIndicatorStyle.pedestrian, globals.compassHeading);
  }
  void _updateLocationIndicator(gps.LocationData locationData) {
      _controller?.updateLocationIndicator(locationData, globals.compassHeading);
  }
  void _updateCompass(CompassEvent _compassEvent){
    var heading = _compassEvent.heading ?? 0;
    if (mounted) {
      setState(() {
        compassHeading = heading;
      });
    }
    globals.compassHeading = heading;

    if (is3dMap){
      if (!isPanned){ // si on a touché l'écran
        _controller?.zoomOnLocationIndicator(is3dMap);
      }
    } 
    _controller?.updateLocationIndicator(globals.locationData, heading);
  }
  void _zoomOn() {
    var _isOverLocation = _controller?.isOverLocation() ?? false;
    if (_isOverLocation) {
      setState(() {
        is3dMap = !is3dMap;
        isPanned = false;
      });
    }
    _controller?.zoomOnLocationIndicator(is3dMap);
  }
  void tooglePanel() {
    if (panelController.isPanelOpen){
      panelController.close();
    } else {
      panelController.open();
    }
  }
  void closePanel() {
    panelController.close();
  }
}