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

/// MapContext is the rendering engine and the context in which virtual geographic maps get rendered.
///
/// It runs the render loop or offers the means for the user to run a custom one.
///
/// Data sources, assets and virtual maps can be attached to the context. A virtual map can only
/// render data from sources attached to the same context.
///
/// The graphics backend to be used by the engine can be choosen by the user or a platform suitable
/// one can be automatically selected internally. Only one graphics backend can be active and once
/// selected it cannot be changed.
abstract class MapContext {

}


// MapContext "private" section, not exported.

final _sdkMapviewMapcontextRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapContext_register_finalizer'));
final _sdkMapviewMapcontextCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContext_copy_handle'));
final _sdkMapviewMapcontextReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContext_release_handle'));


class MapContext$Impl extends __lib.NativeBase implements MapContext {

  MapContext$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkMapviewMapcontextToFfi(MapContext value) =>
  _sdkMapviewMapcontextCopyHandle((value as __lib.NativeBase).handle);

MapContext sdkMapviewMapcontextFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapContext) return instance;

  final _copiedHandle = _sdkMapviewMapcontextCopyHandle(handle);
  final result = MapContext$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapcontextRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapcontextReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcontextReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcontextToFfiNullable(MapContext? value) =>
  value != null ? sdkMapviewMapcontextToFfi(value) : Pointer<Void>.fromAddress(0);

MapContext? sdkMapviewMapcontextFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcontextFromFfi(handle) : null;

void sdkMapviewMapcontextReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcontextReleaseHandle(handle);

// End of MapContext "private" section.


