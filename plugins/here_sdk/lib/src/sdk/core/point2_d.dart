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

/// Represents a point in 2D space.
///
/// When this point is used to indicate coordinates on a view,
/// then (0,0) will mark the top-left corner of the view.

class Point2D {
  /// Position along the X axis. The default value is 0.
  double x;

  /// Position along the Y axis. The default value is 0.
  double y;

  /// Creates a new instance.
  Point2D.zero()
      : x = 0.0, y = 0.0;
  /// Creates a new instance.
  /// [x] Position along the X axis. The default value is 0.
  /// [y] Position along the Y axis. The default value is 0.
  Point2D(this.x, this.y);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Point2D) return false;
    Point2D _other = other;
    return x == _other.x &&
        y == _other.y;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + x.hashCode;
    result = 31 * result + y.hashCode;
    return result;
  }
}


// Point2D "private" section, not exported.

final _sdkCorePoint2dCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('here_sdk_sdk_core_Point2D_create_handle'));
final _sdkCorePoint2dReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point2D_release_handle'));
final _sdkCorePoint2dGetFieldx = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point2D_get_field_x'));
final _sdkCorePoint2dGetFieldy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point2D_get_field_y'));



Pointer<Void> sdkCorePoint2dToFfi(Point2D value) {
  final _xHandle = (value.x);
  final _yHandle = (value.y);
  final _result = _sdkCorePoint2dCreateHandle(_xHandle, _yHandle);
  
  
  return _result;
}

Point2D sdkCorePoint2dFromFfi(Pointer<Void> handle) {
  final _xHandle = _sdkCorePoint2dGetFieldx(handle);
  final _yHandle = _sdkCorePoint2dGetFieldy(handle);
  try {
    return Point2D(
      (_xHandle), 
      (_yHandle)
    );
  } finally {
    
    
  }
}

void sdkCorePoint2dReleaseFfiHandle(Pointer<Void> handle) => _sdkCorePoint2dReleaseHandle(handle);

// Nullable Point2D

final _sdkCorePoint2dCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point2D_create_handle_nullable'));
final _sdkCorePoint2dReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point2D_release_handle_nullable'));
final _sdkCorePoint2dGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point2D_get_value_nullable'));

Pointer<Void> sdkCorePoint2dToFfiNullable(Point2D? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCorePoint2dToFfi(value);
  final result = _sdkCorePoint2dCreateHandleNullable(_handle);
  sdkCorePoint2dReleaseFfiHandle(_handle);
  return result;
}

Point2D? sdkCorePoint2dFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCorePoint2dGetValueNullable(handle);
  final result = sdkCorePoint2dFromFfi(_handle);
  sdkCorePoint2dReleaseFfiHandle(_handle);
  return result;
}

void sdkCorePoint2dReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCorePoint2dReleaseHandleNullable(handle);

// End of Point2D "private" section.


