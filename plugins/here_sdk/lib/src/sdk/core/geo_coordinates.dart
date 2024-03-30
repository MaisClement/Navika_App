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
import 'package:meta/meta.dart';





/// Represents geographical coordinates in 3D space.
@immutable
class GeoCoordinates {
  /// Latitude in degrees.
  final double latitude;

  /// Longitude in degrees.
  final double longitude;

  /// Optional altitude in meters.
  /// By convention, on iOS devices, altitude is set as meters relative to the
  /// mean sea level.
  /// On Android devices, altitude is set as meters relative to the WGS 84
  /// reference ellipsoid.
  final double? altitude;

  const GeoCoordinates._(this.latitude, this.longitude, this.altitude);
  /// Constructs a GeoCoordinates from the provided latitude, longitude and altitude values.
  ///
  /// Corrects values of lat and long if they exceed the ranges.
  ///
  /// [latitude] Latitude in degrees. Positive value means Northern hemisphere.
  /// If the value is out of range of \[-90.0, 90.0\] it's clamped to that range.
  /// NaN value is converted to 0.0.
  ///
  /// [longitude] Longitude in degrees. Positive value means Eastern hemisphere.
  /// If the value is out of range of \[-180.0, 180.0\] it's replaced with a value
  /// within the range, representing effectively the same meridian.
  /// NaN value is converted to 0.0.
  ///
  /// [altitude] Altitude in meters. NaN value is converted to `null`.
  ///
  factory GeoCoordinates.withAltitude(double latitude, double longitude, double altitude) => $prototype.withAltitude(latitude, longitude, altitude);
  /// Constructs a GeoCoordinates from the provided latitude and longitude values.
  ///
  /// Corrects values of latitude and longitude if they exceed the ranges.
  /// Altitude set to `null`.
  ///
  /// [latitude] Latitude in degrees. Positive value means Northern hemisphere.
  /// If the value is out of range of \[-90.0, 90.0\] it's clamped to that range.
  /// NaN value is converted to 0.0.
  ///
  /// [longitude] Longitude in degrees. Positive value means Eastern hemisphere.
  /// If the value is out of range of \[-180.0, 180.0\] it's replaced with a value
  /// within the range, representing effectively the same meridian.
  /// NaN value is converted to 0.0.
  ///
  factory GeoCoordinates(double latitude, double longitude) => $prototype.$init(latitude, longitude);
  /// Computes distance (in meters) along the great circle between two points.
  ///
  /// This method ignores altitude of both points.
  ///
  /// [point] Coordinates of the point to which the distance is computed.
  ///
  /// Returns [double]. distance in meters.
  ///
  double distanceTo(GeoCoordinates point) => $prototype.distanceTo(this, point);
  /// Constructs GeoCoordinates from the provided string in specified format.
  ///
  /// Corrects values of lat and long if they exceed the ranges.
  /// If the latitude value is out of range of \[-90.0, 90.0\] it's clamped to that range.
  /// If the longitude value is out of range of \[-180.0, 180.0\] it's replaced with a value
  /// within the range, representing effectively the same meridian.
  /// Examples: `53.43762,-13.65468`.
  /// `49°59'56.948"N, 15°48'22.989"E`
  /// `50d4m17.698N 14d24m2.826E`
  /// `49.9991522N, 150.8063858E`
  /// `40°26′47″N 79°58′36″W`
  ///
  /// [input] String representing GeoCoordinates in one of supported formats.
  ///
  /// Returns [GeoCoordinates?]. Created GeoCoordinates, or 'null' if string was not in appropriate format.
  ///
  static GeoCoordinates? fromString(String input) => $prototype.fromString(input);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GeoCoordinates) return false;
    GeoCoordinates _other = other;
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
  static dynamic $prototype = GeoCoordinates$Impl();
}


// GeoCoordinates "private" section, not exported.

final _sdkCoreGeocoordinatesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Pointer<Void>),
    Pointer<Void> Function(double, double, Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_create_handle'));
final _sdkCoreGeocoordinatesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_release_handle'));
final _sdkCoreGeocoordinatesGetFieldlatitude = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_get_field_latitude'));
final _sdkCoreGeocoordinatesGetFieldlongitude = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_get_field_longitude'));
final _sdkCoreGeocoordinatesGetFieldaltitude = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_get_field_altitude'));



/// @nodoc
@visibleForTesting
class GeoCoordinates$Impl {
  double distanceTo(GeoCoordinates $that, GeoCoordinates point) {
    final _distanceToFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>), double Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoCoordinates_distanceTo__GeoCoordinates'));
    final _pointHandle = sdkCoreGeocoordinatesToFfi(point);
    final _handle = sdkCoreGeocoordinatesToFfi($that);
    final __resultHandle = _distanceToFfi(_handle, __lib.LibraryContext.isolateId, _pointHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_handle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_pointHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  GeoCoordinates? fromString(String input) {
    final _fromStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_GeoCoordinates_fromString__String'));
    final _inputHandle = stringToFfi(input);
    final __resultHandle = _fromStringFfi(__lib.LibraryContext.isolateId, _inputHandle);
    stringReleaseFfiHandle(_inputHandle);
    try {
      return sdkCoreGeocoordinatesFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandleNullable(__resultHandle);

    }

  }

  GeoCoordinates withAltitude(double latitude, double longitude, double altitude) {
    final _withAltitudeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double, Double), Pointer<Void> Function(int, double, double, double)>('here_sdk_sdk_core_GeoCoordinates_make__Double_Double_Double'));
    final _latitudeHandle = (latitude);
    final _longitudeHandle = (longitude);
    final _altitudeHandle = (altitude);
    final __resultHandle = _withAltitudeFfi(__lib.LibraryContext.isolateId, _latitudeHandle, _longitudeHandle, _altitudeHandle);



    try {
      return sdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }

  GeoCoordinates $init(double latitude, double longitude) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('here_sdk_sdk_core_GeoCoordinates_make__Double_Double'));
    final _latitudeHandle = (latitude);
    final _longitudeHandle = (longitude);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _latitudeHandle, _longitudeHandle);


    try {
      return sdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkCoreGeocoordinatesToFfi(GeoCoordinates value) {
  final _latitudeHandle = (value.latitude);
  final _longitudeHandle = (value.longitude);
  final _altitudeHandle = doubleToFfiNullable(value.altitude);
  final _result = _sdkCoreGeocoordinatesCreateHandle(_latitudeHandle, _longitudeHandle, _altitudeHandle);
  
  
  doubleReleaseFfiHandleNullable(_altitudeHandle);
  return _result;
}

GeoCoordinates sdkCoreGeocoordinatesFromFfi(Pointer<Void> handle) {
  final _latitudeHandle = _sdkCoreGeocoordinatesGetFieldlatitude(handle);
  final _longitudeHandle = _sdkCoreGeocoordinatesGetFieldlongitude(handle);
  final _altitudeHandle = _sdkCoreGeocoordinatesGetFieldaltitude(handle);
  try {
    return GeoCoordinates._(
      (_latitudeHandle), 
      (_longitudeHandle), 
      doubleFromFfiNullable(_altitudeHandle)
    );
  } finally {
    
    
    doubleReleaseFfiHandleNullable(_altitudeHandle);
  }
}

void sdkCoreGeocoordinatesReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreGeocoordinatesReleaseHandle(handle);

// Nullable GeoCoordinates

final _sdkCoreGeocoordinatesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_create_handle_nullable'));
final _sdkCoreGeocoordinatesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_release_handle_nullable'));
final _sdkCoreGeocoordinatesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCoordinates_get_value_nullable'));

Pointer<Void> sdkCoreGeocoordinatesToFfiNullable(GeoCoordinates? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreGeocoordinatesToFfi(value);
  final result = _sdkCoreGeocoordinatesCreateHandleNullable(_handle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_handle);
  return result;
}

GeoCoordinates? sdkCoreGeocoordinatesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreGeocoordinatesGetValueNullable(handle);
  final result = sdkCoreGeocoordinatesFromFfi(_handle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreGeocoordinatesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreGeocoordinatesReleaseHandleNullable(handle);

// End of GeoCoordinates "private" section.


