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

/// Specifies the tunnel categories.
enum TunnelCategory {
    /// Category B.
    b,
    /// Category C.
    c,
    /// Category D.
    d,
    /// Category E.
    e
}

// TunnelCategory "private" section, not exported.

int sdkTransportTunnelcategoryToFfi(TunnelCategory value) {
  switch (value) {
  case TunnelCategory.b:
    return 0;
  case TunnelCategory.c:
    return 1;
  case TunnelCategory.d:
    return 2;
  case TunnelCategory.e:
    return 3;
  default:
    throw StateError("Invalid enum value $value for TunnelCategory enum.");
  }
}

TunnelCategory sdkTransportTunnelcategoryFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TunnelCategory.b;
  case 1:
    return TunnelCategory.c;
  case 2:
    return TunnelCategory.d;
  case 3:
    return TunnelCategory.e;
  default:
    throw StateError("Invalid numeric value $handle for TunnelCategory enum.");
  }
}

void sdkTransportTunnelcategoryReleaseFfiHandle(int handle) {}

final _sdkTransportTunnelcategoryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_TunnelCategory_create_handle_nullable'));
final _sdkTransportTunnelcategoryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TunnelCategory_release_handle_nullable'));
final _sdkTransportTunnelcategoryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TunnelCategory_get_value_nullable'));

Pointer<Void> sdkTransportTunnelcategoryToFfiNullable(TunnelCategory? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportTunnelcategoryToFfi(value);
  final result = _sdkTransportTunnelcategoryCreateHandleNullable(_handle);
  sdkTransportTunnelcategoryReleaseFfiHandle(_handle);
  return result;
}

TunnelCategory? sdkTransportTunnelcategoryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportTunnelcategoryGetValueNullable(handle);
  final result = sdkTransportTunnelcategoryFromFfi(_handle);
  sdkTransportTunnelcategoryReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportTunnelcategoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportTunnelcategoryReleaseHandleNullable(handle);

// End of TunnelCategory "private" section.


