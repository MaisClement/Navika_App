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

/// Travel direction.
enum TravelDirection {
    /// Positive travel direction.
    positive,
    /// Negative travel direction.
    negative,
    /// Bidirectional travel direction.
    bidirectional
}

// TravelDirection "private" section, not exported.

int sdkRoutingTraveldirectionToFfi(TravelDirection value) {
  switch (value) {
  case TravelDirection.positive:
    return 0;
  case TravelDirection.negative:
    return 1;
  case TravelDirection.bidirectional:
    return 2;
  default:
    throw StateError("Invalid enum value $value for TravelDirection enum.");
  }
}

TravelDirection sdkRoutingTraveldirectionFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TravelDirection.positive;
  case 1:
    return TravelDirection.negative;
  case 2:
    return TravelDirection.bidirectional;
  default:
    throw StateError("Invalid numeric value $handle for TravelDirection enum.");
  }
}

void sdkRoutingTraveldirectionReleaseFfiHandle(int handle) {}

final _sdkRoutingTraveldirectionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_TravelDirection_create_handle_nullable'));
final _sdkRoutingTraveldirectionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TravelDirection_release_handle_nullable'));
final _sdkRoutingTraveldirectionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TravelDirection_get_value_nullable'));

Pointer<Void> sdkRoutingTraveldirectionToFfiNullable(TravelDirection? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTraveldirectionToFfi(value);
  final result = _sdkRoutingTraveldirectionCreateHandleNullable(_handle);
  sdkRoutingTraveldirectionReleaseFfiHandle(_handle);
  return result;
}

TravelDirection? sdkRoutingTraveldirectionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTraveldirectionGetValueNullable(handle);
  final result = sdkRoutingTraveldirectionFromFfi(_handle);
  sdkRoutingTraveldirectionReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTraveldirectionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTraveldirectionReleaseHandleNullable(handle);

// End of TravelDirection "private" section.


