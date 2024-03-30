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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/log_level.dart';
import 'package:meta/meta.dart';

/// This class provides functionality to enable/disable console logs as well as
/// setting a custom log appender to receive log messages from the SDK.
abstract class LogControl {

  /// Enables SDK logging messages to console .
  ///
  /// Enabled by default with [LogLevel.logLevelInfo].
  ///
  /// [level] Log level.
  ///
  static void enableLoggingToConsole(LogLevel level) => $prototype.enableLoggingToConsole(level);
  /// Disables SDK logging messages to console.
  ///
  /// Enabled by default with [LogLevel.logLevelInfo].
  ///
  static void disableLoggingToConsole() => $prototype.disableLoggingToConsole();
  /// Sets a custom log appender that will write SDK log messages to a file.
  ///
  /// This overwrites a previous custom log appender set by user.
  /// Note, that setting the custom appender does not disable logging to the console made by SDK,
  /// in order to do that use [LogControl.disableLoggingToConsole] API.
  ///
  /// [level] Log level.
  ///
  /// [path] Absolute path to a file that the application has read/write permissions.
  ///
  /// Throws [LogControlInvalidPathExceptionException]. [LogControlInvalidPathExceptionException] Indicates that the file path is invalid or not writeable.
  ///
  static void setAppender(LogLevel level, String path) => $prototype.setAppender(level, path);
  /// Removes previously added custom log appender.
  ///
  static void removeAppender() => $prototype.removeAppender();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = LogControl$Impl(Pointer<Void>.fromAddress(0));
}

/// Invalid file path exception.
class LogControlInvalidPathExceptionException implements Exception {
  final String error;
  LogControlInvalidPathExceptionException(this.error);
}

// LogControl "private" section, not exported.

final _sdkCoreEngineLogcontrolRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_engine_LogControl_register_finalizer'));
final _sdkCoreEngineLogcontrolCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogControl_copy_handle'));
final _sdkCoreEngineLogcontrolReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogControl_release_handle'));




final _setAppendersdkCoreEngineLogcontrolSetappenderLoglevelStringReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogControl_setAppender__LogLevel_String_return_release_handle'));
final _setAppendersdkCoreEngineLogcontrolSetappenderLoglevelStringReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogControl_setAppender__LogLevel_String_return_get_error'));
final _setAppendersdkCoreEngineLogcontrolSetappenderLoglevelStringReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogControl_setAppender__LogLevel_String_return_has_error'));



/// @nodoc
@visibleForTesting
class LogControl$Impl extends __lib.NativeBase implements LogControl {

  LogControl$Impl(Pointer<Void> handle) : super(handle);

  void enableLoggingToConsole(LogLevel level) {
    final _enableLoggingToConsoleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Uint32), void Function(int, int)>('here_sdk_sdk_core_engine_LogControl_enableLoggingToConsole__LogLevel'));
    final _levelHandle = sdkCoreEngineLoglevelToFfi(level);
    _enableLoggingToConsoleFfi(__lib.LibraryContext.isolateId, _levelHandle);
    sdkCoreEngineLoglevelReleaseFfiHandle(_levelHandle);

  }

  void disableLoggingToConsole() {
    final _disableLoggingToConsoleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('here_sdk_sdk_core_engine_LogControl_disableLoggingToConsole'));
    _disableLoggingToConsoleFfi(__lib.LibraryContext.isolateId);

  }

  void setAppender(LogLevel level, String path) {
    final _setAppenderFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Pointer<Void>), Pointer<Void> Function(int, int, Pointer<Void>)>('here_sdk_sdk_core_engine_LogControl_setAppender__LogLevel_String'));
    final _levelHandle = sdkCoreEngineLoglevelToFfi(level);
    final _pathHandle = stringToFfi(path);
    final __callResultHandle = _setAppenderFfi(__lib.LibraryContext.isolateId, _levelHandle, _pathHandle);
    sdkCoreEngineLoglevelReleaseFfiHandle(_levelHandle);
    stringReleaseFfiHandle(_pathHandle);
    if (_setAppendersdkCoreEngineLogcontrolSetappenderLoglevelStringReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _setAppendersdkCoreEngineLogcontrolSetappenderLoglevelStringReturnGetError(__callResultHandle);
        _setAppendersdkCoreEngineLogcontrolSetappenderLoglevelStringReturnReleaseHandle(__callResultHandle);
        try {
          throw LogControlInvalidPathExceptionException(stringFromFfi(__errorHandle));
        } finally {
          stringReleaseFfiHandle(__errorHandle);
        }
    }
    _setAppendersdkCoreEngineLogcontrolSetappenderLoglevelStringReturnReleaseHandle(__callResultHandle);

  }

  void removeAppender() {
    final _removeAppenderFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('here_sdk_sdk_core_engine_LogControl_removeAppender'));
    _removeAppenderFfi(__lib.LibraryContext.isolateId);

  }


}

Pointer<Void> sdkCoreEngineLogcontrolToFfi(LogControl value) =>
  _sdkCoreEngineLogcontrolCopyHandle((value as __lib.NativeBase).handle);

LogControl sdkCoreEngineLogcontrolFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LogControl) return instance;

  final _copiedHandle = _sdkCoreEngineLogcontrolCopyHandle(handle);
  final result = LogControl$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkCoreEngineLogcontrolRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreEngineLogcontrolReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreEngineLogcontrolReleaseHandle(handle);

Pointer<Void> sdkCoreEngineLogcontrolToFfiNullable(LogControl? value) =>
  value != null ? sdkCoreEngineLogcontrolToFfi(value) : Pointer<Void>.fromAddress(0);

LogControl? sdkCoreEngineLogcontrolFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreEngineLogcontrolFromFfi(handle) : null;

void sdkCoreEngineLogcontrolReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineLogcontrolReleaseHandle(handle);

// End of LogControl "private" section.


