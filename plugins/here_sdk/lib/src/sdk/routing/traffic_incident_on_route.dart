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
import 'package:here_sdk/src/sdk/core/localized_text.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_base.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_impact.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_type.dart';

/// Traffic incidents on a route.
///
/// Use [Section.trafficIncidents] to get a list of incidents on a route section.
/// Use [Span.trafficIncidentIndexes] to associate incidents with spans. Each incident takes at least the whole geometry of matching spans.
/// Also, an incident can take some place out of the built route.
abstract class TrafficIncidentOnRoute implements TrafficIncidentBase {

  /// Gets the unique current identifier for a traffic incident.
  /// Note, the identifier can be changed by the backend due to some events, e.g. changing of
  /// [TrafficIncidentBase.endTime]. This field will be empty for `OfflineRouting`.
  String? get id;

}


// TrafficIncidentOnRoute "private" section, not exported.

final _sdkRoutingTrafficincidentonrouteRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_routing_TrafficIncidentOnRoute_register_finalizer'));
final _sdkRoutingTrafficincidentonrouteCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficIncidentOnRoute_copy_handle'));
final _sdkRoutingTrafficincidentonrouteReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficIncidentOnRoute_release_handle'));
final _sdkRoutingTrafficincidentonrouteGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TrafficIncidentOnRoute_get_type_id'));


class TrafficIncidentOnRoute$Impl extends __lib.NativeBase implements TrafficIncidentOnRoute {

  TrafficIncidentOnRoute$Impl(Pointer<Void> handle) : super(handle);

  @override
  String? get id {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_TrafficIncidentOnRoute_id_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  TrafficIncidentImpact get impact {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_TrafficIncidentOnRoute_impact_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficTrafficincidentimpactFromFfi(__resultHandle);
    } finally {
      sdkTrafficTrafficincidentimpactReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  TrafficIncidentType get type {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_routing_TrafficIncidentOnRoute_type_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficTrafficincidenttypeFromFfi(__resultHandle);
    } finally {
      sdkTrafficTrafficincidenttypeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  LocalizedText get description {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_TrafficIncidentOnRoute_description_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLocalizedtextFromFfi(__resultHandle);
    } finally {
      sdkCoreLocalizedtextReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  DateTime? get startTime {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_TrafficIncidentOnRoute_startTime_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return dateFromFfiNullable(__resultHandle);
    } finally {
      dateReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  DateTime? get endTime {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_TrafficIncidentOnRoute_endTime_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return dateFromFfiNullable(__resultHandle);
    } finally {
      dateReleaseFfiHandleNullable(__resultHandle);

    }

  }



}

Pointer<Void> sdkRoutingTrafficincidentonrouteToFfi(TrafficIncidentOnRoute value) =>
  _sdkRoutingTrafficincidentonrouteCopyHandle((value as __lib.NativeBase).handle);

TrafficIncidentOnRoute sdkRoutingTrafficincidentonrouteFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TrafficIncidentOnRoute) return instance;

  final _typeIdHandle = _sdkRoutingTrafficincidentonrouteGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkRoutingTrafficincidentonrouteCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TrafficIncidentOnRoute$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkRoutingTrafficincidentonrouteRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkRoutingTrafficincidentonrouteReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingTrafficincidentonrouteReleaseHandle(handle);

Pointer<Void> sdkRoutingTrafficincidentonrouteToFfiNullable(TrafficIncidentOnRoute? value) =>
  value != null ? sdkRoutingTrafficincidentonrouteToFfi(value) : Pointer<Void>.fromAddress(0);

TrafficIncidentOnRoute? sdkRoutingTrafficincidentonrouteFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingTrafficincidentonrouteFromFfi(handle) : null;

void sdkRoutingTrafficincidentonrouteReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTrafficincidentonrouteReleaseHandle(handle);

// End of TrafficIncidentOnRoute "private" section.


