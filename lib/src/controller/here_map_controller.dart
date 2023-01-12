import 'package:location/location.dart' as gps;
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';

import 'package:navika/src/data/global.dart' as globals;

// A callback to notify the hosting widget.
typedef ShowDialogFunction = void Function(String title, String message);

class HereController {
  final HereMapController _hereMapController;
  late LocationIndicator locationIndicator;

  HereController(HereMapController hereMapController)
      : _hereMapController = hereMapController {
    double distanceToEarthInMeters = 10000;
    MapMeasure mapMeasureZoom = MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);
    //GeoCoordinates geoCoords = GeoCoordinates(globals.locationData.latitude ?? 52.520798, globals.locationData.longitude ?? 13.409408);
    _hereMapController.camera.lookAtPointWithMeasure(GeoCoordinates(52.520798, 13.409408), mapMeasureZoom);
  }

  Location defineLocation(gps.LocationData locationData, double heading) {
    GeoCoordinates geoCoords = GeoCoordinates(locationData.latitude ?? 0, locationData.longitude ?? 0);
    Location location = Location.withCoordinates(geoCoords);
    location.time = DateTime.now();
    location.horizontalAccuracyInMeters = locationData.accuracy;
    location.verticalAccuracyInMeters = locationData.verticalAccuracy;
    location.bearingInDegrees = heading;

    globals.locationData = locationData;
    globals.isSetLocation = true;
    
    globals.hiveBox.put('latitude', globals.locationData?.latitude ?? 0);
    globals.hiveBox.put('longitude', globals.locationData?.longitude ?? 0);

    return location;
  }

  void addLocationIndicator(gps.LocationData? locationData, LocationIndicatorIndicatorStyle indicatorStyle, double heading, [bool isActive = true]) {
    if (locationData == null) return;
    locationIndicator = LocationIndicator();
    locationIndicator.locationIndicatorStyle = indicatorStyle;
    
    locationIndicator.isActive = isActive;

    locationIndicator.updateLocation(defineLocation(locationData, heading));
    _hereMapController.addLifecycleListener(locationIndicator);

    double distanceToEarthInMeters = 1000;
    MapMeasure mapMeasureZoom = MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);
    _hereMapController.camera.lookAtPointWithMeasure(GeoCoordinates(locationData.latitude ?? 0, locationData.longitude ?? 0), mapMeasureZoom);
  }

  void zoomOnLocationIndicator(bool is3dMap){
    if (globals.locationData != null){
      double distanceToEarthInMeters = 1000;
      MapMeasure mapMeasureZoom = MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);

      GeoCoordinatesUpdate geoCoords = GeoCoordinatesUpdate(globals.locationData?.latitude ?? 0, globals.locationData?.longitude ?? 0);
      GeoOrientationUpdate geoOrient = GeoOrientationUpdate(is3dMap ? globals.compassHeading : 0, is3dMap ? 50 : 0);

      _hereMapController.camera.startAnimation(MapCameraAnimationFactory.flyToWithOrientationAndZoom(geoCoords, geoOrient, mapMeasureZoom, 0, is3dMap ? const Duration(milliseconds: 300) : const Duration(seconds: 1)));
    }
  }

  void zoomTo(GeoCoordinatesUpdate geoCoords){
    if (globals.locationData != null){
      double distanceToEarthInMeters = 1000;
      MapMeasure mapMeasureZoom = MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);
      _hereMapController.camera.startAnimation(MapCameraAnimationFactory.flyToWithZoom(geoCoords, mapMeasureZoom, 0, const Duration(seconds: 1)));
    }
  }

  void updateLocationIndicator(gps.LocationData? locationData, double heading, [bool isActive = true]){
    if (locationData == null) return;
    locationIndicator.updateLocation(defineLocation(locationData, heading));
    locationIndicator.isActive = isActive;
  }

  void addMapMarker(GeoCoordinates geoCoordinates, imgPath, Metadata metadata) {
    int imageWidth = 100;
    int imageHeight = 100;
    Anchor2D anchor2D = Anchor2D.withHorizontalAndVertical(0.5, 1);
    MapImage mapImage = MapImage.withFilePathAndWidthAndHeight(imgPath, imageWidth, imageHeight);
    MapMarker mapMarker = MapMarker.withAnchor(geoCoordinates, mapImage, anchor2D);
    mapMarker.metadata = metadata;
    _hereMapController.mapScene.addMapMarker(mapMarker);
  }

  void addTapListener(tapListener) {
    _hereMapController.gestures.tapListener = tapListener;
  }

  void pickMapItems(Point2D centerPoint, double radius, void Function(PickMapItemsResult?) callback) {
    _hereMapController.pickMapItems(centerPoint, radius, callback);
  }

  bool isOverLocation(){
    GeoCoordinates geoCoords = GeoCoordinates(globals.locationData?.latitude ?? 0, globals.locationData?.longitude ?? 0);
    return _hereMapController.camera.boundingBox?.containsGeoCoordinates(geoCoords) ?? false;
  }

  GeoCoordinates getOverLocation(){
    GeoBox def = GeoBox(GeoCoordinates(0, 0), GeoCoordinates(0, 0));
    GeoBox geoBox = _hereMapController.camera.boundingBox ?? def;

    GeoCoordinates northEastCorner = geoBox.northEastCorner;
    GeoCoordinates southWestCorner = geoBox.southWestCorner;

    GeoCoordinates center = GeoCoordinates((northEastCorner.latitude + southWestCorner.latitude) / 2, (northEastCorner.longitude + southWestCorner.longitude) / 2);
    return center;
  }

  void addListener(MapCameraListener listener) {
    _hereMapController.camera.addListener(listener);
  }

  Point2D getPrincipalPoint(){
    return _hereMapController.camera.principalPoint;
  } 

  void addMapPolylines(MapPolyline polyline) {
    _hereMapController.mapScene.addMapPolyline(polyline);
  }

}
