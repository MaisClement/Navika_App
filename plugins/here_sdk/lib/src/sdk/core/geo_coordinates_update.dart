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
import 'package:meta/meta.dart';




/// Represents geographical coordinates in 3D space.
///
/// Unlike [GeoCoordinates], its members can be undefined, allowing for APIs
/// that update only the specified parts of geo coordinates.
@immutable
class GeoCoordinatesUpdate {
  /// Optional latitude in degrees.
  final double? latitude;

  /// Optional longitude in degrees.
  final double? longitude;

  /// Optional altitude in meters.
  final double? altitude;

  const GeoCoordinatesUpdate._(this.latitude, this.longitude, this.altitude);
  /// Constructs a GeoCoordinatesUpdate from the provided latitude and
  /// longitude values.
  ///
  /// Corrects values of latitude and longitude if they exceed the ranges.
  ///
  /// [latitude] Latitude in degrees. Positive value means Northern hemisphere.
  /// If the value is out of range of \[-90.0, 90.0\] it's clamped to that range.
  /// NaN value is converted to `null`.
  ///
  /// [longitude] Longitude in degrees. Positive value means Eastern hemisphere.
  /// If the value is out of range of \[-180.0, 180.0\] it's replaced with a value
  /// within the range, representing effectively the same meridian.
  /// NaN value is converted to `null`.
  ///
  factory GeoCoordinatesUpdate(double? latitude, double? longitude) => $prototype.$init(latitude, longitude);
  /// Constructs a GeoCoordinatesUpdate from the provided latitude, longitude
  /// and alt values.
  ///
  /// Corrects values of latitude and longitude if they exceed the ranges.
  ///
  /// [latitude] Latitude in degrees. Positive value means Northern hemisphere.
  /// If the value is out of range of \[-90.0, 90.0\] it's clamped to that range.
  /// NaN value is converted to `null`.
  ///
  /// [longitude] Longitude in degrees. Positive value means Eastern hemisphere.
  /// If the value is out of range of \[-180.0, 180.0\] it's replaced with a value
  /// within the range, representing effectively the same meridian.
  /// NaN value is converted to `null`.
  ///
  /// [altitude] Altitude in meters. NaN value is converted to `null`.
  ///
  factory GeoCoordinatesUpdate.withAltitude(double? latitude, double? longitude, double? altitude) => $prototype.withAltitude(latitude, longitude, altitude);
  /// Constructs a GeoCoordinatesUpdate from GeoCoordinates
  ///
  /// [coordinates] GeoCoordinates to construct GeoCoordinatesUpdate.
  ///
  factory GeoCoordinatesUpdate.fromGeoCoordinates(GeoCoordinates coordinates) => $prototype.fromGeoCoordinates(coordinates);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GeoCoordinatesUpdate) return false;
    GeoCoordinatesUpdate _other = other;
    return latitude == _other.latitude &&
        longitude == _other.longitude &&
        altitude == _other.altitude;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + latitude.hashCode;
    result = 31 * result + longitude.hashCode;
    result = 31 * result + altitude.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = GeoCoordinatesUpdate$Impl();
}


// GeoCoordinatesUpdate "private" section, not exported.

final _sdkCoreGeocoordinatesupdateCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinatesUpdate_create_handle'));
final _sdkCoreGeocoordinatesupdateReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinatesUpdate_release_handle'));
final _sdkCoreGeocoordinatesupdateGetFieldlatitude = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinatesUpdate_get_field_latitude'));
final _sdkCoreGeocoordinatesupdateGetFieldlongitude = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinatesUpdate_get_field_longitude'));
final _sdkCoreGeocoordinatesupdateGetFieldaltitude = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinatesUpdate_get_field_altitude'));



/// @nodoc
@visibleForTesting
class GeoCoordinatesUpdate$Impl {
  GeoCoordinatesUpdate $init(double? latitude, double? longitude) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_GeoCoordinatesUpdate_make__Double__Double_'));
    final _latitudeHandle = doubleToFfiNullable(latitude);
    final _longitudeHandle = doubleToFfiNullable(longitude);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _latitudeHandle, _longitudeHandle);
    doubleReleaseFfiHandleNullable(_latitudeHandle);
    doubleReleaseFfiHandleNullable(_longitudeHandle);
    try {
      return sdkCoreGeocoordinatesupdateFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesupdateReleaseFfiHandle(__resultHandle);

    }

  }

  GeoCoordinatesUpdate withAltitude(double? latitude, double? longitude, double? altitude) {
    final _withAltitudeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_GeoCoordinatesUpdate_make__Double__Double__Double_'));
    final _latitudeHandle = doubleToFfiNullable(latitude);
    final _longitudeHandle = doubleToFfiNullable(longitude);
    final _altitudeHandle = doubleToFfiNullable(altitude);
    final __resultHandle = _withAltitudeFfi(__lib.LibraryContext.isolateId, _latitudeHandle, _longitudeHandle, _altitudeHandle);
    doubleReleaseFfiHandleNullable(_latitudeHandle);
    doubleReleaseFfiHandleNullable(_longitudeHandle);
    doubleReleaseFfiHandleNullable(_altitudeHandle);
    try {
      return sdkCoreGeocoordinatesupdateFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesupdateReleaseFfiHandle(__resultHandle);

    }

  }

  GeoCoordinatesUpdate fromGeoCoordinates(GeoCoordinates coordinates) {
    final _fromGeoCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_GeoCoordinatesUpdate_make__GeoCoordinates'));
    final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(coordinates);
    final __resultHandle = _fromGeoCoordinatesFfi(__lib.LibraryContext.isolateId, _coordinatesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    try {
      return sdkCoreGeocoordinatesupdateFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesupdateReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkCoreGeocoordinatesupdateToFfi(GeoCoordinatesUpdate value) {
  final _latitudeHandle = doubleToFfiNullable(value.latitude);
  final _longitudeHandle = doubleToFfiNullable(value.longitude);
  final _altitudeHandle = doubleToFfiNullable(value.altitude);
  final _result = _sdkCoreGeocoordinatesupdateCreateHandle(_latitudeHandle, _longitudeHandle, _altitudeHandle);
  doubleReleaseFfiHandleNullable(_latitudeHandle);
  doubleReleaseFfiHandleNullable(_longitudeHandle);
  doubleReleaseFfiHandleNullable(_altitudeHandle);
  return _result;
}

GeoCoordinatesUpdate sdkCoreGeocoordinatesupdateFromFfi(Pointer<Void> handle) {
  final _latitudeHandle = _sdkCoreGeocoordinatesupdateGetFieldlatitude(handle);
  final _longitudeHandle = _sdkCoreGeocoordinatesupdateGetFieldlongitude(handle);
  final _altitudeHandle = _sdkCoreGeocoordinatesupdateGetFieldaltitude(handle);
  try {
    return GeoCoordinatesUpdate._(
      doubleFromFfiNullable(_latitudeHandle), 
      doubleFromFfiNullable(_longitudeHandle), 
      doubleFromFfiNullable(_altitudeHandle)
    );
  } finally {
    doubleReleaseFfiHandleNullable(_latitudeHandle);
    doubleReleaseFfiHandleNullable(_longitudeHandle);
    doubleReleaseFfiHandleNullable(_altitudeHandle);
  }
}

void sdkCoreGeocoordinatesupdateReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreGeocoordinatesupdateReleaseHandle(handle);

// Nullable GeoCoordinatesUpdate

final _sdkCoreGeocoordinatesupdateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinatesUpdate_create_handle_nullable'));
final _sdkCoreGeocoordinatesupdateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinatesUpdate_release_handle_nullable'));
final _sdkCoreGeocoordinatesupdateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinatesUpdate_get_value_nullable'));

Pointer<Void> sdkCoreGeocoordinatesupdateToFfiNullable(GeoCoordinatesUpdate? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreGeocoordinatesupdateToFfi(value);
  final result = _sdkCoreGeocoordinatesupdateCreateHandleNullable(_handle);
  sdkCoreGeocoordinatesupdateReleaseFfiHandle(_handle);
  return result;
}

GeoCoordinatesUpdate? sdkCoreGeocoordinatesupdateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreGeocoordinatesupdateGetValueNullable(handle);
  final result = sdkCoreGeocoordinatesupdateFromFfi(_handle);
  sdkCoreGeocoordinatesupdateReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreGeocoordinatesupdateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreGeocoordinatesupdateReleaseHandleNullable(handle);

// End of GeoCoordinatesUpdate "private" section.


