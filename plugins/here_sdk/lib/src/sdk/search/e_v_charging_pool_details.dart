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

/// Electric vehicle charging pool details.
///
/// Note: This is a BETA feature and thus subject to change.

class EVChargingPoolDetails {
  /// Indicates if the Place offers EV charging to customer or the general public.
  bool? evChargingOnSite;

  /// The name of the EV Network that operates the charging station.
  /// Note: not all stations participate in a network.
  String? evNetwork;

  /// Represents the party of ownership provided by some suppliers.
  String? ownerInformation;

  /// When set to:
  /// `true` - payment and/or membership is required;
  /// `false` - payment is not required.
  bool? paymentIsRequired;

  /// Indicates if the charging stations can be reserved.
  /// Note: Reservable charging stations operate on a first-come/first served basis.
  bool? reservable;

  /// When set to `true` indicates that a valid subscription contract must be
  /// with the charging station vendor.
  bool? subscriptionIsRequired;

  /// Indicates the total number of stations available on the charging pool.
  int? totalNumberOfStations;

  /// Creates a new instance.

  /// [evChargingOnSite] Indicates if the Place offers EV charging to customer or the general public.

  /// [evNetwork] The name of the EV Network that operates the charging station.
  /// Note: not all stations participate in a network.

  /// [ownerInformation] Represents the party of ownership provided by some suppliers.

  /// [paymentIsRequired] When set to:
  /// `true` - payment and/or membership is required;
  /// `false` - payment is not required.

  /// [reservable] Indicates if the charging stations can be reserved.
  /// Note: Reservable charging stations operate on a first-come/first served basis.

  /// [subscriptionIsRequired] When set to `true` indicates that a valid subscription contract must be
  /// with the charging station vendor.

  /// [totalNumberOfStations] Indicates the total number of stations available on the charging pool.

  EVChargingPoolDetails._(this.evChargingOnSite, this.evNetwork, this.ownerInformation, this.paymentIsRequired, this.reservable, this.subscriptionIsRequired, this.totalNumberOfStations);
  EVChargingPoolDetails()
    : evChargingOnSite = null, evNetwork = null, ownerInformation = null, paymentIsRequired = null, reservable = null, subscriptionIsRequired = null, totalNumberOfStations = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EVChargingPoolDetails) return false;
    EVChargingPoolDetails _other = other;
    return evChargingOnSite == _other.evChargingOnSite &&
        evNetwork == _other.evNetwork &&
        ownerInformation == _other.ownerInformation &&
        paymentIsRequired == _other.paymentIsRequired &&
        reservable == _other.reservable &&
        subscriptionIsRequired == _other.subscriptionIsRequired &&
        totalNumberOfStations == _other.totalNumberOfStations;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + evChargingOnSite.hashCode;
    result = 31 * result + evNetwork.hashCode;
    result = 31 * result + ownerInformation.hashCode;
    result = 31 * result + paymentIsRequired.hashCode;
    result = 31 * result + reservable.hashCode;
    result = 31 * result + subscriptionIsRequired.hashCode;
    result = 31 * result + totalNumberOfStations.hashCode;
    return result;
  }
}


// EVChargingPoolDetails "private" section, not exported.

final _sdkSearchEvchargingpooldetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPoolDetails_create_handle'));
final _sdkSearchEvchargingpooldetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPoolDetails_release_handle'));
final _sdkSearchEvchargingpooldetailsGetFieldevChargingOnSite = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPoolDetails_get_field_evChargingOnSite'));
final _sdkSearchEvchargingpooldetailsGetFieldevNetwork = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPoolDetails_get_field_evNetwork'));
final _sdkSearchEvchargingpooldetailsGetFieldownerInformation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPoolDetails_get_field_ownerInformation'));
final _sdkSearchEvchargingpooldetailsGetFieldpaymentIsRequired = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPoolDetails_get_field_paymentIsRequired'));
final _sdkSearchEvchargingpooldetailsGetFieldreservable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPoolDetails_get_field_reservable'));
final _sdkSearchEvchargingpooldetailsGetFieldsubscriptionIsRequired = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPoolDetails_get_field_subscriptionIsRequired'));
final _sdkSearchEvchargingpooldetailsGetFieldtotalNumberOfStations = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPoolDetails_get_field_totalNumberOfStations'));



Pointer<Void> sdkSearchEvchargingpooldetailsToFfi(EVChargingPoolDetails value) {
  final _evChargingOnSiteHandle = booleanToFfiNullable(value.evChargingOnSite);
  final _evNetworkHandle = stringToFfiNullable(value.evNetwork);
  final _ownerInformationHandle = stringToFfiNullable(value.ownerInformation);
  final _paymentIsRequiredHandle = booleanToFfiNullable(value.paymentIsRequired);
  final _reservableHandle = booleanToFfiNullable(value.reservable);
  final _subscriptionIsRequiredHandle = booleanToFfiNullable(value.subscriptionIsRequired);
  final _totalNumberOfStationsHandle = uIntToFfiNullable(value.totalNumberOfStations);
  final _result = _sdkSearchEvchargingpooldetailsCreateHandle(_evChargingOnSiteHandle, _evNetworkHandle, _ownerInformationHandle, _paymentIsRequiredHandle, _reservableHandle, _subscriptionIsRequiredHandle, _totalNumberOfStationsHandle);
  booleanReleaseFfiHandleNullable(_evChargingOnSiteHandle);
  stringReleaseFfiHandleNullable(_evNetworkHandle);
  stringReleaseFfiHandleNullable(_ownerInformationHandle);
  booleanReleaseFfiHandleNullable(_paymentIsRequiredHandle);
  booleanReleaseFfiHandleNullable(_reservableHandle);
  booleanReleaseFfiHandleNullable(_subscriptionIsRequiredHandle);
  uIntReleaseFfiHandleNullable(_totalNumberOfStationsHandle);
  return _result;
}

EVChargingPoolDetails sdkSearchEvchargingpooldetailsFromFfi(Pointer<Void> handle) {
  final _evChargingOnSiteHandle = _sdkSearchEvchargingpooldetailsGetFieldevChargingOnSite(handle);
  final _evNetworkHandle = _sdkSearchEvchargingpooldetailsGetFieldevNetwork(handle);
  final _ownerInformationHandle = _sdkSearchEvchargingpooldetailsGetFieldownerInformation(handle);
  final _paymentIsRequiredHandle = _sdkSearchEvchargingpooldetailsGetFieldpaymentIsRequired(handle);
  final _reservableHandle = _sdkSearchEvchargingpooldetailsGetFieldreservable(handle);
  final _subscriptionIsRequiredHandle = _sdkSearchEvchargingpooldetailsGetFieldsubscriptionIsRequired(handle);
  final _totalNumberOfStationsHandle = _sdkSearchEvchargingpooldetailsGetFieldtotalNumberOfStations(handle);
  try {
    return EVChargingPoolDetails._(
      booleanFromFfiNullable(_evChargingOnSiteHandle), 
      stringFromFfiNullable(_evNetworkHandle), 
      stringFromFfiNullable(_ownerInformationHandle), 
      booleanFromFfiNullable(_paymentIsRequiredHandle), 
      booleanFromFfiNullable(_reservableHandle), 
      booleanFromFfiNullable(_subscriptionIsRequiredHandle), 
      uIntFromFfiNullable(_totalNumberOfStationsHandle)
    );
  } finally {
    booleanReleaseFfiHandleNullable(_evChargingOnSiteHandle);
    stringReleaseFfiHandleNullable(_evNetworkHandle);
    stringReleaseFfiHandleNullable(_ownerInformationHandle);
    booleanReleaseFfiHandleNullable(_paymentIsRequiredHandle);
    booleanReleaseFfiHandleNullable(_reservableHandle);
    booleanReleaseFfiHandleNullable(_subscriptionIsRequiredHandle);
    uIntReleaseFfiHandleNullable(_totalNumberOfStationsHandle);
  }
}

void sdkSearchEvchargingpooldetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchEvchargingpooldetailsReleaseHandle(handle);

// Nullable EVChargingPoolDetails

final _sdkSearchEvchargingpooldetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPoolDetails_create_handle_nullable'));
final _sdkSearchEvchargingpooldetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPoolDetails_release_handle_nullable'));
final _sdkSearchEvchargingpooldetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EVChargingPoolDetails_get_value_nullable'));

Pointer<Void> sdkSearchEvchargingpooldetailsToFfiNullable(EVChargingPoolDetails? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchEvchargingpooldetailsToFfi(value);
  final result = _sdkSearchEvchargingpooldetailsCreateHandleNullable(_handle);
  sdkSearchEvchargingpooldetailsReleaseFfiHandle(_handle);
  return result;
}

EVChargingPoolDetails? sdkSearchEvchargingpooldetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchEvchargingpooldetailsGetValueNullable(handle);
  final result = sdkSearchEvchargingpooldetailsFromFfi(_handle);
  sdkSearchEvchargingpooldetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchEvchargingpooldetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchEvchargingpooldetailsReleaseHandleNullable(handle);

// End of EVChargingPoolDetails "private" section.


