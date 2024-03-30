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
import 'package:here_sdk/src/sdk/core/geo_orientation.dart';
import 'package:meta/meta.dart';



/// Describes geodetic orientation update with bearing and tilt.
///
/// Updating an orientation value can be skipped by setting `null` in an appriopriate field.
/// For example, if one wants bearing not to be updated set it to `null`.
@immutable
class GeoOrientationUpdate {
  /// Bearing in degrees. 0 is north up, positive is clockwise.
  /// A `null` value means that bearing is not updated and the current value is kept.
  final double? bearing;

  /// Tilt in degrees. 0 is perpendicular to earth surface, a positive value turns the camera's nose up
  /// and changes the camera's location to ensure that the camera target is not changed.
  /// A `null` value means that tilt is not updated and the current value is kept.
  final double? tilt;

  /// Creates a new instance.

  /// [bearing] Bearing in degrees. 0 is north up, positive is clockwise.
  /// A `null` value means that bearing is not updated and the current value is kept.

  /// [tilt] Tilt in degrees. 0 is perpendicular to earth surface, a positive value turns the camera's nose up
  /// and changes the camera's location to ensure that the camera target is not changed.
  /// A `null` value means that tilt is not updated and the current value is kept.

  const GeoOrientationUpdate._(this.bearing, this.tilt);

  /// [bearing] Bearing in degrees. When the passed value is `null` bearing is not updated and the current value is kept.
  /// NaN value is converted to `null`.
  ///
  /// [tilt] Tilt in degrees. When the passed value is `null` tilt is not updated and the current value is kept.
  /// NaN value is converted to `null`.
  ///
  factory GeoOrientationUpdate(double? bearing, double? tilt) => $prototype.$init(bearing, tilt);
  /// Constructs a new GeoOrientationUpdate instance from a GeoOrientation instance.
  ///
  /// [orientation] A GeoOrientation instance used as a source for a GeoOrientationUpdate instance's values.
  ///
  factory GeoOrientationUpdate.withGeoOrientation(GeoOrientation orientation) => $prototype.withGeoOrientation(orientation);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GeoOrientationUpdate) return false;
    GeoOrientationUpdate _other = other;
    return bearing == _other.bearing &&
        tilt == _other.tilt;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + bearing.hashCode;
    result = 31 * result + tilt.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = GeoOrientationUpdate$Impl();
}


// GeoOrientationUpdate "private" section, not exported.

final _sdkCoreGeoorientationupdateCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_GeoOrientationUpdate_create_handle'));
final _sdkCoreGeoorientationupdateReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoOrientationUpdate_release_handle'));
final _sdkCoreGeoorientationupdateGetFieldbearing = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoOrientationUpdate_get_field_bearing'));
final _sdkCoreGeoorientationupdateGetFieldtilt = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoOrientationUpdate_get_field_tilt'));



/// @nodoc
@visibleForTesting
class GeoOrientationUpdate$Impl {
  GeoOrientationUpdate $init(double? bearing, double? tilt) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_GeoOrientationUpdate_make__Double__Double_'));
    final _bearingHandle = doubleToFfiNullable(bearing);
    final _tiltHandle = doubleToFfiNullable(tilt);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _bearingHandle, _tiltHandle);
    doubleReleaseFfiHandleNullable(_bearingHandle);
    doubleReleaseFfiHandleNullable(_tiltHandle);
    try {
      return sdkCoreGeoorientationupdateFromFfi(__resultHandle);
    } finally {
      sdkCoreGeoorientationupdateReleaseFfiHandle(__resultHandle);

    }

  }

  GeoOrientationUpdate withGeoOrientation(GeoOrientation orientation) {
    final _withGeoOrientationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_GeoOrientationUpdate_make__GeoOrientation'));
    final _orientationHandle = sdkCoreGeoorientationToFfi(orientation);
    final __resultHandle = _withGeoOrientationFfi(__lib.LibraryContext.isolateId, _orientationHandle);
    sdkCoreGeoorientationReleaseFfiHandle(_orientationHandle);
    try {
      return sdkCoreGeoorientationupdateFromFfi(__resultHandle);
    } finally {
      sdkCoreGeoorientationupdateReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkCoreGeoorientationupdateToFfi(GeoOrientationUpdate value) {
  final _bearingHandle = doubleToFfiNullable(value.bearing);
  final _tiltHandle = doubleToFfiNullable(value.tilt);
  final _result = _sdkCoreGeoorientationupdateCreateHandle(_bearingHandle, _tiltHandle);
  doubleReleaseFfiHandleNullable(_bearingHandle);
  doubleReleaseFfiHandleNullable(_tiltHandle);
  return _result;
}

GeoOrientationUpdate sdkCoreGeoorientationupdateFromFfi(Pointer<Void> handle) {
  final _bearingHandle = _sdkCoreGeoorientationupdateGetFieldbearing(handle);
  final _tiltHandle = _sdkCoreGeoorientationupdateGetFieldtilt(handle);
  try {
    return GeoOrientationUpdate._(
      doubleFromFfiNullable(_bearingHandle), 
      doubleFromFfiNullable(_tiltHandle)
    );
  } finally {
    doubleReleaseFfiHandleNullable(_bearingHandle);
    doubleReleaseFfiHandleNullable(_tiltHandle);
  }
}

void sdkCoreGeoorientationupdateReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreGeoorientationupdateReleaseHandle(handle);

// Nullable GeoOrientationUpdate

final _sdkCoreGeoorientationupdateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoOrientationUpdate_create_handle_nullable'));
final _sdkCoreGeoorientationupdateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoOrientationUpdate_release_handle_nullable'));
final _sdkCoreGeoorientationupdateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoOrientationUpdate_get_value_nullable'));

Pointer<Void> sdkCoreGeoorientationupdateToFfiNullable(GeoOrientationUpdate? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreGeoorientationupdateToFfi(value);
  final result = _sdkCoreGeoorientationupdateCreateHandleNullable(_handle);
  sdkCoreGeoorientationupdateReleaseFfiHandle(_handle);
  return result;
}

GeoOrientationUpdate? sdkCoreGeoorientationupdateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreGeoorientationupdateGetValueNullable(handle);
  final result = sdkCoreGeoorientationupdateFromFfi(_handle);
  sdkCoreGeoorientationupdateReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreGeoorientationupdateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreGeoorientationupdateReleaseHandleNullable(handle);

// End of GeoOrientationUpdate "private" section.


