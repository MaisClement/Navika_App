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
import 'package:here_sdk/src/sdk/core/engine/s_d_k_options.dart';
import 'package:meta/meta.dart';

/// LockingProcess helps to detect situations when cache is locked with another process and
/// attempt to create instance of [SDKNativeEngine] fails with error
/// [InstantiationErrorCode.failedToLockCacheFolder].
abstract class LockingProcess {

  /// Checks if cache folder is locked.
  ///
  /// Does nothing if cache is not locked or locked by
  /// current process. If cache is locked by a different process then the HERE SDK
  /// makes a few attempts to kill the locking application during the specified timeout.
  /// If it fails to kill the application, it attempts to remove the cache at
  /// [SDKOptions.cachePath]. This function can be used before creating a SDKNativeEngine,
  /// i.e.
  ///
  /// [sdkOptions] The options which are supposed to be used for a new instance of the engine.
  ///
  /// [maxTimeoutInMilliseconds] The maximum timeout in milliseconds. Recommended value is 300 - 500 milliseconds.
  /// If 0 or a negative value is passed then it makes only one attempt to kill the locking
  /// process (if any) and waits 30 milliseconds before exit because the system may spend a
  /// small amount of time to perform the operation.
  ///
  static void destroyLockingProcess(SDKOptions sdkOptions, int maxTimeoutInMilliseconds) => $prototype.destroyLockingProcess(sdkOptions, maxTimeoutInMilliseconds);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = LockingProcess$Impl(Pointer<Void>.fromAddress(0));
}


// LockingProcess "private" section, not exported.

final _sdkCoreEngineLockingprocessRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_engine_LockingProcess_register_finalizer'));
final _sdkCoreEngineLockingprocessCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LockingProcess_copy_handle'));
final _sdkCoreEngineLockingprocessReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LockingProcess_release_handle'));



/// @nodoc
@visibleForTesting
class LockingProcess$Impl extends __lib.NativeBase implements LockingProcess {

  LockingProcess$Impl(Pointer<Void> handle) : super(handle);

  void destroyLockingProcess(SDKOptions sdkOptions, int maxTimeoutInMilliseconds) {
    final _destroyLockingProcessFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Int64), void Function(int, Pointer<Void>, int)>('here_sdk_sdk_core_engine_LockingProcess_destroyLockingProcess__SDKOptions_Long'));
    final _sdkOptionsHandle = sdkCoreEngineSdkoptionsToFfi(sdkOptions);
    final _maxTimeoutInMillisecondsHandle = (maxTimeoutInMilliseconds);
    _destroyLockingProcessFfi(__lib.LibraryContext.isolateId, _sdkOptionsHandle, _maxTimeoutInMillisecondsHandle);
    sdkCoreEngineSdkoptionsReleaseFfiHandle(_sdkOptionsHandle);


  }


}

Pointer<Void> sdkCoreEngineLockingprocessToFfi(LockingProcess value) =>
  _sdkCoreEngineLockingprocessCopyHandle((value as __lib.NativeBase).handle);

LockingProcess sdkCoreEngineLockingprocessFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LockingProcess) return instance;

  final _copiedHandle = _sdkCoreEngineLockingprocessCopyHandle(handle);
  final result = LockingProcess$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkCoreEngineLockingprocessRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreEngineLockingprocessReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreEngineLockingprocessReleaseHandle(handle);

Pointer<Void> sdkCoreEngineLockingprocessToFfiNullable(LockingProcess? value) =>
  value != null ? sdkCoreEngineLockingprocessToFfi(value) : Pointer<Void>.fromAddress(0);

LockingProcess? sdkCoreEngineLockingprocessFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreEngineLockingprocessFromFfi(handle) : null;

void sdkCoreEngineLockingprocessReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineLockingprocessReleaseHandle(handle);

// End of LockingProcess "private" section.


