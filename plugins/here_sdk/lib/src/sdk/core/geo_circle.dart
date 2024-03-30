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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:meta/meta.dart';


/// Represents a circle area in 2D space.
@immutable
class GeoCircle {
  /// Center of circle.
  final GeoCoordinates center;

  /// Radius in meters.
  final double radiusInMeters;

  const GeoCircle._(this.center, this.radiusInMeters);
  /// Creates a new instance of a GeoCircle.
  ///
  /// [center] Center of circle.
  ///
  /// [radiusInMeters] Radius in meters.
  ///
  factory GeoCircle(GeoCoordinates center, double radiusInMeters) => $prototype.$init(center, radiusInMeters);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GeoCircle) return false;
    GeoCircle _other = other;
    return center == _other.center &&
        radiusInMeters == _other.radiusInMeters;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + center.hashCode;
    result = 31 * result + radiusInMeters.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = GeoCircle$Impl();
}


// GeoCircle "private" section, not exported.

final _sdkCoreGeocircleCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Double),
    Pointer<Void> Function(Pointer<Void>, double)
  >('here_sdk_sdk_core_GeoCircle_create_handle'));
final _sdkCoreGeocircleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCircle_release_handle'));
final _sdkCoreGeocircleGetFieldcenter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCircle_get_field_center'));
final _sdkCoreGeocircleGetFieldradiusInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCircle_get_field_radiusInMeters'));



/// @nodoc
@visibleForTesting
class GeoCircle$Impl {
  GeoCircle $init(GeoCoordinates center, double radiusInMeters) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Double), Pointer<Void> Function(int, Pointer<Void>, double)>('here_sdk_sdk_core_GeoCircle_make__GeoCoordinates_Double'));
    final _centerHandle = sdkCoreGeocoordinatesToFfi(center);
    final _radiusInMetersHandle = (radiusInMeters);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _centerHandle, _radiusInMetersHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_centerHandle);

    try {
      return sdkCoreGeocircleFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocircleReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkCoreGeocircleToFfi(GeoCircle value) {
  final _centerHandle = sdkCoreGeocoordinatesToFfi(value.center);
  final _radiusInMetersHandle = (value.radiusInMeters);
  final _result = _sdkCoreGeocircleCreateHandle(_centerHandle, _radiusInMetersHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_centerHandle);
  
  return _result;
}

GeoCircle sdkCoreGeocircleFromFfi(Pointer<Void> handle) {
  final _centerHandle = _sdkCoreGeocircleGetFieldcenter(handle);
  final _radiusInMetersHandle = _sdkCoreGeocircleGetFieldradiusInMeters(handle);
  try {
    return GeoCircle._(
      sdkCoreGeocoordinatesFromFfi(_centerHandle), 
      (_radiusInMetersHandle)
    );
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandle(_centerHandle);
    
  }
}

void sdkCoreGeocircleReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreGeocircleReleaseHandle(handle);

// Nullable GeoCircle

final _sdkCoreGeocircleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCircle_create_handle_nullable'));
final _sdkCoreGeocircleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCircle_release_handle_nullable'));
final _sdkCoreGeocircleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCircle_get_value_nullable'));

Pointer<Void> sdkCoreGeocircleToFfiNullable(GeoCircle? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreGeocircleToFfi(value);
  final result = _sdkCoreGeocircleCreateHandleNullable(_handle);
  sdkCoreGeocircleReleaseFfiHandle(_handle);
  return result;
}

GeoCircle? sdkCoreGeocircleFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreGeocircleGetValueNullable(handle);
  final result = sdkCoreGeocircleFromFfi(_handle);
  sdkCoreGeocircleReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreGeocircleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreGeocircleReleaseHandleNullable(handle);

// End of GeoCircle "private" section.


