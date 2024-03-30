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

/// Identifies the route place type.
enum RoutePlaceType {
    /// A regular place.
    place,
    /// A charging station for electric vehicles.
    chargingStation,
    /// A place inside a building.
    indoor,
    /// A public transit station.
    station,
    /// An access point to a venue/station.
    accessPoint
}

// RoutePlaceType "private" section, not exported.

int sdkRoutingRouteplacetypeToFfi(RoutePlaceType value) {
  switch (value) {
  case RoutePlaceType.place:
    return 0;
  case RoutePlaceType.chargingStation:
    return 1;
  case RoutePlaceType.indoor:
    return 2;
  case RoutePlaceType.station:
    return 3;
  case RoutePlaceType.accessPoint:
    return 4;
  default:
    throw StateError("Invalid enum value $value for RoutePlaceType enum.");
  }
}

RoutePlaceType sdkRoutingRouteplacetypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return RoutePlaceType.place;
  case 1:
    return RoutePlaceType.chargingStation;
  case 2:
    return RoutePlaceType.indoor;
  case 3:
    return RoutePlaceType.station;
  case 4:
    return RoutePlaceType.accessPoint;
  default:
    throw StateError("Invalid numeric value $handle for RoutePlaceType enum.");
  }
}

void sdkRoutingRouteplacetypeReleaseFfiHandle(int handle) {}

final _sdkRoutingRouteplacetypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_RoutePlaceType_create_handle_nullable'));
final _sdkRoutingRouteplacetypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutePlaceType_release_handle_nullable'));
final _sdkRoutingRouteplacetypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutePlaceType_get_value_nullable'));

Pointer<Void> sdkRoutingRouteplacetypeToFfiNullable(RoutePlaceType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingRouteplacetypeToFfi(value);
  final result = _sdkRoutingRouteplacetypeCreateHandleNullable(_handle);
  sdkRoutingRouteplacetypeReleaseFfiHandle(_handle);
  return result;
}

RoutePlaceType? sdkRoutingRouteplacetypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingRouteplacetypeGetValueNullable(handle);
  final result = sdkRoutingRouteplacetypeFromFfi(_handle);
  sdkRoutingRouteplacetypeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingRouteplacetypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRouteplacetypeReleaseHandleNullable(handle);

// End of RoutePlaceType "private" section.


