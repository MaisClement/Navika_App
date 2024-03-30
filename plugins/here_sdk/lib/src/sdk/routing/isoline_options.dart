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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_truck_options.dart';
import 'package:here_sdk/src/sdk/routing/isoline_calculation_mode.dart';
import 'package:here_sdk/src/sdk/routing/isoline_range_type.dart';
import 'package:here_sdk/src/sdk/routing/route_place_direction.dart';
import 'package:here_sdk/src/sdk/routing/truck_options.dart';
import 'package:meta/meta.dart';





/// Specifies options for isolines calculation.

class IsolineOptions {
  /// Specifies isoline parameters.
  IsolineOptionsCalculation calculationOptions;

  /// Specifies options for calculation of isolines for car.
  /// Mutually exclusive with truck_options, ev_car_options and ev_truck_options.
  CarOptions? carOptions;

  /// Specifies options for calculation of isolines for truck.
  /// Mutually exclusive with car_options, ev_car_options and ev_truck_options.
  TruckOptions? truckOptions;

  /// Specifies options for calculation of isolines for electric car.
  /// Mutually exclusive with car_options, truck and ev_truck_options.
  EVCarOptions? evCarOptions;

  /// Specifies options for calculation of isolines for electric truck.
  /// Mutually exclusive with car_options, truck_options and ev_car_options.
  EVTruckOptions? evTruckOptions;

  IsolineOptions._(this.calculationOptions, this.carOptions, this.truckOptions, this.evCarOptions, this.evTruckOptions);
  /// Constructs options to calculate isolines from destination or origin,
  /// with preferences for isoline calculation and car routing options.
  ///
  /// [calculationOptions] The options to be used to calculate this isoline.
  ///
  /// [carOptions] The options that should influence the possible routes within the isoline.
  /// This determines also the transportation type.
  ///
  factory IsolineOptions.withCarOptions(IsolineOptionsCalculation calculationOptions, CarOptions carOptions) => $prototype.withCarOptions(calculationOptions, carOptions);
  /// Constructs options to calculate isolines from destination or origin,
  /// with preferences for isoline calculation and truck routing options.
  ///
  /// [calculationOptions] The options to be used to calculate this isoline.
  ///
  /// [truckOptions] The options that should influence the possible routes within the isoline.
  /// This determines also the transportation type.
  ///
  factory IsolineOptions.withTruckOptions(IsolineOptionsCalculation calculationOptions, TruckOptions truckOptions) => $prototype.withTruckOptions(calculationOptions, truckOptions);
  /// Constructs options to calculate isolines from destination or origin,
  /// with preferences for isoline calculation and electric car routing options.
  ///
  /// [calculationOptions] The options to be used to calculate this isoline.
  ///
  /// [evCarOptions] The options that should influence the possible routes within the isoline.
  /// This determines also the transportation type.
  ///
  factory IsolineOptions.withEVCarOptions(IsolineOptionsCalculation calculationOptions, EVCarOptions evCarOptions) => $prototype.withEVCarOptions(calculationOptions, evCarOptions);
  /// Constructs options to calculate isolines from destination or origin,
  /// with preferences for isoline calculation and electric truck routing options.
  ///
  /// [calculationOptions] The options to be used to calculate this isoline.
  ///
  /// [evTruckOptions] The options that should influence the possible routes within the isoline.
  /// This determines also the transportation type.
  ///
  factory IsolineOptions.withEVTruckOptions(IsolineOptionsCalculation calculationOptions, EVTruckOptions evTruckOptions) => $prototype.withEVTruckOptions(calculationOptions, evTruckOptions);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = IsolineOptions$Impl();
}





/// Specifies isoline parameters.
///
/// Setting at least one limit to [IsolineOptionsCalculation.rangeValues] is mandatory or the calculation will fail.

class IsolineOptionsCalculation {
  /// Specifies the range of values to be included in the isoline.
  IsolineRangeType rangeType;

  /// A list of ranges. The unit is defined by the type parameter.
  /// Each range defines the maximum allowed value to reach a destination.
  /// For each value an [Isoline] is calculated indicating the reachable area.
  /// If empty, [IsolineOptions] object is considered invalid.
  List<int> rangeValues;

  /// Specifies how isoline calculation is optimized.
  /// The default waypoint type is [IsolineCalculationMode.balanced].
  IsolineCalculationMode isolineCalculationMode;

  /// Limits the number of points in the resulting isoline polygon. If the
  /// isoline consists of multiple polygons, the sum of points from all
  /// polygons is considered. Note that this parameter does not affect the calculation,
  /// but the shape of the polygon. Look at [IsolineCalculationMode] parameter
  /// to optimize performance.
  /// A higher value will result in a more accurate polygon shape. Rendering a polygon
  /// with a high number of points can negatively impact rendering performance.
  /// The minimum allowed value is 30, lower values will be ignored.
  int? maxPoints;

  /// Specifies if calculations will be from or to a specific point.
  /// The default isoline direction is [RoutePlaceDirection.departure].
  RoutePlaceDirection isolineDirection;

  /// Creates a new instance.

  /// [rangeType] Specifies the range of values to be included in the isoline.

  /// [rangeValues] A list of ranges. The unit is defined by the type parameter.
  /// Each range defines the maximum allowed value to reach a destination.
  /// For each value an [Isoline] is calculated indicating the reachable area.
  /// If empty, [IsolineOptions] object is considered invalid.

  /// [isolineCalculationMode] Specifies how isoline calculation is optimized.
  /// The default waypoint type is [IsolineCalculationMode.balanced].

  /// [maxPoints] Limits the number of points in the resulting isoline polygon. If the
  /// isoline consists of multiple polygons, the sum of points from all
  /// polygons is considered. Note that this parameter does not affect the calculation,
  /// but the shape of the polygon. Look at [IsolineCalculationMode] parameter
  /// to optimize performance.
  /// A higher value will result in a more accurate polygon shape. Rendering a polygon
  /// with a high number of points can negatively impact rendering performance.
  /// The minimum allowed value is 30, lower values will be ignored.

  /// [isolineDirection] Specifies if calculations will be from or to a specific point.
  /// The default isoline direction is [RoutePlaceDirection.departure].

  IsolineOptionsCalculation._(this.rangeType, this.rangeValues, this.isolineCalculationMode, this.maxPoints, this.isolineDirection);

  /// [rangeType] The range type.
  ///
  /// [rangeValues] Range values.
  ///
  factory IsolineOptionsCalculation.withDefaults(IsolineRangeType rangeType, List<int> rangeValues) => $prototype.withDefaults(rangeType, rangeValues);

  /// [rangeType] The range type.
  ///
  /// [rangeValues] Range values.
  ///
  /// [isolineDirection] The isoline direction.
  ///
  factory IsolineOptionsCalculation.withDefaultsAndDirection(IsolineRangeType rangeType, List<int> rangeValues, RoutePlaceDirection isolineDirection) => $prototype.withDefaultsAndDirection(rangeType, rangeValues, isolineDirection);

  /// [rangeType] The range type.
  ///
  /// [rangeValues] Range values.
  ///
  /// [isolineCalculationMode] The isoline calculation mode.
  ///
  factory IsolineOptionsCalculation.withDefaultsAndCalculationMode(IsolineRangeType rangeType, List<int> rangeValues, IsolineCalculationMode isolineCalculationMode) => $prototype.withDefaultsAndCalculationMode(rangeType, rangeValues, isolineCalculationMode);

  /// [rangeType] The range type.
  ///
  /// [rangeValues] Range values.
  ///
  /// [isolineCalculationMode] The isoline calculation mode.
  ///
  /// [maxPoints] The max points number.
  ///
  /// [isolineDirection] The isoline direction.
  ///
  factory IsolineOptionsCalculation.withNoDefaults(IsolineRangeType rangeType, List<int> rangeValues, IsolineCalculationMode isolineCalculationMode, int? maxPoints, RoutePlaceDirection isolineDirection) => $prototype.withNoDefaults(rangeType, rangeValues, isolineCalculationMode, maxPoints, isolineDirection);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = IsolineOptionsCalculation$Impl();
}


// IsolineOptionsCalculation "private" section, not exported.

final _sdkRoutingIsolineoptionsCalculationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>, Uint32, Pointer<Void>, Uint32),
    Pointer<Void> Function(int, Pointer<Void>, int, Pointer<Void>, int)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_create_handle'));
final _sdkRoutingIsolineoptionsCalculationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_release_handle'));
final _sdkRoutingIsolineoptionsCalculationGetFieldrangeType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_get_field_rangeType'));
final _sdkRoutingIsolineoptionsCalculationGetFieldrangeValues = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_get_field_rangeValues'));
final _sdkRoutingIsolineoptionsCalculationGetFieldisolineCalculationMode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_get_field_isolineCalculationMode'));
final _sdkRoutingIsolineoptionsCalculationGetFieldmaxPoints = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_get_field_maxPoints'));
final _sdkRoutingIsolineoptionsCalculationGetFieldisolineDirection = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_get_field_isolineDirection'));



/// @nodoc
@visibleForTesting
class IsolineOptionsCalculation$Impl {
  IsolineOptionsCalculation withDefaults(IsolineRangeType rangeType, List<int> rangeValues) {
    final _withDefaultsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Pointer<Void>), Pointer<Void> Function(int, int, Pointer<Void>)>('here_sdk_sdk_routing_IsolineOptions_Calculation_make__IsolineRangeType_ListOf_Int'));
    final _rangeTypeHandle = sdkRoutingIsolinerangetypeToFfi(rangeType);
    final _rangeValuesHandle = heresdkRoutingIsolineBindingslistofIntToFfi(rangeValues);
    final __resultHandle = _withDefaultsFfi(__lib.LibraryContext.isolateId, _rangeTypeHandle, _rangeValuesHandle);
    sdkRoutingIsolinerangetypeReleaseFfiHandle(_rangeTypeHandle);
    heresdkRoutingIsolineBindingslistofIntReleaseFfiHandle(_rangeValuesHandle);
    try {
      return sdkRoutingIsolineoptionsCalculationFromFfi(__resultHandle);
    } finally {
      sdkRoutingIsolineoptionsCalculationReleaseFfiHandle(__resultHandle);

    }

  }

  IsolineOptionsCalculation withDefaultsAndDirection(IsolineRangeType rangeType, List<int> rangeValues, RoutePlaceDirection isolineDirection) {
    final _withDefaultsAndDirectionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Pointer<Void>, Uint32), Pointer<Void> Function(int, int, Pointer<Void>, int)>('here_sdk_sdk_routing_IsolineOptions_Calculation_make__IsolineRangeType_ListOf_Int_RoutePlaceDirection'));
    final _rangeTypeHandle = sdkRoutingIsolinerangetypeToFfi(rangeType);
    final _rangeValuesHandle = heresdkRoutingIsolineBindingslistofIntToFfi(rangeValues);
    final _isolineDirectionHandle = sdkRoutingRouteplacedirectionToFfi(isolineDirection);
    final __resultHandle = _withDefaultsAndDirectionFfi(__lib.LibraryContext.isolateId, _rangeTypeHandle, _rangeValuesHandle, _isolineDirectionHandle);
    sdkRoutingIsolinerangetypeReleaseFfiHandle(_rangeTypeHandle);
    heresdkRoutingIsolineBindingslistofIntReleaseFfiHandle(_rangeValuesHandle);
    sdkRoutingRouteplacedirectionReleaseFfiHandle(_isolineDirectionHandle);
    try {
      return sdkRoutingIsolineoptionsCalculationFromFfi(__resultHandle);
    } finally {
      sdkRoutingIsolineoptionsCalculationReleaseFfiHandle(__resultHandle);

    }

  }

  IsolineOptionsCalculation withDefaultsAndCalculationMode(IsolineRangeType rangeType, List<int> rangeValues, IsolineCalculationMode isolineCalculationMode) {
    final _withDefaultsAndCalculationModeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Pointer<Void>, Uint32), Pointer<Void> Function(int, int, Pointer<Void>, int)>('here_sdk_sdk_routing_IsolineOptions_Calculation_make__IsolineRangeType_ListOf_Int_IsolineCalculationMode'));
    final _rangeTypeHandle = sdkRoutingIsolinerangetypeToFfi(rangeType);
    final _rangeValuesHandle = heresdkRoutingIsolineBindingslistofIntToFfi(rangeValues);
    final _isolineCalculationModeHandle = sdkRoutingIsolinecalculationmodeToFfi(isolineCalculationMode);
    final __resultHandle = _withDefaultsAndCalculationModeFfi(__lib.LibraryContext.isolateId, _rangeTypeHandle, _rangeValuesHandle, _isolineCalculationModeHandle);
    sdkRoutingIsolinerangetypeReleaseFfiHandle(_rangeTypeHandle);
    heresdkRoutingIsolineBindingslistofIntReleaseFfiHandle(_rangeValuesHandle);
    sdkRoutingIsolinecalculationmodeReleaseFfiHandle(_isolineCalculationModeHandle);
    try {
      return sdkRoutingIsolineoptionsCalculationFromFfi(__resultHandle);
    } finally {
      sdkRoutingIsolineoptionsCalculationReleaseFfiHandle(__resultHandle);

    }

  }

  IsolineOptionsCalculation withNoDefaults(IsolineRangeType rangeType, List<int> rangeValues, IsolineCalculationMode isolineCalculationMode, int? maxPoints, RoutePlaceDirection isolineDirection) {
    final _withNoDefaultsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Pointer<Void>, Uint32, Pointer<Void>, Uint32), Pointer<Void> Function(int, int, Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_routing_IsolineOptions_Calculation_make__IsolineRangeType_ListOf_Int_IsolineCalculationMode_Int__RoutePlaceDirection'));
    final _rangeTypeHandle = sdkRoutingIsolinerangetypeToFfi(rangeType);
    final _rangeValuesHandle = heresdkRoutingIsolineBindingslistofIntToFfi(rangeValues);
    final _isolineCalculationModeHandle = sdkRoutingIsolinecalculationmodeToFfi(isolineCalculationMode);
    final _maxPointsHandle = intToFfiNullable(maxPoints);
    final _isolineDirectionHandle = sdkRoutingRouteplacedirectionToFfi(isolineDirection);
    final __resultHandle = _withNoDefaultsFfi(__lib.LibraryContext.isolateId, _rangeTypeHandle, _rangeValuesHandle, _isolineCalculationModeHandle, _maxPointsHandle, _isolineDirectionHandle);
    sdkRoutingIsolinerangetypeReleaseFfiHandle(_rangeTypeHandle);
    heresdkRoutingIsolineBindingslistofIntReleaseFfiHandle(_rangeValuesHandle);
    sdkRoutingIsolinecalculationmodeReleaseFfiHandle(_isolineCalculationModeHandle);
    intReleaseFfiHandleNullable(_maxPointsHandle);
    sdkRoutingRouteplacedirectionReleaseFfiHandle(_isolineDirectionHandle);
    try {
      return sdkRoutingIsolineoptionsCalculationFromFfi(__resultHandle);
    } finally {
      sdkRoutingIsolineoptionsCalculationReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkRoutingIsolineoptionsCalculationToFfi(IsolineOptionsCalculation value) {
  final _rangeTypeHandle = sdkRoutingIsolinerangetypeToFfi(value.rangeType);
  final _rangeValuesHandle = heresdkRoutingIsolineBindingslistofIntToFfi(value.rangeValues);
  final _isolineCalculationModeHandle = sdkRoutingIsolinecalculationmodeToFfi(value.isolineCalculationMode);
  final _maxPointsHandle = intToFfiNullable(value.maxPoints);
  final _isolineDirectionHandle = sdkRoutingRouteplacedirectionToFfi(value.isolineDirection);
  final _result = _sdkRoutingIsolineoptionsCalculationCreateHandle(_rangeTypeHandle, _rangeValuesHandle, _isolineCalculationModeHandle, _maxPointsHandle, _isolineDirectionHandle);
  sdkRoutingIsolinerangetypeReleaseFfiHandle(_rangeTypeHandle);
  heresdkRoutingIsolineBindingslistofIntReleaseFfiHandle(_rangeValuesHandle);
  sdkRoutingIsolinecalculationmodeReleaseFfiHandle(_isolineCalculationModeHandle);
  intReleaseFfiHandleNullable(_maxPointsHandle);
  sdkRoutingRouteplacedirectionReleaseFfiHandle(_isolineDirectionHandle);
  return _result;
}

IsolineOptionsCalculation sdkRoutingIsolineoptionsCalculationFromFfi(Pointer<Void> handle) {
  final _rangeTypeHandle = _sdkRoutingIsolineoptionsCalculationGetFieldrangeType(handle);
  final _rangeValuesHandle = _sdkRoutingIsolineoptionsCalculationGetFieldrangeValues(handle);
  final _isolineCalculationModeHandle = _sdkRoutingIsolineoptionsCalculationGetFieldisolineCalculationMode(handle);
  final _maxPointsHandle = _sdkRoutingIsolineoptionsCalculationGetFieldmaxPoints(handle);
  final _isolineDirectionHandle = _sdkRoutingIsolineoptionsCalculationGetFieldisolineDirection(handle);
  try {
    return IsolineOptionsCalculation._(
      sdkRoutingIsolinerangetypeFromFfi(_rangeTypeHandle), 
      heresdkRoutingIsolineBindingslistofIntFromFfi(_rangeValuesHandle), 
      sdkRoutingIsolinecalculationmodeFromFfi(_isolineCalculationModeHandle), 
      intFromFfiNullable(_maxPointsHandle), 
      sdkRoutingRouteplacedirectionFromFfi(_isolineDirectionHandle)
    );
  } finally {
    sdkRoutingIsolinerangetypeReleaseFfiHandle(_rangeTypeHandle);
    heresdkRoutingIsolineBindingslistofIntReleaseFfiHandle(_rangeValuesHandle);
    sdkRoutingIsolinecalculationmodeReleaseFfiHandle(_isolineCalculationModeHandle);
    intReleaseFfiHandleNullable(_maxPointsHandle);
    sdkRoutingRouteplacedirectionReleaseFfiHandle(_isolineDirectionHandle);
  }
}

void sdkRoutingIsolineoptionsCalculationReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingIsolineoptionsCalculationReleaseHandle(handle);

// Nullable IsolineOptionsCalculation

final _sdkRoutingIsolineoptionsCalculationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_create_handle_nullable'));
final _sdkRoutingIsolineoptionsCalculationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_release_handle_nullable'));
final _sdkRoutingIsolineoptionsCalculationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_Calculation_get_value_nullable'));

Pointer<Void> sdkRoutingIsolineoptionsCalculationToFfiNullable(IsolineOptionsCalculation? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingIsolineoptionsCalculationToFfi(value);
  final result = _sdkRoutingIsolineoptionsCalculationCreateHandleNullable(_handle);
  sdkRoutingIsolineoptionsCalculationReleaseFfiHandle(_handle);
  return result;
}

IsolineOptionsCalculation? sdkRoutingIsolineoptionsCalculationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingIsolineoptionsCalculationGetValueNullable(handle);
  final result = sdkRoutingIsolineoptionsCalculationFromFfi(_handle);
  sdkRoutingIsolineoptionsCalculationReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingIsolineoptionsCalculationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingIsolineoptionsCalculationReleaseHandleNullable(handle);

// End of IsolineOptionsCalculation "private" section.

// IsolineOptions "private" section, not exported.

final _sdkRoutingIsolineoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_create_handle'));
final _sdkRoutingIsolineoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_release_handle'));
final _sdkRoutingIsolineoptionsGetFieldcalculationOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_get_field_calculationOptions'));
final _sdkRoutingIsolineoptionsGetFieldcarOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_get_field_carOptions'));
final _sdkRoutingIsolineoptionsGetFieldtruckOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_get_field_truckOptions'));
final _sdkRoutingIsolineoptionsGetFieldevCarOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_get_field_evCarOptions'));
final _sdkRoutingIsolineoptionsGetFieldevTruckOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_get_field_evTruckOptions'));



/// @nodoc
@visibleForTesting
class IsolineOptions$Impl {
  IsolineOptions withCarOptions(IsolineOptionsCalculation calculationOptions, CarOptions carOptions) {
    final _withCarOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_IsolineOptions_make__Calculation_CarOptions'));
    final _calculationOptionsHandle = sdkRoutingIsolineoptionsCalculationToFfi(calculationOptions);
    final _carOptionsHandle = sdkRoutingCaroptionsToFfi(carOptions);
    final __resultHandle = _withCarOptionsFfi(__lib.LibraryContext.isolateId, _calculationOptionsHandle, _carOptionsHandle);
    sdkRoutingIsolineoptionsCalculationReleaseFfiHandle(_calculationOptionsHandle);
    sdkRoutingCaroptionsReleaseFfiHandle(_carOptionsHandle);
    try {
      return sdkRoutingIsolineoptionsFromFfi(__resultHandle);
    } finally {
      sdkRoutingIsolineoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  IsolineOptions withTruckOptions(IsolineOptionsCalculation calculationOptions, TruckOptions truckOptions) {
    final _withTruckOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_IsolineOptions_make__Calculation_TruckOptions'));
    final _calculationOptionsHandle = sdkRoutingIsolineoptionsCalculationToFfi(calculationOptions);
    final _truckOptionsHandle = sdkRoutingTruckoptionsToFfi(truckOptions);
    final __resultHandle = _withTruckOptionsFfi(__lib.LibraryContext.isolateId, _calculationOptionsHandle, _truckOptionsHandle);
    sdkRoutingIsolineoptionsCalculationReleaseFfiHandle(_calculationOptionsHandle);
    sdkRoutingTruckoptionsReleaseFfiHandle(_truckOptionsHandle);
    try {
      return sdkRoutingIsolineoptionsFromFfi(__resultHandle);
    } finally {
      sdkRoutingIsolineoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  IsolineOptions withEVCarOptions(IsolineOptionsCalculation calculationOptions, EVCarOptions evCarOptions) {
    final _withEVCarOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_IsolineOptions_make__Calculation_EVCarOptions'));
    final _calculationOptionsHandle = sdkRoutingIsolineoptionsCalculationToFfi(calculationOptions);
    final _evCarOptionsHandle = sdkRoutingEvcaroptionsToFfi(evCarOptions);
    final __resultHandle = _withEVCarOptionsFfi(__lib.LibraryContext.isolateId, _calculationOptionsHandle, _evCarOptionsHandle);
    sdkRoutingIsolineoptionsCalculationReleaseFfiHandle(_calculationOptionsHandle);
    sdkRoutingEvcaroptionsReleaseFfiHandle(_evCarOptionsHandle);
    try {
      return sdkRoutingIsolineoptionsFromFfi(__resultHandle);
    } finally {
      sdkRoutingIsolineoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  IsolineOptions withEVTruckOptions(IsolineOptionsCalculation calculationOptions, EVTruckOptions evTruckOptions) {
    final _withEVTruckOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_IsolineOptions_make__Calculation_EVTruckOptions'));
    final _calculationOptionsHandle = sdkRoutingIsolineoptionsCalculationToFfi(calculationOptions);
    final _evTruckOptionsHandle = sdkRoutingEvtruckoptionsToFfi(evTruckOptions);
    final __resultHandle = _withEVTruckOptionsFfi(__lib.LibraryContext.isolateId, _calculationOptionsHandle, _evTruckOptionsHandle);
    sdkRoutingIsolineoptionsCalculationReleaseFfiHandle(_calculationOptionsHandle);
    sdkRoutingEvtruckoptionsReleaseFfiHandle(_evTruckOptionsHandle);
    try {
      return sdkRoutingIsolineoptionsFromFfi(__resultHandle);
    } finally {
      sdkRoutingIsolineoptionsReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkRoutingIsolineoptionsToFfi(IsolineOptions value) {
  final _calculationOptionsHandle = sdkRoutingIsolineoptionsCalculationToFfi(value.calculationOptions);
  final _carOptionsHandle = sdkRoutingCaroptionsToFfiNullable(value.carOptions);
  final _truckOptionsHandle = sdkRoutingTruckoptionsToFfiNullable(value.truckOptions);
  final _evCarOptionsHandle = sdkRoutingEvcaroptionsToFfiNullable(value.evCarOptions);
  final _evTruckOptionsHandle = sdkRoutingEvtruckoptionsToFfiNullable(value.evTruckOptions);
  final _result = _sdkRoutingIsolineoptionsCreateHandle(_calculationOptionsHandle, _carOptionsHandle, _truckOptionsHandle, _evCarOptionsHandle, _evTruckOptionsHandle);
  sdkRoutingIsolineoptionsCalculationReleaseFfiHandle(_calculationOptionsHandle);
  sdkRoutingCaroptionsReleaseFfiHandleNullable(_carOptionsHandle);
  sdkRoutingTruckoptionsReleaseFfiHandleNullable(_truckOptionsHandle);
  sdkRoutingEvcaroptionsReleaseFfiHandleNullable(_evCarOptionsHandle);
  sdkRoutingEvtruckoptionsReleaseFfiHandleNullable(_evTruckOptionsHandle);
  return _result;
}

IsolineOptions sdkRoutingIsolineoptionsFromFfi(Pointer<Void> handle) {
  final _calculationOptionsHandle = _sdkRoutingIsolineoptionsGetFieldcalculationOptions(handle);
  final _carOptionsHandle = _sdkRoutingIsolineoptionsGetFieldcarOptions(handle);
  final _truckOptionsHandle = _sdkRoutingIsolineoptionsGetFieldtruckOptions(handle);
  final _evCarOptionsHandle = _sdkRoutingIsolineoptionsGetFieldevCarOptions(handle);
  final _evTruckOptionsHandle = _sdkRoutingIsolineoptionsGetFieldevTruckOptions(handle);
  try {
    return IsolineOptions._(
      sdkRoutingIsolineoptionsCalculationFromFfi(_calculationOptionsHandle), 
      sdkRoutingCaroptionsFromFfiNullable(_carOptionsHandle), 
      sdkRoutingTruckoptionsFromFfiNullable(_truckOptionsHandle), 
      sdkRoutingEvcaroptionsFromFfiNullable(_evCarOptionsHandle), 
      sdkRoutingEvtruckoptionsFromFfiNullable(_evTruckOptionsHandle)
    );
  } finally {
    sdkRoutingIsolineoptionsCalculationReleaseFfiHandle(_calculationOptionsHandle);
    sdkRoutingCaroptionsReleaseFfiHandleNullable(_carOptionsHandle);
    sdkRoutingTruckoptionsReleaseFfiHandleNullable(_truckOptionsHandle);
    sdkRoutingEvcaroptionsReleaseFfiHandleNullable(_evCarOptionsHandle);
    sdkRoutingEvtruckoptionsReleaseFfiHandleNullable(_evTruckOptionsHandle);
  }
}

void sdkRoutingIsolineoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingIsolineoptionsReleaseHandle(handle);

// Nullable IsolineOptions

final _sdkRoutingIsolineoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_create_handle_nullable'));
final _sdkRoutingIsolineoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_release_handle_nullable'));
final _sdkRoutingIsolineoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineOptions_get_value_nullable'));

Pointer<Void> sdkRoutingIsolineoptionsToFfiNullable(IsolineOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingIsolineoptionsToFfi(value);
  final result = _sdkRoutingIsolineoptionsCreateHandleNullable(_handle);
  sdkRoutingIsolineoptionsReleaseFfiHandle(_handle);
  return result;
}

IsolineOptions? sdkRoutingIsolineoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingIsolineoptionsGetValueNullable(handle);
  final result = sdkRoutingIsolineoptionsFromFfi(_handle);
  sdkRoutingIsolineoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingIsolineoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingIsolineoptionsReleaseHandleNullable(handle);

// End of IsolineOptions "private" section.


