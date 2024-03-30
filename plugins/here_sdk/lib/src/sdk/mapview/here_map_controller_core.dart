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
import 'package:here_sdk/src/sdk/mapview/map_idle_listener.dart';

/// The representation of a dynamic and interactive geographic map.
///
/// The map manages a collection of layers of objects and spaces, presents them in a stacked layout and offers the means to focus on a certain area.
/// The layers, their relation to the objects and spaces, the layout and the representation style is described through a configuration.
abstract class HereMapControllerCore {

  /// Adds a listener for receiving idle state
  /// notifications and notifies it of the current state.
  ///
  /// The first notification received is always the state at the time of registration.
  ///
  /// The new listener is appended to the set
  /// of `HereMap` idle listeners as a strong reference.
  /// The caller is responsible for releasing the strong reference by calling
  /// [HereMapControllerCore.removeMapIdleListener].
  ///
  /// The idle state notifications can occur on an arbitrary thread.
  ///
  /// [listener] The listener
  ///
  void addMapIdleListener(MapIdleListener listener);
  /// Removes a listener from receiving idle state notifications.
  ///
  /// Notification can still be received during unregistration.
  ///
  /// [listener] The listener
  ///
  void removeMapIdleListener(MapIdleListener listener);
}


// HereMapControllerCore "private" section, not exported.

final _sdkMapviewHeremapRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_HereMap_register_finalizer'));
final _sdkMapviewHeremapCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_HereMap_copy_handle'));
final _sdkMapviewHeremapReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_HereMap_release_handle'));




class HereMapControllerCore$Impl extends __lib.NativeBase implements HereMapControllerCore {

  HereMapControllerCore$Impl(Pointer<Void> handle) : super(handle);

  @override
  void addMapIdleListener(MapIdleListener listener) {
    final _addMapIdleListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_HereMap_addMapIdleListener__MapIdleListener'));
    final _listenerHandle = sdkMapviewMapidlelistenerToFfi(listener);
    final _handle = this.handle;
    _addMapIdleListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkMapviewMapidlelistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void removeMapIdleListener(MapIdleListener listener) {
    final _removeMapIdleListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_HereMap_removeMapIdleListener__MapIdleListener'));
    final _listenerHandle = sdkMapviewMapidlelistenerToFfi(listener);
    final _handle = this.handle;
    _removeMapIdleListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkMapviewMapidlelistenerReleaseFfiHandle(_listenerHandle);

  }


}

Pointer<Void> sdkMapviewHeremapToFfi(HereMapControllerCore value) =>
  _sdkMapviewHeremapCopyHandle((value as __lib.NativeBase).handle);

HereMapControllerCore sdkMapviewHeremapFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is HereMapControllerCore) return instance;

  final _copiedHandle = _sdkMapviewHeremapCopyHandle(handle);
  final result = HereMapControllerCore$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewHeremapRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewHeremapReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewHeremapReleaseHandle(handle);

Pointer<Void> sdkMapviewHeremapToFfiNullable(HereMapControllerCore? value) =>
  value != null ? sdkMapviewHeremapToFfi(value) : Pointer<Void>.fromAddress(0);

HereMapControllerCore? sdkMapviewHeremapFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewHeremapFromFfi(handle) : null;

void sdkMapviewHeremapReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewHeremapReleaseHandle(handle);

// End of HereMapControllerCore "private" section.


