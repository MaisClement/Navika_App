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

/// Provides estimated speed information.

class DynamicSpeedInfo {
  /// The speed in meters per second without taking traffic into consideration.
  double baseSpeedInMetersPerSecond;

  /// The speed in meters per second considering traffic.
  double trafficSpeedInMetersPerSecond;

  /// The time it takes to make a turn, represented in seconds.
  int turnTimeInSeconds;

  /// Creates a new instance.

  /// [baseSpeedInMetersPerSecond] The speed in meters per second without taking traffic into consideration.

  /// [trafficSpeedInMetersPerSecond] The speed in meters per second considering traffic.

  /// [turnTimeInSeconds] The time it takes to make a turn, represented in seconds.

  DynamicSpeedInfo(this.baseSpeedInMetersPerSecond, this.trafficSpeedInMetersPerSecond, this.turnTimeInSeconds);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DynamicSpeedInfo) return false;
    DynamicSpeedInfo _other = other;
    return baseSpeedInMetersPerSecond == _other.baseSpeedInMetersPerSecond &&
        trafficSpeedInMetersPerSecond == _other.trafficSpeedInMetersPerSecond &&
        turnTimeInSeconds == _other.turnTimeInSeconds;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + baseSpeedInMetersPerSecond.hashCode;
    result = 31 * result + trafficSpeedInMetersPerSecond.hashCode;
    result = 31 * result + turnTimeInSeconds.hashCode;
    return result;
  }
}


// DynamicSpeedInfo "private" section, not exported.

final _sdkRoutingDynamicspeedinfoCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Int32),
    Pointer<Void> Function(double, double, int)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_create_handle'));
final _sdkRoutingDynamicspeedinfoReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_release_handle'));
final _sdkRoutingDynamicspeedinfoGetFieldbaseSpeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_get_field_baseSpeedInMetersPerSecond'));
final _sdkRoutingDynamicspeedinfoGetFieldtrafficSpeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_get_field_trafficSpeedInMetersPerSecond'));
final _sdkRoutingDynamicspeedinfoGetFieldturnTimeInSeconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_get_field_turnTimeInSeconds'));



Pointer<Void> sdkRoutingDynamicspeedinfoToFfi(DynamicSpeedInfo value) {
  final _baseSpeedInMetersPerSecondHandle = (value.baseSpeedInMetersPerSecond);
  final _trafficSpeedInMetersPerSecondHandle = (value.trafficSpeedInMetersPerSecond);
  final _turnTimeInSecondsHandle = (value.turnTimeInSeconds);
  final _result = _sdkRoutingDynamicspeedinfoCreateHandle(_baseSpeedInMetersPerSecondHandle, _trafficSpeedInMetersPerSecondHandle, _turnTimeInSecondsHandle);
  
  
  
  return _result;
}

DynamicSpeedInfo sdkRoutingDynamicspeedinfoFromFfi(Pointer<Void> handle) {
  final _baseSpeedInMetersPerSecondHandle = _sdkRoutingDynamicspeedinfoGetFieldbaseSpeedInMetersPerSecond(handle);
  final _trafficSpeedInMetersPerSecondHandle = _sdkRoutingDynamicspeedinfoGetFieldtrafficSpeedInMetersPerSecond(handle);
  final _turnTimeInSecondsHandle = _sdkRoutingDynamicspeedinfoGetFieldturnTimeInSeconds(handle);
  try {
    return DynamicSpeedInfo(
      (_baseSpeedInMetersPerSecondHandle), 
      (_trafficSpeedInMetersPerSecondHandle), 
      (_turnTimeInSecondsHandle)
    );
  } finally {
    
    
    
  }
}

void sdkRoutingDynamicspeedinfoReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingDynamicspeedinfoReleaseHandle(handle);

// Nullable DynamicSpeedInfo

final _sdkRoutingDynamicspeedinfoCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_create_handle_nullable'));
final _sdkRoutingDynamicspeedinfoReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_release_handle_nullable'));
final _sdkRoutingDynamicspeedinfoGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_DynamicSpeedInfo_get_value_nullable'));

Pointer<Void> sdkRoutingDynamicspeedinfoToFfiNullable(DynamicSpeedInfo? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingDynamicspeedinfoToFfi(value);
  final result = _sdkRoutingDynamicspeedinfoCreateHandleNullable(_handle);
  sdkRoutingDynamicspeedinfoReleaseFfiHandle(_handle);
  return result;
}

DynamicSpeedInfo? sdkRoutingDynamicspeedinfoFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingDynamicspeedinfoGetValueNullable(handle);
  final result = sdkRoutingDynamicspeedinfoFromFfi(_handle);
  sdkRoutingDynamicspeedinfoReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingDynamicspeedinfoReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingDynamicspeedinfoReleaseHandleNullable(handle);

// End of DynamicSpeedInfo "private" section.


