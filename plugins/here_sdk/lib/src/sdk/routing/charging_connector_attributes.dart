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
import 'package:here_sdk/src/sdk/routing/charging_connector_type.dart';
import 'package:here_sdk/src/sdk/routing/charging_supply_type.dart';

/// Details of the connector that is suggested to be used in the section's
/// [PostAction]'s for charging.

class ChargingConnectorAttributes {
  /// Power supplied by the suggested connector in kW.
  double powerInKilowatts;

  /// Current of the suggested connector in Amperes.
  double? currentInAmperes;

  /// Voltage of the suggested connector in Volts.
  double? voltageInVolts;

  /// Supply type of the suggested connector.
  ChargingSupplyType? supplyType;

  /// Suggested connector for charging at this station.
  ChargingConnectorType? connectorType;

  /// Creates a new instance.
  /// [powerInKilowatts] Power supplied by the suggested connector in kW.
  /// [currentInAmperes] Current of the suggested connector in Amperes.
  /// [voltageInVolts] Voltage of the suggested connector in Volts.
  /// [supplyType] Supply type of the suggested connector.
  /// [connectorType] Suggested connector for charging at this station.
  ChargingConnectorAttributes(this.powerInKilowatts, this.currentInAmperes, this.voltageInVolts, this.supplyType, this.connectorType);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChargingConnectorAttributes) return false;
    ChargingConnectorAttributes _other = other;
    return powerInKilowatts == _other.powerInKilowatts &&
        currentInAmperes == _other.currentInAmperes &&
        voltageInVolts == _other.voltageInVolts &&
        supplyType == _other.supplyType &&
        connectorType == _other.connectorType;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + powerInKilowatts.hashCode;
    result = 31 * result + currentInAmperes.hashCode;
    result = 31 * result + voltageInVolts.hashCode;
    result = 31 * result + supplyType.hashCode;
    result = 31 * result + connectorType.hashCode;
    return result;
  }
}


// ChargingConnectorAttributes "private" section, not exported.

final _sdkRoutingChargingconnectorattributesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(double, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_create_handle'));
final _sdkRoutingChargingconnectorattributesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_release_handle'));
final _sdkRoutingChargingconnectorattributesGetFieldpowerInKilowatts = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_get_field_powerInKilowatts'));
final _sdkRoutingChargingconnectorattributesGetFieldcurrentInAmperes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_get_field_currentInAmperes'));
final _sdkRoutingChargingconnectorattributesGetFieldvoltageInVolts = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_get_field_voltageInVolts'));
final _sdkRoutingChargingconnectorattributesGetFieldsupplyType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_get_field_supplyType'));
final _sdkRoutingChargingconnectorattributesGetFieldconnectorType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_get_field_connectorType'));



Pointer<Void> sdkRoutingChargingconnectorattributesToFfi(ChargingConnectorAttributes value) {
  final _powerInKilowattsHandle = (value.powerInKilowatts);
  final _currentInAmperesHandle = doubleToFfiNullable(value.currentInAmperes);
  final _voltageInVoltsHandle = doubleToFfiNullable(value.voltageInVolts);
  final _supplyTypeHandle = sdkRoutingChargingsupplytypeToFfiNullable(value.supplyType);
  final _connectorTypeHandle = sdkRoutingChargingconnectortypeToFfiNullable(value.connectorType);
  final _result = _sdkRoutingChargingconnectorattributesCreateHandle(_powerInKilowattsHandle, _currentInAmperesHandle, _voltageInVoltsHandle, _supplyTypeHandle, _connectorTypeHandle);
  
  doubleReleaseFfiHandleNullable(_currentInAmperesHandle);
  doubleReleaseFfiHandleNullable(_voltageInVoltsHandle);
  sdkRoutingChargingsupplytypeReleaseFfiHandleNullable(_supplyTypeHandle);
  sdkRoutingChargingconnectortypeReleaseFfiHandleNullable(_connectorTypeHandle);
  return _result;
}

ChargingConnectorAttributes sdkRoutingChargingconnectorattributesFromFfi(Pointer<Void> handle) {
  final _powerInKilowattsHandle = _sdkRoutingChargingconnectorattributesGetFieldpowerInKilowatts(handle);
  final _currentInAmperesHandle = _sdkRoutingChargingconnectorattributesGetFieldcurrentInAmperes(handle);
  final _voltageInVoltsHandle = _sdkRoutingChargingconnectorattributesGetFieldvoltageInVolts(handle);
  final _supplyTypeHandle = _sdkRoutingChargingconnectorattributesGetFieldsupplyType(handle);
  final _connectorTypeHandle = _sdkRoutingChargingconnectorattributesGetFieldconnectorType(handle);
  try {
    return ChargingConnectorAttributes(
      (_powerInKilowattsHandle), 
      doubleFromFfiNullable(_currentInAmperesHandle), 
      doubleFromFfiNullable(_voltageInVoltsHandle), 
      sdkRoutingChargingsupplytypeFromFfiNullable(_supplyTypeHandle), 
      sdkRoutingChargingconnectortypeFromFfiNullable(_connectorTypeHandle)
    );
  } finally {
    
    doubleReleaseFfiHandleNullable(_currentInAmperesHandle);
    doubleReleaseFfiHandleNullable(_voltageInVoltsHandle);
    sdkRoutingChargingsupplytypeReleaseFfiHandleNullable(_supplyTypeHandle);
    sdkRoutingChargingconnectortypeReleaseFfiHandleNullable(_connectorTypeHandle);
  }
}

void sdkRoutingChargingconnectorattributesReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingChargingconnectorattributesReleaseHandle(handle);

// Nullable ChargingConnectorAttributes

final _sdkRoutingChargingconnectorattributesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_create_handle_nullable'));
final _sdkRoutingChargingconnectorattributesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_release_handle_nullable'));
final _sdkRoutingChargingconnectorattributesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingConnectorAttributes_get_value_nullable'));

Pointer<Void> sdkRoutingChargingconnectorattributesToFfiNullable(ChargingConnectorAttributes? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingChargingconnectorattributesToFfi(value);
  final result = _sdkRoutingChargingconnectorattributesCreateHandleNullable(_handle);
  sdkRoutingChargingconnectorattributesReleaseFfiHandle(_handle);
  return result;
}

ChargingConnectorAttributes? sdkRoutingChargingconnectorattributesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingChargingconnectorattributesGetValueNullable(handle);
  final result = sdkRoutingChargingconnectorattributesFromFfi(_handle);
  sdkRoutingChargingconnectorattributesReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingChargingconnectorattributesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingChargingconnectorattributesReleaseHandleNullable(handle);

// End of ChargingConnectorAttributes "private" section.


