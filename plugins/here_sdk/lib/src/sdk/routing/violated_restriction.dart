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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/integer_range.dart';
import 'package:here_sdk/src/sdk/routing/max_axle_group_weight.dart';
import 'package:here_sdk/src/sdk/transport/hazardous_material.dart';
import 'package:here_sdk/src/sdk/transport/truck_road_type.dart';
import 'package:here_sdk/src/sdk/transport/truck_type.dart';
import 'package:here_sdk/src/sdk/transport/tunnel_category.dart';

/// `ViolatedRestriction` contains all the violated restriction details for the planned trip.

class ViolatedRestriction {
  /// Cause of the notice. Human readable description of the notice, for example "Route violates vehicle restriction". It will be EN-US text only.
  String cause;

  /// Indicates that restriction depends on time.
  bool timeDependent;

  /// The detailed information of restriction depending on the specific violation.
  /// For time dependent restriction or transport mode restriction, this property will be null.
  /// For vehicle restriction, the corresponding member will be set, for example, if the vehicle violates the maximum
  /// allowed gross weight for a specific route, the max_gross_weight_in_kilograms will be set with the maximum allowed
  /// gross weight for this route.
  ViolatedRestrictionDetails? details;

  /// Creates a new instance.

  /// [cause] Cause of the notice. Human readable description of the notice, for example "Route violates vehicle restriction". It will be EN-US text only.

  /// [timeDependent] Indicates that restriction depends on time.

  /// [details] The detailed information of restriction depending on the specific violation.
  /// For time dependent restriction or transport mode restriction, this property will be null.
  /// For vehicle restriction, the corresponding member will be set, for example, if the vehicle violates the maximum
  /// allowed gross weight for a specific route, the max_gross_weight_in_kilograms will be set with the maximum allowed
  /// gross weight for this route.

  ViolatedRestriction._(this.cause, this.timeDependent, this.details);
  ViolatedRestriction(String cause, bool timeDependent)
    : cause = cause, timeDependent = timeDependent, details = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ViolatedRestriction) return false;
    ViolatedRestriction _other = other;
    return cause == _other.cause &&
        timeDependent == _other.timeDependent &&
        details == _other.details;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + cause.hashCode;
    result = 31 * result + timeDependent.hashCode;
    result = 31 * result + details.hashCode;
    return result;
  }
}

/// Optional restriction details, contains additional information depending on the specific violation, zero or more member might be set.
///
/// For example, if the vehicle violates the maximum allowed height during the trip, then the member `max_height_in_centimeters` will
/// be set with the maximum allowed height value.

class ViolatedRestrictionDetails {
  /// Max permitted gross weight during the trip, in kilograms.
  /// This property will be set if the [TruckSpecifications.grossWeightInKilograms]
  /// parameter used for route calculation exceeds this value.
  int? maxGrossWeightInKilograms;

  /// Max permitted weight per axle during the trip, in kilograms.
  /// This property will be set if the [TruckSpecifications.weightPerAxleInKilograms]
  /// exceeds this value.
  int? maxWeightPerAxleInKilograms;

  /// Max permitted weight per axle group during the trip, in kilograms.
  /// This property will be set if the [TruckSpecifications.weightPerAxleGroup]
  /// exceeds this value.
  MaxAxleGroupWeight? maxWeightPerAxleGroupInKilograms;

  /// Max permitted height during the trip, in centimeters.
  /// This property will be set if the [TruckSpecifications.heightInCentimeters]
  /// exceeds this value.
  int? maxHeightInCentimeters;

  /// Max permitted width during the trip, in centimeters.
  /// This property will be set if the [TruckSpecifications.widthInCentimeters]
  /// exceeds this value.
  int? maxWidthInCentimeters;

  /// Max permitted length during the trip, in centimeters.
  /// This property will be set if the [TruckSpecifications.lengthInCentimeters]
  /// exceeds this value.
  int? maxLengthInCentimeters;

  /// The restriction to trucks with axles number within specified range during the trip.
  /// This property will be set if the [TruckSpecifications.axleCount]
  /// is within this range.
  IntegerRange? forbiddenAxleCount;

  /// Constrains the restriction to trucks with number of trailer within specified range during the trip.
  /// This property will be set if the [TruckSpecifications.trailerCount]
  /// is within this range.
  IntegerRange? forbiddenTrailerCount;

  /// There are two lists for our trip: Hazardous goods restrictions applied during the trip, and the list used
  /// for the route calculation provided using [TruckOptions.hazardousMaterials]. This property is the intersection of the two lists.
  List<HazardousMaterial> forbiddenHazardousGoods;

  /// Tunnel category to restrict transport of specific goods during the trip.
  /// This property will be set if the [TruckOptions.linkTunnelCategory] exceeds this value.
  TunnelCategory? maxTunnelCategory;

  /// This property will be set if a restriction applies to the value of [TruckType]
  /// parameter used for route calculation.
  TruckType? forbiddenTruckType;

  /// Contains violated restrictions for truck road types.
  List<TruckRoadType> forbiddenTruckRoadTypes;

  /// Contains the restricted routing zone reference
  /// This property will be set if the [AvoidanceOptions.zoneCategories] is not empty
  String? routingZoneReference;

  /// Max permitted payload capacity during the trip, in kilograms.
  /// This property will be set if the [TruckSpecifications.payloadCapacityInKilograms]
  /// exceeds this value.
  int? maxPayloadCapacityInKilograms;

  /// Creates a new instance.

  /// [maxGrossWeightInKilograms] Max permitted gross weight during the trip, in kilograms.
  /// This property will be set if the [TruckSpecifications.grossWeightInKilograms]
  /// parameter used for route calculation exceeds this value.

  /// [maxWeightPerAxleInKilograms] Max permitted weight per axle during the trip, in kilograms.
  /// This property will be set if the [TruckSpecifications.weightPerAxleInKilograms]
  /// exceeds this value.

  /// [maxWeightPerAxleGroupInKilograms] Max permitted weight per axle group during the trip, in kilograms.
  /// This property will be set if the [TruckSpecifications.weightPerAxleGroup]
  /// exceeds this value.

  /// [maxHeightInCentimeters] Max permitted height during the trip, in centimeters.
  /// This property will be set if the [TruckSpecifications.heightInCentimeters]
  /// exceeds this value.

  /// [maxWidthInCentimeters] Max permitted width during the trip, in centimeters.
  /// This property will be set if the [TruckSpecifications.widthInCentimeters]
  /// exceeds this value.

  /// [maxLengthInCentimeters] Max permitted length during the trip, in centimeters.
  /// This property will be set if the [TruckSpecifications.lengthInCentimeters]
  /// exceeds this value.

  /// [forbiddenAxleCount] The restriction to trucks with axles number within specified range during the trip.
  /// This property will be set if the [TruckSpecifications.axleCount]
  /// is within this range.

  /// [forbiddenTrailerCount] Constrains the restriction to trucks with number of trailer within specified range during the trip.
  /// This property will be set if the [TruckSpecifications.trailerCount]
  /// is within this range.

  /// [forbiddenHazardousGoods] There are two lists for our trip: Hazardous goods restrictions applied during the trip, and the list used
  /// for the route calculation provided using [TruckOptions.hazardousMaterials]. This property is the intersection of the two lists.

  /// [maxTunnelCategory] Tunnel category to restrict transport of specific goods during the trip.
  /// This property will be set if the [TruckOptions.linkTunnelCategory] exceeds this value.

  /// [forbiddenTruckType] This property will be set if a restriction applies to the value of [TruckType]
  /// parameter used for route calculation.

  /// [forbiddenTruckRoadTypes] Contains violated restrictions for truck road types.

  /// [routingZoneReference] Contains the restricted routing zone reference
  /// This property will be set if the [AvoidanceOptions.zoneCategories] is not empty

  /// [maxPayloadCapacityInKilograms] Max permitted payload capacity during the trip, in kilograms.
  /// This property will be set if the [TruckSpecifications.payloadCapacityInKilograms]
  /// exceeds this value.

  ViolatedRestrictionDetails._(this.maxGrossWeightInKilograms, this.maxWeightPerAxleInKilograms, this.maxWeightPerAxleGroupInKilograms, this.maxHeightInCentimeters, this.maxWidthInCentimeters, this.maxLengthInCentimeters, this.forbiddenAxleCount, this.forbiddenTrailerCount, this.forbiddenHazardousGoods, this.maxTunnelCategory, this.forbiddenTruckType, this.forbiddenTruckRoadTypes, this.routingZoneReference, this.maxPayloadCapacityInKilograms);
  ViolatedRestrictionDetails()
    : maxGrossWeightInKilograms = null, maxWeightPerAxleInKilograms = null, maxWeightPerAxleGroupInKilograms = null, maxHeightInCentimeters = null, maxWidthInCentimeters = null, maxLengthInCentimeters = null, forbiddenAxleCount = null, forbiddenTrailerCount = null, forbiddenHazardousGoods = [], maxTunnelCategory = null, forbiddenTruckType = null, forbiddenTruckRoadTypes = [], routingZoneReference = null, maxPayloadCapacityInKilograms = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ViolatedRestrictionDetails) return false;
    ViolatedRestrictionDetails _other = other;
    return maxGrossWeightInKilograms == _other.maxGrossWeightInKilograms &&
        maxWeightPerAxleInKilograms == _other.maxWeightPerAxleInKilograms &&
        maxWeightPerAxleGroupInKilograms == _other.maxWeightPerAxleGroupInKilograms &&
        maxHeightInCentimeters == _other.maxHeightInCentimeters &&
        maxWidthInCentimeters == _other.maxWidthInCentimeters &&
        maxLengthInCentimeters == _other.maxLengthInCentimeters &&
        forbiddenAxleCount == _other.forbiddenAxleCount &&
        forbiddenTrailerCount == _other.forbiddenTrailerCount &&
        DeepCollectionEquality().equals(forbiddenHazardousGoods, _other.forbiddenHazardousGoods) &&
        maxTunnelCategory == _other.maxTunnelCategory &&
        forbiddenTruckType == _other.forbiddenTruckType &&
        DeepCollectionEquality().equals(forbiddenTruckRoadTypes, _other.forbiddenTruckRoadTypes) &&
        routingZoneReference == _other.routingZoneReference &&
        maxPayloadCapacityInKilograms == _other.maxPayloadCapacityInKilograms;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + maxGrossWeightInKilograms.hashCode;
    result = 31 * result + maxWeightPerAxleInKilograms.hashCode;
    result = 31 * result + maxWeightPerAxleGroupInKilograms.hashCode;
    result = 31 * result + maxHeightInCentimeters.hashCode;
    result = 31 * result + maxWidthInCentimeters.hashCode;
    result = 31 * result + maxLengthInCentimeters.hashCode;
    result = 31 * result + forbiddenAxleCount.hashCode;
    result = 31 * result + forbiddenTrailerCount.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(forbiddenHazardousGoods);
    result = 31 * result + maxTunnelCategory.hashCode;
    result = 31 * result + forbiddenTruckType.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(forbiddenTruckRoadTypes);
    result = 31 * result + routingZoneReference.hashCode;
    result = 31 * result + maxPayloadCapacityInKilograms.hashCode;
    return result;
  }
}


// ViolatedRestrictionDetails "private" section, not exported.

final _sdkRoutingViolatedrestrictionDetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_create_handle'));
final _sdkRoutingViolatedrestrictionDetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_release_handle'));
final _sdkRoutingViolatedrestrictionDetailsGetFieldmaxGrossWeightInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_get_field_maxGrossWeightInKilograms'));
final _sdkRoutingViolatedrestrictionDetailsGetFieldmaxWeightPerAxleInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_get_field_maxWeightPerAxleInKilograms'));
final _sdkRoutingViolatedrestrictionDetailsGetFieldmaxWeightPerAxleGroupInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_get_field_maxWeightPerAxleGroupInKilograms'));
final _sdkRoutingViolatedrestrictionDetailsGetFieldmaxHeightInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_get_field_maxHeightInCentimeters'));
final _sdkRoutingViolatedrestrictionDetailsGetFieldmaxWidthInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_get_field_maxWidthInCentimeters'));
final _sdkRoutingViolatedrestrictionDetailsGetFieldmaxLengthInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_get_field_maxLengthInCentimeters'));
final _sdkRoutingViolatedrestrictionDetailsGetFieldforbiddenAxleCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_get_field_forbiddenAxleCount'));
final _sdkRoutingViolatedrestrictionDetailsGetFieldforbiddenTrailerCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_get_field_forbiddenTrailerCount'));
final _sdkRoutingViolatedrestrictionDetailsGetFieldforbiddenHazardousGoods = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_get_field_forbiddenHazardousGoods'));
final _sdkRoutingViolatedrestrictionDetailsGetFieldmaxTunnelCategory = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_get_field_maxTunnelCategory'));
final _sdkRoutingViolatedrestrictionDetailsGetFieldforbiddenTruckType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_get_field_forbiddenTruckType'));
final _sdkRoutingViolatedrestrictionDetailsGetFieldforbiddenTruckRoadTypes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_get_field_forbiddenTruckRoadTypes'));
final _sdkRoutingViolatedrestrictionDetailsGetFieldroutingZoneReference = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_get_field_routingZoneReference'));
final _sdkRoutingViolatedrestrictionDetailsGetFieldmaxPayloadCapacityInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_get_field_maxPayloadCapacityInKilograms'));



Pointer<Void> sdkRoutingViolatedrestrictionDetailsToFfi(ViolatedRestrictionDetails value) {
  final _maxGrossWeightInKilogramsHandle = intToFfiNullable(value.maxGrossWeightInKilograms);
  final _maxWeightPerAxleInKilogramsHandle = intToFfiNullable(value.maxWeightPerAxleInKilograms);
  final _maxWeightPerAxleGroupInKilogramsHandle = sdkRoutingMaxaxlegroupweightToFfiNullable(value.maxWeightPerAxleGroupInKilograms);
  final _maxHeightInCentimetersHandle = intToFfiNullable(value.maxHeightInCentimeters);
  final _maxWidthInCentimetersHandle = intToFfiNullable(value.maxWidthInCentimeters);
  final _maxLengthInCentimetersHandle = intToFfiNullable(value.maxLengthInCentimeters);
  final _forbiddenAxleCountHandle = sdkCoreIntegerrangeToFfiNullable(value.forbiddenAxleCount);
  final _forbiddenTrailerCountHandle = sdkCoreIntegerrangeToFfiNullable(value.forbiddenTrailerCount);
  final _forbiddenHazardousGoodsHandle = heresdkRoutingCommonBindingslistofSdkTransportHazardousmaterialToFfi(value.forbiddenHazardousGoods);
  final _maxTunnelCategoryHandle = sdkTransportTunnelcategoryToFfiNullable(value.maxTunnelCategory);
  final _forbiddenTruckTypeHandle = sdkTransportTrucktypeToFfiNullable(value.forbiddenTruckType);
  final _forbiddenTruckRoadTypesHandle = heresdkRoutingCommonBindingslistofSdkTransportTruckroadtypeToFfi(value.forbiddenTruckRoadTypes);
  final _routingZoneReferenceHandle = stringToFfiNullable(value.routingZoneReference);
  final _maxPayloadCapacityInKilogramsHandle = intToFfiNullable(value.maxPayloadCapacityInKilograms);
  final _result = _sdkRoutingViolatedrestrictionDetailsCreateHandle(_maxGrossWeightInKilogramsHandle, _maxWeightPerAxleInKilogramsHandle, _maxWeightPerAxleGroupInKilogramsHandle, _maxHeightInCentimetersHandle, _maxWidthInCentimetersHandle, _maxLengthInCentimetersHandle, _forbiddenAxleCountHandle, _forbiddenTrailerCountHandle, _forbiddenHazardousGoodsHandle, _maxTunnelCategoryHandle, _forbiddenTruckTypeHandle, _forbiddenTruckRoadTypesHandle, _routingZoneReferenceHandle, _maxPayloadCapacityInKilogramsHandle);
  intReleaseFfiHandleNullable(_maxGrossWeightInKilogramsHandle);
  intReleaseFfiHandleNullable(_maxWeightPerAxleInKilogramsHandle);
  sdkRoutingMaxaxlegroupweightReleaseFfiHandleNullable(_maxWeightPerAxleGroupInKilogramsHandle);
  intReleaseFfiHandleNullable(_maxHeightInCentimetersHandle);
  intReleaseFfiHandleNullable(_maxWidthInCentimetersHandle);
  intReleaseFfiHandleNullable(_maxLengthInCentimetersHandle);
  sdkCoreIntegerrangeReleaseFfiHandleNullable(_forbiddenAxleCountHandle);
  sdkCoreIntegerrangeReleaseFfiHandleNullable(_forbiddenTrailerCountHandle);
  heresdkRoutingCommonBindingslistofSdkTransportHazardousmaterialReleaseFfiHandle(_forbiddenHazardousGoodsHandle);
  sdkTransportTunnelcategoryReleaseFfiHandleNullable(_maxTunnelCategoryHandle);
  sdkTransportTrucktypeReleaseFfiHandleNullable(_forbiddenTruckTypeHandle);
  heresdkRoutingCommonBindingslistofSdkTransportTruckroadtypeReleaseFfiHandle(_forbiddenTruckRoadTypesHandle);
  stringReleaseFfiHandleNullable(_routingZoneReferenceHandle);
  intReleaseFfiHandleNullable(_maxPayloadCapacityInKilogramsHandle);
  return _result;
}

ViolatedRestrictionDetails sdkRoutingViolatedrestrictionDetailsFromFfi(Pointer<Void> handle) {
  final _maxGrossWeightInKilogramsHandle = _sdkRoutingViolatedrestrictionDetailsGetFieldmaxGrossWeightInKilograms(handle);
  final _maxWeightPerAxleInKilogramsHandle = _sdkRoutingViolatedrestrictionDetailsGetFieldmaxWeightPerAxleInKilograms(handle);
  final _maxWeightPerAxleGroupInKilogramsHandle = _sdkRoutingViolatedrestrictionDetailsGetFieldmaxWeightPerAxleGroupInKilograms(handle);
  final _maxHeightInCentimetersHandle = _sdkRoutingViolatedrestrictionDetailsGetFieldmaxHeightInCentimeters(handle);
  final _maxWidthInCentimetersHandle = _sdkRoutingViolatedrestrictionDetailsGetFieldmaxWidthInCentimeters(handle);
  final _maxLengthInCentimetersHandle = _sdkRoutingViolatedrestrictionDetailsGetFieldmaxLengthInCentimeters(handle);
  final _forbiddenAxleCountHandle = _sdkRoutingViolatedrestrictionDetailsGetFieldforbiddenAxleCount(handle);
  final _forbiddenTrailerCountHandle = _sdkRoutingViolatedrestrictionDetailsGetFieldforbiddenTrailerCount(handle);
  final _forbiddenHazardousGoodsHandle = _sdkRoutingViolatedrestrictionDetailsGetFieldforbiddenHazardousGoods(handle);
  final _maxTunnelCategoryHandle = _sdkRoutingViolatedrestrictionDetailsGetFieldmaxTunnelCategory(handle);
  final _forbiddenTruckTypeHandle = _sdkRoutingViolatedrestrictionDetailsGetFieldforbiddenTruckType(handle);
  final _forbiddenTruckRoadTypesHandle = _sdkRoutingViolatedrestrictionDetailsGetFieldforbiddenTruckRoadTypes(handle);
  final _routingZoneReferenceHandle = _sdkRoutingViolatedrestrictionDetailsGetFieldroutingZoneReference(handle);
  final _maxPayloadCapacityInKilogramsHandle = _sdkRoutingViolatedrestrictionDetailsGetFieldmaxPayloadCapacityInKilograms(handle);
  try {
    return ViolatedRestrictionDetails._(
      intFromFfiNullable(_maxGrossWeightInKilogramsHandle), 
      intFromFfiNullable(_maxWeightPerAxleInKilogramsHandle), 
      sdkRoutingMaxaxlegroupweightFromFfiNullable(_maxWeightPerAxleGroupInKilogramsHandle), 
      intFromFfiNullable(_maxHeightInCentimetersHandle), 
      intFromFfiNullable(_maxWidthInCentimetersHandle), 
      intFromFfiNullable(_maxLengthInCentimetersHandle), 
      sdkCoreIntegerrangeFromFfiNullable(_forbiddenAxleCountHandle), 
      sdkCoreIntegerrangeFromFfiNullable(_forbiddenTrailerCountHandle), 
      heresdkRoutingCommonBindingslistofSdkTransportHazardousmaterialFromFfi(_forbiddenHazardousGoodsHandle), 
      sdkTransportTunnelcategoryFromFfiNullable(_maxTunnelCategoryHandle), 
      sdkTransportTrucktypeFromFfiNullable(_forbiddenTruckTypeHandle), 
      heresdkRoutingCommonBindingslistofSdkTransportTruckroadtypeFromFfi(_forbiddenTruckRoadTypesHandle), 
      stringFromFfiNullable(_routingZoneReferenceHandle), 
      intFromFfiNullable(_maxPayloadCapacityInKilogramsHandle)
    );
  } finally {
    intReleaseFfiHandleNullable(_maxGrossWeightInKilogramsHandle);
    intReleaseFfiHandleNullable(_maxWeightPerAxleInKilogramsHandle);
    sdkRoutingMaxaxlegroupweightReleaseFfiHandleNullable(_maxWeightPerAxleGroupInKilogramsHandle);
    intReleaseFfiHandleNullable(_maxHeightInCentimetersHandle);
    intReleaseFfiHandleNullable(_maxWidthInCentimetersHandle);
    intReleaseFfiHandleNullable(_maxLengthInCentimetersHandle);
    sdkCoreIntegerrangeReleaseFfiHandleNullable(_forbiddenAxleCountHandle);
    sdkCoreIntegerrangeReleaseFfiHandleNullable(_forbiddenTrailerCountHandle);
    heresdkRoutingCommonBindingslistofSdkTransportHazardousmaterialReleaseFfiHandle(_forbiddenHazardousGoodsHandle);
    sdkTransportTunnelcategoryReleaseFfiHandleNullable(_maxTunnelCategoryHandle);
    sdkTransportTrucktypeReleaseFfiHandleNullable(_forbiddenTruckTypeHandle);
    heresdkRoutingCommonBindingslistofSdkTransportTruckroadtypeReleaseFfiHandle(_forbiddenTruckRoadTypesHandle);
    stringReleaseFfiHandleNullable(_routingZoneReferenceHandle);
    intReleaseFfiHandleNullable(_maxPayloadCapacityInKilogramsHandle);
  }
}

void sdkRoutingViolatedrestrictionDetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingViolatedrestrictionDetailsReleaseHandle(handle);

// Nullable ViolatedRestrictionDetails

final _sdkRoutingViolatedrestrictionDetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_create_handle_nullable'));
final _sdkRoutingViolatedrestrictionDetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_release_handle_nullable'));
final _sdkRoutingViolatedrestrictionDetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_Details_get_value_nullable'));

Pointer<Void> sdkRoutingViolatedrestrictionDetailsToFfiNullable(ViolatedRestrictionDetails? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingViolatedrestrictionDetailsToFfi(value);
  final result = _sdkRoutingViolatedrestrictionDetailsCreateHandleNullable(_handle);
  sdkRoutingViolatedrestrictionDetailsReleaseFfiHandle(_handle);
  return result;
}

ViolatedRestrictionDetails? sdkRoutingViolatedrestrictionDetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingViolatedrestrictionDetailsGetValueNullable(handle);
  final result = sdkRoutingViolatedrestrictionDetailsFromFfi(_handle);
  sdkRoutingViolatedrestrictionDetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingViolatedrestrictionDetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingViolatedrestrictionDetailsReleaseHandleNullable(handle);

// End of ViolatedRestrictionDetails "private" section.

// ViolatedRestriction "private" section, not exported.

final _sdkRoutingViolatedrestrictionCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint8, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_create_handle'));
final _sdkRoutingViolatedrestrictionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_release_handle'));
final _sdkRoutingViolatedrestrictionGetFieldcause = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_get_field_cause'));
final _sdkRoutingViolatedrestrictionGetFieldtimeDependent = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_get_field_timeDependent'));
final _sdkRoutingViolatedrestrictionGetFielddetails = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_get_field_details'));



Pointer<Void> sdkRoutingViolatedrestrictionToFfi(ViolatedRestriction value) {
  final _causeHandle = stringToFfi(value.cause);
  final _timeDependentHandle = booleanToFfi(value.timeDependent);
  final _detailsHandle = sdkRoutingViolatedrestrictionDetailsToFfiNullable(value.details);
  final _result = _sdkRoutingViolatedrestrictionCreateHandle(_causeHandle, _timeDependentHandle, _detailsHandle);
  stringReleaseFfiHandle(_causeHandle);
  booleanReleaseFfiHandle(_timeDependentHandle);
  sdkRoutingViolatedrestrictionDetailsReleaseFfiHandleNullable(_detailsHandle);
  return _result;
}

ViolatedRestriction sdkRoutingViolatedrestrictionFromFfi(Pointer<Void> handle) {
  final _causeHandle = _sdkRoutingViolatedrestrictionGetFieldcause(handle);
  final _timeDependentHandle = _sdkRoutingViolatedrestrictionGetFieldtimeDependent(handle);
  final _detailsHandle = _sdkRoutingViolatedrestrictionGetFielddetails(handle);
  try {
    return ViolatedRestriction._(
      stringFromFfi(_causeHandle), 
      booleanFromFfi(_timeDependentHandle), 
      sdkRoutingViolatedrestrictionDetailsFromFfiNullable(_detailsHandle)
    );
  } finally {
    stringReleaseFfiHandle(_causeHandle);
    booleanReleaseFfiHandle(_timeDependentHandle);
    sdkRoutingViolatedrestrictionDetailsReleaseFfiHandleNullable(_detailsHandle);
  }
}

void sdkRoutingViolatedrestrictionReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingViolatedrestrictionReleaseHandle(handle);

// Nullable ViolatedRestriction

final _sdkRoutingViolatedrestrictionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_create_handle_nullable'));
final _sdkRoutingViolatedrestrictionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_release_handle_nullable'));
final _sdkRoutingViolatedrestrictionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ViolatedRestriction_get_value_nullable'));

Pointer<Void> sdkRoutingViolatedrestrictionToFfiNullable(ViolatedRestriction? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingViolatedrestrictionToFfi(value);
  final result = _sdkRoutingViolatedrestrictionCreateHandleNullable(_handle);
  sdkRoutingViolatedrestrictionReleaseFfiHandle(_handle);
  return result;
}

ViolatedRestriction? sdkRoutingViolatedrestrictionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingViolatedrestrictionGetValueNullable(handle);
  final result = sdkRoutingViolatedrestrictionFromFfi(_handle);
  sdkRoutingViolatedrestrictionReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingViolatedrestrictionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingViolatedrestrictionReleaseHandleNullable(handle);

// End of ViolatedRestriction "private" section.


