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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/mapview/map_layer_priority.dart';
import 'package:here_sdk/src/sdk/mapview/style.dart';

/// Interface for managing a map layer.
///
/// A map layer can be created by using the [MapLayerBuilder]. At creation, the layer
/// gets added to a map. The layer gets removed from the map upon instance destruction.
abstract class MapLayer {

  /// Sets whether or not the layer is enabled to be drawn.
  ///
  /// [enable] True to enable the layer, false to disable it.
  ///
  void setEnabled(bool enable);
  /// Sets the style to be used by the layer.
  ///
  /// For more details see Custom Layer Style Reference in the documentation.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behavior. Related APIs may change for new releases without a deprecation process.
  ///
  /// [style] Style for the layer.
  ///
  void setStyle(Style style);
  /// Sets the render priority for the layer.
  ///
  /// [priority] Priority for the layer.
  ///
  void setPriority(MapLayerPriority priority);
  /// Frees all internally used resources.
  ///
  /// After calling this method, the object
  /// is not usable anymore.
  ///
  void destroy();
}


// MapLayer "private" section, not exported.

final _sdkMapviewMaplayerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapLayer_register_finalizer'));
final _sdkMapviewMaplayerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayer_copy_handle'));
final _sdkMapviewMaplayerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayer_release_handle'));






class MapLayer$Impl extends __lib.NativeBase implements MapLayer {

  MapLayer$Impl(Pointer<Void> handle) : super(handle);

  @override
  void setEnabled(bool enable) {
    final _setEnabledFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapLayer_setEnabled__Boolean'));
    final _enableHandle = booleanToFfi(enable);
    final _handle = this.handle;
    _setEnabledFfi(_handle, __lib.LibraryContext.isolateId, _enableHandle);
    booleanReleaseFfiHandle(_enableHandle);

  }

  @override
  void setStyle(Style style) {
    final _setStyleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapLayer_setStyle__Style'));
    final _styleHandle = sdkMapviewStyleToFfi(style);
    final _handle = this.handle;
    _setStyleFfi(_handle, __lib.LibraryContext.isolateId, _styleHandle);
    sdkMapviewStyleReleaseFfiHandle(_styleHandle);

  }

  @override
  void setPriority(MapLayerPriority priority) {
    final _setPriorityFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapLayer_setPriority__MapLayerPriority'));
    final _priorityHandle = sdkMapviewMaplayerpriorityToFfi(priority);
    final _handle = this.handle;
    _setPriorityFfi(_handle, __lib.LibraryContext.isolateId, _priorityHandle);
    sdkMapviewMaplayerpriorityReleaseFfiHandle(_priorityHandle);

  }

  @override
  void destroy() {
    final _destroyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapLayer_destroy'));
    final _handle = this.handle;
    _destroyFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

Pointer<Void> sdkMapviewMaplayerToFfi(MapLayer value) =>
  _sdkMapviewMaplayerCopyHandle((value as __lib.NativeBase).handle);

MapLayer sdkMapviewMaplayerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapLayer) return instance;

  final _copiedHandle = _sdkMapviewMaplayerCopyHandle(handle);
  final result = MapLayer$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMaplayerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMaplayerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMaplayerReleaseHandle(handle);

Pointer<Void> sdkMapviewMaplayerToFfiNullable(MapLayer? value) =>
  value != null ? sdkMapviewMaplayerToFfi(value) : Pointer<Void>.fromAddress(0);

MapLayer? sdkMapviewMaplayerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMaplayerFromFfi(handle) : null;

void sdkMapviewMaplayerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMaplayerReleaseHandle(handle);

// End of MapLayer "private" section.


