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

/// Types of walk attributes.
enum WalkAttributes {
    /// The span contains stairs.
    stairs,
    /// The span goes through a park.
    park,
    /// The span is indoor.
    indoor,
    /// The span is open.
    open,
    /// The access is restricted on the span.
    noThrough,
    /// The access is permitted on the span after paying a toll.
    tollRoad
}

// WalkAttributes "private" section, not exported.

int sdkRoutingWalkattributesToFfi(WalkAttributes value) {
  switch (value) {
  case WalkAttributes.stairs:
    return 0;
  case WalkAttributes.park:
    return 1;
  case WalkAttributes.indoor:
    return 2;
  case WalkAttributes.open:
    return 3;
  case WalkAttributes.noThrough:
    return 4;
  case WalkAttributes.tollRoad:
    return 5;
  default:
    throw StateError("Invalid enum value $value for WalkAttributes enum.");
  }
}

WalkAttributes sdkRoutingWalkattributesFromFfi(int handle) {
  switch (handle) {
  case 0:
    return WalkAttributes.stairs;
  case 1:
    return WalkAttributes.park;
  case 2:
    return WalkAttributes.indoor;
  case 3:
    return WalkAttributes.open;
  case 4:
    return WalkAttributes.noThrough;
  case 5:
    return WalkAttributes.tollRoad;
  default:
    throw StateError("Invalid numeric value $handle for WalkAttributes enum.");
  }
}

void sdkRoutingWalkattributesReleaseFfiHandle(int handle) {}

final _sdkRoutingWalkattributesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_WalkAttributes_create_handle_nullable'));
final _sdkRoutingWalkattributesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_WalkAttributes_release_handle_nullable'));
final _sdkRoutingWalkattributesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_WalkAttributes_get_value_nullable'));

Pointer<Void> sdkRoutingWalkattributesToFfiNullable(WalkAttributes? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingWalkattributesToFfi(value);
  final result = _sdkRoutingWalkattributesCreateHandleNullable(_handle);
  sdkRoutingWalkattributesReleaseFfiHandle(_handle);
  return result;
}

WalkAttributes? sdkRoutingWalkattributesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingWalkattributesGetValueNullable(handle);
  final result = sdkRoutingWalkattributesFromFfi(_handle);
  sdkRoutingWalkattributesReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingWalkattributesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingWalkattributesReleaseHandleNullable(handle);

// End of WalkAttributes "private" section.


