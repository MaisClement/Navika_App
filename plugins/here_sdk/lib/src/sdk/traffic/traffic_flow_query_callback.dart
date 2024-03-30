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
import 'package:here_sdk/src/sdk/traffic/traffic_flow.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_query_error.dart';

/// Callback passed to following functions:
/// [TrafficEngine.queryForFlowInBox]
/// [TrafficEngine.queryForFlowInCircle]
/// [TrafficEngine.queryForFlowInCorridor]
/// The method will be called on the main thread when a search call has been completed.
///
/// The first argument is the error in the case of the failure. It is `null` for an operation that succeeds.
/// The second argument is the list of flow items in the case of the success. It is `null` in case of an error.
///
/// [p0] The error in the case of the failure. It is `null` for an operation that succeeds.
///
/// [p1] The list of incidents in the case of the success. It is `null` in case of an error.
///
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
typedef TrafficFlowQueryCallback = void Function(TrafficQueryError?, List<TrafficFlow>?);

// TrafficFlowQueryCallback "private" section, not exported.

final _sdkTrafficTrafficflowquerycallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_traffic_TrafficFlowQueryCallback_register_finalizer'));
final _sdkTrafficTrafficflowquerycallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlowQueryCallback_copy_handle'));
final _sdkTrafficTrafficflowquerycallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlowQueryCallback_release_handle'));
final _sdkTrafficTrafficflowquerycallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_traffic_TrafficFlowQueryCallback_create_proxy'));

class TrafficFlowQueryCallback$Impl {
  final Pointer<Void> handle;
  TrafficFlowQueryCallback$Impl(this.handle);

  void call(TrafficQueryError? p0, List<TrafficFlow>? p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_traffic_TrafficFlowQueryCallback_call__TrafficQueryError__ListOf_sdk_traffic_TrafficFlow_'));
    final _p0Handle = sdkTrafficTrafficqueryerrorToFfiNullable(p0);
    final _p1Handle = heresdkTrafficBindingslistofSdkTrafficTrafficflowToFfiNullable(p1);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    sdkTrafficTrafficqueryerrorReleaseFfiHandleNullable(_p0Handle);
    heresdkTrafficBindingslistofSdkTrafficTrafficflowReleaseFfiHandleNullable(_p1Handle);

  }

}

int _sdkTrafficTrafficflowquerycallbackcallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (_obj as TrafficFlowQueryCallback)(sdkTrafficTrafficqueryerrorFromFfiNullable(p0), heresdkTrafficBindingslistofSdkTrafficTrafficflowFromFfiNullable(p1));
  } finally {
    sdkTrafficTrafficqueryerrorReleaseFfiHandleNullable(p0);
    heresdkTrafficBindingslistofSdkTrafficTrafficflowReleaseFfiHandleNullable(p1);
  }
  return 0;
}

Pointer<Void> sdkTrafficTrafficflowquerycallbackToFfi(TrafficFlowQueryCallback value) =>
  _sdkTrafficTrafficflowquerycallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkTrafficTrafficflowquerycallbackcallStatic, __lib.unknownError)
  );

TrafficFlowQueryCallback sdkTrafficTrafficflowquerycallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkTrafficTrafficflowquerycallbackCopyHandle(handle);
  final _impl = TrafficFlowQueryCallback$Impl(_copiedHandle);
  final result = (TrafficQueryError? p0, List<TrafficFlow>? p1) => _impl.call(p0, p1);
  _sdkTrafficTrafficflowquerycallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkTrafficTrafficflowquerycallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkTrafficTrafficflowquerycallbackReleaseHandle(handle);

// Nullable TrafficFlowQueryCallback

final _sdkTrafficTrafficflowquerycallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlowQueryCallback_create_handle_nullable'));
final _sdkTrafficTrafficflowquerycallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlowQueryCallback_release_handle_nullable'));
final _sdkTrafficTrafficflowquerycallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlowQueryCallback_get_value_nullable'));

Pointer<Void> sdkTrafficTrafficflowquerycallbackToFfiNullable(TrafficFlowQueryCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficTrafficflowquerycallbackToFfi(value);
  final result = _sdkTrafficTrafficflowquerycallbackCreateHandleNullable(_handle);
  sdkTrafficTrafficflowquerycallbackReleaseFfiHandle(_handle);
  return result;
}

TrafficFlowQueryCallback? sdkTrafficTrafficflowquerycallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficTrafficflowquerycallbackGetValueNullable(handle);
  final result = sdkTrafficTrafficflowquerycallbackFromFfi(_handle);
  sdkTrafficTrafficflowquerycallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficTrafficflowquerycallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficflowquerycallbackReleaseHandleNullable(handle);

// End of TrafficFlowQueryCallback "private" section.


