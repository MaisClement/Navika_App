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
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';
import 'package:here_sdk/src/sdk/routing/transit_mode.dart';
import 'package:here_sdk/src/sdk/routing/transit_mode_filter.dart';
import 'package:meta/meta.dart';


/// All the options to specify how a public transit route should be calculated.

class TransitRouteOptions {
  /// Optional time when travel is expected to start.
  /// If it is not specified, it is set to the current time.
  DateTime? departureTime;

  /// Optional time when travel is expected to end.
  DateTime? arrivalTime;

  /// Number of alternative routes to return aside from the optimal route.
  /// The provided value must be in the range \[0, 6\].
  /// By default, it is 0 and only one route is calculated.
  int alternatives;

  /// Maximum number of changes or transfers allowed in a route.
  /// When it is not set, unlimited number of changes is permitted.
  /// The provided value must be in the range \[0, 6\].
  int? changes;

  /// Defines inclusion or exclusion of transit modes for route calculation.
  /// By default, the inclusion mode is used.
  TransitModeFilter modeFilter;

  /// This list is used to determine which transit modes should be used for route calculation,
  /// [TransitRouteOptions.modeFilter] specifies whether this list is an inclusion or an exclusion.
  /// For example, specifying subway and bus transit modes with the include filter, returns only subway
  /// and bus transit modes, and with the exclude filter, returns all the transit modes except subway
  /// and bus. When not set, all the supported transit modes are permitted.
  /// By default, this list is empty.
  List<TransitMode> modes;

  /// Walking speed in meters per second. Influences the duration of walking segments from origin to a station,
  /// from a station to destination and in-between the stations (e.g. if transfer is needed).
  /// The provided value must be in the range \[0.5, 2.0\].
  /// The default value is 1.0 mps.
  double pedestrianSpeedInMetersPerSecond;

  /// Maximum allowed walking distance in meters (e.g. when looking for nearest stations).
  /// The provided value must be in the range \[0, 6000\].
  /// The default value is 2000 meters.
  int pedestrianMaxDistanceInMeters;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  RouteTextOptions textOptions;

  /// Creates a new instance.

  /// [departureTime] Optional time when travel is expected to start.
  /// If it is not specified, it is set to the current time.

  /// [arrivalTime] Optional time when travel is expected to end.

  /// [alternatives] Number of alternative routes to return aside from the optimal route.
  /// The provided value must be in the range \[0, 6\].
  /// By default, it is 0 and only one route is calculated.

  /// [changes] Maximum number of changes or transfers allowed in a route.
  /// When it is not set, unlimited number of changes is permitted.
  /// The provided value must be in the range \[0, 6\].

  /// [modeFilter] Defines inclusion or exclusion of transit modes for route calculation.
  /// By default, the inclusion mode is used.

  /// [modes] This list is used to determine which transit modes should be used for route calculation,
  /// [TransitRouteOptions.modeFilter] specifies whether this list is an inclusion or an exclusion.
  /// For example, specifying subway and bus transit modes with the include filter, returns only subway
  /// and bus transit modes, and with the exclude filter, returns all the transit modes except subway
  /// and bus. When not set, all the supported transit modes are permitted.
  /// By default, this list is empty.

  /// [pedestrianSpeedInMetersPerSecond] Walking speed in meters per second. Influences the duration of walking segments from origin to a station,
  /// from a station to destination and in-between the stations (e.g. if transfer is needed).
  /// The provided value must be in the range \[0.5, 2.0\].
  /// The default value is 1.0 mps.

  /// [pedestrianMaxDistanceInMeters] Maximum allowed walking distance in meters (e.g. when looking for nearest stations).
  /// The provided value must be in the range \[0, 6000\].
  /// The default value is 2000 meters.

  /// [textOptions] Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.

  TransitRouteOptions._(this.departureTime, this.arrivalTime, this.alternatives, this.changes, this.modeFilter, this.modes, this.pedestrianSpeedInMetersPerSecond, this.pedestrianMaxDistanceInMeters, this.textOptions);
  TransitRouteOptions()
    : departureTime = null, arrivalTime = null, alternatives = 0, changes = null, modeFilter = TransitModeFilter.include, modes = [], pedestrianSpeedInMetersPerSecond = 1.0, pedestrianMaxDistanceInMeters = 2000, textOptions = RouteTextOptions();
  /// Returns TransitRouteOptions instance with default values used in SDK.
  ///
  /// Note: This feature is in BETA state and thus there can be bugs and unexpected behavior.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// Returns [TransitRouteOptions]. An [TransitRouteOptions] instance with default values used in SDK.
  ///
  static TransitRouteOptions fromDefaultParameterConfiguration() => $prototype.fromDefaultParameterConfiguration();
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TransitRouteOptions) return false;
    TransitRouteOptions _other = other;
    return departureTime == _other.departureTime &&
        arrivalTime == _other.arrivalTime &&
        alternatives == _other.alternatives &&
        changes == _other.changes &&
        modeFilter == _other.modeFilter &&
        DeepCollectionEquality().equals(modes, _other.modes) &&
        pedestrianSpeedInMetersPerSecond == _other.pedestrianSpeedInMetersPerSecond &&
        pedestrianMaxDistanceInMeters == _other.pedestrianMaxDistanceInMeters &&
        textOptions == _other.textOptions;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + departureTime.hashCode;
    result = 31 * result + arrivalTime.hashCode;
    result = 31 * result + alternatives.hashCode;
    result = 31 * result + changes.hashCode;
    result = 31 * result + modeFilter.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(modes);
    result = 31 * result + pedestrianSpeedInMetersPerSecond.hashCode;
    result = 31 * result + pedestrianMaxDistanceInMeters.hashCode;
    result = 31 * result + textOptions.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = TransitRouteOptions$Impl();
}


// TransitRouteOptions "private" section, not exported.

final _sdkRoutingTransitrouteoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Int32, Pointer<Void>, Uint32, Pointer<Void>, Double, Int32, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, int, Pointer<Void>, int, Pointer<Void>, double, int, Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_create_handle'));
final _sdkRoutingTransitrouteoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_release_handle'));
final _sdkRoutingTransitrouteoptionsGetFielddepartureTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_departureTime'));
final _sdkRoutingTransitrouteoptionsGetFieldarrivalTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_arrivalTime'));
final _sdkRoutingTransitrouteoptionsGetFieldalternatives = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_alternatives'));
final _sdkRoutingTransitrouteoptionsGetFieldchanges = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_changes'));
final _sdkRoutingTransitrouteoptionsGetFieldmodeFilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_modeFilter'));
final _sdkRoutingTransitrouteoptionsGetFieldmodes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_modes'));
final _sdkRoutingTransitrouteoptionsGetFieldpedestrianSpeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_pedestrianSpeedInMetersPerSecond'));
final _sdkRoutingTransitrouteoptionsGetFieldpedestrianMaxDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_pedestrianMaxDistanceInMeters'));
final _sdkRoutingTransitrouteoptionsGetFieldtextOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_field_textOptions'));



/// @nodoc
@visibleForTesting
class TransitRouteOptions$Impl {
  TransitRouteOptions fromDefaultParameterConfiguration() {
    final _fromDefaultParameterConfigurationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_routing_TransitRouteOptions_fromDefaultParameterConfiguration'));
    final __resultHandle = _fromDefaultParameterConfigurationFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkRoutingTransitrouteoptionsFromFfi(__resultHandle);
    } finally {
      sdkRoutingTransitrouteoptionsReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkRoutingTransitrouteoptionsToFfi(TransitRouteOptions value) {
  final _departureTimeHandle = dateToFfiNullable(value.departureTime);
  final _arrivalTimeHandle = dateToFfiNullable(value.arrivalTime);
  final _alternativesHandle = (value.alternatives);
  final _changesHandle = intToFfiNullable(value.changes);
  final _modeFilterHandle = sdkRoutingTransitmodefilterToFfi(value.modeFilter);
  final _modesHandle = heresdkRoutingCommonBindingslistofSdkRoutingTransitmodeToFfi(value.modes);
  final _pedestrianSpeedInMetersPerSecondHandle = (value.pedestrianSpeedInMetersPerSecond);
  final _pedestrianMaxDistanceInMetersHandle = (value.pedestrianMaxDistanceInMeters);
  final _textOptionsHandle = sdkRoutingRoutetextoptionsToFfi(value.textOptions);
  final _result = _sdkRoutingTransitrouteoptionsCreateHandle(_departureTimeHandle, _arrivalTimeHandle, _alternativesHandle, _changesHandle, _modeFilterHandle, _modesHandle, _pedestrianSpeedInMetersPerSecondHandle, _pedestrianMaxDistanceInMetersHandle, _textOptionsHandle);
  dateReleaseFfiHandleNullable(_departureTimeHandle);
  dateReleaseFfiHandleNullable(_arrivalTimeHandle);
  
  intReleaseFfiHandleNullable(_changesHandle);
  sdkRoutingTransitmodefilterReleaseFfiHandle(_modeFilterHandle);
  heresdkRoutingCommonBindingslistofSdkRoutingTransitmodeReleaseFfiHandle(_modesHandle);
  
  
  sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
  return _result;
}

TransitRouteOptions sdkRoutingTransitrouteoptionsFromFfi(Pointer<Void> handle) {
  final _departureTimeHandle = _sdkRoutingTransitrouteoptionsGetFielddepartureTime(handle);
  final _arrivalTimeHandle = _sdkRoutingTransitrouteoptionsGetFieldarrivalTime(handle);
  final _alternativesHandle = _sdkRoutingTransitrouteoptionsGetFieldalternatives(handle);
  final _changesHandle = _sdkRoutingTransitrouteoptionsGetFieldchanges(handle);
  final _modeFilterHandle = _sdkRoutingTransitrouteoptionsGetFieldmodeFilter(handle);
  final _modesHandle = _sdkRoutingTransitrouteoptionsGetFieldmodes(handle);
  final _pedestrianSpeedInMetersPerSecondHandle = _sdkRoutingTransitrouteoptionsGetFieldpedestrianSpeedInMetersPerSecond(handle);
  final _pedestrianMaxDistanceInMetersHandle = _sdkRoutingTransitrouteoptionsGetFieldpedestrianMaxDistanceInMeters(handle);
  final _textOptionsHandle = _sdkRoutingTransitrouteoptionsGetFieldtextOptions(handle);
  try {
    return TransitRouteOptions._(
      dateFromFfiNullable(_departureTimeHandle), 
      dateFromFfiNullable(_arrivalTimeHandle), 
      (_alternativesHandle), 
      intFromFfiNullable(_changesHandle), 
      sdkRoutingTransitmodefilterFromFfi(_modeFilterHandle), 
      heresdkRoutingCommonBindingslistofSdkRoutingTransitmodeFromFfi(_modesHandle), 
      (_pedestrianSpeedInMetersPerSecondHandle), 
      (_pedestrianMaxDistanceInMetersHandle), 
      sdkRoutingRoutetextoptionsFromFfi(_textOptionsHandle)
    );
  } finally {
    dateReleaseFfiHandleNullable(_departureTimeHandle);
    dateReleaseFfiHandleNullable(_arrivalTimeHandle);
    
    intReleaseFfiHandleNullable(_changesHandle);
    sdkRoutingTransitmodefilterReleaseFfiHandle(_modeFilterHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingTransitmodeReleaseFfiHandle(_modesHandle);
    
    
    sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
  }
}

void sdkRoutingTransitrouteoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingTransitrouteoptionsReleaseHandle(handle);

// Nullable TransitRouteOptions

final _sdkRoutingTransitrouteoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_create_handle_nullable'));
final _sdkRoutingTransitrouteoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_release_handle_nullable'));
final _sdkRoutingTransitrouteoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitRouteOptions_get_value_nullable'));

Pointer<Void> sdkRoutingTransitrouteoptionsToFfiNullable(TransitRouteOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTransitrouteoptionsToFfi(value);
  final result = _sdkRoutingTransitrouteoptionsCreateHandleNullable(_handle);
  sdkRoutingTransitrouteoptionsReleaseFfiHandle(_handle);
  return result;
}

TransitRouteOptions? sdkRoutingTransitrouteoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTransitrouteoptionsGetValueNullable(handle);
  final result = sdkRoutingTransitrouteoptionsFromFfi(_handle);
  sdkRoutingTransitrouteoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTransitrouteoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTransitrouteoptionsReleaseHandleNullable(handle);

// End of TransitRouteOptions "private" section.


