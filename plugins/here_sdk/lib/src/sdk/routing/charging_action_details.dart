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

/// Parameters related to the electric vehicle's charging action.

class ChargingActionDetails {
  /// Maximum charging power (in kW) available to the vehicle, based on the properties of the charging station and the vehicle.
  /// A valid [ChargingActionDetails] object will have positive [ChargingActionDetails.consumablePowerInKilowatts].
  /// Defaults to 0.
  double consumablePowerInKilowatts;

  /// Estimated vehicle battery charge before this action (in kWh).
  /// A valid [ChargingActionDetails] object will have positive [ChargingActionDetails.arrivalChargeInKilowattHours].
  /// Defaults to 0.
  double arrivalChargeInKilowattHours;

  /// Level to which vehicle battery should be charged by this action (in kWh).
  /// A valid [ChargingActionDetails] object will have positive [ChargingActionDetails.targetChargeInKilowattHours].
  /// Defaults to 0.
  double targetChargeInKilowattHours;

  /// Creates a new instance.

  /// [consumablePowerInKilowatts] Maximum charging power (in kW) available to the vehicle, based on the properties of the charging station and the vehicle.
  /// A valid [ChargingActionDetails] object will have positive [ChargingActionDetails.consumablePowerInKilowatts].
  /// Defaults to 0.

  /// [arrivalChargeInKilowattHours] Estimated vehicle battery charge before this action (in kWh).
  /// A valid [ChargingActionDetails] object will have positive [ChargingActionDetails.arrivalChargeInKilowattHours].
  /// Defaults to 0.

  /// [targetChargeInKilowattHours] Level to which vehicle battery should be charged by this action (in kWh).
  /// A valid [ChargingActionDetails] object will have positive [ChargingActionDetails.targetChargeInKilowattHours].
  /// Defaults to 0.

  ChargingActionDetails._(this.consumablePowerInKilowatts, this.arrivalChargeInKilowattHours, this.targetChargeInKilowattHours);
  ChargingActionDetails()
    : consumablePowerInKilowatts = 0.0, arrivalChargeInKilowattHours = 0.0, targetChargeInKilowattHours = 0.0;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChargingActionDetails) return false;
    ChargingActionDetails _other = other;
    return consumablePowerInKilowatts == _other.consumablePowerInKilowatts &&
        arrivalChargeInKilowattHours == _other.arrivalChargeInKilowattHours &&
        targetChargeInKilowattHours == _other.targetChargeInKilowattHours;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + consumablePowerInKilowatts.hashCode;
    result = 31 * result + arrivalChargeInKilowattHours.hashCode;
    result = 31 * result + targetChargeInKilowattHours.hashCode;
    return result;
  }
}


// ChargingActionDetails "private" section, not exported.

final _sdkRoutingChargingactiondetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Double),
    Pointer<Void> Function(double, double, double)
  >('here_sdk_sdk_routing_ChargingActionDetails_create_handle'));
final _sdkRoutingChargingactiondetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingActionDetails_release_handle'));
final _sdkRoutingChargingactiondetailsGetFieldconsumablePowerInKilowatts = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingActionDetails_get_field_consumablePowerInKilowatts'));
final _sdkRoutingChargingactiondetailsGetFieldarrivalChargeInKilowattHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingActionDetails_get_field_arrivalChargeInKilowattHours'));
final _sdkRoutingChargingactiondetailsGetFieldtargetChargeInKilowattHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingActionDetails_get_field_targetChargeInKilowattHours'));



Pointer<Void> sdkRoutingChargingactiondetailsToFfi(ChargingActionDetails value) {
  final _consumablePowerInKilowattsHandle = (value.consumablePowerInKilowatts);
  final _arrivalChargeInKilowattHoursHandle = (value.arrivalChargeInKilowattHours);
  final _targetChargeInKilowattHoursHandle = (value.targetChargeInKilowattHours);
  final _result = _sdkRoutingChargingactiondetailsCreateHandle(_consumablePowerInKilowattsHandle, _arrivalChargeInKilowattHoursHandle, _targetChargeInKilowattHoursHandle);
  
  
  
  return _result;
}

ChargingActionDetails sdkRoutingChargingactiondetailsFromFfi(Pointer<Void> handle) {
  final _consumablePowerInKilowattsHandle = _sdkRoutingChargingactiondetailsGetFieldconsumablePowerInKilowatts(handle);
  final _arrivalChargeInKilowattHoursHandle = _sdkRoutingChargingactiondetailsGetFieldarrivalChargeInKilowattHours(handle);
  final _targetChargeInKilowattHoursHandle = _sdkRoutingChargingactiondetailsGetFieldtargetChargeInKilowattHours(handle);
  try {
    return ChargingActionDetails._(
      (_consumablePowerInKilowattsHandle), 
      (_arrivalChargeInKilowattHoursHandle), 
      (_targetChargeInKilowattHoursHandle)
    );
  } finally {
    
    
    
  }
}

void sdkRoutingChargingactiondetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingChargingactiondetailsReleaseHandle(handle);

// Nullable ChargingActionDetails

final _sdkRoutingChargingactiondetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingActionDetails_create_handle_nullable'));
final _sdkRoutingChargingactiondetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingActionDetails_release_handle_nullable'));
final _sdkRoutingChargingactiondetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingActionDetails_get_value_nullable'));

Pointer<Void> sdkRoutingChargingactiondetailsToFfiNullable(ChargingActionDetails? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingChargingactiondetailsToFfi(value);
  final result = _sdkRoutingChargingactiondetailsCreateHandleNullable(_handle);
  sdkRoutingChargingactiondetailsReleaseFfiHandle(_handle);
  return result;
}

ChargingActionDetails? sdkRoutingChargingactiondetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingChargingactiondetailsGetValueNullable(handle);
  final result = sdkRoutingChargingactiondetailsFromFfi(_handle);
  sdkRoutingChargingactiondetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingChargingactiondetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingChargingactiondetailsReleaseHandleNullable(handle);

// End of ChargingActionDetails "private" section.


