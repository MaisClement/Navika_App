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
import 'package:here_sdk/src/sdk/routing/fare_price_type.dart';

/// Price of a fare.

class FarePrice {
  /// Type of price represented by this object.
  /// Defaults to [FarePriceType.value].
  FarePriceType type;

  /// True when the fare price is estimated based on best guess and the actual price may differ.
  /// Defaults to false.
  bool estimated;

  /// Local currency of the price compliant to ISO 4217. For example, "GBP" for the British pound sterling.
  /// Defaults to "EUR" string.
  String currency;

  /// Minimum price when the price is of [FarePriceType.range] type. Otherwise, it is
  /// equal to [FarePrice.maximum].
  /// Defaults to 0.
  double minimum;

  /// Maximum price when the price is of [FarePriceType.range] type. Otherwise, it is
  /// equal to [FarePrice.minimum].
  /// Defaults to 0.
  double maximum;

  /// When set, the price is paid for a specific duration.
  ///
  /// **Examples**:
  ///
  /// 3600 seconds - price for one hour
  ///
  /// 28800 seconds - price for eight hours
  ///
  /// 86400 seconds - price for one day
  ///
  /// **Note:** When the ticket validity period starts depends on the [Agency] providing the service.
  /// Defaults to `null`.
  Duration? validityPeriod;

  /// Creates a new instance.

  /// [type] Type of price represented by this object.
  /// Defaults to [FarePriceType.value].

  /// [estimated] True when the fare price is estimated based on best guess and the actual price may differ.
  /// Defaults to false.

  /// [currency] Local currency of the price compliant to ISO 4217. For example, "GBP" for the British pound sterling.
  /// Defaults to "EUR" string.

  /// [minimum] Minimum price when the price is of [FarePriceType.range] type. Otherwise, it is
  /// equal to [FarePrice.maximum].
  /// Defaults to 0.

  /// [maximum] Maximum price when the price is of [FarePriceType.range] type. Otherwise, it is
  /// equal to [FarePrice.minimum].
  /// Defaults to 0.

  /// [validityPeriod] When set, the price is paid for a specific duration.
  ///
  /// **Examples**:
  ///
  /// 3600 seconds - price for one hour
  ///
  /// 28800 seconds - price for eight hours
  ///
  /// 86400 seconds - price for one day
  ///
  /// **Note:** When the ticket validity period starts depends on the [Agency] providing the service.
  /// Defaults to `null`.

  FarePrice._(this.type, this.estimated, this.currency, this.minimum, this.maximum, this.validityPeriod);
  FarePrice()
    : type = FarePriceType.value, estimated = false, currency = "EUR", minimum = 0, maximum = 0, validityPeriod = null;
}


// FarePrice "private" section, not exported.

final _sdkRoutingFarepriceCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Uint8, Pointer<Void>, Double, Double, Pointer<Void>),
    Pointer<Void> Function(int, int, Pointer<Void>, double, double, Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_create_handle'));
final _sdkRoutingFarepriceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_release_handle'));
final _sdkRoutingFarepriceGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_get_field_type'));
final _sdkRoutingFarepriceGetFieldestimated = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_get_field_estimated'));
final _sdkRoutingFarepriceGetFieldcurrency = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_get_field_currency'));
final _sdkRoutingFarepriceGetFieldminimum = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_get_field_minimum'));
final _sdkRoutingFarepriceGetFieldmaximum = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_get_field_maximum'));
final _sdkRoutingFarepriceGetFieldvalidityPeriod = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_get_field_validityPeriod'));



Pointer<Void> sdkRoutingFarepriceToFfi(FarePrice value) {
  final _typeHandle = sdkRoutingFarepricetypeToFfi(value.type);
  final _estimatedHandle = booleanToFfi(value.estimated);
  final _currencyHandle = stringToFfi(value.currency);
  final _minimumHandle = (value.minimum);
  final _maximumHandle = (value.maximum);
  final _validityPeriodHandle = durationToFfiNullable(value.validityPeriod);
  final _result = _sdkRoutingFarepriceCreateHandle(_typeHandle, _estimatedHandle, _currencyHandle, _minimumHandle, _maximumHandle, _validityPeriodHandle);
  sdkRoutingFarepricetypeReleaseFfiHandle(_typeHandle);
  booleanReleaseFfiHandle(_estimatedHandle);
  stringReleaseFfiHandle(_currencyHandle);
  
  
  durationReleaseFfiHandleNullable(_validityPeriodHandle);
  return _result;
}

FarePrice sdkRoutingFarepriceFromFfi(Pointer<Void> handle) {
  final _typeHandle = _sdkRoutingFarepriceGetFieldtype(handle);
  final _estimatedHandle = _sdkRoutingFarepriceGetFieldestimated(handle);
  final _currencyHandle = _sdkRoutingFarepriceGetFieldcurrency(handle);
  final _minimumHandle = _sdkRoutingFarepriceGetFieldminimum(handle);
  final _maximumHandle = _sdkRoutingFarepriceGetFieldmaximum(handle);
  final _validityPeriodHandle = _sdkRoutingFarepriceGetFieldvalidityPeriod(handle);
  try {
    return FarePrice._(
      sdkRoutingFarepricetypeFromFfi(_typeHandle), 
      booleanFromFfi(_estimatedHandle), 
      stringFromFfi(_currencyHandle), 
      (_minimumHandle), 
      (_maximumHandle), 
      durationFromFfiNullable(_validityPeriodHandle)
    );
  } finally {
    sdkRoutingFarepricetypeReleaseFfiHandle(_typeHandle);
    booleanReleaseFfiHandle(_estimatedHandle);
    stringReleaseFfiHandle(_currencyHandle);
    
    
    durationReleaseFfiHandleNullable(_validityPeriodHandle);
  }
}

void sdkRoutingFarepriceReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingFarepriceReleaseHandle(handle);

// Nullable FarePrice

final _sdkRoutingFarepriceCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_create_handle_nullable'));
final _sdkRoutingFarepriceReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_release_handle_nullable'));
final _sdkRoutingFarepriceGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePrice_get_value_nullable'));

Pointer<Void> sdkRoutingFarepriceToFfiNullable(FarePrice? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingFarepriceToFfi(value);
  final result = _sdkRoutingFarepriceCreateHandleNullable(_handle);
  sdkRoutingFarepriceReleaseFfiHandle(_handle);
  return result;
}

FarePrice? sdkRoutingFarepriceFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingFarepriceGetValueNullable(handle);
  final result = sdkRoutingFarepriceFromFfi(_handle);
  sdkRoutingFarepriceReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingFarepriceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingFarepriceReleaseHandleNullable(handle);

// End of FarePrice "private" section.


