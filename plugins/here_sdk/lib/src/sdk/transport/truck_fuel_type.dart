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

/// Define possible fuel types for trucks provided by a fuel station.
///
/// Note: This is a BETA feature and thus subject to change.
enum TruckFuelType {
    /// Compressed natural gas
    cng,
    /// Diesel
    diesel,
    /// Hydrogen
    hydrogen,
    /// Liquefied natural gas
    lng
}

// TruckFuelType "private" section, not exported.

int sdkTransportTruckfueltypeToFfi(TruckFuelType value) {
  switch (value) {
  case TruckFuelType.cng:
    return 1;
  case TruckFuelType.diesel:
    return 2;
  case TruckFuelType.hydrogen:
    return 3;
  case TruckFuelType.lng:
    return 4;
  default:
    throw StateError("Invalid enum value $value for TruckFuelType enum.");
  }
}

TruckFuelType sdkTransportTruckfueltypeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return TruckFuelType.cng;
  case 2:
    return TruckFuelType.diesel;
  case 3:
    return TruckFuelType.hydrogen;
  case 4:
    return TruckFuelType.lng;
  default:
    throw StateError("Invalid numeric value $handle for TruckFuelType enum.");
  }
}

void sdkTransportTruckfueltypeReleaseFfiHandle(int handle) {}

final _sdkTransportTruckfueltypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_TruckFuelType_create_handle_nullable'));
final _sdkTransportTruckfueltypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckFuelType_release_handle_nullable'));
final _sdkTransportTruckfueltypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckFuelType_get_value_nullable'));

Pointer<Void> sdkTransportTruckfueltypeToFfiNullable(TruckFuelType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportTruckfueltypeToFfi(value);
  final result = _sdkTransportTruckfueltypeCreateHandleNullable(_handle);
  sdkTransportTruckfueltypeReleaseFfiHandle(_handle);
  return result;
}

TruckFuelType? sdkTransportTruckfueltypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportTruckfueltypeGetValueNullable(handle);
  final result = sdkTransportTruckfueltypeFromFfi(_handle);
  sdkTransportTruckfueltypeReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportTruckfueltypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportTruckfueltypeReleaseHandleNullable(handle);

// End of TruckFuelType "private" section.


