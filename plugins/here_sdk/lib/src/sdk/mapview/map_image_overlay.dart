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
import 'package:here_sdk/src/sdk/core/anchor2_d.dart';
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/mapview/map_image.dart';
import 'package:meta/meta.dart';

/// MapImageOverlay is used to draw images over the map, at a view coordinate inside the map viewport.
///
/// The image to be displayed is represented by a [MapImage] object.
/// By default, the overlay is centered on the given view coordinate.
///
/// The resulting viewport area covered by the overlay is computed out of the overlay's view coordinate,
/// the anchor point and the image size. The overlay subareas that fall outside of the map viewport get clipped.
///
/// To display the map overlay, it needs to be added to the scene using [MapScene.addMapImageOverlay].
/// To stop displaying it, remove it from the scene using [MapScene.removeMapImageOverlay].
abstract class MapImageOverlay {
  /// Creates an instance of an overlay at given view coordinates, represented by specified image.
  ///
  /// [viewCoordinates] The overlay's view coordinates in pixels.
  ///
  /// [image] The image to draw on the map.
  ///
  factory MapImageOverlay(Point2D viewCoordinates, MapImage image) => $prototype.$init(viewCoordinates, image);
  /// Creates an instance of an overlay at given view coordinates, represented by specified image,
  /// with anchor point specifying how the image is positioned relative to the overlay's view coordinates.
  ///
  /// The anchor is a way of specifying position offset relative to image's dimensions on the view.
  /// For example, (0, 0) places the top-left corner of the image at the overlay's view coordinates.
  /// (1, 1) would place the bottom-right corner of the image at the overlay's view coordinates.
  /// (0.5, 0.5) which is the default value would center the image at the overlay's view coordinates.
  /// Values outside the 0..1 range are also allowed, for example (0.5, 2) would display the image
  /// centered horizontally with its bottom edge above the overlay's view coordinates at the distance
  /// in pixels that is equal to the height of the image.
  ///
  /// [viewCoordinates] The overlay's view coordinates in pixels.
  ///
  /// [image] The image to draw on the map.
  ///
  /// [anchor] The anchor point for the overlay image which specifies the position offset relative
  /// to the overlay's view coordinates.
  ///
  factory MapImageOverlay.withAnchor(Point2D viewCoordinates, MapImage image, Anchor2D anchor) => $prototype.withAnchor(viewCoordinates, image, anchor);

  /// Gets the view point in pixels on the map viewport where the overlay is drawn.
  Point2D get viewCoordinates;
  /// Sets the view point in pixels on the map viewport where the overlay is drawn.
  set viewCoordinates(Point2D value);

  /// Gets MapImageOverlay draw order. The default value is 0.
  int get drawOrder;
  /// Sets MapImageOverlay draw order. Overlays with higher draw order value are drawn
  /// on top of overlays with lower draw order. In case multiple overlays have the same draw order value
  /// then the order in which they were added to the scene matters. Last added overlay is drawn on top.
  /// Allowed range is \[0, 1023\]. Values outside this range will be clamped.
  set drawOrder(int value);

  /// Gets currently used map image.
  MapImage get image;
  /// Sets the image overlayed on map.
  set image(MapImage value);

  /// Gets current anchor point for the overlay image.
  Anchor2D get anchor;
  /// Sets anchor point of the overlay image which specifies the position offset relative
  /// to the overlay's view coordinates.
  /// For example, (0, 0) places the top-left corner of the image at the overlay's view coordinates.
  /// (1, 1) would place the bottom-right corner of the image at the overlay's view coordinates.
  /// (0.5, 0.5) which is the default value would center the image at the overlay's view coordinates.
  /// Values outside the 0..1 range are also allowed, for example (0.5, 2) would display the image
  /// centered horizontally with its bottom edge above the overlay's view coordinates at the distance
  /// in pixels that is equal to the height of the image.
  set anchor(Anchor2D value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapImageOverlay$Impl(Pointer<Void>.fromAddress(0));
}


// MapImageOverlay "private" section, not exported.

final _sdkMapviewMapimageoverlayRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapImageOverlay_register_finalizer'));
final _sdkMapviewMapimageoverlayCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImageOverlay_copy_handle'));
final _sdkMapviewMapimageoverlayReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImageOverlay_release_handle'));




/// @nodoc
@visibleForTesting
class MapImageOverlay$Impl extends __lib.NativeBase implements MapImageOverlay {

  MapImageOverlay$Impl(Pointer<Void> handle) : super(handle);


  MapImageOverlay $init(Point2D viewCoordinates, MapImage image) {
    final _result_handle = _$init(viewCoordinates, image);
    final _result = MapImageOverlay$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapimageoverlayRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapImageOverlay withAnchor(Point2D viewCoordinates, MapImage image, Anchor2D anchor) {
    final _result_handle = _withAnchor(viewCoordinates, image, anchor);
    final _result = MapImageOverlay$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapimageoverlayRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(Point2D viewCoordinates, MapImage image) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapImageOverlay_make__Point2D_MapImage'));
    final _viewCoordinatesHandle = sdkCorePoint2dToFfi(viewCoordinates);
    final _imageHandle = sdkMapviewMapimageToFfi(image);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _viewCoordinatesHandle, _imageHandle);
    sdkCorePoint2dReleaseFfiHandle(_viewCoordinatesHandle);
    sdkMapviewMapimageReleaseFfiHandle(_imageHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withAnchor(Point2D viewCoordinates, MapImage image, Anchor2D anchor) {
    final _withAnchorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapImageOverlay_make__Point2D_MapImage_Anchor2D'));
    final _viewCoordinatesHandle = sdkCorePoint2dToFfi(viewCoordinates);
    final _imageHandle = sdkMapviewMapimageToFfi(image);
    final _anchorHandle = sdkCoreAnchor2dToFfi(anchor);
    final __resultHandle = _withAnchorFfi(__lib.LibraryContext.isolateId, _viewCoordinatesHandle, _imageHandle, _anchorHandle);
    sdkCorePoint2dReleaseFfiHandle(_viewCoordinatesHandle);
    sdkMapviewMapimageReleaseFfiHandle(_imageHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_anchorHandle);
    return __resultHandle;
  }

  @override
  Point2D get viewCoordinates {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapImageOverlay_viewCoordinates_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCorePoint2dFromFfi(__resultHandle);
    } finally {
      sdkCorePoint2dReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set viewCoordinates(Point2D value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapImageOverlay_viewCoordinates_set__Point2D'));
    final _valueHandle = sdkCorePoint2dToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCorePoint2dReleaseFfiHandle(_valueHandle);

  }


  @override
  int get drawOrder {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapImageOverlay_drawOrder_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set drawOrder(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapImageOverlay_drawOrder_set__Int'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  MapImage get image {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapImageOverlay_image_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapimageFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapimageReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set image(MapImage value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapImageOverlay_image_set__MapImage'));
    final _valueHandle = sdkMapviewMapimageToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkMapviewMapimageReleaseFfiHandle(_valueHandle);

  }


  @override
  Anchor2D get anchor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapImageOverlay_anchor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreAnchor2dFromFfi(__resultHandle);
    } finally {
      sdkCoreAnchor2dReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set anchor(Anchor2D value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapImageOverlay_anchor_set__Anchor2D'));
    final _valueHandle = sdkCoreAnchor2dToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkMapviewMapimageoverlayToFfi(MapImageOverlay value) =>
  _sdkMapviewMapimageoverlayCopyHandle((value as __lib.NativeBase).handle);

MapImageOverlay sdkMapviewMapimageoverlayFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapImageOverlay) return instance;

  final _copiedHandle = _sdkMapviewMapimageoverlayCopyHandle(handle);
  final result = MapImageOverlay$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapimageoverlayRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapimageoverlayReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapimageoverlayReleaseHandle(handle);

Pointer<Void> sdkMapviewMapimageoverlayToFfiNullable(MapImageOverlay? value) =>
  value != null ? sdkMapviewMapimageoverlayToFfi(value) : Pointer<Void>.fromAddress(0);

MapImageOverlay? sdkMapviewMapimageoverlayFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapimageoverlayFromFfi(handle) : null;

void sdkMapviewMapimageoverlayReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapimageoverlayReleaseHandle(handle);

// End of MapImageOverlay "private" section.


