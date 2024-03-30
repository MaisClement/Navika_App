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

/// Specifies type of interpolation performed between keyframes.
enum KeyframeInterpolationMode {
    /// Step interpolation with sharp transition in the middle.
    step,
    /// Linear interpolation between consecutive values.
    linear,
    /// Smooth interpolation using an arbitrary spline, e.g. Catmull-Rom.
    smooth
}

// KeyframeInterpolationMode "private" section, not exported.

int sdkAnimationKeyframeinterpolationmodeToFfi(KeyframeInterpolationMode value) {
  switch (value) {
  case KeyframeInterpolationMode.step:
    return 0;
  case KeyframeInterpolationMode.linear:
    return 1;
  case KeyframeInterpolationMode.smooth:
    return 2;
  default:
    throw StateError("Invalid enum value $value for KeyframeInterpolationMode enum.");
  }
}

KeyframeInterpolationMode sdkAnimationKeyframeinterpolationmodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return KeyframeInterpolationMode.step;
  case 1:
    return KeyframeInterpolationMode.linear;
  case 2:
    return KeyframeInterpolationMode.smooth;
  default:
    throw StateError("Invalid numeric value $handle for KeyframeInterpolationMode enum.");
  }
}

void sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(int handle) {}

final _sdkAnimationKeyframeinterpolationmodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_animation_KeyframeInterpolationMode_create_handle_nullable'));
final _sdkAnimationKeyframeinterpolationmodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_KeyframeInterpolationMode_release_handle_nullable'));
final _sdkAnimationKeyframeinterpolationmodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_KeyframeInterpolationMode_get_value_nullable'));

Pointer<Void> sdkAnimationKeyframeinterpolationmodeToFfiNullable(KeyframeInterpolationMode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkAnimationKeyframeinterpolationmodeToFfi(value);
  final result = _sdkAnimationKeyframeinterpolationmodeCreateHandleNullable(_handle);
  sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(_handle);
  return result;
}

KeyframeInterpolationMode? sdkAnimationKeyframeinterpolationmodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkAnimationKeyframeinterpolationmodeGetValueNullable(handle);
  final result = sdkAnimationKeyframeinterpolationmodeFromFfi(_handle);
  sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(_handle);
  return result;
}

void sdkAnimationKeyframeinterpolationmodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationKeyframeinterpolationmodeReleaseHandleNullable(handle);

// End of KeyframeInterpolationMode "private" section.


