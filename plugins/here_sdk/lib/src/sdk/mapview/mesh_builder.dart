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
import 'package:here_sdk/src/sdk/core/point3_d.dart';
import 'package:here_sdk/src/sdk/mapview/mesh.dart';
import 'package:here_sdk/src/sdk/mapview/quad_mesh_builder.dart';
import 'package:here_sdk/src/sdk/mapview/triangle_mesh_builder.dart';
import 'package:meta/meta.dart';

/// Builder for meshes.
///
/// Such meshes can contain different kinds of primitives, like quads or
/// triangles. Both primitives support adding texture coordinates that are mapped to the
/// corners of the primitives. See [TriangleMeshBuilder] and [QuadMeshBuilder] for more details.
/// Note: Normals cannot be set as they are not necessary when using the [MeshBuilder].
///
/// Example how to build a cube using [QuadMeshBuilder]
///
/// ```
/// Mesh? cube = MeshBuilder()
///       .quad(Point3D(0.5, 0.5, 0.5),
///             Point3D(-0.5, 0.5, 0.5),
///             Point3D(0.5, -0.5, 0.5),
///             Point3D(-0.5, -0.5, 0.5))
///       .quad(Point3D(-0.5, 0.5, -0.5),
///             Point3D(0.5, 0.5, -0.5),
///             Point3D(-0.5, -0.5, -0.5),
///             Point3D(0.5, -0.5, -0.5))
///       .quad(Point3D(0.5, 0.5, -0.5),
///             Point3D(0.5, 0.5, 0.5),
///             Point3D(0.5, -0.5, -0.5),
///             Point3D(0.5, -0.5, 0.5))
///       .quad(Point3D(-0.5, 0.5, 0.5),
///             Point3D(-0.5, 0.5, -0.5),
///             Point3D(-0.5, -0.5, 0.5),
///             Point3D(-0.5, -0.5, -0.5))
///       .quad(Point3D(-0.5, 0.5, 0.5),
///             Point3D(0.5, 0.5, 0.5),
///             Point3D(-0.5, 0.5, -0.5),
///             Point3D(0.5, 0.5, -0.5))
///       .quad(Point3D(0.5, -0.5, 0.5),
///             Point3D(-0.5, -0.5, 0.5),
///             Point3D(0.5, -0.5, -0.5),
///             Point3D(-0.5, -0.5, -0.5))
///       .build();
/// ```
abstract class MeshBuilder {
  /// Constructs an instance of MeshBuilder.
  ///
  factory MeshBuilder() => $prototype.make();

  /// Adds a triangle.
  ///
  /// Triangle visibility is determined via back-face culling. Front-facing
  /// triangles are expected to have counter-clockwise winding.
  ///
  /// [a] First vertex of the triangle.
  ///
  /// [b] Second vertex of the triangle.
  ///
  /// [c] Third vertex of the triangle.
  ///
  /// Returns [TriangleMeshBuilder]. A [TriangleMeshBuilder] instance.
  ///
  TriangleMeshBuilder triangle(Point3D a, Point3D b, Point3D c);
  /// Adds a quad.
  ///
  /// Internally, this will be transformed into triangles abc and bdc. Triangle
  /// visibility is determined via back-face culling. Front-facing triangles are expected to have
  /// counter-clockwise winding.
  ///
  /// [a] First vertex of quad.
  ///
  /// [b] Second vertex of the quad.
  ///
  /// [c] Third vertex of the quad.
  ///
  /// [d] Fourth vertex of the quad.
  ///
  /// Returns [QuadMeshBuilder]. A [QuadMeshBuilder] instance.
  ///
  QuadMeshBuilder quad(Point3D a, Point3D b, Point3D c, Point3D d);

  /// Returns [Mesh?]. mesh containing added geometry or 'null' if no geometry was added.
  ///
  Mesh? build();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MeshBuilder$Impl(Pointer<Void>.fromAddress(0));
}


// MeshBuilder "private" section, not exported.

final _sdkMapviewMeshbuilderRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MeshBuilder_register_finalizer'));
final _sdkMapviewMeshbuilderCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MeshBuilder_copy_handle'));
final _sdkMapviewMeshbuilderReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MeshBuilder_release_handle'));
final _sdkMapviewMeshbuilderGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MeshBuilder_get_type_id'));






/// @nodoc
@visibleForTesting
class MeshBuilder$Impl extends __lib.NativeBase implements MeshBuilder {

  MeshBuilder$Impl(Pointer<Void> handle) : super(handle);


  MeshBuilder make() {
    final _result_handle = _make();
    final _result = MeshBuilder$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMeshbuilderRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make() {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_mapview_MeshBuilder_make'));
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  @override
  TriangleMeshBuilder triangle(Point3D a, Point3D b, Point3D c) {
    final _triangleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MeshBuilder_triangle__Point3D_Point3D_Point3D'));
    final _aHandle = sdkCorePoint3dToFfi(a);
    final _bHandle = sdkCorePoint3dToFfi(b);
    final _cHandle = sdkCorePoint3dToFfi(c);
    final _handle = this.handle;
    final __resultHandle = _triangleFfi(_handle, __lib.LibraryContext.isolateId, _aHandle, _bHandle, _cHandle);
    sdkCorePoint3dReleaseFfiHandle(_aHandle);
    sdkCorePoint3dReleaseFfiHandle(_bHandle);
    sdkCorePoint3dReleaseFfiHandle(_cHandle);
    try {
      return sdkMapviewTrianglemeshbuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewTrianglemeshbuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  QuadMeshBuilder quad(Point3D a, Point3D b, Point3D c, Point3D d) {
    final _quadFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MeshBuilder_quad__Point3D_Point3D_Point3D_Point3D'));
    final _aHandle = sdkCorePoint3dToFfi(a);
    final _bHandle = sdkCorePoint3dToFfi(b);
    final _cHandle = sdkCorePoint3dToFfi(c);
    final _dHandle = sdkCorePoint3dToFfi(d);
    final _handle = this.handle;
    final __resultHandle = _quadFfi(_handle, __lib.LibraryContext.isolateId, _aHandle, _bHandle, _cHandle, _dHandle);
    sdkCorePoint3dReleaseFfiHandle(_aHandle);
    sdkCorePoint3dReleaseFfiHandle(_bHandle);
    sdkCorePoint3dReleaseFfiHandle(_cHandle);
    sdkCorePoint3dReleaseFfiHandle(_dHandle);
    try {
      return sdkMapviewQuadmeshbuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewQuadmeshbuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  Mesh? build() {
    final _buildFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MeshBuilder_build'));
    final _handle = this.handle;
    final __resultHandle = _buildFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMeshFromFfiNullable(__resultHandle);
    } finally {
      sdkMapviewMeshReleaseFfiHandleNullable(__resultHandle);

    }

  }


}

Pointer<Void> sdkMapviewMeshbuilderToFfi(MeshBuilder value) =>
  _sdkMapviewMeshbuilderCopyHandle((value as __lib.NativeBase).handle);

MeshBuilder sdkMapviewMeshbuilderFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MeshBuilder) return instance;

  final _typeIdHandle = _sdkMapviewMeshbuilderGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMeshbuilderCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MeshBuilder$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMeshbuilderRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMeshbuilderReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMeshbuilderReleaseHandle(handle);

Pointer<Void> sdkMapviewMeshbuilderToFfiNullable(MeshBuilder? value) =>
  value != null ? sdkMapviewMeshbuilderToFfi(value) : Pointer<Void>.fromAddress(0);

MeshBuilder? sdkMapviewMeshbuilderFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMeshbuilderFromFfi(handle) : null;

void sdkMapviewMeshbuilderReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMeshbuilderReleaseHandle(handle);

// End of MeshBuilder "private" section.


