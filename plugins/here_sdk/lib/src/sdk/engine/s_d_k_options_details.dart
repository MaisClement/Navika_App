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

/// @nodoc
abstract class SDKOptionsDetails {

  /// Converts public options to internal, which are specific for given app id.
  ///
  /// [publicOptions] The public options which are usually passed as parameter of the
  /// [SDKNativeEngine]
  ///
  /// Returns [SDKOptions]. Converted internal options
  ///
  static SDKOptions makeInternal(SDKOptions publicOptions) => $prototype.makeInternal(publicOptions);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SDKOptionsDetails$Impl(Pointer<Void>.fromAddress(0));
}


// SDKOptionsDetails "private" section, not exported.

final _sdkEngineSdkoptionsdetailsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_engine_SDKOptionsDetails_register_finalizer'));
final _sdkEngineSdkoptionsdetailsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_engine_SDKOptionsDetails_copy_handle'));
final _sdkEngineSdkoptionsdetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_engine_SDKOptionsDetails_release_handle'));



/// @nodoc
@visibleForTesting
class SDKOptionsDetails$Impl extends __lib.NativeBase implements SDKOptionsDetails {

  SDKOptionsDetails$Impl(Pointer<Void> handle) : super(handle);

  SDKOptions makeInternal(SDKOptions publicOptions) {
    final _makeInternalFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_engine_SDKOptionsDetails_makeInternal__SDKOptions'));
    final _publicOptionsHandle = sdkCoreEngineSdkoptionsToFfi(publicOptions);
    final __resultHandle = _makeInternalFfi(__lib.LibraryContext.isolateId, _publicOptionsHandle);
    sdkCoreEngineSdkoptionsReleaseFfiHandle(_publicOptionsHandle);
    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkEngineSdkoptionsdetailsToFfi(SDKOptionsDetails value) =>
  _sdkEngineSdkoptionsdetailsCopyHandle((value as __lib.NativeBase).handle);

SDKOptionsDetails sdkEngineSdkoptionsdetailsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SDKOptionsDetails) return instance;

  final _copiedHandle = _sdkEngineSdkoptionsdetailsCopyHandle(handle);
  final result = SDKOptionsDetails$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkEngineSdkoptionsdetailsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkEngineSdkoptionsdetailsReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkEngineSdkoptionsdetailsReleaseHandle(handle);

Pointer<Void> sdkEngineSdkoptionsdetailsToFfiNullable(SDKOptionsDetails? value) =>
  value != null ? sdkEngineSdkoptionsdetailsToFfi(value) : Pointer<Void>.fromAddress(0);

SDKOptionsDetails? sdkEngineSdkoptionsdetailsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkEngineSdkoptionsdetailsFromFfi(handle) : null;

void sdkEngineSdkoptionsdetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkEngineSdkoptionsdetailsReleaseHandle(handle);

// End of SDKOptionsDetails "private" section.


