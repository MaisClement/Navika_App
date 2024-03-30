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
enum JunctionsTraversability {
    /// All junctions are open.
    allOpen,
    /// All junctions are closed.
    allClosed,
    /// Junctions at the beginning and end of the roadway are open, intermediate junctions are closed.
    intermediateClosedEdgeOpen,
    /// First edge junction is open, all others are closed.
    startOpenOthersClosed,
    /// First edge junction is open, all others are closed.
    endOpenOthersClosed
}

// JunctionsTraversability "private" section, not exported.

int sdkTrafficJunctionstraversabilityToFfi(JunctionsTraversability value) {
  switch (value) {
  case JunctionsTraversability.allOpen:
    return 0;
  case JunctionsTraversability.allClosed:
    return 1;
  case JunctionsTraversability.intermediateClosedEdgeOpen:
    return 2;
  case JunctionsTraversability.startOpenOthersClosed:
    return 3;
  case JunctionsTraversability.endOpenOthersClosed:
    return 4;
  default:
    throw StateError("Invalid enum value $value for JunctionsTraversability enum.");
  }
}

JunctionsTraversability sdkTrafficJunctionstraversabilityFromFfi(int handle) {
  switch (handle) {
  case 0:
    return JunctionsTraversability.allOpen;
  case 1:
    return JunctionsTraversability.allClosed;
  case 2:
    return JunctionsTraversability.intermediateClosedEdgeOpen;
  case 3:
    return JunctionsTraversability.startOpenOthersClosed;
  case 4:
    return JunctionsTraversability.endOpenOthersClosed;
  default:
    throw StateError("Invalid numeric value $handle for JunctionsTraversability enum.");
  }
}

void sdkTrafficJunctionstraversabilityReleaseFfiHandle(int handle) {}

final _sdkTrafficJunctionstraversabilityCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_traffic_JunctionsTraversability_create_handle_nullable'));
final _sdkTrafficJunctionstraversabilityReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_JunctionsTraversability_release_handle_nullable'));
final _sdkTrafficJunctionstraversabilityGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_JunctionsTraversability_get_value_nullable'));

Pointer<Void> sdkTrafficJunctionstraversabilityToFfiNullable(JunctionsTraversability? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficJunctionstraversabilityToFfi(value);
  final result = _sdkTrafficJunctionstraversabilityCreateHandleNullable(_handle);
  sdkTrafficJunctionstraversabilityReleaseFfiHandle(_handle);
  return result;
}

JunctionsTraversability? sdkTrafficJunctionstraversabilityFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficJunctionstraversabilityGetValueNullable(handle);
  final result = sdkTrafficJunctionstraversabilityFromFfi(_handle);
  sdkTrafficJunctionstraversabilityReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficJunctionstraversabilityReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficJunctionstraversabilityReleaseHandleNullable(handle);

// End of JunctionsTraversability "private" section.


