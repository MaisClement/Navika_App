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

import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';

final nativeLibrary = _nativeLibrary ?? _loadNativeLibrary(_getLibraryPath("here_sdk"));
DynamicLibrary? _nativeLibrary;

DynamicLibrary _loadNativeLibrary(String nativeLibraryPath) {
  try {
    return DynamicLibrary.open(nativeLibraryPath);
  } catch (e) {
    return DynamicLibrary.process();
  }
}

String _getLibraryPath(String nativeLibraryName) {
  if (Platform.isWindows) return 'lib$nativeLibraryName.dll';
  if (Platform.isMacOS || Platform.isIOS) return 'lib$nativeLibraryName.dylib';
  return 'lib$nativeLibraryName.so';
}

dynamic catchArgumentError(Function f) {
  try {
    return f();
  } on ArgumentError catch (e) {
    throw ArgumentError("Failed to resolve an FFI function. Perhaps `LibraryContext.init()` was not called.\n" + e.message);
  }
}

final _libraryCallbacksQueueInit = catchArgumentError(() => nativeLibrary.lookupFunction<
    Int32 Function(Uint8),
    int Function(int)
  >('here_sdk_library_callbacks_queue_init'));
final _libraryCallbacksQueueRelease = catchArgumentError(() => nativeLibrary.lookupFunction<
    Void Function(Int32),
    void Function(int)
  >('here_sdk_library_callbacks_queue_release'));
final _libraryWaitForCallbacks = catchArgumentError(() => nativeLibrary.lookupFunction<
    Uint8 Function(Int32),
    int Function(int)
  >('here_sdk_library_wait_for_callbacks'));
final _libraryExecuteCallbacks = catchArgumentError(() => nativeLibrary.lookupFunction<
    Void Function(Int32),
    void Function(int)
  >('here_sdk_library_execute_callbacks'));

class _SentryIsolateMessage {
  _SentryIsolateMessage(this.port, this.isolateId, this.nativeLibraryPath);
  final SendPort port;
  final int isolateId;
  final String? nativeLibraryPath;
}

enum IsolateOrigin {
  main,
  spawned
}

enum WaitCallbackResult {
  stopped,
  hasIncoming,
  timedOut
}

class LibraryContext {
  static int get isolateId => _isolateId;

  static int _isolateId = -1;
  static late StreamSubscription _callbackStream;

  /// [nativeLibraryPath] is an optional parameter specifying a path to native shared library
  /// binary. If omitted (null) automatic library loading is attempted as a fallback. If loading
  /// fails, current process is used as a native library instead.
  static void init(IsolateOrigin isolateOrigin, {String? nativeLibraryPath}) {
    _loadCustomLibrary(nativeLibraryPath);
    _initializeDartDl();
    _isolateId = _libraryCallbacksQueueInit(isolateOrigin == IsolateOrigin.main ? 1 : 0);

    final receivePort = ReceivePort();
    Isolate.spawn(_sentryIsolate, _SentryIsolateMessage(receivePort.sendPort, isolateId, nativeLibraryPath));
    _callbackStream = receivePort.listen((dynamic _) { _libraryExecuteCallbacks(isolateId); });
  }

  static void release() {
    _callbackStream.cancel();
    _libraryCallbacksQueueRelease(isolateId);
  }

  static void _sentryIsolate(_SentryIsolateMessage message) {
    _loadCustomLibrary(message.nativeLibraryPath);

    WaitCallbackResult waitResult = WaitCallbackResult.stopped;
    do {
      waitResult = WaitCallbackResult.values[_libraryWaitForCallbacks(message.isolateId)];
      if (waitResult == WaitCallbackResult.hasIncoming) {
        message.port.send(1);
      }
    } while (waitResult != WaitCallbackResult.stopped);
    message.port.send(0);
  }

  static void _loadCustomLibrary(String? nativeLibraryPath) {
    if (nativeLibraryPath != null) _nativeLibrary = _loadNativeLibrary(nativeLibraryPath);
  }

  static void _initializeDartDl() {
    final _libraryDartDlInit = catchArgumentError(() => nativeLibrary.lookupFunction<
        Int32 Function(Pointer<Void>),
        int Function(Pointer<Void>)
      >('here_sdk_dart_dl_initialize'));

    if (_libraryDartDlInit(NativeApi.initializeApiDLData) != 1) {
      throw UnsupportedError("Unsupported version of Dart DL API. FFI 1.0 (Dart 2.12) or newer is required.");
    }
  }
}
