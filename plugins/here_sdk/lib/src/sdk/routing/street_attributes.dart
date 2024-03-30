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

/// Types of street attributes.
enum StreetAttributes {
    /// The driving on the street is done on the right side.
    rightDrivingSide,
    /// The street is a dirt road.
    dirtRoad,
    /// The street goes through a tunnel.
    tunnel,
    /// The street goes over a bridge.
    bridge,
    /// The street contains a ramp.
    ramp,
    /// The street is with controlled access.
    @Deprecated("Will be removed in v4.19.0. Use [StreetAttributes.controlledAccessHighway] instead")
    controlledAccess,
    /// The street contains a roundabout.
    roundabout,
    /// The street is under construction.
    underConstruction,
    /// The street is a divided road.
    dividedRoad,
    /// The street is a motorway.
    motorway,
    /// The street is a private road.
    privateRoad,
    /// The street is most likely in a built-up area.
    builtUpArea,
    /// The street is either a controlled access or a limited access road or both.
    controlledAccessHighway
}

// StreetAttributes "private" section, not exported.

int sdkRoutingStreetattributesToFfi(StreetAttributes value) {
  switch (value) {
  case StreetAttributes.rightDrivingSide:
    return 0;
  case StreetAttributes.dirtRoad:
    return 1;
  case StreetAttributes.tunnel:
    return 2;
  case StreetAttributes.bridge:
    return 3;
  case StreetAttributes.ramp:
    return 4;
  case StreetAttributes.controlledAccess:
    return 5;
  case StreetAttributes.roundabout:
    return 6;
  case StreetAttributes.underConstruction:
    return 7;
  case StreetAttributes.dividedRoad:
    return 8;
  case StreetAttributes.motorway:
    return 9;
  case StreetAttributes.privateRoad:
    return 10;
  case StreetAttributes.builtUpArea:
    return 11;
  case StreetAttributes.controlledAccessHighway:
    return 12;
  default:
    throw StateError("Invalid enum value $value for StreetAttributes enum.");
  }
}

StreetAttributes sdkRoutingStreetattributesFromFfi(int handle) {
  switch (handle) {
  case 0:
    return StreetAttributes.rightDrivingSide;
  case 1:
    return StreetAttributes.dirtRoad;
  case 2:
    return StreetAttributes.tunnel;
  case 3:
    return StreetAttributes.bridge;
  case 4:
    return StreetAttributes.ramp;
  case 5:
    return StreetAttributes.controlledAccess;
  case 6:
    return StreetAttributes.roundabout;
  case 7:
    return StreetAttributes.underConstruction;
  case 8:
    return StreetAttributes.dividedRoad;
  case 9:
    return StreetAttributes.motorway;
  case 10:
    return StreetAttributes.privateRoad;
  case 11:
    return StreetAttributes.builtUpArea;
  case 12:
    return StreetAttributes.controlledAccessHighway;
  default:
    throw StateError("Invalid numeric value $handle for StreetAttributes enum.");
  }
}

void sdkRoutingStreetattributesReleaseFfiHandle(int handle) {}

final _sdkRoutingStreetattributesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_StreetAttributes_create_handle_nullable'));
final _sdkRoutingStreetattributesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_StreetAttributes_release_handle_nullable'));
final _sdkRoutingStreetattributesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_StreetAttributes_get_value_nullable'));

Pointer<Void> sdkRoutingStreetattributesToFfiNullable(StreetAttributes? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingStreetattributesToFfi(value);
  final result = _sdkRoutingStreetattributesCreateHandleNullable(_handle);
  sdkRoutingStreetattributesReleaseFfiHandle(_handle);
  return result;
}

StreetAttributes? sdkRoutingStreetattributesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingStreetattributesGetValueNullable(handle);
  final result = sdkRoutingStreetattributesFromFfi(_handle);
  sdkRoutingStreetattributesReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingStreetattributesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingStreetattributesReleaseHandleNullable(handle);

// End of StreetAttributes "private" section.


