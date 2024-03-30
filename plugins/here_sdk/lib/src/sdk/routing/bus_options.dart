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
import 'package:here_sdk/src/sdk/routing/avoidance_options.dart';
import 'package:here_sdk/src/sdk/routing/max_speed_on_segment.dart';
import 'package:here_sdk/src/sdk/routing/route_options.dart';
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';
import 'package:here_sdk/src/sdk/transport/bus_specifications.dart';

/// All the options to specify how a bus route should be calculated.

class BusOptions {
  /// Specifies the common route calculation options.
  RouteOptions routeOptions;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  RouteTextOptions textOptions;

  /// Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.
  AvoidanceOptions avoidanceOptions;

  /// Segments with restriction on maximum baseSpeed.
  List<MaxSpeedOnSegment> maxSpeedOnSegments;

  /// Detailed bus specifications such as dimensions and weight.
  ///
  /// **Note:** Some members of `bus_specifications` have limited value range.
  /// - [BusSpecifications.grossWeightInKilograms] must not be negative.
  /// - [BusSpecifications.heightInCentimeters] must be in the range \[0, 5000\].
  /// - [BusSpecifications.widthInCentimeters] must be in the range \[0, 5000\].
  /// - [BusSpecifications.lengthInCentimeters] must be in the range \[0, 30000\].
  /// - The length of [BusSpecifications.lastCharacterOfLicensePlate] must be one.
  ///   The validation of the range is done in the method that takes `BusOptions` as parameter.
  BusSpecifications busSpecifications;

  /// Creates a new instance.

  /// [routeOptions] Specifies the common route calculation options.

  /// [textOptions] Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.

  /// [avoidanceOptions] Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.

  /// [maxSpeedOnSegments] Segments with restriction on maximum baseSpeed.

  /// [busSpecifications] Detailed bus specifications such as dimensions and weight.
  ///
  /// **Note:** Some members of `bus_specifications` have limited value range.
  /// - [BusSpecifications.grossWeightInKilograms] must not be negative.
  /// - [BusSpecifications.heightInCentimeters] must be in the range \[0, 5000\].
  /// - [BusSpecifications.widthInCentimeters] must be in the range \[0, 5000\].
  /// - [BusSpecifications.lengthInCentimeters] must be in the range \[0, 30000\].
  /// - The length of [BusSpecifications.lastCharacterOfLicensePlate] must be one.
  ///   The validation of the range is done in the method that takes `BusOptions` as parameter.

  BusOptions._(this.routeOptions, this.textOptions, this.avoidanceOptions, this.maxSpeedOnSegments, this.busSpecifications);
  /// Creates a new instance.
  BusOptions()
      : routeOptions = RouteOptions.withDefaults(), textOptions = RouteTextOptions(), avoidanceOptions = AvoidanceOptions(), maxSpeedOnSegments = [], busSpecifications = BusSpecifications.withDefaults();
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BusOptions) return false;
    BusOptions _other = other;
    return routeOptions == _other.routeOptions &&
        textOptions == _other.textOptions &&
        avoidanceOptions == _other.avoidanceOptions &&
        DeepCollectionEquality().equals(maxSpeedOnSegments, _other.maxSpeedOnSegments) &&
        busSpecifications == _other.busSpecifications;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + routeOptions.hashCode;
    result = 31 * result + textOptions.hashCode;
    result = 31 * result + avoidanceOptions.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(maxSpeedOnSegments);
    result = 31 * result + busSpecifications.hashCode;
    return result;
  }
}


// BusOptions "private" section, not exported.

final _sdkRoutingBusoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_BusOptions_create_handle'));
final _sdkRoutingBusoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BusOptions_release_handle'));
final _sdkRoutingBusoptionsGetFieldrouteOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BusOptions_get_field_routeOptions'));
final _sdkRoutingBusoptionsGetFieldtextOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BusOptions_get_field_textOptions'));
final _sdkRoutingBusoptionsGetFieldavoidanceOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BusOptions_get_field_avoidanceOptions'));
final _sdkRoutingBusoptionsGetFieldmaxSpeedOnSegments = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BusOptions_get_field_maxSpeedOnSegments'));
final _sdkRoutingBusoptionsGetFieldbusSpecifications = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BusOptions_get_field_busSpecifications'));



Pointer<Void> sdkRoutingBusoptionsToFfi(BusOptions value) {
  final _routeOptionsHandle = sdkRoutingRouteoptionsToFfi(value.routeOptions);
  final _textOptionsHandle = sdkRoutingRoutetextoptionsToFfi(value.textOptions);
  final _avoidanceOptionsHandle = sdkRoutingAvoidanceoptionsToFfi(value.avoidanceOptions);
  final _maxSpeedOnSegmentsHandle = heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentToFfi(value.maxSpeedOnSegments);
  final _busSpecificationsHandle = sdkTransportBusspecificationsToFfi(value.busSpecifications);
  final _result = _sdkRoutingBusoptionsCreateHandle(_routeOptionsHandle, _textOptionsHandle, _avoidanceOptionsHandle, _maxSpeedOnSegmentsHandle, _busSpecificationsHandle);
  sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
  sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
  sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
  heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentReleaseFfiHandle(_maxSpeedOnSegmentsHandle);
  sdkTransportBusspecificationsReleaseFfiHandle(_busSpecificationsHandle);
  return _result;
}

BusOptions sdkRoutingBusoptionsFromFfi(Pointer<Void> handle) {
  final _routeOptionsHandle = _sdkRoutingBusoptionsGetFieldrouteOptions(handle);
  final _textOptionsHandle = _sdkRoutingBusoptionsGetFieldtextOptions(handle);
  final _avoidanceOptionsHandle = _sdkRoutingBusoptionsGetFieldavoidanceOptions(handle);
  final _maxSpeedOnSegmentsHandle = _sdkRoutingBusoptionsGetFieldmaxSpeedOnSegments(handle);
  final _busSpecificationsHandle = _sdkRoutingBusoptionsGetFieldbusSpecifications(handle);
  try {
    return BusOptions._(
      sdkRoutingRouteoptionsFromFfi(_routeOptionsHandle), 
      sdkRoutingRoutetextoptionsFromFfi(_textOptionsHandle), 
      sdkRoutingAvoidanceoptionsFromFfi(_avoidanceOptionsHandle), 
      heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentFromFfi(_maxSpeedOnSegmentsHandle), 
      sdkTransportBusspecificationsFromFfi(_busSpecificationsHandle)
    );
  } finally {
    sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
    sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
    sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentReleaseFfiHandle(_maxSpeedOnSegmentsHandle);
    sdkTransportBusspecificationsReleaseFfiHandle(_busSpecificationsHandle);
  }
}

void sdkRoutingBusoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingBusoptionsReleaseHandle(handle);

// Nullable BusOptions

final _sdkRoutingBusoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BusOptions_create_handle_nullable'));
final _sdkRoutingBusoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BusOptions_release_handle_nullable'));
final _sdkRoutingBusoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BusOptions_get_value_nullable'));

Pointer<Void> sdkRoutingBusoptionsToFfiNullable(BusOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingBusoptionsToFfi(value);
  final result = _sdkRoutingBusoptionsCreateHandleNullable(_handle);
  sdkRoutingBusoptionsReleaseFfiHandle(_handle);
  return result;
}

BusOptions? sdkRoutingBusoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingBusoptionsGetValueNullable(handle);
  final result = sdkRoutingBusoptionsFromFfi(_handle);
  sdkRoutingBusoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingBusoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingBusoptionsReleaseHandleNullable(handle);

// End of BusOptions "private" section.


