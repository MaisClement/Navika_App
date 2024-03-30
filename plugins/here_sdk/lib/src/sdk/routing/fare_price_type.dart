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

/// Type of price represented by a [FarePrice] object.
enum FarePriceType {
    /// A fixed value where [FarePrice.minimum] = [FarePrice.maximum] = price value.
    value,
    /// A price range from [FarePrice.minimum] to [FarePrice.maximum].
    range
}

// FarePriceType "private" section, not exported.

int sdkRoutingFarepricetypeToFfi(FarePriceType value) {
  switch (value) {
  case FarePriceType.value:
    return 0;
  case FarePriceType.range:
    return 1;
  default:
    throw StateError("Invalid enum value $value for FarePriceType enum.");
  }
}

FarePriceType sdkRoutingFarepricetypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return FarePriceType.value;
  case 1:
    return FarePriceType.range;
  default:
    throw StateError("Invalid numeric value $handle for FarePriceType enum.");
  }
}

void sdkRoutingFarepricetypeReleaseFfiHandle(int handle) {}

final _sdkRoutingFarepricetypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_FarePriceType_create_handle_nullable'));
final _sdkRoutingFarepricetypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePriceType_release_handle_nullable'));
final _sdkRoutingFarepricetypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FarePriceType_get_value_nullable'));

Pointer<Void> sdkRoutingFarepricetypeToFfiNullable(FarePriceType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingFarepricetypeToFfi(value);
  final result = _sdkRoutingFarepricetypeCreateHandleNullable(_handle);
  sdkRoutingFarepricetypeReleaseFfiHandle(_handle);
  return result;
}

FarePriceType? sdkRoutingFarepricetypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingFarepricetypeGetValueNullable(handle);
  final result = sdkRoutingFarepricetypeFromFfi(_handle);
  sdkRoutingFarepricetypeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingFarepricetypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingFarepricetypeReleaseHandleNullable(handle);

// End of FarePriceType "private" section.


