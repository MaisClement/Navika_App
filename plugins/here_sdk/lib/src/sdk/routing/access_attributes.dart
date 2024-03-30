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

/// Types of access attributes.
enum AccessAttributes {
    /// The access is open.
    open,
    /// No access is permitted.
    noThrough,
    /// The access is permited after paying a toll.
    tollRoad
}

// AccessAttributes "private" section, not exported.

int sdkRoutingAccessattributesToFfi(AccessAttributes value) {
  switch (value) {
  case AccessAttributes.open:
    return 0;
  case AccessAttributes.noThrough:
    return 1;
  case AccessAttributes.tollRoad:
    return 2;
  default:
    throw StateError("Invalid enum value $value for AccessAttributes enum.");
  }
}

AccessAttributes sdkRoutingAccessattributesFromFfi(int handle) {
  switch (handle) {
  case 0:
    return AccessAttributes.open;
  case 1:
    return AccessAttributes.noThrough;
  case 2:
    return AccessAttributes.tollRoad;
  default:
    throw StateError("Invalid numeric value $handle for AccessAttributes enum.");
  }
}

void sdkRoutingAccessattributesReleaseFfiHandle(int handle) {}

final _sdkRoutingAccessattributesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_AccessAttributes_create_handle_nullable'));
final _sdkRoutingAccessattributesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AccessAttributes_release_handle_nullable'));
final _sdkRoutingAccessattributesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_AccessAttributes_get_value_nullable'));

Pointer<Void> sdkRoutingAccessattributesToFfiNullable(AccessAttributes? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingAccessattributesToFfi(value);
  final result = _sdkRoutingAccessattributesCreateHandleNullable(_handle);
  sdkRoutingAccessattributesReleaseFfiHandle(_handle);
  return result;
}

AccessAttributes? sdkRoutingAccessattributesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingAccessattributesGetValueNullable(handle);
  final result = sdkRoutingAccessattributesFromFfi(_handle);
  sdkRoutingAccessattributesReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingAccessattributesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingAccessattributesReleaseHandleNullable(handle);

// End of AccessAttributes "private" section.


