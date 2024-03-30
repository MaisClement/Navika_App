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
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_circle.dart';
import 'package:here_sdk/src/sdk/core/geo_corridor.dart';
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_flow_query_callback.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_flow_query_options.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_lookup_callback.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_lookup_options.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incidents_query_callback.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incidents_query_options.dart';
import 'package:meta/meta.dart';

/// Use the TrafficEngine to get information about current traffic flow and incidents in an area
/// specified by [GeoBox], [GeoCircle], or [GeoCorridor].
///
/// Provides optional parameters given in [TrafficIncidentsQueryOptions] and [TrafficFlowQueryOptions] to filter the result.
///
/// By default, incidents are localized based on their geographical
/// location. You can override that behavior by specifying the
/// desired language that should be used for the incidents description and summary.
///
/// The resulting traffic data contains information on incident
/// types such as congestion, construction for road works, road hazard,
/// road closure, weather updates for road condition, lane restriction
/// and others.
///
/// Traffic data is fetched online to get the most precise and freshest data available.
/// In offline mode, live traffic data can be fetched using the traffic pass-through features.
/// See [SDKNativeEngine.passThroughFeatures]
abstract class TrafficEngine {
  /// Creates a new instance of this class.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory TrafficEngine() => $prototype.$init();
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] An SDKEngine instance.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory TrafficEngine.withSdkEngine(SDKNativeEngine sdkEngine) => $prototype.withSdkEngine(sdkEngine);

  /// Asynchronously queries for traffic incidents using a bounding box as a filter.
  ///
  /// [boxArea] The bounding box area to search for traffic incidents.
  /// The maximum width and height for a bounding box filter is 1 degree.
  ///
  /// [queryOptions] The options which are specific for incidents query.
  ///
  /// [callback] It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle queryForIncidentsInBox(GeoBox boxArea, TrafficIncidentsQueryOptions queryOptions, TrafficIncidentsQueryCallback callback);
  /// Asynchronously queries for traffic incidents using a circle as a filter.
  ///
  /// [circleArea] The circle area to search for traffic incidents.
  /// The maximum radius of the circle filter is 50000 meters.
  ///
  /// [queryOptions] The options which are specific for incidents query.
  ///
  /// [callback] It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle queryForIncidentsInCircle(GeoCircle circleArea, TrafficIncidentsQueryOptions queryOptions, TrafficIncidentsQueryCallback callback);
  /// Asynchronously queries for traffic incidents by a corridor as a filter.
  ///
  /// [corridorArea] The corridor box to search for traffic incidents.
  /// The maximum length for the corridor is 500000 meters and the maximum `GeoCorridor.half_width_in_meters` is 5000 meters.
  /// If no `GeoCorridor.half_width_in_meters` is specified, the default value is used. The default value is 30 meters.
  ///
  /// [queryOptions] The options which are specific for incidents query.
  ///
  /// [callback] It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle queryForIncidentsInCorridor(GeoCorridor corridorArea, TrafficIncidentsQueryOptions queryOptions, TrafficIncidentsQueryCallback callback);
  /// Asynchronously queries for traffic incident by the original id.
  ///
  /// See [TrafficIncident.originalId] for more information.
  ///
  /// [originalId] The requested incident original id.
  ///
  /// [lookupOptions] The options which are specific for the incident lookup query.
  ///
  /// [callback] The callback object that will be invoked after the incident lookup query.
  /// It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle lookupIncident(String originalId, TrafficIncidentLookupOptions lookupOptions, TrafficIncidentLookupCallback callback);
  /// Asynchronously queries for traffic flow using a bounding box as a filter.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [boxArea] The bounding box area to search for traffic flow.
  ///
  /// [queryOptions] The options which are specific for flow query.
  ///
  /// [callback] It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle queryForFlowInBox(GeoBox boxArea, TrafficFlowQueryOptions queryOptions, TrafficFlowQueryCallback callback);
  /// Asynchronously queries for traffic flow using a circle as a filter.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [circleArea] The circle area to search for traffic flow.
  /// The maximum radius of the circle filter is 50000 meters.
  ///
  /// [queryOptions] The options which are specific for flow query.
  ///
  /// [callback] It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle queryForFlowInCircle(GeoCircle circleArea, TrafficFlowQueryOptions queryOptions, TrafficFlowQueryCallback callback);
  /// Asynchronously queries for traffic flow by a corridor as a filter.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [corridorArea] The corridor box to search for traffic flow.
  /// The maximum length for the corridor is 500000 meters and the maximum `GeoCorridor.half_width_in_meters` is 5000 meters.
  /// If no `GeoCorridor.half_width_in_meters` is specified, the default value is used. The default value is 30 meters.
  ///
  /// [queryOptions] The options which are specific for flow query.
  ///
  /// [callback] It is always invoked on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle queryForFlowInCorridor(GeoCorridor corridorArea, TrafficFlowQueryOptions queryOptions, TrafficFlowQueryCallback callback);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = TrafficEngine$Impl(Pointer<Void>.fromAddress(0));
}


// TrafficEngine "private" section, not exported.

final _sdkTrafficTrafficengineRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_traffic_TrafficEngine_register_finalizer'));
final _sdkTrafficTrafficengineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficEngine_copy_handle'));
final _sdkTrafficTrafficengineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficEngine_release_handle'));


final _$initsdkTrafficTrafficengineMakeReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficEngine_make_return_release_handle'));
final _$initsdkTrafficTrafficengineMakeReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficEngine_make_return_get_result'));
final _$initsdkTrafficTrafficengineMakeReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficEngine_make_return_get_error'));
final _$initsdkTrafficTrafficengineMakeReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficEngine_make_return_has_error'));


final _withSdkEnginesdkTrafficTrafficengineMakeSdknativeengineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficEngine_make__SDKNativeEngine_return_release_handle'));
final _withSdkEnginesdkTrafficTrafficengineMakeSdknativeengineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficEngine_make__SDKNativeEngine_return_get_result'));
final _withSdkEnginesdkTrafficTrafficengineMakeSdknativeengineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficEngine_make__SDKNativeEngine_return_get_error'));
final _withSdkEnginesdkTrafficTrafficengineMakeSdknativeengineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficEngine_make__SDKNativeEngine_return_has_error'));









/// @nodoc
@visibleForTesting
class TrafficEngine$Impl extends __lib.NativeBase implements TrafficEngine {

  TrafficEngine$Impl(Pointer<Void> handle) : super(handle);


  TrafficEngine $init() {
    final _result_handle = _$init();
    final _result = TrafficEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkTrafficTrafficengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  TrafficEngine withSdkEngine(SDKNativeEngine sdkEngine) {
    final _result_handle = _withSdkEngine(sdkEngine);
    final _result = TrafficEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkTrafficTrafficengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_traffic_TrafficEngine_make'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    if (_$initsdkTrafficTrafficengineMakeReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsdkTrafficTrafficengineMakeReturnGetError(__callResultHandle);
        _$initsdkTrafficTrafficengineMakeReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsdkTrafficTrafficengineMakeReturnGetResult(__callResultHandle);
    _$initsdkTrafficTrafficengineMakeReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine) {
    final _withSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_traffic_TrafficEngine_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _withSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    if (_withSdkEnginesdkTrafficTrafficengineMakeSdknativeengineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withSdkEnginesdkTrafficTrafficengineMakeSdknativeengineReturnGetError(__callResultHandle);
        _withSdkEnginesdkTrafficTrafficengineMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withSdkEnginesdkTrafficTrafficengineMakeSdknativeengineReturnGetResult(__callResultHandle);
    _withSdkEnginesdkTrafficTrafficengineMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  TaskHandle queryForIncidentsInBox(GeoBox boxArea, TrafficIncidentsQueryOptions queryOptions, TrafficIncidentsQueryCallback callback) {
    final _queryForIncidentsInBoxFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_traffic_TrafficEngine_queryForIncidents__GeoBox_TrafficIncidentsQueryOptions_TrafficIncidentsQueryCallback'));
    final _boxAreaHandle = sdkCoreGeoboxToFfi(boxArea);
    final _queryOptionsHandle = sdkTrafficTrafficincidentsqueryoptionsToFfi(queryOptions);
    final _callbackHandle = sdkTrafficTrafficincidentsquerycallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _queryForIncidentsInBoxFfi(_handle, __lib.LibraryContext.isolateId, _boxAreaHandle, _queryOptionsHandle, _callbackHandle);
    sdkCoreGeoboxReleaseFfiHandle(_boxAreaHandle);
    sdkTrafficTrafficincidentsqueryoptionsReleaseFfiHandle(_queryOptionsHandle);
    sdkTrafficTrafficincidentsquerycallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle queryForIncidentsInCircle(GeoCircle circleArea, TrafficIncidentsQueryOptions queryOptions, TrafficIncidentsQueryCallback callback) {
    final _queryForIncidentsInCircleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_traffic_TrafficEngine_queryForIncidents__GeoCircle_TrafficIncidentsQueryOptions_TrafficIncidentsQueryCallback'));
    final _circleAreaHandle = sdkCoreGeocircleToFfi(circleArea);
    final _queryOptionsHandle = sdkTrafficTrafficincidentsqueryoptionsToFfi(queryOptions);
    final _callbackHandle = sdkTrafficTrafficincidentsquerycallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _queryForIncidentsInCircleFfi(_handle, __lib.LibraryContext.isolateId, _circleAreaHandle, _queryOptionsHandle, _callbackHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleAreaHandle);
    sdkTrafficTrafficincidentsqueryoptionsReleaseFfiHandle(_queryOptionsHandle);
    sdkTrafficTrafficincidentsquerycallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle queryForIncidentsInCorridor(GeoCorridor corridorArea, TrafficIncidentsQueryOptions queryOptions, TrafficIncidentsQueryCallback callback) {
    final _queryForIncidentsInCorridorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_traffic_TrafficEngine_queryForIncidents__GeoCorridor_TrafficIncidentsQueryOptions_TrafficIncidentsQueryCallback'));
    final _corridorAreaHandle = sdkCoreGeocorridorToFfi(corridorArea);
    final _queryOptionsHandle = sdkTrafficTrafficincidentsqueryoptionsToFfi(queryOptions);
    final _callbackHandle = sdkTrafficTrafficincidentsquerycallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _queryForIncidentsInCorridorFfi(_handle, __lib.LibraryContext.isolateId, _corridorAreaHandle, _queryOptionsHandle, _callbackHandle);
    sdkCoreGeocorridorReleaseFfiHandle(_corridorAreaHandle);
    sdkTrafficTrafficincidentsqueryoptionsReleaseFfiHandle(_queryOptionsHandle);
    sdkTrafficTrafficincidentsquerycallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle lookupIncident(String originalId, TrafficIncidentLookupOptions lookupOptions, TrafficIncidentLookupCallback callback) {
    final _lookupIncidentFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_traffic_TrafficEngine_lookupIncident__String_TrafficIncidentLookupOptions_TrafficIncidentLookupCallback'));
    final _originalIdHandle = stringToFfi(originalId);
    final _lookupOptionsHandle = sdkTrafficTrafficincidentlookupoptionsToFfi(lookupOptions);
    final _callbackHandle = sdkTrafficTrafficincidentlookupcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _lookupIncidentFfi(_handle, __lib.LibraryContext.isolateId, _originalIdHandle, _lookupOptionsHandle, _callbackHandle);
    stringReleaseFfiHandle(_originalIdHandle);
    sdkTrafficTrafficincidentlookupoptionsReleaseFfiHandle(_lookupOptionsHandle);
    sdkTrafficTrafficincidentlookupcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle queryForFlowInBox(GeoBox boxArea, TrafficFlowQueryOptions queryOptions, TrafficFlowQueryCallback callback) {
    final _queryForFlowInBoxFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_traffic_TrafficEngine_queryForFlow__GeoBox_TrafficFlowQueryOptions_TrafficFlowQueryCallback'));
    final _boxAreaHandle = sdkCoreGeoboxToFfi(boxArea);
    final _queryOptionsHandle = sdkTrafficTrafficflowqueryoptionsToFfi(queryOptions);
    final _callbackHandle = sdkTrafficTrafficflowquerycallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _queryForFlowInBoxFfi(_handle, __lib.LibraryContext.isolateId, _boxAreaHandle, _queryOptionsHandle, _callbackHandle);
    sdkCoreGeoboxReleaseFfiHandle(_boxAreaHandle);
    sdkTrafficTrafficflowqueryoptionsReleaseFfiHandle(_queryOptionsHandle);
    sdkTrafficTrafficflowquerycallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle queryForFlowInCircle(GeoCircle circleArea, TrafficFlowQueryOptions queryOptions, TrafficFlowQueryCallback callback) {
    final _queryForFlowInCircleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_traffic_TrafficEngine_queryForFlow__GeoCircle_TrafficFlowQueryOptions_TrafficFlowQueryCallback'));
    final _circleAreaHandle = sdkCoreGeocircleToFfi(circleArea);
    final _queryOptionsHandle = sdkTrafficTrafficflowqueryoptionsToFfi(queryOptions);
    final _callbackHandle = sdkTrafficTrafficflowquerycallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _queryForFlowInCircleFfi(_handle, __lib.LibraryContext.isolateId, _circleAreaHandle, _queryOptionsHandle, _callbackHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleAreaHandle);
    sdkTrafficTrafficflowqueryoptionsReleaseFfiHandle(_queryOptionsHandle);
    sdkTrafficTrafficflowquerycallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle queryForFlowInCorridor(GeoCorridor corridorArea, TrafficFlowQueryOptions queryOptions, TrafficFlowQueryCallback callback) {
    final _queryForFlowInCorridorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_traffic_TrafficEngine_queryForFlow__GeoCorridor_TrafficFlowQueryOptions_TrafficFlowQueryCallback'));
    final _corridorAreaHandle = sdkCoreGeocorridorToFfi(corridorArea);
    final _queryOptionsHandle = sdkTrafficTrafficflowqueryoptionsToFfi(queryOptions);
    final _callbackHandle = sdkTrafficTrafficflowquerycallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _queryForFlowInCorridorFfi(_handle, __lib.LibraryContext.isolateId, _corridorAreaHandle, _queryOptionsHandle, _callbackHandle);
    sdkCoreGeocorridorReleaseFfiHandle(_corridorAreaHandle);
    sdkTrafficTrafficflowqueryoptionsReleaseFfiHandle(_queryOptionsHandle);
    sdkTrafficTrafficflowquerycallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkTrafficTrafficengineToFfi(TrafficEngine value) =>
  _sdkTrafficTrafficengineCopyHandle((value as __lib.NativeBase).handle);

TrafficEngine sdkTrafficTrafficengineFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TrafficEngine) return instance;

  final _copiedHandle = _sdkTrafficTrafficengineCopyHandle(handle);
  final result = TrafficEngine$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkTrafficTrafficengineRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkTrafficTrafficengineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkTrafficTrafficengineReleaseHandle(handle);

Pointer<Void> sdkTrafficTrafficengineToFfiNullable(TrafficEngine? value) =>
  value != null ? sdkTrafficTrafficengineToFfi(value) : Pointer<Void>.fromAddress(0);

TrafficEngine? sdkTrafficTrafficengineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkTrafficTrafficengineFromFfi(handle) : null;

void sdkTrafficTrafficengineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficengineReleaseHandle(handle);

// End of TrafficEngine "private" section.


