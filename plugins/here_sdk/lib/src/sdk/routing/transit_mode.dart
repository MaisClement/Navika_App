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

/// Public transit mode
enum TransitMode {
    /// High speed train.
    highSpeedTrain,
    /// Intercity train.
    intercityTrain,
    /// Inter regional train.
    interRegionalTrain,
    /// Regional train.
    regionalTrain,
    /// City train.
    cityTrain,
    /// Bus.
    bus,
    /// Ferry.
    ferry,
    /// Subway.
    subway,
    /// Light rail.
    lightRail,
    /// Private bus.
    privateBus,
    /// Inclined.
    inclined,
    /// Aerial.
    aerial,
    /// Bus rapid.
    busRapid,
    /// Monorail.
    monorail,
    /// Flight.
    flight
}

// TransitMode "private" section, not exported.

int sdkRoutingTransitmodeToFfi(TransitMode value) {
  switch (value) {
  case TransitMode.highSpeedTrain:
    return 0;
  case TransitMode.intercityTrain:
    return 1;
  case TransitMode.interRegionalTrain:
    return 2;
  case TransitMode.regionalTrain:
    return 3;
  case TransitMode.cityTrain:
    return 4;
  case TransitMode.bus:
    return 5;
  case TransitMode.ferry:
    return 6;
  case TransitMode.subway:
    return 7;
  case TransitMode.lightRail:
    return 8;
  case TransitMode.privateBus:
    return 9;
  case TransitMode.inclined:
    return 10;
  case TransitMode.aerial:
    return 11;
  case TransitMode.busRapid:
    return 12;
  case TransitMode.monorail:
    return 13;
  case TransitMode.flight:
    return 14;
  default:
    throw StateError("Invalid enum value $value for TransitMode enum.");
  }
}

TransitMode sdkRoutingTransitmodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TransitMode.highSpeedTrain;
  case 1:
    return TransitMode.intercityTrain;
  case 2:
    return TransitMode.interRegionalTrain;
  case 3:
    return TransitMode.regionalTrain;
  case 4:
    return TransitMode.cityTrain;
  case 5:
    return TransitMode.bus;
  case 6:
    return TransitMode.ferry;
  case 7:
    return TransitMode.subway;
  case 8:
    return TransitMode.lightRail;
  case 9:
    return TransitMode.privateBus;
  case 10:
    return TransitMode.inclined;
  case 11:
    return TransitMode.aerial;
  case 12:
    return TransitMode.busRapid;
  case 13:
    return TransitMode.monorail;
  case 14:
    return TransitMode.flight;
  default:
    throw StateError("Invalid numeric value $handle for TransitMode enum.");
  }
}

void sdkRoutingTransitmodeReleaseFfiHandle(int handle) {}

final _sdkRoutingTransitmodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_TransitMode_create_handle_nullable'));
final _sdkRoutingTransitmodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitMode_release_handle_nullable'));
final _sdkRoutingTransitmodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitMode_get_value_nullable'));

Pointer<Void> sdkRoutingTransitmodeToFfiNullable(TransitMode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTransitmodeToFfi(value);
  final result = _sdkRoutingTransitmodeCreateHandleNullable(_handle);
  sdkRoutingTransitmodeReleaseFfiHandle(_handle);
  return result;
}

TransitMode? sdkRoutingTransitmodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTransitmodeGetValueNullable(handle);
  final result = sdkRoutingTransitmodeFromFfi(_handle);
  sdkRoutingTransitmodeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTransitmodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTransitmodeReleaseHandleNullable(handle);

// End of TransitMode "private" section.


