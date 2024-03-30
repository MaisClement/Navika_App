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
import 'package:here_sdk/src/sdk/traffic/traffic_incident.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_query_error.dart';

/// Callback passed to [TrafficEngine.lookupIncident].
///
/// The method will be called on the main thread when a search call has been completed.
/// The first argument is the error in the case of the failure. It is `null` for an operation that succeeds.
/// The second argument is the incident in the case of the success. It is `null` in case of an error.
///
/// [p0] The error in the case of the failure. It is `null` for an operation that succeeds.
///
/// [p1] The incident in the case of the success. It is `null` in case of an error.
typedef TrafficIncidentLookupCallback = void Function(TrafficQueryError?, TrafficIncident?);

// TrafficIncidentLookupCallback "private" section, not exported.

final _sdkTrafficTrafficincidentlookupcallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_traffic_TrafficIncidentLookupCallback_register_finalizer'));
final _sdkTrafficTrafficincidentlookupcallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentLookupCallback_copy_handle'));
final _sdkTrafficTrafficincidentlookupcallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentLookupCallback_release_handle'));
final _sdkTrafficTrafficincidentlookupcallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_traffic_TrafficIncidentLookupCallback_create_proxy'));

class TrafficIncidentLookupCallback$Impl {
  final Pointer<Void> handle;
  TrafficIncidentLookupCallback$Impl(this.handle);

  void call(TrafficQueryError? p0, TrafficIncident? p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_traffic_TrafficIncidentLookupCallback_call__TrafficQueryError__TrafficIncident_'));
    final _p0Handle = sdkTrafficTrafficqueryerrorToFfiNullable(p0);
    final _p1Handle = sdkTrafficTrafficincidentToFfiNullable(p1);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    sdkTrafficTrafficqueryerrorReleaseFfiHandleNullable(_p0Handle);
    sdkTrafficTrafficincidentReleaseFfiHandleNullable(_p1Handle);

  }

}

int _sdkTrafficTrafficincidentlookupcallbackcallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (_obj as TrafficIncidentLookupCallback)(sdkTrafficTrafficqueryerrorFromFfiNullable(p0), sdkTrafficTrafficincidentFromFfiNullable(p1));
  } finally {
    sdkTrafficTrafficqueryerrorReleaseFfiHandleNullable(p0);
    sdkTrafficTrafficincidentReleaseFfiHandleNullable(p1);
  }
  return 0;
}

Pointer<Void> sdkTrafficTrafficincidentlookupcallbackToFfi(TrafficIncidentLookupCallback value) =>
  _sdkTrafficTrafficincidentlookupcallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkTrafficTrafficincidentlookupcallbackcallStatic, __lib.unknownError)
  );

TrafficIncidentLookupCallback sdkTrafficTrafficincidentlookupcallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkTrafficTrafficincidentlookupcallbackCopyHandle(handle);
  final _impl = TrafficIncidentLookupCallback$Impl(_copiedHandle);
  final result = (TrafficQueryError? p0, TrafficIncident? p1) => _impl.call(p0, p1);
  _sdkTrafficTrafficincidentlookupcallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkTrafficTrafficincidentlookupcallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkTrafficTrafficincidentlookupcallbackReleaseHandle(handle);

// Nullable TrafficIncidentLookupCallback

final _sdkTrafficTrafficincidentlookupcallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentLookupCallback_create_handle_nullable'));
final _sdkTrafficTrafficincidentlookupcallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentLookupCallback_release_handle_nullable'));
final _sdkTrafficTrafficincidentlookupcallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentLookupCallback_get_value_nullable'));

Pointer<Void> sdkTrafficTrafficincidentlookupcallbackToFfiNullable(TrafficIncidentLookupCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficTrafficincidentlookupcallbackToFfi(value);
  final result = _sdkTrafficTrafficincidentlookupcallbackCreateHandleNullable(_handle);
  sdkTrafficTrafficincidentlookupcallbackReleaseFfiHandle(_handle);
  return result;
}

TrafficIncidentLookupCallback? sdkTrafficTrafficincidentlookupcallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficTrafficincidentlookupcallbackGetValueNullable(handle);
  final result = sdkTrafficTrafficincidentlookupcallbackFromFfi(_handle);
  sdkTrafficTrafficincidentlookupcallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficTrafficincidentlookupcallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficincidentlookupcallbackReleaseHandleNullable(handle);

// End of TrafficIncidentLookupCallback "private" section.


