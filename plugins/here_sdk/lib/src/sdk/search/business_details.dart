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
import 'package:here_sdk/src/sdk/search/contact.dart';
import 'package:here_sdk/src/sdk/search/e_v_charging_pool.dart';
import 'package:here_sdk/src/sdk/search/opening_hours.dart';

/// Contains place details such as contacts, opening hours and some electro vehicle info.

class BusinessDetails {
  /// The list of contact information of the place.
  List<Contact> contacts;

  /// The list of opening hours information of the place (not available in result of suggest request).
  List<OpeningHours> openingHours;

  /// EV charging pool details. It is available only for a place that is a charging pool
  /// for electric vehicles. Charging stations data are only available to users with
  /// valid contracts with HERE.
  /// This is a BETA feature and thus there can be bugs and unexpected behavior.
  EVChargingPool? evChargingPool;

  /// Creates a new instance.

  /// [contacts] The list of contact information of the place.

  /// [openingHours] The list of opening hours information of the place (not available in result of suggest request).

  /// [evChargingPool] EV charging pool details. It is available only for a place that is a charging pool
  /// for electric vehicles. Charging stations data are only available to users with
  /// valid contracts with HERE.
  /// This is a BETA feature and thus there can be bugs and unexpected behavior.

  BusinessDetails._(this.contacts, this.openingHours, this.evChargingPool);
  /// Creates a new instance.
  BusinessDetails()
      : contacts = [], openingHours = [], evChargingPool = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BusinessDetails) return false;
    BusinessDetails _other = other;
    return DeepCollectionEquality().equals(contacts, _other.contacts) &&
        DeepCollectionEquality().equals(openingHours, _other.openingHours) &&
        evChargingPool == _other.evChargingPool;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(contacts);
    result = 31 * result + DeepCollectionEquality().hash(openingHours);
    result = 31 * result + evChargingPool.hashCode;
    return result;
  }
}


// BusinessDetails "private" section, not exported.

final _sdkSearchBusinessdetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_BusinessDetails_create_handle'));
final _sdkSearchBusinessdetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_BusinessDetails_release_handle'));
final _sdkSearchBusinessdetailsGetFieldcontacts = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_BusinessDetails_get_field_contacts'));
final _sdkSearchBusinessdetailsGetFieldopeningHours = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_BusinessDetails_get_field_openingHours'));
final _sdkSearchBusinessdetailsGetFieldevChargingPool = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_BusinessDetails_get_field_evChargingPool'));



Pointer<Void> sdkSearchBusinessdetailsToFfi(BusinessDetails value) {
  final _contactsHandle = heresdkSearchCommonBindingslistofSdkSearchContactToFfi(value.contacts);
  final _openingHoursHandle = heresdkSearchCommonBindingslistofSdkSearchOpeninghoursToFfi(value.openingHours);
  final _evChargingPoolHandle = sdkSearchEvchargingpoolToFfiNullable(value.evChargingPool);
  final _result = _sdkSearchBusinessdetailsCreateHandle(_contactsHandle, _openingHoursHandle, _evChargingPoolHandle);
  heresdkSearchCommonBindingslistofSdkSearchContactReleaseFfiHandle(_contactsHandle);
  heresdkSearchCommonBindingslistofSdkSearchOpeninghoursReleaseFfiHandle(_openingHoursHandle);
  sdkSearchEvchargingpoolReleaseFfiHandleNullable(_evChargingPoolHandle);
  return _result;
}

BusinessDetails sdkSearchBusinessdetailsFromFfi(Pointer<Void> handle) {
  final _contactsHandle = _sdkSearchBusinessdetailsGetFieldcontacts(handle);
  final _openingHoursHandle = _sdkSearchBusinessdetailsGetFieldopeningHours(handle);
  final _evChargingPoolHandle = _sdkSearchBusinessdetailsGetFieldevChargingPool(handle);
  try {
    return BusinessDetails._(
      heresdkSearchCommonBindingslistofSdkSearchContactFromFfi(_contactsHandle), 
      heresdkSearchCommonBindingslistofSdkSearchOpeninghoursFromFfi(_openingHoursHandle), 
      sdkSearchEvchargingpoolFromFfiNullable(_evChargingPoolHandle)
    );
  } finally {
    heresdkSearchCommonBindingslistofSdkSearchContactReleaseFfiHandle(_contactsHandle);
    heresdkSearchCommonBindingslistofSdkSearchOpeninghoursReleaseFfiHandle(_openingHoursHandle);
    sdkSearchEvchargingpoolReleaseFfiHandleNullable(_evChargingPoolHandle);
  }
}

void sdkSearchBusinessdetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchBusinessdetailsReleaseHandle(handle);

// Nullable BusinessDetails

final _sdkSearchBusinessdetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_BusinessDetails_create_handle_nullable'));
final _sdkSearchBusinessdetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_BusinessDetails_release_handle_nullable'));
final _sdkSearchBusinessdetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_BusinessDetails_get_value_nullable'));

Pointer<Void> sdkSearchBusinessdetailsToFfiNullable(BusinessDetails? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchBusinessdetailsToFfi(value);
  final result = _sdkSearchBusinessdetailsCreateHandleNullable(_handle);
  sdkSearchBusinessdetailsReleaseFfiHandle(_handle);
  return result;
}

BusinessDetails? sdkSearchBusinessdetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchBusinessdetailsGetValueNullable(handle);
  final result = sdkSearchBusinessdetailsFromFfi(_handle);
  sdkSearchBusinessdetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchBusinessdetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchBusinessdetailsReleaseHandleNullable(handle);

// End of BusinessDetails "private" section.


