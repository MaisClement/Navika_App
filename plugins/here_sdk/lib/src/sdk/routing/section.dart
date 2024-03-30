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
import 'package:here_sdk/src/sdk/core/location_time.dart';
import 'package:here_sdk/src/sdk/routing/e_v_details.dart';
import 'package:here_sdk/src/sdk/routing/maneuver.dart';
import 'package:here_sdk/src/sdk/routing/pass_through_waypoint.dart';
import 'package:here_sdk/src/sdk/routing/post_action.dart';
import 'package:here_sdk/src/sdk/routing/pre_action.dart';
import 'package:here_sdk/src/sdk/routing/route_place.dart';
import 'package:here_sdk/src/sdk/routing/section_notice.dart';
import 'package:here_sdk/src/sdk/routing/section_transport_mode.dart';
import 'package:here_sdk/src/sdk/routing/span.dart';
import 'package:here_sdk/src/sdk/routing/toll.dart';
import 'package:here_sdk/src/sdk/routing/traffic_incident_on_route.dart';
import 'package:here_sdk/src/sdk/routing/transit_section_details.dart';

/// A section is a part of the route between two stopovers.
///
/// A stopover is a location on the route where a stop is made.
///
/// **Note:** A section contains a list of [SectionNotice] objects that describe
/// _potential issues_ after the route was calculated. If the list is non-empty, it
/// is recommended to evaluate possible violations against the requested route options
/// and reject the route if deemed necessary.
abstract class Section {

  /// Gets the [GeoPolyline] object representing the polyline of this section.
  GeoPolyline get geometry;

  /// Gets the [Span]'s that constitute this section.
  List<Span> get spans;

  /// Gets the maneuvers for this section.
  List<Maneuver> get maneuvers;

  /// Gets the closest rectangular area where this section fits in.
  GeoBox get boundingBox;

  /// Gets the length of this section in meters.
  int get lengthInMeters;

  /// Gets the transport mode of this section.
  SectionTransportMode get sectionTransportMode;

  /// Gets the departure place.
  RoutePlace get departurePlace;

  /// Gets the arrival place.
  RoutePlace get arrivalPlace;

  /// Gets the departure location time of this section.
  LocationTime? get departureLocationTime;

  /// Gets the arrival location time of this section.
  LocationTime? get arrivalLocationTime;

  /// Gets the preceding actions that must be done prior to departure at the beginning of the section.
  List<PreAction> get preActions;

  /// Gets the post actions that must be done after the arrival at the end of the section.
  List<PostAction> get postActions;

  /// Gets the notices which explains the issues encountered during processing of this section.
  /// For example, while the scooter transport mode is selected, if no reasonable alternative route is
  /// possible except violating controlled-access to highway rule for the section, one notice is generated
  /// for the violation. The user must judge all the notices carefully before proceeding.
  List<SectionNotice> get sectionNotices;

  /// Gets the additional information that is available if the transportation mode used
  /// for this section is an electric vehicle.
  EVDetails? get evDetails;

  /// Gets the details of a transit section.
  TransitSectionDetails? get transitDetails;

  /// Gets all the tolls for this section. Note that tolls are found depending on the
  /// transport mode. For example, if pedestrian or bicycle transport mode specified, route sections have no tolls.
  /// Indoor route sections have no tolls, too.
  ///
  /// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  List<Toll> get tolls;

  /// the list of traffic incidents that are found on the section.
  List<TrafficIncidentOnRoute> get trafficIncidents;

  /// Gets the estimated time in seconds needed to travel along this section, including
  /// real-time traffic delays if available.
  Duration get duration;

  /// Gets the estimated extra time in seconds spent due to traffic delays along this section.
  /// Negative values indicate that the route can be traversed faster than usual.
  Duration get trafficDelay;

  /// Gets the list of passthrough waypoints in this section.
  List<PassThroughWaypoint> get passthroughWaypoints;

}


// Section "private" section, not exported.

final _sdkRoutingSectionRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_routing_Section_register_finalizer'));
final _sdkRoutingSectionCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Section_copy_handle'));
final _sdkRoutingSectionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Section_release_handle'));


class Section$Impl extends __lib.NativeBase implements Section {

  Section$Impl(Pointer<Void> handle) : super(handle);


  late GeoPolyline _geometryCache;
  bool _geometryIsCached = false;
  @override

  GeoPolyline get geometry {
    if (!_geometryIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_geometry_get'));
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


  late List<Span> _spansCache;
  bool _spansIsCached = false;
  @override

  List<Span> get spans {
    if (!_spansIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_spans_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _spansCache = heresdkRoutingCommonBindingslistofSdkRoutingSpanFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingslistofSdkRoutingSpanReleaseFfiHandle(__resultHandle);

      }
      _spansIsCached = true;
    }
    return _spansCache;
  }


  late List<Maneuver> _maneuversCache;
  bool _maneuversIsCached = false;
  @override

  List<Maneuver> get maneuvers {
    if (!_maneuversIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_maneuvers_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _maneuversCache = heresdkRoutingCommonBindingslistofSdkRoutingManeuverFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingslistofSdkRoutingManeuverReleaseFfiHandle(__resultHandle);

      }
      _maneuversIsCached = true;
    }
    return _maneuversCache;
  }

  @override
  GeoBox get boundingBox {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_boundingBox_get'));
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
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_lengthInMeters_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  SectionTransportMode get sectionTransportMode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_sectionTransportMode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingSectiontransportmodeFromFfi(__resultHandle);
    } finally {
      sdkRoutingSectiontransportmodeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  RoutePlace get departurePlace {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_departurePlace_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRouteplaceFromFfi(__resultHandle);
    } finally {
      sdkRoutingRouteplaceReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  RoutePlace get arrivalPlace {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_arrivalPlace_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRouteplaceFromFfi(__resultHandle);
    } finally {
      sdkRoutingRouteplaceReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  LocationTime? get departureLocationTime {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_departureLocationTime_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLocationtimeFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreLocationtimeReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  LocationTime? get arrivalLocationTime {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_arrivalLocationTime_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLocationtimeFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreLocationtimeReleaseFfiHandleNullable(__resultHandle);

    }

  }



  late List<PreAction> _preActionsCache;
  bool _preActionsIsCached = false;
  @override

  List<PreAction> get preActions {
    if (!_preActionsIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_preActions_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _preActionsCache = heresdkRoutingCommonBindingslistofSdkRoutingPreactionFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingslistofSdkRoutingPreactionReleaseFfiHandle(__resultHandle);

      }
      _preActionsIsCached = true;
    }
    return _preActionsCache;
  }


  late List<PostAction> _postActionsCache;
  bool _postActionsIsCached = false;
  @override

  List<PostAction> get postActions {
    if (!_postActionsIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_postActions_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _postActionsCache = heresdkRoutingCommonBindingslistofSdkRoutingPostactionFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingslistofSdkRoutingPostactionReleaseFfiHandle(__resultHandle);

      }
      _postActionsIsCached = true;
    }
    return _postActionsCache;
  }


  late List<SectionNotice> _sectionNoticesCache;
  bool _sectionNoticesIsCached = false;
  @override

  List<SectionNotice> get sectionNotices {
    if (!_sectionNoticesIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_sectionNotices_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _sectionNoticesCache = heresdkRoutingCommonBindingslistofSdkRoutingSectionnoticeFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingslistofSdkRoutingSectionnoticeReleaseFfiHandle(__resultHandle);

      }
      _sectionNoticesIsCached = true;
    }
    return _sectionNoticesCache;
  }

  @override
  EVDetails? get evDetails {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_evDetails_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingEvdetailsFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingEvdetailsReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  TransitSectionDetails? get transitDetails {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_transitDetails_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingTransitsectiondetailsFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingTransitsectiondetailsReleaseFfiHandleNullable(__resultHandle);

    }

  }



  late List<Toll> _tollsCache;
  bool _tollsIsCached = false;
  @override

  List<Toll> get tolls {
    if (!_tollsIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_tolls_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _tollsCache = heresdkRoutingCommonBindingslistofSdkRoutingTollFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingslistofSdkRoutingTollReleaseFfiHandle(__resultHandle);

      }
      _tollsIsCached = true;
    }
    return _tollsCache;
  }


  late List<TrafficIncidentOnRoute> _trafficIncidentsCache;
  bool _trafficIncidentsIsCached = false;
  @override

  List<TrafficIncidentOnRoute> get trafficIncidents {
    if (!_trafficIncidentsIsCached) {
      final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_trafficIncidents_get'));
      final __resultHandle = _getFfi(this.handle, __lib.LibraryContext.isolateId);
      try {
        _trafficIncidentsCache = heresdkRoutingCommonBindingslistofSdkRoutingTrafficincidentonrouteFromFfi(__resultHandle);
      } finally {
        heresdkRoutingCommonBindingslistofSdkRoutingTrafficincidentonrouteReleaseFfiHandle(__resultHandle);

      }
      _trafficIncidentsIsCached = true;
    }
    return _trafficIncidentsCache;
  }

  @override
  Duration get duration {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_duration_get'));
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
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_trafficDelay_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return durationFromFfi(__resultHandle);
    } finally {
      durationReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<PassThroughWaypoint> get passthroughWaypoints {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Section_passthroughWaypoints_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkRoutingCommonBindingslistofSdkRoutingPassthroughwaypointFromFfi(__resultHandle);
    } finally {
      heresdkRoutingCommonBindingslistofSdkRoutingPassthroughwaypointReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkRoutingSectionToFfi(Section value) =>
  _sdkRoutingSectionCopyHandle((value as __lib.NativeBase).handle);

Section sdkRoutingSectionFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Section) return instance;

  final _copiedHandle = _sdkRoutingSectionCopyHandle(handle);
  final result = Section$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkRoutingSectionRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkRoutingSectionReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingSectionReleaseHandle(handle);

Pointer<Void> sdkRoutingSectionToFfiNullable(Section? value) =>
  value != null ? sdkRoutingSectionToFfi(value) : Pointer<Void>.fromAddress(0);

Section? sdkRoutingSectionFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingSectionFromFfi(handle) : null;

void sdkRoutingSectionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingSectionReleaseHandle(handle);

// End of Section "private" section.


