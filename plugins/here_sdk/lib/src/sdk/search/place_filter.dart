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
import 'package:here_sdk/src/sdk/transport/fuel_type.dart';
import 'package:here_sdk/src/sdk/transport/truck_class.dart';
import 'package:here_sdk/src/sdk/transport/truck_fuel_type.dart';

/// The filter options to specify a place.
///
/// Consists of fuel and truck options.

class PlaceFilter {
  /// The list of [FuelType] elements that should be used to find only
  /// the [FuelStation] search results that support all of them.
  /// This filter is available to use with the `SearchEngine` and
  /// `OfflineSearchEngine` (not available for all editions), however `OfflineSearchEngine`
  /// supports it only for `DIESEL`, `LPG`, `BIO_DIESEL`, `CNG`, `DIESEL_WITH_ADDITIVES`, `E10`,
  /// `E85`, `ETHANOL`, `ETHANOL_WITH_ADDITIVES`, `GASOLINE`, `HYDROGEN`, `LNG`, `MIDGRADE`,
  /// `PREMIUM` and `REGULAR` fuel types.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  List<FuelType> fuelTypes;

  /// The list of [TruckFuelType] elements that should be used to find only
  /// the [FuelStation] search results that support all of them.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  List<TruckFuelType> truckFuelTypes;

  /// Should be used to find only the [FuelStation] search results with minimum supported [TruckClass].
  /// This filter is only available to use with the `SearchEngine`.
  /// The `OfflineSearchEngine` (not available for all editions) does not apply this filter.
  /// [TruckClass.lightClass] is not accepted in the filter.
  /// Otherwise will result in [SearchError.invalidParameter].
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  TruckClass? truckClass;

  /// The filter option for electric vehicles.
  /// Implemented only for online SearchEngine.
  /// **Note:** Currently, this is a closed-alpha feature, so it is available only for selected
  /// customers.
  /// **Note:** Participants of the closed-alpha group can get access from HERE to use this feature.
  /// If the credentials are not enabled, a [SearchError.forbidden] will be propagated.
  PlaceFilterEv ev;

  /// Creates a new instance.

  /// [fuelTypes] The list of [FuelType] elements that should be used to find only
  /// the [FuelStation] search results that support all of them.
  /// This filter is available to use with the `SearchEngine` and
  /// `OfflineSearchEngine` (not available for all editions), however `OfflineSearchEngine`
  /// supports it only for `DIESEL`, `LPG`, `BIO_DIESEL`, `CNG`, `DIESEL_WITH_ADDITIVES`, `E10`,
  /// `E85`, `ETHANOL`, `ETHANOL_WITH_ADDITIVES`, `GASOLINE`, `HYDROGEN`, `LNG`, `MIDGRADE`,
  /// `PREMIUM` and `REGULAR` fuel types.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.

  /// [truckFuelTypes] The list of [TruckFuelType] elements that should be used to find only
  /// the [FuelStation] search results that support all of them.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.

  /// [truckClass] Should be used to find only the [FuelStation] search results with minimum supported [TruckClass].
  /// This filter is only available to use with the `SearchEngine`.
  /// The `OfflineSearchEngine` (not available for all editions) does not apply this filter.
  /// [TruckClass.lightClass] is not accepted in the filter.
  /// Otherwise will result in [SearchError.invalidParameter].
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.

  /// [ev] The filter option for electric vehicles.
  /// Implemented only for online SearchEngine.
  /// **Note:** Currently, this is a closed-alpha feature, so it is available only for selected
  /// customers.
  /// **Note:** Participants of the closed-alpha group can get access from HERE to use this feature.
  /// If the credentials are not enabled, a [SearchError.forbidden] will be propagated.

  PlaceFilter._(this.fuelTypes, this.truckFuelTypes, this.truckClass, this.ev);
  PlaceFilter()
    : fuelTypes = [], truckFuelTypes = [], truckClass = null, ev = PlaceFilterEv();
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PlaceFilter) return false;
    PlaceFilter _other = other;
    return DeepCollectionEquality().equals(fuelTypes, _other.fuelTypes) &&
        DeepCollectionEquality().equals(truckFuelTypes, _other.truckFuelTypes) &&
        truckClass == _other.truckClass &&
        ev == _other.ev;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(fuelTypes);
    result = 31 * result + DeepCollectionEquality().hash(truckFuelTypes);
    result = 31 * result + truckClass.hashCode;
    result = 31 * result + ev.hashCode;
    return result;
  }
}

/// The additional information that is available for electric vehicles.
///
/// **Note:** Currently, this is a closed-alpha feature, so it is available only for selected
/// customers.
/// **Note:** Participants of the closed-alpha group can get access from HERE to use this feature.
/// If the credentials are not enabled, a [SearchError.forbidden] will be propagated.

class PlaceFilterEv {
  /// Filter to retrieve EV charging stations with at least one connector of supplier names from the list.
  ///
  /// **Note:** Currently, this is a closed-alpha feature, so it is available only for selected
  /// customers.
  /// There could be a few bugs and unexpected behaviors.
  /// **Note:** Participants of the closed-alpha group can get access from HERE to use this feature.
  /// If the credentials are not enabled, a [SearchError.forbidden] will be propagated.
  /// Related APIs may change for new releases without a deprecation process.
  List<String> supplierNames;

  /// Filter to retrieve EV charging stations with at least one of the connector type IDs.
  /// For more information on the current connector types, see
  /// https://developer.here.com/documentation/charging-stations/dev_guide/topics/resource-type-connector-types.html
  ///
  /// **Note:** Currently, this is a closed-alpha feature, so it is available only for selected
  /// customers.
  /// There could be a few bugs and unexpected behaviors.
  /// **Note:** Participants of the closed-alpha group can get access from HERE to use this feature.
  /// If the credentials are not enabled, a [SearchError.forbidden] will be propagated.
  /// Related APIs may change for new releases without a deprecation process.
  List<String> connectorTypeIDs;

  /// Filter to retrieve EV charging stations with the given minimum charging power in KW
  /// delivered by at least one of the station EVSE.
  ///
  /// **Note:** Currently, this is a closed-alpha feature, so it is available only for selected
  /// customers.
  /// There could be a few bugs and unexpected behaviors.
  /// **Note:** Participants of the closed-alpha group can get access from HERE to use this feature.
  /// If the credentials are not enabled, a [SearchError.forbidden] will be propagated.
  /// Related APIs may change for new releases without a deprecation process.
  double? minPowerInKilowatts;

  /// Creates a new instance.

  /// [supplierNames] Filter to retrieve EV charging stations with at least one connector of supplier names from the list.
  ///
  /// **Note:** Currently, this is a closed-alpha feature, so it is available only for selected
  /// customers.
  /// There could be a few bugs and unexpected behaviors.
  /// **Note:** Participants of the closed-alpha group can get access from HERE to use this feature.
  /// If the credentials are not enabled, a [SearchError.forbidden] will be propagated.
  /// Related APIs may change for new releases without a deprecation process.

  /// [connectorTypeIDs] Filter to retrieve EV charging stations with at least one of the connector type IDs.
  /// For more information on the current connector types, see
  /// https://developer.here.com/documentation/charging-stations/dev_guide/topics/resource-type-connector-types.html
  ///
  /// **Note:** Currently, this is a closed-alpha feature, so it is available only for selected
  /// customers.
  /// There could be a few bugs and unexpected behaviors.
  /// **Note:** Participants of the closed-alpha group can get access from HERE to use this feature.
  /// If the credentials are not enabled, a [SearchError.forbidden] will be propagated.
  /// Related APIs may change for new releases without a deprecation process.

  /// [minPowerInKilowatts] Filter to retrieve EV charging stations with the given minimum charging power in KW
  /// delivered by at least one of the station EVSE.
  ///
  /// **Note:** Currently, this is a closed-alpha feature, so it is available only for selected
  /// customers.
  /// There could be a few bugs and unexpected behaviors.
  /// **Note:** Participants of the closed-alpha group can get access from HERE to use this feature.
  /// If the credentials are not enabled, a [SearchError.forbidden] will be propagated.
  /// Related APIs may change for new releases without a deprecation process.

  PlaceFilterEv._(this.supplierNames, this.connectorTypeIDs, this.minPowerInKilowatts);
  PlaceFilterEv()
    : supplierNames = [], connectorTypeIDs = [], minPowerInKilowatts = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PlaceFilterEv) return false;
    PlaceFilterEv _other = other;
    return DeepCollectionEquality().equals(supplierNames, _other.supplierNames) &&
        DeepCollectionEquality().equals(connectorTypeIDs, _other.connectorTypeIDs) &&
        minPowerInKilowatts == _other.minPowerInKilowatts;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(supplierNames);
    result = 31 * result + DeepCollectionEquality().hash(connectorTypeIDs);
    result = 31 * result + minPowerInKilowatts.hashCode;
    return result;
  }
}


// PlaceFilterEv "private" section, not exported.

final _sdkSearchPlacefilterEvCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_Ev_create_handle'));
final _sdkSearchPlacefilterEvReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_Ev_release_handle'));
final _sdkSearchPlacefilterEvGetFieldsupplierNames = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_Ev_get_field_supplierNames'));
final _sdkSearchPlacefilterEvGetFieldconnectorTypeIDs = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_Ev_get_field_connectorTypeIDs'));
final _sdkSearchPlacefilterEvGetFieldminPowerInKilowatts = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_Ev_get_field_minPowerInKilowatts'));



Pointer<Void> sdkSearchPlacefilterEvToFfi(PlaceFilterEv value) {
  final _supplierNamesHandle = heresdkSearchCommonBindingslistofStringToFfi(value.supplierNames);
  final _connectorTypeIDsHandle = heresdkSearchCommonBindingslistofStringToFfi(value.connectorTypeIDs);
  final _minPowerInKilowattsHandle = doubleToFfiNullable(value.minPowerInKilowatts);
  final _result = _sdkSearchPlacefilterEvCreateHandle(_supplierNamesHandle, _connectorTypeIDsHandle, _minPowerInKilowattsHandle);
  heresdkSearchCommonBindingslistofStringReleaseFfiHandle(_supplierNamesHandle);
  heresdkSearchCommonBindingslistofStringReleaseFfiHandle(_connectorTypeIDsHandle);
  doubleReleaseFfiHandleNullable(_minPowerInKilowattsHandle);
  return _result;
}

PlaceFilterEv sdkSearchPlacefilterEvFromFfi(Pointer<Void> handle) {
  final _supplierNamesHandle = _sdkSearchPlacefilterEvGetFieldsupplierNames(handle);
  final _connectorTypeIDsHandle = _sdkSearchPlacefilterEvGetFieldconnectorTypeIDs(handle);
  final _minPowerInKilowattsHandle = _sdkSearchPlacefilterEvGetFieldminPowerInKilowatts(handle);
  try {
    return PlaceFilterEv._(
      heresdkSearchCommonBindingslistofStringFromFfi(_supplierNamesHandle), 
      heresdkSearchCommonBindingslistofStringFromFfi(_connectorTypeIDsHandle), 
      doubleFromFfiNullable(_minPowerInKilowattsHandle)
    );
  } finally {
    heresdkSearchCommonBindingslistofStringReleaseFfiHandle(_supplierNamesHandle);
    heresdkSearchCommonBindingslistofStringReleaseFfiHandle(_connectorTypeIDsHandle);
    doubleReleaseFfiHandleNullable(_minPowerInKilowattsHandle);
  }
}

void sdkSearchPlacefilterEvReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchPlacefilterEvReleaseHandle(handle);

// Nullable PlaceFilterEv

final _sdkSearchPlacefilterEvCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_Ev_create_handle_nullable'));
final _sdkSearchPlacefilterEvReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_Ev_release_handle_nullable'));
final _sdkSearchPlacefilterEvGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_Ev_get_value_nullable'));

Pointer<Void> sdkSearchPlacefilterEvToFfiNullable(PlaceFilterEv? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchPlacefilterEvToFfi(value);
  final result = _sdkSearchPlacefilterEvCreateHandleNullable(_handle);
  sdkSearchPlacefilterEvReleaseFfiHandle(_handle);
  return result;
}

PlaceFilterEv? sdkSearchPlacefilterEvFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchPlacefilterEvGetValueNullable(handle);
  final result = sdkSearchPlacefilterEvFromFfi(_handle);
  sdkSearchPlacefilterEvReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchPlacefilterEvReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchPlacefilterEvReleaseHandleNullable(handle);

// End of PlaceFilterEv "private" section.

// PlaceFilter "private" section, not exported.

final _sdkSearchPlacefilterCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_create_handle'));
final _sdkSearchPlacefilterReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_release_handle'));
final _sdkSearchPlacefilterGetFieldfuelTypes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_get_field_fuelTypes'));
final _sdkSearchPlacefilterGetFieldtruckFuelTypes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_get_field_truckFuelTypes'));
final _sdkSearchPlacefilterGetFieldtruckClass = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_get_field_truckClass'));
final _sdkSearchPlacefilterGetFieldev = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_get_field_ev'));



Pointer<Void> sdkSearchPlacefilterToFfi(PlaceFilter value) {
  final _fuelTypesHandle = heresdkSearchCommonBindingslistofSdkTransportFueltypeToFfi(value.fuelTypes);
  final _truckFuelTypesHandle = heresdkSearchCommonBindingslistofSdkTransportTruckfueltypeToFfi(value.truckFuelTypes);
  final _truckClassHandle = sdkTransportTruckclassToFfiNullable(value.truckClass);
  final _evHandle = sdkSearchPlacefilterEvToFfi(value.ev);
  final _result = _sdkSearchPlacefilterCreateHandle(_fuelTypesHandle, _truckFuelTypesHandle, _truckClassHandle, _evHandle);
  heresdkSearchCommonBindingslistofSdkTransportFueltypeReleaseFfiHandle(_fuelTypesHandle);
  heresdkSearchCommonBindingslistofSdkTransportTruckfueltypeReleaseFfiHandle(_truckFuelTypesHandle);
  sdkTransportTruckclassReleaseFfiHandleNullable(_truckClassHandle);
  sdkSearchPlacefilterEvReleaseFfiHandle(_evHandle);
  return _result;
}

PlaceFilter sdkSearchPlacefilterFromFfi(Pointer<Void> handle) {
  final _fuelTypesHandle = _sdkSearchPlacefilterGetFieldfuelTypes(handle);
  final _truckFuelTypesHandle = _sdkSearchPlacefilterGetFieldtruckFuelTypes(handle);
  final _truckClassHandle = _sdkSearchPlacefilterGetFieldtruckClass(handle);
  final _evHandle = _sdkSearchPlacefilterGetFieldev(handle);
  try {
    return PlaceFilter._(
      heresdkSearchCommonBindingslistofSdkTransportFueltypeFromFfi(_fuelTypesHandle), 
      heresdkSearchCommonBindingslistofSdkTransportTruckfueltypeFromFfi(_truckFuelTypesHandle), 
      sdkTransportTruckclassFromFfiNullable(_truckClassHandle), 
      sdkSearchPlacefilterEvFromFfi(_evHandle)
    );
  } finally {
    heresdkSearchCommonBindingslistofSdkTransportFueltypeReleaseFfiHandle(_fuelTypesHandle);
    heresdkSearchCommonBindingslistofSdkTransportTruckfueltypeReleaseFfiHandle(_truckFuelTypesHandle);
    sdkTransportTruckclassReleaseFfiHandleNullable(_truckClassHandle);
    sdkSearchPlacefilterEvReleaseFfiHandle(_evHandle);
  }
}

void sdkSearchPlacefilterReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchPlacefilterReleaseHandle(handle);

// Nullable PlaceFilter

final _sdkSearchPlacefilterCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_create_handle_nullable'));
final _sdkSearchPlacefilterReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_release_handle_nullable'));
final _sdkSearchPlacefilterGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFilter_get_value_nullable'));

Pointer<Void> sdkSearchPlacefilterToFfiNullable(PlaceFilter? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchPlacefilterToFfi(value);
  final result = _sdkSearchPlacefilterCreateHandleNullable(_handle);
  sdkSearchPlacefilterReleaseFfiHandle(_handle);
  return result;
}

PlaceFilter? sdkSearchPlacefilterFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchPlacefilterGetValueNullable(handle);
  final result = sdkSearchPlacefilterFromFfi(_handle);
  sdkSearchPlacefilterReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchPlacefilterReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchPlacefilterReleaseHandleNullable(handle);

// End of PlaceFilter "private" section.


