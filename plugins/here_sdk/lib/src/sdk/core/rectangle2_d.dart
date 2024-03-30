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
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/core/size2_d.dart';

/// Represents a 2D rectangle defined by the origin and size.

class Rectangle2D {
  /// The origin specifies the top-left corner of the rectangle.
  /// When this point is used to indicate the coordinates on a view,
  /// then (0,0) will mark the top-left corner of the view. The size determines
  /// the width and height of the rectangle. The width expands towards the right of the view.
  /// The height expands towards the bottom of the view.
  Point2D origin;

  /// The size specifies the width and height of the rectangle.
  Size2D size;

  /// Creates a new instance.

  /// [origin] The origin specifies the top-left corner of the rectangle.
  /// When this point is used to indicate the coordinates on a view,
  /// then (0,0) will mark the top-left corner of the view. The size determines
  /// the width and height of the rectangle. The width expands towards the right of the view.
  /// The height expands towards the bottom of the view.

  /// [size] The size specifies the width and height of the rectangle.

  Rectangle2D(this.origin, this.size);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Rectangle2D) return false;
    Rectangle2D _other = other;
    return origin == _other.origin &&
        size == _other.size;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + origin.hashCode;
    result = 31 * result + size.hashCode;
    return result;
  }
}


// Rectangle2D "private" section, not exported.

final _sdkCoreRectangle2dCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_Rectangle2D_create_handle'));
final _sdkCoreRectangle2dReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Rectangle2D_release_handle'));
final _sdkCoreRectangle2dGetFieldorigin = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Rectangle2D_get_field_origin'));
final _sdkCoreRectangle2dGetFieldsize = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Rectangle2D_get_field_size'));



Pointer<Void> sdkCoreRectangle2dToFfi(Rectangle2D value) {
  final _originHandle = sdkCorePoint2dToFfi(value.origin);
  final _sizeHandle = sdkCoreSize2dToFfi(value.size);
  final _result = _sdkCoreRectangle2dCreateHandle(_originHandle, _sizeHandle);
  sdkCorePoint2dReleaseFfiHandle(_originHandle);
  sdkCoreSize2dReleaseFfiHandle(_sizeHandle);
  return _result;
}

Rectangle2D sdkCoreRectangle2dFromFfi(Pointer<Void> handle) {
  final _originHandle = _sdkCoreRectangle2dGetFieldorigin(handle);
  final _sizeHandle = _sdkCoreRectangle2dGetFieldsize(handle);
  try {
    return Rectangle2D(
      sdkCorePoint2dFromFfi(_originHandle), 
      sdkCoreSize2dFromFfi(_sizeHandle)
    );
  } finally {
    sdkCorePoint2dReleaseFfiHandle(_originHandle);
    sdkCoreSize2dReleaseFfiHandle(_sizeHandle);
  }
}

void sdkCoreRectangle2dReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreRectangle2dReleaseHandle(handle);

// Nullable Rectangle2D

final _sdkCoreRectangle2dCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Rectangle2D_create_handle_nullable'));
final _sdkCoreRectangle2dReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Rectangle2D_release_handle_nullable'));
final _sdkCoreRectangle2dGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Rectangle2D_get_value_nullable'));

Pointer<Void> sdkCoreRectangle2dToFfiNullable(Rectangle2D? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreRectangle2dToFfi(value);
  final result = _sdkCoreRectangle2dCreateHandleNullable(_handle);
  sdkCoreRectangle2dReleaseFfiHandle(_handle);
  return result;
}

Rectangle2D? sdkCoreRectangle2dFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreRectangle2dGetValueNullable(handle);
  final result = sdkCoreRectangle2dFromFfi(_handle);
  sdkCoreRectangle2dReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreRectangle2dReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreRectangle2dReleaseHandleNullable(handle);

// End of Rectangle2D "private" section.


