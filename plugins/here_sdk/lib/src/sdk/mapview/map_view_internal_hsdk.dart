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
import 'dart:typed_data';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/anchor2_d.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/core/rectangle2_d.dart';
import 'package:here_sdk/src/sdk/core/size2_d.dart';
import 'package:here_sdk/src/sdk/gestures/gestures.dart';
import 'package:here_sdk/src/sdk/mapview/here_map_controller_core.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera.dart';
import 'package:here_sdk/src/sdk/mapview/map_context.dart';
import 'package:here_sdk/src/sdk/mapview/map_scene.dart';
import 'package:here_sdk/src/sdk/mapview/map_view_base.dart';
import 'package:here_sdk/src/sdk/mapview/map_view_lifecycle_listener.dart';

/// Internal implementation of the MapView class, which wraps around HARP's C++ API.
/// @nodoc
abstract class MapViewInternalHsdk implements MapViewBase {

  /// Creates a screenshot of the map and passes it as byte buffer to a callback.
  ///
  /// [callback] Callback to receive the screenshot bytes.
  ///
  void takeScreenshot(MapViewInternalHsdkTakeScreenshotCallback callback);
}

/// @nodoc
/// The method will be called on the main thread when takeScreenshot() has been completed.
typedef MapViewInternalHsdkTakeScreenshotCallback = void Function(Uint8List?);

// MapViewInternalHsdkTakeScreenshotCallback "private" section, not exported.

final _sdkMapviewMapviewinternalhsdkTakescreenshotcallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapViewInternalHsdk_TakeScreenshotCallback_register_finalizer'));
final _sdkMapviewMapviewinternalhsdkTakescreenshotcallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewInternalHsdk_TakeScreenshotCallback_copy_handle'));
final _sdkMapviewMapviewinternalhsdkTakescreenshotcallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewInternalHsdk_TakeScreenshotCallback_release_handle'));
final _sdkMapviewMapviewinternalhsdkTakescreenshotcallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_mapview_MapViewInternalHsdk_TakeScreenshotCallback_create_proxy'));

class MapViewInternalHsdkTakeScreenshotCallback$Impl {
  final Pointer<Void> handle;
  MapViewInternalHsdkTakeScreenshotCallback$Impl(this.handle);

  void call(Uint8List? p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewInternalHsdk_TakeScreenshotCallback_call__Blob_'));
    final _p0Handle = blobToFfiNullable(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    blobReleaseFfiHandleNullable(_p0Handle);

  }

}

int _sdkMapviewMapviewinternalhsdkTakescreenshotcallbackcallStatic(Object _obj, Pointer<Void> p0) {
  
  try {
    (_obj as MapViewInternalHsdkTakeScreenshotCallback)(blobFromFfiNullable(p0));
  } finally {
    blobReleaseFfiHandleNullable(p0);
  }
  return 0;
}

Pointer<Void> sdkMapviewMapviewinternalhsdkTakescreenshotcallbackToFfi(MapViewInternalHsdkTakeScreenshotCallback value) =>
  _sdkMapviewMapviewinternalhsdkTakescreenshotcallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_sdkMapviewMapviewinternalhsdkTakescreenshotcallbackcallStatic, __lib.unknownError)
  );

MapViewInternalHsdkTakeScreenshotCallback sdkMapviewMapviewinternalhsdkTakescreenshotcallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkMapviewMapviewinternalhsdkTakescreenshotcallbackCopyHandle(handle);
  final _impl = MapViewInternalHsdkTakeScreenshotCallback$Impl(_copiedHandle);
  final result = (Uint8List? p0) => _impl.call(p0);
  _sdkMapviewMapviewinternalhsdkTakescreenshotcallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapviewinternalhsdkTakescreenshotcallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapviewinternalhsdkTakescreenshotcallbackReleaseHandle(handle);

// Nullable MapViewInternalHsdkTakeScreenshotCallback

final _sdkMapviewMapviewinternalhsdkTakescreenshotcallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewInternalHsdk_TakeScreenshotCallback_create_handle_nullable'));
final _sdkMapviewMapviewinternalhsdkTakescreenshotcallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewInternalHsdk_TakeScreenshotCallback_release_handle_nullable'));
final _sdkMapviewMapviewinternalhsdkTakescreenshotcallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewInternalHsdk_TakeScreenshotCallback_get_value_nullable'));

Pointer<Void> sdkMapviewMapviewinternalhsdkTakescreenshotcallbackToFfiNullable(MapViewInternalHsdkTakeScreenshotCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapviewinternalhsdkTakescreenshotcallbackToFfi(value);
  final result = _sdkMapviewMapviewinternalhsdkTakescreenshotcallbackCreateHandleNullable(_handle);
  sdkMapviewMapviewinternalhsdkTakescreenshotcallbackReleaseFfiHandle(_handle);
  return result;
}

MapViewInternalHsdkTakeScreenshotCallback? sdkMapviewMapviewinternalhsdkTakescreenshotcallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapviewinternalhsdkTakescreenshotcallbackGetValueNullable(handle);
  final result = sdkMapviewMapviewinternalhsdkTakescreenshotcallbackFromFfi(_handle);
  sdkMapviewMapviewinternalhsdkTakescreenshotcallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapviewinternalhsdkTakescreenshotcallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapviewinternalhsdkTakescreenshotcallbackReleaseHandleNullable(handle);

// End of MapViewInternalHsdkTakeScreenshotCallback "private" section.

// MapViewInternalHsdk "private" section, not exported.

final _sdkMapviewMapviewinternalhsdkRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapViewInternalHsdk_register_finalizer'));
final _sdkMapviewMapviewinternalhsdkCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewInternalHsdk_copy_handle'));
final _sdkMapviewMapviewinternalhsdkReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewInternalHsdk_release_handle'));
final _sdkMapviewMapviewinternalhsdkGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapViewInternalHsdk_get_type_id'));



class MapViewInternalHsdk$Impl extends __lib.NativeBase implements MapViewInternalHsdk {

  MapViewInternalHsdk$Impl(Pointer<Void> handle) : super(handle);

  @override
  void takeScreenshot(MapViewInternalHsdkTakeScreenshotCallback callback) {
    final _takeScreenshotFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewInternalHsdk_takeScreenshot__TakeScreenshotCallback'));
    final _callbackHandle = sdkMapviewMapviewinternalhsdkTakescreenshotcallbackToFfi(callback);
    final _handle = this.handle;
    _takeScreenshotFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkMapviewMapviewinternalhsdkTakescreenshotcallbackReleaseFfiHandle(_callbackHandle);

  }

  @override
  GeoCoordinates? viewToGeoCoordinates(Point2D viewCoordinates) {
    final _viewToGeoCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewInternalHsdk_viewToGeoCoordinates__Point2D'));
    final _viewCoordinatesHandle = sdkCorePoint2dToFfi(viewCoordinates);
    final _handle = this.handle;
    final __resultHandle = _viewToGeoCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _viewCoordinatesHandle);
    sdkCorePoint2dReleaseFfiHandle(_viewCoordinatesHandle);
    try {
      return sdkCoreGeocoordinatesFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  Point2D? geoToViewCoordinates(GeoCoordinates geoCoordinates) {
    final _geoToViewCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewInternalHsdk_geoToViewCoordinates__GeoCoordinates'));
    final _geoCoordinatesHandle = sdkCoreGeocoordinatesToFfi(geoCoordinates);
    final _handle = this.handle;
    final __resultHandle = _geoToViewCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _geoCoordinatesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_geoCoordinatesHandle);
    try {
      return sdkCorePoint2dFromFfiNullable(__resultHandle);
    } finally {
      sdkCorePoint2dReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  void setWatermarkLocation(Anchor2D anchor, Point2D offset) {
    final _setWatermarkLocationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewInternalHsdk_setWatermarkLocation__Anchor2D_Point2D'));
    final _anchorHandle = sdkCoreAnchor2dToFfi(anchor);
    final _offsetHandle = sdkCorePoint2dToFfi(offset);
    final _handle = this.handle;
    _setWatermarkLocationFfi(_handle, __lib.LibraryContext.isolateId, _anchorHandle, _offsetHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_anchorHandle);
    sdkCorePoint2dReleaseFfiHandle(_offsetHandle);

  }

  @override
  void addLifecycleListener(MapViewLifecycleListener lifecycleListener) {
    final _addLifecycleListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewInternalHsdk_addLifecycleListener__MapViewLifecycleListener'));
    final _lifecycleListenerHandle = sdkMapviewMapviewlifecyclelistenerToFfi(lifecycleListener);
    final _handle = this.handle;
    _addLifecycleListenerFfi(_handle, __lib.LibraryContext.isolateId, _lifecycleListenerHandle);
    sdkMapviewMapviewlifecyclelistenerReleaseFfiHandle(_lifecycleListenerHandle);

  }

  @override
  void removeLifecycleListener(MapViewLifecycleListener lifecycleListener) {
    final _removeLifecycleListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewInternalHsdk_removeLifecycleListener__MapViewLifecycleListener'));
    final _lifecycleListenerHandle = sdkMapviewMapviewlifecyclelistenerToFfi(lifecycleListener);
    final _handle = this.handle;
    _removeLifecycleListenerFfi(_handle, __lib.LibraryContext.isolateId, _lifecycleListenerHandle);
    sdkMapviewMapviewlifecyclelistenerReleaseFfiHandle(_lifecycleListenerHandle);

  }

  @override
  void pickMapItems(Point2D centerPoint, double radius, MapViewBasePickMapItemsCallback callback) {
    final _pickMapItemsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Double, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewInternalHsdk_pickMapItems__Point2D_Double_PickMapItemsCallback'));
    final _centerPointHandle = sdkCorePoint2dToFfi(centerPoint);
    final _radiusHandle = (radius);
    final _callbackHandle = sdkMapviewMapviewbasePickmapitemscallbackToFfi(callback);
    final _handle = this.handle;
    _pickMapItemsFfi(_handle, __lib.LibraryContext.isolateId, _centerPointHandle, _radiusHandle, _callbackHandle);
    sdkCorePoint2dReleaseFfiHandle(_centerPointHandle);

    sdkMapviewMapviewbasePickmapitemscallbackReleaseFfiHandle(_callbackHandle);

  }

  @override
  void pickMapContent(Rectangle2D viewArea, PickMapContentCallback callback) {
    final _pickMapContentFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapViewInternalHsdk_pickMapContent__Rectangle2D_PickMapContentCallback'));
    final _viewAreaHandle = sdkCoreRectangle2dToFfi(viewArea);
    final _callbackHandle = sdkMapviewMapviewbasePickmapcontentcallbackToFfi(callback);
    final _handle = this.handle;
    _pickMapContentFfi(_handle, __lib.LibraryContext.isolateId, _viewAreaHandle, _callbackHandle);
    sdkCoreRectangle2dReleaseFfiHandle(_viewAreaHandle);
    sdkMapviewMapviewbasePickmapcontentcallbackReleaseFfiHandle(_callbackHandle);

  }

  @override
  bool get isValid {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewInternalHsdk_isValid_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  MapCamera get camera {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewInternalHsdk_camera_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapcameraFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Gestures get gestures {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewInternalHsdk_gestures_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkGesturesGesturesFromFfi(__resultHandle);
    } finally {
      sdkGesturesGesturesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  MapScene get mapScene {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewInternalHsdk_mapScene_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapsceneFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapsceneReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  MapContext get mapContext {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewInternalHsdk_mapContext_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapcontextFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcontextReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  HereMapControllerCore get hereMapControllerCore {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewInternalHsdk_hereMap_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewHeremapFromFfi(__resultHandle);
    } finally {
      sdkMapviewHeremapReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Size2D get viewportSize {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewInternalHsdk_viewportSize_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreSize2dFromFfi(__resultHandle);
    } finally {
      sdkCoreSize2dReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  int get frameRate {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewInternalHsdk_frameRate_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set frameRate(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapViewInternalHsdk_frameRate_set'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  double get pixelScale {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewInternalHsdk_pixelScale_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  Size2D get watermarkSize {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapViewInternalHsdk_watermarkSize_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreSize2dFromFfi(__resultHandle);
    } finally {
      sdkCoreSize2dReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkMapviewMapviewinternalhsdkToFfi(MapViewInternalHsdk value) =>
  _sdkMapviewMapviewinternalhsdkCopyHandle((value as __lib.NativeBase).handle);

MapViewInternalHsdk sdkMapviewMapviewinternalhsdkFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapViewInternalHsdk) return instance;

  final _typeIdHandle = _sdkMapviewMapviewinternalhsdkGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMapviewinternalhsdkCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapViewInternalHsdk$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapviewinternalhsdkRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapviewinternalhsdkReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapviewinternalhsdkReleaseHandle(handle);

Pointer<Void> sdkMapviewMapviewinternalhsdkToFfiNullable(MapViewInternalHsdk? value) =>
  value != null ? sdkMapviewMapviewinternalhsdkToFfi(value) : Pointer<Void>.fromAddress(0);

MapViewInternalHsdk? sdkMapviewMapviewinternalhsdkFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapviewinternalhsdkFromFfi(handle) : null;

void sdkMapviewMapviewinternalhsdkReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapviewinternalhsdkReleaseHandle(handle);

// End of MapViewInternalHsdk "private" section.


