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
import 'package:here_sdk/src/sdk/core/authentication_callback.dart';
import 'package:here_sdk/src/sdk/core/authentication_data.dart';
import 'package:here_sdk/src/sdk/core/authentication_error.dart';
import 'package:here_sdk/src/sdk/core/authentication_exception_exception.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:meta/meta.dart';

/// Use the authentication class to authenticate and retrieve a secure token that
/// can be used with other HERE services.
abstract class Authentication {

  /// Uses the authentication service that is connected to the given SDK engine to authenticate and
  /// retrieve a secure token.
  ///
  /// This method operates asynchronously.
  ///
  /// [sdkNativeEngine] The SDK engine instance.
  ///
  /// [callback] Callback to retrieve an authentication token on the main thread.
  ///
  static void authenticate(SDKNativeEngine sdkNativeEngine, AuthenticationCallback callback) => $prototype.authenticate(sdkNativeEngine, callback);
  /// Uses the authentication service that is connected to the given SDK engine to authenticate and
  /// retrieve a secure token.
  ///
  /// This method operates synchronously.
  ///
  /// [sdkNativeEngine] The SDK engine instance.
  ///
  /// Returns [AuthenticationData]. Authentication data.
  ///
  /// Throws [AuthenticationExceptionException]. Authentication exception that describes the error.
  ///
  static AuthenticationData authenticateWithSDKNativeEngine(SDKNativeEngine sdkNativeEngine) => $prototype.authenticateWithSDKNativeEngine(sdkNativeEngine);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Authentication$Impl(Pointer<Void>.fromAddress(0));
}


// Authentication "private" section, not exported.

final _sdkCoreAuthenticationRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_Authentication_register_finalizer'));
final _sdkCoreAuthenticationCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Authentication_copy_handle'));
final _sdkCoreAuthenticationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Authentication_release_handle'));



final _authenticateWithSDKNativeEnginesdkCoreAuthenticationAuthenticateSdknativeengineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Authentication_authenticate__SDKNativeEngine_return_release_handle'));
final _authenticateWithSDKNativeEnginesdkCoreAuthenticationAuthenticateSdknativeengineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Authentication_authenticate__SDKNativeEngine_return_get_result'));
final _authenticateWithSDKNativeEnginesdkCoreAuthenticationAuthenticateSdknativeengineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_Authentication_authenticate__SDKNativeEngine_return_get_error'));
final _authenticateWithSDKNativeEnginesdkCoreAuthenticationAuthenticateSdknativeengineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_Authentication_authenticate__SDKNativeEngine_return_has_error'));


/// @nodoc
@visibleForTesting
class Authentication$Impl extends __lib.NativeBase implements Authentication {

  Authentication$Impl(Pointer<Void> handle) : super(handle);

  void authenticate(SDKNativeEngine sdkNativeEngine, AuthenticationCallback callback) {
    final _authenticateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Pointer<Void>), void Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_Authentication_authenticate__SDKNativeEngine_AuthenticationCallback'));
    final _sdkNativeEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkNativeEngine);
    final _callbackHandle = sdkCoreAuthenticationcallbackToFfi(callback);
    _authenticateFfi(__lib.LibraryContext.isolateId, _sdkNativeEngineHandle, _callbackHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkNativeEngineHandle);
    sdkCoreAuthenticationcallbackReleaseFfiHandle(_callbackHandle);

  }

  AuthenticationData authenticateWithSDKNativeEngine(SDKNativeEngine sdkNativeEngine) {
    final _authenticateWithSDKNativeEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_Authentication_authenticate__SDKNativeEngine'));
    final _sdkNativeEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkNativeEngine);
    final __callResultHandle = _authenticateWithSDKNativeEngineFfi(__lib.LibraryContext.isolateId, _sdkNativeEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkNativeEngineHandle);
    if (_authenticateWithSDKNativeEnginesdkCoreAuthenticationAuthenticateSdknativeengineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _authenticateWithSDKNativeEnginesdkCoreAuthenticationAuthenticateSdknativeengineReturnGetError(__callResultHandle);
        _authenticateWithSDKNativeEnginesdkCoreAuthenticationAuthenticateSdknativeengineReturnReleaseHandle(__callResultHandle);
        try {
          throw AuthenticationExceptionException(sdkCoreAuthenticationerrorFromFfi(__errorHandle));
        } finally {
          sdkCoreAuthenticationerrorReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _authenticateWithSDKNativeEnginesdkCoreAuthenticationAuthenticateSdknativeengineReturnGetResult(__callResultHandle);
    _authenticateWithSDKNativeEnginesdkCoreAuthenticationAuthenticateSdknativeengineReturnReleaseHandle(__callResultHandle);
    try {
      return sdkCoreAuthenticationdataFromFfi(__resultHandle);
    } finally {
      sdkCoreAuthenticationdataReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkCoreAuthenticationToFfi(Authentication value) =>
  _sdkCoreAuthenticationCopyHandle((value as __lib.NativeBase).handle);

Authentication sdkCoreAuthenticationFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Authentication) return instance;

  final _copiedHandle = _sdkCoreAuthenticationCopyHandle(handle);
  final result = Authentication$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkCoreAuthenticationRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreAuthenticationReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreAuthenticationReleaseHandle(handle);

Pointer<Void> sdkCoreAuthenticationToFfiNullable(Authentication? value) =>
  value != null ? sdkCoreAuthenticationToFfi(value) : Pointer<Void>.fromAddress(0);

Authentication? sdkCoreAuthenticationFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreAuthenticationFromFfi(handle) : null;

void sdkCoreAuthenticationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreAuthenticationReleaseHandle(handle);

// End of Authentication "private" section.


