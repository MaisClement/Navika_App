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

/// Defines possible fuel additives that a fuel could contain.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and
/// unexpected behaviors. Related APIs may change for new releases without a deprecation process.
enum FuelAdditiveType {
    /// A fuel additive. AUS 32 (aqueous urea solution) is used as an additive to the fuel
    /// in diesel vehicles with SCR (Selective Catalytic Reduction) technology to reduce
    /// the NOx emission. AU 32 is also known as ARLA 32 or HWL.
    aus32
}

// FuelAdditiveType "private" section, not exported.

int sdkTransportFueladditivetypeToFfi(FuelAdditiveType value) {
  switch (value) {
  case FuelAdditiveType.aus32:
    return 0;
  default:
    throw StateError("Invalid enum value $value for FuelAdditiveType enum.");
  }
}

FuelAdditiveType sdkTransportFueladditivetypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return FuelAdditiveType.aus32;
  default:
    throw StateError("Invalid numeric value $handle for FuelAdditiveType enum.");
  }
}

void sdkTransportFueladditivetypeReleaseFfiHandle(int handle) {}

final _sdkTransportFueladditivetypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_FuelAdditiveType_create_handle_nullable'));
final _sdkTransportFueladditivetypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_FuelAdditiveType_release_handle_nullable'));
final _sdkTransportFueladditivetypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_FuelAdditiveType_get_value_nullable'));

Pointer<Void> sdkTransportFueladditivetypeToFfiNullable(FuelAdditiveType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportFueladditivetypeToFfi(value);
  final result = _sdkTransportFueladditivetypeCreateHandleNullable(_handle);
  sdkTransportFueladditivetypeReleaseFfiHandle(_handle);
  return result;
}

FuelAdditiveType? sdkTransportFueladditivetypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportFueladditivetypeGetValueNullable(handle);
  final result = sdkTransportFueladditivetypeFromFfi(_handle);
  sdkTransportFueladditivetypeReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportFueladditivetypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportFueladditivetypeReleaseHandleNullable(handle);

// End of FuelAdditiveType "private" section.


