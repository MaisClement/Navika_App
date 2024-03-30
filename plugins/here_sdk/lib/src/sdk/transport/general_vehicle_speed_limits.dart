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

/// Contains the speed limits for the vehicle on the segment.

class GeneralVehicleSpeedLimits {
  /// The general speed limit on highways for the country / state where the segment is located.
  /// It is `null` if the general speed limit on highways for the country / state is not specified.
  double? maxSpeedHighwaysInMetersPerSecond;

  /// The general speed limit on rural roads for the country / state where the segment is located.
  /// It is `null` if the general speed limit on rural roads for the country / state is not specified.
  double? maxSpeedRuralInMetersPerSecond;

  /// The general speed limit on urban roads for the country / state where the segment is located.
  /// It is `null` if the general speed limit on urban roads for the country / state is not specified.
  double? maxSpeedUrbanInMetersPerSecond;

  /// Creates a new instance.

  /// [maxSpeedHighwaysInMetersPerSecond] The general speed limit on highways for the country / state where the segment is located.
  /// It is `null` if the general speed limit on highways for the country / state is not specified.

  /// [maxSpeedRuralInMetersPerSecond] The general speed limit on rural roads for the country / state where the segment is located.
  /// It is `null` if the general speed limit on rural roads for the country / state is not specified.

  /// [maxSpeedUrbanInMetersPerSecond] The general speed limit on urban roads for the country / state where the segment is located.
  /// It is `null` if the general speed limit on urban roads for the country / state is not specified.

  GeneralVehicleSpeedLimits._(this.maxSpeedHighwaysInMetersPerSecond, this.maxSpeedRuralInMetersPerSecond, this.maxSpeedUrbanInMetersPerSecond);
  GeneralVehicleSpeedLimits()
    : maxSpeedHighwaysInMetersPerSecond = null, maxSpeedRuralInMetersPerSecond = null, maxSpeedUrbanInMetersPerSecond = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GeneralVehicleSpeedLimits) return false;
    GeneralVehicleSpeedLimits _other = other;
    return maxSpeedHighwaysInMetersPerSecond == _other.maxSpeedHighwaysInMetersPerSecond &&
        maxSpeedRuralInMetersPerSecond == _other.maxSpeedRuralInMetersPerSecond &&
        maxSpeedUrbanInMetersPerSecond == _other.maxSpeedUrbanInMetersPerSecond;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + maxSpeedHighwaysInMetersPerSecond.hashCode;
    result = 31 * result + maxSpeedRuralInMetersPerSecond.hashCode;
    result = 31 * result + maxSpeedUrbanInMetersPerSecond.hashCode;
    return result;
  }
}


// GeneralVehicleSpeedLimits "private" section, not exported.

final _sdkTransportGeneralvehiclespeedlimitsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_transport_GeneralVehicleSpeedLimits_create_handle'));
final _sdkTransportGeneralvehiclespeedlimitsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_GeneralVehicleSpeedLimits_release_handle'));
final _sdkTransportGeneralvehiclespeedlimitsGetFieldmaxSpeedHighwaysInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_GeneralVehicleSpeedLimits_get_field_maxSpeedHighwaysInMetersPerSecond'));
final _sdkTransportGeneralvehiclespeedlimitsGetFieldmaxSpeedRuralInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_GeneralVehicleSpeedLimits_get_field_maxSpeedRuralInMetersPerSecond'));
final _sdkTransportGeneralvehiclespeedlimitsGetFieldmaxSpeedUrbanInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_GeneralVehicleSpeedLimits_get_field_maxSpeedUrbanInMetersPerSecond'));



Pointer<Void> sdkTransportGeneralvehiclespeedlimitsToFfi(GeneralVehicleSpeedLimits value) {
  final _maxSpeedHighwaysInMetersPerSecondHandle = doubleToFfiNullable(value.maxSpeedHighwaysInMetersPerSecond);
  final _maxSpeedRuralInMetersPerSecondHandle = doubleToFfiNullable(value.maxSpeedRuralInMetersPerSecond);
  final _maxSpeedUrbanInMetersPerSecondHandle = doubleToFfiNullable(value.maxSpeedUrbanInMetersPerSecond);
  final _result = _sdkTransportGeneralvehiclespeedlimitsCreateHandle(_maxSpeedHighwaysInMetersPerSecondHandle, _maxSpeedRuralInMetersPerSecondHandle, _maxSpeedUrbanInMetersPerSecondHandle);
  doubleReleaseFfiHandleNullable(_maxSpeedHighwaysInMetersPerSecondHandle);
  doubleReleaseFfiHandleNullable(_maxSpeedRuralInMetersPerSecondHandle);
  doubleReleaseFfiHandleNullable(_maxSpeedUrbanInMetersPerSecondHandle);
  return _result;
}

GeneralVehicleSpeedLimits sdkTransportGeneralvehiclespeedlimitsFromFfi(Pointer<Void> handle) {
  final _maxSpeedHighwaysInMetersPerSecondHandle = _sdkTransportGeneralvehiclespeedlimitsGetFieldmaxSpeedHighwaysInMetersPerSecond(handle);
  final _maxSpeedRuralInMetersPerSecondHandle = _sdkTransportGeneralvehiclespeedlimitsGetFieldmaxSpeedRuralInMetersPerSecond(handle);
  final _maxSpeedUrbanInMetersPerSecondHandle = _sdkTransportGeneralvehiclespeedlimitsGetFieldmaxSpeedUrbanInMetersPerSecond(handle);
  try {
    return GeneralVehicleSpeedLimits._(
      doubleFromFfiNullable(_maxSpeedHighwaysInMetersPerSecondHandle), 
      doubleFromFfiNullable(_maxSpeedRuralInMetersPerSecondHandle), 
      doubleFromFfiNullable(_maxSpeedUrbanInMetersPerSecondHandle)
    );
  } finally {
    doubleReleaseFfiHandleNullable(_maxSpeedHighwaysInMetersPerSecondHandle);
    doubleReleaseFfiHandleNullable(_maxSpeedRuralInMetersPerSecondHandle);
    doubleReleaseFfiHandleNullable(_maxSpeedUrbanInMetersPerSecondHandle);
  }
}

void sdkTransportGeneralvehiclespeedlimitsReleaseFfiHandle(Pointer<Void> handle) => _sdkTransportGeneralvehiclespeedlimitsReleaseHandle(handle);

// Nullable GeneralVehicleSpeedLimits

final _sdkTransportGeneralvehiclespeedlimitsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_GeneralVehicleSpeedLimits_create_handle_nullable'));
final _sdkTransportGeneralvehiclespeedlimitsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_GeneralVehicleSpeedLimits_release_handle_nullable'));
final _sdkTransportGeneralvehiclespeedlimitsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_GeneralVehicleSpeedLimits_get_value_nullable'));

Pointer<Void> sdkTransportGeneralvehiclespeedlimitsToFfiNullable(GeneralVehicleSpeedLimits? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportGeneralvehiclespeedlimitsToFfi(value);
  final result = _sdkTransportGeneralvehiclespeedlimitsCreateHandleNullable(_handle);
  sdkTransportGeneralvehiclespeedlimitsReleaseFfiHandle(_handle);
  return result;
}

GeneralVehicleSpeedLimits? sdkTransportGeneralvehiclespeedlimitsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportGeneralvehiclespeedlimitsGetValueNullable(handle);
  final result = sdkTransportGeneralvehiclespeedlimitsFromFfi(_handle);
  sdkTransportGeneralvehiclespeedlimitsReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportGeneralvehiclespeedlimitsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportGeneralvehiclespeedlimitsReleaseHandleNullable(handle);

// End of GeneralVehicleSpeedLimits "private" section.


