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
import 'package:here_sdk/src/sdk/core/pedestrian_profile.dart';
import 'package:here_sdk/src/sdk/transport/vehicle_profile.dart';

/// Contains values of transport profile.
///
/// This is a BETA feature and thus there can be bugs and unexpected behavior.

class TransportProfile {
  /// Defines the pedestrian profile.
  PedestrianProfile pedestrianProfile;

  /// Defines the vehicle profile.
  VehicleProfile? vehicleProfile;

  /// Creates a new instance.

  /// [pedestrianProfile] Defines the pedestrian profile.

  /// [vehicleProfile] Defines the vehicle profile.

  TransportProfile._(this.pedestrianProfile, this.vehicleProfile);
  TransportProfile()
    : pedestrianProfile = PedestrianProfile(), vehicleProfile = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TransportProfile) return false;
    TransportProfile _other = other;
    return pedestrianProfile == _other.pedestrianProfile &&
        vehicleProfile == _other.vehicleProfile;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + pedestrianProfile.hashCode;
    result = 31 * result + vehicleProfile.hashCode;
    return result;
  }
}


// TransportProfile "private" section, not exported.

final _sdkCoreTransportprofileCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_TransportProfile_create_handle'));
final _sdkCoreTransportprofileReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_TransportProfile_release_handle'));
final _sdkCoreTransportprofileGetFieldpedestrianProfile = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_TransportProfile_get_field_pedestrianProfile'));
final _sdkCoreTransportprofileGetFieldvehicleProfile = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_TransportProfile_get_field_vehicleProfile'));



Pointer<Void> sdkCoreTransportprofileToFfi(TransportProfile value) {
  final _pedestrianProfileHandle = sdkCorePedestrianprofileToFfi(value.pedestrianProfile);
  final _vehicleProfileHandle = sdkTransportVehicleprofileToFfiNullable(value.vehicleProfile);
  final _result = _sdkCoreTransportprofileCreateHandle(_pedestrianProfileHandle, _vehicleProfileHandle);
  sdkCorePedestrianprofileReleaseFfiHandle(_pedestrianProfileHandle);
  sdkTransportVehicleprofileReleaseFfiHandleNullable(_vehicleProfileHandle);
  return _result;
}

TransportProfile sdkCoreTransportprofileFromFfi(Pointer<Void> handle) {
  final _pedestrianProfileHandle = _sdkCoreTransportprofileGetFieldpedestrianProfile(handle);
  final _vehicleProfileHandle = _sdkCoreTransportprofileGetFieldvehicleProfile(handle);
  try {
    return TransportProfile._(
      sdkCorePedestrianprofileFromFfi(_pedestrianProfileHandle), 
      sdkTransportVehicleprofileFromFfiNullable(_vehicleProfileHandle)
    );
  } finally {
    sdkCorePedestrianprofileReleaseFfiHandle(_pedestrianProfileHandle);
    sdkTransportVehicleprofileReleaseFfiHandleNullable(_vehicleProfileHandle);
  }
}

void sdkCoreTransportprofileReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreTransportprofileReleaseHandle(handle);

// Nullable TransportProfile

final _sdkCoreTransportprofileCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_TransportProfile_create_handle_nullable'));
final _sdkCoreTransportprofileReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_TransportProfile_release_handle_nullable'));
final _sdkCoreTransportprofileGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_TransportProfile_get_value_nullable'));

Pointer<Void> sdkCoreTransportprofileToFfiNullable(TransportProfile? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreTransportprofileToFfi(value);
  final result = _sdkCoreTransportprofileCreateHandleNullable(_handle);
  sdkCoreTransportprofileReleaseFfiHandle(_handle);
  return result;
}

TransportProfile? sdkCoreTransportprofileFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreTransportprofileGetValueNullable(handle);
  final result = sdkCoreTransportprofileFromFfi(_handle);
  sdkCoreTransportprofileReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreTransportprofileReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreTransportprofileReleaseHandleNullable(handle);

// End of TransportProfile "private" section.


