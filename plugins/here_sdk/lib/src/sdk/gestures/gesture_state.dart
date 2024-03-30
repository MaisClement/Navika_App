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

/// Represents the state of the gesture.
enum GestureState {
    /// The gesture has started.
    begin,
    /// The gesture was updated.
    update,
    /// The gesture was completed.
    end,
    /// The gesture was canceled. This will happen when the map view looses the focus for example
    /// due to displaying a modal dialog or the app being sent to background.
    cancel
}

// GestureState "private" section, not exported.

int sdkGesturesGesturestateToFfi(GestureState value) {
  switch (value) {
  case GestureState.begin:
    return 0;
  case GestureState.update:
    return 1;
  case GestureState.end:
    return 2;
  case GestureState.cancel:
    return 3;
  default:
    throw StateError("Invalid enum value $value for GestureState enum.");
  }
}

GestureState sdkGesturesGesturestateFromFfi(int handle) {
  switch (handle) {
  case 0:
    return GestureState.begin;
  case 1:
    return GestureState.update;
  case 2:
    return GestureState.end;
  case 3:
    return GestureState.cancel;
  default:
    throw StateError("Invalid numeric value $handle for GestureState enum.");
  }
}

void sdkGesturesGesturestateReleaseFfiHandle(int handle) {}

final _sdkGesturesGesturestateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_gestures_GestureState_create_handle_nullable'));
final _sdkGesturesGesturestateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_GestureState_release_handle_nullable'));
final _sdkGesturesGesturestateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_GestureState_get_value_nullable'));

Pointer<Void> sdkGesturesGesturestateToFfiNullable(GestureState? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkGesturesGesturestateToFfi(value);
  final result = _sdkGesturesGesturestateCreateHandleNullable(_handle);
  sdkGesturesGesturestateReleaseFfiHandle(_handle);
  return result;
}

GestureState? sdkGesturesGesturestateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkGesturesGesturestateGetValueNullable(handle);
  final result = sdkGesturesGesturestateFromFfi(_handle);
  sdkGesturesGesturestateReleaseFfiHandle(_handle);
  return result;
}

void sdkGesturesGesturestateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkGesturesGesturestateReleaseHandleNullable(handle);

// End of GestureState "private" section.


