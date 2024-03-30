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
import 'package:here_sdk/src/sdk/search/generic_fuel.dart';
import 'package:here_sdk/src/sdk/search/truck_fuel.dart';

/// Contains information about a specific fuel station.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and
/// unexpected behaviors. Related APIs may change for new releases without a deprecation process.

class FuelStation {
  /// The list of car fuel types associated with the fuel station.
  /// The list can be empty when no generic fuels are offered or when the information is unknown.
  List<GenericFuel> fuels;

  /// The list of truck fuel types associated with the fuel station.
  /// The list can be empty when no truck fuels are offered or when the information is unknown.
  List<TruckFuel> truckFuels;

  /// Indicates if paying at the pump is supported or not. `null` means information is unknown.
  bool? payAtThePump;

  /// Indicates if high volume pumps are available or not. `null` means information is unknown.
  bool? highVolumePumps;

  /// Creates a new instance.

  /// [fuels] The list of car fuel types associated with the fuel station.
  /// The list can be empty when no generic fuels are offered or when the information is unknown.

  /// [truckFuels] The list of truck fuel types associated with the fuel station.
  /// The list can be empty when no truck fuels are offered or when the information is unknown.

  /// [payAtThePump] Indicates if paying at the pump is supported or not. `null` means information is unknown.

  /// [highVolumePumps] Indicates if high volume pumps are available or not. `null` means information is unknown.

  FuelStation._(this.fuels, this.truckFuels, this.payAtThePump, this.highVolumePumps);
  FuelStation()
    : fuels = [], truckFuels = [], payAtThePump = null, highVolumePumps = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FuelStation) return false;
    FuelStation _other = other;
    return DeepCollectionEquality().equals(fuels, _other.fuels) &&
        DeepCollectionEquality().equals(truckFuels, _other.truckFuels) &&
        payAtThePump == _other.payAtThePump &&
        highVolumePumps == _other.highVolumePumps;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(fuels);
    result = 31 * result + DeepCollectionEquality().hash(truckFuels);
    result = 31 * result + payAtThePump.hashCode;
    result = 31 * result + highVolumePumps.hashCode;
    return result;
  }
}


// FuelStation "private" section, not exported.

final _sdkSearchFuelstationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_FuelStation_create_handle'));
final _sdkSearchFuelstationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_FuelStation_release_handle'));
final _sdkSearchFuelstationGetFieldfuels = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_FuelStation_get_field_fuels'));
final _sdkSearchFuelstationGetFieldtruckFuels = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_FuelStation_get_field_truckFuels'));
final _sdkSearchFuelstationGetFieldpayAtThePump = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_FuelStation_get_field_payAtThePump'));
final _sdkSearchFuelstationGetFieldhighVolumePumps = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_FuelStation_get_field_highVolumePumps'));



Pointer<Void> sdkSearchFuelstationToFfi(FuelStation value) {
  final _fuelsHandle = heresdkSearchCommonBindingslistofSdkSearchGenericfuelToFfi(value.fuels);
  final _truckFuelsHandle = heresdkSearchCommonBindingslistofSdkSearchTruckfuelToFfi(value.truckFuels);
  final _payAtThePumpHandle = booleanToFfiNullable(value.payAtThePump);
  final _highVolumePumpsHandle = booleanToFfiNullable(value.highVolumePumps);
  final _result = _sdkSearchFuelstationCreateHandle(_fuelsHandle, _truckFuelsHandle, _payAtThePumpHandle, _highVolumePumpsHandle);
  heresdkSearchCommonBindingslistofSdkSearchGenericfuelReleaseFfiHandle(_fuelsHandle);
  heresdkSearchCommonBindingslistofSdkSearchTruckfuelReleaseFfiHandle(_truckFuelsHandle);
  booleanReleaseFfiHandleNullable(_payAtThePumpHandle);
  booleanReleaseFfiHandleNullable(_highVolumePumpsHandle);
  return _result;
}

FuelStation sdkSearchFuelstationFromFfi(Pointer<Void> handle) {
  final _fuelsHandle = _sdkSearchFuelstationGetFieldfuels(handle);
  final _truckFuelsHandle = _sdkSearchFuelstationGetFieldtruckFuels(handle);
  final _payAtThePumpHandle = _sdkSearchFuelstationGetFieldpayAtThePump(handle);
  final _highVolumePumpsHandle = _sdkSearchFuelstationGetFieldhighVolumePumps(handle);
  try {
    return FuelStation._(
      heresdkSearchCommonBindingslistofSdkSearchGenericfuelFromFfi(_fuelsHandle), 
      heresdkSearchCommonBindingslistofSdkSearchTruckfuelFromFfi(_truckFuelsHandle), 
      booleanFromFfiNullable(_payAtThePumpHandle), 
      booleanFromFfiNullable(_highVolumePumpsHandle)
    );
  } finally {
    heresdkSearchCommonBindingslistofSdkSearchGenericfuelReleaseFfiHandle(_fuelsHandle);
    heresdkSearchCommonBindingslistofSdkSearchTruckfuelReleaseFfiHandle(_truckFuelsHandle);
    booleanReleaseFfiHandleNullable(_payAtThePumpHandle);
    booleanReleaseFfiHandleNullable(_highVolumePumpsHandle);
  }
}

void sdkSearchFuelstationReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchFuelstationReleaseHandle(handle);

// Nullable FuelStation

final _sdkSearchFuelstationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_FuelStation_create_handle_nullable'));
final _sdkSearchFuelstationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_FuelStation_release_handle_nullable'));
final _sdkSearchFuelstationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_FuelStation_get_value_nullable'));

Pointer<Void> sdkSearchFuelstationToFfiNullable(FuelStation? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchFuelstationToFfi(value);
  final result = _sdkSearchFuelstationCreateHandleNullable(_handle);
  sdkSearchFuelstationReleaseFfiHandle(_handle);
  return result;
}

FuelStation? sdkSearchFuelstationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchFuelstationGetValueNullable(handle);
  final result = sdkSearchFuelstationFromFfi(_handle);
  sdkSearchFuelstationReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchFuelstationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchFuelstationReleaseHandleNullable(handle);

// End of FuelStation "private" section.


