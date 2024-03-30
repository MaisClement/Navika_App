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

/// Identifiers for different types of hazardous materials which
/// can be shipped by the truck.
enum HazardousMaterial {
    /// Explosive material.
    explosive,
    /// Gas.
    gas,
    /// Flammable material.
    flammable,
    /// Combustible material.
    combustible,
    /// Organic material.
    organic,
    /// Poisonous material.
    poison,
    /// Radioactive material.
    radioactive,
    /// Corrosive material.
    corrosive,
    /// Materials that are poisonous upon inhalation.
    poisonousInhalation,
    /// Materials that are harmful to water.
    harmfulToWater,
    /// Any other hazardous material.
    other
}

// HazardousMaterial "private" section, not exported.

int sdkTransportHazardousmaterialToFfi(HazardousMaterial value) {
  switch (value) {
  case HazardousMaterial.explosive:
    return 0;
  case HazardousMaterial.gas:
    return 1;
  case HazardousMaterial.flammable:
    return 2;
  case HazardousMaterial.combustible:
    return 3;
  case HazardousMaterial.organic:
    return 4;
  case HazardousMaterial.poison:
    return 5;
  case HazardousMaterial.radioactive:
    return 6;
  case HazardousMaterial.corrosive:
    return 7;
  case HazardousMaterial.poisonousInhalation:
    return 8;
  case HazardousMaterial.harmfulToWater:
    return 9;
  case HazardousMaterial.other:
    return 10;
  default:
    throw StateError("Invalid enum value $value for HazardousMaterial enum.");
  }
}

HazardousMaterial sdkTransportHazardousmaterialFromFfi(int handle) {
  switch (handle) {
  case 0:
    return HazardousMaterial.explosive;
  case 1:
    return HazardousMaterial.gas;
  case 2:
    return HazardousMaterial.flammable;
  case 3:
    return HazardousMaterial.combustible;
  case 4:
    return HazardousMaterial.organic;
  case 5:
    return HazardousMaterial.poison;
  case 6:
    return HazardousMaterial.radioactive;
  case 7:
    return HazardousMaterial.corrosive;
  case 8:
    return HazardousMaterial.poisonousInhalation;
  case 9:
    return HazardousMaterial.harmfulToWater;
  case 10:
    return HazardousMaterial.other;
  default:
    throw StateError("Invalid numeric value $handle for HazardousMaterial enum.");
  }
}

void sdkTransportHazardousmaterialReleaseFfiHandle(int handle) {}

final _sdkTransportHazardousmaterialCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_HazardousMaterial_create_handle_nullable'));
final _sdkTransportHazardousmaterialReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_HazardousMaterial_release_handle_nullable'));
final _sdkTransportHazardousmaterialGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_HazardousMaterial_get_value_nullable'));

Pointer<Void> sdkTransportHazardousmaterialToFfiNullable(HazardousMaterial? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportHazardousmaterialToFfi(value);
  final result = _sdkTransportHazardousmaterialCreateHandleNullable(_handle);
  sdkTransportHazardousmaterialReleaseFfiHandle(_handle);
  return result;
}

HazardousMaterial? sdkTransportHazardousmaterialFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportHazardousmaterialGetValueNullable(handle);
  final result = sdkTransportHazardousmaterialFromFfi(_handle);
  sdkTransportHazardousmaterialReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportHazardousmaterialReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportHazardousmaterialReleaseHandleNullable(handle);

// End of HazardousMaterial "private" section.


