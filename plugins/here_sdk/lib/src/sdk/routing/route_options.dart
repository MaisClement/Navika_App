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
import 'package:here_sdk/src/sdk/routing/optimization_mode.dart';
import 'package:here_sdk/src/sdk/routing/traffic_optimization_mode.dart';

/// The options to specify how the route will be calculated.

class RouteOptions {
  /// The optimization mode to be used for route calculation. By default, it is [OptimizationMode.fastest].
  OptimizationMode optimizationMode;

  /// Maximum number of alternative routes that will be calculated, in addition
  /// to the best one. The provided value must be in the range \[0, 6\].
  /// Alternative routes can be unavailable, thus they are not guaranteed to be returned.
  /// The order of routes is from the best to the worst, as evaluated by the route calculation
  /// algorithm and according to the given input parameters.
  /// Defaults to 0, which means there are no alternatives, i.e. only the best route is returned.
  /// Must be 0 for isoline calculation.
  int alternatives;

  /// Optional time when travel is expected to start. Traffic speed and
  /// incidents shall be taken into account in the calculation of the route, per [RouteOptions.trafficOptimizationMode].
  /// If it is not specified, it is assumed to be the current time, i.e. now. Note that both departure time and [RouteOptions.arrivalTime]
  /// cannot be set set at the same time.
  DateTime? departureTime;

  /// Optional time when travel is expected to end. Traffic speed and
  /// incidents shall be taken into account in the calculation of the route, per [RouteOptions.trafficOptimizationMode].
  /// Note that both [RouteOptions.departureTime] and arrival time cannot be set set at the same time.
  DateTime? arrivalTime;

  /// Specifies the maximum speed in meters per second, which the user wishes not to exceed.
  /// The valid range is \[1, 70\] meters per second. Note that it is valid only for [TransportMode.car],
  /// [TransportMode.truck] and [TransportMode.scooter] transport modes.
  /// For car, truck and scooter transport modes, it will affect [Route.duration] of
  /// the route. Only for scooter transport mode, it may affect the route geometry. Defaults to `null`,
  /// which means that no speed cap is set.
  double? speedCapInMetersPerSecond;

  /// A flag that indicates whether the resulting route should contain a [RouteHandle].
  /// Defaults to false.
  bool enableRouteHandle;

  /// A flag that indicates whether traffic information should be considered during route calculation.
  /// When it is enabled, the shape of the route will be adjusted according to the traffic situation that
  /// depends on the [RouteOptions.departureTime]. As a result, streets with heavy traffic
  /// will be avoided whenever possible. When it is disabled, both [RouteOptions.departureTime]
  /// and [RouteOptions.arrivalTime] are ignored, and the route will be shaped disregarding all
  /// the available current and historical traffic information, except long-term road closures. Defaults to true.
  @Deprecated("Will be removed in v4.19.0. Please use [RouteOptions.trafficOptimizationMode] instead.")
  bool enableTrafficOptimization;

  /// The traffic optimization mode to be used for route calculation. By default, it is [TrafficOptimizationMode.timeDependent].
  TrafficOptimizationMode trafficOptimizationMode;

  /// A flag that indicates whether the resulting route [Section.tolls] properties should contain
  /// tolls data. Defaults to false.
  ///
  /// **Note:** When a route calculation request asks tolls, a pricing scheme with higher rates might be applied.
  /// Consult your HERE representative to get more information on the related pricing schemes.
  ///
  /// **Note:** For users of the `OfflineRoutingEngine` this is a beta release of this feature,
  /// so there could be a few bugs and unexpected behaviors. The `OfflineRoutingEngine` is available for
  /// editions such as the _Navigate Edition_. For users of the `RoutingEngine` the feature is stable.
  bool enableTolls;

  /// Specifies the number of occupants in the vehicle, including driver,
  /// can affect the vehicle's ability to use HOV/carpool restricted lanes.
  /// Valid only for Car, Truck and Scooter transport mode. Shouldn't be less than 1 or greater than 255. Defaults to 1.
  /// For Scooter transport mode, this option is only relevant for Japan and will be ignored for other countries.
  int occupantsNumber;

  /// A flag that indicates whether the order of waypoints that is passed to `calculateRoute()` should be optimized in the best order.
  /// The best order is calculated by the same metrics that are used during regular calculation, e.g. [OptimizationMode].
  /// The starting and destination [Waypoint] are not reordered.
  /// If the whole number of waypoints is fewer than 4 - the flag doesn't affect the resulting route (nothing to optimize).
  /// The resulting order of waypoints can be identified by their waypoint indices in the route sections
  /// (see [Route.sections], [Section.departurePlace], [Section.arrivalPlace], [RoutePlace.waypointIndex]).
  /// Currently, the waypoints order optimization is available only when using the `OfflineRoutingEngine` (not available for all editions).
  /// Defaults to false.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  bool optimizeWaypointsOrder;

  /// Creates a new instance.

  /// [optimizationMode] The optimization mode to be used for route calculation. By default, it is [OptimizationMode.fastest].

  /// [alternatives] Maximum number of alternative routes that will be calculated, in addition
  /// to the best one. The provided value must be in the range \[0, 6\].
  /// Alternative routes can be unavailable, thus they are not guaranteed to be returned.
  /// The order of routes is from the best to the worst, as evaluated by the route calculation
  /// algorithm and according to the given input parameters.
  /// Defaults to 0, which means there are no alternatives, i.e. only the best route is returned.
  /// Must be 0 for isoline calculation.

  /// [departureTime] Optional time when travel is expected to start. Traffic speed and
  /// incidents shall be taken into account in the calculation of the route, per [RouteOptions.trafficOptimizationMode].
  /// If it is not specified, it is assumed to be the current time, i.e. now. Note that both departure time and [RouteOptions.arrivalTime]
  /// cannot be set set at the same time.

  /// [arrivalTime] Optional time when travel is expected to end. Traffic speed and
  /// incidents shall be taken into account in the calculation of the route, per [RouteOptions.trafficOptimizationMode].
  /// Note that both [RouteOptions.departureTime] and arrival time cannot be set set at the same time.

  /// [speedCapInMetersPerSecond] Specifies the maximum speed in meters per second, which the user wishes not to exceed.
  /// The valid range is \[1, 70\] meters per second. Note that it is valid only for [TransportMode.car],
  /// [TransportMode.truck] and [TransportMode.scooter] transport modes.
  /// For car, truck and scooter transport modes, it will affect [Route.duration] of
  /// the route. Only for scooter transport mode, it may affect the route geometry. Defaults to `null`,
  /// which means that no speed cap is set.

  /// [enableRouteHandle] A flag that indicates whether the resulting route should contain a [RouteHandle].
  /// Defaults to false.

  /// [enableTrafficOptimization] A flag that indicates whether traffic information should be considered during route calculation.
  /// When it is enabled, the shape of the route will be adjusted according to the traffic situation that
  /// depends on the [RouteOptions.departureTime]. As a result, streets with heavy traffic
  /// will be avoided whenever possible. When it is disabled, both [RouteOptions.departureTime]
  /// and [RouteOptions.arrivalTime] are ignored, and the route will be shaped disregarding all
  /// the available current and historical traffic information, except long-term road closures. Defaults to true.

  /// [trafficOptimizationMode] The traffic optimization mode to be used for route calculation. By default, it is [TrafficOptimizationMode.timeDependent].

  /// [enableTolls] A flag that indicates whether the resulting route [Section.tolls] properties should contain
  /// tolls data. Defaults to false.
  ///
  /// **Note:** When a route calculation request asks tolls, a pricing scheme with higher rates might be applied.
  /// Consult your HERE representative to get more information on the related pricing schemes.
  ///
  /// **Note:** For users of the `OfflineRoutingEngine` this is a beta release of this feature,
  /// so there could be a few bugs and unexpected behaviors. The `OfflineRoutingEngine` is available for
  /// editions such as the _Navigate Edition_. For users of the `RoutingEngine` the feature is stable.

  /// [occupantsNumber] Specifies the number of occupants in the vehicle, including driver,
  /// can affect the vehicle's ability to use HOV/carpool restricted lanes.
  /// Valid only for Car, Truck and Scooter transport mode. Shouldn't be less than 1 or greater than 255. Defaults to 1.
  /// For Scooter transport mode, this option is only relevant for Japan and will be ignored for other countries.

  /// [optimizeWaypointsOrder] A flag that indicates whether the order of waypoints that is passed to `calculateRoute()` should be optimized in the best order.
  /// The best order is calculated by the same metrics that are used during regular calculation, e.g. [OptimizationMode].
  /// The starting and destination [Waypoint] are not reordered.
  /// If the whole number of waypoints is fewer than 4 - the flag doesn't affect the resulting route (nothing to optimize).
  /// The resulting order of waypoints can be identified by their waypoint indices in the route sections
  /// (see [Route.sections], [Section.departurePlace], [Section.arrivalPlace], [RoutePlace.waypointIndex]).
  /// Currently, the waypoints order optimization is available only when using the `OfflineRoutingEngine` (not available for all editions).
  /// Defaults to false.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.

  RouteOptions([OptimizationMode optimizationMode = OptimizationMode.fastest, int alternatives = 0, DateTime? departureTime = null, DateTime? arrivalTime = null, double? speedCapInMetersPerSecond = null, bool enableRouteHandle = false, bool enableTrafficOptimization = true, TrafficOptimizationMode trafficOptimizationMode = TrafficOptimizationMode.timeDependent, bool enableTolls = false, int occupantsNumber = 1, bool optimizeWaypointsOrder = false])
    : optimizationMode = optimizationMode, alternatives = alternatives, departureTime = departureTime, arrivalTime = arrivalTime, speedCapInMetersPerSecond = speedCapInMetersPerSecond, enableRouteHandle = enableRouteHandle, enableTrafficOptimization = enableTrafficOptimization, trafficOptimizationMode = trafficOptimizationMode, enableTolls = enableTolls, occupantsNumber = occupantsNumber, optimizeWaypointsOrder = optimizeWaypointsOrder;
  /// Creates a new instance.
  RouteOptions.withDefaults()
      : optimizationMode = OptimizationMode.fastest, alternatives = 0, departureTime = null, arrivalTime = null, speedCapInMetersPerSecond = null, enableRouteHandle = false, enableTrafficOptimization = true, trafficOptimizationMode = TrafficOptimizationMode.timeDependent, enableTolls = false, occupantsNumber = 1, optimizeWaypointsOrder = false;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RouteOptions) return false;
    RouteOptions _other = other;
    return optimizationMode == _other.optimizationMode &&
        alternatives == _other.alternatives &&
        departureTime == _other.departureTime &&
        arrivalTime == _other.arrivalTime &&
        speedCapInMetersPerSecond == _other.speedCapInMetersPerSecond &&
        enableRouteHandle == _other.enableRouteHandle &&
        enableTrafficOptimization == _other.enableTrafficOptimization &&
        trafficOptimizationMode == _other.trafficOptimizationMode &&
        enableTolls == _other.enableTolls &&
        occupantsNumber == _other.occupantsNumber &&
        optimizeWaypointsOrder == _other.optimizeWaypointsOrder;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + optimizationMode.hashCode;
    result = 31 * result + alternatives.hashCode;
    result = 31 * result + departureTime.hashCode;
    result = 31 * result + arrivalTime.hashCode;
    result = 31 * result + speedCapInMetersPerSecond.hashCode;
    result = 31 * result + enableRouteHandle.hashCode;
    result = 31 * result + enableTrafficOptimization.hashCode;
    result = 31 * result + trafficOptimizationMode.hashCode;
    result = 31 * result + enableTolls.hashCode;
    result = 31 * result + occupantsNumber.hashCode;
    result = 31 * result + optimizeWaypointsOrder.hashCode;
    return result;
  }
}


// RouteOptions "private" section, not exported.

final _sdkRoutingRouteoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint8, Uint8, Uint32, Uint8, Int32, Uint8),
    Pointer<Void> Function(int, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, int, int, int, int, int)
  >('here_sdk_sdk_routing_RouteOptions_create_handle'));
final _sdkRoutingRouteoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_release_handle'));
final _sdkRoutingRouteoptionsGetFieldoptimizationMode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_optimizationMode'));
final _sdkRoutingRouteoptionsGetFieldalternatives = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_alternatives'));
final _sdkRoutingRouteoptionsGetFielddepartureTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_departureTime'));
final _sdkRoutingRouteoptionsGetFieldarrivalTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_arrivalTime'));
final _sdkRoutingRouteoptionsGetFieldspeedCapInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_speedCapInMetersPerSecond'));
final _sdkRoutingRouteoptionsGetFieldenableRouteHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_enableRouteHandle'));
final _sdkRoutingRouteoptionsGetFieldenableTrafficOptimization = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_enableTrafficOptimization'));
final _sdkRoutingRouteoptionsGetFieldtrafficOptimizationMode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_trafficOptimizationMode'));
final _sdkRoutingRouteoptionsGetFieldenableTolls = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_enableTolls'));
final _sdkRoutingRouteoptionsGetFieldoccupantsNumber = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_occupantsNumber'));
final _sdkRoutingRouteoptionsGetFieldoptimizeWaypointsOrder = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_field_optimizeWaypointsOrder'));



Pointer<Void> sdkRoutingRouteoptionsToFfi(RouteOptions value) {
  final _optimizationModeHandle = sdkRoutingOptimizationmodeToFfi(value.optimizationMode);
  final _alternativesHandle = (value.alternatives);
  final _departureTimeHandle = dateToFfiNullable(value.departureTime);
  final _arrivalTimeHandle = dateToFfiNullable(value.arrivalTime);
  final _speedCapInMetersPerSecondHandle = doubleToFfiNullable(value.speedCapInMetersPerSecond);
  final _enableRouteHandleHandle = booleanToFfi(value.enableRouteHandle);
  final _enableTrafficOptimizationHandle = booleanToFfi(value.enableTrafficOptimization);
  final _trafficOptimizationModeHandle = sdkRoutingTrafficoptimizationmodeToFfi(value.trafficOptimizationMode);
  final _enableTollsHandle = booleanToFfi(value.enableTolls);
  final _occupantsNumberHandle = (value.occupantsNumber);
  final _optimizeWaypointsOrderHandle = booleanToFfi(value.optimizeWaypointsOrder);
  final _result = _sdkRoutingRouteoptionsCreateHandle(_optimizationModeHandle, _alternativesHandle, _departureTimeHandle, _arrivalTimeHandle, _speedCapInMetersPerSecondHandle, _enableRouteHandleHandle, _enableTrafficOptimizationHandle, _trafficOptimizationModeHandle, _enableTollsHandle, _occupantsNumberHandle, _optimizeWaypointsOrderHandle);
  sdkRoutingOptimizationmodeReleaseFfiHandle(_optimizationModeHandle);
  
  dateReleaseFfiHandleNullable(_departureTimeHandle);
  dateReleaseFfiHandleNullable(_arrivalTimeHandle);
  doubleReleaseFfiHandleNullable(_speedCapInMetersPerSecondHandle);
  booleanReleaseFfiHandle(_enableRouteHandleHandle);
  booleanReleaseFfiHandle(_enableTrafficOptimizationHandle);
  sdkRoutingTrafficoptimizationmodeReleaseFfiHandle(_trafficOptimizationModeHandle);
  booleanReleaseFfiHandle(_enableTollsHandle);
  
  booleanReleaseFfiHandle(_optimizeWaypointsOrderHandle);
  return _result;
}

RouteOptions sdkRoutingRouteoptionsFromFfi(Pointer<Void> handle) {
  final _optimizationModeHandle = _sdkRoutingRouteoptionsGetFieldoptimizationMode(handle);
  final _alternativesHandle = _sdkRoutingRouteoptionsGetFieldalternatives(handle);
  final _departureTimeHandle = _sdkRoutingRouteoptionsGetFielddepartureTime(handle);
  final _arrivalTimeHandle = _sdkRoutingRouteoptionsGetFieldarrivalTime(handle);
  final _speedCapInMetersPerSecondHandle = _sdkRoutingRouteoptionsGetFieldspeedCapInMetersPerSecond(handle);
  final _enableRouteHandleHandle = _sdkRoutingRouteoptionsGetFieldenableRouteHandle(handle);
  final _enableTrafficOptimizationHandle = _sdkRoutingRouteoptionsGetFieldenableTrafficOptimization(handle);
  final _trafficOptimizationModeHandle = _sdkRoutingRouteoptionsGetFieldtrafficOptimizationMode(handle);
  final _enableTollsHandle = _sdkRoutingRouteoptionsGetFieldenableTolls(handle);
  final _occupantsNumberHandle = _sdkRoutingRouteoptionsGetFieldoccupantsNumber(handle);
  final _optimizeWaypointsOrderHandle = _sdkRoutingRouteoptionsGetFieldoptimizeWaypointsOrder(handle);
  try {
    return RouteOptions(
      sdkRoutingOptimizationmodeFromFfi(_optimizationModeHandle), 
      (_alternativesHandle), 
      dateFromFfiNullable(_departureTimeHandle), 
      dateFromFfiNullable(_arrivalTimeHandle), 
      doubleFromFfiNullable(_speedCapInMetersPerSecondHandle), 
      booleanFromFfi(_enableRouteHandleHandle), 
      booleanFromFfi(_enableTrafficOptimizationHandle), 
      sdkRoutingTrafficoptimizationmodeFromFfi(_trafficOptimizationModeHandle), 
      booleanFromFfi(_enableTollsHandle), 
      (_occupantsNumberHandle), 
      booleanFromFfi(_optimizeWaypointsOrderHandle)
    );
  } finally {
    sdkRoutingOptimizationmodeReleaseFfiHandle(_optimizationModeHandle);
    
    dateReleaseFfiHandleNullable(_departureTimeHandle);
    dateReleaseFfiHandleNullable(_arrivalTimeHandle);
    doubleReleaseFfiHandleNullable(_speedCapInMetersPerSecondHandle);
    booleanReleaseFfiHandle(_enableRouteHandleHandle);
    booleanReleaseFfiHandle(_enableTrafficOptimizationHandle);
    sdkRoutingTrafficoptimizationmodeReleaseFfiHandle(_trafficOptimizationModeHandle);
    booleanReleaseFfiHandle(_enableTollsHandle);
    
    booleanReleaseFfiHandle(_optimizeWaypointsOrderHandle);
  }
}

void sdkRoutingRouteoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingRouteoptionsReleaseHandle(handle);

// Nullable RouteOptions

final _sdkRoutingRouteoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_create_handle_nullable'));
final _sdkRoutingRouteoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_release_handle_nullable'));
final _sdkRoutingRouteoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteOptions_get_value_nullable'));

Pointer<Void> sdkRoutingRouteoptionsToFfiNullable(RouteOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingRouteoptionsToFfi(value);
  final result = _sdkRoutingRouteoptionsCreateHandleNullable(_handle);
  sdkRoutingRouteoptionsReleaseFfiHandle(_handle);
  return result;
}

RouteOptions? sdkRoutingRouteoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingRouteoptionsGetValueNullable(handle);
  final result = sdkRoutingRouteoptionsFromFfi(_handle);
  sdkRoutingRouteoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingRouteoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRouteoptionsReleaseHandleNullable(handle);

// End of RouteOptions "private" section.


