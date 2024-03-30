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
import 'package:here_sdk/src/_token_cache.dart' as __lib;

/// Represents a mesh in 3D space.
///
/// Such meshes are built using [MeshBuilder].
/// The class is not offering any methods, as its data is only meant to be consumed internally
/// when being passed to [MapMarker3DModel] constructor.
abstract class Mesh {

}


// Mesh "private" section, not exported.

final _sdkMapviewMeshRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_Mesh_register_finalizer'));
final _sdkMapviewMeshCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_Mesh_copy_handle'));
final _sdkMapviewMeshReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_Mesh_release_handle'));


class Mesh$Impl extends __lib.NativeBase implements Mesh {

  Mesh$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkMapviewMeshToFfi(Mesh value) =>
  _sdkMapviewMeshCopyHandle((value as __lib.NativeBase).handle);

Mesh sdkMapviewMeshFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Mesh) return instance;

  final _copiedHandle = _sdkMapviewMeshCopyHandle(handle);
  final result = Mesh$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMeshRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMeshReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMeshReleaseHandle(handle);

Pointer<Void> sdkMapviewMeshToFfiNullable(Mesh? value) =>
  value != null ? sdkMapviewMeshToFfi(value) : Pointer<Void>.fromAddress(0);

Mesh? sdkMapviewMeshFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMeshFromFfi(handle) : null;

void sdkMapviewMeshReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMeshReleaseHandle(handle);

// End of Mesh "private" section.


