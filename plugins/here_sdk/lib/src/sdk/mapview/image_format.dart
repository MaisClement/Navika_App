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

/// Image format
enum ImageFormat {
    /// The image data is in a compressed PNG format, no decompression or processing has
    /// been performed on it.
    png,
    /// The image data is in SVG Tiny format
    svg
}

// ImageFormat "private" section, not exported.

int sdkMapviewImageformatToFfi(ImageFormat value) {
  switch (value) {
  case ImageFormat.png:
    return 0;
  case ImageFormat.svg:
    return 1;
  default:
    throw StateError("Invalid enum value $value for ImageFormat enum.");
  }
}

ImageFormat sdkMapviewImageformatFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ImageFormat.png;
  case 1:
    return ImageFormat.svg;
  default:
    throw StateError("Invalid numeric value $handle for ImageFormat enum.");
  }
}

void sdkMapviewImageformatReleaseFfiHandle(int handle) {}

final _sdkMapviewImageformatCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_ImageFormat_create_handle_nullable'));
final _sdkMapviewImageformatReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_ImageFormat_release_handle_nullable'));
final _sdkMapviewImageformatGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_ImageFormat_get_value_nullable'));

Pointer<Void> sdkMapviewImageformatToFfiNullable(ImageFormat? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewImageformatToFfi(value);
  final result = _sdkMapviewImageformatCreateHandleNullable(_handle);
  sdkMapviewImageformatReleaseFfiHandle(_handle);
  return result;
}

ImageFormat? sdkMapviewImageformatFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewImageformatGetValueNullable(handle);
  final result = sdkMapviewImageformatFromFfi(_handle);
  sdkMapviewImageformatReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewImageformatReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewImageformatReleaseHandleNullable(handle);

// End of ImageFormat "private" section.


