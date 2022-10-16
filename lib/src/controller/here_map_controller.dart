/*
 * Copyright (C) 2019-2022 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License")
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

import 'package:location/location.dart' as gps;

import 'package:here_sdk/core.dart';
import 'package:here_sdk/mapview.dart';

import '../data/global.dart' as globals;

// A callback to notify the hosting widget.
typedef ShowDialogFunction = void Function(String title, String message);

class HereController {
  HereMapController _hereMapController;
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

    print({globals.locationData?.latitude, globals.locationData?.longitude});

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
      GeoOrientationUpdate geoOrient = GeoOrientationUpdate(is3dMap ? globals.compassHeading : 0, is3dMap ? 45 : 0);

      _hereMapController.camera.startAnimation(MapCameraAnimationFactory.flyToWithOrientationAndZoom(geoCoords, geoOrient, mapMeasureZoom, 0, is3dMap ? Duration(milliseconds: 300) : Duration(seconds: 1)));
    }
  }

  void updateLocationIndicator(gps.LocationData? locationData, double heading, [bool isActive = true]){
    if (locationData == null) return;
    locationIndicator.updateLocation(defineLocation(locationData, heading));
    locationIndicator.isActive = isActive;
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

}
