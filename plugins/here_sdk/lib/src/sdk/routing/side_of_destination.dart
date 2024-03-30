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

/// Specifies the side of street on which the destination is located.
enum SideOfDestination {
    /// Undefined.
    undefined,
    /// Left.
    left,
    /// Right.
    right
}

// SideOfDestination "private" section, not exported.

int sdkRoutingSideofdestinationToFfi(SideOfDestination value) {
  switch (value) {
  case SideOfDestination.undefined:
    return 0;
  case SideOfDestination.left:
    return 1;
  case SideOfDestination.right:
    return 2;
  default:
    throw StateError("Invalid enum value $value for SideOfDestination enum.");
  }
}

SideOfDestination sdkRoutingSideofdestinationFromFfi(int handle) {
  switch (handle) {
  case 0:
    return SideOfDestination.undefined;
  case 1:
    return SideOfDestination.left;
  case 2:
    return SideOfDestination.right;
  default:
    throw StateError("Invalid numeric value $handle for SideOfDestination enum.");
  }
}

void sdkRoutingSideofdestinationReleaseFfiHandle(int handle) {}

final _sdkRoutingSideofdestinationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_SideOfDestination_create_handle_nullable'));
final _sdkRoutingSideofdestinationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SideOfDestination_release_handle_nullable'));
final _sdkRoutingSideofdestinationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SideOfDestination_get_value_nullable'));

Pointer<Void> sdkRoutingSideofdestinationToFfiNullable(SideOfDestination? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingSideofdestinationToFfi(value);
  final result = _sdkRoutingSideofdestinationCreateHandleNullable(_handle);
  sdkRoutingSideofdestinationReleaseFfiHandle(_handle);
  return result;
}

SideOfDestination? sdkRoutingSideofdestinationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingSideofdestinationGetValueNullable(handle);
  final result = sdkRoutingSideofdestinationFromFfi(_handle);
  sdkRoutingSideofdestinationReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingSideofdestinationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingSideofdestinationReleaseHandleNullable(handle);

// End of SideOfDestination "private" section.


