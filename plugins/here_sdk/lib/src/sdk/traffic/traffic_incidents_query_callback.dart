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
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_query_error.dart';

/// Callback passed to [TrafficEngine.queryForIncidentsInCorridor].
///
/// The method will be called on the main thread when a search call has been completed.
/// The first argument is the error in the case of the failure. It is `null` for an operation that succeeds.
/// The second argument is the list of incidents in the case of the success. It is `null` in case of an error.
///
/// [p0] The error in the case of the failure. It is `null` for an operation that succeeds.
///
/// [p1] The list of incidents in the case of the success. It is `null` in case of an error.
typedef TrafficIncidentsQueryCallback = void Function(TrafficQueryError?, List<TrafficIncident>?);

// TrafficIncidentsQueryCallback "private" section, not exported.

final _sdkTrafficTrafficincidentsquerycallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryCallback_register_finalizer'));
final _sdkTrafficTrafficincidentsquerycallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryCallback_copy_handle'));
final _sdkTrafficTrafficincidentsquerycallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryCallback_release_handle'));
final _sdkTrafficTrafficincidentsquerycallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryCallback_create_proxy'));

class TrafficIncidentsQueryCallback$Impl {
  final Pointer<Void> handle;
  TrafficIncidentsQueryCallback$Impl(this.handle);

  void call(TrafficQueryError? p0, List<TrafficIncident>? p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_traffic_TrafficIncidentsQueryCallback_call__TrafficQueryError__ListOf_sdk_traffic_TrafficIncident_'));
    final _p0Handle = sdkTrafficTrafficqueryerrorToFfiNullable(p0);
    final _p1Handle = heresdkTrafficBindingslistofSdkTrafficTrafficincidentToFfiNullable(p1);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    sdkTrafficTrafficqueryerrorReleaseFfiHandleNullable(_p0Handle);
    heresdkTrafficBindingslistofSdkTrafficTrafficincidentReleaseFfiHandleNullable(_p1Handle);

  }

}

int _sdkTrafficTrafficincidentsquerycallbackcallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (_obj as TrafficIncidentsQueryCallback)(sdkTrafficTrafficqueryerrorFromFfiNullable(p0), heresdkTrafficBindingslistofSdkTrafficTrafficincidentFromFfiNullable(p1));
  } finally {
    sdkTrafficTrafficqueryerrorReleaseFfiHandleNullable(p0);
    heresdkTrafficBindingslistofSdkTrafficTrafficincidentReleaseFfiHandleNullable(p1);
  }
  return 0;
}

Pointer<Void> sdkTrafficTrafficincidentsquerycallbackToFfi(TrafficIncidentsQueryCallback value) =>
  _sdkTrafficTrafficincidentsquerycallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkTrafficTrafficincidentsquerycallbackcallStatic, __lib.unknownError)
  );

TrafficIncidentsQueryCallback sdkTrafficTrafficincidentsquerycallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkTrafficTrafficincidentsquerycallbackCopyHandle(handle);
  final _impl = TrafficIncidentsQueryCallback$Impl(_copiedHandle);
  final result = (TrafficQueryError? p0, List<TrafficIncident>? p1) => _impl.call(p0, p1);
  _sdkTrafficTrafficincidentsquerycallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkTrafficTrafficincidentsquerycallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkTrafficTrafficincidentsquerycallbackReleaseHandle(handle);

// Nullable TrafficIncidentsQueryCallback

final _sdkTrafficTrafficincidentsquerycallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryCallback_create_handle_nullable'));
final _sdkTrafficTrafficincidentsquerycallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryCallback_release_handle_nullable'));
final _sdkTrafficTrafficincidentsquerycallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryCallback_get_value_nullable'));

Pointer<Void> sdkTrafficTrafficincidentsquerycallbackToFfiNullable(TrafficIncidentsQueryCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficTrafficincidentsquerycallbackToFfi(value);
  final result = _sdkTrafficTrafficincidentsquerycallbackCreateHandleNullable(_handle);
  sdkTrafficTrafficincidentsquerycallbackReleaseFfiHandle(_handle);
  return result;
}

TrafficIncidentsQueryCallback? sdkTrafficTrafficincidentsquerycallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficTrafficincidentsquerycallbackGetValueNullable(handle);
  final result = sdkTrafficTrafficincidentsquerycallbackFromFfi(_handle);
  sdkTrafficTrafficincidentsquerycallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficTrafficincidentsquerycallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficincidentsquerycallbackReleaseHandleNullable(handle);

// End of TrafficIncidentsQueryCallback "private" section.


