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
import 'package:here_sdk/src/sdk/core/engine/log_level.dart';

/// An interface to implement a listener to receive log messages.
abstract class LogAppender {
  /// An interface to implement a listener to receive log messages.

  factory LogAppender(
    void Function(LogLevel, String) logLambda,

  ) => LogAppender$Lambdas(
    logLambda,

  );


  /// [level] The severity of the log message.
  ///
  /// [message] The log message.
  ///
  void log(LogLevel level, String message);
}


// LogAppender "private" section, not exported.

final _sdkCoreEngineLogappenderRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_engine_LogAppender_register_finalizer'));
final _sdkCoreEngineLogappenderCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogAppender_copy_handle'));
final _sdkCoreEngineLogappenderReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogAppender_release_handle'));
final _sdkCoreEngineLogappenderCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_core_engine_LogAppender_create_proxy'));
final _sdkCoreEngineLogappenderGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LogAppender_get_type_id'));


class LogAppender$Lambdas implements LogAppender {
  void Function(LogLevel, String) logLambda;

  LogAppender$Lambdas(
    this.logLambda,

  );

  @override
  void log(LogLevel level, String message) =>
    logLambda(level, message);
}

class LogAppender$Impl extends __lib.NativeBase implements LogAppender {

  LogAppender$Impl(Pointer<Void> handle) : super(handle);

  @override
  void log(LogLevel level, String message) {
    final _logFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Pointer<Void>), void Function(Pointer<Void>, int, int, Pointer<Void>)>('here_sdk_sdk_core_engine_LogAppender_log__LogLevel_String'));
    final _levelHandle = sdkCoreEngineLoglevelToFfi(level);
    final _messageHandle = stringToFfi(message);
    final _handle = this.handle;
    _logFfi(_handle, __lib.LibraryContext.isolateId, _levelHandle, _messageHandle);
    sdkCoreEngineLoglevelReleaseFfiHandle(_levelHandle);
    stringReleaseFfiHandle(_messageHandle);

  }


}

int _sdkCoreEngineLogappenderlogStatic(Object _obj, int level, Pointer<Void> message) {

  try {
    (_obj as LogAppender).log(sdkCoreEngineLoglevelFromFfi(level), stringFromFfi(message));
  } finally {
    sdkCoreEngineLoglevelReleaseFfiHandle(level);
    stringReleaseFfiHandle(message);
  }
  return 0;
}


Pointer<Void> sdkCoreEngineLogappenderToFfi(LogAppender value) {
  if (value is __lib.NativeBase) return _sdkCoreEngineLogappenderCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkCoreEngineLogappenderCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Uint32, Pointer<Void>)>(_sdkCoreEngineLogappenderlogStatic, __lib.unknownError)
  );

  return result;
}

LogAppender sdkCoreEngineLogappenderFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LogAppender) return instance;

  final _typeIdHandle = _sdkCoreEngineLogappenderGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkCoreEngineLogappenderCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : LogAppender$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkCoreEngineLogappenderRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreEngineLogappenderReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreEngineLogappenderReleaseHandle(handle);

Pointer<Void> sdkCoreEngineLogappenderToFfiNullable(LogAppender? value) =>
  value != null ? sdkCoreEngineLogappenderToFfi(value) : Pointer<Void>.fromAddress(0);

LogAppender? sdkCoreEngineLogappenderFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreEngineLogappenderFromFfi(handle) : null;

void sdkCoreEngineLogappenderReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineLogappenderReleaseHandle(handle);

// End of LogAppender "private" section.


