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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:meta/meta.dart';



/// A geographical area that wraps around a geographical polyline with a given distance.
///
/// The corridor has round edges at the endpoints of the polyline. The distance from
/// any point of the polyline to the closest border of the corridor is always the same.
@immutable
class GeoCorridor {
  /// The polyline passing through the middle of the corridor.
  final List<GeoCoordinates> polyline;

  /// The shortest distance from any point on the polyline to the border of the corridor.
  final int? halfWidthInMeters;

  const GeoCorridor._(this.polyline, this.halfWidthInMeters);
  /// Constructs a GeoCorridor from the provided polyline and half-width in meters.
  ///
  /// [polyline] The polyline passing through the middle of the corridor.
  ///
  /// [halfWidthInMeters] The shortest distance from any point on the polyline to the border of the corridor.
  ///
  factory GeoCorridor(List<GeoCoordinates> polyline, int halfWidthInMeters) => $prototype.$init(polyline, halfWidthInMeters);
  /// Constructs a GeoCorridor from the provided polyline.
  ///
  /// [polyline] The polyline passing through the middle of the corridor.
  ///
  factory GeoCorridor.withPolyline(List<GeoCoordinates> polyline) => $prototype.withPolyline(polyline);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GeoCorridor) return false;
    GeoCorridor _other = other;
    return DeepCollectionEquality().equals(polyline, _other.polyline) &&
        halfWidthInMeters == _other.halfWidthInMeters;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(polyline);
    result = 31 * result + halfWidthInMeters.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = GeoCorridor$Impl();
}


// GeoCorridor "private" section, not exported.

final _sdkCoreGeocorridorCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_create_handle'));
final _sdkCoreGeocorridorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_release_handle'));
final _sdkCoreGeocorridorGetFieldpolyline = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_get_field_polyline'));
final _sdkCoreGeocorridorGetFieldhalfWidthInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_get_field_halfWidthInMeters'));



/// @nodoc
@visibleForTesting
class GeoCorridor$Impl {
  GeoCorridor $init(List<GeoCoordinates> polyline, int halfWidthInMeters) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Int32), Pointer<Void> Function(int, Pointer<Void>, int)>('here_sdk_sdk_core_GeoCorridor_make__ListOf_sdk_core_GeoCoordinates_Int'));
    final _polylineHandle = heresdkCoreBindingslistofSdkCoreGeocoordinatesToFfi(polyline);
    final _halfWidthInMetersHandle = (halfWidthInMeters);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _polylineHandle, _halfWidthInMetersHandle);
    heresdkCoreBindingslistofSdkCoreGeocoordinatesReleaseFfiHandle(_polylineHandle);

    try {
      return sdkCoreGeocorridorFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocorridorReleaseFfiHandle(__resultHandle);

    }

  }

  GeoCorridor withPolyline(List<GeoCoordinates> polyline) {
    final _withPolylineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_GeoCorridor_make__ListOf_sdk_core_GeoCoordinates'));
    final _polylineHandle = heresdkCoreBindingslistofSdkCoreGeocoordinatesToFfi(polyline);
    final __resultHandle = _withPolylineFfi(__lib.LibraryContext.isolateId, _polylineHandle);
    heresdkCoreBindingslistofSdkCoreGeocoordinatesReleaseFfiHandle(_polylineHandle);
    try {
      return sdkCoreGeocorridorFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocorridorReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkCoreGeocorridorToFfi(GeoCorridor value) {
  final _polylineHandle = heresdkCoreBindingslistofSdkCoreGeocoordinatesToFfi(value.polyline);
  final _halfWidthInMetersHandle = intToFfiNullable(value.halfWidthInMeters);
  final _result = _sdkCoreGeocorridorCreateHandle(_polylineHandle, _halfWidthInMetersHandle);
  heresdkCoreBindingslistofSdkCoreGeocoordinatesReleaseFfiHandle(_polylineHandle);
  intReleaseFfiHandleNullable(_halfWidthInMetersHandle);
  return _result;
}

GeoCorridor sdkCoreGeocorridorFromFfi(Pointer<Void> handle) {
  final _polylineHandle = _sdkCoreGeocorridorGetFieldpolyline(handle);
  final _halfWidthInMetersHandle = _sdkCoreGeocorridorGetFieldhalfWidthInMeters(handle);
  try {
    return GeoCorridor._(
      heresdkCoreBindingslistofSdkCoreGeocoordinatesFromFfi(_polylineHandle), 
      intFromFfiNullable(_halfWidthInMetersHandle)
    );
  } finally {
    heresdkCoreBindingslistofSdkCoreGeocoordinatesReleaseFfiHandle(_polylineHandle);
    intReleaseFfiHandleNullable(_halfWidthInMetersHandle);
  }
}

void sdkCoreGeocorridorReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreGeocorridorReleaseHandle(handle);

// Nullable GeoCorridor

final _sdkCoreGeocorridorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_create_handle_nullable'));
final _sdkCoreGeocorridorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_release_handle_nullable'));
final _sdkCoreGeocorridorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoCorridor_get_value_nullable'));

Pointer<Void> sdkCoreGeocorridorToFfiNullable(GeoCorridor? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreGeocorridorToFfi(value);
  final result = _sdkCoreGeocorridorCreateHandleNullable(_handle);
  sdkCoreGeocorridorReleaseFfiHandle(_handle);
  return result;
}

GeoCorridor? sdkCoreGeocorridorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreGeocorridorGetValueNullable(handle);
  final result = sdkCoreGeocorridorFromFfi(_handle);
  sdkCoreGeocorridorReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreGeocorridorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreGeocorridorReleaseHandleNullable(handle);

// End of GeoCorridor "private" section.


