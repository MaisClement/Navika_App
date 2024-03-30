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
import 'package:here_sdk/src/sdk/routing/fare_price.dart';
import 'package:here_sdk/src/sdk/routing/fare_reason.dart';

/// Holds all the fare data.

class Fare {
  /// Name of a fare
  String name;

  /// Price of a fare. It is `null` when no price data is available.
  FarePrice? price;

  /// Reason of this cost.
  FareReason reason;

  /// Creates a new instance.
  /// [name] Name of a fare
  /// [price] Price of a fare. It is `null` when no price data is available.
  /// [reason] Reason of this cost.
  Fare(this.name, this.price, this.reason);
}


// Fare "private" section, not exported.

final _sdkRoutingFareCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Uint32),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_routing_Fare_create_handle'));
final _sdkRoutingFareReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Fare_release_handle'));
final _sdkRoutingFareGetFieldname = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Fare_get_field_name'));
final _sdkRoutingFareGetFieldprice = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Fare_get_field_price'));
final _sdkRoutingFareGetFieldreason = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Fare_get_field_reason'));



Pointer<Void> sdkRoutingFareToFfi(Fare value) {
  final _nameHandle = stringToFfi(value.name);
  final _priceHandle = sdkRoutingFarepriceToFfiNullable(value.price);
  final _reasonHandle = sdkRoutingFarereasonToFfi(value.reason);
  final _result = _sdkRoutingFareCreateHandle(_nameHandle, _priceHandle, _reasonHandle);
  stringReleaseFfiHandle(_nameHandle);
  sdkRoutingFarepriceReleaseFfiHandleNullable(_priceHandle);
  sdkRoutingFarereasonReleaseFfiHandle(_reasonHandle);
  return _result;
}

Fare sdkRoutingFareFromFfi(Pointer<Void> handle) {
  final _nameHandle = _sdkRoutingFareGetFieldname(handle);
  final _priceHandle = _sdkRoutingFareGetFieldprice(handle);
  final _reasonHandle = _sdkRoutingFareGetFieldreason(handle);
  try {
    return Fare(
      stringFromFfi(_nameHandle), 
      sdkRoutingFarepriceFromFfiNullable(_priceHandle), 
      sdkRoutingFarereasonFromFfi(_reasonHandle)
    );
  } finally {
    stringReleaseFfiHandle(_nameHandle);
    sdkRoutingFarepriceReleaseFfiHandleNullable(_priceHandle);
    sdkRoutingFarereasonReleaseFfiHandle(_reasonHandle);
  }
}

void sdkRoutingFareReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingFareReleaseHandle(handle);

// Nullable Fare

final _sdkRoutingFareCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Fare_create_handle_nullable'));
final _sdkRoutingFareReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Fare_release_handle_nullable'));
final _sdkRoutingFareGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Fare_get_value_nullable'));

Pointer<Void> sdkRoutingFareToFfiNullable(Fare? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingFareToFfi(value);
  final result = _sdkRoutingFareCreateHandleNullable(_handle);
  sdkRoutingFareReleaseFfiHandle(_handle);
  return result;
}

Fare? sdkRoutingFareFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingFareGetValueNullable(handle);
  final result = sdkRoutingFareFromFfi(_handle);
  sdkRoutingFareReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingFareReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingFareReleaseHandleNullable(handle);

// End of Fare "private" section.


