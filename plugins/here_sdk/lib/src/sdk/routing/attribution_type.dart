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

/// Attribution link type.
enum AttributionType {
    /// Page with further legal information from the agency.
    disclaimer,
    /// Page with information on the tariff.
    tariff
}

// AttributionType "private" section, not exported.

int sdkRoutingAttributiontypeToFfi(AttributionType value) {
  switch (value) {
  case AttributionType.disclaimer:
    return 0;
  case AttributionType.tariff:
    return 1;
  default:
    throw StateError("Invalid enum value $value for AttributionType enum.");
  }
}

AttributionType sdkRoutingAttributiontypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return AttributionType.disclaimer;
  case 1:
    return AttributionType.tariff;
  default:
    throw StateError("Invalid numeric value $handle for AttributionType enum.");
  }
}

void sdkRoutingAttributiontypeReleaseFfiHandle(int handle) {}

final _sdkRoutingAttributiontypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_AttributionType_create_handle_nullable'));
final _sdkRoutingAttributiontypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AttributionType_release_handle_nullable'));
final _sdkRoutingAttributiontypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AttributionType_get_value_nullable'));

Pointer<Void> sdkRoutingAttributiontypeToFfiNullable(AttributionType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingAttributiontypeToFfi(value);
  final result = _sdkRoutingAttributiontypeCreateHandleNullable(_handle);
  sdkRoutingAttributiontypeReleaseFfiHandle(_handle);
  return result;
}

AttributionType? sdkRoutingAttributiontypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingAttributiontypeGetValueNullable(handle);
  final result = sdkRoutingAttributiontypeFromFfi(_handle);
  sdkRoutingAttributiontypeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingAttributiontypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingAttributiontypeReleaseHandleNullable(handle);

// End of AttributionType "private" section.


