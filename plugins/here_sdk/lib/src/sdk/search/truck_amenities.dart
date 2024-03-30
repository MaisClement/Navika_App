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

/// Truck amenities struct, represents availability (true/false) for each feature,
/// except shower_count - number of showers, if data is available.
///
/// Note: This is a BETA feature and thus subject to change.

class TruckAmenities {
  /// Has parking
  bool hasParking;

  /// Has secure parking
  bool hasSecureParking;

  /// Has car wash
  bool hasCarWash;

  /// Has truck wash
  bool hasTruckWash;

  /// Has high canopy
  bool hasHighCanopy;

  /// Has idle reduction system
  bool hasIdleReductionSystem;

  /// Has truck scales
  bool hasTruckScales;

  /// Has power supply
  bool hasPowerSupply;

  /// Has chemical toilet disposal
  bool hasChemicalToiletDisposal;

  /// Has truck stop
  bool hasTruckStop;

  /// Has WiFi
  bool hasWifi;

  /// Has truck service
  bool hasTruckService;

  /// Has shower
  bool hasShower;

  /// Shower count, if shower data is present
  int? showerCount;

  /// Creates a new instance.

  /// [hasParking] Has parking

  /// [hasSecureParking] Has secure parking

  /// [hasCarWash] Has car wash

  /// [hasTruckWash] Has truck wash

  /// [hasHighCanopy] Has high canopy

  /// [hasIdleReductionSystem] Has idle reduction system

  /// [hasTruckScales] Has truck scales

  /// [hasPowerSupply] Has power supply

  /// [hasChemicalToiletDisposal] Has chemical toilet disposal

  /// [hasTruckStop] Has truck stop

  /// [hasWifi] Has WiFi

  /// [hasTruckService] Has truck service

  /// [hasShower] Has shower

  /// [showerCount] Shower count, if shower data is present

  TruckAmenities._(this.hasParking, this.hasSecureParking, this.hasCarWash, this.hasTruckWash, this.hasHighCanopy, this.hasIdleReductionSystem, this.hasTruckScales, this.hasPowerSupply, this.hasChemicalToiletDisposal, this.hasTruckStop, this.hasWifi, this.hasTruckService, this.hasShower, this.showerCount);
  TruckAmenities()
    : hasParking = false, hasSecureParking = false, hasCarWash = false, hasTruckWash = false, hasHighCanopy = false, hasIdleReductionSystem = false, hasTruckScales = false, hasPowerSupply = false, hasChemicalToiletDisposal = false, hasTruckStop = false, hasWifi = false, hasTruckService = false, hasShower = false, showerCount = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TruckAmenities) return false;
    TruckAmenities _other = other;
    return hasParking == _other.hasParking &&
        hasSecureParking == _other.hasSecureParking &&
        hasCarWash == _other.hasCarWash &&
        hasTruckWash == _other.hasTruckWash &&
        hasHighCanopy == _other.hasHighCanopy &&
        hasIdleReductionSystem == _other.hasIdleReductionSystem &&
        hasTruckScales == _other.hasTruckScales &&
        hasPowerSupply == _other.hasPowerSupply &&
        hasChemicalToiletDisposal == _other.hasChemicalToiletDisposal &&
        hasTruckStop == _other.hasTruckStop &&
        hasWifi == _other.hasWifi &&
        hasTruckService == _other.hasTruckService &&
        hasShower == _other.hasShower &&
        showerCount == _other.showerCount;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + hasParking.hashCode;
    result = 31 * result + hasSecureParking.hashCode;
    result = 31 * result + hasCarWash.hashCode;
    result = 31 * result + hasTruckWash.hashCode;
    result = 31 * result + hasHighCanopy.hashCode;
    result = 31 * result + hasIdleReductionSystem.hashCode;
    result = 31 * result + hasTruckScales.hashCode;
    result = 31 * result + hasPowerSupply.hashCode;
    result = 31 * result + hasChemicalToiletDisposal.hashCode;
    result = 31 * result + hasTruckStop.hashCode;
    result = 31 * result + hasWifi.hashCode;
    result = 31 * result + hasTruckService.hashCode;
    result = 31 * result + hasShower.hashCode;
    result = 31 * result + showerCount.hashCode;
    return result;
  }
}


// TruckAmenities "private" section, not exported.

final _sdkSearchTruckamenitiesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Pointer<Void>),
    Pointer<Void> Function(int, int, int, int, int, int, int, int, int, int, int, int, int, Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_create_handle'));
final _sdkSearchTruckamenitiesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_release_handle'));
final _sdkSearchTruckamenitiesGetFieldhasParking = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_get_field_hasParking'));
final _sdkSearchTruckamenitiesGetFieldhasSecureParking = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_get_field_hasSecureParking'));
final _sdkSearchTruckamenitiesGetFieldhasCarWash = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_get_field_hasCarWash'));
final _sdkSearchTruckamenitiesGetFieldhasTruckWash = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_get_field_hasTruckWash'));
final _sdkSearchTruckamenitiesGetFieldhasHighCanopy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_get_field_hasHighCanopy'));
final _sdkSearchTruckamenitiesGetFieldhasIdleReductionSystem = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_get_field_hasIdleReductionSystem'));
final _sdkSearchTruckamenitiesGetFieldhasTruckScales = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_get_field_hasTruckScales'));
final _sdkSearchTruckamenitiesGetFieldhasPowerSupply = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_get_field_hasPowerSupply'));
final _sdkSearchTruckamenitiesGetFieldhasChemicalToiletDisposal = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_get_field_hasChemicalToiletDisposal'));
final _sdkSearchTruckamenitiesGetFieldhasTruckStop = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_get_field_hasTruckStop'));
final _sdkSearchTruckamenitiesGetFieldhasWifi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_get_field_hasWifi'));
final _sdkSearchTruckamenitiesGetFieldhasTruckService = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_get_field_hasTruckService'));
final _sdkSearchTruckamenitiesGetFieldhasShower = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_get_field_hasShower'));
final _sdkSearchTruckamenitiesGetFieldshowerCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_get_field_showerCount'));



Pointer<Void> sdkSearchTruckamenitiesToFfi(TruckAmenities value) {
  final _hasParkingHandle = booleanToFfi(value.hasParking);
  final _hasSecureParkingHandle = booleanToFfi(value.hasSecureParking);
  final _hasCarWashHandle = booleanToFfi(value.hasCarWash);
  final _hasTruckWashHandle = booleanToFfi(value.hasTruckWash);
  final _hasHighCanopyHandle = booleanToFfi(value.hasHighCanopy);
  final _hasIdleReductionSystemHandle = booleanToFfi(value.hasIdleReductionSystem);
  final _hasTruckScalesHandle = booleanToFfi(value.hasTruckScales);
  final _hasPowerSupplyHandle = booleanToFfi(value.hasPowerSupply);
  final _hasChemicalToiletDisposalHandle = booleanToFfi(value.hasChemicalToiletDisposal);
  final _hasTruckStopHandle = booleanToFfi(value.hasTruckStop);
  final _hasWifiHandle = booleanToFfi(value.hasWifi);
  final _hasTruckServiceHandle = booleanToFfi(value.hasTruckService);
  final _hasShowerHandle = booleanToFfi(value.hasShower);
  final _showerCountHandle = intToFfiNullable(value.showerCount);
  final _result = _sdkSearchTruckamenitiesCreateHandle(_hasParkingHandle, _hasSecureParkingHandle, _hasCarWashHandle, _hasTruckWashHandle, _hasHighCanopyHandle, _hasIdleReductionSystemHandle, _hasTruckScalesHandle, _hasPowerSupplyHandle, _hasChemicalToiletDisposalHandle, _hasTruckStopHandle, _hasWifiHandle, _hasTruckServiceHandle, _hasShowerHandle, _showerCountHandle);
  booleanReleaseFfiHandle(_hasParkingHandle);
  booleanReleaseFfiHandle(_hasSecureParkingHandle);
  booleanReleaseFfiHandle(_hasCarWashHandle);
  booleanReleaseFfiHandle(_hasTruckWashHandle);
  booleanReleaseFfiHandle(_hasHighCanopyHandle);
  booleanReleaseFfiHandle(_hasIdleReductionSystemHandle);
  booleanReleaseFfiHandle(_hasTruckScalesHandle);
  booleanReleaseFfiHandle(_hasPowerSupplyHandle);
  booleanReleaseFfiHandle(_hasChemicalToiletDisposalHandle);
  booleanReleaseFfiHandle(_hasTruckStopHandle);
  booleanReleaseFfiHandle(_hasWifiHandle);
  booleanReleaseFfiHandle(_hasTruckServiceHandle);
  booleanReleaseFfiHandle(_hasShowerHandle);
  intReleaseFfiHandleNullable(_showerCountHandle);
  return _result;
}

TruckAmenities sdkSearchTruckamenitiesFromFfi(Pointer<Void> handle) {
  final _hasParkingHandle = _sdkSearchTruckamenitiesGetFieldhasParking(handle);
  final _hasSecureParkingHandle = _sdkSearchTruckamenitiesGetFieldhasSecureParking(handle);
  final _hasCarWashHandle = _sdkSearchTruckamenitiesGetFieldhasCarWash(handle);
  final _hasTruckWashHandle = _sdkSearchTruckamenitiesGetFieldhasTruckWash(handle);
  final _hasHighCanopyHandle = _sdkSearchTruckamenitiesGetFieldhasHighCanopy(handle);
  final _hasIdleReductionSystemHandle = _sdkSearchTruckamenitiesGetFieldhasIdleReductionSystem(handle);
  final _hasTruckScalesHandle = _sdkSearchTruckamenitiesGetFieldhasTruckScales(handle);
  final _hasPowerSupplyHandle = _sdkSearchTruckamenitiesGetFieldhasPowerSupply(handle);
  final _hasChemicalToiletDisposalHandle = _sdkSearchTruckamenitiesGetFieldhasChemicalToiletDisposal(handle);
  final _hasTruckStopHandle = _sdkSearchTruckamenitiesGetFieldhasTruckStop(handle);
  final _hasWifiHandle = _sdkSearchTruckamenitiesGetFieldhasWifi(handle);
  final _hasTruckServiceHandle = _sdkSearchTruckamenitiesGetFieldhasTruckService(handle);
  final _hasShowerHandle = _sdkSearchTruckamenitiesGetFieldhasShower(handle);
  final _showerCountHandle = _sdkSearchTruckamenitiesGetFieldshowerCount(handle);
  try {
    return TruckAmenities._(
      booleanFromFfi(_hasParkingHandle), 
      booleanFromFfi(_hasSecureParkingHandle), 
      booleanFromFfi(_hasCarWashHandle), 
      booleanFromFfi(_hasTruckWashHandle), 
      booleanFromFfi(_hasHighCanopyHandle), 
      booleanFromFfi(_hasIdleReductionSystemHandle), 
      booleanFromFfi(_hasTruckScalesHandle), 
      booleanFromFfi(_hasPowerSupplyHandle), 
      booleanFromFfi(_hasChemicalToiletDisposalHandle), 
      booleanFromFfi(_hasTruckStopHandle), 
      booleanFromFfi(_hasWifiHandle), 
      booleanFromFfi(_hasTruckServiceHandle), 
      booleanFromFfi(_hasShowerHandle), 
      intFromFfiNullable(_showerCountHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_hasParkingHandle);
    booleanReleaseFfiHandle(_hasSecureParkingHandle);
    booleanReleaseFfiHandle(_hasCarWashHandle);
    booleanReleaseFfiHandle(_hasTruckWashHandle);
    booleanReleaseFfiHandle(_hasHighCanopyHandle);
    booleanReleaseFfiHandle(_hasIdleReductionSystemHandle);
    booleanReleaseFfiHandle(_hasTruckScalesHandle);
    booleanReleaseFfiHandle(_hasPowerSupplyHandle);
    booleanReleaseFfiHandle(_hasChemicalToiletDisposalHandle);
    booleanReleaseFfiHandle(_hasTruckStopHandle);
    booleanReleaseFfiHandle(_hasWifiHandle);
    booleanReleaseFfiHandle(_hasTruckServiceHandle);
    booleanReleaseFfiHandle(_hasShowerHandle);
    intReleaseFfiHandleNullable(_showerCountHandle);
  }
}

void sdkSearchTruckamenitiesReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchTruckamenitiesReleaseHandle(handle);

// Nullable TruckAmenities

final _sdkSearchTruckamenitiesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_create_handle_nullable'));
final _sdkSearchTruckamenitiesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_release_handle_nullable'));
final _sdkSearchTruckamenitiesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckAmenities_get_value_nullable'));

Pointer<Void> sdkSearchTruckamenitiesToFfiNullable(TruckAmenities? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchTruckamenitiesToFfi(value);
  final result = _sdkSearchTruckamenitiesCreateHandleNullable(_handle);
  sdkSearchTruckamenitiesReleaseFfiHandle(_handle);
  return result;
}

TruckAmenities? sdkSearchTruckamenitiesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchTruckamenitiesGetValueNullable(handle);
  final result = sdkSearchTruckamenitiesFromFfi(_handle);
  sdkSearchTruckamenitiesReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchTruckamenitiesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchTruckamenitiesReleaseHandleNullable(handle);

// End of TruckAmenities "private" section.


