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

/// Contains values of configurable parameters that are used in SDK.
///
/// This is a BETA feature and thus there can be bugs and unexpected behavior.

class ParameterConfiguration {
  /// The pedestrian
  ParameterConfigurationPedestrian pedestrian;

  /// Creates a new instance.

  /// [pedestrian] The pedestrian

  ParameterConfiguration._(this.pedestrian);
  /// Creates a new instance.
  ParameterConfiguration()
      : pedestrian = ParameterConfigurationPedestrian();
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ParameterConfiguration) return false;
    ParameterConfiguration _other = other;
    return pedestrian == _other.pedestrian;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + pedestrian.hashCode;
    return result;
  }
}

/// Stores default values related to pedestrian movement.

class ParameterConfigurationPedestrian {
  /// Walking speed in meters per second.
  double walkingSpeedInMetersPerSecond;

  /// Creates a new instance.

  /// [walkingSpeedInMetersPerSecond] Walking speed in meters per second.

  ParameterConfigurationPedestrian._(this.walkingSpeedInMetersPerSecond);
  /// Creates a new instance.
  ParameterConfigurationPedestrian()
      : walkingSpeedInMetersPerSecond = 1.0;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ParameterConfigurationPedestrian) return false;
    ParameterConfigurationPedestrian _other = other;
    return walkingSpeedInMetersPerSecond == _other.walkingSpeedInMetersPerSecond;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + walkingSpeedInMetersPerSecond.hashCode;
    return result;
  }
}


// ParameterConfigurationPedestrian "private" section, not exported.

final _sdkCoreParameterconfigurationPedestrianCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('here_sdk_sdk_core_ParameterConfiguration_Pedestrian_create_handle'));
final _sdkCoreParameterconfigurationPedestrianReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_ParameterConfiguration_Pedestrian_release_handle'));
final _sdkCoreParameterconfigurationPedestrianGetFieldwalkingSpeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_ParameterConfiguration_Pedestrian_get_field_walkingSpeedInMetersPerSecond'));



Pointer<Void> sdkCoreParameterconfigurationPedestrianToFfi(ParameterConfigurationPedestrian value) {
  final _walkingSpeedInMetersPerSecondHandle = (value.walkingSpeedInMetersPerSecond);
  final _result = _sdkCoreParameterconfigurationPedestrianCreateHandle(_walkingSpeedInMetersPerSecondHandle);
  
  return _result;
}

ParameterConfigurationPedestrian sdkCoreParameterconfigurationPedestrianFromFfi(Pointer<Void> handle) {
  final _walkingSpeedInMetersPerSecondHandle = _sdkCoreParameterconfigurationPedestrianGetFieldwalkingSpeedInMetersPerSecond(handle);
  try {
    return ParameterConfigurationPedestrian._(
      (_walkingSpeedInMetersPerSecondHandle)
    );
  } finally {
    
  }
}

void sdkCoreParameterconfigurationPedestrianReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreParameterconfigurationPedestrianReleaseHandle(handle);

// Nullable ParameterConfigurationPedestrian

final _sdkCoreParameterconfigurationPedestrianCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_ParameterConfiguration_Pedestrian_create_handle_nullable'));
final _sdkCoreParameterconfigurationPedestrianReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_ParameterConfiguration_Pedestrian_release_handle_nullable'));
final _sdkCoreParameterconfigurationPedestrianGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_ParameterConfiguration_Pedestrian_get_value_nullable'));

Pointer<Void> sdkCoreParameterconfigurationPedestrianToFfiNullable(ParameterConfigurationPedestrian? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreParameterconfigurationPedestrianToFfi(value);
  final result = _sdkCoreParameterconfigurationPedestrianCreateHandleNullable(_handle);
  sdkCoreParameterconfigurationPedestrianReleaseFfiHandle(_handle);
  return result;
}

ParameterConfigurationPedestrian? sdkCoreParameterconfigurationPedestrianFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreParameterconfigurationPedestrianGetValueNullable(handle);
  final result = sdkCoreParameterconfigurationPedestrianFromFfi(_handle);
  sdkCoreParameterconfigurationPedestrianReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreParameterconfigurationPedestrianReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreParameterconfigurationPedestrianReleaseHandleNullable(handle);

// End of ParameterConfigurationPedestrian "private" section.

// ParameterConfiguration "private" section, not exported.

final _sdkCoreParameterconfigurationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_ParameterConfiguration_create_handle'));
final _sdkCoreParameterconfigurationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_ParameterConfiguration_release_handle'));
final _sdkCoreParameterconfigurationGetFieldpedestrian = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_ParameterConfiguration_get_field_pedestrian'));



Pointer<Void> sdkCoreParameterconfigurationToFfi(ParameterConfiguration value) {
  final _pedestrianHandle = sdkCoreParameterconfigurationPedestrianToFfi(value.pedestrian);
  final _result = _sdkCoreParameterconfigurationCreateHandle(_pedestrianHandle);
  sdkCoreParameterconfigurationPedestrianReleaseFfiHandle(_pedestrianHandle);
  return _result;
}

ParameterConfiguration sdkCoreParameterconfigurationFromFfi(Pointer<Void> handle) {
  final _pedestrianHandle = _sdkCoreParameterconfigurationGetFieldpedestrian(handle);
  try {
    return ParameterConfiguration._(
      sdkCoreParameterconfigurationPedestrianFromFfi(_pedestrianHandle)
    );
  } finally {
    sdkCoreParameterconfigurationPedestrianReleaseFfiHandle(_pedestrianHandle);
  }
}

void sdkCoreParameterconfigurationReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreParameterconfigurationReleaseHandle(handle);

// Nullable ParameterConfiguration

final _sdkCoreParameterconfigurationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_ParameterConfiguration_create_handle_nullable'));
final _sdkCoreParameterconfigurationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_ParameterConfiguration_release_handle_nullable'));
final _sdkCoreParameterconfigurationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_ParameterConfiguration_get_value_nullable'));

Pointer<Void> sdkCoreParameterconfigurationToFfiNullable(ParameterConfiguration? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreParameterconfigurationToFfi(value);
  final result = _sdkCoreParameterconfigurationCreateHandleNullable(_handle);
  sdkCoreParameterconfigurationReleaseFfiHandle(_handle);
  return result;
}

ParameterConfiguration? sdkCoreParameterconfigurationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreParameterconfigurationGetValueNullable(handle);
  final result = sdkCoreParameterconfigurationFromFfi(_handle);
  sdkCoreParameterconfigurationReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreParameterconfigurationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreParameterconfigurationReleaseHandleNullable(handle);

// End of ParameterConfiguration "private" section.


