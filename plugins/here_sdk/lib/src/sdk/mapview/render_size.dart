// Copyright (c) 2019-2023 HERE Global B.V. and its affiliate(s).
// All rights reserved.
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

/// Represents size of visual elements drawn on the map.

class RenderSize {
}

/// Defines different units in which the size is described.
enum RenderSizeUnit {
    /// Size expressed in physical pixels on the device screen.
    pixels,
    /// Size expressed in device independent pixels, meaning that on devices
    /// with different display resolutions and sizes it will represent approximately
    /// the same physical (in millimeters, inches, etc.) size.
    densityIndependentPixels,
    /// Size expressed in meters, meaning it will stay constant relative to map content
    /// and change on the screen as the map is zoomed in and out.
    meters
}

// RenderSizeUnit "private" section, not exported.

int sdkMapviewRendersizeUnitToFfi(RenderSizeUnit value) {
  switch (value) {
  case RenderSizeUnit.pixels:
    return 0;
  case RenderSizeUnit.densityIndependentPixels:
    return 1;
  case RenderSizeUnit.meters:
    return 2;
  default:
    throw StateError("Invalid enum value $value for RenderSizeUnit enum.");
  }
}

RenderSizeUnit sdkMapviewRendersizeUnitFromFfi(int handle) {
  switch (handle) {
  case 0:
    return RenderSizeUnit.pixels;
  case 1:
    return RenderSizeUnit.densityIndependentPixels;
  case 2:
    return RenderSizeUnit.meters;
  default:
    throw StateError("Invalid numeric value $handle for RenderSizeUnit enum.");
  }
}

void sdkMapviewRendersizeUnitReleaseFfiHandle(int handle) {}

final _sdkMapviewRendersizeUnitCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_RenderSize_Unit_create_handle_nullable'));
final _sdkMapviewRendersizeUnitReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RenderSize_Unit_release_handle_nullable'));
final _sdkMapviewRendersizeUnitGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RenderSize_Unit_get_value_nullable'));

Pointer<Void> sdkMapviewRendersizeUnitToFfiNullable(RenderSizeUnit? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewRendersizeUnitToFfi(value);
  final result = _sdkMapviewRendersizeUnitCreateHandleNullable(_handle);
  sdkMapviewRendersizeUnitReleaseFfiHandle(_handle);
  return result;
}

RenderSizeUnit? sdkMapviewRendersizeUnitFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewRendersizeUnitGetValueNullable(handle);
  final result = sdkMapviewRendersizeUnitFromFfi(_handle);
  sdkMapviewRendersizeUnitReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewRendersizeUnitReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewRendersizeUnitReleaseHandleNullable(handle);

// End of RenderSizeUnit "private" section.

// RenderSize "private" section, not exported.

final _sdkMapviewRendersizeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_sdk_mapview_RenderSize_create_handle'));
final _sdkMapviewRendersizeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RenderSize_release_handle'));



Pointer<Void> sdkMapviewRendersizeToFfi(RenderSize value) {
  final _result = _sdkMapviewRendersizeCreateHandle();
  return _result;
}

RenderSize sdkMapviewRendersizeFromFfi(Pointer<Void> handle) {
  try {
    return RenderSize(
    );
  } finally {
  }
}

void sdkMapviewRendersizeReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewRendersizeReleaseHandle(handle);

// Nullable RenderSize

final _sdkMapviewRendersizeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RenderSize_create_handle_nullable'));
final _sdkMapviewRendersizeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RenderSize_release_handle_nullable'));
final _sdkMapviewRendersizeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RenderSize_get_value_nullable'));

Pointer<Void> sdkMapviewRendersizeToFfiNullable(RenderSize? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewRendersizeToFfi(value);
  final result = _sdkMapviewRendersizeCreateHandleNullable(_handle);
  sdkMapviewRendersizeReleaseFfiHandle(_handle);
  return result;
}

RenderSize? sdkMapviewRendersizeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewRendersizeGetValueNullable(handle);
  final result = sdkMapviewRendersizeFromFfi(_handle);
  sdkMapviewRendersizeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewRendersizeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewRendersizeReleaseHandleNullable(handle);

// End of RenderSize "private" section.


