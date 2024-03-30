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

/// Specifies the type of truck.
enum TruckType {
    /// A truck on a single frame with a permanently attached cargo area.
    straight,
    /// A towing vehicle that can pull one or more semi-trailers (AKA semi-truck.)
    tractor
}

// TruckType "private" section, not exported.

int sdkTransportTrucktypeToFfi(TruckType value) {
  switch (value) {
  case TruckType.straight:
    return 0;
  case TruckType.tractor:
    return 1;
  default:
    throw StateError("Invalid enum value $value for TruckType enum.");
  }
}

TruckType sdkTransportTrucktypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TruckType.straight;
  case 1:
    return TruckType.tractor;
  default:
    throw StateError("Invalid numeric value $handle for TruckType enum.");
  }
}

void sdkTransportTrucktypeReleaseFfiHandle(int handle) {}

final _sdkTransportTrucktypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_TruckType_create_handle_nullable'));
final _sdkTransportTrucktypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckType_release_handle_nullable'));
final _sdkTransportTrucktypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckType_get_value_nullable'));

Pointer<Void> sdkTransportTrucktypeToFfiNullable(TruckType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportTrucktypeToFfi(value);
  final result = _sdkTransportTrucktypeCreateHandleNullable(_handle);
  sdkTransportTrucktypeReleaseFfiHandle(_handle);
  return result;
}

TruckType? sdkTransportTrucktypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportTrucktypeGetValueNullable(handle);
  final result = sdkTransportTrucktypeFromFfi(_handle);
  sdkTransportTrucktypeReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportTrucktypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportTrucktypeReleaseHandleNullable(handle);

// End of TruckType "private" section.


