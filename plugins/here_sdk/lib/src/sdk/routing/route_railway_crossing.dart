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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/routing/route_offset.dart';
import 'package:here_sdk/src/sdk/routing/route_railway_crossing_type.dart';

/// Contains information about railway crossing.

class RouteRailwayCrossing {
  /// The type of the route place.
  RouteRailwayCrossingType type;

  /// Location on the route
  GeoCoordinates coordinates;

  /// Route position
  RouteOffset routeOffset;

  /// Creates a new instance.

  /// [type] The type of the route place.

  /// [coordinates] Location on the route

  /// [routeOffset] Route position

  RouteRailwayCrossing(this.type, this.coordinates, this.routeOffset);
}


// RouteRailwayCrossing "private" section, not exported.

final _sdkRoutingRouterailwaycrossingCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_RouteRailwayCrossing_create_handle'));
final _sdkRoutingRouterailwaycrossingReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteRailwayCrossing_release_handle'));
final _sdkRoutingRouterailwaycrossingGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteRailwayCrossing_get_field_type'));
final _sdkRoutingRouterailwaycrossingGetFieldcoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteRailwayCrossing_get_field_coordinates'));
final _sdkRoutingRouterailwaycrossingGetFieldrouteOffset = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteRailwayCrossing_get_field_routeOffset'));



Pointer<Void> sdkRoutingRouterailwaycrossingToFfi(RouteRailwayCrossing value) {
  final _typeHandle = sdkRoutingRouterailwaycrossingtypeToFfi(value.type);
  final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(value.coordinates);
  final _routeOffsetHandle = sdkRoutingRouteoffsetToFfi(value.routeOffset);
  final _result = _sdkRoutingRouterailwaycrossingCreateHandle(_typeHandle, _coordinatesHandle, _routeOffsetHandle);
  sdkRoutingRouterailwaycrossingtypeReleaseFfiHandle(_typeHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
  sdkRoutingRouteoffsetReleaseFfiHandle(_routeOffsetHandle);
  return _result;
}

RouteRailwayCrossing sdkRoutingRouterailwaycrossingFromFfi(Pointer<Void> handle) {
  final _typeHandle = _sdkRoutingRouterailwaycrossingGetFieldtype(handle);
  final _coordinatesHandle = _sdkRoutingRouterailwaycrossingGetFieldcoordinates(handle);
  final _routeOffsetHandle = _sdkRoutingRouterailwaycrossingGetFieldrouteOffset(handle);
  try {
    return RouteRailwayCrossing(
      sdkRoutingRouterailwaycrossingtypeFromFfi(_typeHandle), 
      sdkCoreGeocoordinatesFromFfi(_coordinatesHandle), 
      sdkRoutingRouteoffsetFromFfi(_routeOffsetHandle)
    );
  } finally {
    sdkRoutingRouterailwaycrossingtypeReleaseFfiHandle(_typeHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    sdkRoutingRouteoffsetReleaseFfiHandle(_routeOffsetHandle);
  }
}

void sdkRoutingRouterailwaycrossingReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingRouterailwaycrossingReleaseHandle(handle);

// Nullable RouteRailwayCrossing

final _sdkRoutingRouterailwaycrossingCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteRailwayCrossing_create_handle_nullable'));
final _sdkRoutingRouterailwaycrossingReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteRailwayCrossing_release_handle_nullable'));
final _sdkRoutingRouterailwaycrossingGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteRailwayCrossing_get_value_nullable'));

Pointer<Void> sdkRoutingRouterailwaycrossingToFfiNullable(RouteRailwayCrossing? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingRouterailwaycrossingToFfi(value);
  final result = _sdkRoutingRouterailwaycrossingCreateHandleNullable(_handle);
  sdkRoutingRouterailwaycrossingReleaseFfiHandle(_handle);
  return result;
}

RouteRailwayCrossing? sdkRoutingRouterailwaycrossingFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingRouterailwaycrossingGetValueNullable(handle);
  final result = sdkRoutingRouterailwaycrossingFromFfi(_handle);
  sdkRoutingRouterailwaycrossingReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingRouterailwaycrossingReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRouterailwaycrossingReleaseHandleNullable(handle);

// End of RouteRailwayCrossing "private" section.


