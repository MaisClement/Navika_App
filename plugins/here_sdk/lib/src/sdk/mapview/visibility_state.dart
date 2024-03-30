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

/// Represents the visibility state of an SDK map view's object.
enum VisibilityState {
    /// An SDK map view's object is visible.
    visible,
    /// An SDK map view's object is hidden.
    hidden
}

// VisibilityState "private" section, not exported.

int sdkMapviewVisibilitystateToFfi(VisibilityState value) {
  switch (value) {
  case VisibilityState.visible:
    return 0;
  case VisibilityState.hidden:
    return 1;
  default:
    throw StateError("Invalid enum value $value for VisibilityState enum.");
  }
}

VisibilityState sdkMapviewVisibilitystateFromFfi(int handle) {
  switch (handle) {
  case 0:
    return VisibilityState.visible;
  case 1:
    return VisibilityState.hidden;
  default:
    throw StateError("Invalid numeric value $handle for VisibilityState enum.");
  }
}

void sdkMapviewVisibilitystateReleaseFfiHandle(int handle) {}

final _sdkMapviewVisibilitystateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_VisibilityState_create_handle_nullable'));
final _sdkMapviewVisibilitystateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_VisibilityState_release_handle_nullable'));
final _sdkMapviewVisibilitystateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_VisibilityState_get_value_nullable'));

Pointer<Void> sdkMapviewVisibilitystateToFfiNullable(VisibilityState? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewVisibilitystateToFfi(value);
  final result = _sdkMapviewVisibilitystateCreateHandleNullable(_handle);
  sdkMapviewVisibilitystateReleaseFfiHandle(_handle);
  return result;
}

VisibilityState? sdkMapviewVisibilitystateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewVisibilitystateGetValueNullable(handle);
  final result = sdkMapviewVisibilitystateFromFfi(_handle);
  sdkMapviewVisibilitystateReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewVisibilitystateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewVisibilitystateReleaseHandleNullable(handle);

// End of VisibilityState "private" section.


