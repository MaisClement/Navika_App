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
enum EmissionStandard {
    euro2,
    euro3,
    euro4,
    euro5,
    euro6
}

// EmissionStandard "private" section, not exported.

int sdkTransportEmissionstandardToFfi(EmissionStandard value) {
  switch (value) {
  case EmissionStandard.euro2:
    return 0;
  case EmissionStandard.euro3:
    return 1;
  case EmissionStandard.euro4:
    return 2;
  case EmissionStandard.euro5:
    return 3;
  case EmissionStandard.euro6:
    return 4;
  default:
    throw StateError("Invalid enum value $value for EmissionStandard enum.");
  }
}

EmissionStandard sdkTransportEmissionstandardFromFfi(int handle) {
  switch (handle) {
  case 0:
    return EmissionStandard.euro2;
  case 1:
    return EmissionStandard.euro3;
  case 2:
    return EmissionStandard.euro4;
  case 3:
    return EmissionStandard.euro5;
  case 4:
    return EmissionStandard.euro6;
  default:
    throw StateError("Invalid numeric value $handle for EmissionStandard enum.");
  }
}

void sdkTransportEmissionstandardReleaseFfiHandle(int handle) {}

final _sdkTransportEmissionstandardCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_EmissionStandard_create_handle_nullable'));
final _sdkTransportEmissionstandardReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_EmissionStandard_release_handle_nullable'));
final _sdkTransportEmissionstandardGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_EmissionStandard_get_value_nullable'));

Pointer<Void> sdkTransportEmissionstandardToFfiNullable(EmissionStandard? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportEmissionstandardToFfi(value);
  final result = _sdkTransportEmissionstandardCreateHandleNullable(_handle);
  sdkTransportEmissionstandardReleaseFfiHandle(_handle);
  return result;
}

EmissionStandard? sdkTransportEmissionstandardFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportEmissionstandardGetValueNullable(handle);
  final result = sdkTransportEmissionstandardFromFfi(_handle);
  sdkTransportEmissionstandardReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportEmissionstandardReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportEmissionstandardReleaseHandleNullable(handle);

// End of EmissionStandard "private" section.


