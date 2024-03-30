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

/// This enum represents text formats.
@Deprecated("Will be removed in v4.19.0. Not needed as only plain text is supported.")
enum TextFormat {
    /// HTML format.
    html,
    /// Plain text format.
    plain
}

// TextFormat "private" section, not exported.

int sdkCoreTextformatToFfi(TextFormat value) {
  switch (value) {
  case TextFormat.html:
    return 0;
  case TextFormat.plain:
    return 1;
  default:
    throw StateError("Invalid enum value $value for TextFormat enum.");
  }
}

TextFormat sdkCoreTextformatFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TextFormat.html;
  case 1:
    return TextFormat.plain;
  default:
    throw StateError("Invalid numeric value $handle for TextFormat enum.");
  }
}

void sdkCoreTextformatReleaseFfiHandle(int handle) {}

final _sdkCoreTextformatCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_TextFormat_create_handle_nullable'));
final _sdkCoreTextformatReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_TextFormat_release_handle_nullable'));
final _sdkCoreTextformatGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_TextFormat_get_value_nullable'));

Pointer<Void> sdkCoreTextformatToFfiNullable(TextFormat? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreTextformatToFfi(value);
  final result = _sdkCoreTextformatCreateHandleNullable(_handle);
  sdkCoreTextformatReleaseFfiHandle(_handle);
  return result;
}

TextFormat? sdkCoreTextformatFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreTextformatGetValueNullable(handle);
  final result = sdkCoreTextformatFromFfi(_handle);
  sdkCoreTextformatReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreTextformatReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreTextformatReleaseHandleNullable(handle);

// End of TextFormat "private" section.


