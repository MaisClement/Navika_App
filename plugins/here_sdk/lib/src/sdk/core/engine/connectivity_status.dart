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

/// Represents availability of Online Connectivity (whether device has internet connection)
/// @nodoc
enum ConnectivityStatus {
    reachable,
    notReachable
}

// ConnectivityStatus "private" section, not exported.

int sdkCoreEngineConnectivitystatusToFfi(ConnectivityStatus value) {
  switch (value) {
  case ConnectivityStatus.reachable:
    return 1;
  case ConnectivityStatus.notReachable:
    return 2;
  default:
    throw StateError("Invalid enum value $value for ConnectivityStatus enum.");
  }
}

ConnectivityStatus sdkCoreEngineConnectivitystatusFromFfi(int handle) {
  switch (handle) {
  case 1:
    return ConnectivityStatus.reachable;
  case 2:
    return ConnectivityStatus.notReachable;
  default:
    throw StateError("Invalid numeric value $handle for ConnectivityStatus enum.");
  }
}

void sdkCoreEngineConnectivitystatusReleaseFfiHandle(int handle) {}

final _sdkCoreEngineConnectivitystatusCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_engine_ConnectivityStatus_create_handle_nullable'));
final _sdkCoreEngineConnectivitystatusReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ConnectivityStatus_release_handle_nullable'));
final _sdkCoreEngineConnectivitystatusGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ConnectivityStatus_get_value_nullable'));

Pointer<Void> sdkCoreEngineConnectivitystatusToFfiNullable(ConnectivityStatus? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineConnectivitystatusToFfi(value);
  final result = _sdkCoreEngineConnectivitystatusCreateHandleNullable(_handle);
  sdkCoreEngineConnectivitystatusReleaseFfiHandle(_handle);
  return result;
}

ConnectivityStatus? sdkCoreEngineConnectivitystatusFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineConnectivitystatusGetValueNullable(handle);
  final result = sdkCoreEngineConnectivitystatusFromFfi(_handle);
  sdkCoreEngineConnectivitystatusReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineConnectivitystatusReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineConnectivitystatusReleaseHandleNullable(handle);

// End of ConnectivityStatus "private" section.


