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

/// Content types supported by the map.
enum MapContentType {
    /// Raster image.
    rasterImage
}

// MapContentType "private" section, not exported.

int sdkMapviewSdkmapcontenttypeToFfi(MapContentType value) {
  switch (value) {
  case MapContentType.rasterImage:
    return 0;
  default:
    throw StateError("Invalid enum value $value for MapContentType enum.");
  }
}

MapContentType sdkMapviewSdkmapcontenttypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MapContentType.rasterImage;
  default:
    throw StateError("Invalid numeric value $handle for MapContentType enum.");
  }
}

void sdkMapviewSdkmapcontenttypeReleaseFfiHandle(int handle) {}

final _sdkMapviewSdkmapcontenttypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_SDKMapContentType_create_handle_nullable'));
final _sdkMapviewSdkmapcontenttypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_SDKMapContentType_release_handle_nullable'));
final _sdkMapviewSdkmapcontenttypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_SDKMapContentType_get_value_nullable'));

Pointer<Void> sdkMapviewSdkmapcontenttypeToFfiNullable(MapContentType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewSdkmapcontenttypeToFfi(value);
  final result = _sdkMapviewSdkmapcontenttypeCreateHandleNullable(_handle);
  sdkMapviewSdkmapcontenttypeReleaseFfiHandle(_handle);
  return result;
}

MapContentType? sdkMapviewSdkmapcontenttypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewSdkmapcontenttypeGetValueNullable(handle);
  final result = sdkMapviewSdkmapcontenttypeFromFfi(_handle);
  sdkMapviewSdkmapcontenttypeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewSdkmapcontenttypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewSdkmapcontenttypeReleaseHandleNullable(handle);

// End of MapContentType "private" section.


