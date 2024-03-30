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
import 'dart:ui' as ui;
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/color.dart';
import 'package:here_sdk/src/sdk/core/geo_polygon.dart';
import 'package:here_sdk/src/sdk/core/metadata.dart';
import 'package:here_sdk/src/sdk/mapview/map_measure_range.dart';
import 'package:meta/meta.dart';

/// A visual representation of a polygon on the map.
///
/// Can be used to visualize areas of all shapes
/// and sizes. The geometry to be visualized is represented by an instance of [GeoPolygon].
/// To display circular areas (for example, a position accuracy indicator) use a GeoPolygon
/// created from a [GeoCircle] using [GeoPolygon.withGeoCircle].
/// Please note that polygons which are self-intersecting are not supported and may lead to render
/// artifacts.
abstract class MapPolygon {
  /// Creates a new MapPolygon instance with outline visualization disabled and containing the geometry passed in.
  ///
  /// [geometry] The list of vertices representing the polygon.
  /// The winding order of the vertices can be in clockwise or counter-clockwise order.
  /// <br>
  /// Note: The polygon shape should not cover more than half of the globe,
  /// otherwise unexpected results may occur.
  /// Also self-intersecting polygons are not supported.
  ///
  /// [color] The fill color for the polygon
  ///
  factory MapPolygon(GeoPolygon geometry, ui.Color color) => $prototype.$init(geometry, color);
  /// Creates a new MapPolygon instance with outline visualization enabled and containing the geometry passed in.
  ///
  /// [geometry] The list of vertices representing the polygon.
  /// The winding order of the vertices can be in clockwise or counter-clockwise order.
  /// <br>
  /// Note: The polygon shape should not cover more than half of the globe,
  /// otherwise unexpected results may occur.
  /// Also self-intersecting polygons are not supported.
  ///
  /// [color] The fill color for the polygon.
  ///
  /// [outlineColor] The color of the polygon outline.
  /// Note: Transparent outlines are not supported. Any color with transparency (alpha value other than 1)
  /// will be rendered as fully opaque by interpreting the alpha value as 1.
  ///
  /// [outlineWidthInPixels] The width of the polygon outline (in pixels). The chosen value should be greater than or equal
  /// to 0. Negative values are clamped to 0.
  ///
  factory MapPolygon.withOutlineColorAndOutlineWidthInPixels(GeoPolygon geometry, ui.Color color, ui.Color outlineColor, double outlineWidthInPixels) => $prototype.withOutlineColorAndOutlineWidthInPixels(geometry, color, outlineColor, outlineWidthInPixels);

  /// Gets the current geometry of the polygon.
  GeoPolygon get geometry;
  /// Sets a new geometry to update the appearance.
  set geometry(GeoPolygon value);

  /// Gets the Metadata instance attached to this polygon.
  /// This will be `null` if nothing has been attached before.
  Metadata? get metadata;
  /// Sets the Metadata instance attached to this polygon.
  set metadata(Metadata? value);

  /// Gets the current color of the fill. `null` if there is no fill.
  ui.Color get fillColor;
  /// Sets the current color of the fill. Use fully transparent color (alpha set to 0)
  /// to disable the fill completely.
  set fillColor(ui.Color value);

  /// Gets MapPolygon draw order. Default value is 0.
  int get drawOrder;
  /// Sets MapPolygon draw order. Polygon with higher draw order value are drawn
  /// on top of polygons with lower draw order. In case multiple polygons have the same draw order value
  /// then the order in which they were added to the scene matters. Last added polygon is drawn on top.
  /// Allowed range is 0-1023. Values outside this range will be clamped.
  set drawOrder(int value);

  /// Gets the list of visibility ranges. The map polygon is visible only inside these map measure
  /// ranges. When empty (the default), the map polygon is visible without map measure restrictions.
  List<MapMeasureRange> get visibilityRanges;
  /// Sets visibility ranges for this map polygon. A range is half open -
  /// \[minimumZoomLevel, maximumZoomLevel), the given maximum value is not contained in the range.
  /// The map polygon is visible only inside these map measure ranges.
  ///
  /// When empty (the default), the map polygon is visible without map measure restrictions.
  /// Only `MapMeasureRange`(s) of [MapMeasureKind.zoomLevel] type are supported.
  /// `MapMeasureRange`(s) of other unsupported types will be ignored.
  set visibilityRanges(List<MapMeasureRange> value);

  /// Gets the color of the polygon outline.
  ui.Color get outlineColor;
  /// Sets the color of the polygon outline. The default outline color is opaque white.
  /// Note: Transparent outlines are not supported. Any color with transparency (alpha value other than 1)
  /// will be rendered as fully opaque by interpreting the alpha value as 1.
  set outlineColor(ui.Color value);

  /// Gets the outline width of the polygon in pixels.
  double get outlineWidth;
  /// Sets the outline width of the polygon in pixels. The value should be greater than or
  /// equal to 0. Negative values are adjusted to zero. By default, the outline width is set to zero.
  set outlineWidth(double value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapPolygon$Impl(Pointer<Void>.fromAddress(0));
}


// MapPolygon "private" section, not exported.

final _sdkMapviewMappolygonRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapPolygon_register_finalizer'));
final _sdkMapviewMappolygonCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolygon_copy_handle'));
final _sdkMapviewMappolygonReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolygon_release_handle'));




/// @nodoc
@visibleForTesting
class MapPolygon$Impl extends __lib.NativeBase implements MapPolygon {

  MapPolygon$Impl(Pointer<Void> handle) : super(handle);


  MapPolygon $init(GeoPolygon geometry, ui.Color color) {
    final _result_handle = _$init(geometry, color);
    final _result = MapPolygon$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMappolygonRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapPolygon withOutlineColorAndOutlineWidthInPixels(GeoPolygon geometry, ui.Color color, ui.Color outlineColor, double outlineWidthInPixels) {
    final _result_handle = _withOutlineColorAndOutlineWidthInPixels(geometry, color, outlineColor, outlineWidthInPixels);
    final _result = MapPolygon$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMappolygonRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(GeoPolygon geometry, ui.Color color) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolygon_make__GeoPolygon_Color'));
    final _geometryHandle = sdkCoreGeopolygonToFfi(geometry);
    final _colorHandle = sdkCoreColorToFfi(color);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _geometryHandle, _colorHandle);
    sdkCoreGeopolygonReleaseFfiHandle(_geometryHandle);
    sdkCoreColorReleaseFfiHandle(_colorHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withOutlineColorAndOutlineWidthInPixels(GeoPolygon geometry, ui.Color color, ui.Color outlineColor, double outlineWidthInPixels) {
    final _withOutlineColorAndOutlineWidthInPixelsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Double), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, double)>('here_sdk_sdk_mapview_MapPolygon_make__GeoPolygon_Color_Color_Double'));
    final _geometryHandle = sdkCoreGeopolygonToFfi(geometry);
    final _colorHandle = sdkCoreColorToFfi(color);
    final _outlineColorHandle = sdkCoreColorToFfi(outlineColor);
    final _outlineWidthInPixelsHandle = (outlineWidthInPixels);
    final __resultHandle = _withOutlineColorAndOutlineWidthInPixelsFfi(__lib.LibraryContext.isolateId, _geometryHandle, _colorHandle, _outlineColorHandle, _outlineWidthInPixelsHandle);
    sdkCoreGeopolygonReleaseFfiHandle(_geometryHandle);
    sdkCoreColorReleaseFfiHandle(_colorHandle);
    sdkCoreColorReleaseFfiHandle(_outlineColorHandle);

    return __resultHandle;
  }

  @override
  GeoPolygon get geometry {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolygon_geometry_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeopolygonFromFfi(__resultHandle);
    } finally {
      sdkCoreGeopolygonReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set geometry(GeoPolygon value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolygon_geometry_set__GeoPolygon'));
    final _valueHandle = sdkCoreGeopolygonToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreGeopolygonReleaseFfiHandle(_valueHandle);

  }


  @override
  Metadata? get metadata {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolygon_metadata_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolygon_metadata_set__Metadata_'));
    final _valueHandle = sdkCoreMetadataToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreMetadataReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  ui.Color get fillColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolygon_fillColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfi(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set fillColor(ui.Color value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolygon_fillColor_set__Color'));
    final _valueHandle = sdkCoreColorToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreColorReleaseFfiHandle(_valueHandle);

  }


  @override
  int get drawOrder {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolygon_drawOrder_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set drawOrder(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapPolygon_drawOrder_set__Int'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  List<MapMeasureRange> get visibilityRanges {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolygon_visibilityRanges_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolygon_visibilityRanges_set__ListOf_sdk_mapview_MapMeasureRange'));
    final _valueHandle = harpSdkBindingslistofSdkMapviewMapmeasurerangeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    harpSdkBindingslistofSdkMapviewMapmeasurerangeReleaseFfiHandle(_valueHandle);

  }


  @override
  ui.Color get outlineColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolygon_outlineColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfi(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set outlineColor(ui.Color value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolygon_outlineColor_set__Color'));
    final _valueHandle = sdkCoreColorToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreColorReleaseFfiHandle(_valueHandle);

  }


  @override
  double get outlineWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolygon_outlineWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set outlineWidth(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapPolygon_outlineWidth_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }



}

Pointer<Void> sdkMapviewMappolygonToFfi(MapPolygon value) =>
  _sdkMapviewMappolygonCopyHandle((value as __lib.NativeBase).handle);

MapPolygon sdkMapviewMappolygonFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapPolygon) return instance;

  final _copiedHandle = _sdkMapviewMappolygonCopyHandle(handle);
  final result = MapPolygon$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMappolygonRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMappolygonReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMappolygonReleaseHandle(handle);

Pointer<Void> sdkMapviewMappolygonToFfiNullable(MapPolygon? value) =>
  value != null ? sdkMapviewMappolygonToFfi(value) : Pointer<Void>.fromAddress(0);

MapPolygon? sdkMapviewMappolygonFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMappolygonFromFfi(handle) : null;

void sdkMapviewMappolygonReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMappolygonReleaseHandle(handle);

// End of MapPolygon "private" section.


