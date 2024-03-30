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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/mapview/datasource/tile_url_provider_callback.dart';
import 'package:meta/meta.dart';

/// Factory for generating a [TileUrlProviderCallback] utilized in creating a tile URL.
abstract class TileUrlProviderFactory {

  /// Creates [TileUrlProviderCallback] for the given URL template.
  ///
  /// A url template should look like this 'https://TestRasterTileService.com/{z}/{x}/{y}/'
  /// here the z parameter is the storage level, x and y define the location of the tile.
  /// The valid range for X and Y is from 0 to 2^level − 1.
  ///
  /// [urlTemplate] The url template
  ///
  /// Returns [TileUrlProviderCallback?]. `null` if the provided template is not valid xyz url type.
  ///
  static TileUrlProviderCallback? fromXyzUrlTemplate(String urlTemplate) => $prototype.fromXyzUrlTemplate(urlTemplate);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = TileUrlProviderFactory$Impl(Pointer<Void>.fromAddress(0));
}


// TileUrlProviderFactory "private" section, not exported.

final _sdkMapviewDatasourceTileurlproviderfactoryRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_datasource_TileUrlProviderFactory_register_finalizer'));
final _sdkMapviewDatasourceTileurlproviderfactoryCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_TileUrlProviderFactory_copy_handle'));
final _sdkMapviewDatasourceTileurlproviderfactoryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_TileUrlProviderFactory_release_handle'));



/// @nodoc
@visibleForTesting
class TileUrlProviderFactory$Impl extends __lib.NativeBase implements TileUrlProviderFactory {

  TileUrlProviderFactory$Impl(Pointer<Void> handle) : super(handle);

  TileUrlProviderCallback? fromXyzUrlTemplate(String urlTemplate) {
    final _fromXyzUrlTemplateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_datasource_TileUrlProviderFactory_fromXyzUrlTemplate__String'));
    final _urlTemplateHandle = stringToFfi(urlTemplate);
    final __resultHandle = _fromXyzUrlTemplateFfi(__lib.LibraryContext.isolateId, _urlTemplateHandle);
    stringReleaseFfiHandle(_urlTemplateHandle);
    try {
      return sdkMapviewDatasourceTileurlprovidercallbackFromFfiNullable(__resultHandle);
    } finally {
      sdkMapviewDatasourceTileurlprovidercallbackReleaseFfiHandleNullable(__resultHandle);

    }

  }


}

Pointer<Void> sdkMapviewDatasourceTileurlproviderfactoryToFfi(TileUrlProviderFactory value) =>
  _sdkMapviewDatasourceTileurlproviderfactoryCopyHandle((value as __lib.NativeBase).handle);

TileUrlProviderFactory sdkMapviewDatasourceTileurlproviderfactoryFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TileUrlProviderFactory) return instance;

  final _copiedHandle = _sdkMapviewDatasourceTileurlproviderfactoryCopyHandle(handle);
  final result = TileUrlProviderFactory$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewDatasourceTileurlproviderfactoryRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewDatasourceTileurlproviderfactoryReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewDatasourceTileurlproviderfactoryReleaseHandle(handle);

Pointer<Void> sdkMapviewDatasourceTileurlproviderfactoryToFfiNullable(TileUrlProviderFactory? value) =>
  value != null ? sdkMapviewDatasourceTileurlproviderfactoryToFfi(value) : Pointer<Void>.fromAddress(0);

TileUrlProviderFactory? sdkMapviewDatasourceTileurlproviderfactoryFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewDatasourceTileurlproviderfactoryFromFfi(handle) : null;

void sdkMapviewDatasourceTileurlproviderfactoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewDatasourceTileurlproviderfactoryReleaseHandle(handle);

// End of TileUrlProviderFactory "private" section.


