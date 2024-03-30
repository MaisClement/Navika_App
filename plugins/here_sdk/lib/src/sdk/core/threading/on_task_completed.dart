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
import 'package:here_sdk/src/sdk/core/threading/task_outcome.dart';

/// The method will be called on the main thread when a task call has been completed.
///
/// [p0] The task outcome
typedef OnTaskCompleted = void Function(TaskOutcome);

// OnTaskCompleted "private" section, not exported.

final _sdkCoreThreadingOntaskcompletedRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_threading_OnTaskCompleted_register_finalizer'));
final _sdkCoreThreadingOntaskcompletedCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_threading_OnTaskCompleted_copy_handle'));
final _sdkCoreThreadingOntaskcompletedReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_threading_OnTaskCompleted_release_handle'));
final _sdkCoreThreadingOntaskcompletedCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_core_threading_OnTaskCompleted_create_proxy'));

class OnTaskCompleted$Impl {
  final Pointer<Void> handle;
  OnTaskCompleted$Impl(this.handle);

  void call(TaskOutcome p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_core_threading_OnTaskCompleted_call__TaskOutcome'));
    final _p0Handle = sdkCoreThreadingTaskoutcomeToFfi(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    sdkCoreThreadingTaskoutcomeReleaseFfiHandle(_p0Handle);

  }

}

int _sdkCoreThreadingOntaskcompletedcallStatic(Object _obj, int p0) {
  
  try {
    (_obj as OnTaskCompleted)(sdkCoreThreadingTaskoutcomeFromFfi(p0));
  } finally {
    sdkCoreThreadingTaskoutcomeReleaseFfiHandle(p0);
  }
  return 0;
}

Pointer<Void> sdkCoreThreadingOntaskcompletedToFfi(OnTaskCompleted value) =>
  _sdkCoreThreadingOntaskcompletedCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Uint32)>(_sdkCoreThreadingOntaskcompletedcallStatic, __lib.unknownError)
  );

OnTaskCompleted sdkCoreThreadingOntaskcompletedFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkCoreThreadingOntaskcompletedCopyHandle(handle);
  final _impl = OnTaskCompleted$Impl(_copiedHandle);
  final result = (TaskOutcome p0) => _impl.call(p0);
  _sdkCoreThreadingOntaskcompletedRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreThreadingOntaskcompletedReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreThreadingOntaskcompletedReleaseHandle(handle);

// Nullable OnTaskCompleted

final _sdkCoreThreadingOntaskcompletedCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_threading_OnTaskCompleted_create_handle_nullable'));
final _sdkCoreThreadingOntaskcompletedReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_threading_OnTaskCompleted_release_handle_nullable'));
final _sdkCoreThreadingOntaskcompletedGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_threading_OnTaskCompleted_get_value_nullable'));

Pointer<Void> sdkCoreThreadingOntaskcompletedToFfiNullable(OnTaskCompleted? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreThreadingOntaskcompletedToFfi(value);
  final result = _sdkCoreThreadingOntaskcompletedCreateHandleNullable(_handle);
  sdkCoreThreadingOntaskcompletedReleaseFfiHandle(_handle);
  return result;
}

OnTaskCompleted? sdkCoreThreadingOntaskcompletedFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreThreadingOntaskcompletedGetValueNullable(handle);
  final result = sdkCoreThreadingOntaskcompletedFromFfi(_handle);
  sdkCoreThreadingOntaskcompletedReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreThreadingOntaskcompletedReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreThreadingOntaskcompletedReleaseHandleNullable(handle);

// End of OnTaskCompleted "private" section.


