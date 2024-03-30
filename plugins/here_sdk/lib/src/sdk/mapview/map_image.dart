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
import 'dart:typed_data';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/mapview/image_format.dart';
import 'package:meta/meta.dart';

/// Represents a drawable resource that can be used by a [MapMarker], [MapMarker3D] or [MapImageOverlay] to be shown on the map.
///
/// It is recommended to associate a resource with a single [MapImage] instance in order to enable
/// resource sharing and reduce the amount of needed memory.
abstract class MapImage {
  /// Creates a new map image from the provided image data.
  ///
  /// Currently only [ImageFormat.png]
  /// is accepted.
  ///
  /// [pixelData] Data to be used for the image. The bytes of a PNG image datastream are expected as
  /// defined in https://www.w3.org/TR/PNG
  ///
  /// [imageFormat] The format of the image data to be used.
  ///
  factory MapImage.withPixelDataAndImageFormat(Uint8List pixelData, ImageFormat imageFormat) => $prototype.withPixelDataAndImageFormat(pixelData, imageFormat);
  /// Creates a new map image from the provided image data.
  ///
  /// [imageData] Data to be used for the image. For image format [ImageFormat.svg] the bytes
  /// of a UTF-8 encoded string in SVG Tiny format are expected. For the format specification
  /// see https://www.w3.org/TR/SVGTiny12
  ///
  /// [imageFormat] The format of the image data to be used.
  ///
  /// [width] The width of the image in pixels.
  ///
  /// [height] The height of the image in pixels.
  ///
  factory MapImage.withImageDataImageFormatWidthAndHeight(Uint8List imageData, ImageFormat imageFormat, int width, int height) => $prototype.withImageDataImageFormatWidthAndHeight(imageData, imageFormat, width, height);
  /// Creates a new map image from the provided path to the SVG Tiny or PNG image.
  ///
  /// Will throw an error
  /// if either the height or width equals zero or the path is empty. Trying to load the data that is
  /// not compliant with SVG Tiny or PNG could result in an undefined behavior.
  /// The caller must ensure that the file remains accessible for the entire duration of its usage by the
  /// SDK. If that cannot be ensured, then it is recommended to either copy the file to a location that
  /// remains accessible for the entire duration of its usage by the SDK or load and pass the file content
  /// to one of the [MapImage] constructors that creates instances out of image data
  /// ([MapImage.withPixelDataAndImageFormat], [MapImage.withImageDataImageFormatWidthAndHeight]).}
  ///
  /// Please note that on iOS, file paths that originate, for example from a file picker (like `FilePicker`)
  /// can be deleted by the system while the application is still running.
  ///
  /// [filePath] The path to image file.
  ///
  /// [width] The width of image in pixels.
  ///
  /// [height] The height of image in pixels.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory MapImage.withFilePathAndWidthAndHeight(String filePath, int width, int height) => $prototype.withFilePathAndWidthAndHeight(filePath, width, height);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapImage$Impl(Pointer<Void>.fromAddress(0));
}


// MapImage "private" section, not exported.

final _sdkMapviewMapimageRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapImage_register_finalizer'));
final _sdkMapviewMapimageCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_copy_handle'));
final _sdkMapviewMapimageReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_release_handle'));




final _withFilePathAndWidthAndHeightsdkMapviewMapimageMakeStringUintUintReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_release_handle'));
final _withFilePathAndWidthAndHeightsdkMapviewMapimageMakeStringUintUintReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_get_result'));
final _withFilePathAndWidthAndHeightsdkMapviewMapimageMakeStringUintUintReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_get_error'));
final _withFilePathAndWidthAndHeightsdkMapviewMapimageMakeStringUintUintReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt_return_has_error'));


/// @nodoc
@visibleForTesting
class MapImage$Impl extends __lib.NativeBase implements MapImage {

  MapImage$Impl(Pointer<Void> handle) : super(handle);


  MapImage withPixelDataAndImageFormat(Uint8List pixelData, ImageFormat imageFormat) {
    final _result_handle = _withPixelDataAndImageFormat(pixelData, imageFormat);
    final _result = MapImage$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapimageRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapImage withImageDataImageFormatWidthAndHeight(Uint8List imageData, ImageFormat imageFormat, int width, int height) {
    final _result_handle = _withImageDataImageFormatWidthAndHeight(imageData, imageFormat, width, height);
    final _result = MapImage$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapimageRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapImage withFilePathAndWidthAndHeight(String filePath, int width, int height) {
    final _result_handle = _withFilePathAndWidthAndHeight(filePath, width, height);
    final _result = MapImage$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapimageRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _withPixelDataAndImageFormat(Uint8List pixelData, ImageFormat imageFormat) {
    final _withPixelDataAndImageFormatFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32), Pointer<Void> Function(int, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapImage_make__Blob_ImageFormat'));
    final _pixelDataHandle = blobToFfi(pixelData);
    final _imageFormatHandle = sdkMapviewImageformatToFfi(imageFormat);
    final __resultHandle = _withPixelDataAndImageFormatFfi(__lib.LibraryContext.isolateId, _pixelDataHandle, _imageFormatHandle);
    blobReleaseFfiHandle(_pixelDataHandle);
    sdkMapviewImageformatReleaseFfiHandle(_imageFormatHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withImageDataImageFormatWidthAndHeight(Uint8List imageData, ImageFormat imageFormat, int width, int height) {
    final _withImageDataImageFormatWidthAndHeightFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int, int)>('here_sdk_sdk_mapview_MapImage_make__Blob_ImageFormat_UInt_UInt'));
    final _imageDataHandle = blobToFfi(imageData);
    final _imageFormatHandle = sdkMapviewImageformatToFfi(imageFormat);
    final _widthHandle = (width);
    final _heightHandle = (height);
    final __resultHandle = _withImageDataImageFormatWidthAndHeightFfi(__lib.LibraryContext.isolateId, _imageDataHandle, _imageFormatHandle, _widthHandle, _heightHandle);
    blobReleaseFfiHandle(_imageDataHandle);
    sdkMapviewImageformatReleaseFfiHandle(_imageFormatHandle);


    return __resultHandle;
  }

  static Pointer<Void> _withFilePathAndWidthAndHeight(String filePath, int width, int height) {
    final _withFilePathAndWidthAndHeightFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapImage_make__String_UInt_UInt'));
    final _filePathHandle = stringToFfi(filePath);
    final _widthHandle = (width);
    final _heightHandle = (height);
    final __callResultHandle = _withFilePathAndWidthAndHeightFfi(__lib.LibraryContext.isolateId, _filePathHandle, _widthHandle, _heightHandle);
    stringReleaseFfiHandle(_filePathHandle);


    if (_withFilePathAndWidthAndHeightsdkMapviewMapimageMakeStringUintUintReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withFilePathAndWidthAndHeightsdkMapviewMapimageMakeStringUintUintReturnGetError(__callResultHandle);
        _withFilePathAndWidthAndHeightsdkMapviewMapimageMakeStringUintUintReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withFilePathAndWidthAndHeightsdkMapviewMapimageMakeStringUintUintReturnGetResult(__callResultHandle);
    _withFilePathAndWidthAndHeightsdkMapviewMapimageMakeStringUintUintReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }


}

Pointer<Void> sdkMapviewMapimageToFfi(MapImage value) =>
  _sdkMapviewMapimageCopyHandle((value as __lib.NativeBase).handle);

MapImage sdkMapviewMapimageFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapImage) return instance;

  final _copiedHandle = _sdkMapviewMapimageCopyHandle(handle);
  final result = MapImage$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapimageRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapimageReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapimageReleaseHandle(handle);

Pointer<Void> sdkMapviewMapimageToFfiNullable(MapImage? value) =>
  value != null ? sdkMapviewMapimageToFfi(value) : Pointer<Void>.fromAddress(0);

MapImage? sdkMapviewMapimageFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapimageFromFfi(handle) : null;

void sdkMapviewMapimageReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapimageReleaseHandle(handle);

// End of MapImage "private" section.


