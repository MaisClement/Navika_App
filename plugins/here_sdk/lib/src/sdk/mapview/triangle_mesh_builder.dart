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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/anchor2_d.dart';
import 'package:here_sdk/src/sdk/mapview/mesh_builder.dart';

/// Builder for a single triangle.
abstract class TriangleMeshBuilder implements MeshBuilder {

  /// Adds texture coordinates to a triangle.
  ///
  /// Coordinates are specified as `<u,v>` with `<0,0>`
  /// representing the bottom-left and `<1,1>` upper-right corner.
  ///
  /// [a] Texture coordinate for vertex a. See [MeshBuilder.triangle]
  ///
  /// [b] Texture coordinate for vertex b. See [MeshBuilder.triangle]
  ///
  /// [c] Texture coordinate for vertex c. See [MeshBuilder.triangle]
  ///
  /// Returns [MeshBuilder]. A [MeshBuilder] instance.
  ///
  MeshBuilder withTextureCoordinates(Anchor2D a, Anchor2D b, Anchor2D c);
}


// TriangleMeshBuilder "private" section, not exported.

final _sdkMapviewTrianglemeshbuilderRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_TriangleMeshBuilder_register_finalizer'));
final _sdkMapviewTrianglemeshbuilderCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_TriangleMeshBuilder_copy_handle'));
final _sdkMapviewTrianglemeshbuilderReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_TriangleMeshBuilder_release_handle'));
final _sdkMapviewTrianglemeshbuilderGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_TriangleMeshBuilder_get_type_id'));



class TriangleMeshBuilder$Impl extends MeshBuilder$Impl implements TriangleMeshBuilder {

  TriangleMeshBuilder$Impl(Pointer<Void> handle) : super(handle);

  @override
  MeshBuilder withTextureCoordinates(Anchor2D a, Anchor2D b, Anchor2D c) {
    final _withTextureCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_TriangleMeshBuilder_withTextureCoordinates__Anchor2D_Anchor2D_Anchor2D'));
    final _aHandle = sdkCoreAnchor2dToFfi(a);
    final _bHandle = sdkCoreAnchor2dToFfi(b);
    final _cHandle = sdkCoreAnchor2dToFfi(c);
    final _handle = this.handle;
    final __resultHandle = _withTextureCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _aHandle, _bHandle, _cHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_aHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_bHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_cHandle);
    try {
      return sdkMapviewMeshbuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewMeshbuilderReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkMapviewTrianglemeshbuilderToFfi(TriangleMeshBuilder value) =>
  _sdkMapviewTrianglemeshbuilderCopyHandle((value as __lib.NativeBase).handle);

TriangleMeshBuilder sdkMapviewTrianglemeshbuilderFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TriangleMeshBuilder) return instance;

  final _typeIdHandle = _sdkMapviewTrianglemeshbuilderGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewTrianglemeshbuilderCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TriangleMeshBuilder$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewTrianglemeshbuilderRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewTrianglemeshbuilderReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewTrianglemeshbuilderReleaseHandle(handle);

Pointer<Void> sdkMapviewTrianglemeshbuilderToFfiNullable(TriangleMeshBuilder? value) =>
  value != null ? sdkMapviewTrianglemeshbuilderToFfi(value) : Pointer<Void>.fromAddress(0);

TriangleMeshBuilder? sdkMapviewTrianglemeshbuilderFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewTrianglemeshbuilderFromFfi(handle) : null;

void sdkMapviewTrianglemeshbuilderReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewTrianglemeshbuilderReleaseHandle(handle);

// End of TriangleMeshBuilder "private" section.


