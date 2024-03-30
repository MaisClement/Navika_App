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
import 'package:meta/meta.dart';


/// Geodetic orientation with bearing, tilt and roll.
@immutable
class GeoOrientation {
  /// Bearing in degrees, from the true North in clockwise direction.
  /// Bearing axis is perpendicular to the ground and passes through the target coordinate.
  final double bearing;

  /// Tilt in degrees. Tilt axis is parallel to the ground and passes through the target coordinate.
  final double tilt;

  /// Creates a new instance.

  /// [bearing] Bearing in degrees, from the true North in clockwise direction.
  /// Bearing axis is perpendicular to the ground and passes through the target coordinate.

  /// [tilt] Tilt in degrees. Tilt axis is parallel to the ground and passes through the target coordinate.

  const GeoOrientation._(this.bearing, this.tilt);

  /// [bearing] Bearing in degrees. NaN value is converted to 0.0.
  ///
  /// [tilt] Tilt in degrees. NaN value is converted to 0.0.
  ///
  factory GeoOrientation(double bearing, double tilt) => $prototype.$init(bearing, tilt);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GeoOrientation) return false;
    GeoOrientation _other = other;
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
  static dynamic $prototype = GeoOrientation$Impl();
}


// GeoOrientation "private" section, not exported.

final _sdkCoreGeoorientationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('here_sdk_sdk_core_GeoOrientation_create_handle'));
final _sdkCoreGeoorientationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoOrientation_release_handle'));
final _sdkCoreGeoorientationGetFieldbearing = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoOrientation_get_field_bearing'));
final _sdkCoreGeoorientationGetFieldtilt = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoOrientation_get_field_tilt'));



/// @nodoc
@visibleForTesting
class GeoOrientation$Impl {
  GeoOrientation $init(double bearing, double tilt) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('here_sdk_sdk_core_GeoOrientation_make__Double_Double'));
    final _bearingHandle = (bearing);
    final _tiltHandle = (tilt);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _bearingHandle, _tiltHandle);


    try {
      return sdkCoreGeoorientationFromFfi(__resultHandle);
    } finally {
      sdkCoreGeoorientationReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkCoreGeoorientationToFfi(GeoOrientation value) {
  final _bearingHandle = (value.bearing);
  final _tiltHandle = (value.tilt);
  final _result = _sdkCoreGeoorientationCreateHandle(_bearingHandle, _tiltHandle);
  
  
  return _result;
}

GeoOrientation sdkCoreGeoorientationFromFfi(Pointer<Void> handle) {
  final _bearingHandle = _sdkCoreGeoorientationGetFieldbearing(handle);
  final _tiltHandle = _sdkCoreGeoorientationGetFieldtilt(handle);
  try {
    return GeoOrientation._(
      (_bearingHandle), 
      (_tiltHandle)
    );
  } finally {
    
    
  }
}

void sdkCoreGeoorientationReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreGeoorientationReleaseHandle(handle);

// Nullable GeoOrientation

final _sdkCoreGeoorientationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoOrientation_create_handle_nullable'));
final _sdkCoreGeoorientationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoOrientation_release_handle_nullable'));
final _sdkCoreGeoorientationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoOrientation_get_value_nullable'));

Pointer<Void> sdkCoreGeoorientationToFfiNullable(GeoOrientation? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreGeoorientationToFfi(value);
  final result = _sdkCoreGeoorientationCreateHandleNullable(_handle);
  sdkCoreGeoorientationReleaseFfiHandle(_handle);
  return result;
}

GeoOrientation? sdkCoreGeoorientationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreGeoorientationGetValueNullable(handle);
  final result = sdkCoreGeoorientationFromFfi(_handle);
  sdkCoreGeoorientationReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreGeoorientationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreGeoorientationReleaseHandleNullable(handle);

// End of GeoOrientation "private" section.


