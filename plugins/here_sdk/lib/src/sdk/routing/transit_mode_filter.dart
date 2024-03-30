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

/// Filtering mode for public transit.
enum TransitModeFilter {
    /// Route can have only the specified modes.
    include,
    /// Route can have any mode mode except the specified.
    exclude
}

// TransitModeFilter "private" section, not exported.

int sdkRoutingTransitmodefilterToFfi(TransitModeFilter value) {
  switch (value) {
  case TransitModeFilter.include:
    return 0;
  case TransitModeFilter.exclude:
    return 1;
  default:
    throw StateError("Invalid enum value $value for TransitModeFilter enum.");
  }
}

TransitModeFilter sdkRoutingTransitmodefilterFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TransitModeFilter.include;
  case 1:
    return TransitModeFilter.exclude;
  default:
    throw StateError("Invalid numeric value $handle for TransitModeFilter enum.");
  }
}

void sdkRoutingTransitmodefilterReleaseFfiHandle(int handle) {}

final _sdkRoutingTransitmodefilterCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_TransitModeFilter_create_handle_nullable'));
final _sdkRoutingTransitmodefilterReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitModeFilter_release_handle_nullable'));
final _sdkRoutingTransitmodefilterGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitModeFilter_get_value_nullable'));

Pointer<Void> sdkRoutingTransitmodefilterToFfiNullable(TransitModeFilter? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTransitmodefilterToFfi(value);
  final result = _sdkRoutingTransitmodefilterCreateHandleNullable(_handle);
  sdkRoutingTransitmodefilterReleaseFfiHandle(_handle);
  return result;
}

TransitModeFilter? sdkRoutingTransitmodefilterFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTransitmodefilterGetValueNullable(handle);
  final result = sdkRoutingTransitmodefilterFromFfi(_handle);
  sdkRoutingTransitmodefilterReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTransitmodefilterReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTransitmodefilterReleaseHandleNullable(handle);

// End of TransitModeFilter "private" section.


