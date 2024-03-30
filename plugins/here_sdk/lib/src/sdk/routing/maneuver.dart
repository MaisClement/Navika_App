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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/localized_texts.dart';
import 'package:here_sdk/src/sdk/routing/maneuver_action.dart';
import 'package:here_sdk/src/sdk/routing/road_texts.dart';
import 'package:here_sdk/src/sdk/routing/road_type.dart';
import 'package:here_sdk/src/sdk/routing/signpost.dart';

/// This class provides all the information for a maneuver.
///
/// The directional information (e.g. road names, road
/// numbers and signpost direction) is stored in [Maneuver.roadTexts] and [Maneuver.nextRoadTexts] attributes.
/// As for the motorway exit information, it can be obtained from [Maneuver.exitSignTexts] attribute.
abstract class Maneuver {

  /// Gets the maneuver action.
  ManeuverAction get action;

  /// Gets the geographic coordinates where the maneuver is located.
  GeoCoordinates get coordinates;

  /// Gets the index over [Section.geometry] where the maneuver is located.
  int get offset;

  /// Gets the country code of the maneuver position. The value is `null` when no data is available.
  String? get countryCode;

  /// Gets the textual attributes of the exit sign. These might contain exit number(s) and/or name(s).
  /// **Note:** These attributes are only provided for the _Navigate Edition_.
  /// Otherwise, the attributes are always empty.
  LocalizedTexts get exitSignTexts;

  /// Gets the length of the maneuver in meters.
  int get lengthInMeters;

  /// Gets the textual attributes of the current road containing road names, road numbers and signpost direction (towards) information.
  /// **Note:** These attributes are only provided for the _Navigate Edition_.
  /// Otherwise, the attributes are always empty.
  RoadTexts get roadTexts;

  /// Gets the current road type. The value is `null` when no data is available.
  RoadType? get roadType;

  /// Gets the textual attributes of the next road containing the corresponding road name(s) and road number(s) after the maneuver point.
  /// **Note:** These attributes are only provided for the _Navigate Edition_.
  /// Otherwise, the attributes are always empty.
  RoadTexts get nextRoadTexts;

  /// Gets [Signpost] object.
  Signpost? get signpost;

  /// Gets the next road type. The value is `null` when no data is available.
  RoadType? get nextRoadType;

  /// Gets the textual attributes of the intersection.
  /// **Note:** These attributes are only provided for the _Navigate Edition_.
  /// Otherwise, the attributes are always empty.
  /// **Note:** Routes calculated with OfflineRoutingEngine are not supported.
  LocalizedTexts get intersectionNames;

  /// Gets the maneuver instruction. The text is formatted and localized as specified via
  /// [RouteTextOptions].
  /// **Note for _Navigate Edition_:** This text is meant to be displayed in a preview context, whereas real-time `ManeuverNotificationListener` texts are meant to be used
  /// for spoken voice announcements during a trip.
  String get text;

  /// Gets the index of a section to which the maneuver belongs to.
  int get sectionIndex;

  /// Gets the estimated time in seconds needed to perform the maneuver.
  Duration get duration;

  /// Gets the angle of the turn component of the maneuver. The value is in degrees and from -180 to 180.
  /// The angle increases clockwise and small values are used for going straight, i.e. a positive number
  /// means there is a right turn and a negative number is a left turn.
  /// Some maneuvers like Depart, Arrive and Roundabout pass doesn't have a well defined angle, so the value
  /// is omitted.
  /// **Note:** These attributes are only provided for the _Navigate Edition_.
  double? get turnAngleInDegrees;

  /// The angle is estimated between the incoming and outgoing route parts before entering the actual roundabout.
  /// This is done to provide a better orientation for drivers. For better results, the incoming and outcoming route
  /// parts can be around 50 meters in length. In addition, these parts lie usually around 30 meters away from
  /// the actual roundabout. Therefore, the resulting arc does not necessarily represent the exact curved path a
  /// vehicle has to follow within a roundabout from the point of entry to the point of exit. Instead, it reflects
  /// the route path before and after the roundabout to highlight the directional change along the route. The angle can have a value from -360.0 to 360.0, and it is positive
  /// in right-hand side driving country, and negative in left-hand side countries.
  /// Note that the value is available for both the enter roundabout actions and the exit roundabout
  /// actions. Both maneuvers have the same value. When the incoming or outgoing route parts are curvy or when the
  /// roundabout itself is not representing a perfect circle, then the accuracy of the angle may be
  /// compromised.
  /// **Note:** These attributes are only provided for the _Navigate Edition_.
  double? get roundaboutAngleInDegrees;

}


// Maneuver "private" section, not exported.

final _sdkRoutingManeuverRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_routing_Maneuver_register_finalizer'));
final _sdkRoutingManeuverCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Maneuver_copy_handle'));
final _sdkRoutingManeuverReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Maneuver_release_handle'));


class Maneuver$Impl extends __lib.NativeBase implements Maneuver {

  Maneuver$Impl(Pointer<Void> handle) : super(handle);

  @override
  ManeuverAction get action {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_action_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingManeuveractionFromFfi(__resultHandle);
    } finally {
      sdkRoutingManeuveractionReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  GeoCoordinates get coordinates {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_coordinates_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  int get offset {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_offset_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  String? get countryCode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_countryCode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  LocalizedTexts get exitSignTexts {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_exitSignTexts_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLocalizedtextsFromFfi(__resultHandle);
    } finally {
      sdkCoreLocalizedtextsReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  int get lengthInMeters {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_lengthInMeters_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  RoadTexts get roadTexts {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_roadTexts_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRoadtextsFromFfi(__resultHandle);
    } finally {
      sdkRoutingRoadtextsReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  RoadType? get roadType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_roadType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRoadtypeFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingRoadtypeReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  RoadTexts get nextRoadTexts {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_nextRoadTexts_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRoadtextsFromFfi(__resultHandle);
    } finally {
      sdkRoutingRoadtextsReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Signpost? get signpost {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_signpost_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingSignpostFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingSignpostReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  RoadType? get nextRoadType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_nextRoadType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRoadtypeFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingRoadtypeReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  LocalizedTexts get intersectionNames {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_intersectionNames_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLocalizedtextsFromFfi(__resultHandle);
    } finally {
      sdkCoreLocalizedtextsReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get text {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_text_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  int get sectionIndex {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_sectionIndex_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  Duration get duration {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_duration_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return durationFromFfi(__resultHandle);
    } finally {
      durationReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  double? get turnAngleInDegrees {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_turnAngleInDegrees_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return doubleFromFfiNullable(__resultHandle);
    } finally {
      doubleReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  double? get roundaboutAngleInDegrees {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Maneuver_roundaboutAngleInDegrees_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return doubleFromFfiNullable(__resultHandle);
    } finally {
      doubleReleaseFfiHandleNullable(__resultHandle);

    }

  }



}

Pointer<Void> sdkRoutingManeuverToFfi(Maneuver value) =>
  _sdkRoutingManeuverCopyHandle((value as __lib.NativeBase).handle);

Maneuver sdkRoutingManeuverFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Maneuver) return instance;

  final _copiedHandle = _sdkRoutingManeuverCopyHandle(handle);
  final result = Maneuver$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkRoutingManeuverRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkRoutingManeuverReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingManeuverReleaseHandle(handle);

Pointer<Void> sdkRoutingManeuverToFfiNullable(Maneuver? value) =>
  value != null ? sdkRoutingManeuverToFfi(value) : Pointer<Void>.fromAddress(0);

Maneuver? sdkRoutingManeuverFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingManeuverFromFfi(handle) : null;

void sdkRoutingManeuverReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingManeuverReleaseHandle(handle);

// End of Maneuver "private" section.


