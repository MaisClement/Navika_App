// Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
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

import 'dart:io' show Platform;
import '../../_library_context.dart' show IsolateOrigin, LibraryContext;

class SdkContext {
  /// Prepares the SDK for use
  ///
  /// Users should call this method once, when the application starts, preferably in the main()
  /// method.
  ///
  /// [isolateOrigin] The isolate in which the application is executing.  This is IsolateOrigin.main
  /// by default, and this is suitable for almost all use cases.
  static void init([IsolateOrigin isolateOrigin = IsolateOrigin.main]) {
    LibraryContext.init(isolateOrigin, nativeLibraryPath: _getLibraryName());
  }

  /// Releases resources used by the SDK
  ///
  /// Users should call this method once, when the application shuts down, preferably in the dispose()
  /// method of the root widget's State.
  static void release() {
    LibraryContext.release();
  }

  static String _getLibraryName() {
    if (Platform.isIOS) return '';
    return 'libheresdk.so';
  }
}
