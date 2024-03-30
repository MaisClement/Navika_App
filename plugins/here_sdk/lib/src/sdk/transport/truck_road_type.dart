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

/// Specifies Truck road type
enum TruckRoadType {
    /// ET4 class truck road type.
    et4,
    /// ET2 class truck road type.
    et2,
    /// A4 class truck road type.
    a4,
    /// A2 class truck road type.
    a2,
    /// B4 class truck road type.
    b4,
    /// B2 class truck road type.
    b2,
    /// C class truck road type.
    c,
    /// D class truck road type.
    d,
    /// BK1 class truck road type.
    bk1,
    /// BK2 class truck road type.
    bk2,
    /// BK3 class truck road type.
    bk3,
    /// BK4 class truck road type.
    bk4
}

// TruckRoadType "private" section, not exported.

int sdkTransportTruckroadtypeToFfi(TruckRoadType value) {
  switch (value) {
  case TruckRoadType.et4:
    return 0;
  case TruckRoadType.et2:
    return 1;
  case TruckRoadType.a4:
    return 2;
  case TruckRoadType.a2:
    return 3;
  case TruckRoadType.b4:
    return 4;
  case TruckRoadType.b2:
    return 5;
  case TruckRoadType.c:
    return 6;
  case TruckRoadType.d:
    return 7;
  case TruckRoadType.bk1:
    return 8;
  case TruckRoadType.bk2:
    return 9;
  case TruckRoadType.bk3:
    return 10;
  case TruckRoadType.bk4:
    return 11;
  default:
    throw StateError("Invalid enum value $value for TruckRoadType enum.");
  }
}

TruckRoadType sdkTransportTruckroadtypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TruckRoadType.et4;
  case 1:
    return TruckRoadType.et2;
  case 2:
    return TruckRoadType.a4;
  case 3:
    return TruckRoadType.a2;
  case 4:
    return TruckRoadType.b4;
  case 5:
    return TruckRoadType.b2;
  case 6:
    return TruckRoadType.c;
  case 7:
    return TruckRoadType.d;
  case 8:
    return TruckRoadType.bk1;
  case 9:
    return TruckRoadType.bk2;
  case 10:
    return TruckRoadType.bk3;
  case 11:
    return TruckRoadType.bk4;
  default:
    throw StateError("Invalid numeric value $handle for TruckRoadType enum.");
  }
}

void sdkTransportTruckroadtypeReleaseFfiHandle(int handle) {}

final _sdkTransportTruckroadtypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_TruckRoadType_create_handle_nullable'));
final _sdkTransportTruckroadtypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckRoadType_release_handle_nullable'));
final _sdkTransportTruckroadtypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckRoadType_get_value_nullable'));

Pointer<Void> sdkTransportTruckroadtypeToFfiNullable(TruckRoadType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportTruckroadtypeToFfi(value);
  final result = _sdkTransportTruckroadtypeCreateHandleNullable(_handle);
  sdkTransportTruckroadtypeReleaseFfiHandle(_handle);
  return result;
}

TruckRoadType? sdkTransportTruckroadtypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportTruckroadtypeGetValueNullable(handle);
  final result = sdkTransportTruckroadtypeFromFfi(_handle);
  sdkTransportTruckroadtypeReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportTruckroadtypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportTruckroadtypeReleaseHandleNullable(handle);

// End of TruckRoadType "private" section.


