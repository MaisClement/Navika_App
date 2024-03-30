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

/// Authentication data

class AuthenticationData {
  /// Secure token to be used with other HERE services. Note that the HERE SDK
  /// itself does not require the use of tokens.
  /// Defaults to an empty string.
  String token;

  /// Expiration time in seconds as epoch time.
  /// Defaults to 0 seconds.
  Duration expiryTime;

  /// Creates a new instance.

  /// [token] Secure token to be used with other HERE services. Note that the HERE SDK
  /// itself does not require the use of tokens.
  /// Defaults to an empty string.

  /// [expiryTime] Expiration time in seconds as epoch time.
  /// Defaults to 0 seconds.

  AuthenticationData._(this.token, this.expiryTime);
  AuthenticationData()
    : token = "", expiryTime = const Duration(seconds: 0);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AuthenticationData) return false;
    AuthenticationData _other = other;
    return token == _other.token &&
        expiryTime == _other.expiryTime;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + token.hashCode;
    result = 31 * result + expiryTime.hashCode;
    return result;
  }
}


// AuthenticationData "private" section, not exported.

final _sdkCoreAuthenticationdataCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint64),
    Pointer<Void> Function(Pointer<Void>, int)
  >('here_sdk_sdk_core_AuthenticationData_create_handle'));
final _sdkCoreAuthenticationdataReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationData_release_handle'));
final _sdkCoreAuthenticationdataGetFieldtoken = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationData_get_field_token'));
final _sdkCoreAuthenticationdataGetFieldexpiryTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationData_get_field_expiryTime'));



Pointer<Void> sdkCoreAuthenticationdataToFfi(AuthenticationData value) {
  final _tokenHandle = stringToFfi(value.token);
  final _expiryTimeHandle = durationToFfi(value.expiryTime);
  final _result = _sdkCoreAuthenticationdataCreateHandle(_tokenHandle, _expiryTimeHandle);
  stringReleaseFfiHandle(_tokenHandle);
  durationReleaseFfiHandle(_expiryTimeHandle);
  return _result;
}

AuthenticationData sdkCoreAuthenticationdataFromFfi(Pointer<Void> handle) {
  final _tokenHandle = _sdkCoreAuthenticationdataGetFieldtoken(handle);
  final _expiryTimeHandle = _sdkCoreAuthenticationdataGetFieldexpiryTime(handle);
  try {
    return AuthenticationData._(
      stringFromFfi(_tokenHandle), 
      durationFromFfi(_expiryTimeHandle)
    );
  } finally {
    stringReleaseFfiHandle(_tokenHandle);
    durationReleaseFfiHandle(_expiryTimeHandle);
  }
}

void sdkCoreAuthenticationdataReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreAuthenticationdataReleaseHandle(handle);

// Nullable AuthenticationData

final _sdkCoreAuthenticationdataCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationData_create_handle_nullable'));
final _sdkCoreAuthenticationdataReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationData_release_handle_nullable'));
final _sdkCoreAuthenticationdataGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AuthenticationData_get_value_nullable'));

Pointer<Void> sdkCoreAuthenticationdataToFfiNullable(AuthenticationData? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreAuthenticationdataToFfi(value);
  final result = _sdkCoreAuthenticationdataCreateHandleNullable(_handle);
  sdkCoreAuthenticationdataReleaseFfiHandle(_handle);
  return result;
}

AuthenticationData? sdkCoreAuthenticationdataFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreAuthenticationdataGetValueNullable(handle);
  final result = sdkCoreAuthenticationdataFromFfi(_handle);
  sdkCoreAuthenticationdataReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreAuthenticationdataReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreAuthenticationdataReleaseHandleNullable(handle);

// End of AuthenticationData "private" section.


