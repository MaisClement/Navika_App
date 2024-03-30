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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/traffic/junctions_traversability.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_flow_base.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_location.dart';
import 'package:here_sdk/src/sdk/traffic/traversability.dart';

/// This class provides details about traffic flow along a [GeoCorridor], inside a [GeoCircle] or a [GeoBox], that represents particular path of the road network.<br/>
/// Backends for TrafficEngine and traffic vector tiles are different however backends may share the same data.<br/>
/// For additional information about fields, refer to [Traffic API v7 API Reference: Traffic API v7](https://www.here.com/docs/bundle/traffic-api-v7-api-reference/page/index.html#tag/Real-Time-Traffic).
///
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
abstract class TrafficFlow implements TrafficFlowBase {

  /// Gets the location of the incident.
  TrafficLocation get location;

  /// Gets the expected speed in meters per second along the roadway; will not exceed the legal speed limit.
  double? get speedInMetersPerSecond;

  /// Gets the expected speed in meters per second along the roadway; may exceed the legal speed limit.<br/>
  /// It is based on probe data (GPS coordinates sent by vehicles or mobile devices driving along that roadway).<br/>
  /// The calculated 'expected speed' may be over the legal speed limit for that roadway because people are driving over the speed limit.
  double? get speedUncappedInMetersPerSecond;

  /// Gets the jam tendency field value which denotes whether the congestion is increasing, decreasing, or constant.<br/>
  /// The congestion tendency may take the following values:
  /// - +2 - rapidly increasing congestion
  /// - +1 - increasing congestion
  /// - 0 - constant congestion
  /// - -1 - decreasing congestion
  /// - -2 - rapidly decreasing congestion
  ///
  /// Default value of 0 can be assumed when this attribute is not present.
  int? get jamTendency;

  /// Gets the confidence field value which is normalized value between 0.0 and 1.0.<br/>
  /// The confidence field indicates the proportion of real-time data included in the speed calculation.<br/>
  /// It is a normalized value between 0.0 and 1.0 with the following meaning:
  /// - 0.7 < confidence <= 1.0 indicates real time speeds
  /// - 0.5 < confidence <= 0.7 indicates historical speeds
  /// - 0.0 < confidence <= 0.5 indicates speed limit
  ///
  /// This field can be used to identify whether the data for a location is derived from
  /// real-time probe sources or historical information only.<br/>
  /// All confidence data 0.71 and above is based on real-time information,
  /// where a confidence value of 0.75 or greater indicates high confidence real-time information.<br/>
  /// A confidence value equal to 0.70 or lower means that the data is derived from historical data only.
  double? get confidence;

  /// Gets the traversability of roadway.
  Traversability? get traversability;

  /// Gets the traversability of junctions along the affected road.
  JunctionsTraversability? get junctionsTraversability;

}


// TrafficFlow "private" section, not exported.

final _sdkTrafficTrafficflowRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_traffic_TrafficFlow_register_finalizer'));
final _sdkTrafficTrafficflowCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlow_copy_handle'));
final _sdkTrafficTrafficflowReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlow_release_handle'));
final _sdkTrafficTrafficflowGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlow_get_type_id'));


class TrafficFlow$Impl extends __lib.NativeBase implements TrafficFlow {

  TrafficFlow$Impl(Pointer<Void> handle) : super(handle);

  @override
  TrafficLocation get location {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficFlow_location_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficTrafficlocationFromFfi(__resultHandle);
    } finally {
      sdkTrafficTrafficlocationReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  double? get speedInMetersPerSecond {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficFlow_speedInMetersPerSecond_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return doubleFromFfiNullable(__resultHandle);
    } finally {
      doubleReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  double? get speedUncappedInMetersPerSecond {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficFlow_speedUncappedInMetersPerSecond_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return doubleFromFfiNullable(__resultHandle);
    } finally {
      doubleReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  int? get jamTendency {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficFlow_jamTendency_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return shortFromFfiNullable(__resultHandle);
    } finally {
      shortReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  double? get confidence {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficFlow_confidence_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return doubleFromFfiNullable(__resultHandle);
    } finally {
      doubleReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  Traversability? get traversability {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficFlow_traversability_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficTraversabilityFromFfiNullable(__resultHandle);
    } finally {
      sdkTrafficTraversabilityReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  JunctionsTraversability? get junctionsTraversability {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficFlow_junctionsTraversability_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficJunctionstraversabilityFromFfiNullable(__resultHandle);
    } finally {
      sdkTrafficJunctionstraversabilityReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  double get freeFlowSpeedInMetersPerSecond {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficFlow_freeFlowSpeedInMetersPerSecond_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  double get jamFactor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficFlow_jamFactor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }



}

Pointer<Void> sdkTrafficTrafficflowToFfi(TrafficFlow value) =>
  _sdkTrafficTrafficflowCopyHandle((value as __lib.NativeBase).handle);

TrafficFlow sdkTrafficTrafficflowFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TrafficFlow) return instance;

  final _typeIdHandle = _sdkTrafficTrafficflowGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkTrafficTrafficflowCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TrafficFlow$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkTrafficTrafficflowRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkTrafficTrafficflowReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkTrafficTrafficflowReleaseHandle(handle);

Pointer<Void> sdkTrafficTrafficflowToFfiNullable(TrafficFlow? value) =>
  value != null ? sdkTrafficTrafficflowToFfi(value) : Pointer<Void>.fromAddress(0);

TrafficFlow? sdkTrafficTrafficflowFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkTrafficTrafficflowFromFfi(handle) : null;

void sdkTrafficTrafficflowReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficflowReleaseHandle(handle);

// End of TrafficFlow "private" section.


