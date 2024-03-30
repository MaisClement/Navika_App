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

/// Available charging supply types.
enum ChargingSupplyType {
    /// Single phase Alternating Current supply.
    acSingle,
    /// Three phase Alternating Current supply.
    acThree,
    /// Direct Current supply.
    dc
}

// ChargingSupplyType "private" section, not exported.

int sdkRoutingChargingsupplytypeToFfi(ChargingSupplyType value) {
  switch (value) {
  case ChargingSupplyType.acSingle:
    return 0;
  case ChargingSupplyType.acThree:
    return 1;
  case ChargingSupplyType.dc:
    return 2;
  default:
    throw StateError("Invalid enum value $value for ChargingSupplyType enum.");
  }
}

ChargingSupplyType sdkRoutingChargingsupplytypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ChargingSupplyType.acSingle;
  case 1:
    return ChargingSupplyType.acThree;
  case 2:
    return ChargingSupplyType.dc;
  default:
    throw StateError("Invalid numeric value $handle for ChargingSupplyType enum.");
  }
}

void sdkRoutingChargingsupplytypeReleaseFfiHandle(int handle) {}

final _sdkRoutingChargingsupplytypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_ChargingSupplyType_create_handle_nullable'));
final _sdkRoutingChargingsupplytypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingSupplyType_release_handle_nullable'));
final _sdkRoutingChargingsupplytypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingSupplyType_get_value_nullable'));

Pointer<Void> sdkRoutingChargingsupplytypeToFfiNullable(ChargingSupplyType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingChargingsupplytypeToFfi(value);
  final result = _sdkRoutingChargingsupplytypeCreateHandleNullable(_handle);
  sdkRoutingChargingsupplytypeReleaseFfiHandle(_handle);
  return result;
}

ChargingSupplyType? sdkRoutingChargingsupplytypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingChargingsupplytypeGetValueNullable(handle);
  final result = sdkRoutingChargingsupplytypeFromFfi(_handle);
  sdkRoutingChargingsupplytypeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingChargingsupplytypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingChargingsupplytypeReleaseHandleNullable(handle);

// End of ChargingSupplyType "private" section.


