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
import 'package:here_sdk/src/sdk/mapview/map_view_base.dart';

/// Provides a mechanism for observing a lifecycle of a map view and/or implementing components
/// whose lifecycle needs to be linked with that of a map view.
///
/// A `MapView` is using a
///
/// [SurfaceView](https://developer.android.com/reference/android/view/SurfaceView) for Android and
/// [CAMetalLayer](https://developer.apple.com/documentation/quartzcore/cametallayer) for iOS
/// to render its content.
abstract class MapViewLifecycleListener {
  /// Provides a mechanism for observing a lifecycle of a map view and/or implementing components
  /// whose lifecycle needs to be linked with that of a map view.
  ///
  /// A `MapView` is using a
  ///
  /// [SurfaceView](https://developer.android.com/reference/android/view/SurfaceView) for Android and
  /// [CAMetalLayer](https://developer.apple.com/documentation/quartzcore/cametallayer) for iOS
  /// to render its content.

  factory MapViewLifecycleListener(
    void Function(MapViewBase) onAttachLambda,
    void Function(MapViewBase) onDetachLambda,
    void Function() onPauseLambda,
    void Function() onResumeLambda,
    void Function() onDestroyLambda,

  ) => MapViewLifecycleListener$Lambdas(
    onAttachLambda,
    onDetachLambda,
    onPauseLambda,
    onResumeLambda,
    onDestroyLambda,

  );

  /// Called when adding [MapViewLifecycleListener] to the map view.
  ///
  /// If the map view does not
  /// have render target attached at the time of adding the listener, then this method will
  /// be called later, after render target is attached. This means that the map view it
  /// receives is always fully initialized.
  ///
  /// Can be used to implement
  /// the logic to create and add visual components to the map view.
  ///
  /// [mapView] The map view to attach to.
  ///
  void onAttach(MapViewBase mapView);
  /// Called when removing [MapViewLifecycleListener] from the map view.
  ///
  /// Can be used to implement
  /// the logic to remove visual components from the map view and release resources if necessary.
  ///
  /// [mapView] The map view to detach from.
  ///
  void onDetach(MapViewBase mapView);
  /// Called when the map view to which this [MapViewLifecycleListener] is attached to gets paused
  /// (usually when the app goes into background).
  ///
  /// This should be used by components that
  /// perform continuous updates to pause those updates until [MapViewLifecycleListener.onResume]
  /// is called.
  ///
  void onPause();
  /// Called when the map view to which this [MapViewLifecycleListener] is attached to gets resumed
  /// (usually when the app goes into foreground).
  ///
  /// This should be used by components that
  /// perform continuous updates to resume those updates after a previous call to
  /// [MapViewLifecycleListener.onPause].
  ///
  void onResume();
  /// Called when the map view to which this is attached to is destroyed.
  ///
  /// After this is called, no other [MapViewLifecycleListener] method will be invoked.
  /// This should be used to make sure all resources are freed.
  ///
  void onDestroy();
}


// MapViewLifecycleListener "private" section, not exported.

final _sdkMapviewMapviewlifecyclelistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapViewLifecycleListener_register_finalizer'));
final _sdkMapviewMapviewlifecyclelistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewLifecycleListener_copy_handle'));
final _sdkMapviewMapviewlifecyclelistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewLifecycleListener_release_handle'));
final _sdkMapviewMapviewlifecyclelistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_mapview_MapViewLifecycleListener_create_proxy'));
final _sdkMapviewMapviewlifecyclelistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewLifecycleListener_get_type_id'));






class MapViewLifecycleListener$Lambdas implements MapViewLifecycleListener {
  void Function(MapViewBase) onAttachLambda;
  void Function(MapViewBase) onDetachLambda;
  void Function() onPauseLambda;
  void Function() onResumeLambda;
  void Function() onDestroyLambda;

  MapViewLifecycleListener$Lambdas(
    this.onAttachLambda,
    this.onDetachLambda,
    this.onPauseLambda,
    this.onResumeLambda,
    this.onDestroyLambda,

  );

  @override
  void onAttach(MapViewBase mapView) =>
    onAttachLambda(mapView);
  @override
  void onDetach(MapViewBase mapView) =>
    onDetachLambda(mapView);
  @override
  void onPause() =>
    onPauseLambda();
  @override
  void onResume() =>
    onResumeLambda();
  @override
  void onDestroy() =>
    onDestroyLambda();
}

class MapViewLifecycleListener$Impl extends __lib.NativeBase implements MapViewLifecycleListener {

  MapViewLifecycleListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onAttach(MapViewBase mapView) {
    final _onAttachFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewLifecycleListener_onAttach__MapViewBase'));
    final _mapViewHandle = sdkMapviewMapviewbaseToFfi(mapView);
    final _handle = this.handle;
    _onAttachFfi(_handle, __lib.LibraryContext.isolateId, _mapViewHandle);
    sdkMapviewMapviewbaseReleaseFfiHandle(_mapViewHandle);

  }

  @override
  void onDetach(MapViewBase mapView) {
    final _onDetachFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewLifecycleListener_onDetach__MapViewBase'));
    final _mapViewHandle = sdkMapviewMapviewbaseToFfi(mapView);
    final _handle = this.handle;
    _onDetachFfi(_handle, __lib.LibraryContext.isolateId, _mapViewHandle);
    sdkMapviewMapviewbaseReleaseFfiHandle(_mapViewHandle);

  }

  @override
  void onPause() {
    final _onPauseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewLifecycleListener_onPause'));
    final _handle = this.handle;
    _onPauseFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void onResume() {
    final _onResumeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewLifecycleListener_onResume'));
    final _handle = this.handle;
    _onResumeFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void onDestroy() {
    final _onDestroyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewLifecycleListener_onDestroy'));
    final _handle = this.handle;
    _onDestroyFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

int _sdkMapviewMapviewlifecyclelisteneronAttachStatic(Object _obj, Pointer<Void> mapView) {

  try {
    (_obj as MapViewLifecycleListener).onAttach(sdkMapviewMapviewbaseFromFfi(mapView));
  } finally {
    sdkMapviewMapviewbaseReleaseFfiHandle(mapView);
  }
  return 0;
}
int _sdkMapviewMapviewlifecyclelisteneronDetachStatic(Object _obj, Pointer<Void> mapView) {

  try {
    (_obj as MapViewLifecycleListener).onDetach(sdkMapviewMapviewbaseFromFfi(mapView));
  } finally {
    sdkMapviewMapviewbaseReleaseFfiHandle(mapView);
  }
  return 0;
}
int _sdkMapviewMapviewlifecyclelisteneronPauseStatic(Object _obj) {

  try {
    (_obj as MapViewLifecycleListener).onPause();
  } finally {
  }
  return 0;
}
int _sdkMapviewMapviewlifecyclelisteneronResumeStatic(Object _obj) {

  try {
    (_obj as MapViewLifecycleListener).onResume();
  } finally {
  }
  return 0;
}
int _sdkMapviewMapviewlifecyclelisteneronDestroyStatic(Object _obj) {

  try {
    (_obj as MapViewLifecycleListener).onDestroy();
  } finally {
  }
  return 0;
}


Pointer<Void> sdkMapviewMapviewlifecyclelistenerToFfi(MapViewLifecycleListener value) {
  if (value is __lib.NativeBase) return _sdkMapviewMapviewlifecyclelistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkMapviewMapviewlifecyclelistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkMapviewMapviewlifecyclelisteneronAttachStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkMapviewMapviewlifecyclelisteneronDetachStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkMapviewMapviewlifecyclelisteneronPauseStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkMapviewMapviewlifecyclelisteneronResumeStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkMapviewMapviewlifecyclelisteneronDestroyStatic, __lib.unknownError)
  );

  return result;
}

MapViewLifecycleListener sdkMapviewMapviewlifecyclelistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapViewLifecycleListener) return instance;

  final _typeIdHandle = _sdkMapviewMapviewlifecyclelistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMapviewlifecyclelistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapViewLifecycleListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapviewlifecyclelistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapviewlifecyclelistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapviewlifecyclelistenerReleaseHandle(handle);

Pointer<Void> sdkMapviewMapviewlifecyclelistenerToFfiNullable(MapViewLifecycleListener? value) =>
  value != null ? sdkMapviewMapviewlifecyclelistenerToFfi(value) : Pointer<Void>.fromAddress(0);

MapViewLifecycleListener? sdkMapviewMapviewlifecyclelistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapviewlifecyclelistenerFromFfi(handle) : null;

void sdkMapviewMapviewlifecyclelistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapviewlifecyclelistenerReleaseHandle(handle);

// End of MapViewLifecycleListener "private" section.


