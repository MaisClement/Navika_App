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
import 'package:here_sdk/src/sdk/mapview/map_camera.dart';

/// Abstract class for objects that want to get updates whenever the map is redrawn after
/// camera parameters change.
abstract class MapCameraListener {
  /// Abstract class for objects that want to get updates whenever the map is redrawn after
  /// camera parameters change.

  factory MapCameraListener(
    void Function(MapCameraState) onMapCameraUpdatedLambda,

  ) => MapCameraListener$Lambdas(
    onMapCameraUpdatedLambda,

  );

  /// Called  after the map is drawn.
  ///
  /// [cameraState] Camera parameters at the time the map was drawn.
  ///
  void onMapCameraUpdated(MapCameraState cameraState);
}


// MapCameraListener "private" section, not exported.

final _sdkMapviewMapcameralistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapCameraListener_register_finalizer'));
final _sdkMapviewMapcameralistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraListener_copy_handle'));
final _sdkMapviewMapcameralistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraListener_release_handle'));
final _sdkMapviewMapcameralistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_mapview_MapCameraListener_create_proxy'));
final _sdkMapviewMapcameralistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraListener_get_type_id'));


class MapCameraListener$Lambdas implements MapCameraListener {
  void Function(MapCameraState) onMapCameraUpdatedLambda;

  MapCameraListener$Lambdas(
    this.onMapCameraUpdatedLambda,

  );

  @override
  void onMapCameraUpdated(MapCameraState cameraState) =>
    onMapCameraUpdatedLambda(cameraState);
}

class MapCameraListener$Impl extends __lib.NativeBase implements MapCameraListener {

  MapCameraListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onMapCameraUpdated(MapCameraState cameraState) {
    final _onMapCameraUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraListener_onMapCameraUpdated__State'));
    final _cameraStateHandle = sdkMapviewMapcameraStateToFfi(cameraState);
    final _handle = this.handle;
    _onMapCameraUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _cameraStateHandle);
    sdkMapviewMapcameraStateReleaseFfiHandle(_cameraStateHandle);

  }


}

int _sdkMapviewMapcameralisteneronMapCameraUpdatedStatic(Object _obj, Pointer<Void> cameraState) {

  try {
    (_obj as MapCameraListener).onMapCameraUpdated(sdkMapviewMapcameraStateFromFfi(cameraState));
  } finally {
    sdkMapviewMapcameraStateReleaseFfiHandle(cameraState);
  }
  return 0;
}


Pointer<Void> sdkMapviewMapcameralistenerToFfi(MapCameraListener value) {
  if (value is __lib.NativeBase) return _sdkMapviewMapcameralistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkMapviewMapcameralistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkMapviewMapcameralisteneronMapCameraUpdatedStatic, __lib.unknownError)
  );

  return result;
}

MapCameraListener sdkMapviewMapcameralistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapCameraListener) return instance;

  final _typeIdHandle = _sdkMapviewMapcameralistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMapcameralistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapCameraListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapcameralistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapcameralistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcameralistenerReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcameralistenerToFfiNullable(MapCameraListener? value) =>
  value != null ? sdkMapviewMapcameralistenerToFfi(value) : Pointer<Void>.fromAddress(0);

MapCameraListener? sdkMapviewMapcameralistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcameralistenerFromFfi(handle) : null;

void sdkMapviewMapcameralistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcameralistenerReleaseHandle(handle);

// End of MapCameraListener "private" section.


