// 🐦 Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:geolocator/geolocator.dart';
import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';

// 🌎 Project imports:
import 'package:navika/src/data/global.dart' as globals;

// A callback to notify the hosting widget.
typedef ShowDialogFunction = void Function(String title, String message);

class HereController {
  final HereMapController _hereMapController;
  LocationIndicator? locationIndicator;

  HereController(HereMapController hereMapController): _hereMapController = hereMapController {
    double distanceToEarthInMeters = 10000;
    MapMeasure mapMeasureZoom = MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);
    _hereMapController.camera.lookAtPointWithMeasure(GeoCoordinates(52.520798, 13.409408), mapMeasureZoom);
  }

  Location defineLocation(Position position, double heading) {
    GeoCoordinates geoCoords = GeoCoordinates(position.latitude ?? 0, position.longitude ?? 0);
    Location location = Location.withCoordinates(geoCoords);
    location.time = DateTime.now();
    location.horizontalAccuracyInMeters = position.accuracy;
    location.bearingInDegrees = heading;

    globals.position = position;

    return location;
  }

  void addLocationIndicator(Position? position, LocationIndicatorIndicatorStyle indicatorStyle, double heading, [bool isActive = true, bool zoomAuto = true]) {
    if (position == null) return;
    if (locationIndicator != null) locationIndicator!.disable();

    locationIndicator = LocationIndicator();
    locationIndicator?.locationIndicatorStyle = indicatorStyle;
    locationIndicator?.isAccuracyVisualized = true;
    
    locationIndicator?.isActive = isActive;

    locationIndicator?.updateLocation(defineLocation(position, heading));
    
    // Show the indicator on the map view.
    locationIndicator?.enable(_hereMapController);

    if (zoomAuto) {
      double distanceToEarthInMeters = 1000;
      if (position.accuracy > 0) {
        distanceToEarthInMeters = (position.accuracy * 2) + 1000;
      }
      MapMeasure mapMeasureZoom = MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);
      _hereMapController.camera.lookAtPointWithMeasure(GeoCoordinates(position.latitude ?? 0, position.longitude ?? 0), mapMeasureZoom);
    }
  }

  void zoomOnLocationIndicator(bool is3dMap, Position position, double heading){
    double distanceToEarthInMeters = 1000;

    if (position.accuracy > 0) {
      distanceToEarthInMeters = position.accuracy + 1000;
    }
    
    MapMeasure mapMeasureZoom = MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);

    GeoCoordinatesUpdate geoCoords = GeoCoordinatesUpdate(position.latitude, position.longitude);
    GeoOrientationUpdate geoOrient = GeoOrientationUpdate(is3dMap ? heading : 0, is3dMap ? 50 : 0);

    _hereMapController.camera.startAnimation(MapCameraAnimationFactory.flyToWithOrientationAndZoom(geoCoords, geoOrient, mapMeasureZoom, 0, is3dMap ? const Duration(milliseconds: 300) : const Duration(seconds: 1)));
  
  }

  void zoomTo(GeoCoordinatesUpdate geoCoords, [bool ignoreZoom = false]){
    double distanceToEarthInMeters = _hereMapController.camera.state.distanceToTargetInMeters;
    if (ignoreZoom == false) {
      distanceToEarthInMeters = 1020;
    }
    MapMeasure mapMeasureZoom = MapMeasure(MapMeasureKind.distance, distanceToEarthInMeters);
    _hereMapController.camera.startAnimation(MapCameraAnimationFactory.flyToWithZoom(geoCoords, mapMeasureZoom, 0, const Duration(seconds: 1)));
  
  }

  void updateLocationIndicator(Position? position, double heading, [bool isActive = true]){
    print(['INFO_', position]);
    if (position == null || locationIndicator == null) return;
    locationIndicator?.updateLocation(defineLocation(position, heading));
    locationIndicator?.isActive = isActive;
  }

  WidgetPin addMapWidget(Widget widget, GeoCoordinates geoCoordinates) {
    Anchor2D anchor2D = Anchor2D.withHorizontalAndVertical(0.5, 1);    
    var mapMarker = _hereMapController.pinWidget(widget, geoCoordinates);
    mapMarker?.anchor = anchor2D;

    return mapMarker!;
  }

  MapPolygon addMapCircle(GeoCoordinates geoCoordinates, double radius, Color color) {
    GeoCircle geoCircle = GeoCircle(geoCoordinates, radius);

    GeoPolygon geoPolygon = GeoPolygon.withGeoCircle(geoCircle);
    MapPolygon mapPolygon = MapPolygon(geoPolygon, color);

    _hereMapController.mapScene.addMapPolygon(mapPolygon);
    
    return mapPolygon;
  }

  void removeMapWidget(Widget widget, GeoCoordinates geoCoordinates) {
    Anchor2D anchor2D = Anchor2D.withHorizontalAndVertical(0.5, 1);    
    var mapMarker = _hereMapController.pinWidget(widget, geoCoordinates);
    mapMarker?.anchor = anchor2D;
  }

  MapMarker addMapMarker(GeoCoordinates geoCoordinates, imgPath, Metadata metadata, [int size = 100]) {
    Anchor2D anchor2D = Anchor2D.withHorizontalAndVertical(0.5, 1);
    MapImage mapImage = MapImage.withFilePathAndWidthAndHeight(imgPath, size, size);
    MapMarker mapMarker = MapMarker.withAnchor(geoCoordinates, mapImage, anchor2D);
    mapMarker.metadata = metadata;
    _hereMapController.mapScene.addMapMarker(mapMarker);

    return mapMarker;
  }

  MapMarker addMapImage(geoCoordinates, Uint8List pixelData, Metadata metadata) {
    Anchor2D anchor2D = Anchor2D.withHorizontalAndVertical(0.5, 1);
    ImageFormat imageFormat = ImageFormat.png;
    MapImage mapImage = MapImage.withPixelDataAndImageFormat(pixelData, imageFormat);
    MapMarker mapMarker = MapMarker.withAnchor(geoCoordinates, mapImage, anchor2D);
    mapMarker.metadata = metadata;
    _hereMapController.mapScene.addMapMarker(mapMarker);

    return mapMarker;
  }

  MapMarker createMapMarker(GeoCoordinates geoCoordinates, imgPath, Metadata metadata, [int size = 100]) {
    Anchor2D anchor2D = Anchor2D.withHorizontalAndVertical(0.5, 1);
    MapImage mapImage = MapImage.withFilePathAndWidthAndHeight(imgPath, size, size);
    MapMarker mapMarker = MapMarker.withAnchor(geoCoordinates, mapImage, anchor2D);
    mapMarker.metadata = metadata;
    return mapMarker;
  }

  void removeMapPolygon(MapPolygon mapPolygon) {
    _hereMapController.mapScene.removeMapPolygon(mapPolygon);
  }

  void removeMapMarker(MapMarker mapMarker) {
    _hereMapController.mapScene.removeMapMarker(mapMarker);
  }

  void addMapMarkerCluster(MapMarkerCluster cluster) {
    _hereMapController.mapScene.addMapMarkerCluster(cluster);
  }

  void removeMapMarkerCluster(MapMarkerCluster cluster) {
    _hereMapController.mapScene.removeMapMarkerCluster(cluster);
  }  

  void addTapListener(tapListener) {
    _hereMapController.gestures.tapListener = tapListener;
  }

  GeoCoordinates viewToGeoCoordinates(Point2D viewCoordinates) {
    return _hereMapController.viewToGeoCoordinates(viewCoordinates)!;
  }

  void pickMapItems(Point2D centerPoint, double radius, void Function(PickMapItemsResult?) callback) {
    _hereMapController.pickMapItems(centerPoint, radius, callback);
  }

  bool isOverLocation(GeoCoordinates geoCoords){
    return _hereMapController.camera.boundingBox?.containsGeoCoordinates(geoCoords) ?? false;
  }

  double getBearing(){
    return _hereMapController.camera.state.orientationAtTarget.tilt;
  }

  double getZoomLevel() {
    return _hereMapController.camera.state.distanceToTargetInMeters;
  }

  GeoCoordinates getOverLocation(){
    return _hereMapController.camera.state.targetCoordinates;
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
