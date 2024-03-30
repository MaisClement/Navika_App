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

/// The shadow quality.
///
/// Controls the quality of the shadow cascade (i.e. the size of the shadow
/// maps and the cascade count), which is shared by all views.
enum ShadowQuality {
    /// Very low
    veryLow,
    /// Low
    low,
    /// Medium
    medium,
    /// High
    high,
    /// Very high
    veryHigh
}

// ShadowQuality "private" section, not exported.

int sdkMapviewShadowqualityToFfi(ShadowQuality value) {
  switch (value) {
  case ShadowQuality.veryLow:
    return 0;
  case ShadowQuality.low:
    return 1;
  case ShadowQuality.medium:
    return 2;
  case ShadowQuality.high:
    return 3;
  case ShadowQuality.veryHigh:
    return 4;
  default:
    throw StateError("Invalid enum value $value for ShadowQuality enum.");
  }
}

ShadowQuality sdkMapviewShadowqualityFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ShadowQuality.veryLow;
  case 1:
    return ShadowQuality.low;
  case 2:
    return ShadowQuality.medium;
  case 3:
    return ShadowQuality.high;
  case 4:
    return ShadowQuality.veryHigh;
  default:
    throw StateError("Invalid numeric value $handle for ShadowQuality enum.");
  }
}

void sdkMapviewShadowqualityReleaseFfiHandle(int handle) {}

final _sdkMapviewShadowqualityCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_ShadowQuality_create_handle_nullable'));
final _sdkMapviewShadowqualityReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_ShadowQuality_release_handle_nullable'));
final _sdkMapviewShadowqualityGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_ShadowQuality_get_value_nullable'));

Pointer<Void> sdkMapviewShadowqualityToFfiNullable(ShadowQuality? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewShadowqualityToFfi(value);
  final result = _sdkMapviewShadowqualityCreateHandleNullable(_handle);
  sdkMapviewShadowqualityReleaseFfiHandle(_handle);
  return result;
}

ShadowQuality? sdkMapviewShadowqualityFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewShadowqualityGetValueNullable(handle);
  final result = sdkMapviewShadowqualityFromFfi(_handle);
  sdkMapviewShadowqualityReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewShadowqualityReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewShadowqualityReleaseHandleNullable(handle);

// End of ShadowQuality "private" section.


