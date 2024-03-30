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

/// Available payment methods.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
enum PaymentMethod {
    /// Payment with an unknown method.
    unknown,
    /// Payment with cash money.
    cash,
    /// Payment with a bank card.
    bankCard,
    /// Payment with a credit card.
    creditCard,
    /// Payment with a pass subscription.
    passSubscription,
    /// Payment with a transponder.
    transponder,
    /// Payment with a video toll, i.e. toll by license plate.
    videoToll,
    /// Payment with exact cash money, i.e. toll booth accepts exact change only.
    cashExact,
    /// Payment with a travel card.
    travelCard
}

// PaymentMethod "private" section, not exported.

int sdkRoutingPaymentmethodToFfi(PaymentMethod value) {
  switch (value) {
  case PaymentMethod.unknown:
    return 0;
  case PaymentMethod.cash:
    return 1;
  case PaymentMethod.bankCard:
    return 2;
  case PaymentMethod.creditCard:
    return 3;
  case PaymentMethod.passSubscription:
    return 4;
  case PaymentMethod.transponder:
    return 5;
  case PaymentMethod.videoToll:
    return 6;
  case PaymentMethod.cashExact:
    return 7;
  case PaymentMethod.travelCard:
    return 8;
  default:
    throw StateError("Invalid enum value $value for PaymentMethod enum.");
  }
}

PaymentMethod sdkRoutingPaymentmethodFromFfi(int handle) {
  switch (handle) {
  case 0:
    return PaymentMethod.unknown;
  case 1:
    return PaymentMethod.cash;
  case 2:
    return PaymentMethod.bankCard;
  case 3:
    return PaymentMethod.creditCard;
  case 4:
    return PaymentMethod.passSubscription;
  case 5:
    return PaymentMethod.transponder;
  case 6:
    return PaymentMethod.videoToll;
  case 7:
    return PaymentMethod.cashExact;
  case 8:
    return PaymentMethod.travelCard;
  default:
    throw StateError("Invalid numeric value $handle for PaymentMethod enum.");
  }
}

void sdkRoutingPaymentmethodReleaseFfiHandle(int handle) {}

final _sdkRoutingPaymentmethodCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_PaymentMethod_create_handle_nullable'));
final _sdkRoutingPaymentmethodReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PaymentMethod_release_handle_nullable'));
final _sdkRoutingPaymentmethodGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PaymentMethod_get_value_nullable'));

Pointer<Void> sdkRoutingPaymentmethodToFfiNullable(PaymentMethod? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingPaymentmethodToFfi(value);
  final result = _sdkRoutingPaymentmethodCreateHandleNullable(_handle);
  sdkRoutingPaymentmethodReleaseFfiHandle(_handle);
  return result;
}

PaymentMethod? sdkRoutingPaymentmethodFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingPaymentmethodGetValueNullable(handle);
  final result = sdkRoutingPaymentmethodFromFfi(_handle);
  sdkRoutingPaymentmethodReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingPaymentmethodReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingPaymentmethodReleaseHandleNullable(handle);

// End of PaymentMethod "private" section.


