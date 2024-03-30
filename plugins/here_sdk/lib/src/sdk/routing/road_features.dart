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

/// Road features or states.
enum RoadFeatures {
    /// This part of the route is subject to seasonal closure.
    seasonalClosure,
    /// Access to this part of the route is restricted with a fee or toll.
    tollRoad,
    /// This part of the route is a controlled-access highway, i.e. high-speed
    /// and highly controlled.
    controlledAccessHighway,
    /// This part of the route is for transit with a ferry.
    ferry,
    /// This part of the route is for transit with a car shuttle train.
    carShuttleTrain,
    /// This part of the route is a tunnel.
    tunnel,
    /// This part of the route has an un-paved surface.
    dirtRoad,
    /// This part of the route has a u-turns. Note that this feature is valid
    /// only for cars, trucks, taxis and buses.
    uTurns
}

// RoadFeatures "private" section, not exported.

int sdkRoutingRoadfeaturesToFfi(RoadFeatures value) {
  switch (value) {
  case RoadFeatures.seasonalClosure:
    return 0;
  case RoadFeatures.tollRoad:
    return 1;
  case RoadFeatures.controlledAccessHighway:
    return 2;
  case RoadFeatures.ferry:
    return 3;
  case RoadFeatures.carShuttleTrain:
    return 4;
  case RoadFeatures.tunnel:
    return 5;
  case RoadFeatures.dirtRoad:
    return 6;
  case RoadFeatures.uTurns:
    return 7;
  default:
    throw StateError("Invalid enum value $value for RoadFeatures enum.");
  }
}

RoadFeatures sdkRoutingRoadfeaturesFromFfi(int handle) {
  switch (handle) {
  case 0:
    return RoadFeatures.seasonalClosure;
  case 1:
    return RoadFeatures.tollRoad;
  case 2:
    return RoadFeatures.controlledAccessHighway;
  case 3:
    return RoadFeatures.ferry;
  case 4:
    return RoadFeatures.carShuttleTrain;
  case 5:
    return RoadFeatures.tunnel;
  case 6:
    return RoadFeatures.dirtRoad;
  case 7:
    return RoadFeatures.uTurns;
  default:
    throw StateError("Invalid numeric value $handle for RoadFeatures enum.");
  }
}

void sdkRoutingRoadfeaturesReleaseFfiHandle(int handle) {}

final _sdkRoutingRoadfeaturesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_RoadFeatures_create_handle_nullable'));
final _sdkRoutingRoadfeaturesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadFeatures_release_handle_nullable'));
final _sdkRoutingRoadfeaturesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadFeatures_get_value_nullable'));

Pointer<Void> sdkRoutingRoadfeaturesToFfiNullable(RoadFeatures? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingRoadfeaturesToFfi(value);
  final result = _sdkRoutingRoadfeaturesCreateHandleNullable(_handle);
  sdkRoutingRoadfeaturesReleaseFfiHandle(_handle);
  return result;
}

RoadFeatures? sdkRoutingRoadfeaturesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingRoadfeaturesGetValueNullable(handle);
  final result = sdkRoutingRoadfeaturesFromFfi(_handle);
  sdkRoutingRoadfeaturesReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingRoadfeaturesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRoadfeaturesReleaseHandleNullable(handle);

// End of RoadFeatures "private" section.


