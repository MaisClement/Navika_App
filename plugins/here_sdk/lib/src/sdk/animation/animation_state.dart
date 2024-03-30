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

/// Describes the possible states of an animation.
enum AnimationState {
    /// Animation is started.
    started,
    /// Animation is completed.
    completed,
    /// Animation is cancelled.
    cancelled
}

// AnimationState "private" section, not exported.

int sdkAnimationAnimationstateToFfi(AnimationState value) {
  switch (value) {
  case AnimationState.started:
    return 0;
  case AnimationState.completed:
    return 1;
  case AnimationState.cancelled:
    return 2;
  default:
    throw StateError("Invalid enum value $value for AnimationState enum.");
  }
}

AnimationState sdkAnimationAnimationstateFromFfi(int handle) {
  switch (handle) {
  case 0:
    return AnimationState.started;
  case 1:
    return AnimationState.completed;
  case 2:
    return AnimationState.cancelled;
  default:
    throw StateError("Invalid numeric value $handle for AnimationState enum.");
  }
}

void sdkAnimationAnimationstateReleaseFfiHandle(int handle) {}

final _sdkAnimationAnimationstateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_animation_AnimationState_create_handle_nullable'));
final _sdkAnimationAnimationstateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_AnimationState_release_handle_nullable'));
final _sdkAnimationAnimationstateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_AnimationState_get_value_nullable'));

Pointer<Void> sdkAnimationAnimationstateToFfiNullable(AnimationState? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkAnimationAnimationstateToFfi(value);
  final result = _sdkAnimationAnimationstateCreateHandleNullable(_handle);
  sdkAnimationAnimationstateReleaseFfiHandle(_handle);
  return result;
}

AnimationState? sdkAnimationAnimationstateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkAnimationAnimationstateGetValueNullable(handle);
  final result = sdkAnimationAnimationstateFromFfi(_handle);
  sdkAnimationAnimationstateReleaseFfiHandle(_handle);
  return result;
}

void sdkAnimationAnimationstateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationAnimationstateReleaseHandleNullable(handle);

// End of AnimationState "private" section.


