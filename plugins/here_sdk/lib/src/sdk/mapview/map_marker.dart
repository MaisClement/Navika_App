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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/animation/animation_listener.dart';
import 'package:here_sdk/src/sdk/animation/map_marker_animation.dart';
import 'package:here_sdk/src/sdk/core/anchor2_d.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/metadata.dart';
import 'package:here_sdk/src/sdk/mapview/map_image.dart';
import 'package:here_sdk/src/sdk/mapview/map_measure_range.dart';
import 'package:meta/meta.dart';

/// MapMarker is used to draw images on the map, for example to mark a specific location.
///
/// By default, the marker is centered on the given geographic coordinates.
/// Markers keep their size regardless of the current zoom level of the map view.
///
/// The image to be displayed is represented by [MapImage] object. For performance reasons,
/// it is highly recommended to reuse a single instance of the image when creating multiple
/// identical markers.
///
/// To display the map marker, it needs to be added to the scene using [MapScene.addMapMarker].
/// To stop displaying it, remove it from the scene using [MapScene.removeMapMarker].
///
/// The display of a map marker is only guaranteed in case its origin is within the viewport.
/// At the moment, this is a known limitation that mostly affects map markers which are visually
/// large and cover a sizeable part of the viewport.
/// **Note:**
/// Due to technical limitations using the MapMarkers API to add a very large number of markers
/// (several thousands, especially 10000+) is not recommended. Adding this many markers will have a
/// negative impact on the performance leading to stuttering of the app and lower frame rates.
/// To work around this limitation the following approach can be used:
/// Register to map camera updates using [MapCamera.addListener]. Query the bounding box of the
/// camera viewport using [MapCamera.boundingBox] (it may be extended)
/// and then use the method [GeoBox.containsGeoCoordinates] in combination with
/// [MapCameraState.distanceToTargetInMeters] to determine which MapMarkers are actually visible
/// to the user in the current camera viewport and thus need to be added to the map.
abstract class MapMarker {
  /// Creates an instance of a marker at given coordinates, represented by specified image.
  ///
  /// [coordinates] The marker's geographical coordinates.
  ///
  /// [image] The image to draw on the map.
  ///
  factory MapMarker(GeoCoordinates coordinates, MapImage image) => $prototype.$init(coordinates, image);
  /// Creates an instance of a marker at given coordinates, represented by specified image,
  /// with anchor point specifying how the image is positioned relative to the marker's coordinates.
  ///
  /// The anchor is a way of specifying position offset relative to image's dimensions on the screen.
  /// For example, (0, 0) places the top-left corner of the image at the marker's coordinates.
  /// (1, 1) would place the bottom-right corner of the image at the marker's coordinates.
  /// (0.5, 0.5) which is the default value would center the image at the marker's coordinates.
  /// Values outside the 0..1 range are also allowed, for example (0.5, 2) would display the image
  /// centered horizontally with its bottom edge above the marker's coordinates at the distance
  /// in pixels that is equal to the height of the image.
  ///
  /// [coordinates] The marker's geographical coordinates.
  ///
  /// [image] The image to draw on the map.
  ///
  /// [anchor] The anchor point for the marker image which specifies the position offset relative
  /// to the marker's coordinates.
  ///
  factory MapMarker.withAnchor(GeoCoordinates coordinates, MapImage image, Anchor2D anchor) => $prototype.withAnchor(coordinates, image, anchor);

  /// Starts animation of map marker according to provided [MapMarkerAnimation].
  ///
  /// Any ongoing animation of this marker instance will get cancelled.
  ///
  /// [animation] Animation to start. This object may be shared between multiple instances of [MapMarker].
  /// Starting animation on one [MapMarker] does not influence any ongoing animations on other [MapMarker] objects.
  ///
  /// [animationListener] Listener to receive notification about animation start, completion or cancellation.
  /// In case `null` is passed, no notification will be sent.
  ///
  void startAnimation(MapMarkerAnimation animation, AnimationListener? animationListener);
  /// Cancels single ongoing animation.
  ///
  /// Does nothing if animation was not started for this map marker instance.
  /// Does not cancel other animations if the same [MapMarkerAnimation] object was applied to multiple [MapMarker]
  ///
  /// [animation] The animation to cancel.
  ///
  void cancelAnimation(MapMarkerAnimation animation);
  /// Gets the point on the map where the marker is drawn.
  GeoCoordinates get coordinates;
  /// Sets the point on the map where the marker is drawn.
  set coordinates(GeoCoordinates value);

  /// Gets the Metadata instance attached to this marker.
  /// This will be `null` if nothing has been attached before.
  Metadata? get metadata;
  /// Sets the Metadata instance attached to this marker.
  set metadata(Metadata? value);

  /// Returns true if the marker allows overlap with other markers, false otherwise.
  /// Defaults to true.
  bool get isOverlapAllowed;
  /// Sets whether the marker is allowed to overlap with other markers. If false,
  /// it will disappear the moment it overlaps another marker that has
  /// a higher visibility priority. A marker that allows overlap will always be drawn.
  /// Among markers that don't allow overlap, the one with the highest draw order has
  /// priority. Marker that is hidden due to overlapping with other markers is not pickable.
  set isOverlapAllowed(bool value);

  /// Gets MapMarker draw order. The default value is 0.
  int get drawOrder;
  /// Sets MapMarker draw order. Markers with higher draw order value are drawn
  /// on top of markers with lower draw order. In case multiple markers have the same draw order value
  /// then the order in which they were added to the scene matters. Last added marker is drawn on top.
  /// Allowed range is \[0, 1023\]. Values outside this range will be clamped.
  set drawOrder(int value);

  /// Gets currently use map image
  MapImage get image;
  /// Sets map image used to represent marker on screen
  set image(MapImage value);

  /// Gets current anchor point for the marker image.
  Anchor2D get anchor;
  /// Sets anchor point of the marker image which specifies the position offset relative
  /// to the marker's coordinates.
  /// For example, (0, 0) places the top-left corner of the image at the marker's coordinates.
  /// (1, 1) would place the bottom-right corner of the image at the marker's coordinates.
  /// (0.5, 0.5) which is the default value would center the image at the marker's coordinates.
  /// Values outside the 0..1 range are also allowed, for example (0.5, 2) would display the image
  /// centered horizontally with its bottom edge above the marker's coordinates at the distance
  /// in pixels that is equal to the height of the image.
  set anchor(Anchor2D value);

  /// Gets the current opacity of the marker image.
  double get opacity;
  /// Sets the opacity of the marker image.
  /// Provided value is clamped in range \[0.0, 1.0\]. Default value is 1.0 which means marker is displayed with the default opacity of the image.
  /// Markers with opacity value set to 0.0 are still on the map and are considered for picking.
  set opacity(double value);

  /// Gets the current duration of a fade-in effect on marker addition to a scene or a fade-out effect on marker removal from a scene.
  Duration get fadeDuration;
  /// Sets duration of a fade-in effect on marker addition to a scene or a fade-out effect on marker removal from a scene.
  /// Provided value is clamped in range \[0.0, 10.0\] seconds. Default value is 0 seconds which means the effect is disabled
  /// and marker is added/removed immediately without any animation.
  /// Fade-in effect is also applied when marker leaves and then re-enter screen area.
  ///
  /// Change to this property is made asynchronously and is not guaranteed
  /// to take effect on the next rendered frame. In particular, changing fade duration and removing
  /// the marker immediately after may result in the new value being ignored for this removal.
  set fadeDuration(Duration value);

  /// Gets the list of visibility ranges. The map marker is visible only inside these map measure
  /// ranges. When empty (the default), the map marker is visible without map measure restrictions.
  List<MapMeasureRange> get visibilityRanges;
  /// Sets visibility ranges for this map marker. A range is half open -
  /// \[minimumZoomLevel, maximumZoomLevel), the given maximum value is not contained in the range.
  /// The map marker is visible only inside these map measure ranges.
  ///
  /// When empty (the default), the map marker is visible without map measure restrictions.
  /// Only `MapMeasureRange`(s) of [MapMeasureKind.zoomLevel] type are supported.
  /// `MapMeasureRange`(s) of other unsupported types will be ignored.
  set visibilityRanges(List<MapMeasureRange> value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapMarker$Impl(Pointer<Void>.fromAddress(0));
}


// MapMarker "private" section, not exported.

final _sdkMapviewMapmarkerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapMarker_register_finalizer'));
final _sdkMapviewMapmarkerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker_copy_handle'));
final _sdkMapviewMapmarkerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker_release_handle'));






/// @nodoc
@visibleForTesting
class MapMarker$Impl extends __lib.NativeBase implements MapMarker {

  MapMarker$Impl(Pointer<Void> handle) : super(handle);


  MapMarker $init(GeoCoordinates coordinates, MapImage image) {
    final _result_handle = _$init(coordinates, image);
    final _result = MapMarker$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapmarkerRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapMarker withAnchor(GeoCoordinates coordinates, MapImage image, Anchor2D anchor) {
    final _result_handle = _withAnchor(coordinates, image, anchor);
    final _result = MapMarker$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapmarkerRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(GeoCoordinates coordinates, MapImage image) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker_make__GeoCoordinates_MapImage'));
    final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(coordinates);
    final _imageHandle = sdkMapviewMapimageToFfi(image);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _coordinatesHandle, _imageHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    sdkMapviewMapimageReleaseFfiHandle(_imageHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withAnchor(GeoCoordinates coordinates, MapImage image, Anchor2D anchor) {
    final _withAnchorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker_make__GeoCoordinates_MapImage_Anchor2D'));
    final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(coordinates);
    final _imageHandle = sdkMapviewMapimageToFfi(image);
    final _anchorHandle = sdkCoreAnchor2dToFfi(anchor);
    final __resultHandle = _withAnchorFfi(__lib.LibraryContext.isolateId, _coordinatesHandle, _imageHandle, _anchorHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    sdkMapviewMapimageReleaseFfiHandle(_imageHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_anchorHandle);
    return __resultHandle;
  }

  @override
  void startAnimation(MapMarkerAnimation animation, AnimationListener? animationListener) {
    final _startAnimationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker_startAnimation__MapMarkerAnimation_AnimationListener_'));
    final _animationHandle = sdkAnimationMapmarkeranimationToFfi(animation);
    final _animationListenerHandle = sdkAnimationAnimationlistenerToFfiNullable(animationListener);
    final _handle = this.handle;
    _startAnimationFfi(_handle, __lib.LibraryContext.isolateId, _animationHandle, _animationListenerHandle);
    sdkAnimationMapmarkeranimationReleaseFfiHandle(_animationHandle);
    sdkAnimationAnimationlistenerReleaseFfiHandleNullable(_animationListenerHandle);

  }

  @override
  void cancelAnimation(MapMarkerAnimation animation) {
    final _cancelAnimationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker_cancelAnimation__MapMarkerAnimation'));
    final _animationHandle = sdkAnimationMapmarkeranimationToFfi(animation);
    final _handle = this.handle;
    _cancelAnimationFfi(_handle, __lib.LibraryContext.isolateId, _animationHandle);
    sdkAnimationMapmarkeranimationReleaseFfiHandle(_animationHandle);

  }

  @override
  GeoCoordinates get coordinates {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_coordinates_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set coordinates(GeoCoordinates value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker_coordinates_set__GeoCoordinates'));
    final _valueHandle = sdkCoreGeocoordinatesToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_valueHandle);

  }


  @override
  Metadata? get metadata {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_metadata_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreMetadataFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreMetadataReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set metadata(Metadata? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker_metadata_set__Metadata_'));
    final _valueHandle = sdkCoreMetadataToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreMetadataReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  bool get isOverlapAllowed {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_isOverlapAllowed_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isOverlapAllowed(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapMarker_isOverlapAllowed_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  @override
  int get drawOrder {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_drawOrder_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set drawOrder(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapMarker_drawOrder_set__Int'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  MapImage get image {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_image_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker_image_set__MapImage'));
    final _valueHandle = sdkMapviewMapimageToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkMapviewMapimageReleaseFfiHandle(_valueHandle);

  }


  @override
  Anchor2D get anchor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_anchor_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker_anchor_set__Anchor2D'));
    final _valueHandle = sdkCoreAnchor2dToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_valueHandle);

  }


  @override
  double get opacity {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_opacity_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set opacity(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapMarker_opacity_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  Duration get fadeDuration {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_fadeDuration_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return durationFromFfi(__resultHandle);
    } finally {
      durationReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set fadeDuration(Duration value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint64), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapMarker_fadeDuration_set__Duration'));
    final _valueHandle = durationToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    durationReleaseFfiHandle(_valueHandle);

  }


  @override
  List<MapMeasureRange> get visibilityRanges {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarker_visibilityRanges_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingslistofSdkMapviewMapmeasurerangeFromFfi(__resultHandle);
    } finally {
      harpSdkBindingslistofSdkMapviewMapmeasurerangeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set visibilityRanges(List<MapMeasureRange> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker_visibilityRanges_set__ListOf_sdk_mapview_MapMeasureRange'));
    final _valueHandle = harpSdkBindingslistofSdkMapviewMapmeasurerangeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    harpSdkBindingslistofSdkMapviewMapmeasurerangeReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkMapviewMapmarkerToFfi(MapMarker value) =>
  _sdkMapviewMapmarkerCopyHandle((value as __lib.NativeBase).handle);

MapMarker sdkMapviewMapmarkerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapMarker) return instance;

  final _copiedHandle = _sdkMapviewMapmarkerCopyHandle(handle);
  final result = MapMarker$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapmarkerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapmarkerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapmarkerReleaseHandle(handle);

Pointer<Void> sdkMapviewMapmarkerToFfiNullable(MapMarker? value) =>
  value != null ? sdkMapviewMapmarkerToFfi(value) : Pointer<Void>.fromAddress(0);

MapMarker? sdkMapviewMapmarkerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapmarkerFromFfi(handle) : null;

void sdkMapviewMapmarkerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmarkerReleaseHandle(handle);

// End of MapMarker "private" section.


