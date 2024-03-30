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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker3_d.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker_cluster.dart';
import 'package:here_sdk/src/sdk/mapview/map_polygon.dart';
import 'package:here_sdk/src/sdk/mapview/map_polyline.dart';

/// Carries results from the picking of map items on the map scene.
abstract class PickMapItemsResult {

  /// Gets list of clustered marker groups at the location of picking.
  List<MapMarkerClusterGrouping> get clusteredMarkers;

  /// Gets list of markers at the location of picking.
  List<MapMarker> get markers;

  /// Gets list of 3d markers at the location of picking.
  List<MapMarker3D> get markers3d;

  /// Gets list of polylines at the location of picking.
  List<MapPolyline> get polylines;

  /// Gets list of polygons at the location of picking.
  List<MapPolygon> get polygons;

}


// PickMapItemsResult "private" section, not exported.

final _sdkMapviewPickmapitemsresultRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_PickMapItemsResult_register_finalizer'));
final _sdkMapviewPickmapitemsresultCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapItemsResult_copy_handle'));
final _sdkMapviewPickmapitemsresultReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapItemsResult_release_handle'));


class PickMapItemsResult$Impl extends __lib.NativeBase implements PickMapItemsResult {

  PickMapItemsResult$Impl(Pointer<Void> handle) : super(handle);

  @override
  List<MapMarkerClusterGrouping> get clusteredMarkers {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapItemsResult_clusteredMarkers_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingslistofSdkMapviewMapmarkerclusterGroupingFromFfi(__resultHandle);
    } finally {
      harpSdkBindingslistofSdkMapviewMapmarkerclusterGroupingReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<MapMarker> get markers {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapItemsResult_markers_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingslistofSdkMapviewMapmarkerFromFfi(__resultHandle);
    } finally {
      harpSdkBindingslistofSdkMapviewMapmarkerReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<MapMarker3D> get markers3d {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapItemsResult_markers3d_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingslistofSdkMapviewMapmarker3dFromFfi(__resultHandle);
    } finally {
      harpSdkBindingslistofSdkMapviewMapmarker3dReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<MapPolyline> get polylines {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapItemsResult_polylines_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingslistofSdkMapviewMappolylineFromFfi(__resultHandle);
    } finally {
      harpSdkBindingslistofSdkMapviewMappolylineReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<MapPolygon> get polygons {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapItemsResult_polygons_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingslistofSdkMapviewMappolygonFromFfi(__resultHandle);
    } finally {
      harpSdkBindingslistofSdkMapviewMappolygonReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkMapviewPickmapitemsresultToFfi(PickMapItemsResult value) =>
  _sdkMapviewPickmapitemsresultCopyHandle((value as __lib.NativeBase).handle);

PickMapItemsResult sdkMapviewPickmapitemsresultFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PickMapItemsResult) return instance;

  final _copiedHandle = _sdkMapviewPickmapitemsresultCopyHandle(handle);
  final result = PickMapItemsResult$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewPickmapitemsresultRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewPickmapitemsresultReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewPickmapitemsresultReleaseHandle(handle);

Pointer<Void> sdkMapviewPickmapitemsresultToFfiNullable(PickMapItemsResult? value) =>
  value != null ? sdkMapviewPickmapitemsresultToFfi(value) : Pointer<Void>.fromAddress(0);

PickMapItemsResult? sdkMapviewPickmapitemsresultFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewPickmapitemsresultFromFfi(handle) : null;

void sdkMapviewPickmapitemsresultReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewPickmapitemsresultReleaseHandle(handle);

// End of PickMapItemsResult "private" section.


