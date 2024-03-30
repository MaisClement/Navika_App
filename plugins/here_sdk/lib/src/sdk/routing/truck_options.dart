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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/avoidance_options.dart';
import 'package:here_sdk/src/sdk/routing/max_speed_on_segment.dart';
import 'package:here_sdk/src/sdk/routing/route_options.dart';
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';
import 'package:here_sdk/src/sdk/transport/hazardous_material.dart';
import 'package:here_sdk/src/sdk/transport/truck_road_type.dart';
import 'package:here_sdk/src/sdk/transport/truck_specifications.dart';
import 'package:here_sdk/src/sdk/transport/tunnel_category.dart';

/// All the options to specify how a truck route should be calculated.

class TruckOptions {
  /// Specifies the common route calculation options.
  RouteOptions routeOptions;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  RouteTextOptions textOptions;

  /// Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.
  AvoidanceOptions avoidanceOptions;

  /// Segments with restriction on maximum [DynamicSpeedInfo.baseSpeedInMetersPerSecond].
  List<MaxSpeedOnSegment> maxSpeedOnSegments;

  /// Detailed truck specifications such as dimensions and weight.
  TruckSpecifications truckSpecifications;

  /// Specifies the tunnel categories to restrict certain route links.
  /// The route will pass only through tunnels of a less strict category.
  /// Refer to [TunnelCategory] for the available options.
  TunnelCategory? linkTunnelCategory;

  /// Specifies a list of hazardous materials shipped in the vehicle.
  /// Refer to [HazardousMaterial] for the available options.
  List<HazardousMaterial> hazardousMaterials;

  /// Specifies a list of avoided truck road types for vehicle.
  /// Refer to [TruckRoadType] for the available options.
  List<TruckRoadType> avoidedTruckRoadTypes;

  /// Creates a new instance.

  /// [routeOptions] Specifies the common route calculation options.

  /// [textOptions] Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.

  /// [avoidanceOptions] Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.

  /// [maxSpeedOnSegments] Segments with restriction on maximum [DynamicSpeedInfo.baseSpeedInMetersPerSecond].

  /// [truckSpecifications] Detailed truck specifications such as dimensions and weight.

  /// [linkTunnelCategory] Specifies the tunnel categories to restrict certain route links.
  /// The route will pass only through tunnels of a less strict category.
  /// Refer to [TunnelCategory] for the available options.

  /// [hazardousMaterials] Specifies a list of hazardous materials shipped in the vehicle.
  /// Refer to [HazardousMaterial] for the available options.

  /// [avoidedTruckRoadTypes] Specifies a list of avoided truck road types for vehicle.
  /// Refer to [TruckRoadType] for the available options.

  TruckOptions._(this.routeOptions, this.textOptions, this.avoidanceOptions, this.maxSpeedOnSegments, this.truckSpecifications, this.linkTunnelCategory, this.hazardousMaterials, this.avoidedTruckRoadTypes);
  TruckOptions()
    : routeOptions = RouteOptions.withDefaults(), textOptions = RouteTextOptions(), avoidanceOptions = AvoidanceOptions(), maxSpeedOnSegments = [], truckSpecifications = TruckSpecifications(), linkTunnelCategory = null, hazardousMaterials = [], avoidedTruckRoadTypes = [];
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TruckOptions) return false;
    TruckOptions _other = other;
    return routeOptions == _other.routeOptions &&
        textOptions == _other.textOptions &&
        avoidanceOptions == _other.avoidanceOptions &&
        DeepCollectionEquality().equals(maxSpeedOnSegments, _other.maxSpeedOnSegments) &&
        truckSpecifications == _other.truckSpecifications &&
        linkTunnelCategory == _other.linkTunnelCategory &&
        DeepCollectionEquality().equals(hazardousMaterials, _other.hazardousMaterials) &&
        DeepCollectionEquality().equals(avoidedTruckRoadTypes, _other.avoidedTruckRoadTypes);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + routeOptions.hashCode;
    result = 31 * result + textOptions.hashCode;
    result = 31 * result + avoidanceOptions.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(maxSpeedOnSegments);
    result = 31 * result + truckSpecifications.hashCode;
    result = 31 * result + linkTunnelCategory.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(hazardousMaterials);
    result = 31 * result + DeepCollectionEquality().hash(avoidedTruckRoadTypes);
    return result;
  }
}


// TruckOptions "private" section, not exported.

final _sdkRoutingTruckoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_create_handle'));
final _sdkRoutingTruckoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_release_handle'));
final _sdkRoutingTruckoptionsGetFieldrouteOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_field_routeOptions'));
final _sdkRoutingTruckoptionsGetFieldtextOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_field_textOptions'));
final _sdkRoutingTruckoptionsGetFieldavoidanceOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_field_avoidanceOptions'));
final _sdkRoutingTruckoptionsGetFieldmaxSpeedOnSegments = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_field_maxSpeedOnSegments'));
final _sdkRoutingTruckoptionsGetFieldtruckSpecifications = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_field_truckSpecifications'));
final _sdkRoutingTruckoptionsGetFieldlinkTunnelCategory = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_field_linkTunnelCategory'));
final _sdkRoutingTruckoptionsGetFieldhazardousMaterials = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_field_hazardousMaterials'));
final _sdkRoutingTruckoptionsGetFieldavoidedTruckRoadTypes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_field_avoidedTruckRoadTypes'));



Pointer<Void> sdkRoutingTruckoptionsToFfi(TruckOptions value) {
  final _routeOptionsHandle = sdkRoutingRouteoptionsToFfi(value.routeOptions);
  final _textOptionsHandle = sdkRoutingRoutetextoptionsToFfi(value.textOptions);
  final _avoidanceOptionsHandle = sdkRoutingAvoidanceoptionsToFfi(value.avoidanceOptions);
  final _maxSpeedOnSegmentsHandle = heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentToFfi(value.maxSpeedOnSegments);
  final _truckSpecificationsHandle = sdkTransportTruckspecificationsToFfi(value.truckSpecifications);
  final _linkTunnelCategoryHandle = sdkTransportTunnelcategoryToFfiNullable(value.linkTunnelCategory);
  final _hazardousMaterialsHandle = heresdkRoutingCommonBindingslistofSdkTransportHazardousmaterialToFfi(value.hazardousMaterials);
  final _avoidedTruckRoadTypesHandle = heresdkRoutingCommonBindingslistofSdkTransportTruckroadtypeToFfi(value.avoidedTruckRoadTypes);
  final _result = _sdkRoutingTruckoptionsCreateHandle(_routeOptionsHandle, _textOptionsHandle, _avoidanceOptionsHandle, _maxSpeedOnSegmentsHandle, _truckSpecificationsHandle, _linkTunnelCategoryHandle, _hazardousMaterialsHandle, _avoidedTruckRoadTypesHandle);
  sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
  sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
  sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
  heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentReleaseFfiHandle(_maxSpeedOnSegmentsHandle);
  sdkTransportTruckspecificationsReleaseFfiHandle(_truckSpecificationsHandle);
  sdkTransportTunnelcategoryReleaseFfiHandleNullable(_linkTunnelCategoryHandle);
  heresdkRoutingCommonBindingslistofSdkTransportHazardousmaterialReleaseFfiHandle(_hazardousMaterialsHandle);
  heresdkRoutingCommonBindingslistofSdkTransportTruckroadtypeReleaseFfiHandle(_avoidedTruckRoadTypesHandle);
  return _result;
}

TruckOptions sdkRoutingTruckoptionsFromFfi(Pointer<Void> handle) {
  final _routeOptionsHandle = _sdkRoutingTruckoptionsGetFieldrouteOptions(handle);
  final _textOptionsHandle = _sdkRoutingTruckoptionsGetFieldtextOptions(handle);
  final _avoidanceOptionsHandle = _sdkRoutingTruckoptionsGetFieldavoidanceOptions(handle);
  final _maxSpeedOnSegmentsHandle = _sdkRoutingTruckoptionsGetFieldmaxSpeedOnSegments(handle);
  final _truckSpecificationsHandle = _sdkRoutingTruckoptionsGetFieldtruckSpecifications(handle);
  final _linkTunnelCategoryHandle = _sdkRoutingTruckoptionsGetFieldlinkTunnelCategory(handle);
  final _hazardousMaterialsHandle = _sdkRoutingTruckoptionsGetFieldhazardousMaterials(handle);
  final _avoidedTruckRoadTypesHandle = _sdkRoutingTruckoptionsGetFieldavoidedTruckRoadTypes(handle);
  try {
    return TruckOptions._(
      sdkRoutingRouteoptionsFromFfi(_routeOptionsHandle), 
      sdkRoutingRoutetextoptionsFromFfi(_textOptionsHandle), 
      sdkRoutingAvoidanceoptionsFromFfi(_avoidanceOptionsHandle), 
      heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentFromFfi(_maxSpeedOnSegmentsHandle), 
      sdkTransportTruckspecificationsFromFfi(_truckSpecificationsHandle), 
      sdkTransportTunnelcategoryFromFfiNullable(_linkTunnelCategoryHandle), 
      heresdkRoutingCommonBindingslistofSdkTransportHazardousmaterialFromFfi(_hazardousMaterialsHandle), 
      heresdkRoutingCommonBindingslistofSdkTransportTruckroadtypeFromFfi(_avoidedTruckRoadTypesHandle)
    );
  } finally {
    sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
    sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
    sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingMaxspeedonsegmentReleaseFfiHandle(_maxSpeedOnSegmentsHandle);
    sdkTransportTruckspecificationsReleaseFfiHandle(_truckSpecificationsHandle);
    sdkTransportTunnelcategoryReleaseFfiHandleNullable(_linkTunnelCategoryHandle);
    heresdkRoutingCommonBindingslistofSdkTransportHazardousmaterialReleaseFfiHandle(_hazardousMaterialsHandle);
    heresdkRoutingCommonBindingslistofSdkTransportTruckroadtypeReleaseFfiHandle(_avoidedTruckRoadTypesHandle);
  }
}

void sdkRoutingTruckoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingTruckoptionsReleaseHandle(handle);

// Nullable TruckOptions

final _sdkRoutingTruckoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_create_handle_nullable'));
final _sdkRoutingTruckoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_release_handle_nullable'));
final _sdkRoutingTruckoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TruckOptions_get_value_nullable'));

Pointer<Void> sdkRoutingTruckoptionsToFfiNullable(TruckOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTruckoptionsToFfi(value);
  final result = _sdkRoutingTruckoptionsCreateHandleNullable(_handle);
  sdkRoutingTruckoptionsReleaseFfiHandle(_handle);
  return result;
}

TruckOptions? sdkRoutingTruckoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTruckoptionsGetValueNullable(handle);
  final result = sdkRoutingTruckoptionsFromFfi(_handle);
  sdkRoutingTruckoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTruckoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTruckoptionsReleaseHandleNullable(handle);

// End of TruckOptions "private" section.


