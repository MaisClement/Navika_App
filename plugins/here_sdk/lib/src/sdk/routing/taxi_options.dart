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
import 'package:here_sdk/src/sdk/routing/avoidance_options.dart';
import 'package:here_sdk/src/sdk/routing/max_speed_on_segment.dart';
import 'package:here_sdk/src/sdk/routing/route_options.dart';
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';

/// All the options to specify how a taxi route should be calculated.
///
/// See, [TransportMode.taxi].
///
/// **Note:** Specify the optional [Waypoint.sideOfStreetHint] to indicate at which side of
/// the street a passenger wants to leave the taxi.
///
/// **Note:** This is a beta release of this transport mode, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases or even become unsupported, without a
/// deprecation process.

class TaxiOptions {
  /// Specifies the common route calculation options.
  RouteOptions routeOptions;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  RouteTextOptions textOptions;

  /// Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.
  AvoidanceOptions avoidanceOptions;

  /// Segments with restriction on maximum [DynamicSpeedInfo.baseSpeedInMetersPerSecond].
  List<MaxSpeedOnSegment> maxSpeedOnSegments;

  /// Specifies if a vehicle is allowed to drive through the taxi-only roads and lanes.
  /// When set to `false`, it is still allowed on taxi roads after the route start and
  /// before the route destination.
  ///
  /// **Note:** This is a beta option, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases or even become unsupported, without a
  /// deprecation process.
  bool allowDriveThroughTaxiRoads;

  /// Creates a new instance.

  /// [routeOptions] Specifies the common route calculation options.

  /// [textOptions] Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.

  /// [avoidanceOptions] Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.

  /// [maxSpeedOnSegments] Segments with restriction on maximum [DynamicSpeedInfo.baseSpeedInMetersPerSecond].

  /// [allowDriveThroughTaxiRoads] Specifies if a vehicle is allowed to drive through the taxi-only roads and lanes.
  /// When set to `false`, it is still allowed on taxi roads after the route start and
  /// before the route destination.
  ///
  /// **Note:** This is a beta option, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases or even become unsupported, without a
  /// deprecation process.

  TaxiOptions._(this.routeOptions, this.textOptions, this.avoidanceOptions, this.maxSpeedOnSegments, this.allowDriveThroughTaxiRoads);
  /// Creates a new instance.
  TaxiOptions.withDefaults()
      : routeOptions = RouteOptions.withDefaults(), textOptions = RouteTextOptions(), avoidanceOptions = AvoidanceOptions(), maxSpeedOnSegments = [], allowDriveThroughTaxiRoads = true;
  /// Creates a new instance.
  /// [routeOptions] Specifies the common route calculation options.
  /// [textOptions] Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  /// [avoidanceOptions] Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.
  TaxiOptions(this.routeOptions, this.textOptions, this.avoidanceOptions)
      : maxSpeedOnSegments = [], allowDriveThroughTaxiRoads = true;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TaxiOptions) return false;
    TaxiOptions _other = other;
    return routeOptions == _other.routeOptions &&
        textOptions == _other.textOptions &&
        avoidanceOptions == _other.avoidanceOptions &&
        DeepCollectionEquality().equals(maxSpeedOnSegments, _other.maxSpeedOnSegments) &&
        allowDriveThroughTaxiRoads == _other.allowDriveThroughTaxiRoads;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + routeOptions.hashCode;
    result = 31 * result + textOptions.hashCode;
    result = 31 * result + avoidanceOptions.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(maxSpeedOnSegments);
    result = 31 * result + allowDriveThroughTaxiRoads.hashCode;
    return result;
  }
}


// TaxiOptions "private" section, not exported.

final _sdkRoutingTaxioptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint8),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_routing_TaxiOptions_create_handle'));
final _sdkRoutingTaxioptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TaxiOptions_release_handle'));
final _sdkRoutingTaxioptionsGetFieldrouteOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TaxiOptions_get_field_routeOptions'));
final _sdkRoutingTaxioptionsGetFieldtextOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TaxiOptions_get_field_textOptions'));
final _sdkRoutingTaxioptionsGetFieldavoidanceOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TaxiOptions_get_field_avoidanceOptions'));
final _sdkRoutingTaxioptionsGetFieldmaxSpeedOnSegments = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TaxiOptions_get_field_maxSpeedOnSegments'));
final _sdkRoutingTaxioptionsGetFieldallowDriveThroughTaxiRoads = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TaxiOptions_get_field_allowDriveThroughTaxiRoads'));



Pointer<Void> sdkRoutingTaxioptionsToFfi(TaxiOptions value) {
  final _routeOptionsHandle = sdkRoutingRouteoptionsToFfi(value.routeOptions);
  final _textOptionsHandle = sdkRoutingRoutetextoptionsToFfi(value.textOptions);
  final _avoidanceOptionsHandle = sdkRoutingAvoidanceoptionsToFfi(value.avoidanceOptions);
  final _maxSpeedOnSegmentsHandle = heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentToFfi(value.maxSpeedOnSegments);
  final _allowDriveThroughTaxiRoadsHandle = booleanToFfi(value.allowDriveThroughTaxiRoads);
  final _result = _sdkRoutingTaxioptionsCreateHandle(_routeOptionsHandle, _textOptionsHandle, _avoidanceOptionsHandle, _maxSpeedOnSegmentsHandle, _allowDriveThroughTaxiRoadsHandle);
  sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
  sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
  sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
  heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentReleaseFfiHandle(_maxSpeedOnSegmentsHandle);
  booleanReleaseFfiHandle(_allowDriveThroughTaxiRoadsHandle);
  return _result;
}

TaxiOptions sdkRoutingTaxioptionsFromFfi(Pointer<Void> handle) {
  final _routeOptionsHandle = _sdkRoutingTaxioptionsGetFieldrouteOptions(handle);
  final _textOptionsHandle = _sdkRoutingTaxioptionsGetFieldtextOptions(handle);
  final _avoidanceOptionsHandle = _sdkRoutingTaxioptionsGetFieldavoidanceOptions(handle);
  final _maxSpeedOnSegmentsHandle = _sdkRoutingTaxioptionsGetFieldmaxSpeedOnSegments(handle);
  final _allowDriveThroughTaxiRoadsHandle = _sdkRoutingTaxioptionsGetFieldallowDriveThroughTaxiRoads(handle);
  try {
    return TaxiOptions._(
      sdkRoutingRouteoptionsFromFfi(_routeOptionsHandle), 
      sdkRoutingRoutetextoptionsFromFfi(_textOptionsHandle), 
      sdkRoutingAvoidanceoptionsFromFfi(_avoidanceOptionsHandle), 
      heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentFromFfi(_maxSpeedOnSegmentsHandle), 
      booleanFromFfi(_allowDriveThroughTaxiRoadsHandle)
    );
  } finally {
    sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
    sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
    sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentReleaseFfiHandle(_maxSpeedOnSegmentsHandle);
    booleanReleaseFfiHandle(_allowDriveThroughTaxiRoadsHandle);
  }
}

void sdkRoutingTaxioptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingTaxioptionsReleaseHandle(handle);

// Nullable TaxiOptions

final _sdkRoutingTaxioptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TaxiOptions_create_handle_nullable'));
final _sdkRoutingTaxioptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TaxiOptions_release_handle_nullable'));
final _sdkRoutingTaxioptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TaxiOptions_get_value_nullable'));

Pointer<Void> sdkRoutingTaxioptionsToFfiNullable(TaxiOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTaxioptionsToFfi(value);
  final result = _sdkRoutingTaxioptionsCreateHandleNullable(_handle);
  sdkRoutingTaxioptionsReleaseFfiHandle(_handle);
  return result;
}

TaxiOptions? sdkRoutingTaxioptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTaxioptionsGetValueNullable(handle);
  final result = sdkRoutingTaxioptionsFromFfi(_handle);
  sdkRoutingTaxioptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTaxioptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTaxioptionsReleaseHandleNullable(handle);

// End of TaxiOptions "private" section.


