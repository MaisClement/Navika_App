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

/// The map projection used for rendering.
enum MapProjection {
    /// 3D Globe projection.
    globe,
    /// Flat map projection.
    webMercator
}

// MapProjection "private" section, not exported.

int sdkMapviewMapprojectionToFfi(MapProjection value) {
  switch (value) {
  case MapProjection.globe:
    return 0;
  case MapProjection.webMercator:
    return 1;
  default:
    throw StateError("Invalid enum value $value for MapProjection enum.");
  }
}

MapProjection sdkMapviewMapprojectionFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MapProjection.globe;
  case 1:
    return MapProjection.webMercator;
  default:
    throw StateError("Invalid numeric value $handle for MapProjection enum.");
  }
}

void sdkMapviewMapprojectionReleaseFfiHandle(int handle) {}

final _sdkMapviewMapprojectionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapProjection_create_handle_nullable'));
final _sdkMapviewMapprojectionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapProjection_release_handle_nullable'));
final _sdkMapviewMapprojectionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapProjection_get_value_nullable'));

Pointer<Void> sdkMapviewMapprojectionToFfiNullable(MapProjection? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapprojectionToFfi(value);
  final result = _sdkMapviewMapprojectionCreateHandleNullable(_handle);
  sdkMapviewMapprojectionReleaseFfiHandle(_handle);
  return result;
}

MapProjection? sdkMapviewMapprojectionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapprojectionGetValueNullable(handle);
  final result = sdkMapviewMapprojectionFromFfi(_handle);
  sdkMapviewMapprojectionReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapprojectionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapprojectionReleaseHandleNullable(handle);

// End of MapProjection "private" section.


