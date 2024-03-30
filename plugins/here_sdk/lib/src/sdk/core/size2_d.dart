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

/// Represents the size of a 2D structure.

class Size2D {
  /// The width represents the size along the X axis. Default is 0.0.
  double width;

  /// The height represents the size along the Y axis. Default is 0.0.
  double height;

  /// Creates a new instance.
  Size2D.zero()
      : width = 0.0, height = 0.0;
  /// Creates a new instance.
  /// [width] The width represents the size along the X axis. Default is 0.0.
  /// [height] The height represents the size along the Y axis. Default is 0.0.
  Size2D(this.width, this.height);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Size2D) return false;
    Size2D _other = other;
    return width == _other.width &&
        height == _other.height;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + width.hashCode;
    result = 31 * result + height.hashCode;
    return result;
  }
}


// Size2D "private" section, not exported.

final _sdkCoreSize2dCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('here_sdk_sdk_core_Size2D_create_handle'));
final _sdkCoreSize2dReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Size2D_release_handle'));
final _sdkCoreSize2dGetFieldwidth = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Size2D_get_field_width'));
final _sdkCoreSize2dGetFieldheight = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Size2D_get_field_height'));



Pointer<Void> sdkCoreSize2dToFfi(Size2D value) {
  final _widthHandle = (value.width);
  final _heightHandle = (value.height);
  final _result = _sdkCoreSize2dCreateHandle(_widthHandle, _heightHandle);
  
  
  return _result;
}

Size2D sdkCoreSize2dFromFfi(Pointer<Void> handle) {
  final _widthHandle = _sdkCoreSize2dGetFieldwidth(handle);
  final _heightHandle = _sdkCoreSize2dGetFieldheight(handle);
  try {
    return Size2D(
      (_widthHandle), 
      (_heightHandle)
    );
  } finally {
    
    
  }
}

void sdkCoreSize2dReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreSize2dReleaseHandle(handle);

// Nullable Size2D

final _sdkCoreSize2dCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Size2D_create_handle_nullable'));
final _sdkCoreSize2dReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Size2D_release_handle_nullable'));
final _sdkCoreSize2dGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Size2D_get_value_nullable'));

Pointer<Void> sdkCoreSize2dToFfiNullable(Size2D? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreSize2dToFfi(value);
  final result = _sdkCoreSize2dCreateHandleNullable(_handle);
  sdkCoreSize2dReleaseFfiHandle(_handle);
  return result;
}

Size2D? sdkCoreSize2dFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreSize2dGetValueNullable(handle);
  final result = sdkCoreSize2dFromFfi(_handle);
  sdkCoreSize2dReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreSize2dReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreSize2dReleaseHandleNullable(handle);

// End of Size2D "private" section.


