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

/// Identifies the road type.
enum RoadType {
    /// Highway road type.
    highway,
    /// Rural road type.
    rural,
    /// Urban road type.
    urban,
    /// Unknown road type.
    unknown
}

// RoadType "private" section, not exported.

int sdkRoutingRoadtypeToFfi(RoadType value) {
  switch (value) {
  case RoadType.highway:
    return 0;
  case RoadType.rural:
    return 1;
  case RoadType.urban:
    return 2;
  case RoadType.unknown:
    return 3;
  default:
    throw StateError("Invalid enum value $value for RoadType enum.");
  }
}

RoadType sdkRoutingRoadtypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return RoadType.highway;
  case 1:
    return RoadType.rural;
  case 2:
    return RoadType.urban;
  case 3:
    return RoadType.unknown;
  default:
    throw StateError("Invalid numeric value $handle for RoadType enum.");
  }
}

void sdkRoutingRoadtypeReleaseFfiHandle(int handle) {}

final _sdkRoutingRoadtypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_RoadType_create_handle_nullable'));
final _sdkRoutingRoadtypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadType_release_handle_nullable'));
final _sdkRoutingRoadtypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadType_get_value_nullable'));

Pointer<Void> sdkRoutingRoadtypeToFfiNullable(RoadType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingRoadtypeToFfi(value);
  final result = _sdkRoutingRoadtypeCreateHandleNullable(_handle);
  sdkRoutingRoadtypeReleaseFfiHandle(_handle);
  return result;
}

RoadType? sdkRoutingRoadtypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingRoadtypeGetValueNullable(handle);
  final result = sdkRoutingRoadtypeFromFfi(_handle);
  sdkRoutingRoadtypeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingRoadtypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRoadtypeReleaseHandleNullable(handle);

// End of RoadType "private" section.


