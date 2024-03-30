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

/// Authentication error
enum AuthenticationError {
    /// Invalid parameter is received. SDK engine and callback must not be null
    invalidParameter,
    /// Authentication failed. Check your credentials.
    authenticationFailed,
    /// Network connection problems.
    noConnection,
    /// Method is invoked on object connected to the disposed SDKNativeEngine.
    operationAfterDispose
}

// AuthenticationError "private" section, not exported.

int sdkCoreAuthenticationerrorToFfi(AuthenticationError value) {
  switch (value) {
  case AuthenticationError.invalidParameter:
    return 1;
  case AuthenticationError.authenticationFailed:
    return 2;
  case AuthenticationError.noConnection:
    return 3;
  case AuthenticationError.operationAfterDispose:
    return 4;
  default:
    throw StateError("Invalid enum value $value for AuthenticationError enum.");
  }
}

AuthenticationError sdkCoreAuthenticationerrorFromFfi(int handle) {
  switch (handle) {
  case 1:
    return AuthenticationError.invalidParameter;
  case 2:
    return AuthenticationError.authenticationFailed;
  case 3:
    return AuthenticationError.noConnection;
  case 4:
    return AuthenticationError.operationAfterDispose;
  default:
    throw StateError("Invalid numeric value $handle for AuthenticationError enum.");
  }
}

void sdkCoreAuthenticationerrorReleaseFfiHandle(int handle) {}

final _sdkCoreAuthenticationerrorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_AuthenticationError_create_handle_nullable'));
final _sdkCoreAuthenticationerrorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationError_release_handle_nullable'));
final _sdkCoreAuthenticationerrorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationError_get_value_nullable'));

Pointer<Void> sdkCoreAuthenticationerrorToFfiNullable(AuthenticationError? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreAuthenticationerrorToFfi(value);
  final result = _sdkCoreAuthenticationerrorCreateHandleNullable(_handle);
  sdkCoreAuthenticationerrorReleaseFfiHandle(_handle);
  return result;
}

AuthenticationError? sdkCoreAuthenticationerrorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreAuthenticationerrorGetValueNullable(handle);
  final result = sdkCoreAuthenticationerrorFromFfi(_handle);
  sdkCoreAuthenticationerrorReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreAuthenticationerrorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreAuthenticationerrorReleaseHandleNullable(handle);

// End of AuthenticationError "private" section.


