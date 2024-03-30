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

/// Severity levels for log messages.
enum LogLevel {
    /// The severity value for informational messages.
    logLevelInfo,
    /// The severity value for warning messages.
    logLevelWarning,
    /// The severity value for error messages.
    logLevelError,
    /// The severity value for fatal messages.
    logLevelFatal,
    /// A special value to turn off logging.
    logLevelOff
}

// LogLevel "private" section, not exported.

int sdkCoreEngineLoglevelToFfi(LogLevel value) {
  switch (value) {
  case LogLevel.logLevelInfo:
    return 0;
  case LogLevel.logLevelWarning:
    return 1;
  case LogLevel.logLevelError:
    return 2;
  case LogLevel.logLevelFatal:
    return 3;
  case LogLevel.logLevelOff:
    return 4;
  default:
    throw StateError("Invalid enum value $value for LogLevel enum.");
  }
}

LogLevel sdkCoreEngineLoglevelFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LogLevel.logLevelInfo;
  case 1:
    return LogLevel.logLevelWarning;
  case 2:
    return LogLevel.logLevelError;
  case 3:
    return LogLevel.logLevelFatal;
  case 4:
    return LogLevel.logLevelOff;
  default:
    throw StateError("Invalid numeric value $handle for LogLevel enum.");
  }
}

void sdkCoreEngineLoglevelReleaseFfiHandle(int handle) {}

final _sdkCoreEngineLoglevelCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_engine_LogLevel_create_handle_nullable'));
final _sdkCoreEngineLoglevelReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogLevel_release_handle_nullable'));
final _sdkCoreEngineLoglevelGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogLevel_get_value_nullable'));

Pointer<Void> sdkCoreEngineLoglevelToFfiNullable(LogLevel? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineLoglevelToFfi(value);
  final result = _sdkCoreEngineLoglevelCreateHandleNullable(_handle);
  sdkCoreEngineLoglevelReleaseFfiHandle(_handle);
  return result;
}

LogLevel? sdkCoreEngineLoglevelFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineLoglevelGetValueNullable(handle);
  final result = sdkCoreEngineLoglevelFromFfi(_handle);
  sdkCoreEngineLoglevelReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineLoglevelReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineLoglevelReleaseHandleNullable(handle);

// End of LogLevel "private" section.


