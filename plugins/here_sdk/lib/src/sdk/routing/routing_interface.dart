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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/routing/bicycle_options.dart';
import 'package:here_sdk/src/sdk/routing/bus_options.dart';
import 'package:here_sdk/src/sdk/routing/calculate_route_callback.dart';
import 'package:here_sdk/src/sdk/routing/car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_truck_options.dart';
import 'package:here_sdk/src/sdk/routing/pedestrian_options.dart';
import 'package:here_sdk/src/sdk/routing/private_bus_options.dart';
import 'package:here_sdk/src/sdk/routing/route.dart';
import 'package:here_sdk/src/sdk/routing/scooter_options.dart';
import 'package:here_sdk/src/sdk/routing/taxi_options.dart';
import 'package:here_sdk/src/sdk/routing/truck_options.dart';
import 'package:here_sdk/src/sdk/routing/waypoint.dart';

/// Provides the abstract class for the online and offline
/// routing engines.
abstract class RoutingInterface {
  /// Provides the abstract class for the online and offline
  /// routing engines.

  factory RoutingInterface(
    TaskHandle Function(List<Waypoint>, CarOptions, CalculateRouteCallback) calculateCarRouteLambda,
    TaskHandle Function(List<Waypoint>, PedestrianOptions, CalculateRouteCallback) calculatePedestrianRouteLambda,
    TaskHandle Function(List<Waypoint>, TruckOptions, CalculateRouteCallback) calculateTruckRouteLambda,
    TaskHandle Function(List<Waypoint>, ScooterOptions, CalculateRouteCallback) calculateScooterRouteLambda,
    TaskHandle Function(List<Waypoint>, BicycleOptions, CalculateRouteCallback) calculateBicycleRouteLambda,
    TaskHandle Function(List<Waypoint>, TaxiOptions, CalculateRouteCallback) calculateTaxiRouteLambda,
    TaskHandle Function(List<Waypoint>, EVCarOptions, CalculateRouteCallback) calculateEVCarRouteLambda,
    TaskHandle Function(List<Waypoint>, EVTruckOptions, CalculateRouteCallback) calculateEVTruckRouteLambda,
    TaskHandle Function(List<Waypoint>, BusOptions, CalculateRouteCallback) calculateBusRouteLambda,
    TaskHandle Function(List<Waypoint>, PrivateBusOptions, CalculateRouteCallback) calculatePrivateBusRouteLambda,
    TaskHandle Function(Route, Waypoint, double, CalculateRouteCallback) returnToRouteLambda,
    TaskHandle Function(Route, Waypoint, int, int, CalculateRouteCallback) returnToRouteWithTraveledDistanceLambda,

  ) => RoutingInterface$Lambdas(
    calculateCarRouteLambda,
    calculatePedestrianRouteLambda,
    calculateTruckRouteLambda,
    calculateScooterRouteLambda,
    calculateBicycleRouteLambda,
    calculateTaxiRouteLambda,
    calculateEVCarRouteLambda,
    calculateEVTruckRouteLambda,
    calculateBusRouteLambda,
    calculatePrivateBusRouteLambda,
    returnToRouteLambda,
    returnToRouteWithTraveledDistanceLambda,

  );

  /// Asynchronously calculates a car route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [carOptions] Options specific for car route calculation, along with
  /// common route options.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle calculateCarRoute(List<Waypoint> waypoints, CarOptions carOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates a pedestrian route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [pedestrianOptions] Options specific for pedestrian route calculation, along with
  /// common route options. Note that [OptimizationMode.shortest] is
  /// is not supported for pedestrians and converted to
  /// [OptimizationMode.fastest] automatically.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle calculatePedestrianRoute(List<Waypoint> waypoints, PedestrianOptions pedestrianOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates a truck route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [truckOptions] Options specific for truck route calculation, along with
  /// common route options.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle calculateTruckRoute(List<Waypoint> waypoints, TruckOptions truckOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates a scooter route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [scooterOptions] Options specific for scooter route calculation, along with
  /// common route options. Note that [OptimizationMode.shortest] is
  /// is not supported for scooters and converted to
  /// [OptimizationMode.fastest] automatically.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle calculateScooterRoute(List<Waypoint> waypoints, ScooterOptions scooterOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates a bicycle route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [bicycleOptions] Options specific for bicycle route calculation, along with
  /// common route options. Note that [OptimizationMode.shortest] is
  /// is not supported for bicycles and converted to
  /// [OptimizationMode.fastest] automatically.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle calculateBicycleRoute(List<Waypoint> waypoints, BicycleOptions bicycleOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates a taxi route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// **Note:** This is a beta release of this transport mode, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases or even become unsupported, without a
  /// deprecation process.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [taxiOptions] Options specific for taxi route calculation, along with
  /// common route options. Note that [OptimizationMode.shortest] is
  /// is not supported for taxis and converted to
  /// [OptimizationMode.fastest] automatically.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle calculateTaxiRoute(List<Waypoint> waypoints, TaxiOptions taxiOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates an electric car route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [evCarOptions] Options specific for an electric car route calculation, along with
  /// common route options.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle calculateEVCarRoute(List<Waypoint> waypoints, EVCarOptions evCarOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates an electic truck route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [evTruckOptions] Options specific for an electric truck route calculation, along with
  /// common route options.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle calculateEVTruckRoute(List<Waypoint> waypoints, EVTruckOptions evTruckOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates a bus route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [busOptions] Options specific for a bus route calculation, along with
  /// common route options.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle calculateBusRoute(List<Waypoint> waypoints, BusOptions busOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates a private bus route from one point to another,
  /// passing through the given waypoints in the given order.
  ///
  /// [waypoints] The list of waypoints used to calculate the route.
  /// The first element marks the starting position, the last marks the destination.
  /// Waypoints in between are interpreted as intermediate.
  ///
  /// An [RoutingError.invalidParameter] error is generated when the waypoint list
  /// contains less than two elements or when the first and the last waypoints are not of type
  /// [WaypointType.stopover].
  ///
  /// [privateBusOptions] Options specific for a private bus route calculation, along with
  /// common route options.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle calculatePrivateBusRoute(List<Waypoint> waypoints, PrivateBusOptions privateBusOptions, CalculateRouteCallback callback);
  /// Asynchronously calculates a new route that leads back to the original route.
  ///
  /// The part of
  /// the original route which was already travelled by the user is ignored.
  ///
  /// **Note:** Stopover waypoints are guaranteed to be visited. Pass-through waypoints will
  /// be ignored.
  /// Additionally, the following route options are ignored:
  /// [RouteOptions.alternatives], [RouteOptions.arrivalTime], and
  /// [RouteOptions.optimizationMode].
  ///
  /// An application may use this method to submit a new
  /// starting point for a previously calculated route. This method tries to avoid a costly
  /// route re-calculation as much as possible. In case returning to the route without
  /// re-calculation is not possible, a new route is calculated, while trying to salvage
  /// the previous route as much as possible. However, a completely new route
  /// containing no part of the previous route is possible, too.
  ///
  /// Note that this function uses only a limited amount of map data around the new origin.
  /// Therefore, it may also work fine with temporarily cached map data. It may also copy some of the
  /// original route data into the new route.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [route] A [Route] calculated using the online or offline route engine. For the offline case, It
  /// should not contain an indoor [Section] as such routes will fail. For the online case, it
  /// should have [RouteHandle].
  ///
  /// [startingPoint] The current location, for example, provided by a `RouteDeviation` event. The waypoint needs to be of
  /// type [WaypointType.stopover]. Otherwise, an [RoutingError.invalidParameter]
  /// error is generated.
  ///
  /// [routeFractionTraveled] The normalized length of the [Route] which is already traversed and that should
  /// be ignored. The factor is expected to be calculated using the traveled distance divided by the total
  /// distance of the route. The factor is expected to be in the range of \[0, 1\].
  ///
  /// **Example:** routeFractionTraveled = (totalDistanceToDestination - currentDistanceToDestination) / totalDistanceToDestination.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  @Deprecated("Will be removed in v4.18.0, please use version with section index and distance.")

  TaskHandle returnToRoute(Route route, Waypoint startingPoint, double routeFractionTraveled, CalculateRouteCallback callback);
  /// Asynchronously calculates a new route that leads back to the original route.
  ///
  /// The part of
  /// the original route which was already travelled by the user is ignored.
  ///
  /// **Note:** Stopover waypoints are guaranteed to be visited. Pass-through waypoints will
  /// be ignored.
  /// Additionally, the following route options are ignored:
  /// [RouteOptions.alternatives], [RouteOptions.arrivalTime], and
  /// [RouteOptions.optimizationMode].
  ///
  /// An application may use this method to submit a new
  /// starting point for a previously calculated route. This method tries to avoid a costly
  /// route re-calculation as much as possible. In case returning to the route without
  /// re-calculation is not possible, a new route is calculated, while trying to salvage
  /// the previous route as much as possible. However, a completely new route
  /// containing no part of the previous route is possible, too.
  ///
  /// Note that this function uses only a limited amount of map data around the new origin.
  /// Therefore, it may also work fine with temporarily cached map data. It may also copy some of the
  /// original route data into the new route.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [route] A [Route] calculated using the online or offline route engine. For the offline case, It
  /// should not contain an indoor [Section] as such routes will fail. For the online case, it
  /// should have [RouteHandle].
  ///
  /// [startingPoint] The current location, for example, provided by a `RouteDeviation` event. The waypoint needs to be of
  /// type [WaypointType.stopover]. Otherwise, an [RoutingError.invalidParameter]
  /// error is generated.
  ///
  /// [lastTraveledSectionIndex] Indicates the index of the last traveled route section. Traveled part of the route won't be reused.
  ///
  /// [traveledDistanceOnLastSectionInMeters] Offset in meter to the last visited position on the route section defined by the last traveled section index.
  ///
  /// [callback] Callback object that will be invoked after route calculation.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle returnToRouteWithTraveledDistance(Route route, Waypoint startingPoint, int lastTraveledSectionIndex, int traveledDistanceOnLastSectionInMeters, CalculateRouteCallback callback);
}


// RoutingInterface "private" section, not exported.

final _sdkRoutingRoutinginterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_routing_RoutingInterface_register_finalizer'));
final _sdkRoutingRoutinginterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingInterface_copy_handle'));
final _sdkRoutingRoutinginterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingInterface_release_handle'));
final _sdkRoutingRoutinginterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_routing_RoutingInterface_create_proxy'));
final _sdkRoutingRoutinginterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingInterface_get_type_id'));













class RoutingInterface$Lambdas implements RoutingInterface {
  TaskHandle Function(List<Waypoint>, CarOptions, CalculateRouteCallback) calculateCarRouteLambda;
  TaskHandle Function(List<Waypoint>, PedestrianOptions, CalculateRouteCallback) calculatePedestrianRouteLambda;
  TaskHandle Function(List<Waypoint>, TruckOptions, CalculateRouteCallback) calculateTruckRouteLambda;
  TaskHandle Function(List<Waypoint>, ScooterOptions, CalculateRouteCallback) calculateScooterRouteLambda;
  TaskHandle Function(List<Waypoint>, BicycleOptions, CalculateRouteCallback) calculateBicycleRouteLambda;
  TaskHandle Function(List<Waypoint>, TaxiOptions, CalculateRouteCallback) calculateTaxiRouteLambda;
  TaskHandle Function(List<Waypoint>, EVCarOptions, CalculateRouteCallback) calculateEVCarRouteLambda;
  TaskHandle Function(List<Waypoint>, EVTruckOptions, CalculateRouteCallback) calculateEVTruckRouteLambda;
  TaskHandle Function(List<Waypoint>, BusOptions, CalculateRouteCallback) calculateBusRouteLambda;
  TaskHandle Function(List<Waypoint>, PrivateBusOptions, CalculateRouteCallback) calculatePrivateBusRouteLambda;
  TaskHandle Function(Route, Waypoint, double, CalculateRouteCallback) returnToRouteLambda;
  TaskHandle Function(Route, Waypoint, int, int, CalculateRouteCallback) returnToRouteWithTraveledDistanceLambda;

  RoutingInterface$Lambdas(
    this.calculateCarRouteLambda,
    this.calculatePedestrianRouteLambda,
    this.calculateTruckRouteLambda,
    this.calculateScooterRouteLambda,
    this.calculateBicycleRouteLambda,
    this.calculateTaxiRouteLambda,
    this.calculateEVCarRouteLambda,
    this.calculateEVTruckRouteLambda,
    this.calculateBusRouteLambda,
    this.calculatePrivateBusRouteLambda,
    this.returnToRouteLambda,
    this.returnToRouteWithTraveledDistanceLambda,

  );

  @override
  TaskHandle calculateCarRoute(List<Waypoint> waypoints, CarOptions carOptions, CalculateRouteCallback callback) =>
    calculateCarRouteLambda(waypoints, carOptions, callback);
  @override
  TaskHandle calculatePedestrianRoute(List<Waypoint> waypoints, PedestrianOptions pedestrianOptions, CalculateRouteCallback callback) =>
    calculatePedestrianRouteLambda(waypoints, pedestrianOptions, callback);
  @override
  TaskHandle calculateTruckRoute(List<Waypoint> waypoints, TruckOptions truckOptions, CalculateRouteCallback callback) =>
    calculateTruckRouteLambda(waypoints, truckOptions, callback);
  @override
  TaskHandle calculateScooterRoute(List<Waypoint> waypoints, ScooterOptions scooterOptions, CalculateRouteCallback callback) =>
    calculateScooterRouteLambda(waypoints, scooterOptions, callback);
  @override
  TaskHandle calculateBicycleRoute(List<Waypoint> waypoints, BicycleOptions bicycleOptions, CalculateRouteCallback callback) =>
    calculateBicycleRouteLambda(waypoints, bicycleOptions, callback);
  @override
  TaskHandle calculateTaxiRoute(List<Waypoint> waypoints, TaxiOptions taxiOptions, CalculateRouteCallback callback) =>
    calculateTaxiRouteLambda(waypoints, taxiOptions, callback);
  @override
  TaskHandle calculateEVCarRoute(List<Waypoint> waypoints, EVCarOptions evCarOptions, CalculateRouteCallback callback) =>
    calculateEVCarRouteLambda(waypoints, evCarOptions, callback);
  @override
  TaskHandle calculateEVTruckRoute(List<Waypoint> waypoints, EVTruckOptions evTruckOptions, CalculateRouteCallback callback) =>
    calculateEVTruckRouteLambda(waypoints, evTruckOptions, callback);
  @override
  TaskHandle calculateBusRoute(List<Waypoint> waypoints, BusOptions busOptions, CalculateRouteCallback callback) =>
    calculateBusRouteLambda(waypoints, busOptions, callback);
  @override
  TaskHandle calculatePrivateBusRoute(List<Waypoint> waypoints, PrivateBusOptions privateBusOptions, CalculateRouteCallback callback) =>
    calculatePrivateBusRouteLambda(waypoints, privateBusOptions, callback);
  @override
  TaskHandle returnToRoute(Route route, Waypoint startingPoint, double routeFractionTraveled, CalculateRouteCallback callback) =>
    returnToRouteLambda(route, startingPoint, routeFractionTraveled, callback);
  @override
  TaskHandle returnToRouteWithTraveledDistance(Route route, Waypoint startingPoint, int lastTraveledSectionIndex, int traveledDistanceOnLastSectionInMeters, CalculateRouteCallback callback) =>
    returnToRouteWithTraveledDistanceLambda(route, startingPoint, lastTraveledSectionIndex, traveledDistanceOnLastSectionInMeters, callback);
}

class RoutingInterface$Impl extends __lib.NativeBase implements RoutingInterface {

  RoutingInterface$Impl(Pointer<Void> handle) : super(handle);

  @override
  TaskHandle calculateCarRoute(List<Waypoint> waypoints, CarOptions carOptions, CalculateRouteCallback callback) {
    final _calculateCarRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_CarOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _carOptionsHandle = sdkRoutingCaroptionsToFfi(carOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateCarRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _carOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingCaroptionsReleaseFfiHandle(_carOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculatePedestrianRoute(List<Waypoint> waypoints, PedestrianOptions pedestrianOptions, CalculateRouteCallback callback) {
    final _calculatePedestrianRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_PedestrianOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _pedestrianOptionsHandle = sdkRoutingPedestrianoptionsToFfi(pedestrianOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculatePedestrianRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _pedestrianOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingPedestrianoptionsReleaseFfiHandle(_pedestrianOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateTruckRoute(List<Waypoint> waypoints, TruckOptions truckOptions, CalculateRouteCallback callback) {
    final _calculateTruckRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_TruckOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _truckOptionsHandle = sdkRoutingTruckoptionsToFfi(truckOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateTruckRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _truckOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingTruckoptionsReleaseFfiHandle(_truckOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateScooterRoute(List<Waypoint> waypoints, ScooterOptions scooterOptions, CalculateRouteCallback callback) {
    final _calculateScooterRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_ScooterOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _scooterOptionsHandle = sdkRoutingScooteroptionsToFfi(scooterOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateScooterRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _scooterOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingScooteroptionsReleaseFfiHandle(_scooterOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateBicycleRoute(List<Waypoint> waypoints, BicycleOptions bicycleOptions, CalculateRouteCallback callback) {
    final _calculateBicycleRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_BicycleOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _bicycleOptionsHandle = sdkRoutingBicycleoptionsToFfi(bicycleOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateBicycleRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _bicycleOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingBicycleoptionsReleaseFfiHandle(_bicycleOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateTaxiRoute(List<Waypoint> waypoints, TaxiOptions taxiOptions, CalculateRouteCallback callback) {
    final _calculateTaxiRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_TaxiOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _taxiOptionsHandle = sdkRoutingTaxioptionsToFfi(taxiOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateTaxiRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _taxiOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingTaxioptionsReleaseFfiHandle(_taxiOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateEVCarRoute(List<Waypoint> waypoints, EVCarOptions evCarOptions, CalculateRouteCallback callback) {
    final _calculateEVCarRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_EVCarOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _evCarOptionsHandle = sdkRoutingEvcaroptionsToFfi(evCarOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateEVCarRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _evCarOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingEvcaroptionsReleaseFfiHandle(_evCarOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateEVTruckRoute(List<Waypoint> waypoints, EVTruckOptions evTruckOptions, CalculateRouteCallback callback) {
    final _calculateEVTruckRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_EVTruckOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _evTruckOptionsHandle = sdkRoutingEvtruckoptionsToFfi(evTruckOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateEVTruckRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _evTruckOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingEvtruckoptionsReleaseFfiHandle(_evTruckOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateBusRoute(List<Waypoint> waypoints, BusOptions busOptions, CalculateRouteCallback callback) {
    final _calculateBusRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_BusOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _busOptionsHandle = sdkRoutingBusoptionsToFfi(busOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateBusRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _busOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingBusoptionsReleaseFfiHandle(_busOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculatePrivateBusRoute(List<Waypoint> waypoints, PrivateBusOptions privateBusOptions, CalculateRouteCallback callback) {
    final _calculatePrivateBusRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_calculateRoute__ListOf_sdk_routing_Waypoint_PrivateBusOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingCommonBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _privateBusOptionsHandle = sdkRoutingPrivatebusoptionsToFfi(privateBusOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculatePrivateBusRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _privateBusOptionsHandle, _callbackHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingPrivatebusoptionsReleaseFfiHandle(_privateBusOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle returnToRoute(Route route, Waypoint startingPoint, double routeFractionTraveled, CalculateRouteCallback callback) {
    final _returnToRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Double, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_returnToRoute__Route_Waypoint_Double_CalculateRouteCallback'));
    final _routeHandle = sdkRoutingRouteToFfi(route);
    final _startingPointHandle = sdkRoutingWaypointToFfi(startingPoint);
    final _routeFractionTraveledHandle = (routeFractionTraveled);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _returnToRouteFfi(_handle, __lib.LibraryContext.isolateId, _routeHandle, _startingPointHandle, _routeFractionTraveledHandle, _callbackHandle);
    sdkRoutingRouteReleaseFfiHandle(_routeHandle);
    sdkRoutingWaypointReleaseFfiHandle(_startingPointHandle);

    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle returnToRouteWithTraveledDistance(Route route, Waypoint startingPoint, int lastTraveledSectionIndex, int traveledDistanceOnLastSectionInMeters, CalculateRouteCallback callback) {
    final _returnToRouteWithTraveledDistanceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Int32, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, int, int, Pointer<Void>)>('here_sdk_sdk_routing_RoutingInterface_returnToRoute__Route_Waypoint_Int_Int_CalculateRouteCallback'));
    final _routeHandle = sdkRoutingRouteToFfi(route);
    final _startingPointHandle = sdkRoutingWaypointToFfi(startingPoint);
    final _lastTraveledSectionIndexHandle = (lastTraveledSectionIndex);
    final _traveledDistanceOnLastSectionInMetersHandle = (traveledDistanceOnLastSectionInMeters);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _returnToRouteWithTraveledDistanceFfi(_handle, __lib.LibraryContext.isolateId, _routeHandle, _startingPointHandle, _lastTraveledSectionIndexHandle, _traveledDistanceOnLastSectionInMetersHandle, _callbackHandle);
    sdkRoutingRouteReleaseFfiHandle(_routeHandle);
    sdkRoutingWaypointReleaseFfiHandle(_startingPointHandle);


    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }


}

int _sdkRoutingRoutinginterfacecalculateCarRouteStatic(Object _obj, Pointer<Void> waypoints, Pointer<Void> carOptions, Pointer<Void> callback, Pointer<Pointer<Void>> _result) {
  TaskHandle? _resultObject;
  try {
    _resultObject = (_obj as RoutingInterface).calculateCarRoute(heresdkRoutingCommonBindingslistofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingCaroptionsFromFfi(carOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
    _result.value = sdkCoreThreadingTaskhandleToFfi(_resultObject);
  } finally {
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingCaroptionsReleaseFfiHandle(carOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacecalculatePedestrianRouteStatic(Object _obj, Pointer<Void> waypoints, Pointer<Void> pedestrianOptions, Pointer<Void> callback, Pointer<Pointer<Void>> _result) {
  TaskHandle? _resultObject;
  try {
    _resultObject = (_obj as RoutingInterface).calculatePedestrianRoute(heresdkRoutingCommonBindingslistofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingPedestrianoptionsFromFfi(pedestrianOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
    _result.value = sdkCoreThreadingTaskhandleToFfi(_resultObject);
  } finally {
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingPedestrianoptionsReleaseFfiHandle(pedestrianOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacecalculateTruckRouteStatic(Object _obj, Pointer<Void> waypoints, Pointer<Void> truckOptions, Pointer<Void> callback, Pointer<Pointer<Void>> _result) {
  TaskHandle? _resultObject;
  try {
    _resultObject = (_obj as RoutingInterface).calculateTruckRoute(heresdkRoutingCommonBindingslistofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingTruckoptionsFromFfi(truckOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
    _result.value = sdkCoreThreadingTaskhandleToFfi(_resultObject);
  } finally {
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingTruckoptionsReleaseFfiHandle(truckOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacecalculateScooterRouteStatic(Object _obj, Pointer<Void> waypoints, Pointer<Void> scooterOptions, Pointer<Void> callback, Pointer<Pointer<Void>> _result) {
  TaskHandle? _resultObject;
  try {
    _resultObject = (_obj as RoutingInterface).calculateScooterRoute(heresdkRoutingCommonBindingslistofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingScooteroptionsFromFfi(scooterOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
    _result.value = sdkCoreThreadingTaskhandleToFfi(_resultObject);
  } finally {
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingScooteroptionsReleaseFfiHandle(scooterOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacecalculateBicycleRouteStatic(Object _obj, Pointer<Void> waypoints, Pointer<Void> bicycleOptions, Pointer<Void> callback, Pointer<Pointer<Void>> _result) {
  TaskHandle? _resultObject;
  try {
    _resultObject = (_obj as RoutingInterface).calculateBicycleRoute(heresdkRoutingCommonBindingslistofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingBicycleoptionsFromFfi(bicycleOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
    _result.value = sdkCoreThreadingTaskhandleToFfi(_resultObject);
  } finally {
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingBicycleoptionsReleaseFfiHandle(bicycleOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacecalculateTaxiRouteStatic(Object _obj, Pointer<Void> waypoints, Pointer<Void> taxiOptions, Pointer<Void> callback, Pointer<Pointer<Void>> _result) {
  TaskHandle? _resultObject;
  try {
    _resultObject = (_obj as RoutingInterface).calculateTaxiRoute(heresdkRoutingCommonBindingslistofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingTaxioptionsFromFfi(taxiOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
    _result.value = sdkCoreThreadingTaskhandleToFfi(_resultObject);
  } finally {
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingTaxioptionsReleaseFfiHandle(taxiOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacecalculateEVCarRouteStatic(Object _obj, Pointer<Void> waypoints, Pointer<Void> evCarOptions, Pointer<Void> callback, Pointer<Pointer<Void>> _result) {
  TaskHandle? _resultObject;
  try {
    _resultObject = (_obj as RoutingInterface).calculateEVCarRoute(heresdkRoutingCommonBindingslistofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingEvcaroptionsFromFfi(evCarOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
    _result.value = sdkCoreThreadingTaskhandleToFfi(_resultObject);
  } finally {
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingEvcaroptionsReleaseFfiHandle(evCarOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacecalculateEVTruckRouteStatic(Object _obj, Pointer<Void> waypoints, Pointer<Void> evTruckOptions, Pointer<Void> callback, Pointer<Pointer<Void>> _result) {
  TaskHandle? _resultObject;
  try {
    _resultObject = (_obj as RoutingInterface).calculateEVTruckRoute(heresdkRoutingCommonBindingslistofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingEvtruckoptionsFromFfi(evTruckOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
    _result.value = sdkCoreThreadingTaskhandleToFfi(_resultObject);
  } finally {
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingEvtruckoptionsReleaseFfiHandle(evTruckOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacecalculateBusRouteStatic(Object _obj, Pointer<Void> waypoints, Pointer<Void> busOptions, Pointer<Void> callback, Pointer<Pointer<Void>> _result) {
  TaskHandle? _resultObject;
  try {
    _resultObject = (_obj as RoutingInterface).calculateBusRoute(heresdkRoutingCommonBindingslistofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingBusoptionsFromFfi(busOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
    _result.value = sdkCoreThreadingTaskhandleToFfi(_resultObject);
  } finally {
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingBusoptionsReleaseFfiHandle(busOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacecalculatePrivateBusRouteStatic(Object _obj, Pointer<Void> waypoints, Pointer<Void> privateBusOptions, Pointer<Void> callback, Pointer<Pointer<Void>> _result) {
  TaskHandle? _resultObject;
  try {
    _resultObject = (_obj as RoutingInterface).calculatePrivateBusRoute(heresdkRoutingCommonBindingslistofSdkRoutingWaypointFromFfi(waypoints), sdkRoutingPrivatebusoptionsFromFfi(privateBusOptions), sdkRoutingCalculateroutecallbackFromFfi(callback));
    _result.value = sdkCoreThreadingTaskhandleToFfi(_resultObject);
  } finally {
    heresdkRoutingCommonBindingslistofSdkRoutingWaypointReleaseFfiHandle(waypoints);
    sdkRoutingPrivatebusoptionsReleaseFfiHandle(privateBusOptions);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacereturnToRouteStatic(Object _obj, Pointer<Void> route, Pointer<Void> startingPoint, double routeFractionTraveled, Pointer<Void> callback, Pointer<Pointer<Void>> _result) {
  TaskHandle? _resultObject;
  try {
    _resultObject = (_obj as RoutingInterface).returnToRoute(sdkRoutingRouteFromFfi(route), sdkRoutingWaypointFromFfi(startingPoint), (routeFractionTraveled), sdkRoutingCalculateroutecallbackFromFfi(callback));
    _result.value = sdkCoreThreadingTaskhandleToFfi(_resultObject);
  } finally {
    sdkRoutingRouteReleaseFfiHandle(route);
    sdkRoutingWaypointReleaseFfiHandle(startingPoint);
    
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}
int _sdkRoutingRoutinginterfacereturnToRouteWithTraveledDistanceStatic(Object _obj, Pointer<Void> route, Pointer<Void> startingPoint, int lastTraveledSectionIndex, int traveledDistanceOnLastSectionInMeters, Pointer<Void> callback, Pointer<Pointer<Void>> _result) {
  TaskHandle? _resultObject;
  try {
    _resultObject = (_obj as RoutingInterface).returnToRouteWithTraveledDistance(sdkRoutingRouteFromFfi(route), sdkRoutingWaypointFromFfi(startingPoint), (lastTraveledSectionIndex), (traveledDistanceOnLastSectionInMeters), sdkRoutingCalculateroutecallbackFromFfi(callback));
    _result.value = sdkCoreThreadingTaskhandleToFfi(_resultObject);
  } finally {
    sdkRoutingRouteReleaseFfiHandle(route);
    sdkRoutingWaypointReleaseFfiHandle(startingPoint);
    
    
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(callback);
  }
  return 0;
}


Pointer<Void> sdkRoutingRoutinginterfaceToFfi(RoutingInterface value) {
  if (value is __lib.NativeBase) return _sdkRoutingRoutinginterfaceCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkRoutingRoutinginterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkRoutingRoutinginterfacecalculateCarRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkRoutingRoutinginterfacecalculatePedestrianRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkRoutingRoutinginterfacecalculateTruckRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkRoutingRoutinginterfacecalculateScooterRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkRoutingRoutinginterfacecalculateBicycleRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkRoutingRoutinginterfacecalculateTaxiRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkRoutingRoutinginterfacecalculateEVCarRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkRoutingRoutinginterfacecalculateEVTruckRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkRoutingRoutinginterfacecalculateBusRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkRoutingRoutinginterfacecalculatePrivateBusRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>, Double, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkRoutingRoutinginterfacereturnToRouteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>, Int32, Int32, Pointer<Void>, Pointer<Pointer<Void>>)>(_sdkRoutingRoutinginterfacereturnToRouteWithTraveledDistanceStatic, __lib.unknownError)
  );

  return result;
}

RoutingInterface sdkRoutingRoutinginterfaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is RoutingInterface) return instance;

  final _typeIdHandle = _sdkRoutingRoutinginterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkRoutingRoutinginterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : RoutingInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkRoutingRoutinginterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkRoutingRoutinginterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingRoutinginterfaceReleaseHandle(handle);

Pointer<Void> sdkRoutingRoutinginterfaceToFfiNullable(RoutingInterface? value) =>
  value != null ? sdkRoutingRoutinginterfaceToFfi(value) : Pointer<Void>.fromAddress(0);

RoutingInterface? sdkRoutingRoutinginterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingRoutinginterfaceFromFfi(handle) : null;

void sdkRoutingRoutinginterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRoutinginterfaceReleaseHandle(handle);

// End of RoutingInterface "private" section.


