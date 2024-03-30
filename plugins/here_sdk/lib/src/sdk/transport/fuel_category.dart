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

/// Defines possible fuel categories.
///
/// Note: This is a BETA feature and thus subject to change.
/// @nodoc
enum FuelCategory {
    ethanol,
    /// Petrol and gasoline are the same fuel type. "petrol" is used in UK, whereas "gasoline" is used in US.
    /// The convention in HSDK is to prefer US english over UK.
    gasoline,
    diesel,
    biodiesel,
    naturalGas,
    hydrogen
}

// FuelCategory "private" section, not exported.

int sdkTransportFuelcategoryToFfi(FuelCategory value) {
  switch (value) {
  case FuelCategory.ethanol:
    return 0;
  case FuelCategory.gasoline:
    return 1;
  case FuelCategory.diesel:
    return 2;
  case FuelCategory.biodiesel:
    return 3;
  case FuelCategory.naturalGas:
    return 4;
  case FuelCategory.hydrogen:
    return 5;
  default:
    throw StateError("Invalid enum value $value for FuelCategory enum.");
  }
}

FuelCategory sdkTransportFuelcategoryFromFfi(int handle) {
  switch (handle) {
  case 0:
    return FuelCategory.ethanol;
  case 1:
    return FuelCategory.gasoline;
  case 2:
    return FuelCategory.diesel;
  case 3:
    return FuelCategory.biodiesel;
  case 4:
    return FuelCategory.naturalGas;
  case 5:
    return FuelCategory.hydrogen;
  default:
    throw StateError("Invalid numeric value $handle for FuelCategory enum.");
  }
}

void sdkTransportFuelcategoryReleaseFfiHandle(int handle) {}

final _sdkTransportFuelcategoryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_FuelCategory_create_handle_nullable'));
final _sdkTransportFuelcategoryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_FuelCategory_release_handle_nullable'));
final _sdkTransportFuelcategoryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_FuelCategory_get_value_nullable'));

Pointer<Void> sdkTransportFuelcategoryToFfiNullable(FuelCategory? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportFuelcategoryToFfi(value);
  final result = _sdkTransportFuelcategoryCreateHandleNullable(_handle);
  sdkTransportFuelcategoryReleaseFfiHandle(_handle);
  return result;
}

FuelCategory? sdkTransportFuelcategoryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportFuelcategoryGetValueNullable(handle);
  final result = sdkTransportFuelcategoryFromFfi(_handle);
  sdkTransportFuelcategoryReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportFuelcategoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportFuelcategoryReleaseHandleNullable(handle);

// End of FuelCategory "private" section.


