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

import 'dart:async';
import 'dart:ffi';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/pass_through_feature.dart';
import 'package:here_sdk/src/sdk/core/engine/proxy_settings.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_options.dart';
import 'package:here_sdk/src/sdk/core/engine/usage_stats.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/parameter_configuration.dart';
import 'package:meta/meta.dart';

/// Holds internal services and configurations needed by various HERE SDK modules.
///
/// You can initialize the HERE SDK in two ways:
///
/// - Create a shared instance of the `SDKNativeEngine` with `SDKNativeEngine.makeSharedInstance()`.
/// - Create individual instances of the `SDKNativeEngine` via `SDKNativeEngine()`. Note that this does not automatically set a shared instance.
abstract class SDKNativeEngine {
  /// Makes a new instance of SDKNativeEngine using supplied options.
  ///
  /// [options] The options for the new engine.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory SDKNativeEngine(SDKOptions options) => $prototype.make(options);

  /// Overrides HERE SDK access key secret with new value.
  ///
  /// The new credentials will be used for new requests.
  ///
  /// **Note:**
  /// This method can be called from any thread.
  /// Access key ID can be set with constructor of SDKNativeEngine.
  /// New instance of SDKNativeEngine should be used if a new access key ID is required.
  ///
  /// [accessKeySecret] New access key secret.
  ///
  void setAccessKeySecret(String accessKeySecret);
  /// Overrides the token scope of the HERE SDK with new value.
  ///
  /// A new token will be fetched with the set scope and used for future requests.
  /// Setting an empty string will fetch a token for the global scope.
  ///
  /// This method can be called from any thread.
  ///
  /// [scope] New scope for token
  ///
  void setAccessScope(String scope);
  /// Stops pending requests and closes open files and databases in main thread.
  ///
  /// Dispose signal is sent to dependent modules.
  /// Usage of engine, or dependent modules after calling dispose leads to undefined behavior.
  /// Please be aware that this method does not clean any type of storage.
  /// **Note:**
  /// This method should be called from main thread.
  ///
  Future<void> dispose();
  /// Enable or disable [UsageStats] for the HERE SDK.
  ///
  /// Defaults to disabled (false). When enabled, `SDKNativeEngine.getSdkUsageStats()`
  /// returns actual online data consumption. Note that the flag does not cancel pending requests.
  /// [UsageStats] can be enabled or disabled at any time.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [enabled] True, if UsageStats are enabled.
  ///
  void enableUsageStats(bool enabled);
  /// Makes a new instance of SDKNativeEngine using supplied options and stores it as shared instance
  /// see [SDKNativeEngine.sharedInstance].
  ///
  /// If there was previously shared instance
  /// then it's disposed (see [SDKNativeEngine.dispose])
  /// before new instance is created.
  ///
  /// [options] The options for the new engine.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  static Future<void> makeSharedInstance(SDKOptions options) => $prototype.makeSharedInstance(options);
  /// Clear persistent storage for the HERE SDK [UsageStats].
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  void clearPersistentUsageStats();
  /// Clear cache for the HERE SDK [UsageStats].
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  void clearUsageStatsCache();
  /// Gets the options used by this instance of [SDKNativeEngine].
  SDKOptions get options;

  /// Gets the shared instance of this SDK engine that can be accessed by any HERE SDK module as the default
  /// engine. This is automatically set as a part of the SDK initialization process.
  static SDKNativeEngine? get sharedInstance => $prototype.sharedInstance;
  /// Sets the shared instance of this SDK engine that can be accessed by any HERE SDK module as the default
  /// engine. This is automatically set as a part of the SDK initialization process.
  static set sharedInstance(SDKNativeEngine? value) { $prototype.sharedInstance = value; }

  /// Returns true if the HERE SDK uses offline connection mode, otherwise returns false.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  bool get isOfflineMode;
  /// Sets the connection mode of the HERE SDK to offline or online.
  /// Defaults to false, which means the HERE SDK uses an online connection.
  /// When enabled, this prevents the HERE SDK from initiating any online connection except for provided pass through features if set.
  /// See [SDKNativeEngine.passThroughFeatures].
  /// Note that the flag does not cancel pending requests.
  /// The mode can be enabled or disabled at any time. In order to fully operate offline, the mode
  /// needs to be enabled via [SDKOptions.offlineMode].
  /// Initialization of the HERE SDK itself does not require an internet connection.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  set isOfflineMode(bool value);

  /// Gets pass through features which are allowed to use online data when HERE SDK is in offline mode.
  /// By default, reporting of HERE SDK [UsageStats] will be enabled when at least one pass-through feature was set.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  Set<PassThroughFeature>? get passThroughFeatures;
  /// Sets pass through features which are allowed to use online data when HERE SDK is in offline mode.
  /// Pass through features can be updated at any time.
  /// When offline mode is disabled, existing pass through features will be removed.
  /// These needs to be set again when you enable offline mode next time.
  /// By default, reporting of HERE SDK [UsageStats] will be enabled when at least one pass-through feature is set.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  set passThroughFeatures(Set<PassThroughFeature>? value);

  /// Gets the configuration for default values of parameters used in the HERE SDK.
  ///
  /// Note: This feature is in beta state and thus there can be bugs and unexpected behavior.
  /// Related APIs may change for new releases without a deprecation process.
  static ParameterConfiguration get parameterConfig => $prototype.parameterConfig;
  /// Sets the configuration for default values of parameters used in the HERE SDK.
  ///
  /// Note: This feature is in beta state and thus there can be bugs and unexpected behavior.
  /// Related APIs may change for new releases without a deprecation process.
  static set parameterConfig(ParameterConfiguration value) { $prototype.parameterConfig = value; }

  /// Gets the current proxy settings. Defaults to (), which indicates proxy is not enabled.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ProxySettings? get proxySettings;
  /// Sets the proxy settings, it will immediately be applied and all the pending and fresh requests will use these settings.
  /// Pass () to indicate that proxy should be disabled.
  /// If proxy is necessary from the start then it's recommended to use [NetworkSettings.proxySettings] in [SDKOptions.networkSettings].
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  set proxySettings(ProxySettings? value);

  /// Gets a list of usage statistics for all available HERE SDK features.
  /// [UsageStats] has cache and persistent storage. Reads from the persistent storage happen on `SDKNativeEngine` creation step.
  /// Writes to persistent storage happens by reaching internal limit (amount of upload bytes, by default is 50KB).
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  List<UsageStats> get sdkUsageStats;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SDKNativeEngine$Impl(Pointer<Void>.fromAddress(0));
}


// SDKNativeEngine "private" section, not exported.

final _sdkCoreEngineSdknativeengineRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_register_finalizer'));
final _sdkCoreEngineSdknativeengineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_copy_handle'));
final _sdkCoreEngineSdknativeengineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_release_handle'));


final _makesdkCoreEngineSdknativeengineMakeSdkoptionsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_make__SDKOptions_return_release_handle'));
final _makesdkCoreEngineSdknativeengineMakeSdkoptionsReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_make__SDKOptions_return_get_result'));
final _makesdkCoreEngineSdknativeengineMakeSdkoptionsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_make__SDKOptions_return_get_error'));
final _makesdkCoreEngineSdknativeengineMakeSdkoptionsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_make__SDKOptions_return_has_error'));









/// @nodoc
@visibleForTesting
class SDKNativeEngine$Impl extends __lib.NativeBase implements SDKNativeEngine {

  SDKNativeEngine$Impl(Pointer<Void> handle) : super(handle);


  SDKNativeEngine make(SDKOptions options) {
    final _result_handle = _make(options);
    final _result = SDKNativeEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkCoreEngineSdknativeengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make(SDKOptions options) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_make__SDKOptions'));
    final _optionsHandle = sdkCoreEngineSdkoptionsToFfi(options);
    final __callResultHandle = _makeFfi(__lib.LibraryContext.isolateId, _optionsHandle);
    sdkCoreEngineSdkoptionsReleaseFfiHandle(_optionsHandle);
    if (_makesdkCoreEngineSdknativeengineMakeSdkoptionsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _makesdkCoreEngineSdknativeengineMakeSdkoptionsReturnGetError(__callResultHandle);
        _makesdkCoreEngineSdknativeengineMakeSdkoptionsReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _makesdkCoreEngineSdknativeengineMakeSdkoptionsReturnGetResult(__callResultHandle);
    _makesdkCoreEngineSdknativeengineMakeSdkoptionsReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  void setAccessKeySecret(String accessKeySecret) {
    final _setAccessKeySecretFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_setAccessKeySecret__String'));
    final _accessKeySecretHandle = stringToFfi(accessKeySecret);
    final _handle = this.handle;
    _setAccessKeySecretFfi(_handle, __lib.LibraryContext.isolateId, _accessKeySecretHandle);
    stringReleaseFfiHandle(_accessKeySecretHandle);

  }

  @override
  void setAccessScope(String scope) {
    final _setAccessScopeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_setAccessScope__String'));
    final _scopeHandle = stringToFfi(scope);
    final _handle = this.handle;
    _setAccessScopeFfi(_handle, __lib.LibraryContext.isolateId, _scopeHandle);
    stringReleaseFfiHandle(_scopeHandle);

  }

  @override
  Future<void> dispose() {
    final $completer = Completer<void>();
    _dispose__async(
      () => $completer.complete()
    );
    return $completer.future;
  }

  void _dispose__async(SDKNativeEnginedispose__resultLambda _resultLambda) {
    final __dispose__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_dispose__dispose__resultLambda'));
    final __resultLambdaHandle = sdkCoreEngineSdknativeengineDisposeresultlambdaToFfi(_resultLambda);
    final _handle = this.handle;
    __dispose__asyncFfi(_handle, __lib.LibraryContext.isolateId, __resultLambdaHandle);
    sdkCoreEngineSdknativeengineDisposeresultlambdaReleaseFfiHandle(__resultLambdaHandle);

  }

  @override
  void enableUsageStats(bool enabled) {
    final _enableUsageStatsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_enableUsageStats__Boolean'));
    final _enabledHandle = booleanToFfi(enabled);
    final _handle = this.handle;
    _enableUsageStatsFfi(_handle, __lib.LibraryContext.isolateId, _enabledHandle);
    booleanReleaseFfiHandle(_enabledHandle);

  }

  Future<void> makeSharedInstance(SDKOptions options) {
    final $completer = Completer<void>();
    _makeSharedInstance__async(
      () => $completer.complete(),
      (InstantiationErrorCode $error) => $completer.completeError(InstantiationException($error)),
      options
    );
    return $completer.future;
  }

  void _makeSharedInstance__async(SDKNativeEnginemakeSharedInstance__resultLambda _resultLambda, SDKNativeEnginemakeSharedInstance__errorLambda _errorLambda, SDKOptions options) {
    final __makeSharedInstance__asyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_makeSharedInstance__makeSharedInstance__resultLambda_makeSharedInstance__errorLambda_SDKOptions'));
    final __resultLambdaHandle = sdkCoreEngineSdknativeengineMakesharedinstanceresultlambdaToFfi(_resultLambda);
    final __errorLambdaHandle = sdkCoreEngineSdknativeengineMakesharedinstanceerrorlambdaToFfi(_errorLambda);
    final _optionsHandle = sdkCoreEngineSdkoptionsToFfi(options);
    __makeSharedInstance__asyncFfi(__lib.LibraryContext.isolateId, __resultLambdaHandle, __errorLambdaHandle, _optionsHandle);
    sdkCoreEngineSdknativeengineMakesharedinstanceresultlambdaReleaseFfiHandle(__resultLambdaHandle);
    sdkCoreEngineSdknativeengineMakesharedinstanceerrorlambdaReleaseFfiHandle(__errorLambdaHandle);
    sdkCoreEngineSdkoptionsReleaseFfiHandle(_optionsHandle);

  }

  @override
  void clearPersistentUsageStats() {
    final _clearPersistentUsageStatsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_clearPersistentUsageStats'));
    final _handle = this.handle;
    _clearPersistentUsageStatsFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void clearUsageStatsCache() {
    final _clearUsageStatsCacheFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_clearUsageStatsCache'));
    final _handle = this.handle;
    _clearUsageStatsCacheFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  SDKOptions get options {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_options_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }


  SDKNativeEngine? get sharedInstance {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_engine_SDKNativeEngine_sharedInstance_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkCoreEngineSdknativeengineFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreEngineSdknativeengineReleaseFfiHandleNullable(__resultHandle);

    }

  }

  set sharedInstance(SDKNativeEngine? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_sharedInstance_set__SDKNativeEngine_'));
    final _valueHandle = sdkCoreEngineSdknativeengineToFfiNullable(value);
    _setFfi(__lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  bool get isOfflineMode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_isOfflineMode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isOfflineMode(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_isOfflineMode_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  @override
  Set<PassThroughFeature>? get passThroughFeatures {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_passThroughFeatures_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkCoreBindingssetofSdkCoreEnginePassthroughfeatureFromFfiNullable(__resultHandle);
    } finally {
      heresdkCoreBindingssetofSdkCoreEnginePassthroughfeatureReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set passThroughFeatures(Set<PassThroughFeature>? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_passThroughFeatures_set__SetOf_sdk_core_engine_PassThroughFeature_'));
    final _valueHandle = heresdkCoreBindingssetofSdkCoreEnginePassthroughfeatureToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    heresdkCoreBindingssetofSdkCoreEnginePassthroughfeatureReleaseFfiHandleNullable(_valueHandle);

  }


  ParameterConfiguration get parameterConfig {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_engine_SDKNativeEngine_parameterConfig_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkCoreParameterconfigurationFromFfi(__resultHandle);
    } finally {
      sdkCoreParameterconfigurationReleaseFfiHandle(__resultHandle);

    }

  }

  set parameterConfig(ParameterConfiguration value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_parameterConfig_set__ParameterConfiguration'));
    final _valueHandle = sdkCoreParameterconfigurationToFfi(value);
    _setFfi(__lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreParameterconfigurationReleaseFfiHandle(_valueHandle);

  }


  @override
  ProxySettings? get proxySettings {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_proxySettings_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreEngineProxysettingsFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreEngineProxysettingsReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set proxySettings(ProxySettings? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKNativeEngine_proxySettings_set__ProxySettings_'));
    final _valueHandle = sdkCoreEngineProxysettingsToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreEngineProxysettingsReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  List<UsageStats> get sdkUsageStats {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_sdkUsageStats_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkCoreBindingslistofSdkCoreEngineUsagestatsFromFfi(__resultHandle);
    } finally {
      heresdkCoreBindingslistofSdkCoreEngineUsagestatsReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkCoreEngineSdknativeengineToFfi(SDKNativeEngine value) =>
  _sdkCoreEngineSdknativeengineCopyHandle((value as __lib.NativeBase).handle);

SDKNativeEngine sdkCoreEngineSdknativeengineFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SDKNativeEngine) return instance;

  final _copiedHandle = _sdkCoreEngineSdknativeengineCopyHandle(handle);
  final result = SDKNativeEngine$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkCoreEngineSdknativeengineRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreEngineSdknativeengineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreEngineSdknativeengineReleaseHandle(handle);

Pointer<Void> sdkCoreEngineSdknativeengineToFfiNullable(SDKNativeEngine? value) =>
  value != null ? sdkCoreEngineSdknativeengineToFfi(value) : Pointer<Void>.fromAddress(0);

SDKNativeEngine? sdkCoreEngineSdknativeengineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreEngineSdknativeengineFromFfi(handle) : null;

void sdkCoreEngineSdknativeengineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineSdknativeengineReleaseHandle(handle);

// End of SDKNativeEngine "private" section.


typedef SDKNativeEnginedispose__resultLambda = void Function();

// SDKNativeEnginedispose__resultLambda "private" section, not exported.

final _sdkCoreEngineSdknativeengineDisposeresultlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_DisposeResultlambda_release_handle'));
final _sdkCoreEngineSdknativeengineDisposeresultlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_DisposeResultlambda_create_proxy'));

class SDKNativeEnginedispose__resultLambda$Impl {
  final Pointer<Void> handle;
  SDKNativeEnginedispose__resultLambda$Impl(this.handle);

  void dispose__resultLambda() {
    final _dispose__resultLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_DisposeResultlambda_call'));
    final _handle = this.handle;
    _dispose__resultLambdaFfi(_handle, __lib.LibraryContext.isolateId);

  }

}

int _sdkCoreEngineSdknativeengineDisposeresultlambdadispose__resultLambdaStatic(Object _obj) {
  
  try {
    (_obj as SDKNativeEnginedispose__resultLambda)();
  } finally {
  }
  return 0;
}

Pointer<Void> sdkCoreEngineSdknativeengineDisposeresultlambdaToFfi(SDKNativeEnginedispose__resultLambda value) =>
  _sdkCoreEngineSdknativeengineDisposeresultlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_sdkCoreEngineSdknativeengineDisposeresultlambdadispose__resultLambdaStatic, __lib.unknownError)
  );


void sdkCoreEngineSdknativeengineDisposeresultlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreEngineSdknativeengineDisposeresultlambdaReleaseHandle(handle);


// End of SDKNativeEnginedispose__resultLambda "private" section.
typedef SDKNativeEnginemakeSharedInstance__resultLambda = void Function();

// SDKNativeEnginemakeSharedInstance__resultLambda "private" section, not exported.

final _sdkCoreEngineSdknativeengineMakesharedinstanceresultlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_MakesharedinstanceResultlambda_release_handle'));
final _sdkCoreEngineSdknativeengineMakesharedinstanceresultlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_MakesharedinstanceResultlambda_create_proxy'));

class SDKNativeEnginemakeSharedInstance__resultLambda$Impl {
  final Pointer<Void> handle;
  SDKNativeEnginemakeSharedInstance__resultLambda$Impl(this.handle);

  void makeSharedInstance__resultLambda() {
    final _makeSharedInstance__resultLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_MakesharedinstanceResultlambda_call'));
    final _handle = this.handle;
    _makeSharedInstance__resultLambdaFfi(_handle, __lib.LibraryContext.isolateId);

  }

}

int _sdkCoreEngineSdknativeengineMakesharedinstanceresultlambdamakeSharedInstance__resultLambdaStatic(Object _obj) {
  
  try {
    (_obj as SDKNativeEnginemakeSharedInstance__resultLambda)();
  } finally {
  }
  return 0;
}

Pointer<Void> sdkCoreEngineSdknativeengineMakesharedinstanceresultlambdaToFfi(SDKNativeEnginemakeSharedInstance__resultLambda value) =>
  _sdkCoreEngineSdknativeengineMakesharedinstanceresultlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_sdkCoreEngineSdknativeengineMakesharedinstanceresultlambdamakeSharedInstance__resultLambdaStatic, __lib.unknownError)
  );


void sdkCoreEngineSdknativeengineMakesharedinstanceresultlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreEngineSdknativeengineMakesharedinstanceresultlambdaReleaseHandle(handle);


// End of SDKNativeEnginemakeSharedInstance__resultLambda "private" section.
typedef SDKNativeEnginemakeSharedInstance__errorLambda = void Function(InstantiationErrorCode);

// SDKNativeEnginemakeSharedInstance__errorLambda "private" section, not exported.

final _sdkCoreEngineSdknativeengineMakesharedinstanceerrorlambdaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_MakesharedinstanceErrorlambda_release_handle'));
final _sdkCoreEngineSdknativeengineMakesharedinstanceerrorlambdaCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_core_engine_SDKNativeEngine_MakesharedinstanceErrorlambda_create_proxy'));

class SDKNativeEnginemakeSharedInstance__errorLambda$Impl {
  final Pointer<Void> handle;
  SDKNativeEnginemakeSharedInstance__errorLambda$Impl(this.handle);

  void makeSharedInstance__errorLambda(InstantiationErrorCode p0) {
    final _makeSharedInstance__errorLambdaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_core_engine_SDKNativeEngine_MakesharedinstanceErrorlambda_call__InstantiationErrorCode'));
    final _p0Handle = sdkCoreErrorsInstantiationerrorcodeToFfi(p0);
    final _handle = this.handle;
    _makeSharedInstance__errorLambdaFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(_p0Handle);

  }

}

int _sdkCoreEngineSdknativeengineMakesharedinstanceerrorlambdamakeSharedInstance__errorLambdaStatic(Object _obj, int p0) {
  
  try {
    (_obj as SDKNativeEnginemakeSharedInstance__errorLambda)(sdkCoreErrorsInstantiationerrorcodeFromFfi(p0));
  } finally {
    sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(p0);
  }
  return 0;
}

Pointer<Void> sdkCoreEngineSdknativeengineMakesharedinstanceerrorlambdaToFfi(SDKNativeEnginemakeSharedInstance__errorLambda value) =>
  _sdkCoreEngineSdknativeengineMakesharedinstanceerrorlambdaCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Uint32)>(_sdkCoreEngineSdknativeengineMakesharedinstanceerrorlambdamakeSharedInstance__errorLambdaStatic, __lib.unknownError)
  );


void sdkCoreEngineSdknativeengineMakesharedinstanceerrorlambdaReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreEngineSdknativeengineMakesharedinstanceerrorlambdaReleaseHandle(handle);


// End of SDKNativeEnginemakeSharedInstance__errorLambda "private" section.
