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

/// Enum that represents the type of a gesture.
enum GestureType {
    /// Single-tap performed with two fingers. When performed on a map view, this instantly zooms
    /// the map out by a factor of 0.5 and the map becomes twice as small.
    twoFingerTap,
    /// Double-tap performed with one finger. When performed on a map view, this instantly zooms
    /// the map in by a factor of 2 and the map becomes twice as big.
    doubleTap,
    /// Panning gesture with a single finger. When performed on a map view, this continuously moves
    /// the map.
    pan,
    /// Vertical panning gesture with two fingers. When performed on a map view, this continuously
    /// tilts the map.
    twoFingerPan,
    /// Pinching and rotating gesture using two fingers. When performed on a map view, this
    /// continuously scales, zooms or rotates the map.
    pinchRotate
}

// GestureType "private" section, not exported.

int sdkGesturesGesturetypeToFfi(GestureType value) {
  switch (value) {
  case GestureType.twoFingerTap:
    return 0;
  case GestureType.doubleTap:
    return 1;
  case GestureType.pan:
    return 2;
  case GestureType.twoFingerPan:
    return 3;
  case GestureType.pinchRotate:
    return 4;
  default:
    throw StateError("Invalid enum value $value for GestureType enum.");
  }
}

GestureType sdkGesturesGesturetypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return GestureType.twoFingerTap;
  case 1:
    return GestureType.doubleTap;
  case 2:
    return GestureType.pan;
  case 3:
    return GestureType.twoFingerPan;
  case 4:
    return GestureType.pinchRotate;
  default:
    throw StateError("Invalid numeric value $handle for GestureType enum.");
  }
}

void sdkGesturesGesturetypeReleaseFfiHandle(int handle) {}

final _sdkGesturesGesturetypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_gestures_GestureType_create_handle_nullable'));
final _sdkGesturesGesturetypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_GestureType_release_handle_nullable'));
final _sdkGesturesGesturetypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_GestureType_get_value_nullable'));

Pointer<Void> sdkGesturesGesturetypeToFfiNullable(GestureType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkGesturesGesturetypeToFfi(value);
  final result = _sdkGesturesGesturetypeCreateHandleNullable(_handle);
  sdkGesturesGesturetypeReleaseFfiHandle(_handle);
  return result;
}

GestureType? sdkGesturesGesturetypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkGesturesGesturetypeGetValueNullable(handle);
  final result = sdkGesturesGesturetypeFromFfi(_handle);
  sdkGesturesGesturetypeReleaseFfiHandle(_handle);
  return result;
}

void sdkGesturesGesturetypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkGesturesGesturetypeReleaseHandleNullable(handle);

// End of GestureType "private" section.


