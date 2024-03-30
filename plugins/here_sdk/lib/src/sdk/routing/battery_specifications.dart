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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/charging_connector_type.dart';

/// Parameters related to the electric vehicle's battery.

class BatterySpecifications {
  /// Total capacity of the vehicle's battery (in kWh).
  /// It must be positive.
  /// Defaults to 0.
  double totalCapacityInKilowattHours;

  /// Charge level of the vehicle's battery at the start of the route (in kWh).
  /// It must be non-negative and less than or equal to the value of
  /// [BatterySpecifications.totalCapacityInKilowattHours],
  /// otherwise the [BatterySpecifications] instance is considered invalid.
  /// Defaults to 0.
  double initialChargeInKilowattHours;

  /// Maximum charge to which the battery should be charged at a charging station (in kWh).
  /// It must be positive and less than or equal to the value of
  /// [BatterySpecifications.totalCapacityInKilowattHours],
  /// otherwise the [BatterySpecifications] instance is considered invalid.
  /// Defaults to 0.
  double targetChargeInKilowattHours;

  /// Function curve describing the maximum battery charging rate (in kW) at a given charge
  /// level (in kWh).
  /// Map keys represent charge levels that are non-negative floating point values
  /// in units of (kWh).
  /// Map values represent charging rate values that are positive floating point values
  /// in units of (kW).
  /// Given charge levels must cover the entire range of
  /// \[0, [BatterySpecifications.targetChargeInKilowattHours]\],
  /// otherwise the [BatterySpecifications] instance is considered invalid.
  /// The charging curve is considerred piecewise constant instead of being interpolated.
  /// Defaults to an empty container.
  Map<double, double> chargingCurve;

  /// List of available charging connector types.
  /// It must be at least one charging connector type added, otherwise
  /// the [BatterySpecifications] instance is considered invalid.
  /// Defaults to an empty container.
  List<ChargingConnectorType> connectorTypes;

  /// Minimum charge when arriving at a charging station in kWh.
  /// It must be non-negative and less than the value of
  /// [BatterySpecifications.targetChargeInKilowattHours],
  /// otherwise the [BatterySpecifications] instance is considered invalid.
  /// Defaults to 0.
  double minChargeAtChargingStationInKilowattHours;

  /// Minimum charge when arriving at first charging station in kWh.
  /// This overrides [BatterySpecifications.minChargeAtChargingStationInKilowattHours] for the first charging station.
  /// If not specified, [BatterySpecifications.minChargeAtChargingStationInKilowattHours] will be used
  /// for all charging stations, including the first one.
  /// Defaults to `null`.
  /// When initialized, it must be non-negative and less than the value of
  /// [BatterySpecifications.targetChargeInKilowattHours],
  /// otherwise the [BatterySpecifications] instance is considered invalid.
  /// This is usually used when the current charge is too low to reach a charging station within `minChargeAtChargingStation` limits.
  double? minChargeAtFirstChargingStationInKilowattHours;

  /// Minimum charge at the final route destination in kWh.
  /// It must be non-negative and less than the value of
  /// [BatterySpecifications.targetChargeInKilowattHours],
  /// otherwise the [BatterySpecifications] instance is considered invalid.
  /// Defaults to 0.
  double minChargeAtDestinationInKilowattHours;

  /// Maximum charging voltage supported by the vehicle's battery in Volts.
  /// It must be positive.
  /// When omitted, the voltage is determined by the charging station attributes.
  /// Defaults to `null`.
  double? maxChargingVoltageInVolts;

  /// Maximum charging current supported by the vehicle's battery in Amperes.
  /// It must be positive.
  /// When omitted, the charging current is determined by the charging station attributes.
  /// Defaults to `null`.
  double? maxChargingCurrentInAmperes;

  /// Time in seconds spent after arriving at a charging station, but before actually charging,
  /// e.g., time spent for payment processing.
  /// Defaults to 0 seconds.
  Duration chargingSetupDuration;

  /// Creates a new instance.

  /// [totalCapacityInKilowattHours] Total capacity of the vehicle's battery (in kWh).
  /// It must be positive.
  /// Defaults to 0.

  /// [initialChargeInKilowattHours] Charge level of the vehicle's battery at the start of the route (in kWh).
  /// It must be non-negative and less than or equal to the value of
  /// [BatterySpecifications.totalCapacityInKilowattHours],
  /// otherwise the [BatterySpecifications] instance is considered invalid.
  /// Defaults to 0.

  /// [targetChargeInKilowattHours] Maximum charge to which the battery should be charged at a charging station (in kWh).
  /// It must be positive and less than or equal to the value of
  /// [BatterySpecifications.totalCapacityInKilowattHours],
  /// otherwise the [BatterySpecifications] instance is considered invalid.
  /// Defaults to 0.

  /// [chargingCurve] Function curve describing the maximum battery charging rate (in kW) at a given charge
  /// level (in kWh).
  /// Map keys represent charge levels that are non-negative floating point values
  /// in units of (kWh).
  /// Map values represent charging rate values that are positive floating point values
  /// in units of (kW).
  /// Given charge levels must cover the entire range of
  /// \[0, [BatterySpecifications.targetChargeInKilowattHours]\],
  /// otherwise the [BatterySpecifications] instance is considered invalid.
  /// The charging curve is considerred piecewise constant instead of being interpolated.
  /// Defaults to an empty container.

  /// [connectorTypes] List of available charging connector types.
  /// It must be at least one charging connector type added, otherwise
  /// the [BatterySpecifications] instance is considered invalid.
  /// Defaults to an empty container.

  /// [minChargeAtChargingStationInKilowattHours] Minimum charge when arriving at a charging station in kWh.
  /// It must be non-negative and less than the value of
  /// [BatterySpecifications.targetChargeInKilowattHours],
  /// otherwise the [BatterySpecifications] instance is considered invalid.
  /// Defaults to 0.

  /// [minChargeAtFirstChargingStationInKilowattHours] Minimum charge when arriving at first charging station in kWh.
  /// This overrides [BatterySpecifications.minChargeAtChargingStationInKilowattHours] for the first charging station.
  /// If not specified, [BatterySpecifications.minChargeAtChargingStationInKilowattHours] will be used
  /// for all charging stations, including the first one.
  /// Defaults to `null`.
  /// When initialized, it must be non-negative and less than the value of
  /// [BatterySpecifications.targetChargeInKilowattHours],
  /// otherwise the [BatterySpecifications] instance is considered invalid.
  /// This is usually used when the current charge is too low to reach a charging station within `minChargeAtChargingStation` limits.

  /// [minChargeAtDestinationInKilowattHours] Minimum charge at the final route destination in kWh.
  /// It must be non-negative and less than the value of
  /// [BatterySpecifications.targetChargeInKilowattHours],
  /// otherwise the [BatterySpecifications] instance is considered invalid.
  /// Defaults to 0.

  /// [maxChargingVoltageInVolts] Maximum charging voltage supported by the vehicle's battery in Volts.
  /// It must be positive.
  /// When omitted, the voltage is determined by the charging station attributes.
  /// Defaults to `null`.

  /// [maxChargingCurrentInAmperes] Maximum charging current supported by the vehicle's battery in Amperes.
  /// It must be positive.
  /// When omitted, the charging current is determined by the charging station attributes.
  /// Defaults to `null`.

  /// [chargingSetupDuration] Time in seconds spent after arriving at a charging station, but before actually charging,
  /// e.g., time spent for payment processing.
  /// Defaults to 0 seconds.

  BatterySpecifications([double totalCapacityInKilowattHours = 0.0, double initialChargeInKilowattHours = 0.0, double targetChargeInKilowattHours = 0.0, Map<double, double> chargingCurve = const {}, List<ChargingConnectorType> connectorTypes = const [], double minChargeAtChargingStationInKilowattHours = 0.0, double? minChargeAtFirstChargingStationInKilowattHours = null, double minChargeAtDestinationInKilowattHours = 0.0, double? maxChargingVoltageInVolts = null, double? maxChargingCurrentInAmperes = null, Duration chargingSetupDuration = const Duration(seconds: 0)])
    : totalCapacityInKilowattHours = totalCapacityInKilowattHours, initialChargeInKilowattHours = initialChargeInKilowattHours, targetChargeInKilowattHours = targetChargeInKilowattHours, chargingCurve = chargingCurve, connectorTypes = connectorTypes, minChargeAtChargingStationInKilowattHours = minChargeAtChargingStationInKilowattHours, minChargeAtFirstChargingStationInKilowattHours = minChargeAtFirstChargingStationInKilowattHours, minChargeAtDestinationInKilowattHours = minChargeAtDestinationInKilowattHours, maxChargingVoltageInVolts = maxChargingVoltageInVolts, maxChargingCurrentInAmperes = maxChargingCurrentInAmperes, chargingSetupDuration = chargingSetupDuration;
  /// Creates a new instance.
  BatterySpecifications.withDefaults()
      : totalCapacityInKilowattHours = 0.0, initialChargeInKilowattHours = 0.0, targetChargeInKilowattHours = 0.0, chargingCurve = {}, connectorTypes = [], minChargeAtChargingStationInKilowattHours = 0.0, minChargeAtFirstChargingStationInKilowattHours = null, minChargeAtDestinationInKilowattHours = 0.0, maxChargingVoltageInVolts = null, maxChargingCurrentInAmperes = null, chargingSetupDuration = const Duration(seconds: 0);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BatterySpecifications) return false;
    BatterySpecifications _other = other;
    return totalCapacityInKilowattHours == _other.totalCapacityInKilowattHours &&
        initialChargeInKilowattHours == _other.initialChargeInKilowattHours &&
        targetChargeInKilowattHours == _other.targetChargeInKilowattHours &&
        DeepCollectionEquality().equals(chargingCurve, _other.chargingCurve) &&
        DeepCollectionEquality().equals(connectorTypes, _other.connectorTypes) &&
        minChargeAtChargingStationInKilowattHours == _other.minChargeAtChargingStationInKilowattHours &&
        minChargeAtFirstChargingStationInKilowattHours == _other.minChargeAtFirstChargingStationInKilowattHours &&
        minChargeAtDestinationInKilowattHours == _other.minChargeAtDestinationInKilowattHours &&
        maxChargingVoltageInVolts == _other.maxChargingVoltageInVolts &&
        maxChargingCurrentInAmperes == _other.maxChargingCurrentInAmperes &&
        chargingSetupDuration == _other.chargingSetupDuration;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + totalCapacityInKilowattHours.hashCode;
    result = 31 * result + initialChargeInKilowattHours.hashCode;
    result = 31 * result + targetChargeInKilowattHours.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(chargingCurve);
    result = 31 * result + DeepCollectionEquality().hash(connectorTypes);
    result = 31 * result + minChargeAtChargingStationInKilowattHours.hashCode;
    result = 31 * result + minChargeAtFirstChargingStationInKilowattHours.hashCode;
    result = 31 * result + minChargeAtDestinationInKilowattHours.hashCode;
    result = 31 * result + maxChargingVoltageInVolts.hashCode;
    result = 31 * result + maxChargingCurrentInAmperes.hashCode;
    result = 31 * result + chargingSetupDuration.hashCode;
    return result;
  }
}


// BatterySpecifications "private" section, not exported.

final _sdkRoutingBatteryspecificationsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Double, Pointer<Void>, Pointer<Void>, Double, Pointer<Void>, Double, Pointer<Void>, Pointer<Void>, Uint64),
    Pointer<Void> Function(double, double, double, Pointer<Void>, Pointer<Void>, double, Pointer<Void>, double, Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_routing_BatterySpecifications_create_handle'));
final _sdkRoutingBatteryspecificationsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_release_handle'));
final _sdkRoutingBatteryspecificationsGetFieldtotalCapacityInKilowattHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_totalCapacityInKilowattHours'));
final _sdkRoutingBatteryspecificationsGetFieldinitialChargeInKilowattHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_initialChargeInKilowattHours'));
final _sdkRoutingBatteryspecificationsGetFieldtargetChargeInKilowattHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_targetChargeInKilowattHours'));
final _sdkRoutingBatteryspecificationsGetFieldchargingCurve = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_chargingCurve'));
final _sdkRoutingBatteryspecificationsGetFieldconnectorTypes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_connectorTypes'));
final _sdkRoutingBatteryspecificationsGetFieldminChargeAtChargingStationInKilowattHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_minChargeAtChargingStationInKilowattHours'));
final _sdkRoutingBatteryspecificationsGetFieldminChargeAtFirstChargingStationInKilowattHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_minChargeAtFirstChargingStationInKilowattHours'));
final _sdkRoutingBatteryspecificationsGetFieldminChargeAtDestinationInKilowattHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_minChargeAtDestinationInKilowattHours'));
final _sdkRoutingBatteryspecificationsGetFieldmaxChargingVoltageInVolts = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_maxChargingVoltageInVolts'));
final _sdkRoutingBatteryspecificationsGetFieldmaxChargingCurrentInAmperes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_maxChargingCurrentInAmperes'));
final _sdkRoutingBatteryspecificationsGetFieldchargingSetupDuration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_field_chargingSetupDuration'));



Pointer<Void> sdkRoutingBatteryspecificationsToFfi(BatterySpecifications value) {
  final _totalCapacityInKilowattHoursHandle = (value.totalCapacityInKilowattHours);
  final _initialChargeInKilowattHoursHandle = (value.initialChargeInKilowattHours);
  final _targetChargeInKilowattHoursHandle = (value.targetChargeInKilowattHours);
  final _chargingCurveHandle = heresdkRoutingCommonBindingsmapofDoubleToDoubleToFfi(value.chargingCurve);
  final _connectorTypesHandle = heresdkRoutingCommonBindingslistofSdkRoutingChargingconnectortypeToFfi(value.connectorTypes);
  final _minChargeAtChargingStationInKilowattHoursHandle = (value.minChargeAtChargingStationInKilowattHours);
  final _minChargeAtFirstChargingStationInKilowattHoursHandle = doubleToFfiNullable(value.minChargeAtFirstChargingStationInKilowattHours);
  final _minChargeAtDestinationInKilowattHoursHandle = (value.minChargeAtDestinationInKilowattHours);
  final _maxChargingVoltageInVoltsHandle = doubleToFfiNullable(value.maxChargingVoltageInVolts);
  final _maxChargingCurrentInAmperesHandle = doubleToFfiNullable(value.maxChargingCurrentInAmperes);
  final _chargingSetupDurationHandle = durationToFfi(value.chargingSetupDuration);
  final _result = _sdkRoutingBatteryspecificationsCreateHandle(_totalCapacityInKilowattHoursHandle, _initialChargeInKilowattHoursHandle, _targetChargeInKilowattHoursHandle, _chargingCurveHandle, _connectorTypesHandle, _minChargeAtChargingStationInKilowattHoursHandle, _minChargeAtFirstChargingStationInKilowattHoursHandle, _minChargeAtDestinationInKilowattHoursHandle, _maxChargingVoltageInVoltsHandle, _maxChargingCurrentInAmperesHandle, _chargingSetupDurationHandle);
  
  
  
  heresdkRoutingCommonBindingsmapofDoubleToDoubleReleaseFfiHandle(_chargingCurveHandle);
  heresdkRoutingCommonBindingslistofSdkRoutingChargingconnectortypeReleaseFfiHandle(_connectorTypesHandle);
  
  doubleReleaseFfiHandleNullable(_minChargeAtFirstChargingStationInKilowattHoursHandle);
  
  doubleReleaseFfiHandleNullable(_maxChargingVoltageInVoltsHandle);
  doubleReleaseFfiHandleNullable(_maxChargingCurrentInAmperesHandle);
  durationReleaseFfiHandle(_chargingSetupDurationHandle);
  return _result;
}

BatterySpecifications sdkRoutingBatteryspecificationsFromFfi(Pointer<Void> handle) {
  final _totalCapacityInKilowattHoursHandle = _sdkRoutingBatteryspecificationsGetFieldtotalCapacityInKilowattHours(handle);
  final _initialChargeInKilowattHoursHandle = _sdkRoutingBatteryspecificationsGetFieldinitialChargeInKilowattHours(handle);
  final _targetChargeInKilowattHoursHandle = _sdkRoutingBatteryspecificationsGetFieldtargetChargeInKilowattHours(handle);
  final _chargingCurveHandle = _sdkRoutingBatteryspecificationsGetFieldchargingCurve(handle);
  final _connectorTypesHandle = _sdkRoutingBatteryspecificationsGetFieldconnectorTypes(handle);
  final _minChargeAtChargingStationInKilowattHoursHandle = _sdkRoutingBatteryspecificationsGetFieldminChargeAtChargingStationInKilowattHours(handle);
  final _minChargeAtFirstChargingStationInKilowattHoursHandle = _sdkRoutingBatteryspecificationsGetFieldminChargeAtFirstChargingStationInKilowattHours(handle);
  final _minChargeAtDestinationInKilowattHoursHandle = _sdkRoutingBatteryspecificationsGetFieldminChargeAtDestinationInKilowattHours(handle);
  final _maxChargingVoltageInVoltsHandle = _sdkRoutingBatteryspecificationsGetFieldmaxChargingVoltageInVolts(handle);
  final _maxChargingCurrentInAmperesHandle = _sdkRoutingBatteryspecificationsGetFieldmaxChargingCurrentInAmperes(handle);
  final _chargingSetupDurationHandle = _sdkRoutingBatteryspecificationsGetFieldchargingSetupDuration(handle);
  try {
    return BatterySpecifications(
      (_totalCapacityInKilowattHoursHandle), 
      (_initialChargeInKilowattHoursHandle), 
      (_targetChargeInKilowattHoursHandle), 
      heresdkRoutingCommonBindingsmapofDoubleToDoubleFromFfi(_chargingCurveHandle), 
      heresdkRoutingCommonBindingslistofSdkRoutingChargingconnectortypeFromFfi(_connectorTypesHandle), 
      (_minChargeAtChargingStationInKilowattHoursHandle), 
      doubleFromFfiNullable(_minChargeAtFirstChargingStationInKilowattHoursHandle), 
      (_minChargeAtDestinationInKilowattHoursHandle), 
      doubleFromFfiNullable(_maxChargingVoltageInVoltsHandle), 
      doubleFromFfiNullable(_maxChargingCurrentInAmperesHandle), 
      durationFromFfi(_chargingSetupDurationHandle)
    );
  } finally {
    
    
    
    heresdkRoutingCommonBindingsmapofDoubleToDoubleReleaseFfiHandle(_chargingCurveHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingChargingconnectortypeReleaseFfiHandle(_connectorTypesHandle);
    
    doubleReleaseFfiHandleNullable(_minChargeAtFirstChargingStationInKilowattHoursHandle);
    
    doubleReleaseFfiHandleNullable(_maxChargingVoltageInVoltsHandle);
    doubleReleaseFfiHandleNullable(_maxChargingCurrentInAmperesHandle);
    durationReleaseFfiHandle(_chargingSetupDurationHandle);
  }
}

void sdkRoutingBatteryspecificationsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingBatteryspecificationsReleaseHandle(handle);

// Nullable BatterySpecifications

final _sdkRoutingBatteryspecificationsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_create_handle_nullable'));
final _sdkRoutingBatteryspecificationsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_release_handle_nullable'));
final _sdkRoutingBatteryspecificationsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BatterySpecifications_get_value_nullable'));

Pointer<Void> sdkRoutingBatteryspecificationsToFfiNullable(BatterySpecifications? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingBatteryspecificationsToFfi(value);
  final result = _sdkRoutingBatteryspecificationsCreateHandleNullable(_handle);
  sdkRoutingBatteryspecificationsReleaseFfiHandle(_handle);
  return result;
}

BatterySpecifications? sdkRoutingBatteryspecificationsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingBatteryspecificationsGetValueNullable(handle);
  final result = sdkRoutingBatteryspecificationsFromFfi(_handle);
  sdkRoutingBatteryspecificationsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingBatteryspecificationsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingBatteryspecificationsReleaseHandleNullable(handle);

// End of BatterySpecifications "private" section.


