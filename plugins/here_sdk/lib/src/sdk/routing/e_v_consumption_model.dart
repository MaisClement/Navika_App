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
import 'package:here_sdk/src/generic_types__conversion.dart';

/// Parameters specific for the electric vehicle, which are then used to calculate
/// energy consumption on a given route.
///
/// At minimum, you must provide [EVConsumptionModel.ascentConsumptionInWattHoursPerMeter],
/// [EVConsumptionModel.descentRecoveryInWattHoursPerMeter] and a
/// [EVConsumptionModel.freeFlowSpeedTable].

class EVConsumptionModel {
  /// Rate of energy consumed per meter rise in elevation (in Wh/m, i.e., Watt-hours per meter).
  double ascentConsumptionInWattHoursPerMeter;

  /// Rate of energy recovered per meter fall in elevation (in Wh/m, i.e., Watt-hours per meter).
  double descentRecoveryInWattHoursPerMeter;

  /// Free flow speed table describes energy consumption when travelling at constant speed.
  /// It defines a function curve specifying consumption rate at a given free flow speed
  /// on a flat stretch of road.
  /// Map keys represent speed values that are non-negative integers in units of (km/h).
  /// Map values represent consumption values that are non-negative floating point values
  /// in units of (Wh/m).
  /// The function is linearly interpolated between each successive pair of data points:
  /// For values below the first list value, the first value is used.
  /// For values after the last list value, the last list value is used.
  /// At minimum, one key/value pair must be set. In this case the consumption value is
  /// used for all possible speed keys.
  Map<int, double> freeFlowSpeedTable;

  /// Traffic speed table describes energy consumption when travelling under heavy traffic
  /// conditions, i.e. when the vehicle is expected to often change the travel speed.
  /// It defines a function curve specifying consumption rate at a given speed under traffic
  /// conditions on a flat stretch of road.
  /// Map keys represent traffic speed values that are non-negative integers in units of (km/h).
  /// Map values represent consumption values that are non-negative floating point values
  /// in units of (Wh/m).
  /// The function is linearly interpolated between each successive pair of data points:
  /// For values below the first list value, the first value is used.
  /// For values after the last list value, the last list value is used.
  /// If only one key/value pair is set, the consumption value is
  /// used for all possible traffic speed keys.
  /// If [EVConsumptionModel.trafficSpeedTable] is empty then only
  /// [EVConsumptionModel.freeFlowSpeedTable] is used for calculating speed-related
  /// energy consumption.
  Map<int, double> trafficSpeedTable;

  /// Rate of energy (in Wh/s) consumed by the vehicle's auxiliary systems
  /// (e.g., air conditioning, lights) per second of travel.
  double auxiliaryConsumptionInWattHoursPerSecond;

  /// Creates a new instance.

  /// [ascentConsumptionInWattHoursPerMeter] Rate of energy consumed per meter rise in elevation (in Wh/m, i.e., Watt-hours per meter).

  /// [descentRecoveryInWattHoursPerMeter] Rate of energy recovered per meter fall in elevation (in Wh/m, i.e., Watt-hours per meter).

  /// [freeFlowSpeedTable] Free flow speed table describes energy consumption when travelling at constant speed.
  /// It defines a function curve specifying consumption rate at a given free flow speed
  /// on a flat stretch of road.
  /// Map keys represent speed values that are non-negative integers in units of (km/h).
  /// Map values represent consumption values that are non-negative floating point values
  /// in units of (Wh/m).
  /// The function is linearly interpolated between each successive pair of data points:
  /// For values below the first list value, the first value is used.
  /// For values after the last list value, the last list value is used.
  /// At minimum, one key/value pair must be set. In this case the consumption value is
  /// used for all possible speed keys.

  /// [trafficSpeedTable] Traffic speed table describes energy consumption when travelling under heavy traffic
  /// conditions, i.e. when the vehicle is expected to often change the travel speed.
  /// It defines a function curve specifying consumption rate at a given speed under traffic
  /// conditions on a flat stretch of road.
  /// Map keys represent traffic speed values that are non-negative integers in units of (km/h).
  /// Map values represent consumption values that are non-negative floating point values
  /// in units of (Wh/m).
  /// The function is linearly interpolated between each successive pair of data points:
  /// For values below the first list value, the first value is used.
  /// For values after the last list value, the last list value is used.
  /// If only one key/value pair is set, the consumption value is
  /// used for all possible traffic speed keys.
  /// If [EVConsumptionModel.trafficSpeedTable] is empty then only
  /// [EVConsumptionModel.freeFlowSpeedTable] is used for calculating speed-related
  /// energy consumption.

  /// [auxiliaryConsumptionInWattHoursPerSecond] Rate of energy (in Wh/s) consumed by the vehicle's auxiliary systems
  /// (e.g., air conditioning, lights) per second of travel.

  EVConsumptionModel._(this.ascentConsumptionInWattHoursPerMeter, this.descentRecoveryInWattHoursPerMeter, this.freeFlowSpeedTable, this.trafficSpeedTable, this.auxiliaryConsumptionInWattHoursPerSecond);
  EVConsumptionModel()
    : ascentConsumptionInWattHoursPerMeter = 0.0, descentRecoveryInWattHoursPerMeter = 0.0, freeFlowSpeedTable = {}, trafficSpeedTable = {}, auxiliaryConsumptionInWattHoursPerSecond = 0.0;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EVConsumptionModel) return false;
    EVConsumptionModel _other = other;
    return ascentConsumptionInWattHoursPerMeter == _other.ascentConsumptionInWattHoursPerMeter &&
        descentRecoveryInWattHoursPerMeter == _other.descentRecoveryInWattHoursPerMeter &&
        DeepCollectionEquality().equals(freeFlowSpeedTable, _other.freeFlowSpeedTable) &&
        DeepCollectionEquality().equals(trafficSpeedTable, _other.trafficSpeedTable) &&
        auxiliaryConsumptionInWattHoursPerSecond == _other.auxiliaryConsumptionInWattHoursPerSecond;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + ascentConsumptionInWattHoursPerMeter.hashCode;
    result = 31 * result + descentRecoveryInWattHoursPerMeter.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(freeFlowSpeedTable);
    result = 31 * result + DeepCollectionEquality().hash(trafficSpeedTable);
    result = 31 * result + auxiliaryConsumptionInWattHoursPerSecond.hashCode;
    return result;
  }
}


// EVConsumptionModel "private" section, not exported.

final _sdkRoutingEvconsumptionmodelCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Pointer<Void>, Pointer<Void>, Double),
    Pointer<Void> Function(double, double, Pointer<Void>, Pointer<Void>, double)
  >('here_sdk_sdk_routing_EVConsumptionModel_create_handle'));
final _sdkRoutingEvconsumptionmodelReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_release_handle'));
final _sdkRoutingEvconsumptionmodelGetFieldascentConsumptionInWattHoursPerMeter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_get_field_ascentConsumptionInWattHoursPerMeter'));
final _sdkRoutingEvconsumptionmodelGetFielddescentRecoveryInWattHoursPerMeter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_get_field_descentRecoveryInWattHoursPerMeter'));
final _sdkRoutingEvconsumptionmodelGetFieldfreeFlowSpeedTable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_get_field_freeFlowSpeedTable'));
final _sdkRoutingEvconsumptionmodelGetFieldtrafficSpeedTable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_get_field_trafficSpeedTable'));
final _sdkRoutingEvconsumptionmodelGetFieldauxiliaryConsumptionInWattHoursPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_get_field_auxiliaryConsumptionInWattHoursPerSecond'));



Pointer<Void> sdkRoutingEvconsumptionmodelToFfi(EVConsumptionModel value) {
  final _ascentConsumptionInWattHoursPerMeterHandle = (value.ascentConsumptionInWattHoursPerMeter);
  final _descentRecoveryInWattHoursPerMeterHandle = (value.descentRecoveryInWattHoursPerMeter);
  final _freeFlowSpeedTableHandle = heresdkRoutingCommonBindingsmapofIntToDoubleToFfi(value.freeFlowSpeedTable);
  final _trafficSpeedTableHandle = heresdkRoutingCommonBindingsmapofIntToDoubleToFfi(value.trafficSpeedTable);
  final _auxiliaryConsumptionInWattHoursPerSecondHandle = (value.auxiliaryConsumptionInWattHoursPerSecond);
  final _result = _sdkRoutingEvconsumptionmodelCreateHandle(_ascentConsumptionInWattHoursPerMeterHandle, _descentRecoveryInWattHoursPerMeterHandle, _freeFlowSpeedTableHandle, _trafficSpeedTableHandle, _auxiliaryConsumptionInWattHoursPerSecondHandle);
  
  
  heresdkRoutingCommonBindingsmapofIntToDoubleReleaseFfiHandle(_freeFlowSpeedTableHandle);
  heresdkRoutingCommonBindingsmapofIntToDoubleReleaseFfiHandle(_trafficSpeedTableHandle);
  
  return _result;
}

EVConsumptionModel sdkRoutingEvconsumptionmodelFromFfi(Pointer<Void> handle) {
  final _ascentConsumptionInWattHoursPerMeterHandle = _sdkRoutingEvconsumptionmodelGetFieldascentConsumptionInWattHoursPerMeter(handle);
  final _descentRecoveryInWattHoursPerMeterHandle = _sdkRoutingEvconsumptionmodelGetFielddescentRecoveryInWattHoursPerMeter(handle);
  final _freeFlowSpeedTableHandle = _sdkRoutingEvconsumptionmodelGetFieldfreeFlowSpeedTable(handle);
  final _trafficSpeedTableHandle = _sdkRoutingEvconsumptionmodelGetFieldtrafficSpeedTable(handle);
  final _auxiliaryConsumptionInWattHoursPerSecondHandle = _sdkRoutingEvconsumptionmodelGetFieldauxiliaryConsumptionInWattHoursPerSecond(handle);
  try {
    return EVConsumptionModel._(
      (_ascentConsumptionInWattHoursPerMeterHandle), 
      (_descentRecoveryInWattHoursPerMeterHandle), 
      heresdkRoutingCommonBindingsmapofIntToDoubleFromFfi(_freeFlowSpeedTableHandle), 
      heresdkRoutingCommonBindingsmapofIntToDoubleFromFfi(_trafficSpeedTableHandle), 
      (_auxiliaryConsumptionInWattHoursPerSecondHandle)
    );
  } finally {
    
    
    heresdkRoutingCommonBindingsmapofIntToDoubleReleaseFfiHandle(_freeFlowSpeedTableHandle);
    heresdkRoutingCommonBindingsmapofIntToDoubleReleaseFfiHandle(_trafficSpeedTableHandle);
    
  }
}

void sdkRoutingEvconsumptionmodelReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingEvconsumptionmodelReleaseHandle(handle);

// Nullable EVConsumptionModel

final _sdkRoutingEvconsumptionmodelCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_create_handle_nullable'));
final _sdkRoutingEvconsumptionmodelReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_release_handle_nullable'));
final _sdkRoutingEvconsumptionmodelGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVConsumptionModel_get_value_nullable'));

Pointer<Void> sdkRoutingEvconsumptionmodelToFfiNullable(EVConsumptionModel? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingEvconsumptionmodelToFfi(value);
  final result = _sdkRoutingEvconsumptionmodelCreateHandleNullable(_handle);
  sdkRoutingEvconsumptionmodelReleaseFfiHandle(_handle);
  return result;
}

EVConsumptionModel? sdkRoutingEvconsumptionmodelFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingEvconsumptionmodelGetValueNullable(handle);
  final result = sdkRoutingEvconsumptionmodelFromFfi(_handle);
  sdkRoutingEvconsumptionmodelReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingEvconsumptionmodelReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingEvconsumptionmodelReleaseHandleNullable(handle);

// End of EVConsumptionModel "private" section.


