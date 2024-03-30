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

/// Available charging connector types.
enum ChargingConnectorType {
    /// Type 1 Combo connector, commonly called "SAE J1772".
    iec62196Type1Combo,
    /// Type 2 Combo connector, commonly called "Mennekes".
    iec62196Type2Combo,
    /// CHAdeMO connector.
    chademo,
    /// Tesla connector.
    tesla
}

// ChargingConnectorType "private" section, not exported.

int sdkRoutingChargingconnectortypeToFfi(ChargingConnectorType value) {
  switch (value) {
  case ChargingConnectorType.iec62196Type1Combo:
    return 0;
  case ChargingConnectorType.iec62196Type2Combo:
    return 1;
  case ChargingConnectorType.chademo:
    return 2;
  case ChargingConnectorType.tesla:
    return 3;
  default:
    throw StateError("Invalid enum value $value for ChargingConnectorType enum.");
  }
}

ChargingConnectorType sdkRoutingChargingconnectortypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ChargingConnectorType.iec62196Type1Combo;
  case 1:
    return ChargingConnectorType.iec62196Type2Combo;
  case 2:
    return ChargingConnectorType.chademo;
  case 3:
    return ChargingConnectorType.tesla;
  default:
    throw StateError("Invalid numeric value $handle for ChargingConnectorType enum.");
  }
}

void sdkRoutingChargingconnectortypeReleaseFfiHandle(int handle) {}

final _sdkRoutingChargingconnectortypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_ChargingConnectorType_create_handle_nullable'));
final _sdkRoutingChargingconnectortypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorType_release_handle_nullable'));
final _sdkRoutingChargingconnectortypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorType_get_value_nullable'));

Pointer<Void> sdkRoutingChargingconnectortypeToFfiNullable(ChargingConnectorType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingChargingconnectortypeToFfi(value);
  final result = _sdkRoutingChargingconnectortypeCreateHandleNullable(_handle);
  sdkRoutingChargingconnectortypeReleaseFfiHandle(_handle);
  return result;
}

ChargingConnectorType? sdkRoutingChargingconnectortypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingChargingconnectortypeGetValueNullable(handle);
  final result = sdkRoutingChargingconnectortypeFromFfi(_handle);
  sdkRoutingChargingconnectortypeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingChargingconnectortypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingChargingconnectortypeReleaseHandleNullable(handle);

// End of ChargingConnectorType "private" section.


