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

/// MapLayerPriority class.
///
/// Instances are configured and created via a [MapLayerPriorityBuilder].
abstract class MapLayerPriority {

}


// MapLayerPriority "private" section, not exported.

final _sdkMapviewMaplayerpriorityRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapLayerPriority_register_finalizer'));
final _sdkMapviewMaplayerpriorityCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerPriority_copy_handle'));
final _sdkMapviewMaplayerpriorityReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerPriority_release_handle'));


class MapLayerPriority$Impl extends __lib.NativeBase implements MapLayerPriority {

  MapLayerPriority$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkMapviewMaplayerpriorityToFfi(MapLayerPriority value) =>
  _sdkMapviewMaplayerpriorityCopyHandle((value as __lib.NativeBase).handle);

MapLayerPriority sdkMapviewMaplayerpriorityFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapLayerPriority) return instance;

  final _copiedHandle = _sdkMapviewMaplayerpriorityCopyHandle(handle);
  final result = MapLayerPriority$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMaplayerpriorityRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMaplayerpriorityReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMaplayerpriorityReleaseHandle(handle);

Pointer<Void> sdkMapviewMaplayerpriorityToFfiNullable(MapLayerPriority? value) =>
  value != null ? sdkMapviewMaplayerpriorityToFfi(value) : Pointer<Void>.fromAddress(0);

MapLayerPriority? sdkMapviewMaplayerpriorityFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMaplayerpriorityFromFfi(handle) : null;

void sdkMapviewMaplayerpriorityReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMaplayerpriorityReleaseHandle(handle);

// End of MapLayerPriority "private" section.


