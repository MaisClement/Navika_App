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
import 'dart:ui' as ui;
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/color.dart';
import 'package:here_sdk/src/sdk/mapview/mesh.dart';
import 'package:meta/meta.dart';

/// Represents a 3D model that can be used by a [MapMarker3D] to be shown on the map.
///
/// Geometry of 3D marker can be provided in form of a Wavefront OBJ file as specified in
/// http://www.martinreddy.net/gfx/3d/OBJ.spec or as mesh built via [MeshBuilder].
///
/// # 1. Creating `MapMarker3DModel` from OBJ file
///
/// For OBJ files, HERE SDK only supports the following set of features of the OBJ specification:
/// - Triangle Meshes
/// - Following vertex attributes must be present:
///   - Vertex Position
///   - Vertex Normal
///   - Texture Coordinates
///   - Geometry must be indexed (contain an Index Buffer)
///   - Face element
///
/// HERE SDK does not support:
/// - Multi Texturing
/// - Materials (mtllib \[external .mtl file name\] )
///   - Lines
///   - Higher Order Surfaces
///   - Vendor specific extensions
///
/// For supported texture formats, HERE SDK allows the following formats to be specified:
/// JPG, PNG, GPU compressed texture formats: ECT1 (OpenGL only), YUV, ASTC, KTX.
///
/// # 2. Creating `MapMarker3DModel` programatically
///
/// A 3D mesh can be specified programatically using [MeshBuilder] and passed to
/// `MapMarker3DModel` constructor. This method supports creating a mesh from
/// quads and triangles. Textured geometry is also supported, the mesh faces
/// need to have texture coordinates and a texture file needs to be passed
/// along with the mesh to `MapMarker3DModel` constructor.
abstract class MapMarker3DModel {
  /// Creates a new 3D model from path to .obj file, texture and color.
  ///
  /// [geometryFilePath] Absolute path to obj file.
  ///
  /// [textureFilePath] Absolute path to texture file.
  ///
  /// [color] Color to be blend with texture.
  /// This color is multiplied with color of texture.
  ///
  factory MapMarker3DModel.withTextureFilePathAndColor(String geometryFilePath, String textureFilePath, ui.Color color) => $prototype.withTextureFilePathAndColor(geometryFilePath, textureFilePath, color);
  /// Creates a new 3D model from mesh, texture and color.
  ///
  /// [mesh] Mesh containing the 3d geometry together with texture coordinates.
  ///
  /// [textureFilePath] Absolute path to texture file.
  ///
  /// [color] Color to be blend with texture.
  /// This color is multiplied with color of texture.
  ///
  /// Throws [MapMarker3DModelInstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory MapMarker3DModel.fromMeshWithTextureFilePathAndColor(Mesh mesh, String textureFilePath, ui.Color color) => $prototype.fromMeshWithTextureFilePathAndColor(mesh, textureFilePath, color);
  /// Creates a new 3D model from path to .obj file and texture.
  ///
  /// [geometryFilePath] Absolute path to obj file.
  ///
  /// [textureFilePath] Absolute path to texture file.
  ///
  factory MapMarker3DModel.withTextureFilePath(String geometryFilePath, String textureFilePath) => $prototype.withTextureFilePath(geometryFilePath, textureFilePath);
  /// Creates a new 3D model from mesh and texture.
  ///
  /// [mesh] Mesh containing the 3d geometry together with texture coordinates.
  ///
  /// [textureFilePath] Absolute path to texture file.
  ///
  /// Throws [MapMarker3DModelInstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory MapMarker3DModel.fromMeshWithTextureFilePath(Mesh mesh, String textureFilePath) => $prototype.fromMeshWithTextureFilePath(mesh, textureFilePath);
  /// Creates a new 3D model from path to .obj file.
  ///
  /// [geometryFilePath] Absolute path to obj file.
  ///
  factory MapMarker3DModel(String geometryFilePath) => $prototype.$init(geometryFilePath);
  /// Creates a new 3D model from a mesh.
  ///
  /// [mesh] Mesh containing the 3d geometry 3D data.
  ///
  factory MapMarker3DModel.fromMesh(Mesh mesh) => $prototype.fromMesh(mesh);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapMarker3DModel$Impl(Pointer<Void>.fromAddress(0));
}

/// Indicates the reason for a failure to create [MapMarker3DModel].
enum MapMarker3DModelInstantiationErrorCode {
    /// The provided [Mesh] does not contain texture coordinates.
    missingTextureCoordinates
}

// MapMarker3DModelInstantiationErrorCode "private" section, not exported.

int sdkMapviewMapmarker3dmodelInstantiationerrorcodeToFfi(MapMarker3DModelInstantiationErrorCode value) {
  switch (value) {
  case MapMarker3DModelInstantiationErrorCode.missingTextureCoordinates:
    return 0;
  default:
    throw StateError("Invalid enum value $value for MapMarker3DModelInstantiationErrorCode enum.");
  }
}

MapMarker3DModelInstantiationErrorCode sdkMapviewMapmarker3dmodelInstantiationerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MapMarker3DModelInstantiationErrorCode.missingTextureCoordinates;
  default:
    throw StateError("Invalid numeric value $handle for MapMarker3DModelInstantiationErrorCode enum.");
  }
}

void sdkMapviewMapmarker3dmodelInstantiationerrorcodeReleaseFfiHandle(int handle) {}

final _sdkMapviewMapmarker3dmodelInstantiationerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapMarker3DModel_InstantiationErrorCode_create_handle_nullable'));
final _sdkMapviewMapmarker3dmodelInstantiationerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_InstantiationErrorCode_release_handle_nullable'));
final _sdkMapviewMapmarker3dmodelInstantiationerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdkMapviewMapmarker3dmodelInstantiationerrorcodeToFfiNullable(MapMarker3DModelInstantiationErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapmarker3dmodelInstantiationerrorcodeToFfi(value);
  final result = _sdkMapviewMapmarker3dmodelInstantiationerrorcodeCreateHandleNullable(_handle);
  sdkMapviewMapmarker3dmodelInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

MapMarker3DModelInstantiationErrorCode? sdkMapviewMapmarker3dmodelInstantiationerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapmarker3dmodelInstantiationerrorcodeGetValueNullable(handle);
  final result = sdkMapviewMapmarker3dmodelInstantiationerrorcodeFromFfi(_handle);
  sdkMapviewMapmarker3dmodelInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapmarker3dmodelInstantiationerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmarker3dmodelInstantiationerrorcodeReleaseHandleNullable(handle);

// End of MapMarker3DModelInstantiationErrorCode "private" section.
/// Thrown when a problem occurs while trying to create [MapMarker3DModel].
class MapMarker3DModelInstantiationException implements Exception {
  final MapMarker3DModelInstantiationErrorCode error;
  MapMarker3DModelInstantiationException(this.error);
}

// MapMarker3DModel "private" section, not exported.

final _sdkMapviewMapmarker3dmodelRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapMarker3DModel_register_finalizer'));
final _sdkMapviewMapmarker3dmodelCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_copy_handle'));
final _sdkMapviewMapmarker3dmodelReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_release_handle'));



final _fromMeshWithTextureFilePathAndColorsdkMapviewMapmarker3dmodelMakeMeshStringColorReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_make__Mesh_String_Color_return_release_handle'));
final _fromMeshWithTextureFilePathAndColorsdkMapviewMapmarker3dmodelMakeMeshStringColorReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_make__Mesh_String_Color_return_get_result'));
final _fromMeshWithTextureFilePathAndColorsdkMapviewMapmarker3dmodelMakeMeshStringColorReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_make__Mesh_String_Color_return_get_error'));
final _fromMeshWithTextureFilePathAndColorsdkMapviewMapmarker3dmodelMakeMeshStringColorReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_make__Mesh_String_Color_return_has_error'));



final _fromMeshWithTextureFilePathsdkMapviewMapmarker3dmodelMakeMeshStringReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_make__Mesh_String_return_release_handle'));
final _fromMeshWithTextureFilePathsdkMapviewMapmarker3dmodelMakeMeshStringReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_make__Mesh_String_return_get_result'));
final _fromMeshWithTextureFilePathsdkMapviewMapmarker3dmodelMakeMeshStringReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_make__Mesh_String_return_get_error'));
final _fromMeshWithTextureFilePathsdkMapviewMapmarker3dmodelMakeMeshStringReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarker3DModel_make__Mesh_String_return_has_error'));




/// @nodoc
@visibleForTesting
class MapMarker3DModel$Impl extends __lib.NativeBase implements MapMarker3DModel {

  MapMarker3DModel$Impl(Pointer<Void> handle) : super(handle);


  MapMarker3DModel withTextureFilePathAndColor(String geometryFilePath, String textureFilePath, ui.Color color) {
    final _result_handle = _withTextureFilePathAndColor(geometryFilePath, textureFilePath, color);
    final _result = MapMarker3DModel$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapmarker3dmodelRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapMarker3DModel fromMeshWithTextureFilePathAndColor(Mesh mesh, String textureFilePath, ui.Color color) {
    final _result_handle = _fromMeshWithTextureFilePathAndColor(mesh, textureFilePath, color);
    final _result = MapMarker3DModel$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapmarker3dmodelRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapMarker3DModel withTextureFilePath(String geometryFilePath, String textureFilePath) {
    final _result_handle = _withTextureFilePath(geometryFilePath, textureFilePath);
    final _result = MapMarker3DModel$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapmarker3dmodelRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapMarker3DModel fromMeshWithTextureFilePath(Mesh mesh, String textureFilePath) {
    final _result_handle = _fromMeshWithTextureFilePath(mesh, textureFilePath);
    final _result = MapMarker3DModel$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapmarker3dmodelRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapMarker3DModel $init(String geometryFilePath) {
    final _result_handle = _$init(geometryFilePath);
    final _result = MapMarker3DModel$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapmarker3dmodelRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapMarker3DModel fromMesh(Mesh mesh) {
    final _result_handle = _fromMesh(mesh);
    final _result = MapMarker3DModel$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapmarker3dmodelRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _withTextureFilePathAndColor(String geometryFilePath, String textureFilePath, ui.Color color) {
    final _withTextureFilePathAndColorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3DModel_make__String_String_Color'));
    final _geometryFilePathHandle = stringToFfi(geometryFilePath);
    final _textureFilePathHandle = stringToFfi(textureFilePath);
    final _colorHandle = sdkCoreColorToFfi(color);
    final __resultHandle = _withTextureFilePathAndColorFfi(__lib.LibraryContext.isolateId, _geometryFilePathHandle, _textureFilePathHandle, _colorHandle);
    stringReleaseFfiHandle(_geometryFilePathHandle);
    stringReleaseFfiHandle(_textureFilePathHandle);
    sdkCoreColorReleaseFfiHandle(_colorHandle);
    return __resultHandle;
  }

  static Pointer<Void> _fromMeshWithTextureFilePathAndColor(Mesh mesh, String textureFilePath, ui.Color color) {
    final _fromMeshWithTextureFilePathAndColorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3DModel_make__Mesh_String_Color'));
    final _meshHandle = sdkMapviewMeshToFfi(mesh);
    final _textureFilePathHandle = stringToFfi(textureFilePath);
    final _colorHandle = sdkCoreColorToFfi(color);
    final __callResultHandle = _fromMeshWithTextureFilePathAndColorFfi(__lib.LibraryContext.isolateId, _meshHandle, _textureFilePathHandle, _colorHandle);
    sdkMapviewMeshReleaseFfiHandle(_meshHandle);
    stringReleaseFfiHandle(_textureFilePathHandle);
    sdkCoreColorReleaseFfiHandle(_colorHandle);
    if (_fromMeshWithTextureFilePathAndColorsdkMapviewMapmarker3dmodelMakeMeshStringColorReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _fromMeshWithTextureFilePathAndColorsdkMapviewMapmarker3dmodelMakeMeshStringColorReturnGetError(__callResultHandle);
        _fromMeshWithTextureFilePathAndColorsdkMapviewMapmarker3dmodelMakeMeshStringColorReturnReleaseHandle(__callResultHandle);
        try {
          throw MapMarker3DModelInstantiationException(sdkMapviewMapmarker3dmodelInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapmarker3dmodelInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _fromMeshWithTextureFilePathAndColorsdkMapviewMapmarker3dmodelMakeMeshStringColorReturnGetResult(__callResultHandle);
    _fromMeshWithTextureFilePathAndColorsdkMapviewMapmarker3dmodelMakeMeshStringColorReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withTextureFilePath(String geometryFilePath, String textureFilePath) {
    final _withTextureFilePathFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3DModel_make__String_String'));
    final _geometryFilePathHandle = stringToFfi(geometryFilePath);
    final _textureFilePathHandle = stringToFfi(textureFilePath);
    final __resultHandle = _withTextureFilePathFfi(__lib.LibraryContext.isolateId, _geometryFilePathHandle, _textureFilePathHandle);
    stringReleaseFfiHandle(_geometryFilePathHandle);
    stringReleaseFfiHandle(_textureFilePathHandle);
    return __resultHandle;
  }

  static Pointer<Void> _fromMeshWithTextureFilePath(Mesh mesh, String textureFilePath) {
    final _fromMeshWithTextureFilePathFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3DModel_make__Mesh_String'));
    final _meshHandle = sdkMapviewMeshToFfi(mesh);
    final _textureFilePathHandle = stringToFfi(textureFilePath);
    final __callResultHandle = _fromMeshWithTextureFilePathFfi(__lib.LibraryContext.isolateId, _meshHandle, _textureFilePathHandle);
    sdkMapviewMeshReleaseFfiHandle(_meshHandle);
    stringReleaseFfiHandle(_textureFilePathHandle);
    if (_fromMeshWithTextureFilePathsdkMapviewMapmarker3dmodelMakeMeshStringReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _fromMeshWithTextureFilePathsdkMapviewMapmarker3dmodelMakeMeshStringReturnGetError(__callResultHandle);
        _fromMeshWithTextureFilePathsdkMapviewMapmarker3dmodelMakeMeshStringReturnReleaseHandle(__callResultHandle);
        try {
          throw MapMarker3DModelInstantiationException(sdkMapviewMapmarker3dmodelInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapmarker3dmodelInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _fromMeshWithTextureFilePathsdkMapviewMapmarker3dmodelMakeMeshStringReturnGetResult(__callResultHandle);
    _fromMeshWithTextureFilePathsdkMapviewMapmarker3dmodelMakeMeshStringReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _$init(String geometryFilePath) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3DModel_make__String'));
    final _geometryFilePathHandle = stringToFfi(geometryFilePath);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _geometryFilePathHandle);
    stringReleaseFfiHandle(_geometryFilePathHandle);
    return __resultHandle;
  }

  static Pointer<Void> _fromMesh(Mesh mesh) {
    final _fromMeshFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarker3DModel_make__Mesh'));
    final _meshHandle = sdkMapviewMeshToFfi(mesh);
    final __resultHandle = _fromMeshFfi(__lib.LibraryContext.isolateId, _meshHandle);
    sdkMapviewMeshReleaseFfiHandle(_meshHandle);
    return __resultHandle;
  }


}

Pointer<Void> sdkMapviewMapmarker3dmodelToFfi(MapMarker3DModel value) =>
  _sdkMapviewMapmarker3dmodelCopyHandle((value as __lib.NativeBase).handle);

MapMarker3DModel sdkMapviewMapmarker3dmodelFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapMarker3DModel) return instance;

  final _copiedHandle = _sdkMapviewMapmarker3dmodelCopyHandle(handle);
  final result = MapMarker3DModel$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapmarker3dmodelRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapmarker3dmodelReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapmarker3dmodelReleaseHandle(handle);

Pointer<Void> sdkMapviewMapmarker3dmodelToFfiNullable(MapMarker3DModel? value) =>
  value != null ? sdkMapviewMapmarker3dmodelToFfi(value) : Pointer<Void>.fromAddress(0);

MapMarker3DModel? sdkMapviewMapmarker3dmodelFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapmarker3dmodelFromFfi(handle) : null;

void sdkMapviewMapmarker3dmodelReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmarker3dmodelReleaseHandle(handle);

// End of MapMarker3DModel "private" section.


