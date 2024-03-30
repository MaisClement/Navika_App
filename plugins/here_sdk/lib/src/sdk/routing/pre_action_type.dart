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

/// Identifies the action type.
enum PreActionType {
    /// An action to board a ferry.
    board,
    /// An action to be performed at or during a specific portion of a section.
    wait
}

// PreActionType "private" section, not exported.

int sdkRoutingPreactiontypeToFfi(PreActionType value) {
  switch (value) {
  case PreActionType.board:
    return 0;
  case PreActionType.wait:
    return 1;
  default:
    throw StateError("Invalid enum value $value for PreActionType enum.");
  }
}

PreActionType sdkRoutingPreactiontypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return PreActionType.board;
  case 1:
    return PreActionType.wait;
  default:
    throw StateError("Invalid numeric value $handle for PreActionType enum.");
  }
}

void sdkRoutingPreactiontypeReleaseFfiHandle(int handle) {}

final _sdkRoutingPreactiontypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_PreActionType_create_handle_nullable'));
final _sdkRoutingPreactiontypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PreActionType_release_handle_nullable'));
final _sdkRoutingPreactiontypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PreActionType_get_value_nullable'));

Pointer<Void> sdkRoutingPreactiontypeToFfiNullable(PreActionType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingPreactiontypeToFfi(value);
  final result = _sdkRoutingPreactiontypeCreateHandleNullable(_handle);
  sdkRoutingPreactiontypeReleaseFfiHandle(_handle);
  return result;
}

PreActionType? sdkRoutingPreactiontypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingPreactiontypeGetValueNullable(handle);
  final result = sdkRoutingPreactiontypeFromFfi(_handle);
  sdkRoutingPreactiontypeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingPreactiontypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingPreactiontypeReleaseHandleNullable(handle);

// End of PreActionType "private" section.


