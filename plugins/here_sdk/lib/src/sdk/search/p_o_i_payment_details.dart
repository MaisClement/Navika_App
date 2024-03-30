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

/// Details about the payment options at the POI.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and
/// unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class POIPaymentDetails {
  /// Accepted payment methods.
  /// Currently supported methods are defined in [POIPaymentMethod].
  List<String> acceptedMethods;

  /// Accepted currencies for cash payment, represented by their ISO 4217 code, for example
  /// "EUR", "USD", "CNY" etc.
  /// See the full list of [ISO 421 codes](https://en.wikipedia.org/wiki/ISO_4217).
  List<String> acceptedCashCurrencies;

  /// Creates a new instance.

  /// [acceptedMethods] Accepted payment methods.
  /// Currently supported methods are defined in [POIPaymentMethod].

  /// [acceptedCashCurrencies] Accepted currencies for cash payment, represented by their ISO 4217 code, for example
  /// "EUR", "USD", "CNY" etc.
  /// See the full list of [ISO 421 codes](https://en.wikipedia.org/wiki/ISO_4217).

  POIPaymentDetails._(this.acceptedMethods, this.acceptedCashCurrencies);
  POIPaymentDetails()
    : acceptedMethods = [], acceptedCashCurrencies = [];
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! POIPaymentDetails) return false;
    POIPaymentDetails _other = other;
    return DeepCollectionEquality().equals(acceptedMethods, _other.acceptedMethods) &&
        DeepCollectionEquality().equals(acceptedCashCurrencies, _other.acceptedCashCurrencies);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(acceptedMethods);
    result = 31 * result + DeepCollectionEquality().hash(acceptedCashCurrencies);
    return result;
  }
}


// POIPaymentDetails "private" section, not exported.

final _sdkSearchPoipaymentdetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_POIPaymentDetails_create_handle'));
final _sdkSearchPoipaymentdetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_POIPaymentDetails_release_handle'));
final _sdkSearchPoipaymentdetailsGetFieldacceptedMethods = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_POIPaymentDetails_get_field_acceptedMethods'));
final _sdkSearchPoipaymentdetailsGetFieldacceptedCashCurrencies = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_POIPaymentDetails_get_field_acceptedCashCurrencies'));



Pointer<Void> sdkSearchPoipaymentdetailsToFfi(POIPaymentDetails value) {
  final _acceptedMethodsHandle = heresdkSearchCommonBindingslistofStringToFfi(value.acceptedMethods);
  final _acceptedCashCurrenciesHandle = heresdkSearchCommonBindingslistofStringToFfi(value.acceptedCashCurrencies);
  final _result = _sdkSearchPoipaymentdetailsCreateHandle(_acceptedMethodsHandle, _acceptedCashCurrenciesHandle);
  heresdkSearchCommonBindingslistofStringReleaseFfiHandle(_acceptedMethodsHandle);
  heresdkSearchCommonBindingslistofStringReleaseFfiHandle(_acceptedCashCurrenciesHandle);
  return _result;
}

POIPaymentDetails sdkSearchPoipaymentdetailsFromFfi(Pointer<Void> handle) {
  final _acceptedMethodsHandle = _sdkSearchPoipaymentdetailsGetFieldacceptedMethods(handle);
  final _acceptedCashCurrenciesHandle = _sdkSearchPoipaymentdetailsGetFieldacceptedCashCurrencies(handle);
  try {
    return POIPaymentDetails._(
      heresdkSearchCommonBindingslistofStringFromFfi(_acceptedMethodsHandle), 
      heresdkSearchCommonBindingslistofStringFromFfi(_acceptedCashCurrenciesHandle)
    );
  } finally {
    heresdkSearchCommonBindingslistofStringReleaseFfiHandle(_acceptedMethodsHandle);
    heresdkSearchCommonBindingslistofStringReleaseFfiHandle(_acceptedCashCurrenciesHandle);
  }
}

void sdkSearchPoipaymentdetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchPoipaymentdetailsReleaseHandle(handle);

// Nullable POIPaymentDetails

final _sdkSearchPoipaymentdetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_POIPaymentDetails_create_handle_nullable'));
final _sdkSearchPoipaymentdetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_POIPaymentDetails_release_handle_nullable'));
final _sdkSearchPoipaymentdetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_POIPaymentDetails_get_value_nullable'));

Pointer<Void> sdkSearchPoipaymentdetailsToFfiNullable(POIPaymentDetails? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchPoipaymentdetailsToFfi(value);
  final result = _sdkSearchPoipaymentdetailsCreateHandleNullable(_handle);
  sdkSearchPoipaymentdetailsReleaseFfiHandle(_handle);
  return result;
}

POIPaymentDetails? sdkSearchPoipaymentdetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchPoipaymentdetailsGetValueNullable(handle);
  final result = sdkSearchPoipaymentdetailsFromFfi(_handle);
  sdkSearchPoipaymentdetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchPoipaymentdetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchPoipaymentdetailsReleaseHandleNullable(handle);

// End of POIPaymentDetails "private" section.


