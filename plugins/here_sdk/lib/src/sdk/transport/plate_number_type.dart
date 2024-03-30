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

/// @nodoc
enum PlateNumberType {
    odd,
    even
}

// PlateNumberType "private" section, not exported.

int sdkTransportPlatenumbertypeToFfi(PlateNumberType value) {
  switch (value) {
  case PlateNumberType.odd:
    return 0;
  case PlateNumberType.even:
    return 1;
  default:
    throw StateError("Invalid enum value $value for PlateNumberType enum.");
  }
}

PlateNumberType sdkTransportPlatenumbertypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return PlateNumberType.odd;
  case 1:
    return PlateNumberType.even;
  default:
    throw StateError("Invalid numeric value $handle for PlateNumberType enum.");
  }
}

void sdkTransportPlatenumbertypeReleaseFfiHandle(int handle) {}

final _sdkTransportPlatenumbertypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_PlateNumberType_create_handle_nullable'));
final _sdkTransportPlatenumbertypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_PlateNumberType_release_handle_nullable'));
final _sdkTransportPlatenumbertypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_PlateNumberType_get_value_nullable'));

Pointer<Void> sdkTransportPlatenumbertypeToFfiNullable(PlateNumberType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportPlatenumbertypeToFfi(value);
  final result = _sdkTransportPlatenumbertypeCreateHandleNullable(_handle);
  sdkTransportPlatenumbertypeReleaseFfiHandle(_handle);
  return result;
}

PlateNumberType? sdkTransportPlatenumbertypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportPlatenumbertypeGetValueNullable(handle);
  final result = sdkTransportPlatenumbertypeFromFfi(_handle);
  sdkTransportPlatenumbertypeReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportPlatenumbertypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportPlatenumbertypeReleaseHandleNullable(handle);

// End of PlateNumberType "private" section.


