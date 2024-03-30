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
import 'package:here_sdk/src/sdk/core/geo_polyline.dart';
import 'package:here_sdk/src/sdk/mapview/map_measure.dart';
import 'package:meta/meta.dart';

/// A visual representation of an arrow on the map.
///
/// It consists of a tail - a polyline with an arbitrary
/// number of points - and a head at its end. The map arrows are only visible on zoom levels >= 13.
abstract class MapArrow {
  /// Creates a new MapArrow instance.
  ///
  /// [geometry] The geometry of the arrow tail. The last coordinate in the list defines the position where the
  /// head of the arrow is located.
  ///
  /// [widthInPixels] The width of the arrow tail in pixel. The chosen value should be greater than or equal
  /// to 0. Negative values are clamped to 0. The tip is scaled accordingly.
  ///
  /// [color] The color with which to render the arrow. The alpha channel is ignored. The color is
  /// interpreted as fully opaque.
  ///
  factory MapArrow(GeoPolyline geometry, double widthInPixels, ui.Color color) => $prototype.$init(geometry, widthInPixels, color);

  /// Gets the [MapMeasure] dependent arrow tail width in pixels.
  /// If tail width was configured without [MapMeasure] dependency, then `measureDependentTailWidth`
  /// contains single entry with measure 0 of type [MapMeasureKind.zoomLevel] and width value
  /// equal to `widthInPixels`.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behavior. Related APIs may change for new releases without a deprecation process.
  Map<MapMeasure, double> get measureDependentTailWidth;
  /// Sets the [MapMeasure] dependent arrow polyline width in pixels.
  /// Only [MapMeasure](s) of [MapMeasureKind.zoomLevel] type are supported.
  /// [MapMeasure](s) of other unsupported types will be ignored.
  /// `measureDependentTailWidth` with a single entry is equivalent to use of the `widthInPixels` value
  /// in the constructor, so a camera independent width setting.
  /// Empty `measureDependentTailWidth` is is ignored and existing width is maintained.
  /// The width values should be positive. Dictionary entries with width values less than or equal to 0 are ignored.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behavior. Related APIs may change for new releases without a deprecation process.
  set measureDependentTailWidth(Map<MapMeasure, double> value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapArrow$Impl(Pointer<Void>.fromAddress(0));
}


// MapArrow "private" section, not exported.

final _sdkMapviewMaparrowRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapArrow_register_finalizer'));
final _sdkMapviewMaparrowCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapArrow_copy_handle'));
final _sdkMapviewMaparrowReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapArrow_release_handle'));



/// @nodoc
@visibleForTesting
class MapArrow$Impl extends __lib.NativeBase implements MapArrow {

  MapArrow$Impl(Pointer<Void> handle) : super(handle);


  MapArrow $init(GeoPolyline geometry, double widthInPixels, ui.Color color) {
    final _result_handle = _$init(geometry, widthInPixels, color);
    final _result = MapArrow$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMaparrowRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(GeoPolyline geometry, double widthInPixels, ui.Color color) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Double, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapArrow_make__GeoPolyline_Double_Color'));
    final _geometryHandle = sdkCoreGeopolylineToFfi(geometry);
    final _widthInPixelsHandle = (widthInPixels);
    final _colorHandle = sdkCoreColorToFfi(color);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _geometryHandle, _widthInPixelsHandle, _colorHandle);
    sdkCoreGeopolylineReleaseFfiHandle(_geometryHandle);

    sdkCoreColorReleaseFfiHandle(_colorHandle);
    return __resultHandle;
  }

  @override
  Map<MapMeasure, double> get measureDependentTailWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapArrow_measureDependentTailWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingsmapofSdkMapviewMapmeasureToDoubleFromFfi(__resultHandle);
    } finally {
      harpSdkBindingsmapofSdkMapviewMapmeasureToDoubleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set measureDependentTailWidth(Map<MapMeasure, double> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapArrow_measureDependentTailWidth_set__MapOf_sdk_mapview_MapMeasure_to_Double'));
    final _valueHandle = harpSdkBindingsmapofSdkMapviewMapmeasureToDoubleToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    harpSdkBindingsmapofSdkMapviewMapmeasureToDoubleReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkMapviewMaparrowToFfi(MapArrow value) =>
  _sdkMapviewMaparrowCopyHandle((value as __lib.NativeBase).handle);

MapArrow sdkMapviewMaparrowFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapArrow) return instance;

  final _copiedHandle = _sdkMapviewMaparrowCopyHandle(handle);
  final result = MapArrow$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMaparrowRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMaparrowReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMaparrowReleaseHandle(handle);

Pointer<Void> sdkMapviewMaparrowToFfiNullable(MapArrow? value) =>
  value != null ? sdkMapviewMaparrowToFfi(value) : Pointer<Void>.fromAddress(0);

MapArrow? sdkMapviewMaparrowFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMaparrowFromFfi(handle) : null;

void sdkMapviewMaparrowReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMaparrowReleaseHandle(handle);

// End of MapArrow "private" section.


