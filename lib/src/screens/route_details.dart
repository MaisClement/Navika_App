import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart' as gps;
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';
import 'package:navika/src/icons/scaffold_icon_icons.dart';
import 'package:navika/src/screens/home.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_compass/flutter_compass.dart';

import 'package:navika/src/data/global.dart' as globals;
import 'package:navika/src/controller/here_map_controller.dart';


class RouteDetails extends StatefulWidget {
  const RouteDetails({super.key});
  
  @override
	State<RouteDetails> createState() => _RouteDetailsState();
}

class _RouteDetailsState extends State<RouteDetails> {
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
      FlutterCompass.events?.listen((CompassEvent compassEvent ) {
        _updateCompass(compassEvent);
      });
      _addLocationIndicator(locationData);
      location.onLocationChanged.listen((gps.LocationData currentLocation) {
        _updateLocationIndicator(currentLocation);
      });
      
    } else {
      locationData = await location.getLocation();

      FlutterCompass.events?.listen((CompassEvent compassEvent ) {
        _updateCompass(compassEvent);
      });
      location.onLocationChanged.listen((gps.LocationData currentLocation) {
        _updateLocationIndicator(currentLocation);
      });
    }
	}

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      alignment: Alignment.topCenter,
      children: [
        SlidingUpPanel(
          parallaxEnabled: true,
          parallaxOffset: 0.6,
          color: const Color(0xfffafafa),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
          snapPoint: 0.55,
          minHeight: 100,
          maxHeight: (MediaQuery.of(context).size.height - 95),
          controller: panelController,
          onPanelSlide: (position) => onPanelSlide(position),

          header: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Container(
                  height: 15,
                ),
                Opacity(
                  opacity: getOpacity(_position),
                  child: Container(
                    width: 40,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                Container(
                  height: 15,
                ),
              ],
            ),
          ),

          panelBuilder: (ScrollController scrollController) => ListView(
            controller: scrollController,
          ),

          body: HereMap(onMapCreated: _onMapCreated),
          
        ),
        Positioned(
          top: 0,
          child: Opacity(
            opacity: getAppBarOpacity(_position),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(top: 12, left: 73, bottom:15),
                  child: const Text('Itinéraires',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Segoe Ui',
                      fontSize: 22
                    ),
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
              margin: const EdgeInsets.only(top: 10, left: 8, bottom:15),
              width: 40,
              height: 40,
              child: Material(
                borderRadius: BorderRadius.circular(500),
                elevation: 16.0,
                shadowColor: Colors.black.withOpacity( getOpacity(_position) ),
                color: Colors.white,
                child: InkWell(
                  borderRadius: BorderRadius.circular(500),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back
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
              backgroundColor: Colors.white,
              child: _isInBox ?
                const Icon(ScaffoldIcon.location_indicator,
                  color: Color(0xff000000),
                  size: 30
                )
              : const Icon(ScaffoldIcon.locate,
                  color: Color(0xff000000),
                  size: 30
                ),
              onPressed: () {
                _zoomOn();
                closePanel();
              }
            )
          ),
        ),
        
        Positioned(
          left: 10,
          bottom: panelButtonBottomOffset - 20,
          child: Opacity(
            opacity: getOpacity(_position),
            child: const Image(
              width: 50,
              image: AssetImage('assets/Here.png')
            )
          ),
        ),
      ],
    ),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getInBox();
      panelController.animatePanelToSnapPoint( );
      _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
        getInBox();
      });
    });
  }
  
  @override
  void dispose() async {
    super.dispose();
    _timer.cancel();
  }

  void getInBox(){
    bool isInBox;
    isInBox = _controller?.isOverLocation() ?? false;
    setState(() {
      _isInBox = isInBox;
    });
  }

  void _onMapCreated(HereMapController hereMapController) {
    //THEME
    hereMapController.mapScene.loadSceneForMapScheme(MapScheme.normalDay, (MapError? error) {
      if (error != null) {
        return;
      }

      _controller = HereController(hereMapController);
      _getLocation();

      GeoCoordinates geoCoords;
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

      _controller?.addLocationIndicator(globals.locationData, LocationIndicatorIndicatorStyle.pedestrian, globals.compassHeading, false);
    });
  }

  void _addLocationIndicator(gps.LocationData locationData) {
    _controller?.addLocationIndicator(locationData, LocationIndicatorIndicatorStyle.pedestrian, globals.compassHeading);
  }
  
  void _updateLocationIndicator(gps.LocationData locationData) {
      _controller?.updateLocationIndicator(locationData, globals.compassHeading);
  }

  void _updateCompass(CompassEvent compassEvent){
    var heading = compassEvent.heading ?? 0;
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
    var isOverLocation = _controller?.isOverLocation() ?? false;
    if (isOverLocation) {
      setState(() {
        is3dMap = !is3dMap;
        isPanned = false;
      });
    }
    _controller?.zoomOnLocationIndicator(is3dMap);
  }

  void onPanelSlide(position) {
    setState(() {
      panelButtonBottomOffset = panelButtonBottomOffsetClosed + ((MediaQuery.of(context).size.height - 200) * position);
      _position = position;
    });
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