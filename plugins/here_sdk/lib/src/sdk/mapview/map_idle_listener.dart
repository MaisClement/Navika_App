// Copyright (c) 2019-2023 HERE Global B.V. and its affiliate(s).
// All rights reserved.
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

/// Used to detect when the map becomes idle or busy.
///
/// Map is considered busy when its state changes (for example as a result of camera manipulation)
/// and/or when it requires a redraw (for example, as a result of map data being downloaded).
///
/// Map is considered idle when current state is fully rendered and no further
/// redraws are necessary.
abstract class MapIdleListener {
  /// Used to detect when the map becomes idle or busy.
  ///
  /// Map is considered busy when its state changes (for example as a result of camera manipulation)
  /// and/or when it requires a redraw (for example, as a result of map data being downloaded).
  ///
  /// Map is considered idle when current state is fully rendered and no further
  /// redraws are necessary.

  factory MapIdleListener(
    void Function() onMapBusyLambda,
    void Function() onMapIdleLambda,

  ) => MapIdleListener$Lambdas(
    onMapBusyLambda,
    onMapIdleLambda,

  );

  /// Called when map becomes invalidated and is about to be updated.
  ///
  /// One or more
  /// redraws will happen afterwards, until [MapIdleListener.onMapIdle] is called.
  ///
  void onMapBusy();
  /// Called when map finishes all state updates.
  ///
  /// No state changes or redraws
  /// will happen aftrwards until [MapIdleListener.onMapBusy] is called.
  ///
  void onMapIdle();
}


// MapIdleListener "private" section, not exported.

final _sdkMapviewMapidlelistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapIdleListener_register_finalizer'));
final _sdkMapviewMapidlelistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapIdleListener_copy_handle'));
final _sdkMapviewMapidlelistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapIdleListener_release_handle'));
final _sdkMapviewMapidlelistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('here_sdk_sdk_mapview_MapIdleListener_create_proxy'));
final _sdkMapviewMapidlelistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapIdleListener_get_type_id'));



class MapIdleListener$Lambdas implements MapIdleListener {
  void Function() onMapBusyLambda;
  void Function() onMapIdleLambda;

  MapIdleListener$Lambdas(
    this.onMapBusyLambda,
    this.onMapIdleLambda,

  );

  @override
  void onMapBusy() =>
    onMapBusyLambda();
  @override
  void onMapIdle() =>
    onMapIdleLambda();
}

class MapIdleListener$Impl extends __lib.NativeBase implements MapIdleListener {

  MapIdleListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onMapBusy() {
    final _onMapBusyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapIdleListener_onMapBusy'));
    final _handle = this.handle;
    _onMapBusyFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void onMapIdle() {
    final _onMapIdleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapIdleListener_onMapIdle'));
    final _handle = this.handle;
    _onMapIdleFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

int _sdkMapviewMapidlelisteneronMapBusyStatic(Object _obj) {

  try {
    (_obj as MapIdleListener).onMapBusy();
  } finally {
  }
  return 0;
}
int _sdkMapviewMapidlelisteneronMapIdleStatic(Object _obj) {

  try {
    (_obj as MapIdleListener).onMapIdle();
  } finally {
  }
  return 0;
}


Pointer<Void> sdkMapviewMapidlelistenerToFfi(MapIdleListener value) {
  if (value is __lib.NativeBase) return _sdkMapviewMapidlelistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkMapviewMapidlelistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkMapviewMapidlelisteneronMapBusyStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkMapviewMapidlelisteneronMapIdleStatic, __lib.unknownError)
  );

  return result;
}

MapIdleListener sdkMapviewMapidlelistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapIdleListener) return instance;

  final _typeIdHandle = _sdkMapviewMapidlelistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMapidlelistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapIdleListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapidlelistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapidlelistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapidlelistenerReleaseHandle(handle);

Pointer<Void> sdkMapviewMapidlelistenerToFfiNullable(MapIdleListener? value) =>
  value != null ? sdkMapviewMapidlelistenerToFfi(value) : Pointer<Void>.fromAddress(0);

MapIdleListener? sdkMapviewMapidlelistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapidlelistenerFromFfi(handle) : null;

void sdkMapviewMapidlelistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapidlelistenerReleaseHandle(handle);

// End of MapIdleListener "private" section.


