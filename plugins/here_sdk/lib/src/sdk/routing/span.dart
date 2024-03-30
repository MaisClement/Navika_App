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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/geo_polyline.dart';
import 'package:here_sdk/src/sdk/core/localized_texts.dart';
import 'package:here_sdk/src/sdk/routing/access_attributes.dart';
import 'package:here_sdk/src/sdk/routing/dynamic_speed_info.dart';
import 'package:here_sdk/src/sdk/routing/functional_road_class.dart';
import 'package:here_sdk/src/sdk/routing/localized_road_number.dart';
import 'package:here_sdk/src/sdk/routing/localized_road_numbers.dart';
import 'package:here_sdk/src/sdk/routing/segment_reference.dart';
import 'package:here_sdk/src/sdk/routing/street_attributes.dart';
import 'package:here_sdk/src/sdk/routing/traffic_speed.dart';
import 'package:here_sdk/src/sdk/routing/walk_attributes.dart';

/// A span is a part of the [Section] which is traversable or navigable.
///
/// Each span
/// usually has some geometry associated with it.
abstract class Span {

  /// Converts full route number to the value to be displayed on the road shield.
  ///
  /// The results are based on country code and state code of `Span` object and route type of passed `road_number` argument.
  ///
  /// [roadNumber] Route number to convert to shield text.
  ///
  /// Returns [String]. Text on the road shield to display.
  ///
  String getShieldText(LocalizedRoadNumber roadNumber);
  /// Gets the geographic coordinates that make up the polyline of this span.
  @Deprecated("Will be removed in v4.18.0. Use [Span.geometry] instead")
  List<GeoCoordinates> get polyline;

  /// Gets the [GeoPolyline] object representing the polyline of this span.
  GeoPolyline get geometry;

  /// Gets the length of this span in meters.
  int get lengthInMeters;

  /// Gets the list of indexes to [Section.sectionNotices] the parent section owns.
  /// In case the list is not empty, the user must judge all the indexed [SectionNotice]'s
  /// carefully before proceeding.
  List<int> get noticeIndexes;

  /// Gets the segment reference of this span.
  SegmentReference get segmentReference;

  /// Gets the traffic speed information on the span.
  TrafficSpeed get trafficSpeed;

  /// The indexes of traffic incidents from the field [Section.trafficIncidents] of the parent [Section].
  /// Each matching incident takes at least a whole [Span.geometry].
  /// The same incident can take other spans and an area out of the built route as well.
  List<int> get trafficIncidentIndexes;

  /// Gets the position of the span inside the section's geometry, given as an offset. The span geometry starts from
  /// this offset and ends on the offset of the next span, both start offset point and end offset point being
  /// included in the span, because the spans' geometry share a point in the section's geometry.
  int get sectionPolylineOffset;

  /// The dynamic speed information on the span.
  DynamicSpeedInfo? get dynamicSpeedInfo;

  /// The list of street attributes on the span.
  List<StreetAttributes> get streetAttributes;

  /// The list of car access attributes on the span.
  List<AccessAttributes> get carAttributes;

  /// The list of truck access attributes on the span.
  List<AccessAttributes> get truckAttributes;

  /// The list of scooter access attributes on the span.
  List<AccessAttributes> get scooterAttributes;

  /// The list of walk attributes on the span.
  List<WalkAttributes> get walkAttributes;

  /// The street names on the span.
  LocalizedTexts get streetNames;

  /// Gets the road numbers on the span enriched with information specific to _route numbers_
  /// of a road such as I-10, US-50, or A3, and cardinal direction, if available, and a road level classification (`RouteType`).
  LocalizedRoadNumbers get roadNumbers;

  /// Gets the speed limit in meters per second on the span.
  double? get speedLimitInMetersPerSecond;

  /// Gets the power consumption in kilowatt per hour necessary to traverse the span.
  double? get consumptionInKilowattHours;

  /// Gets the functional road class of the span.
  FunctionalRoadClass? get functionalRoadClass;

  /// Gets the time duration necessary to traverse the span, using the speed provided
  /// in [Span.dynamicSpeedInfo]. This duration takes also into
  /// consideration the delays caused by the traffic.
  Duration get duration;

  /// Gets the time duration necessary to traverse the span, using the speed provided
  /// in [Span.dynamicSpeedInfo] without taking into consideration
  /// the delays caused by the traffic.
  Duration get baseDuration;

  /// Gets the country code of the span. The value is `null` when no data is available.
  String? get countryCode;

  /// Gets the state code of the span. State code is available in some countries to denote principal
  /// subdivisions(provinces or states), e.g. in the United States, AK stands for Alaska and OH stands for Ohio.
  /// The format of state code can vary for different countries, take the United States as example,
  /// it consists of two alphabet letters. The value is `null` when no data is available.
  String? get stateCode;

}


// Span "private" section, not exported.

final _sdkRoutingSpanRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_routing_Span_register_finalizer'));
final _sdkRoutingSpanCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Span_copy_handle'));
final _sdkRoutingSpanReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Span_release_handle'));



class Span$Impl extends __lib.NativeBase implements Span {

  Span$Impl(Pointer<Void> handle) : super(handle);

  @override
  String getShieldText(LocalizedRoadNumber roadNumber) {
    final _getShieldTextFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_routing_Span_getShieldText__LocalizedRoadNumber'));
    final _roadNumberHandle = sdkRoutingLocalizedroadnumberToFfi(roadNumber);
    final _handle = this.handle;
    final __resultHandle = _getShieldTextFfi(_handle, __lib.LibraryContext.isolateId, _roadNumberHandle);
    sdkRoutingLocalizedroadnumberReleaseFfiHandle(_roadNumberHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  List<GeoCoordinates> get polyline {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_polyline_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkRoutingCommonBindingslistofSdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      heresdkRoutingCommonBindingslistofSdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  GeoPolyline get geometry {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_geometry_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeopolylineFromFfi(__resultHandle);
    } finally {
      sdkCoreGeopolylineReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  int get lengthInMeters {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_lengthInMeters_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  List<int> get noticeIndexes {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_noticeIndexes_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkRoutingCommonBindingslistofIntFromFfi(__resultHandle);
    } finally {
      heresdkRoutingCommonBindingslistofIntReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  SegmentReference get segmentReference {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_segmentReference_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingSegmentreferenceFromFfi(__resultHandle);
    } finally {
      sdkRoutingSegmentreferenceReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  TrafficSpeed get trafficSpeed {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_trafficSpeed_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingTrafficspeedFromFfi(__resultHandle);
    } finally {
      sdkRoutingTrafficspeedReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<int> get trafficIncidentIndexes {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_trafficIncidentIndexes_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkRoutingCommonBindingslistofIntFromFfi(__resultHandle);
    } finally {
      heresdkRoutingCommonBindingslistofIntReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  int get sectionPolylineOffset {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_sectionPolylineOffset_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  DynamicSpeedInfo? get dynamicSpeedInfo {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_dynamicSpeedInfo_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingDynamicspeedinfoFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingDynamicspeedinfoReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  List<StreetAttributes> get streetAttributes {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_streetAttributes_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkRoutingCommonBindingslistofSdkRoutingStreetattributesFromFfi(__resultHandle);
    } finally {
      heresdkRoutingCommonBindingslistofSdkRoutingStreetattributesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<AccessAttributes> get carAttributes {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_carAttributes_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkRoutingCommonBindingslistofSdkRoutingAccessattributesFromFfi(__resultHandle);
    } finally {
      heresdkRoutingCommonBindingslistofSdkRoutingAccessattributesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<AccessAttributes> get truckAttributes {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_truckAttributes_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkRoutingCommonBindingslistofSdkRoutingAccessattributesFromFfi(__resultHandle);
    } finally {
      heresdkRoutingCommonBindingslistofSdkRoutingAccessattributesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<AccessAttributes> get scooterAttributes {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_scooterAttributes_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkRoutingCommonBindingslistofSdkRoutingAccessattributesFromFfi(__resultHandle);
    } finally {
      heresdkRoutingCommonBindingslistofSdkRoutingAccessattributesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<WalkAttributes> get walkAttributes {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_walkAttributes_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkRoutingCommonBindingslistofSdkRoutingWalkattributesFromFfi(__resultHandle);
    } finally {
      heresdkRoutingCommonBindingslistofSdkRoutingWalkattributesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  LocalizedTexts get streetNames {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_streetNames_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLocalizedtextsFromFfi(__resultHandle);
    } finally {
      sdkCoreLocalizedtextsReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  LocalizedRoadNumbers get roadNumbers {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_roadNumbers_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingLocalizedroadnumbersFromFfi(__resultHandle);
    } finally {
      sdkRoutingLocalizedroadnumbersReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  double? get speedLimitInMetersPerSecond {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_speedLimitInMetersPerSecond_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return doubleFromFfiNullable(__resultHandle);
    } finally {
      doubleReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  double? get consumptionInKilowattHours {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_consumptionInKilowattHours_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return doubleFromFfiNullable(__resultHandle);
    } finally {
      doubleReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  FunctionalRoadClass? get functionalRoadClass {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_functionalRoadClass_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingFunctionalroadclassFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingFunctionalroadclassReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  Duration get duration {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_duration_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return durationFromFfi(__resultHandle);
    } finally {
      durationReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Duration get baseDuration {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint64 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_baseDuration_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return durationFromFfi(__resultHandle);
    } finally {
      durationReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String? get countryCode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_countryCode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  String? get stateCode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_Span_stateCode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }



}

Pointer<Void> sdkRoutingSpanToFfi(Span value) =>
  _sdkRoutingSpanCopyHandle((value as __lib.NativeBase).handle);

Span sdkRoutingSpanFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");

  final _copiedHandle = _sdkRoutingSpanCopyHandle(handle);
  final result = Span$Impl(_copiedHandle);
  _sdkRoutingSpanRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkRoutingSpanReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingSpanReleaseHandle(handle);

Pointer<Void> sdkRoutingSpanToFfiNullable(Span? value) =>
  value != null ? sdkRoutingSpanToFfi(value) : Pointer<Void>.fromAddress(0);

Span? sdkRoutingSpanFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingSpanFromFfi(handle) : null;

void sdkRoutingSpanReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingSpanReleaseHandle(handle);

// End of Span "private" section.


