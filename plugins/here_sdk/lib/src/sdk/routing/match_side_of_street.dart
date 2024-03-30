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

/// Specifies how the location set by [Waypoint.sideOfStreetHint] should be handled.
enum MatchSideOfStreet {
    /// Always prefer the given side of street.
    always,
    /// Only prefer using side of street set by street hint in case the street has dividers.
    onlyIfDivided
}

// MatchSideOfStreet "private" section, not exported.

int sdkRoutingMatchsideofstreetToFfi(MatchSideOfStreet value) {
  switch (value) {
  case MatchSideOfStreet.always:
    return 0;
  case MatchSideOfStreet.onlyIfDivided:
    return 1;
  default:
    throw StateError("Invalid enum value $value for MatchSideOfStreet enum.");
  }
}

MatchSideOfStreet sdkRoutingMatchsideofstreetFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MatchSideOfStreet.always;
  case 1:
    return MatchSideOfStreet.onlyIfDivided;
  default:
    throw StateError("Invalid numeric value $handle for MatchSideOfStreet enum.");
  }
}

void sdkRoutingMatchsideofstreetReleaseFfiHandle(int handle) {}

final _sdkRoutingMatchsideofstreetCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_MatchSideOfStreet_create_handle_nullable'));
final _sdkRoutingMatchsideofstreetReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MatchSideOfStreet_release_handle_nullable'));
final _sdkRoutingMatchsideofstreetGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MatchSideOfStreet_get_value_nullable'));

Pointer<Void> sdkRoutingMatchsideofstreetToFfiNullable(MatchSideOfStreet? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingMatchsideofstreetToFfi(value);
  final result = _sdkRoutingMatchsideofstreetCreateHandleNullable(_handle);
  sdkRoutingMatchsideofstreetReleaseFfiHandle(_handle);
  return result;
}

MatchSideOfStreet? sdkRoutingMatchsideofstreetFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingMatchsideofstreetGetValueNullable(handle);
  final result = sdkRoutingMatchsideofstreetFromFfi(_handle);
  sdkRoutingMatchsideofstreetReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingMatchsideofstreetReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingMatchsideofstreetReleaseHandleNullable(handle);

// End of MatchSideOfStreet "private" section.


