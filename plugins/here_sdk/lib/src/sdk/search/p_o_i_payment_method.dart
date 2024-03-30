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

/// Holds constants that represent payment methods.
///
/// See [POIPaymentDetails] for usage.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and
/// unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class POIPaymentMethod {
  /// American express credit card
  static final String amex = "amex";

  /// Ampol app
  static final String ampol = "ampol";

  /// Android pay
  static final String androidPay = "androidpay";

  /// Apple pay
  static final String applePay = "applepay";

  /// Cash
  static final String cash = "cash";

  /// Cheque
  static final String cheque = "cheque";

  /// Debit card
  static final String debitCard = "debitcard";

  /// Diners club credit card
  static final String dinersClub = "dinersclub";

  /// Discover credit card
  static final String discover = "discover";

  /// DKV invoicing service
  static final String dkv = "dkv";

  /// Financing
  static final String financing = "financing";

  /// Mastercard credit card
  static final String mastercard = "mastercard";

  /// Motorpass fuel card
  static final String motorpass = "motorpass";

  /// PayPal
  static final String paypal = "paypal";

  /// Shell fuel card
  static final String shell = "shell";

  /// Visa credit card
  static final String visa = "visa";

}


// POIPaymentMethod "private" section, not exported.

final _sdkSearchPoipaymentmethodCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_sdk_search_POIPaymentMethod_create_handle'));
final _sdkSearchPoipaymentmethodReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_POIPaymentMethod_release_handle'));



Pointer<Void> sdkSearchPoipaymentmethodToFfi(POIPaymentMethod value) {
  final _result = _sdkSearchPoipaymentmethodCreateHandle();
  return _result;
}

POIPaymentMethod sdkSearchPoipaymentmethodFromFfi(Pointer<Void> handle) {
  try {
    return POIPaymentMethod(
    );
  } finally {
  }
}

void sdkSearchPoipaymentmethodReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchPoipaymentmethodReleaseHandle(handle);

// Nullable POIPaymentMethod

final _sdkSearchPoipaymentmethodCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_POIPaymentMethod_create_handle_nullable'));
final _sdkSearchPoipaymentmethodReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_POIPaymentMethod_release_handle_nullable'));
final _sdkSearchPoipaymentmethodGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_POIPaymentMethod_get_value_nullable'));

Pointer<Void> sdkSearchPoipaymentmethodToFfiNullable(POIPaymentMethod? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchPoipaymentmethodToFfi(value);
  final result = _sdkSearchPoipaymentmethodCreateHandleNullable(_handle);
  sdkSearchPoipaymentmethodReleaseFfiHandle(_handle);
  return result;
}

POIPaymentMethod? sdkSearchPoipaymentmethodFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchPoipaymentmethodGetValueNullable(handle);
  final result = sdkSearchPoipaymentmethodFromFfi(_handle);
  sdkSearchPoipaymentmethodReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchPoipaymentmethodReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchPoipaymentmethodReleaseHandleNullable(handle);

// End of POIPaymentMethod "private" section.


