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
import 'package:here_sdk/src/sdk/traffic/traffic_incident_impact.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_type.dart';

/// TrafficIncident provides details about a traffic incident.
abstract class TrafficIncidentBase {
  /// TrafficIncident provides details about a traffic incident.

  factory TrafficIncidentBase(
    TrafficIncidentImpact Function() impactGetLambda,
    TrafficIncidentType Function() typeGetLambda,
    LocalizedText Function() descriptionGetLambda,
    DateTime? Function() startTimeGetLambda,
    DateTime? Function() endTimeGetLambda
  ) => TrafficIncidentBase$Lambdas(
    impactGetLambda,
    typeGetLambda,
    descriptionGetLambda,
    startTimeGetLambda,
    endTimeGetLambda
  );

  /// Gets the impact of the incident.
  /// The value is [TrafficIncidentImpact.unknown] if it hasn't been provided by the traffic incidents supplier.
  TrafficIncidentImpact get impact;

  /// Gets the category of the incident.
  /// The value is [TrafficIncidentType.unknown] if it hasn't been provided by the traffic incidents supplier.
  TrafficIncidentType get type;

  /// Gets the human readable description of the incident, possibly with location information.
  ///
  /// **Note:** The description is currently not present in our map data. Therefore, when
  /// accessing the data from a picked carto POI via `TrafficIncidentResult`, then
  /// always an empty string is returned. This does not apply when using the `TrafficEngine`.
  LocalizedText get description;

  /// Gets the time from which the incident is valid, before this time the incident should not be considered.
  /// The value is `null` if it hasn't been provided by the traffic incidents supplier.
  DateTime? get startTime;

  /// Get the time until which the incident is valid, after this time the incident should not be considered.
  /// The value is `null` if it hasn't been provided by the traffic incidents supplier.
  DateTime? get endTime;

}


// TrafficIncidentBase "private" section, not exported.

final _sdkTrafficTrafficincidentbaseRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_traffic_TrafficIncidentBase_register_finalizer'));
final _sdkTrafficTrafficincidentbaseCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentBase_copy_handle'));
final _sdkTrafficTrafficincidentbaseReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentBase_release_handle'));
final _sdkTrafficTrafficincidentbaseCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_traffic_TrafficIncidentBase_create_proxy'));
final _sdkTrafficTrafficincidentbaseGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentBase_get_type_id'));

class TrafficIncidentBase$Lambdas implements TrafficIncidentBase {
  TrafficIncidentImpact Function() impactGetLambda;
  TrafficIncidentType Function() typeGetLambda;
  LocalizedText Function() descriptionGetLambda;
  DateTime? Function() startTimeGetLambda;
  DateTime? Function() endTimeGetLambda;

  TrafficIncidentBase$Lambdas(
    this.impactGetLambda,
    this.typeGetLambda,
    this.descriptionGetLambda,
    this.startTimeGetLambda,
    this.endTimeGetLambda
  );

  @override
  TrafficIncidentImpact get impact => impactGetLambda();
  @override
  TrafficIncidentType get type => typeGetLambda();
  @override
  LocalizedText get description => descriptionGetLambda();
  @override
  DateTime? get startTime => startTimeGetLambda();
  @override
  DateTime? get endTime => endTimeGetLambda();
}

class TrafficIncidentBase$Impl extends __lib.NativeBase implements TrafficIncidentBase {

  TrafficIncidentBase$Impl(Pointer<Void> handle) : super(handle);

  /// Gets the impact of the incident.
  /// The value is [TrafficIncidentImpact.unknown] if it hasn't been provided by the traffic incidents supplier.
  TrafficIncidentImpact get impact {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncidentBase_impact_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficTrafficincidentimpactFromFfi(__resultHandle);
    } finally {
      sdkTrafficTrafficincidentimpactReleaseFfiHandle(__resultHandle);

    }

  }


  /// Gets the category of the incident.
  /// The value is [TrafficIncidentType.unknown] if it hasn't been provided by the traffic incidents supplier.
  TrafficIncidentType get type {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncidentBase_type_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficTrafficincidenttypeFromFfi(__resultHandle);
    } finally {
      sdkTrafficTrafficincidenttypeReleaseFfiHandle(__resultHandle);

    }

  }


  /// Gets the human readable description of the incident, possibly with location information.
  ///
  /// **Note:** The description is currently not present in our map data. Therefore, when
  /// accessing the data from a picked carto POI via `TrafficIncidentResult`, then
  /// always an empty string is returned. This does not apply when using the `TrafficEngine`.
  LocalizedText get description {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncidentBase_description_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLocalizedtextFromFfi(__resultHandle);
    } finally {
      sdkCoreLocalizedtextReleaseFfiHandle(__resultHandle);

    }

  }


  /// Gets the time from which the incident is valid, before this time the incident should not be considered.
  /// The value is `null` if it hasn't been provided by the traffic incidents supplier.
  DateTime? get startTime {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncidentBase_startTime_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return dateFromFfiNullable(__resultHandle);
    } finally {
      dateReleaseFfiHandleNullable(__resultHandle);

    }

  }


  /// Get the time until which the incident is valid, after this time the incident should not be considered.
  /// The value is `null` if it hasn't been provided by the traffic incidents supplier.
  DateTime? get endTime {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncidentBase_endTime_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return dateFromFfiNullable(__resultHandle);
    } finally {
      dateReleaseFfiHandleNullable(__resultHandle);

    }

  }



}


int _sdkTrafficTrafficincidentbaseimpactGetStatic(Object _obj, Pointer<Uint32> _result) {
  _result.value = sdkTrafficTrafficincidentimpactToFfi((_obj as TrafficIncidentBase).impact);
  return 0;
}
int _sdkTrafficTrafficincidentbasetypeGetStatic(Object _obj, Pointer<Uint32> _result) {
  _result.value = sdkTrafficTrafficincidenttypeToFfi((_obj as TrafficIncidentBase).type);
  return 0;
}
int _sdkTrafficTrafficincidentbasedescriptionGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkCoreLocalizedtextToFfi((_obj as TrafficIncidentBase).description);
  return 0;
}
int _sdkTrafficTrafficincidentbasestartTimeGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = dateToFfiNullable((_obj as TrafficIncidentBase).startTime);
  return 0;
}
int _sdkTrafficTrafficincidentbaseendTimeGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = dateToFfiNullable((_obj as TrafficIncidentBase).endTime);
  return 0;
}

Pointer<Void> sdkTrafficTrafficincidentbaseToFfi(TrafficIncidentBase value) {
  if (value is __lib.NativeBase) return _sdkTrafficTrafficincidentbaseCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkTrafficTrafficincidentbaseCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint32>)>(_sdkTrafficTrafficincidentbaseimpactGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint32>)>(_sdkTrafficTrafficincidentbasetypeGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkTrafficTrafficincidentbasedescriptionGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkTrafficTrafficincidentbasestartTimeGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkTrafficTrafficincidentbaseendTimeGetStatic, __lib.unknownError)
  );

  return result;
}

TrafficIncidentBase sdkTrafficTrafficincidentbaseFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TrafficIncidentBase) return instance;

  final _typeIdHandle = _sdkTrafficTrafficincidentbaseGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkTrafficTrafficincidentbaseCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TrafficIncidentBase$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkTrafficTrafficincidentbaseRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkTrafficTrafficincidentbaseReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkTrafficTrafficincidentbaseReleaseHandle(handle);

Pointer<Void> sdkTrafficTrafficincidentbaseToFfiNullable(TrafficIncidentBase? value) =>
  value != null ? sdkTrafficTrafficincidentbaseToFfi(value) : Pointer<Void>.fromAddress(0);

TrafficIncidentBase? sdkTrafficTrafficincidentbaseFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkTrafficTrafficincidentbaseFromFfi(handle) : null;

void sdkTrafficTrafficincidentbaseReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficincidentbaseReleaseHandle(handle);

// End of TrafficIncidentBase "private" section.


