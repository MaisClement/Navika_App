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

/// All the options to specify how a scooter route should be calculated.

class ScooterOptions {
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

  /// Specifies whether scooter is allowed on highway or not. True means scooter is
  /// allowed to use highways and false means otherwise. By default it is set to false.
  /// Note that there is a similar parameter in [AvoidanceOptions], to
  /// disallow highway usage, see [RoadFeatures.controlledAccessHighway].
  /// As the avoidance options takes precedence, if this parameter is also used, then
  /// scooters are not allowed to use highways even if `allowHighway` is set to true.
  /// However, if no alternative route is possible, the calculated route may use highways.
  /// In such a case, a [SectionNotice] will be provided in the related [Section]
  /// to indicate that the highway usage restriction is violated on this route.
  /// A few examples:
  ///
  /// 1 - If no avoidance option is set, and `allowHighway = false`, when no route is found without
  /// highway usage, a notice is received.
  ///
  /// 2 - If no avoidance option is set, and `allowHighway = true`, when no route is found without
  /// highway usage, no notice is received.
  ///
  /// 3 - If only `avoid[features] = controlledAccessHighway` is set, when no route is found without
  /// highway usage, a notice is received.
  ///
  /// 4 - If both `avoid[features] = controlledAccessHighway` and `allowHighway = true` are set,
  /// when no route is found without highway usage, a notice is received.
  bool allowHighway;

  /// Engine size of the scooter in cubic centimeters. Shouldn't be less than 1 or greater than 65535. Default value
  /// is `null`, which means the scooter route calculation ignores all engine size limits on the road.
  ///
  /// **Note:** For now, this option is only relevant in Japan and will be ignored
  /// for other countries. Currently, map data for this option is only available
  /// for Japan.
  int? engineSizeInCubicCentimeters;

  /// Creates a new instance.

  /// [routeOptions] Specifies the common route calculation options.

  /// [textOptions] Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.

  /// [avoidanceOptions] Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.

  /// [maxSpeedOnSegments] Segments with restriction on maximum [DynamicSpeedInfo.baseSpeedInMetersPerSecond].

  /// [allowHighway] Specifies whether scooter is allowed on highway or not. True means scooter is
  /// allowed to use highways and false means otherwise. By default it is set to false.
  /// Note that there is a similar parameter in [AvoidanceOptions], to
  /// disallow highway usage, see [RoadFeatures.controlledAccessHighway].
  /// As the avoidance options takes precedence, if this parameter is also used, then
  /// scooters are not allowed to use highways even if `allowHighway` is set to true.
  /// However, if no alternative route is possible, the calculated route may use highways.
  /// In such a case, a [SectionNotice] will be provided in the related [Section]
  /// to indicate that the highway usage restriction is violated on this route.
  /// A few examples:
  ///
  /// 1 - If no avoidance option is set, and `allowHighway = false`, when no route is found without
  /// highway usage, a notice is received.
  ///
  /// 2 - If no avoidance option is set, and `allowHighway = true`, when no route is found without
  /// highway usage, no notice is received.
  ///
  /// 3 - If only `avoid[features] = controlledAccessHighway` is set, when no route is found without
  /// highway usage, a notice is received.
  ///
  /// 4 - If both `avoid[features] = controlledAccessHighway` and `allowHighway = true` are set,
  /// when no route is found without highway usage, a notice is received.

  /// [engineSizeInCubicCentimeters] Engine size of the scooter in cubic centimeters. Shouldn't be less than 1 or greater than 65535. Default value
  /// is `null`, which means the scooter route calculation ignores all engine size limits on the road.
  ///
  /// **Note:** For now, this option is only relevant in Japan and will be ignored
  /// for other countries. Currently, map data for this option is only available
  /// for Japan.

  ScooterOptions._(this.routeOptions, this.textOptions, this.avoidanceOptions, this.maxSpeedOnSegments, this.allowHighway, this.engineSizeInCubicCentimeters);
  ScooterOptions()
    : routeOptions = RouteOptions.withDefaults(), textOptions = RouteTextOptions(), avoidanceOptions = AvoidanceOptions(), maxSpeedOnSegments = [], allowHighway = false, engineSizeInCubicCentimeters = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ScooterOptions) return false;
    ScooterOptions _other = other;
    return routeOptions == _other.routeOptions &&
        textOptions == _other.textOptions &&
        avoidanceOptions == _other.avoidanceOptions &&
        DeepCollectionEquality().equals(maxSpeedOnSegments, _other.maxSpeedOnSegments) &&
        allowHighway == _other.allowHighway &&
        engineSizeInCubicCentimeters == _other.engineSizeInCubicCentimeters;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + routeOptions.hashCode;
    result = 31 * result + textOptions.hashCode;
    result = 31 * result + avoidanceOptions.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(maxSpeedOnSegments);
    result = 31 * result + allowHighway.hashCode;
    result = 31 * result + engineSizeInCubicCentimeters.hashCode;
    return result;
  }
}


// ScooterOptions "private" section, not exported.

final _sdkRoutingScooteroptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint8, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_create_handle'));
final _sdkRoutingScooteroptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_release_handle'));
final _sdkRoutingScooteroptionsGetFieldrouteOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_get_field_routeOptions'));
final _sdkRoutingScooteroptionsGetFieldtextOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_get_field_textOptions'));
final _sdkRoutingScooteroptionsGetFieldavoidanceOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_get_field_avoidanceOptions'));
final _sdkRoutingScooteroptionsGetFieldmaxSpeedOnSegments = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_get_field_maxSpeedOnSegments'));
final _sdkRoutingScooteroptionsGetFieldallowHighway = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_get_field_allowHighway'));
final _sdkRoutingScooteroptionsGetFieldengineSizeInCubicCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_get_field_engineSizeInCubicCentimeters'));



Pointer<Void> sdkRoutingScooteroptionsToFfi(ScooterOptions value) {
  final _routeOptionsHandle = sdkRoutingRouteoptionsToFfi(value.routeOptions);
  final _textOptionsHandle = sdkRoutingRoutetextoptionsToFfi(value.textOptions);
  final _avoidanceOptionsHandle = sdkRoutingAvoidanceoptionsToFfi(value.avoidanceOptions);
  final _maxSpeedOnSegmentsHandle = heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentToFfi(value.maxSpeedOnSegments);
  final _allowHighwayHandle = booleanToFfi(value.allowHighway);
  final _engineSizeInCubicCentimetersHandle = intToFfiNullable(value.engineSizeInCubicCentimeters);
  final _result = _sdkRoutingScooteroptionsCreateHandle(_routeOptionsHandle, _textOptionsHandle, _avoidanceOptionsHandle, _maxSpeedOnSegmentsHandle, _allowHighwayHandle, _engineSizeInCubicCentimetersHandle);
  sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
  sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
  sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
  heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentReleaseFfiHandle(_maxSpeedOnSegmentsHandle);
  booleanReleaseFfiHandle(_allowHighwayHandle);
  intReleaseFfiHandleNullable(_engineSizeInCubicCentimetersHandle);
  return _result;
}

ScooterOptions sdkRoutingScooteroptionsFromFfi(Pointer<Void> handle) {
  final _routeOptionsHandle = _sdkRoutingScooteroptionsGetFieldrouteOptions(handle);
  final _textOptionsHandle = _sdkRoutingScooteroptionsGetFieldtextOptions(handle);
  final _avoidanceOptionsHandle = _sdkRoutingScooteroptionsGetFieldavoidanceOptions(handle);
  final _maxSpeedOnSegmentsHandle = _sdkRoutingScooteroptionsGetFieldmaxSpeedOnSegments(handle);
  final _allowHighwayHandle = _sdkRoutingScooteroptionsGetFieldallowHighway(handle);
  final _engineSizeInCubicCentimetersHandle = _sdkRoutingScooteroptionsGetFieldengineSizeInCubicCentimeters(handle);
  try {
    return ScooterOptions._(
      sdkRoutingRouteoptionsFromFfi(_routeOptionsHandle), 
      sdkRoutingRoutetextoptionsFromFfi(_textOptionsHandle), 
      sdkRoutingAvoidanceoptionsFromFfi(_avoidanceOptionsHandle), 
      heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentFromFfi(_maxSpeedOnSegmentsHandle), 
      booleanFromFfi(_allowHighwayHandle), 
      intFromFfiNullable(_engineSizeInCubicCentimetersHandle)
    );
  } finally {
    sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
    sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
    sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentReleaseFfiHandle(_maxSpeedOnSegmentsHandle);
    booleanReleaseFfiHandle(_allowHighwayHandle);
    intReleaseFfiHandleNullable(_engineSizeInCubicCentimetersHandle);
  }
}

void sdkRoutingScooteroptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingScooteroptionsReleaseHandle(handle);

// Nullable ScooterOptions

final _sdkRoutingScooteroptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_create_handle_nullable'));
final _sdkRoutingScooteroptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_release_handle_nullable'));
final _sdkRoutingScooteroptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_get_value_nullable'));

Pointer<Void> sdkRoutingScooteroptionsToFfiNullable(ScooterOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingScooteroptionsToFfi(value);
  final result = _sdkRoutingScooteroptionsCreateHandleNullable(_handle);
  sdkRoutingScooteroptionsReleaseFfiHandle(_handle);
  return result;
}

ScooterOptions? sdkRoutingScooteroptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingScooteroptionsGetValueNullable(handle);
  final result = sdkRoutingScooteroptionsFromFfi(_handle);
  sdkRoutingScooteroptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingScooteroptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingScooteroptionsReleaseHandleNullable(handle);

// End of ScooterOptions "private" section.


