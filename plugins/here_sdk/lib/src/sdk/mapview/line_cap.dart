// Copyright (c) 2019-2023 HERE Global B.V. and its affiliate(s).
// All rights reserved.
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

/// Determines the cap (line ending) style.
enum LineCap {
    /// Line caps are rounded. This is the default value.
    round,
    /// Line caps are square.
    square,
    /// The line ends immediately and has no cap.
    butt
}

// LineCap "private" section, not exported.

int sdkMapviewLinecapToFfi(LineCap value) {
  switch (value) {
  case LineCap.round:
    return 0;
  case LineCap.square:
    return 1;
  case LineCap.butt:
    return 2;
  default:
    throw StateError("Invalid enum value $value for LineCap enum.");
  }
}

LineCap sdkMapviewLinecapFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LineCap.round;
  case 1:
    return LineCap.square;
  case 2:
    return LineCap.butt;
  default:
    throw StateError("Invalid numeric value $handle for LineCap enum.");
  }
}

void sdkMapviewLinecapReleaseFfiHandle(int handle) {}

final _sdkMapviewLinecapCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_LineCap_create_handle_nullable'));
final _sdkMapviewLinecapReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LineCap_release_handle_nullable'));
final _sdkMapviewLinecapGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LineCap_get_value_nullable'));

Pointer<Void> sdkMapviewLinecapToFfiNullable(LineCap? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewLinecapToFfi(value);
  final result = _sdkMapviewLinecapCreateHandleNullable(_handle);
  sdkMapviewLinecapReleaseFfiHandle(_handle);
  return result;
}

LineCap? sdkMapviewLinecapFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewLinecapGetValueNullable(handle);
  final result = sdkMapviewLinecapFromFfi(_handle);
  sdkMapviewLinecapReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewLinecapReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewLinecapReleaseHandleNullable(handle);

// End of LineCap "private" section.


