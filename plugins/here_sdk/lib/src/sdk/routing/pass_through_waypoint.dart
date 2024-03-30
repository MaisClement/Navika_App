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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/route_place.dart';

/// This structure provides all the information for a passthrough waypoint.
///
/// The location information and offset of the waypoint are stored in
/// [PassThroughWaypoint.place] and [PassThroughWaypoint.offset] respectively.

class PassThroughWaypoint {
  /// The location information of passthrough waypoint.
  RoutePlace place;

  /// Index over [Section.geometry] where the passthrough waypoint is located.
  int? offset;

  /// Creates a new instance.

  /// [place] The location information of passthrough waypoint.

  /// [offset] Index over [Section.geometry] where the passthrough waypoint is located.

  PassThroughWaypoint._(this.place, this.offset);
  PassThroughWaypoint(RoutePlace place)
    : place = place, offset = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PassThroughWaypoint) return false;
    PassThroughWaypoint _other = other;
    return place == _other.place &&
        offset == _other.offset;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + place.hashCode;
    result = 31 * result + offset.hashCode;
    return result;
  }
}


// PassThroughWaypoint "private" section, not exported.

final _sdkRoutingPassthroughwaypointCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_PassThroughWaypoint_create_handle'));
final _sdkRoutingPassthroughwaypointReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PassThroughWaypoint_release_handle'));
final _sdkRoutingPassthroughwaypointGetFieldplace = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PassThroughWaypoint_get_field_place'));
final _sdkRoutingPassthroughwaypointGetFieldoffset = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PassThroughWaypoint_get_field_offset'));



Pointer<Void> sdkRoutingPassthroughwaypointToFfi(PassThroughWaypoint value) {
  final _placeHandle = sdkRoutingRouteplaceToFfi(value.place);
  final _offsetHandle = intToFfiNullable(value.offset);
  final _result = _sdkRoutingPassthroughwaypointCreateHandle(_placeHandle, _offsetHandle);
  sdkRoutingRouteplaceReleaseFfiHandle(_placeHandle);
  intReleaseFfiHandleNullable(_offsetHandle);
  return _result;
}

PassThroughWaypoint sdkRoutingPassthroughwaypointFromFfi(Pointer<Void> handle) {
  final _placeHandle = _sdkRoutingPassthroughwaypointGetFieldplace(handle);
  final _offsetHandle = _sdkRoutingPassthroughwaypointGetFieldoffset(handle);
  try {
    return PassThroughWaypoint._(
      sdkRoutingRouteplaceFromFfi(_placeHandle), 
      intFromFfiNullable(_offsetHandle)
    );
  } finally {
    sdkRoutingRouteplaceReleaseFfiHandle(_placeHandle);
    intReleaseFfiHandleNullable(_offsetHandle);
  }
}

void sdkRoutingPassthroughwaypointReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingPassthroughwaypointReleaseHandle(handle);

// Nullable PassThroughWaypoint

final _sdkRoutingPassthroughwaypointCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PassThroughWaypoint_create_handle_nullable'));
final _sdkRoutingPassthroughwaypointReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PassThroughWaypoint_release_handle_nullable'));
final _sdkRoutingPassthroughwaypointGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PassThroughWaypoint_get_value_nullable'));

Pointer<Void> sdkRoutingPassthroughwaypointToFfiNullable(PassThroughWaypoint? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingPassthroughwaypointToFfi(value);
  final result = _sdkRoutingPassthroughwaypointCreateHandleNullable(_handle);
  sdkRoutingPassthroughwaypointReleaseFfiHandle(_handle);
  return result;
}

PassThroughWaypoint? sdkRoutingPassthroughwaypointFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingPassthroughwaypointGetValueNullable(handle);
  final result = sdkRoutingPassthroughwaypointFromFfi(_handle);
  sdkRoutingPassthroughwaypointReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingPassthroughwaypointReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingPassthroughwaypointReleaseHandleNullable(handle);

// End of PassThroughWaypoint "private" section.


