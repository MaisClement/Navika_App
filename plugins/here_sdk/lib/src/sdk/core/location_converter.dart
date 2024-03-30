// Copyright (c) 2020-2022 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import 'location_impl.dart';
import 'package:here_sdk/src/sdk/core/location.dart';

class LocationConverter  {

  static Location convertFromInternal(LocationInternal internalLocation) =>
      Location.withCoordinates(internalLocation.coordinates)
        ..time = internalLocation.time
        ..bearingInDegrees = internalLocation.bearingInDegrees
        ..speedInMetersPerSecond = internalLocation.speedInMetersPerSecond
        ..horizontalAccuracyInMeters = internalLocation.horizontalAccuracyInMeters
        ..verticalAccuracyInMeters = internalLocation.verticalAccuracyInMeters
        ..bearingAccuracyInDegrees = internalLocation.bearingAccuracyInDegrees
        ..speedAccuracyInMetersPerSecond = internalLocation.speedAccuracyInMetersPerSecond
        ..timestampSinceBoot = internalLocation.timestampSinceBoot
        ..locationTechnology = internalLocation.locationTechnology
        ..gnssTime = internalLocation.gnssTime;

  static LocationInternal convertToInternal(Location location) =>
    LocationInternal(location.coordinates,
              location.bearingInDegrees,
              location.speedInMetersPerSecond,
              location.time,
              location.horizontalAccuracyInMeters,
              location.verticalAccuracyInMeters,
              location.bearingAccuracyInDegrees,
              location.speedAccuracyInMetersPerSecond,
              location.timestampSinceBoot,
              location.locationTechnology,
              location.gnssTime);
}
