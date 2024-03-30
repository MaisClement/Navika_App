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

/// Represents a point in 3D space.

class Point3D {
  /// Position along the X axis. The default value is 0.
  double x;

  /// Position along the Y axis. The default value is 0.
  double y;

  /// Position along the Z axis. The default value is 0.
  double z;

  /// Constructs Point3D instance at coordinate system's origin.
  Point3D.zero()
      : x = 0.0, y = 0.0, z = 0.0;
  /// Constructs Point3D instance from the provided x,y and z values.
  /// [x] Position along the X axis. The default value is 0.
  /// [y] Position along the Y axis. The default value is 0.
  /// [z] Position along the Z axis. The default value is 0.
  Point3D(this.x, this.y, this.z);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Point3D) return false;
    Point3D _other = other;
    return x == _other.x &&
        y == _other.y &&
        z == _other.z;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + x.hashCode;
    result = 31 * result + y.hashCode;
    result = 31 * result + z.hashCode;
    return result;
  }
}


// Point3D "private" section, not exported.

final _sdkCorePoint3dCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Double),
    Pointer<Void> Function(double, double, double)
  >('here_sdk_sdk_core_Point3D_create_handle'));
final _sdkCorePoint3dReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point3D_release_handle'));
final _sdkCorePoint3dGetFieldx = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point3D_get_field_x'));
final _sdkCorePoint3dGetFieldy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point3D_get_field_y'));
final _sdkCorePoint3dGetFieldz = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point3D_get_field_z'));



Pointer<Void> sdkCorePoint3dToFfi(Point3D value) {
  final _xHandle = (value.x);
  final _yHandle = (value.y);
  final _zHandle = (value.z);
  final _result = _sdkCorePoint3dCreateHandle(_xHandle, _yHandle, _zHandle);
  
  
  
  return _result;
}

Point3D sdkCorePoint3dFromFfi(Pointer<Void> handle) {
  final _xHandle = _sdkCorePoint3dGetFieldx(handle);
  final _yHandle = _sdkCorePoint3dGetFieldy(handle);
  final _zHandle = _sdkCorePoint3dGetFieldz(handle);
  try {
    return Point3D(
      (_xHandle), 
      (_yHandle), 
      (_zHandle)
    );
  } finally {
    
    
    
  }
}

void sdkCorePoint3dReleaseFfiHandle(Pointer<Void> handle) => _sdkCorePoint3dReleaseHandle(handle);

// Nullable Point3D

final _sdkCorePoint3dCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point3D_create_handle_nullable'));
final _sdkCorePoint3dReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point3D_release_handle_nullable'));
final _sdkCorePoint3dGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Point3D_get_value_nullable'));

Pointer<Void> sdkCorePoint3dToFfiNullable(Point3D? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCorePoint3dToFfi(value);
  final result = _sdkCorePoint3dCreateHandleNullable(_handle);
  sdkCorePoint3dReleaseFfiHandle(_handle);
  return result;
}

Point3D? sdkCorePoint3dFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCorePoint3dGetValueNullable(handle);
  final result = sdkCorePoint3dFromFfi(_handle);
  sdkCorePoint3dReleaseFfiHandle(_handle);
  return result;
}

void sdkCorePoint3dReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCorePoint3dReleaseHandleNullable(handle);

// End of Point3D "private" section.


