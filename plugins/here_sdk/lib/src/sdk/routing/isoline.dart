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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_polygon.dart';
import 'package:here_sdk/src/sdk/routing/isoline_range_type.dart';
import 'package:here_sdk/src/sdk/routing/map_matched_coordinates.dart';
import 'package:meta/meta.dart';

/// Represents an isoline polygon around a center point.
///
/// Any possible route between
/// the center and any point on the edges of the polygon can be travelled within the
/// given range restriction. The edges of the polygon are not guaranteed to be on the road as
/// all reachable road endpoints are smoothened to fit into one polygon shape. This
/// process can be influenced by setting [IsolineOptionsCalculation.maxPoints].
abstract class Isoline {
  /// Constructs an isoline instance.
  ///
  /// This instance is provided by the
  /// [CalculateIsolineCallback].
  ///
  /// [rangeType] Specifies the range type of the provided [Isoline.Isoline().rangeValue] list.
  ///
  /// [rangeValue] A list of range values. At least one value must be set.
  ///
  /// [center] The center of the isoline.
  ///
  /// [polygons] A list of polygons that belong to this isoline. At least one value must be set.
  ///
  factory Isoline(IsolineRangeType rangeType, double rangeValue, MapMatchedCoordinates center, List<GeoPolygon> polygons) => $prototype.make(rangeType, rangeValue, center, polygons);

  /// Gets the type of the restriction that was used to calculate this isoline.
  IsolineRangeType get rangeType;

  /// Gets the numerical value of the restriction that was used to calculate this isoline.
  double get rangeValue;

  /// Gets the center point that was used to calculate this isoline.
  /// This includes the original center that was passed to the RoutingEngine.
  MapMatchedCoordinates get center;

  /// Gets a list of polygons that belong to this isoline. An isoline can consist of multiple
  /// polygons. For example, islands that can be reached by a ferry are included.
  /// Each island is then represented as a separate polygon. However, in most cases
  /// only a single polygon is included.
  List<GeoPolygon> get polygons;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Isoline$Impl(Pointer<Void>.fromAddress(0));
}


// Isoline "private" section, not exported.

final _sdkRoutingIsolineRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_routing_Isoline_register_finalizer'));
final _sdkRoutingIsolineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Isoline_copy_handle'));
final _sdkRoutingIsolineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Isoline_release_handle'));



/// @nodoc
@visibleForTesting
class Isoline$Impl extends __lib.NativeBase implements Isoline {

  Isoline$Impl(Pointer<Void> handle) : super(handle);


  Isoline make(IsolineRangeType rangeType, double rangeValue, MapMatchedCoordinates center, List<GeoPolygon> polygons) {
    final _result_handle = _make(rangeType, rangeValue, center, polygons);
    final _result = Isoline$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingIsolineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make(IsolineRangeType rangeType, double rangeValue, MapMatchedCoordinates center, List<GeoPolygon> polygons) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Double, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, int, double, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_Isoline_make__IsolineRangeType_Double_MapMatchedCoordinates_ListOf_sdk_core_GeoPolygon'));
    final _rangeTypeHandle = sdkRoutingIsolinerangetypeToFfi(rangeType);
    final _rangeValueHandle = (rangeValue);
    final _centerHandle = sdkRoutingMapmatchedcoordinatesToFfi(center);
    final _polygonsHandle = heresdkRoutingIsolineBindingslistofSdkCoreGeopolygonToFfi(polygons);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _rangeTypeHandle, _rangeValueHandle, _centerHandle, _polygonsHandle);
    sdkRoutingIsolinerangetypeReleaseFfiHandle(_rangeTypeHandle);

    sdkRoutingMapmatchedcoordinatesReleaseFfiHandle(_centerHandle);
    heresdkRoutingIsolineBindingslistofSdkCoreGeopolygonReleaseFfiHandle(_polygonsHandle);
    return __resultHandle;
  }

  @override
  IsolineRangeType get rangeType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Isoline_rangeType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingIsolinerangetypeFromFfi(__resultHandle);
    } finally {
      sdkRoutingIsolinerangetypeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  double get rangeValue {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Isoline_rangeValue_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  MapMatchedCoordinates get center {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Isoline_center_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingMapmatchedcoordinatesFromFfi(__resultHandle);
    } finally {
      sdkRoutingMapmatchedcoordinatesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<GeoPolygon> get polygons {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Isoline_polygons_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkRoutingIsolineBindingslistofSdkCoreGeopolygonFromFfi(__resultHandle);
    } finally {
      heresdkRoutingIsolineBindingslistofSdkCoreGeopolygonReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkRoutingIsolineToFfi(Isoline value) =>
  _sdkRoutingIsolineCopyHandle((value as __lib.NativeBase).handle);

Isoline sdkRoutingIsolineFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Isoline) return instance;

  final _copiedHandle = _sdkRoutingIsolineCopyHandle(handle);
  final result = Isoline$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkRoutingIsolineRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkRoutingIsolineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingIsolineReleaseHandle(handle);

Pointer<Void> sdkRoutingIsolineToFfiNullable(Isoline? value) =>
  value != null ? sdkRoutingIsolineToFfi(value) : Pointer<Void>.fromAddress(0);

Isoline? sdkRoutingIsolineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingIsolineFromFfi(handle) : null;

void sdkRoutingIsolineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingIsolineReleaseHandle(handle);

// End of Isoline "private" section.


