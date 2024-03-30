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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';

/// This is a bearer authentication mode which adds or does not add a
/// header ("Authorization", "Bearer $Token") to each online request of the
/// module the object is added to.
///
/// The token (if used) can be provided or is
/// retrieved via key/secret from a dedicated backend.
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.
abstract class AuthenticationMode {

  /// SDK will pass access token as a Bearer.
  ///
  /// [accessToken] Access token
  ///
  /// Returns [AuthenticationMode]. Instance of [AuthenticationMode] configured to use token
  ///
  static AuthenticationMode withToken(String accessToken) => $prototype.withToken(accessToken);
  /// Assumes the authentication is provided by the client.
  ///
  /// Returns [AuthenticationMode]. Instance of [AuthenticationMode] configured to use externaly provided authentication
  ///
  static AuthenticationMode withExternal() => $prototype.withExternal();
  /// SDK will authenticate with access key id access key secret to obtain authentication token.
  ///
  /// [accessKeyId] The access key id
  ///
  /// [accessKeySecret] The access key secret
  ///
  /// Returns [AuthenticationMode]. Instance of [AuthenticationMode] configured to use key ID and secret
  ///
  static AuthenticationMode withKeySecret(String accessKeyId, String accessKeySecret) => $prototype.withKeySecret(accessKeyId, accessKeySecret);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = AuthenticationMode$Impl(Pointer<Void>.fromAddress(0));
}


// AuthenticationMode "private" section, not exported.

final _sdkCoreEngineAuthenticationmodeRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_engine_AuthenticationMode_register_finalizer'));
final _sdkCoreEngineAuthenticationmodeCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_AuthenticationMode_copy_handle'));
final _sdkCoreEngineAuthenticationmodeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_AuthenticationMode_release_handle'));





/// @nodoc
@visibleForTesting
class AuthenticationMode$Impl extends __lib.NativeBase implements AuthenticationMode {

  AuthenticationMode$Impl(Pointer<Void> handle) : super(handle);

  AuthenticationMode withToken(String accessToken) {
    final _withTokenFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_AuthenticationMode_withToken__String'));
    final _accessTokenHandle = stringToFfi(accessToken);
    final __resultHandle = _withTokenFfi(__lib.LibraryContext.isolateId, _accessTokenHandle);
    stringReleaseFfiHandle(_accessTokenHandle);
    try {
      return sdkCoreEngineAuthenticationmodeFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineAuthenticationmodeReleaseFfiHandle(__resultHandle);

    }

  }

  AuthenticationMode withExternal() {
    final _withExternalFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_engine_AuthenticationMode_withExternal'));
    final __resultHandle = _withExternalFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkCoreEngineAuthenticationmodeFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineAuthenticationmodeReleaseFfiHandle(__resultHandle);

    }

  }

  AuthenticationMode withKeySecret(String accessKeyId, String accessKeySecret) {
    final _withKeySecretFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_engine_AuthenticationMode_withKeySecret__String_String'));
    final _accessKeyIdHandle = stringToFfi(accessKeyId);
    final _accessKeySecretHandle = stringToFfi(accessKeySecret);
    final __resultHandle = _withKeySecretFfi(__lib.LibraryContext.isolateId, _accessKeyIdHandle, _accessKeySecretHandle);
    stringReleaseFfiHandle(_accessKeyIdHandle);
    stringReleaseFfiHandle(_accessKeySecretHandle);
    try {
      return sdkCoreEngineAuthenticationmodeFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineAuthenticationmodeReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkCoreEngineAuthenticationmodeToFfi(AuthenticationMode value) =>
  _sdkCoreEngineAuthenticationmodeCopyHandle((value as __lib.NativeBase).handle);

AuthenticationMode sdkCoreEngineAuthenticationmodeFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is AuthenticationMode) return instance;

  final _copiedHandle = _sdkCoreEngineAuthenticationmodeCopyHandle(handle);
  final result = AuthenticationMode$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkCoreEngineAuthenticationmodeRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreEngineAuthenticationmodeReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreEngineAuthenticationmodeReleaseHandle(handle);

Pointer<Void> sdkCoreEngineAuthenticationmodeToFfiNullable(AuthenticationMode? value) =>
  value != null ? sdkCoreEngineAuthenticationmodeToFfi(value) : Pointer<Void>.fromAddress(0);

AuthenticationMode? sdkCoreEngineAuthenticationmodeFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreEngineAuthenticationmodeFromFfi(handle) : null;

void sdkCoreEngineAuthenticationmodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineAuthenticationmodeReleaseHandle(handle);

// End of AuthenticationMode "private" section.


