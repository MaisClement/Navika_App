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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_polyline.dart';
import 'package:here_sdk/src/sdk/core/language_code.dart';
import 'package:here_sdk/src/sdk/routing/e_v_details.dart';
import 'package:here_sdk/src/sdk/routing/optimization_mode.dart';
import 'package:here_sdk/src/sdk/routing/route_handle.dart';
import 'package:here_sdk/src/sdk/routing/route_railway_crossing.dart';
import 'package:here_sdk/src/sdk/routing/section.dart';
import 'package:here_sdk/src/sdk/transport/transport_mode.dart';

/// A route is a path through a road network over which someone travels.
///
/// **Note:** Each [Section] of a route contains a list of [SectionNotice] objects
/// that describe _potential issues_ after the route was calculated. If the list is non-empty,
/// it is recommended to evaluate possible violations against the requested route options and
/// reject the route if deemed necessary.
abstract class Route {

  /// Gets the sections that make up this route.
  List<Section> get sections;

  /// Gets the [GeoPolyline] object representing the polyline of this route. It may not contain the original
  /// coordinates specified in the request for a route.
  GeoPolyline get geometry;

  /// Gets the closest rectangular area where this route fits in.
  GeoBox get boundingBox;

  /// Gets the length of this route in meters.
  int get lengthInMeters;

  /// Gets the language requested for all textual information related to this route.
  LanguageCode get language;

  /// Gets the optimization mode requested for route calculation.
  OptimizationMode get optimizationMode;

  /// Gets the transport mode requested for route calculation.
  TransportMode get requestedTransportMode;

  /// Gets the additional information that is available if the transportation mode used
  /// for this route is an electric vehicle.
  EVDetails? get evDetails;

  /// Gets the route handle of this route. Note that it is provided only if
  /// [RouteOptions.enableRouteHandle] is set before route calculation.
  RouteHandle? get routeHandle;

  /// Gets the estimated time in seconds needed to travel along this route, including
  /// real-time traffic delays if available.
  Duration get duration;

  /// Gets the estimated time in seconds spent in traffic along this route. Negative values
  /// indicate that the route can be traversed faster than usual.
  Duration get trafficDelay;

  List<RouteRailwayCrossing> get railwayCrossings;

}


// Route "private" section, not exported.

final _sdkRoutingRouteRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_routing_Route_register_finalizer'));
final _sdkRoutingRouteCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Route_copy_handle'));
final _sdkRoutingRouteReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Route_release_handle'));


class Route$Impl extends __lib.NativeBase implements Route {

  Route$Impl(Pointer<Void> handle) : super(handle);


  late List<Section> _sectionsCache;
  bool _sectionsIsCached = false;
  @override

  List<Section> get sections {
    if (!_sectionsIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_sections_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _sectionsCache = heresdkRoutingCommonBindingslistofSdkRoutingSectionFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingslistofSdkRoutingSectionReleaseFfiHandle(__resultHandle);

      }
      _sectionsIsCached = true;
    }
    return _sectionsCache;
  }


  late GeoPolyline _geometryCache;
  bool _geometryIsCached = false;
  @override

  GeoPolyline get geometry {
    if (!_geometryIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_geometry_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _geometryCache = sdkCoreGeopolylineFromFfi(__resultHandle);
      } finally {
        sdkCoreGeopolylineReleaseFfiHandle(__resultHandle);

      }
      _geometryIsCached = true;
    }
    return _geometryCache;
  }

  @override
  GeoBox get boundingBox {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_boundingBox_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeoboxFromFfi(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  int get lengthInMeters {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_lengthInMeters_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  LanguageCode get language {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_language_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLanguagecodeFromFfi(__resultHandle);
    } finally {
      sdkCoreLanguagecodeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  OptimizationMode get optimizationMode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_optimizationMode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingOptimizationmodeFromFfi(__resultHandle);
    } finally {
      sdkRoutingOptimizationmodeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  TransportMode get requestedTransportMode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_requestedTransportMode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTransportTransportmodeFromFfi(__resultHandle);
    } finally {
      sdkTransportTransportmodeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  EVDetails? get evDetails {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_evDetails_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingEvdetailsFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingEvdetailsReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  RouteHandle? get routeHandle {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_routeHandle_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRoutehandleFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingRoutehandleReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  Duration get duration {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_duration_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return durationFromFfi(__resultHandle);
    } finally {
      durationReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Duration get trafficDelay {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_trafficDelay_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return durationFromFfi(__resultHandle);
    } finally {
      durationReleaseFfiHandle(__resultHandle);

    }

  }



  late List<RouteRailwayCrossing> _railwayCrossingsCache;
  bool _railwayCrossingsIsCached = false;
  @override

  List<RouteRailwayCrossing> get railwayCrossings {
    if (!_railwayCrossingsIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Route_railwayCrossings_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _railwayCrossingsCache = heresdkRoutingCommonBindingslistofSdkRoutingRouterailwaycrossingFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingslistofSdkRoutingRouterailwaycrossingReleaseFfiHandle(__resultHandle);

      }
      _railwayCrossingsIsCached = true;
    }
    return _railwayCrossingsCache;
  }


}

Pointer<Void> sdkRoutingRouteToFfi(Route value) =>
  _sdkRoutingRouteCopyHandle((value as __lib.NativeBase).handle);

Route sdkRoutingRouteFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Route) return instance;

  final _copiedHandle = _sdkRoutingRouteCopyHandle(handle);
  final result = Route$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkRoutingRouteRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkRoutingRouteReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingRouteReleaseHandle(handle);

Pointer<Void> sdkRoutingRouteToFfiNullable(Route? value) =>
  value != null ? sdkRoutingRouteToFfi(value) : Pointer<Void>.fromAddress(0);

Route? sdkRoutingRouteFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingRouteFromFfi(handle) : null;

void sdkRoutingRouteReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRouteReleaseHandle(handle);

// End of Route "private" section.


