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

/// Defines if the waypoint is a stop over, or a hint for a desired polyline of a
/// route.
enum WaypointType {
    /// Stopover mode will cause the route to exactly pass through this point, generating
    /// maneuvers and splitting the route into sections. Turns of 180 degrees are generated if
    /// necessary.
    stopover,
    /// Acts as a rough position hint for route calculation on how the route should
    /// look like. Does not generate 180 degree turns, nor does it appear in the list of maneuvers.
    /// Imprecise inputs such as a map touch location should be represented as a pass through.
    passThrough
}

// WaypointType "private" section, not exported.

int sdkRoutingWaypointtypeToFfi(WaypointType value) {
  switch (value) {
  case WaypointType.stopover:
    return 0;
  case WaypointType.passThrough:
    return 1;
  default:
    throw StateError("Invalid enum value $value for WaypointType enum.");
  }
}

WaypointType sdkRoutingWaypointtypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return WaypointType.stopover;
  case 1:
    return WaypointType.passThrough;
  default:
    throw StateError("Invalid numeric value $handle for WaypointType enum.");
  }
}

void sdkRoutingWaypointtypeReleaseFfiHandle(int handle) {}

final _sdkRoutingWaypointtypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_WaypointType_create_handle_nullable'));
final _sdkRoutingWaypointtypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_WaypointType_release_handle_nullable'));
final _sdkRoutingWaypointtypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_WaypointType_get_value_nullable'));

Pointer<Void> sdkRoutingWaypointtypeToFfiNullable(WaypointType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingWaypointtypeToFfi(value);
  final result = _sdkRoutingWaypointtypeCreateHandleNullable(_handle);
  sdkRoutingWaypointtypeReleaseFfiHandle(_handle);
  return result;
}

WaypointType? sdkRoutingWaypointtypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingWaypointtypeGetValueNullable(handle);
  final result = sdkRoutingWaypointtypeFromFfi(_handle);
  sdkRoutingWaypointtypeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingWaypointtypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingWaypointtypeReleaseHandleNullable(handle);

// End of WaypointType "private" section.


