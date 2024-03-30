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

/// Defines truck class based on weight.
///
/// Note: This is a BETA feature and thus subject to change.
enum TruckClass {
    /// Light class truck.
    lightClass,
    /// Medium class truck.
    mediumClass,
    /// Heavy class truck.
    heavyClass
}

// TruckClass "private" section, not exported.

int sdkTransportTruckclassToFfi(TruckClass value) {
  switch (value) {
  case TruckClass.lightClass:
    return 1;
  case TruckClass.mediumClass:
    return 2;
  case TruckClass.heavyClass:
    return 3;
  default:
    throw StateError("Invalid enum value $value for TruckClass enum.");
  }
}

TruckClass sdkTransportTruckclassFromFfi(int handle) {
  switch (handle) {
  case 1:
    return TruckClass.lightClass;
  case 2:
    return TruckClass.mediumClass;
  case 3:
    return TruckClass.heavyClass;
  default:
    throw StateError("Invalid numeric value $handle for TruckClass enum.");
  }
}

void sdkTransportTruckclassReleaseFfiHandle(int handle) {}

final _sdkTransportTruckclassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_TruckClass_create_handle_nullable'));
final _sdkTransportTruckclassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckClass_release_handle_nullable'));
final _sdkTransportTruckclassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckClass_get_value_nullable'));

Pointer<Void> sdkTransportTruckclassToFfiNullable(TruckClass? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportTruckclassToFfi(value);
  final result = _sdkTransportTruckclassCreateHandleNullable(_handle);
  sdkTransportTruckclassReleaseFfiHandle(_handle);
  return result;
}

TruckClass? sdkTransportTruckclassFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportTruckclassGetValueNullable(handle);
  final result = sdkTransportTruckclassFromFfi(_handle);
  sdkTransportTruckclassReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportTruckclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportTruckclassReleaseHandleNullable(handle);

// End of TruckClass "private" section.


