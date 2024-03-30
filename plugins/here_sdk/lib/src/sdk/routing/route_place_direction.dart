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

/// Specifies the direction to make distinction between departure and arrival cases.
enum RoutePlaceDirection {
    /// Departure case.
    departure,
    /// Arrival case.
    arrival
}

// RoutePlaceDirection "private" section, not exported.

int sdkRoutingRouteplacedirectionToFfi(RoutePlaceDirection value) {
  switch (value) {
  case RoutePlaceDirection.departure:
    return 0;
  case RoutePlaceDirection.arrival:
    return 1;
  default:
    throw StateError("Invalid enum value $value for RoutePlaceDirection enum.");
  }
}

RoutePlaceDirection sdkRoutingRouteplacedirectionFromFfi(int handle) {
  switch (handle) {
  case 0:
    return RoutePlaceDirection.departure;
  case 1:
    return RoutePlaceDirection.arrival;
  default:
    throw StateError("Invalid numeric value $handle for RoutePlaceDirection enum.");
  }
}

void sdkRoutingRouteplacedirectionReleaseFfiHandle(int handle) {}

final _sdkRoutingRouteplacedirectionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_RoutePlaceDirection_create_handle_nullable'));
final _sdkRoutingRouteplacedirectionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutePlaceDirection_release_handle_nullable'));
final _sdkRoutingRouteplacedirectionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutePlaceDirection_get_value_nullable'));

Pointer<Void> sdkRoutingRouteplacedirectionToFfiNullable(RoutePlaceDirection? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingRouteplacedirectionToFfi(value);
  final result = _sdkRoutingRouteplacedirectionCreateHandleNullable(_handle);
  sdkRoutingRouteplacedirectionReleaseFfiHandle(_handle);
  return result;
}

RoutePlaceDirection? sdkRoutingRouteplacedirectionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingRouteplacedirectionGetValueNullable(handle);
  final result = sdkRoutingRouteplacedirectionFromFfi(_handle);
  sdkRoutingRouteplacedirectionReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingRouteplacedirectionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRouteplacedirectionReleaseHandleNullable(handle);

// End of RoutePlaceDirection "private" section.


