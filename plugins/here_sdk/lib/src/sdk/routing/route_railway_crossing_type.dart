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

/// Identify possible type of route railway crossing.
enum RouteRailwayCrossingType {
    /// Information about railway crossing is not available.
    unknown,
    /// Railway crossing is protected with a barrier.
    protectedWithBarrier,
    /// Railway crossing is not protected with a barrier.
    unprotectedWithBarrier
}

// RouteRailwayCrossingType "private" section, not exported.

int sdkRoutingRouterailwaycrossingtypeToFfi(RouteRailwayCrossingType value) {
  switch (value) {
  case RouteRailwayCrossingType.unknown:
    return 0;
  case RouteRailwayCrossingType.protectedWithBarrier:
    return 1;
  case RouteRailwayCrossingType.unprotectedWithBarrier:
    return 2;
  default:
    throw StateError("Invalid enum value $value for RouteRailwayCrossingType enum.");
  }
}

RouteRailwayCrossingType sdkRoutingRouterailwaycrossingtypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return RouteRailwayCrossingType.unknown;
  case 1:
    return RouteRailwayCrossingType.protectedWithBarrier;
  case 2:
    return RouteRailwayCrossingType.unprotectedWithBarrier;
  default:
    throw StateError("Invalid numeric value $handle for RouteRailwayCrossingType enum.");
  }
}

void sdkRoutingRouterailwaycrossingtypeReleaseFfiHandle(int handle) {}

final _sdkRoutingRouterailwaycrossingtypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_RouteRailwayCrossingType_create_handle_nullable'));
final _sdkRoutingRouterailwaycrossingtypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteRailwayCrossingType_release_handle_nullable'));
final _sdkRoutingRouterailwaycrossingtypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteRailwayCrossingType_get_value_nullable'));

Pointer<Void> sdkRoutingRouterailwaycrossingtypeToFfiNullable(RouteRailwayCrossingType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingRouterailwaycrossingtypeToFfi(value);
  final result = _sdkRoutingRouterailwaycrossingtypeCreateHandleNullable(_handle);
  sdkRoutingRouterailwaycrossingtypeReleaseFfiHandle(_handle);
  return result;
}

RouteRailwayCrossingType? sdkRoutingRouterailwaycrossingtypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingRouterailwaycrossingtypeGetValueNullable(handle);
  final result = sdkRoutingRouterailwaycrossingtypeFromFfi(_handle);
  sdkRoutingRouterailwaycrossingtypeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingRouterailwaycrossingtypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRouterailwaycrossingtypeReleaseHandleNullable(handle);

// End of RouteRailwayCrossingType "private" section.


