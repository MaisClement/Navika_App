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

/// Reason for the cost.
enum FareReason {
    /// Fare for ride.
    ride,
    /// Fare for parking.
    parking
}

// FareReason "private" section, not exported.

int sdkRoutingFarereasonToFfi(FareReason value) {
  switch (value) {
  case FareReason.ride:
    return 0;
  case FareReason.parking:
    return 1;
  default:
    throw StateError("Invalid enum value $value for FareReason enum.");
  }
}

FareReason sdkRoutingFarereasonFromFfi(int handle) {
  switch (handle) {
  case 0:
    return FareReason.ride;
  case 1:
    return FareReason.parking;
  default:
    throw StateError("Invalid numeric value $handle for FareReason enum.");
  }
}

void sdkRoutingFarereasonReleaseFfiHandle(int handle) {}

final _sdkRoutingFarereasonCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_FareReason_create_handle_nullable'));
final _sdkRoutingFarereasonReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FareReason_release_handle_nullable'));
final _sdkRoutingFarereasonGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FareReason_get_value_nullable'));

Pointer<Void> sdkRoutingFarereasonToFfiNullable(FareReason? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingFarereasonToFfi(value);
  final result = _sdkRoutingFarereasonCreateHandleNullable(_handle);
  sdkRoutingFarereasonReleaseFfiHandle(_handle);
  return result;
}

FareReason? sdkRoutingFarereasonFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingFarereasonGetValueNullable(handle);
  final result = sdkRoutingFarereasonFromFfi(_handle);
  sdkRoutingFarereasonReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingFarereasonReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingFarereasonReleaseHandleNullable(handle);

// End of FareReason "private" section.


