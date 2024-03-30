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
import 'package:here_sdk/src/builtin_types__conversion.dart';

/// @nodoc

class VehicleEquipment {
  bool hasSnowChains;

  bool hasWinterTyres;

  VehicleEquipment._(this.hasSnowChains, this.hasWinterTyres);
  VehicleEquipment()
    : hasSnowChains = false, hasWinterTyres = false;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VehicleEquipment) return false;
    VehicleEquipment _other = other;
    return hasSnowChains == _other.hasSnowChains &&
        hasWinterTyres == _other.hasWinterTyres;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + hasSnowChains.hashCode;
    result = 31 * result + hasWinterTyres.hashCode;
    return result;
  }
}


// VehicleEquipment "private" section, not exported.

final _sdkTransportVehicleequipmentCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8),
    Pointer<Void> Function(int, int)
  >('here_sdk_sdk_transport_VehicleEquipment_create_handle'));
final _sdkTransportVehicleequipmentReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleEquipment_release_handle'));
final _sdkTransportVehicleequipmentGetFieldhasSnowChains = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleEquipment_get_field_hasSnowChains'));
final _sdkTransportVehicleequipmentGetFieldhasWinterTyres = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleEquipment_get_field_hasWinterTyres'));



Pointer<Void> sdkTransportVehicleequipmentToFfi(VehicleEquipment value) {
  final _hasSnowChainsHandle = booleanToFfi(value.hasSnowChains);
  final _hasWinterTyresHandle = booleanToFfi(value.hasWinterTyres);
  final _result = _sdkTransportVehicleequipmentCreateHandle(_hasSnowChainsHandle, _hasWinterTyresHandle);
  booleanReleaseFfiHandle(_hasSnowChainsHandle);
  booleanReleaseFfiHandle(_hasWinterTyresHandle);
  return _result;
}

VehicleEquipment sdkTransportVehicleequipmentFromFfi(Pointer<Void> handle) {
  final _hasSnowChainsHandle = _sdkTransportVehicleequipmentGetFieldhasSnowChains(handle);
  final _hasWinterTyresHandle = _sdkTransportVehicleequipmentGetFieldhasWinterTyres(handle);
  try {
    return VehicleEquipment._(
      booleanFromFfi(_hasSnowChainsHandle), 
      booleanFromFfi(_hasWinterTyresHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_hasSnowChainsHandle);
    booleanReleaseFfiHandle(_hasWinterTyresHandle);
  }
}

void sdkTransportVehicleequipmentReleaseFfiHandle(Pointer<Void> handle) => _sdkTransportVehicleequipmentReleaseHandle(handle);

// Nullable VehicleEquipment

final _sdkTransportVehicleequipmentCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleEquipment_create_handle_nullable'));
final _sdkTransportVehicleequipmentReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleEquipment_release_handle_nullable'));
final _sdkTransportVehicleequipmentGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleEquipment_get_value_nullable'));

Pointer<Void> sdkTransportVehicleequipmentToFfiNullable(VehicleEquipment? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportVehicleequipmentToFfi(value);
  final result = _sdkTransportVehicleequipmentCreateHandleNullable(_handle);
  sdkTransportVehicleequipmentReleaseFfiHandle(_handle);
  return result;
}

VehicleEquipment? sdkTransportVehicleequipmentFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportVehicleequipmentGetValueNullable(handle);
  final result = sdkTransportVehicleequipmentFromFfi(_handle);
  sdkTransportVehicleequipmentReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportVehicleequipmentReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportVehicleequipmentReleaseHandleNullable(handle);

// End of VehicleEquipment "private" section.


