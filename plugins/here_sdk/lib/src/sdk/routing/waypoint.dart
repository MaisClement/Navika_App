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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/routing/match_side_of_street.dart';
import 'package:here_sdk/src/sdk/routing/segment_reference.dart';
import 'package:here_sdk/src/sdk/routing/waypoint_type.dart';

/// Represents a waypoint, used as input for route calculation.

class Waypoint {
  /// The waypoint's geographic coordinates.
  GeoCoordinates coordinates;

  /// Defines how a waypoint should be considered for route calculation.
  /// The default waypoint type is [WaypointType.stopover].
  WaypointType type;

  /// The maximum allowed distance from the waypoint that the calculated
  /// route may pass through. For example, to drive past a city without necessarily going
  /// into the city center, you can specify the coordinates of the center and a transit
  /// radius of 5000m. The default transit radius is zero.
  /// If the route should pass the waypoint as close as possible, the default value
  /// should be kept. Note that the waypoint will be map-matched to a road.
  /// Non-zero values allow a greater tolerance.
  int transitRadiusInMeters;

  /// Optional heading angle referenced by true north, clockwise specifying
  /// the direction of travel. The heading direction may help the routing algorithm to select
  /// the best direction, for example, when multiple directions are possible at a road junction.
  /// North is 0 degrees, East is 90 degrees, South is 180 degrees, and West is 270 degrees.
  /// The value must be in the range \[0, 360\] when specified. By default, or when `null` is set,
  /// heading is ignored for route calculation.
  double? headingInDegrees;

  /// Optional coordinates to indicate which side of the street should be used to reach the waypoint.
  /// For example, if the location is to the left of the street, the router will prefer using that side
  /// in case the street has dividers.
  GeoCoordinates? sideOfStreetHint;

  /// Optional distance in meters during which the user wants to avoid taking actions. For example, if
  /// the origin is set by a moving vehicle, the user might not have time to react to immediate actions such
  /// as a sharp right turn.
  int? minCourseDistanceInMeters;

  /// Optional name hint causes the router to look for the place with the most similar name.
  /// This can e.g. include things like: `North` being used to differentiate between
  /// interstates `I66 North` and `I66 South`, `Downtown Avenue` being used to correctly
  /// select a residential street.
  String? nameHint;

  /// Specifies how the location set by [Waypoint.sideOfStreetHint] should be handled.
  MatchSideOfStreet? matchSideOfStreet;

  /// The duration in seconds that should be spent at a waypoint of type [WaypointType.stopover].
  /// Impacts time-aware calculations.
  /// Ignored for waypoints of type [WaypointType.passThrough].
  /// The default duration is 0 seconds.
  Duration duration;

  /// Optional segment hint causes the router to try and match to the specified segment.
  /// Waypoint coordinates need to be on the segment, otherwise waypoint will be matched ignoring the segment hint.
  /// This parameter can be used when the waypoint is too close to more than one segment to force matching to a specific one.
  /// Only topology segment id and travel direction are used to define the segment hint
  SegmentReference? segmentHint;

  /// Optional threshold allows specifying a distance within which the waypoint could be considered
  /// as being on a highway/bridge/tunnel/sliproad. Within this threshold, the attributes of the segments do not impact the matching.
  /// Outside the threshold only segments which aren't one of highway/bridge/tunnel/sliproad can be matched.
  int? onRoadThresholdInMeters;

  /// Creates a new instance.

  /// [coordinates] The waypoint's geographic coordinates.

  /// [type] Defines how a waypoint should be considered for route calculation.
  /// The default waypoint type is [WaypointType.stopover].

  /// [transitRadiusInMeters] The maximum allowed distance from the waypoint that the calculated
  /// route may pass through. For example, to drive past a city without necessarily going
  /// into the city center, you can specify the coordinates of the center and a transit
  /// radius of 5000m. The default transit radius is zero.
  /// If the route should pass the waypoint as close as possible, the default value
  /// should be kept. Note that the waypoint will be map-matched to a road.
  /// Non-zero values allow a greater tolerance.

  /// [headingInDegrees] Optional heading angle referenced by true north, clockwise specifying
  /// the direction of travel. The heading direction may help the routing algorithm to select
  /// the best direction, for example, when multiple directions are possible at a road junction.
  /// North is 0 degrees, East is 90 degrees, South is 180 degrees, and West is 270 degrees.
  /// The value must be in the range \[0, 360\] when specified. By default, or when `null` is set,
  /// heading is ignored for route calculation.

  /// [sideOfStreetHint] Optional coordinates to indicate which side of the street should be used to reach the waypoint.
  /// For example, if the location is to the left of the street, the router will prefer using that side
  /// in case the street has dividers.

  /// [minCourseDistanceInMeters] Optional distance in meters during which the user wants to avoid taking actions. For example, if
  /// the origin is set by a moving vehicle, the user might not have time to react to immediate actions such
  /// as a sharp right turn.

  /// [nameHint] Optional name hint causes the router to look for the place with the most similar name.
  /// This can e.g. include things like: `North` being used to differentiate between
  /// interstates `I66 North` and `I66 South`, `Downtown Avenue` being used to correctly
  /// select a residential street.

  /// [matchSideOfStreet] Specifies how the location set by [Waypoint.sideOfStreetHint] should be handled.

  /// [duration] The duration in seconds that should be spent at a waypoint of type [WaypointType.stopover].
  /// Impacts time-aware calculations.
  /// Ignored for waypoints of type [WaypointType.passThrough].
  /// The default duration is 0 seconds.

  /// [segmentHint] Optional segment hint causes the router to try and match to the specified segment.
  /// Waypoint coordinates need to be on the segment, otherwise waypoint will be matched ignoring the segment hint.
  /// This parameter can be used when the waypoint is too close to more than one segment to force matching to a specific one.
  /// Only topology segment id and travel direction are used to define the segment hint

  /// [onRoadThresholdInMeters] Optional threshold allows specifying a distance within which the waypoint could be considered
  /// as being on a highway/bridge/tunnel/sliproad. Within this threshold, the attributes of the segments do not impact the matching.
  /// Outside the threshold only segments which aren't one of highway/bridge/tunnel/sliproad can be matched.

  Waypoint(GeoCoordinates coordinates, [WaypointType type = WaypointType.stopover, int transitRadiusInMeters = 0, double? headingInDegrees = null, GeoCoordinates? sideOfStreetHint = null, int? minCourseDistanceInMeters = null, String? nameHint = null, MatchSideOfStreet? matchSideOfStreet = null, Duration duration = const Duration(seconds: 0), SegmentReference? segmentHint = null, int? onRoadThresholdInMeters = null])
    : coordinates = coordinates, type = type, transitRadiusInMeters = transitRadiusInMeters, headingInDegrees = headingInDegrees, sideOfStreetHint = sideOfStreetHint, minCourseDistanceInMeters = minCourseDistanceInMeters, nameHint = nameHint, matchSideOfStreet = matchSideOfStreet, duration = duration, segmentHint = segmentHint, onRoadThresholdInMeters = onRoadThresholdInMeters;
  /// Creates a new instance.
  /// [coordinates] The waypoint's geographic coordinates.
  Waypoint.withDefaults(this.coordinates)
      : type = WaypointType.stopover, transitRadiusInMeters = 0, headingInDegrees = null, sideOfStreetHint = null, minCourseDistanceInMeters = null, nameHint = null, matchSideOfStreet = null, duration = const Duration(seconds: 0), segmentHint = null, onRoadThresholdInMeters = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Waypoint) return false;
    Waypoint _other = other;
    return coordinates == _other.coordinates &&
        type == _other.type &&
        transitRadiusInMeters == _other.transitRadiusInMeters &&
        headingInDegrees == _other.headingInDegrees &&
        sideOfStreetHint == _other.sideOfStreetHint &&
        minCourseDistanceInMeters == _other.minCourseDistanceInMeters &&
        nameHint == _other.nameHint &&
        matchSideOfStreet == _other.matchSideOfStreet &&
        duration == _other.duration &&
        segmentHint == _other.segmentHint &&
        onRoadThresholdInMeters == _other.onRoadThresholdInMeters;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + coordinates.hashCode;
    result = 31 * result + type.hashCode;
    result = 31 * result + transitRadiusInMeters.hashCode;
    result = 31 * result + headingInDegrees.hashCode;
    result = 31 * result + sideOfStreetHint.hashCode;
    result = 31 * result + minCourseDistanceInMeters.hashCode;
    result = 31 * result + nameHint.hashCode;
    result = 31 * result + matchSideOfStreet.hashCode;
    result = 31 * result + duration.hashCode;
    result = 31 * result + segmentHint.hashCode;
    result = 31 * result + onRoadThresholdInMeters.hashCode;
    return result;
  }
}


// Waypoint "private" section, not exported.

final _sdkRoutingWaypointCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint32, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint64, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, int, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_create_handle'));
final _sdkRoutingWaypointReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_release_handle'));
final _sdkRoutingWaypointGetFieldcoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_coordinates'));
final _sdkRoutingWaypointGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_type'));
final _sdkRoutingWaypointGetFieldtransitRadiusInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_transitRadiusInMeters'));
final _sdkRoutingWaypointGetFieldheadingInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_headingInDegrees'));
final _sdkRoutingWaypointGetFieldsideOfStreetHint = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_sideOfStreetHint'));
final _sdkRoutingWaypointGetFieldminCourseDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_minCourseDistanceInMeters'));
final _sdkRoutingWaypointGetFieldnameHint = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_nameHint'));
final _sdkRoutingWaypointGetFieldmatchSideOfStreet = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_matchSideOfStreet'));
final _sdkRoutingWaypointGetFieldduration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_duration'));
final _sdkRoutingWaypointGetFieldsegmentHint = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_segmentHint'));
final _sdkRoutingWaypointGetFieldonRoadThresholdInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_field_onRoadThresholdInMeters'));



Pointer<Void> sdkRoutingWaypointToFfi(Waypoint value) {
  final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(value.coordinates);
  final _typeHandle = sdkRoutingWaypointtypeToFfi(value.type);
  final _transitRadiusInMetersHandle = (value.transitRadiusInMeters);
  final _headingInDegreesHandle = doubleToFfiNullable(value.headingInDegrees);
  final _sideOfStreetHintHandle = sdkCoreGeocoordinatesToFfiNullable(value.sideOfStreetHint);
  final _minCourseDistanceInMetersHandle = intToFfiNullable(value.minCourseDistanceInMeters);
  final _nameHintHandle = stringToFfiNullable(value.nameHint);
  final _matchSideOfStreetHandle = sdkRoutingMatchsideofstreetToFfiNullable(value.matchSideOfStreet);
  final _durationHandle = durationToFfi(value.duration);
  final _segmentHintHandle = sdkRoutingSegmentreferenceToFfiNullable(value.segmentHint);
  final _onRoadThresholdInMetersHandle = intToFfiNullable(value.onRoadThresholdInMeters);
  final _result = _sdkRoutingWaypointCreateHandle(_coordinatesHandle, _typeHandle, _transitRadiusInMetersHandle, _headingInDegreesHandle, _sideOfStreetHintHandle, _minCourseDistanceInMetersHandle, _nameHintHandle, _matchSideOfStreetHandle, _durationHandle, _segmentHintHandle, _onRoadThresholdInMetersHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
  sdkRoutingWaypointtypeReleaseFfiHandle(_typeHandle);
  
  doubleReleaseFfiHandleNullable(_headingInDegreesHandle);
  sdkCoreGeocoordinatesReleaseFfiHandleNullable(_sideOfStreetHintHandle);
  intReleaseFfiHandleNullable(_minCourseDistanceInMetersHandle);
  stringReleaseFfiHandleNullable(_nameHintHandle);
  sdkRoutingMatchsideofstreetReleaseFfiHandleNullable(_matchSideOfStreetHandle);
  durationReleaseFfiHandle(_durationHandle);
  sdkRoutingSegmentreferenceReleaseFfiHandleNullable(_segmentHintHandle);
  intReleaseFfiHandleNullable(_onRoadThresholdInMetersHandle);
  return _result;
}

Waypoint sdkRoutingWaypointFromFfi(Pointer<Void> handle) {
  final _coordinatesHandle = _sdkRoutingWaypointGetFieldcoordinates(handle);
  final _typeHandle = _sdkRoutingWaypointGetFieldtype(handle);
  final _transitRadiusInMetersHandle = _sdkRoutingWaypointGetFieldtransitRadiusInMeters(handle);
  final _headingInDegreesHandle = _sdkRoutingWaypointGetFieldheadingInDegrees(handle);
  final _sideOfStreetHintHandle = _sdkRoutingWaypointGetFieldsideOfStreetHint(handle);
  final _minCourseDistanceInMetersHandle = _sdkRoutingWaypointGetFieldminCourseDistanceInMeters(handle);
  final _nameHintHandle = _sdkRoutingWaypointGetFieldnameHint(handle);
  final _matchSideOfStreetHandle = _sdkRoutingWaypointGetFieldmatchSideOfStreet(handle);
  final _durationHandle = _sdkRoutingWaypointGetFieldduration(handle);
  final _segmentHintHandle = _sdkRoutingWaypointGetFieldsegmentHint(handle);
  final _onRoadThresholdInMetersHandle = _sdkRoutingWaypointGetFieldonRoadThresholdInMeters(handle);
  try {
    return Waypoint(
      sdkCoreGeocoordinatesFromFfi(_coordinatesHandle), 
      sdkRoutingWaypointtypeFromFfi(_typeHandle), 
      (_transitRadiusInMetersHandle), 
      doubleFromFfiNullable(_headingInDegreesHandle), 
      sdkCoreGeocoordinatesFromFfiNullable(_sideOfStreetHintHandle), 
      intFromFfiNullable(_minCourseDistanceInMetersHandle), 
      stringFromFfiNullable(_nameHintHandle), 
      sdkRoutingMatchsideofstreetFromFfiNullable(_matchSideOfStreetHandle), 
      durationFromFfi(_durationHandle), 
      sdkRoutingSegmentreferenceFromFfiNullable(_segmentHintHandle), 
      intFromFfiNullable(_onRoadThresholdInMetersHandle)
    );
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    sdkRoutingWaypointtypeReleaseFfiHandle(_typeHandle);
    
    doubleReleaseFfiHandleNullable(_headingInDegreesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandleNullable(_sideOfStreetHintHandle);
    intReleaseFfiHandleNullable(_minCourseDistanceInMetersHandle);
    stringReleaseFfiHandleNullable(_nameHintHandle);
    sdkRoutingMatchsideofstreetReleaseFfiHandleNullable(_matchSideOfStreetHandle);
    durationReleaseFfiHandle(_durationHandle);
    sdkRoutingSegmentreferenceReleaseFfiHandleNullable(_segmentHintHandle);
    intReleaseFfiHandleNullable(_onRoadThresholdInMetersHandle);
  }
}

void sdkRoutingWaypointReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingWaypointReleaseHandle(handle);

// Nullable Waypoint

final _sdkRoutingWaypointCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_create_handle_nullable'));
final _sdkRoutingWaypointReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_release_handle_nullable'));
final _sdkRoutingWaypointGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Waypoint_get_value_nullable'));

Pointer<Void> sdkRoutingWaypointToFfiNullable(Waypoint? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingWaypointToFfi(value);
  final result = _sdkRoutingWaypointCreateHandleNullable(_handle);
  sdkRoutingWaypointReleaseFfiHandle(_handle);
  return result;
}

Waypoint? sdkRoutingWaypointFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingWaypointGetValueNullable(handle);
  final result = sdkRoutingWaypointFromFfi(_handle);
  sdkRoutingWaypointReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingWaypointReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingWaypointReleaseHandleNullable(handle);

// End of Waypoint "private" section.


