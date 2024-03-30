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
import 'package:here_sdk/src/_native_base.dart' as __lib;

/// An update that can be applied to the map camera.
///
/// Creation is done via [MapCameraUpdateFactory].
abstract class MapCameraUpdate {

}

/// Describes a reason for failing to create a [MapCameraUpdate].
enum MapCameraUpdateInstantiationErrorCode {
    /// List of camera updates that should form a composite camera update is empty.
    emptyCompositeCameraUpdateList
}

// MapCameraUpdateInstantiationErrorCode "private" section, not exported.

int sdkMapviewMapcameraupdateInstantiationerrorcodeToFfi(MapCameraUpdateInstantiationErrorCode value) {
  switch (value) {
  case MapCameraUpdateInstantiationErrorCode.emptyCompositeCameraUpdateList:
    return 1;
  default:
    throw StateError("Invalid enum value $value for MapCameraUpdateInstantiationErrorCode enum.");
  }
}

MapCameraUpdateInstantiationErrorCode sdkMapviewMapcameraupdateInstantiationerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return MapCameraUpdateInstantiationErrorCode.emptyCompositeCameraUpdateList;
  default:
    throw StateError("Invalid numeric value $handle for MapCameraUpdateInstantiationErrorCode enum.");
  }
}

void sdkMapviewMapcameraupdateInstantiationerrorcodeReleaseFfiHandle(int handle) {}

final _sdkMapviewMapcameraupdateInstantiationerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapCameraUpdate_InstantiationErrorCode_create_handle_nullable'));
final _sdkMapviewMapcameraupdateInstantiationerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraUpdate_InstantiationErrorCode_release_handle_nullable'));
final _sdkMapviewMapcameraupdateInstantiationerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraUpdate_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdkMapviewMapcameraupdateInstantiationerrorcodeToFfiNullable(MapCameraUpdateInstantiationErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapcameraupdateInstantiationerrorcodeToFfi(value);
  final result = _sdkMapviewMapcameraupdateInstantiationerrorcodeCreateHandleNullable(_handle);
  sdkMapviewMapcameraupdateInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

MapCameraUpdateInstantiationErrorCode? sdkMapviewMapcameraupdateInstantiationerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapcameraupdateInstantiationerrorcodeGetValueNullable(handle);
  final result = sdkMapviewMapcameraupdateInstantiationerrorcodeFromFfi(_handle);
  sdkMapviewMapcameraupdateInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapcameraupdateInstantiationerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcameraupdateInstantiationerrorcodeReleaseHandleNullable(handle);

// End of MapCameraUpdateInstantiationErrorCode "private" section.
/// Thrown when a problem occurs while trying to create a [MapCameraUpdate].
class MapCameraUpdateInstantiationException implements Exception {
  final MapCameraUpdateInstantiationErrorCode error;
  MapCameraUpdateInstantiationException(this.error);
}

// MapCameraUpdate "private" section, not exported.

final _sdkMapviewMapcameraupdateRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapCameraUpdate_register_finalizer'));
final _sdkMapviewMapcameraupdateCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraUpdate_copy_handle'));
final _sdkMapviewMapcameraupdateReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraUpdate_release_handle'));


class MapCameraUpdate$Impl extends __lib.NativeBase implements MapCameraUpdate {

  MapCameraUpdate$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkMapviewMapcameraupdateToFfi(MapCameraUpdate value) =>
  _sdkMapviewMapcameraupdateCopyHandle((value as __lib.NativeBase).handle);

MapCameraUpdate sdkMapviewMapcameraupdateFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");

  final _copiedHandle = _sdkMapviewMapcameraupdateCopyHandle(handle);
  final result = MapCameraUpdate$Impl(_copiedHandle);
  _sdkMapviewMapcameraupdateRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapcameraupdateReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcameraupdateReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcameraupdateToFfiNullable(MapCameraUpdate? value) =>
  value != null ? sdkMapviewMapcameraupdateToFfi(value) : Pointer<Void>.fromAddress(0);

MapCameraUpdate? sdkMapviewMapcameraupdateFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcameraupdateFromFfi(handle) : null;

void sdkMapviewMapcameraupdateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcameraupdateReleaseHandle(handle);

// End of MapCameraUpdate "private" section.


