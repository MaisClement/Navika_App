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

/// Defines the style of the HERE watermark logo.
///
/// The dark watermark should be used for custom
/// schemes that are brighter (like daytime) and the light watermark for darker custom schemes (like
/// night or satellite based).
enum WatermarkStyle {
    /// Dark watermark, to be used for brighter daytime map schemes.
    dark,
    /// Light watermark, to be used for darker map schemes like night or satellite.
    light
}

// WatermarkStyle "private" section, not exported.

int sdkMapviewWatermarkstyleToFfi(WatermarkStyle value) {
  switch (value) {
  case WatermarkStyle.dark:
    return 0;
  case WatermarkStyle.light:
    return 1;
  default:
    throw StateError("Invalid enum value $value for WatermarkStyle enum.");
  }
}

WatermarkStyle sdkMapviewWatermarkstyleFromFfi(int handle) {
  switch (handle) {
  case 0:
    return WatermarkStyle.dark;
  case 1:
    return WatermarkStyle.light;
  default:
    throw StateError("Invalid numeric value $handle for WatermarkStyle enum.");
  }
}

void sdkMapviewWatermarkstyleReleaseFfiHandle(int handle) {}

final _sdkMapviewWatermarkstyleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_WatermarkStyle_create_handle_nullable'));
final _sdkMapviewWatermarkstyleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_WatermarkStyle_release_handle_nullable'));
final _sdkMapviewWatermarkstyleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_WatermarkStyle_get_value_nullable'));

Pointer<Void> sdkMapviewWatermarkstyleToFfiNullable(WatermarkStyle? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewWatermarkstyleToFfi(value);
  final result = _sdkMapviewWatermarkstyleCreateHandleNullable(_handle);
  sdkMapviewWatermarkstyleReleaseFfiHandle(_handle);
  return result;
}

WatermarkStyle? sdkMapviewWatermarkstyleFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewWatermarkstyleGetValueNullable(handle);
  final result = sdkMapviewWatermarkstyleFromFfi(_handle);
  sdkMapviewWatermarkstyleReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewWatermarkstyleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewWatermarkstyleReleaseHandleNullable(handle);

// End of WatermarkStyle "private" section.


