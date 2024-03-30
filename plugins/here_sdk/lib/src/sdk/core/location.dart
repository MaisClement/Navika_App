// Copyright (c) 2018-2023 HERE Global B.V. and its affiliate(s).
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

import 'dart:ffi';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;
import 'package:here_sdk/src/sdk/core/location_technology.dart';
import 'location_converter.dart';

/// Describes a location in the world at a given time.

class LocationInternal {
  /// The geographic coordinates of the location.
  GeoCoordinates coordinates;

  /// Bearing (also known as course) is the device's horizontal direction of travel.
  /// Starts at 0 in the geographical north and rotates around the compass in a clockwise
  /// direction. This means for going north it is equal to 0, for northeast it is 45,
  /// for east it is 90 and so on. Note that this may be different from the orientation of
  /// the device. If it cannot be determined, the value is `null`. Otherwise, it is
  /// guaranteed to be in the range \[0, 360).
  double? bearingInDegrees;

  /// Current speed of the device. If it cannot be determined, the value is `null`.
  double? speedInMetersPerSecond;

  /// The time at which the location was determined.
  DateTime? time;

  /// The estimated horizontal accuracy. The actual location will lie within this radius of uncertainty.
  double? horizontalAccuracyInMeters;

  /// Estimated vertical accuracy.
  /// Given that the received Location contains the altitude, the real value of the altitude
  /// is estimated to lie within the following range:
  /// \[altitude - vertical accuracy, altitude + vertical accuracy\].
  /// For example, when the altitude is equal to 50 and the vertical accuracy
  /// is 8, then the actual value is most likely in the range \[42, 58\].
  double? verticalAccuracyInMeters;

  /// Estimated bearing accuracy for this location, in degrees.
  /// If it cannot be determined, the value is `null`.
  double? bearingAccuracyInDegrees;

  /// Estimated speed accuracy of this location, in meters per second.
  /// If it cannot be determined, the value is `null`.
  double? speedAccuracyInMetersPerSecond;

  /// The time at which the location was determined, relative to device
  /// boot time. This time is monotonic and not affected by leap time or other system
  /// time adjustments, so this is the recommended basis for general purpose interval timing
  /// between location updates.
  /// If it cannot be determined, the value is `null`.
  Duration? timestampSinceBoot;

  /// Optional technology or provider of this location.
  /// If it cannot be determined, the value is `null`.
  LocationTechnology? locationTechnology;

  /// Optional gnss time at which the location was determined.
  /// It is a time interval from the Unix time epoch in milliseconds.
  /// If it cannot be determined, the value is `null`.
  Duration? gnssTime;

  /// Creates an instance of the class with specified parameters.

  /// [coordinates] The geographic coordinates of the location.

  /// [bearingInDegrees] Bearing (also known as course) is the device's horizontal direction of travel.
  /// Starts at 0 in the geographical north and rotates around the compass in a clockwise
  /// direction. This means for going north it is equal to 0, for northeast it is 45,
  /// for east it is 90 and so on. Note that this may be different from the orientation of
  /// the device. If it cannot be determined, the value is `null`. Otherwise, it is
  /// guaranteed to be in the range \[0, 360).

  /// [speedInMetersPerSecond] Current speed of the device. If it cannot be determined, the value is `null`.

  /// [time] The time at which the location was determined.

  /// [horizontalAccuracyInMeters] The estimated horizontal accuracy. The actual location will lie within this radius of uncertainty.

  /// [verticalAccuracyInMeters] Estimated vertical accuracy.
  /// Given that the received Location contains the altitude, the real value of the altitude
  /// is estimated to lie within the following range:
  /// \[altitude - vertical accuracy, altitude + vertical accuracy\].
  /// For example, when the altitude is equal to 50 and the vertical accuracy
  /// is 8, then the actual value is most likely in the range \[42, 58\].

  /// [bearingAccuracyInDegrees] Estimated bearing accuracy for this location, in degrees.
  /// If it cannot be determined, the value is `null`.

  /// [speedAccuracyInMetersPerSecond] Estimated speed accuracy of this location, in meters per second.
  /// If it cannot be determined, the value is `null`.

  /// [timestampSinceBoot] The time at which the location was determined, relative to device
  /// boot time. This time is monotonic and not affected by leap time or other system
  /// time adjustments, so this is the recommended basis for general purpose interval timing
  /// between location updates.
  /// If it cannot be determined, the value is `null`.

  /// [locationTechnology] Optional technology or provider of this location.
  /// If it cannot be determined, the value is `null`.

  /// [gnssTime] Optional gnss time at which the location was determined.
  /// It is a time interval from the Unix time epoch in milliseconds.
  /// If it cannot be determined, the value is `null`.

  LocationInternal(this.coordinates, this.bearingInDegrees, this.speedInMetersPerSecond, this.time, this.horizontalAccuracyInMeters, this.verticalAccuracyInMeters, this.bearingAccuracyInDegrees, this.speedAccuracyInMetersPerSecond, this.timestampSinceBoot, this.locationTechnology, this.gnssTime);
  LocationInternal.withDefaults(GeoCoordinates coordinates)
    : coordinates = coordinates, bearingInDegrees = null, speedInMetersPerSecond = null, time = null, horizontalAccuracyInMeters = null, verticalAccuracyInMeters = null, bearingAccuracyInDegrees = null, speedAccuracyInMetersPerSecond = null, timestampSinceBoot = null, locationTechnology = null, gnssTime = null;
}


// Location "private" section, not exported.

final _sdkCoreLocationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_Location_create_handle'));
final _sdkCoreLocationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_release_handle'));
final _sdkCoreLocationGetFieldcoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_coordinates'));
final _sdkCoreLocationGetFieldbearingInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_bearingInDegrees'));
final _sdkCoreLocationGetFieldspeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_speedInMetersPerSecond'));
final _sdkCoreLocationGetFieldtime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_time'));
final _sdkCoreLocationGetFieldhorizontalAccuracyInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_horizontalAccuracyInMeters'));
final _sdkCoreLocationGetFieldverticalAccuracyInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_verticalAccuracyInMeters'));
final _sdkCoreLocationGetFieldbearingAccuracyInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_bearingAccuracyInDegrees'));
final _sdkCoreLocationGetFieldspeedAccuracyInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_speedAccuracyInMetersPerSecond'));
final _sdkCoreLocationGetFieldtimestampSinceBoot = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_timestampSinceBoot'));
final _sdkCoreLocationGetFieldlocationTechnology = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_locationTechnology'));
final _sdkCoreLocationGetFieldgnssTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_field_gnssTime'));



Pointer<Void> sdkCoreLocationToFfi(location_impl.Location valueExternal) {
  final value = LocationConverter.convertToInternal(valueExternal);
  final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(value.coordinates);
  final _bearingInDegreesHandle = doubleToFfiNullable(value.bearingInDegrees);
  final _speedInMetersPerSecondHandle = doubleToFfiNullable(value.speedInMetersPerSecond);
  final _timeHandle = dateToFfiNullable(value.time);
  final _horizontalAccuracyInMetersHandle = doubleToFfiNullable(value.horizontalAccuracyInMeters);
  final _verticalAccuracyInMetersHandle = doubleToFfiNullable(value.verticalAccuracyInMeters);
  final _bearingAccuracyInDegreesHandle = doubleToFfiNullable(value.bearingAccuracyInDegrees);
  final _speedAccuracyInMetersPerSecondHandle = doubleToFfiNullable(value.speedAccuracyInMetersPerSecond);
  final _timestampSinceBootHandle = durationToFfiNullable(value.timestampSinceBoot);
  final _locationTechnologyHandle = sdkCoreLocationtechnologyToFfiNullable(value.locationTechnology);
  final _gnssTimeHandle = durationToFfiNullable(value.gnssTime);
  final _result = _sdkCoreLocationCreateHandle(_coordinatesHandle, _bearingInDegreesHandle, _speedInMetersPerSecondHandle, _timeHandle, _horizontalAccuracyInMetersHandle, _verticalAccuracyInMetersHandle, _bearingAccuracyInDegreesHandle, _speedAccuracyInMetersPerSecondHandle, _timestampSinceBootHandle, _locationTechnologyHandle, _gnssTimeHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
  doubleReleaseFfiHandleNullable(_bearingInDegreesHandle);
  doubleReleaseFfiHandleNullable(_speedInMetersPerSecondHandle);
  dateReleaseFfiHandleNullable(_timeHandle);
  doubleReleaseFfiHandleNullable(_horizontalAccuracyInMetersHandle);
  doubleReleaseFfiHandleNullable(_verticalAccuracyInMetersHandle);
  doubleReleaseFfiHandleNullable(_bearingAccuracyInDegreesHandle);
  doubleReleaseFfiHandleNullable(_speedAccuracyInMetersPerSecondHandle);
  durationReleaseFfiHandleNullable(_timestampSinceBootHandle);
  sdkCoreLocationtechnologyReleaseFfiHandleNullable(_locationTechnologyHandle);
  durationReleaseFfiHandleNullable(_gnssTimeHandle);
  return _result;
}

location_impl.Location sdkCoreLocationFromFfi(Pointer<Void> handle) {
  final _coordinatesHandle = _sdkCoreLocationGetFieldcoordinates(handle);
  final _bearingInDegreesHandle = _sdkCoreLocationGetFieldbearingInDegrees(handle);
  final _speedInMetersPerSecondHandle = _sdkCoreLocationGetFieldspeedInMetersPerSecond(handle);
  final _timeHandle = _sdkCoreLocationGetFieldtime(handle);
  final _horizontalAccuracyInMetersHandle = _sdkCoreLocationGetFieldhorizontalAccuracyInMeters(handle);
  final _verticalAccuracyInMetersHandle = _sdkCoreLocationGetFieldverticalAccuracyInMeters(handle);
  final _bearingAccuracyInDegreesHandle = _sdkCoreLocationGetFieldbearingAccuracyInDegrees(handle);
  final _speedAccuracyInMetersPerSecondHandle = _sdkCoreLocationGetFieldspeedAccuracyInMetersPerSecond(handle);
  final _timestampSinceBootHandle = _sdkCoreLocationGetFieldtimestampSinceBoot(handle);
  final _locationTechnologyHandle = _sdkCoreLocationGetFieldlocationTechnology(handle);
  final _gnssTimeHandle = _sdkCoreLocationGetFieldgnssTime(handle);
  try {
    final resultInternal = LocationInternal(
      sdkCoreGeocoordinatesFromFfi(_coordinatesHandle), 
      doubleFromFfiNullable(_bearingInDegreesHandle), 
      doubleFromFfiNullable(_speedInMetersPerSecondHandle), 
      dateFromFfiNullable(_timeHandle), 
      doubleFromFfiNullable(_horizontalAccuracyInMetersHandle), 
      doubleFromFfiNullable(_verticalAccuracyInMetersHandle), 
      doubleFromFfiNullable(_bearingAccuracyInDegreesHandle), 
      doubleFromFfiNullable(_speedAccuracyInMetersPerSecondHandle), 
      durationFromFfiNullable(_timestampSinceBootHandle), 
      sdkCoreLocationtechnologyFromFfiNullable(_locationTechnologyHandle), 
      durationFromFfiNullable(_gnssTimeHandle)
    );
    return LocationConverter.convertFromInternal(resultInternal);
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    doubleReleaseFfiHandleNullable(_bearingInDegreesHandle);
    doubleReleaseFfiHandleNullable(_speedInMetersPerSecondHandle);
    dateReleaseFfiHandleNullable(_timeHandle);
    doubleReleaseFfiHandleNullable(_horizontalAccuracyInMetersHandle);
    doubleReleaseFfiHandleNullable(_verticalAccuracyInMetersHandle);
    doubleReleaseFfiHandleNullable(_bearingAccuracyInDegreesHandle);
    doubleReleaseFfiHandleNullable(_speedAccuracyInMetersPerSecondHandle);
    durationReleaseFfiHandleNullable(_timestampSinceBootHandle);
    sdkCoreLocationtechnologyReleaseFfiHandleNullable(_locationTechnologyHandle);
    durationReleaseFfiHandleNullable(_gnssTimeHandle);
  }
}

void sdkCoreLocationReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreLocationReleaseHandle(handle);

// Nullable Location

final _sdkCoreLocationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_create_handle_nullable'));
final _sdkCoreLocationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_release_handle_nullable'));
final _sdkCoreLocationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Location_get_value_nullable'));

Pointer<Void> sdkCoreLocationToFfiNullable(location_impl.Location? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreLocationToFfi(value);
  final result = _sdkCoreLocationCreateHandleNullable(_handle);
  sdkCoreLocationReleaseFfiHandle(_handle);
  return result;
}

location_impl.Location? sdkCoreLocationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreLocationGetValueNullable(handle);
  final result = sdkCoreLocationFromFfi(_handle);
  sdkCoreLocationReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreLocationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreLocationReleaseHandleNullable(handle);

// End of Location "private" section.


