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
import 'package:here_sdk/src/sdk/routing/bicycle_options.dart';
import 'package:here_sdk/src/sdk/routing/bus_options.dart';
import 'package:here_sdk/src/sdk/routing/car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_truck_options.dart';
import 'package:here_sdk/src/sdk/routing/pedestrian_options.dart';
import 'package:here_sdk/src/sdk/routing/private_bus_options.dart';
import 'package:here_sdk/src/sdk/routing/scooter_options.dart';
import 'package:here_sdk/src/sdk/routing/taxi_options.dart';
import 'package:here_sdk/src/sdk/routing/truck_options.dart';
import 'package:here_sdk/src/sdk/transport/transport_mode.dart';
import 'package:meta/meta.dart';

/// The options to specify how to refresh an already calculated route identified by a [RouteHandle].
///
/// All the
/// options that may result in a new route shape are ignored as no new route is calculated. Instead, only the data that
/// accompanies a route, such as traffic information, can be refreshed. Therefore, the following route options are ignored:
/// [RouteOptions.alternatives], [RouteOptions.arrivalTime], and [RouteOptions.optimizationMode].
/// If new [AvoidanceOptions] are specified, they are ignored as well and instead new [SectionNotice]'s
/// are generated that indicate where the requested [AvoidanceOptions] are violated. Note that when
/// [EVCarOptions.ensureReachability] is set to true, the route refresh request will fail as this option
/// is incompatible with a fixed route shape.
/// If any of the ignored options are important, consider calculating a new route instead.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
abstract class RefreshRouteOptions {
  /// Constructs a RefreshRouteOptions object with [TransportMode].
  ///
  /// [transportMode] Updates the transport mode for the route.
  ///
  factory RefreshRouteOptions.withTransportMode(TransportMode transportMode) => $prototype.withTransportMode(transportMode);
  /// Constructs a RefreshRouteOptions object with [CarOptions].
  ///
  /// [carOptions] Converts the route to a car route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withCarOptions(CarOptions carOptions) => $prototype.withCarOptions(carOptions);
  /// Constructs a RefreshRouteOptions object with [TruckOptions].
  ///
  /// [truckOptions] Converts the route to a truck route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withTruckOptions(TruckOptions truckOptions) => $prototype.withTruckOptions(truckOptions);
  /// Constructs a RefreshRouteOptions object with [PedestrianOptions].
  ///
  /// [pedestrianOptions] Converts the route to a pedestrian route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withPedestrianOptions(PedestrianOptions pedestrianOptions) => $prototype.withPedestrianOptions(pedestrianOptions);
  /// Constructs a RefreshRouteOptions object with [ScooterOptions].
  ///
  /// [scooterOptions] Converts the route to a scooter route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withScooterOptions(ScooterOptions scooterOptions) => $prototype.withScooterOptions(scooterOptions);
  /// Constructs a RefreshRouteOptions object with [TaxiOptions].
  ///
  /// [taxiOptions] Converts the route to a taxi route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withTaxiOptions(TaxiOptions taxiOptions) => $prototype.withTaxiOptions(taxiOptions);
  /// Constructs a RefreshRouteOptions object with [EVCarOptions].
  ///
  /// [evCarOptions] Converts the route to an electric car route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withEVCarOptions(EVCarOptions evCarOptions) => $prototype.withEVCarOptions(evCarOptions);
  /// Constructs a RefreshRouteOptions object with [EVTruckOptions].
  ///
  /// [evTruckOptions] Converts the route to an electric truck route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withEVTruckOptions(EVTruckOptions evTruckOptions) => $prototype.withEVTruckOptions(evTruckOptions);
  /// Constructs a RefreshRouteOptions object with [BicycleOptions].
  ///
  /// [bicycleOptions] Converts the route to a bicycle route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withBicycleOptions(BicycleOptions bicycleOptions) => $prototype.withBicycleOptions(bicycleOptions);
  /// Constructs a RefreshRouteOptions object with [BusOptions].
  ///
  /// [busOptions] Converts the route to a bus route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withBusOptions(BusOptions busOptions) => $prototype.withBusOptions(busOptions);
  /// Constructs a RefreshRouteOptions object with [PrivateBusOptions].
  ///
  /// [privateBusOptions] Converts the route to a private bus route, if a different transport mode was used for the
  /// [RouteHandle]. Note that in case this is not possible,
  /// an [RoutingError.noRouteFound] error will be triggered.
  ///
  factory RefreshRouteOptions.withPrivateBusOptions(PrivateBusOptions privateBusOptions) => $prototype.withPrivateBusOptions(privateBusOptions);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = RefreshRouteOptions$Impl(Pointer<Void>.fromAddress(0));
}


// RefreshRouteOptions "private" section, not exported.

final _sdkRoutingRefreshrouteoptionsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_routing_RefreshRouteOptions_register_finalizer'));
final _sdkRoutingRefreshrouteoptionsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RefreshRouteOptions_copy_handle'));
final _sdkRoutingRefreshrouteoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RefreshRouteOptions_release_handle'));













/// @nodoc
@visibleForTesting
class RefreshRouteOptions$Impl extends __lib.NativeBase implements RefreshRouteOptions {

  RefreshRouteOptions$Impl(Pointer<Void> handle) : super(handle);


  RefreshRouteOptions withTransportMode(TransportMode transportMode) {
    final _result_handle = _withTransportMode(transportMode);
    final _result = RefreshRouteOptions$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingRefreshrouteoptionsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  RefreshRouteOptions withCarOptions(CarOptions carOptions) {
    final _result_handle = _withCarOptions(carOptions);
    final _result = RefreshRouteOptions$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingRefreshrouteoptionsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  RefreshRouteOptions withTruckOptions(TruckOptions truckOptions) {
    final _result_handle = _withTruckOptions(truckOptions);
    final _result = RefreshRouteOptions$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingRefreshrouteoptionsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  RefreshRouteOptions withPedestrianOptions(PedestrianOptions pedestrianOptions) {
    final _result_handle = _withPedestrianOptions(pedestrianOptions);
    final _result = RefreshRouteOptions$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingRefreshrouteoptionsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  RefreshRouteOptions withScooterOptions(ScooterOptions scooterOptions) {
    final _result_handle = _withScooterOptions(scooterOptions);
    final _result = RefreshRouteOptions$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingRefreshrouteoptionsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  RefreshRouteOptions withTaxiOptions(TaxiOptions taxiOptions) {
    final _result_handle = _withTaxiOptions(taxiOptions);
    final _result = RefreshRouteOptions$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingRefreshrouteoptionsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  RefreshRouteOptions withEVCarOptions(EVCarOptions evCarOptions) {
    final _result_handle = _withEVCarOptions(evCarOptions);
    final _result = RefreshRouteOptions$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingRefreshrouteoptionsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  RefreshRouteOptions withEVTruckOptions(EVTruckOptions evTruckOptions) {
    final _result_handle = _withEVTruckOptions(evTruckOptions);
    final _result = RefreshRouteOptions$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingRefreshrouteoptionsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  RefreshRouteOptions withBicycleOptions(BicycleOptions bicycleOptions) {
    final _result_handle = _withBicycleOptions(bicycleOptions);
    final _result = RefreshRouteOptions$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingRefreshrouteoptionsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  RefreshRouteOptions withBusOptions(BusOptions busOptions) {
    final _result_handle = _withBusOptions(busOptions);
    final _result = RefreshRouteOptions$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingRefreshrouteoptionsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  RefreshRouteOptions withPrivateBusOptions(PrivateBusOptions privateBusOptions) {
    final _result_handle = _withPrivateBusOptions(privateBusOptions);
    final _result = RefreshRouteOptions$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingRefreshrouteoptionsRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _withTransportMode(TransportMode transportMode) {
    final _withTransportModeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32), Pointer<Void> Function(int, int)>('here_sdk_sdk_routing_RefreshRouteOptions_make__TransportMode'));
    final _transportModeHandle = sdkTransportTransportmodeToFfi(transportMode);
    final __resultHandle = _withTransportModeFfi(__lib.LibraryContext.isolateId, _transportModeHandle);
    sdkTransportTransportmodeReleaseFfiHandle(_transportModeHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withCarOptions(CarOptions carOptions) {
    final _withCarOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__CarOptions'));
    final _carOptionsHandle = sdkRoutingCaroptionsToFfi(carOptions);
    final __resultHandle = _withCarOptionsFfi(__lib.LibraryContext.isolateId, _carOptionsHandle);
    sdkRoutingCaroptionsReleaseFfiHandle(_carOptionsHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withTruckOptions(TruckOptions truckOptions) {
    final _withTruckOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__TruckOptions'));
    final _truckOptionsHandle = sdkRoutingTruckoptionsToFfi(truckOptions);
    final __resultHandle = _withTruckOptionsFfi(__lib.LibraryContext.isolateId, _truckOptionsHandle);
    sdkRoutingTruckoptionsReleaseFfiHandle(_truckOptionsHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withPedestrianOptions(PedestrianOptions pedestrianOptions) {
    final _withPedestrianOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__PedestrianOptions'));
    final _pedestrianOptionsHandle = sdkRoutingPedestrianoptionsToFfi(pedestrianOptions);
    final __resultHandle = _withPedestrianOptionsFfi(__lib.LibraryContext.isolateId, _pedestrianOptionsHandle);
    sdkRoutingPedestrianoptionsReleaseFfiHandle(_pedestrianOptionsHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withScooterOptions(ScooterOptions scooterOptions) {
    final _withScooterOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__ScooterOptions'));
    final _scooterOptionsHandle = sdkRoutingScooteroptionsToFfi(scooterOptions);
    final __resultHandle = _withScooterOptionsFfi(__lib.LibraryContext.isolateId, _scooterOptionsHandle);
    sdkRoutingScooteroptionsReleaseFfiHandle(_scooterOptionsHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withTaxiOptions(TaxiOptions taxiOptions) {
    final _withTaxiOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__TaxiOptions'));
    final _taxiOptionsHandle = sdkRoutingTaxioptionsToFfi(taxiOptions);
    final __resultHandle = _withTaxiOptionsFfi(__lib.LibraryContext.isolateId, _taxiOptionsHandle);
    sdkRoutingTaxioptionsReleaseFfiHandle(_taxiOptionsHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withEVCarOptions(EVCarOptions evCarOptions) {
    final _withEVCarOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__EVCarOptions'));
    final _evCarOptionsHandle = sdkRoutingEvcaroptionsToFfi(evCarOptions);
    final __resultHandle = _withEVCarOptionsFfi(__lib.LibraryContext.isolateId, _evCarOptionsHandle);
    sdkRoutingEvcaroptionsReleaseFfiHandle(_evCarOptionsHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withEVTruckOptions(EVTruckOptions evTruckOptions) {
    final _withEVTruckOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__EVTruckOptions'));
    final _evTruckOptionsHandle = sdkRoutingEvtruckoptionsToFfi(evTruckOptions);
    final __resultHandle = _withEVTruckOptionsFfi(__lib.LibraryContext.isolateId, _evTruckOptionsHandle);
    sdkRoutingEvtruckoptionsReleaseFfiHandle(_evTruckOptionsHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withBicycleOptions(BicycleOptions bicycleOptions) {
    final _withBicycleOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__BicycleOptions'));
    final _bicycleOptionsHandle = sdkRoutingBicycleoptionsToFfi(bicycleOptions);
    final __resultHandle = _withBicycleOptionsFfi(__lib.LibraryContext.isolateId, _bicycleOptionsHandle);
    sdkRoutingBicycleoptionsReleaseFfiHandle(_bicycleOptionsHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withBusOptions(BusOptions busOptions) {
    final _withBusOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__BusOptions'));
    final _busOptionsHandle = sdkRoutingBusoptionsToFfi(busOptions);
    final __resultHandle = _withBusOptionsFfi(__lib.LibraryContext.isolateId, _busOptionsHandle);
    sdkRoutingBusoptionsReleaseFfiHandle(_busOptionsHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withPrivateBusOptions(PrivateBusOptions privateBusOptions) {
    final _withPrivateBusOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_RefreshRouteOptions_make__PrivateBusOptions'));
    final _privateBusOptionsHandle = sdkRoutingPrivatebusoptionsToFfi(privateBusOptions);
    final __resultHandle = _withPrivateBusOptionsFfi(__lib.LibraryContext.isolateId, _privateBusOptionsHandle);
    sdkRoutingPrivatebusoptionsReleaseFfiHandle(_privateBusOptionsHandle);
    return __resultHandle;
  }


}

Pointer<Void> sdkRoutingRefreshrouteoptionsToFfi(RefreshRouteOptions value) =>
  _sdkRoutingRefreshrouteoptionsCopyHandle((value as __lib.NativeBase).handle);

RefreshRouteOptions sdkRoutingRefreshrouteoptionsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is RefreshRouteOptions) return instance;

  final _copiedHandle = _sdkRoutingRefreshrouteoptionsCopyHandle(handle);
  final result = RefreshRouteOptions$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkRoutingRefreshrouteoptionsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkRoutingRefreshrouteoptionsReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingRefreshrouteoptionsReleaseHandle(handle);

Pointer<Void> sdkRoutingRefreshrouteoptionsToFfiNullable(RefreshRouteOptions? value) =>
  value != null ? sdkRoutingRefreshrouteoptionsToFfi(value) : Pointer<Void>.fromAddress(0);

RefreshRouteOptions? sdkRoutingRefreshrouteoptionsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingRefreshrouteoptionsFromFfi(handle) : null;

void sdkRoutingRefreshrouteoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRefreshrouteoptionsReleaseHandle(handle);

// End of RefreshRouteOptions "private" section.


