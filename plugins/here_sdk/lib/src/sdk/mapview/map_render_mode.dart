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

/// For Android only: Mode of rendering the map by a `HereMap` widget.
///
/// Specified by setting [HereMapOptions.renderMode]
/// and passing the options object to `HereMap` on creation time.
enum MapRenderMode {
    /// Map rendering will use `SurfaceView`. This offers best performance but can cause graphical
    /// glitches in apps with complex, dynamic UI and/or multiple `MapView` instances.
    surface,
    /// Map rendering will use `TextureView`. This method has a performance penalty, but makes
    /// `MapView` behave like a regular view, supporting view transformations and alpha and
    /// avoiding graphical glitches that `SurfaceView` can suffer from in certain scenarios.
    texture
}

// MapRenderMode "private" section, not exported.

int sdkMapviewMaprendermodeToFfi(MapRenderMode value) {
  switch (value) {
  case MapRenderMode.surface:
    return 0;
  case MapRenderMode.texture:
    return 1;
  default:
    throw StateError("Invalid enum value $value for MapRenderMode enum.");
  }
}

MapRenderMode sdkMapviewMaprendermodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MapRenderMode.surface;
  case 1:
    return MapRenderMode.texture;
  default:
    throw StateError("Invalid numeric value $handle for MapRenderMode enum.");
  }
}

void sdkMapviewMaprendermodeReleaseFfiHandle(int handle) {}

final _sdkMapviewMaprendermodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapRenderMode_create_handle_nullable'));
final _sdkMapviewMaprendermodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapRenderMode_release_handle_nullable'));
final _sdkMapviewMaprendermodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapRenderMode_get_value_nullable'));

Pointer<Void> sdkMapviewMaprendermodeToFfiNullable(MapRenderMode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMaprendermodeToFfi(value);
  final result = _sdkMapviewMaprendermodeCreateHandleNullable(_handle);
  sdkMapviewMaprendermodeReleaseFfiHandle(_handle);
  return result;
}

MapRenderMode? sdkMapviewMaprendermodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMaprendermodeGetValueNullable(handle);
  final result = sdkMapviewMaprendermodeFromFfi(_handle);
  sdkMapviewMaprendermodeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMaprendermodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMaprendermodeReleaseHandleNullable(handle);

// End of MapRenderMode "private" section.


