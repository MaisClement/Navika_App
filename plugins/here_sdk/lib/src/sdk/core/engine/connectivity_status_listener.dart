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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/connectivity_status.dart';

/// A listener, which client code have to implement for receiving notifications about connectivity status.
/// @nodoc
abstract class ConnectivityStatusListener {
  /// A listener, which client code have to implement for receiving notifications about connectivity status.
  /// @nodoc

  factory ConnectivityStatusListener(
    void Function(ConnectivityStatus) onConnectivityStatusChangeLambda,

  ) => ConnectivityStatusListener$Lambdas(
    onConnectivityStatusChangeLambda,

  );


  void onConnectivityStatusChange(ConnectivityStatus reachable);
}


// ConnectivityStatusListener "private" section, not exported.

final _sdkCoreEngineConnectivitystatuslistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_engine_ConnectivityStatusListener_register_finalizer'));
final _sdkCoreEngineConnectivitystatuslistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ConnectivityStatusListener_copy_handle'));
final _sdkCoreEngineConnectivitystatuslistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ConnectivityStatusListener_release_handle'));
final _sdkCoreEngineConnectivitystatuslistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_core_engine_ConnectivityStatusListener_create_proxy'));
final _sdkCoreEngineConnectivitystatuslistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ConnectivityStatusListener_get_type_id'));


class ConnectivityStatusListener$Lambdas implements ConnectivityStatusListener {
  void Function(ConnectivityStatus) onConnectivityStatusChangeLambda;

  ConnectivityStatusListener$Lambdas(
    this.onConnectivityStatusChangeLambda,

  );

  @override
  void onConnectivityStatusChange(ConnectivityStatus reachable) =>
    onConnectivityStatusChangeLambda(reachable);
}

class ConnectivityStatusListener$Impl extends __lib.NativeBase implements ConnectivityStatusListener {

  ConnectivityStatusListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onConnectivityStatusChange(ConnectivityStatus reachable) {
    final _onConnectivityStatusChangeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_core_engine_ConnectivityStatusListener_onConnectivityStatusChange__ConnectivityStatus'));
    final _reachableHandle = sdkCoreEngineConnectivitystatusToFfi(reachable);
    final _handle = this.handle;
    _onConnectivityStatusChangeFfi(_handle, __lib.LibraryContext.isolateId, _reachableHandle);
    sdkCoreEngineConnectivitystatusReleaseFfiHandle(_reachableHandle);

  }


}

int _sdkCoreEngineConnectivitystatuslisteneronConnectivityStatusChangeStatic(Object _obj, int reachable) {

  try {
    (_obj as ConnectivityStatusListener).onConnectivityStatusChange(sdkCoreEngineConnectivitystatusFromFfi(reachable));
  } finally {
    sdkCoreEngineConnectivitystatusReleaseFfiHandle(reachable);
  }
  return 0;
}


Pointer<Void> sdkCoreEngineConnectivitystatuslistenerToFfi(ConnectivityStatusListener value) {
  if (value is __lib.NativeBase) return _sdkCoreEngineConnectivitystatuslistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkCoreEngineConnectivitystatuslistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Uint32)>(_sdkCoreEngineConnectivitystatuslisteneronConnectivityStatusChangeStatic, __lib.unknownError)
  );

  return result;
}

ConnectivityStatusListener sdkCoreEngineConnectivitystatuslistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ConnectivityStatusListener) return instance;

  final _typeIdHandle = _sdkCoreEngineConnectivitystatuslistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkCoreEngineConnectivitystatuslistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ConnectivityStatusListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkCoreEngineConnectivitystatuslistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreEngineConnectivitystatuslistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreEngineConnectivitystatuslistenerReleaseHandle(handle);

Pointer<Void> sdkCoreEngineConnectivitystatuslistenerToFfiNullable(ConnectivityStatusListener? value) =>
  value != null ? sdkCoreEngineConnectivitystatuslistenerToFfi(value) : Pointer<Void>.fromAddress(0);

ConnectivityStatusListener? sdkCoreEngineConnectivitystatuslistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreEngineConnectivitystatuslistenerFromFfi(handle) : null;

void sdkCoreEngineConnectivitystatuslistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineConnectivitystatuslistenerReleaseHandle(handle);

// End of ConnectivityStatusListener "private" section.


