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

/// Type representing map content categories.
enum MapContentCategory {
    /// Vehicle restriction icons
    vehicleRestrictionIcons
}

// MapContentCategory "private" section, not exported.

int sdkMapviewMapcontentcategoryToFfi(MapContentCategory value) {
  switch (value) {
  case MapContentCategory.vehicleRestrictionIcons:
    return 0;
  default:
    throw StateError("Invalid enum value $value for MapContentCategory enum.");
  }
}

MapContentCategory sdkMapviewMapcontentcategoryFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MapContentCategory.vehicleRestrictionIcons;
  default:
    throw StateError("Invalid numeric value $handle for MapContentCategory enum.");
  }
}

void sdkMapviewMapcontentcategoryReleaseFfiHandle(int handle) {}

final _sdkMapviewMapcontentcategoryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapContentCategory_create_handle_nullable'));
final _sdkMapviewMapcontentcategoryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContentCategory_release_handle_nullable'));
final _sdkMapviewMapcontentcategoryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContentCategory_get_value_nullable'));

Pointer<Void> sdkMapviewMapcontentcategoryToFfiNullable(MapContentCategory? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapcontentcategoryToFfi(value);
  final result = _sdkMapviewMapcontentcategoryCreateHandleNullable(_handle);
  sdkMapviewMapcontentcategoryReleaseFfiHandle(_handle);
  return result;
}

MapContentCategory? sdkMapviewMapcontentcategoryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapcontentcategoryGetValueNullable(handle);
  final result = sdkMapviewMapcontentcategoryFromFfi(_handle);
  sdkMapviewMapcontentcategoryReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapcontentcategoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcontentcategoryReleaseHandleNullable(handle);

// End of MapContentCategory "private" section.


