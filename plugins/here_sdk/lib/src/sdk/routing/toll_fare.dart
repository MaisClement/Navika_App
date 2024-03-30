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
import 'package:here_sdk/src/sdk/routing/payment_method.dart';

/// This struct presents all the fare data for a toll.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class TollFare {
  /// The currency in which the toll is to be paid in ISO 4217 format, e.g. "USD".
  String currency;

  /// The amount of the toll be paid.
  double price;

  /// The list of accepted payment methods like cash and credit card.
  List<PaymentMethod> paymentMethods;

  /// Creates a new instance.

  /// [currency] The currency in which the toll is to be paid in ISO 4217 format, e.g. "USD".

  /// [price] The amount of the toll be paid.

  /// [paymentMethods] The list of accepted payment methods like cash and credit card.

  TollFare(this.currency, this.price, this.paymentMethods);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TollFare) return false;
    TollFare _other = other;
    return currency == _other.currency &&
        price == _other.price &&
        DeepCollectionEquality().equals(paymentMethods, _other.paymentMethods);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + currency.hashCode;
    result = 31 * result + price.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(paymentMethods);
    return result;
  }
}


// TollFare "private" section, not exported.

final _sdkRoutingTollfareCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Double, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, double, Pointer<Void>)
  >('here_sdk_sdk_routing_TollFare_create_handle'));
final _sdkRoutingTollfareReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TollFare_release_handle'));
final _sdkRoutingTollfareGetFieldcurrency = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TollFare_get_field_currency'));
final _sdkRoutingTollfareGetFieldprice = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TollFare_get_field_price'));
final _sdkRoutingTollfareGetFieldpaymentMethods = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TollFare_get_field_paymentMethods'));



Pointer<Void> sdkRoutingTollfareToFfi(TollFare value) {
  final _currencyHandle = stringToFfi(value.currency);
  final _priceHandle = (value.price);
  final _paymentMethodsHandle = heresdkRoutingCommonBindingslistofSdkRoutingPaymentmethodToFfi(value.paymentMethods);
  final _result = _sdkRoutingTollfareCreateHandle(_currencyHandle, _priceHandle, _paymentMethodsHandle);
  stringReleaseFfiHandle(_currencyHandle);
  
  heresdkRoutingCommonBindingslistofSdkRoutingPaymentmethodReleaseFfiHandle(_paymentMethodsHandle);
  return _result;
}

TollFare sdkRoutingTollfareFromFfi(Pointer<Void> handle) {
  final _currencyHandle = _sdkRoutingTollfareGetFieldcurrency(handle);
  final _priceHandle = _sdkRoutingTollfareGetFieldprice(handle);
  final _paymentMethodsHandle = _sdkRoutingTollfareGetFieldpaymentMethods(handle);
  try {
    return TollFare(
      stringFromFfi(_currencyHandle), 
      (_priceHandle), 
      heresdkRoutingCommonBindingslistofSdkRoutingPaymentmethodFromFfi(_paymentMethodsHandle)
    );
  } finally {
    stringReleaseFfiHandle(_currencyHandle);
    
    heresdkRoutingCommonBindingslistofSdkRoutingPaymentmethodReleaseFfiHandle(_paymentMethodsHandle);
  }
}

void sdkRoutingTollfareReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingTollfareReleaseHandle(handle);

// Nullable TollFare

final _sdkRoutingTollfareCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TollFare_create_handle_nullable'));
final _sdkRoutingTollfareReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TollFare_release_handle_nullable'));
final _sdkRoutingTollfareGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TollFare_get_value_nullable'));

Pointer<Void> sdkRoutingTollfareToFfiNullable(TollFare? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTollfareToFfi(value);
  final result = _sdkRoutingTollfareCreateHandleNullable(_handle);
  sdkRoutingTollfareReleaseFfiHandle(_handle);
  return result;
}

TollFare? sdkRoutingTollfareFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTollfareGetValueNullable(handle);
  final result = sdkRoutingTollfareFromFfi(_handle);
  sdkRoutingTollfareReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTollfareReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTollfareReleaseHandleNullable(handle);

// End of TollFare "private" section.


