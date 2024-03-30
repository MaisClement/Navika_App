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

/// This enum represents that a task has been completed.
///
/// Refer to [OnTaskCompleted] for more details.
enum TaskOutcome {
    /// The task has been successfully completed.
    completed,
    /// The task has been cancelled. For example, when an ongoing task has been cancelled by the user.
    cancelled
}

// TaskOutcome "private" section, not exported.

int sdkCoreThreadingTaskoutcomeToFfi(TaskOutcome value) {
  switch (value) {
  case TaskOutcome.completed:
    return 0;
  case TaskOutcome.cancelled:
    return 1;
  default:
    throw StateError("Invalid enum value $value for TaskOutcome enum.");
  }
}

TaskOutcome sdkCoreThreadingTaskoutcomeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TaskOutcome.completed;
  case 1:
    return TaskOutcome.cancelled;
  default:
    throw StateError("Invalid numeric value $handle for TaskOutcome enum.");
  }
}

void sdkCoreThreadingTaskoutcomeReleaseFfiHandle(int handle) {}

final _sdkCoreThreadingTaskoutcomeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_threading_TaskOutcome_create_handle_nullable'));
final _sdkCoreThreadingTaskoutcomeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_threading_TaskOutcome_release_handle_nullable'));
final _sdkCoreThreadingTaskoutcomeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_threading_TaskOutcome_get_value_nullable'));

Pointer<Void> sdkCoreThreadingTaskoutcomeToFfiNullable(TaskOutcome? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreThreadingTaskoutcomeToFfi(value);
  final result = _sdkCoreThreadingTaskoutcomeCreateHandleNullable(_handle);
  sdkCoreThreadingTaskoutcomeReleaseFfiHandle(_handle);
  return result;
}

TaskOutcome? sdkCoreThreadingTaskoutcomeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreThreadingTaskoutcomeGetValueNullable(handle);
  final result = sdkCoreThreadingTaskoutcomeFromFfi(_handle);
  sdkCoreThreadingTaskoutcomeReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreThreadingTaskoutcomeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreThreadingTaskoutcomeReleaseHandleNullable(handle);

// End of TaskOutcome "private" section.


