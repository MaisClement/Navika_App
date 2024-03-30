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

/// Traffic optimization mode that defines whether and what kind of traffic information should be considered during route calculation.
enum TrafficOptimizationMode {
    /// Traffic optimization is enabled, the shape of the route will be adjusted according to the traffic situation that
    /// depends on the [RouteOptions.departureTime] or [RouteOptions.arrivalTime]. As a result, streets with heavy traffic
    /// will be avoided whenever possible.
    timeDependent,
    /// Only long-term road closures are taken into account. Both [RouteOptions.departureTime]
    /// and [RouteOptions.arrivalTime] are ignored, and the route will be shaped disregarding all
    /// the available current and historical traffic information, except long-term road closures.
    longTermClosuresOnly,
    /// Traffic optimization is completely disabled, including long-term road closures. Both [RouteOptions.departureTime]
    /// and [RouteOptions.arrivalTime] are ignored, and the route will be shaped disregarding all
    /// the available current and historical traffic information.
    disabled
}

// TrafficOptimizationMode "private" section, not exported.

int sdkRoutingTrafficoptimizationmodeToFfi(TrafficOptimizationMode value) {
  switch (value) {
  case TrafficOptimizationMode.timeDependent:
    return 0;
  case TrafficOptimizationMode.longTermClosuresOnly:
    return 1;
  case TrafficOptimizationMode.disabled:
    return 2;
  default:
    throw StateError("Invalid enum value $value for TrafficOptimizationMode enum.");
  }
}

TrafficOptimizationMode sdkRoutingTrafficoptimizationmodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TrafficOptimizationMode.timeDependent;
  case 1:
    return TrafficOptimizationMode.longTermClosuresOnly;
  case 2:
    return TrafficOptimizationMode.disabled;
  default:
    throw StateError("Invalid numeric value $handle for TrafficOptimizationMode enum.");
  }
}

void sdkRoutingTrafficoptimizationmodeReleaseFfiHandle(int handle) {}

final _sdkRoutingTrafficoptimizationmodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_TrafficOptimizationMode_create_handle_nullable'));
final _sdkRoutingTrafficoptimizationmodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficOptimizationMode_release_handle_nullable'));
final _sdkRoutingTrafficoptimizationmodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficOptimizationMode_get_value_nullable'));

Pointer<Void> sdkRoutingTrafficoptimizationmodeToFfiNullable(TrafficOptimizationMode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTrafficoptimizationmodeToFfi(value);
  final result = _sdkRoutingTrafficoptimizationmodeCreateHandleNullable(_handle);
  sdkRoutingTrafficoptimizationmodeReleaseFfiHandle(_handle);
  return result;
}

TrafficOptimizationMode? sdkRoutingTrafficoptimizationmodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTrafficoptimizationmodeGetValueNullable(handle);
  final result = sdkRoutingTrafficoptimizationmodeFromFfi(_handle);
  sdkRoutingTrafficoptimizationmodeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTrafficoptimizationmodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTrafficoptimizationmodeReleaseHandleNullable(handle);

// End of TrafficOptimizationMode "private" section.


