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
import 'dart:ui' as ui;
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/sdk/core/color.dart';

/// @nodoc
/// Constants used to initialize value of Color class

class NamedColor {
  /// White
  static final ui.Color white = ui.Color(4294967295);

}


// NamedColor "private" section, not exported.

final _sdkCoreNamedcolorCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_sdk_core_NamedColor_create_handle'));
final _sdkCoreNamedcolorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_NamedColor_release_handle'));



Pointer<Void> sdkCoreNamedcolorToFfi(NamedColor value) {
  final _result = _sdkCoreNamedcolorCreateHandle();
  return _result;
}

NamedColor sdkCoreNamedcolorFromFfi(Pointer<Void> handle) {
  try {
    return NamedColor(
    );
  } finally {
  }
}

void sdkCoreNamedcolorReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreNamedcolorReleaseHandle(handle);

// Nullable NamedColor

final _sdkCoreNamedcolorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_NamedColor_create_handle_nullable'));
final _sdkCoreNamedcolorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_NamedColor_release_handle_nullable'));
final _sdkCoreNamedcolorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_NamedColor_get_value_nullable'));

Pointer<Void> sdkCoreNamedcolorToFfiNullable(NamedColor? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreNamedcolorToFfi(value);
  final result = _sdkCoreNamedcolorCreateHandleNullable(_handle);
  sdkCoreNamedcolorReleaseFfiHandle(_handle);
  return result;
}

NamedColor? sdkCoreNamedcolorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreNamedcolorGetValueNullable(handle);
  final result = sdkCoreNamedcolorFromFfi(_handle);
  sdkCoreNamedcolorReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreNamedcolorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreNamedcolorReleaseHandleNullable(handle);

// End of NamedColor "private" section.


