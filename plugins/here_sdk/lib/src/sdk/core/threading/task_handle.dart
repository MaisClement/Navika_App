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

/// Handle used for the manipulation of the task.
abstract class TaskHandle {
  /// Handle used for the manipulation of the task.

  factory TaskHandle(
    bool Function() cancelLambda,
    bool Function() isFinishedGetLambda,
    bool Function() isCancelledGetLambda
  ) => TaskHandle$Lambdas(
    cancelLambda,
    isFinishedGetLambda,
    isCancelledGetLambda
  );

  /// Sets internal state of task to 'canceled'.
  ///
  /// If the task is still in the queue, it will be
  /// removed from it immediately. However, if the task is in a running state, it will nevertheless be completed, as there is no way
  /// to interrupt it.
  ///
  /// Returns [bool]. True, if the task was canceled.
  ///
  /// False, if the task can't be canceled due to a
  /// platform dependent reason.
  ///
  bool cancel();
  /// True, if this task is completed. Completion may be due to normal termination,
  /// an exception, or cancellation - in all of these cases, result will return true.
  bool get isFinished;

  /// True, if this task was canceled before it completed normally.
  bool get isCancelled;

}


// TaskHandle "private" section, not exported.

final _sdkCoreThreadingTaskhandleRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_threading_TaskHandle_register_finalizer'));
final _sdkCoreThreadingTaskhandleCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_threading_TaskHandle_copy_handle'));
final _sdkCoreThreadingTaskhandleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_threading_TaskHandle_release_handle'));
final _sdkCoreThreadingTaskhandleCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_core_threading_TaskHandle_create_proxy'));
final _sdkCoreThreadingTaskhandleGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_threading_TaskHandle_get_type_id'));


class TaskHandle$Lambdas implements TaskHandle {
  bool Function() cancelLambda;
  bool Function() isFinishedGetLambda;
  bool Function() isCancelledGetLambda;

  TaskHandle$Lambdas(
    this.cancelLambda,
    this.isFinishedGetLambda,
    this.isCancelledGetLambda
  );

  @override
  bool cancel() =>
    cancelLambda();
  @override
  bool get isFinished => isFinishedGetLambda();
  @override
  bool get isCancelled => isCancelledGetLambda();
}

class TaskHandle$Impl extends __lib.NativeBase implements TaskHandle {

  TaskHandle$Impl(Pointer<Void> handle) : super(handle);

  @override
  bool cancel() {
    final _cancelFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_core_threading_TaskHandle_cancel'));
    final _handle = this.handle;
    final __resultHandle = _cancelFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  /// True, if this task is completed. Completion may be due to normal termination,
  /// an exception, or cancellation - in all of these cases, result will return true.
  bool get isFinished {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_core_threading_TaskHandle_isFinished_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }


  /// True, if this task was canceled before it completed normally.
  bool get isCancelled {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_core_threading_TaskHandle_isCancelled_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }



}

int _sdkCoreThreadingTaskhandlecancelStatic(Object _obj, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as TaskHandle).cancel();
    _result.value = booleanToFfi(_resultObject);
  } finally {
  }
  return 0;
}

int _sdkCoreThreadingTaskhandleisFinishedGetStatic(Object _obj, Pointer<Uint8> _result) {
  _result.value = booleanToFfi((_obj as TaskHandle).isFinished);
  return 0;
}
int _sdkCoreThreadingTaskhandleisCancelledGetStatic(Object _obj, Pointer<Uint8> _result) {
  _result.value = booleanToFfi((_obj as TaskHandle).isCancelled);
  return 0;
}

Pointer<Void> sdkCoreThreadingTaskhandleToFfi(TaskHandle value) {
  if (value is __lib.NativeBase) return _sdkCoreThreadingTaskhandleCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkCoreThreadingTaskhandleCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint8>)>(_sdkCoreThreadingTaskhandlecancelStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint8>)>(_sdkCoreThreadingTaskhandleisFinishedGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint8>)>(_sdkCoreThreadingTaskhandleisCancelledGetStatic, __lib.unknownError)
  );

  return result;
}

TaskHandle sdkCoreThreadingTaskhandleFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TaskHandle) return instance;

  final _typeIdHandle = _sdkCoreThreadingTaskhandleGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkCoreThreadingTaskhandleCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TaskHandle$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkCoreThreadingTaskhandleRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreThreadingTaskhandleReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreThreadingTaskhandleReleaseHandle(handle);

Pointer<Void> sdkCoreThreadingTaskhandleToFfiNullable(TaskHandle? value) =>
  value != null ? sdkCoreThreadingTaskhandleToFfi(value) : Pointer<Void>.fromAddress(0);

TaskHandle? sdkCoreThreadingTaskhandleFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreThreadingTaskhandleFromFfi(handle) : null;

void sdkCoreThreadingTaskhandleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreThreadingTaskhandleReleaseHandle(handle);

// End of TaskHandle "private" section.


