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

/// Junctions traversability of some traffic incident or flow section.
enum Traversability {
    /// The roadway is open and can be driven upon.
    open,
    /// The roadway is closed (blocked) and cannot be driven upon.
    closed,
    /// The roadway is reversible but is currently not routable.
    reversibleNotRoutable
}

// Traversability "private" section, not exported.

int sdkTrafficTraversabilityToFfi(Traversability value) {
  switch (value) {
  case Traversability.open:
    return 0;
  case Traversability.closed:
    return 1;
  case Traversability.reversibleNotRoutable:
    return 2;
  default:
    throw StateError("Invalid enum value $value for Traversability enum.");
  }
}

Traversability sdkTrafficTraversabilityFromFfi(int handle) {
  switch (handle) {
  case 0:
    return Traversability.open;
  case 1:
    return Traversability.closed;
  case 2:
    return Traversability.reversibleNotRoutable;
  default:
    throw StateError("Invalid numeric value $handle for Traversability enum.");
  }
}

void sdkTrafficTraversabilityReleaseFfiHandle(int handle) {}

final _sdkTrafficTraversabilityCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_traffic_Traversability_create_handle_nullable'));
final _sdkTrafficTraversabilityReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_Traversability_release_handle_nullable'));
final _sdkTrafficTraversabilityGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_Traversability_get_value_nullable'));

Pointer<Void> sdkTrafficTraversabilityToFfiNullable(Traversability? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficTraversabilityToFfi(value);
  final result = _sdkTrafficTraversabilityCreateHandleNullable(_handle);
  sdkTrafficTraversabilityReleaseFfiHandle(_handle);
  return result;
}

Traversability? sdkTrafficTraversabilityFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficTraversabilityGetValueNullable(handle);
  final result = sdkTrafficTraversabilityFromFfi(_handle);
  sdkTrafficTraversabilityReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficTraversabilityReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTraversabilityReleaseHandleNullable(handle);

// End of Traversability "private" section.


