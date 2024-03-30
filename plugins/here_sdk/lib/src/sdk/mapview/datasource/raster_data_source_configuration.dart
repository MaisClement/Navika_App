// Copyright (c) 2019 HERE Global B.V. and its affiliate(s).
// All rights reserved.
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.

import 'dart:ffi';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/mapview/datasource/tile_url_provider_callback.dart';
import 'package:here_sdk/src/sdk/mapview/datasource/tiling_scheme.dart';

/// Configuration for a RasterDataSource.

class RasterDataSourceConfiguration {
  /// The name of the data source.
  String name;

  /// Data provider configuration.
  RasterDataSourceProviderConfiguration provider;

  /// Local cache configuration.
  RasterDataSourceCacheConfiguration cache;

  /// A flag indicating whether expired data should be ignored until refreshed. Default value is false.
  bool ignoreExpiredData;

  /// Creates a new instance.
  /// [name] The name of the data source.
  /// [provider] Data provider configuration.
  /// [cache] Local cache configuration.
  RasterDataSourceConfiguration.withDefaults(this.name, this.provider, this.cache)
      : ignoreExpiredData = false;
  /// Creates a new instance.
  /// [name] The name of the data source.
  /// [provider] Data provider configuration.
  /// [cache] Local cache configuration.
  /// [ignoreExpiredData] A flag indicating whether expired data should be ignored until refreshed. Default value is false.
  RasterDataSourceConfiguration(this.name, this.provider, this.cache, this.ignoreExpiredData);
}

/// Configuration of a data provider.

class RasterDataSourceProviderConfiguration {
  /// Provides a function that generates URLs based on tile coordinates and storage level.
  TileUrlProviderCallback urlProvider;

  /// The tiling scheme used by this source.
  TilingScheme tilingScheme;

  /// The storage levels available for this data source. Supported range \[0, 31\].
  /// At least one level must be available for this provider to be used as a source of data.
  /// At storage level zero, the whole world is represented by one tile. At storage level 1
  /// the world is split in 2x2 tiles (or in 2x1 tiles, depending on the tiling scheme).
  /// The tiling process continues in this fashion until sufficient granularity has been
  /// achieved. In the XYZ addresing scheme for tiles, z value of the tile key coresponds
  /// to the storage level.
  /// Depending on the available storage levels and the given camera zoom level, the
  /// appropriate z value of the tile key will be determined.
  List<int> storageLevels;

  /// A flag indicating whether the image content contains an alpha channel for transparency. Default value is false.
  bool hasAlphaChannel;

  /// The optional name-value pairs specifying HTTP headers that are passed with each tile request.
  Map<String, String>? headers;

  /// Creates a new instance.
  /// [urlProvider] Provides a function that generates URLs based on tile coordinates and storage level.
  /// [tilingScheme] The tiling scheme used by this source.
  /// [storageLevels] The storage levels available for this data source. Supported range \[0, 31\].
  /// At least one level must be available for this provider to be used as a source of data.
  /// At storage level zero, the whole world is represented by one tile. At storage level 1
  /// the world is split in 2x2 tiles (or in 2x1 tiles, depending on the tiling scheme).
  /// The tiling process continues in this fashion until sufficient granularity has been
  /// achieved. In the XYZ addresing scheme for tiles, z value of the tile key coresponds
  /// to the storage level.
  /// Depending on the available storage levels and the given camera zoom level, the
  /// appropriate z value of the tile key will be determined.
  /// [hasAlphaChannel] A flag indicating whether the image content contains an alpha channel for transparency. Default value is false.
  /// [headers] The optional name-value pairs specifying HTTP headers that are passed with each tile request.
  RasterDataSourceProviderConfiguration.Default(this.urlProvider, this.tilingScheme, this.storageLevels, this.hasAlphaChannel, this.headers);
  /// Creates a new instance.
  /// [urlProvider] Provides a function that generates URLs based on tile coordinates and storage level.
  /// [tilingScheme] The tiling scheme used by this source.
  /// [storageLevels] The storage levels available for this data source. Supported range \[0, 31\].
  /// At least one level must be available for this provider to be used as a source of data.
  /// At storage level zero, the whole world is represented by one tile. At storage level 1
  /// the world is split in 2x2 tiles (or in 2x1 tiles, depending on the tiling scheme).
  /// The tiling process continues in this fashion until sufficient granularity has been
  /// achieved. In the XYZ addresing scheme for tiles, z value of the tile key coresponds
  /// to the storage level.
  /// Depending on the available storage levels and the given camera zoom level, the
  /// appropriate z value of the tile key will be determined.
  RasterDataSourceProviderConfiguration.withDefaults(this.urlProvider, this.tilingScheme, this.storageLevels)
      : hasAlphaChannel = false, headers = null;
}


// RasterDataSourceProviderConfiguration "private" section, not exported.

final _sdkMapviewDatasourceRasterdatasourceconfigurationProviderCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint32, Pointer<Void>, Uint8, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, int, Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Provider_create_handle'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationProviderReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Provider_release_handle'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationProviderGetFieldurlProvider = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Provider_get_field_urlProvider'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationProviderGetFieldtilingScheme = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Provider_get_field_tilingScheme'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationProviderGetFieldstorageLevels = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Provider_get_field_storageLevels'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationProviderGetFieldhasAlphaChannel = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Provider_get_field_hasAlphaChannel'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationProviderGetFieldheaders = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Provider_get_field_headers'));



Pointer<Void> sdkMapviewDatasourceRasterdatasourceconfigurationProviderToFfi(RasterDataSourceProviderConfiguration value) {
  final _urlProviderHandle = sdkMapviewDatasourceTileurlprovidercallbackToFfi(value.urlProvider);
  final _tilingSchemeHandle = sdkMapviewDatasourceTilingschemeToFfi(value.tilingScheme);
  final _storageLevelsHandle = harpPluginsRasterBindingslistofIntToFfi(value.storageLevels);
  final _hasAlphaChannelHandle = booleanToFfi(value.hasAlphaChannel);
  final _headersHandle = harpPluginsRasterBindingsmapofStringToStringToFfiNullable(value.headers);
  final _result = _sdkMapviewDatasourceRasterdatasourceconfigurationProviderCreateHandle(_urlProviderHandle, _tilingSchemeHandle, _storageLevelsHandle, _hasAlphaChannelHandle, _headersHandle);
  sdkMapviewDatasourceTileurlprovidercallbackReleaseFfiHandle(_urlProviderHandle);
  sdkMapviewDatasourceTilingschemeReleaseFfiHandle(_tilingSchemeHandle);
  harpPluginsRasterBindingslistofIntReleaseFfiHandle(_storageLevelsHandle);
  booleanReleaseFfiHandle(_hasAlphaChannelHandle);
  harpPluginsRasterBindingsmapofStringToStringReleaseFfiHandleNullable(_headersHandle);
  return _result;
}

RasterDataSourceProviderConfiguration sdkMapviewDatasourceRasterdatasourceconfigurationProviderFromFfi(Pointer<Void> handle) {
  final _urlProviderHandle = _sdkMapviewDatasourceRasterdatasourceconfigurationProviderGetFieldurlProvider(handle);
  final _tilingSchemeHandle = _sdkMapviewDatasourceRasterdatasourceconfigurationProviderGetFieldtilingScheme(handle);
  final _storageLevelsHandle = _sdkMapviewDatasourceRasterdatasourceconfigurationProviderGetFieldstorageLevels(handle);
  final _hasAlphaChannelHandle = _sdkMapviewDatasourceRasterdatasourceconfigurationProviderGetFieldhasAlphaChannel(handle);
  final _headersHandle = _sdkMapviewDatasourceRasterdatasourceconfigurationProviderGetFieldheaders(handle);
  try {
    return RasterDataSourceProviderConfiguration.Default(
      sdkMapviewDatasourceTileurlprovidercallbackFromFfi(_urlProviderHandle), 
      sdkMapviewDatasourceTilingschemeFromFfi(_tilingSchemeHandle), 
      harpPluginsRasterBindingslistofIntFromFfi(_storageLevelsHandle), 
      booleanFromFfi(_hasAlphaChannelHandle), 
      harpPluginsRasterBindingsmapofStringToStringFromFfiNullable(_headersHandle)
    );
  } finally {
    sdkMapviewDatasourceTileurlprovidercallbackReleaseFfiHandle(_urlProviderHandle);
    sdkMapviewDatasourceTilingschemeReleaseFfiHandle(_tilingSchemeHandle);
    harpPluginsRasterBindingslistofIntReleaseFfiHandle(_storageLevelsHandle);
    booleanReleaseFfiHandle(_hasAlphaChannelHandle);
    harpPluginsRasterBindingsmapofStringToStringReleaseFfiHandleNullable(_headersHandle);
  }
}

void sdkMapviewDatasourceRasterdatasourceconfigurationProviderReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewDatasourceRasterdatasourceconfigurationProviderReleaseHandle(handle);

// Nullable RasterDataSourceProviderConfiguration

final _sdkMapviewDatasourceRasterdatasourceconfigurationProviderCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Provider_create_handle_nullable'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationProviderReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Provider_release_handle_nullable'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationProviderGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Provider_get_value_nullable'));

Pointer<Void> sdkMapviewDatasourceRasterdatasourceconfigurationProviderToFfiNullable(RasterDataSourceProviderConfiguration? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewDatasourceRasterdatasourceconfigurationProviderToFfi(value);
  final result = _sdkMapviewDatasourceRasterdatasourceconfigurationProviderCreateHandleNullable(_handle);
  sdkMapviewDatasourceRasterdatasourceconfigurationProviderReleaseFfiHandle(_handle);
  return result;
}

RasterDataSourceProviderConfiguration? sdkMapviewDatasourceRasterdatasourceconfigurationProviderFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewDatasourceRasterdatasourceconfigurationProviderGetValueNullable(handle);
  final result = sdkMapviewDatasourceRasterdatasourceconfigurationProviderFromFfi(_handle);
  sdkMapviewDatasourceRasterdatasourceconfigurationProviderReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewDatasourceRasterdatasourceconfigurationProviderReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewDatasourceRasterdatasourceconfigurationProviderReleaseHandleNullable(handle);

// End of RasterDataSourceProviderConfiguration "private" section.
/// Configuration of a local data cache.

class RasterDataSourceCacheConfiguration {
  /// The path to the directory to use for the cache. By default, the map gets initialized with a
  /// data path which can be fetched from `SDKOptions.cachePath`. The cache will be relative to this path,
  /// unless an absolute path is provided. The cache can be stored in an internal/external storage as long
  /// as the app has read/write permissions.
  /// Empty string means the data path will be used for caching.
  /// If the provided path, either as absolute path or as relative path is invalid,
  /// then caching will be disabled.
  /// There is no contraint regarding the existence of the path. If the path does not exist
  /// but is valid, it will be created.
  String path;

  /// The maximum size to use on disk for the cache, in bytes. Default is 32 MiB.
  /// This cache is independent from the map cache as defined via `SDKOptions`.
  /// Its size is only limited by the total device storage capacity.
  int diskSize;

  /// Constructs a Cache object from the provided path and a default cache size of 32 MiB.
  /// [path] The path to the directory to use for the cache. By default, the map gets initialized with a
  /// data path which can be fetched from `SDKOptions.cachePath`. The cache will be relative to this path,
  /// unless an absolute path is provided. The cache can be stored in an internal/external storage as long
  /// as the app has read/write permissions.
  /// Empty string means the data path will be used for caching.
  /// If the provided path, either as absolute path or as relative path is invalid,
  /// then caching will be disabled.
  /// There is no contraint regarding the existence of the path. If the path does not exist
  /// but is valid, it will be created.
  RasterDataSourceCacheConfiguration.withDefaults(this.path)
      : diskSize = 33554432;
  /// Constructs a Cache object from the provided path and cache size.
  /// [path] The path to the directory to use for the cache. By default, the map gets initialized with a
  /// data path which can be fetched from `SDKOptions.cachePath`. The cache will be relative to this path,
  /// unless an absolute path is provided. The cache can be stored in an internal/external storage as long
  /// as the app has read/write permissions.
  /// Empty string means the data path will be used for caching.
  /// If the provided path, either as absolute path or as relative path is invalid,
  /// then caching will be disabled.
  /// There is no contraint regarding the existence of the path. If the path does not exist
  /// but is valid, it will be created.
  /// [diskSize] The maximum size to use on disk for the cache, in bytes. Default is 32 MiB.
  /// This cache is independent from the map cache as defined via `SDKOptions`.
  /// Its size is only limited by the total device storage capacity.
  RasterDataSourceCacheConfiguration(this.path, this.diskSize);
}


// RasterDataSourceCacheConfiguration "private" section, not exported.

final _sdkMapviewDatasourceRasterdatasourceconfigurationCacheCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int64),
    Pointer<Void> Function(Pointer<Void>, int)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Cache_create_handle'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationCacheReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Cache_release_handle'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationCacheGetFieldpath = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Cache_get_field_path'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationCacheGetFielddiskSize = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Cache_get_field_diskSize'));



Pointer<Void> sdkMapviewDatasourceRasterdatasourceconfigurationCacheToFfi(RasterDataSourceCacheConfiguration value) {
  final _pathHandle = stringToFfi(value.path);
  final _diskSizeHandle = (value.diskSize);
  final _result = _sdkMapviewDatasourceRasterdatasourceconfigurationCacheCreateHandle(_pathHandle, _diskSizeHandle);
  stringReleaseFfiHandle(_pathHandle);
  
  return _result;
}

RasterDataSourceCacheConfiguration sdkMapviewDatasourceRasterdatasourceconfigurationCacheFromFfi(Pointer<Void> handle) {
  final _pathHandle = _sdkMapviewDatasourceRasterdatasourceconfigurationCacheGetFieldpath(handle);
  final _diskSizeHandle = _sdkMapviewDatasourceRasterdatasourceconfigurationCacheGetFielddiskSize(handle);
  try {
    return RasterDataSourceCacheConfiguration(
      stringFromFfi(_pathHandle), 
      (_diskSizeHandle)
    );
  } finally {
    stringReleaseFfiHandle(_pathHandle);
    
  }
}

void sdkMapviewDatasourceRasterdatasourceconfigurationCacheReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewDatasourceRasterdatasourceconfigurationCacheReleaseHandle(handle);

// Nullable RasterDataSourceCacheConfiguration

final _sdkMapviewDatasourceRasterdatasourceconfigurationCacheCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Cache_create_handle_nullable'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationCacheReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Cache_release_handle_nullable'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationCacheGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_Cache_get_value_nullable'));

Pointer<Void> sdkMapviewDatasourceRasterdatasourceconfigurationCacheToFfiNullable(RasterDataSourceCacheConfiguration? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewDatasourceRasterdatasourceconfigurationCacheToFfi(value);
  final result = _sdkMapviewDatasourceRasterdatasourceconfigurationCacheCreateHandleNullable(_handle);
  sdkMapviewDatasourceRasterdatasourceconfigurationCacheReleaseFfiHandle(_handle);
  return result;
}

RasterDataSourceCacheConfiguration? sdkMapviewDatasourceRasterdatasourceconfigurationCacheFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewDatasourceRasterdatasourceconfigurationCacheGetValueNullable(handle);
  final result = sdkMapviewDatasourceRasterdatasourceconfigurationCacheFromFfi(_handle);
  sdkMapviewDatasourceRasterdatasourceconfigurationCacheReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewDatasourceRasterdatasourceconfigurationCacheReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewDatasourceRasterdatasourceconfigurationCacheReleaseHandleNullable(handle);

// End of RasterDataSourceCacheConfiguration "private" section.

// RasterDataSourceConfiguration "private" section, not exported.

final _sdkMapviewDatasourceRasterdatasourceconfigurationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint8),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_create_handle'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_release_handle'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationGetFieldname = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_get_field_name'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationGetFieldprovider = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_get_field_provider'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationGetFieldcache = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_get_field_cache'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationGetFieldignoreExpiredData = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_get_field_ignoreExpiredData'));



Pointer<Void> sdkMapviewDatasourceRasterdatasourceconfigurationToFfi(RasterDataSourceConfiguration value) {
  final _nameHandle = stringToFfi(value.name);
  final _providerHandle = sdkMapviewDatasourceRasterdatasourceconfigurationProviderToFfi(value.provider);
  final _cacheHandle = sdkMapviewDatasourceRasterdatasourceconfigurationCacheToFfi(value.cache);
  final _ignoreExpiredDataHandle = booleanToFfi(value.ignoreExpiredData);
  final _result = _sdkMapviewDatasourceRasterdatasourceconfigurationCreateHandle(_nameHandle, _providerHandle, _cacheHandle, _ignoreExpiredDataHandle);
  stringReleaseFfiHandle(_nameHandle);
  sdkMapviewDatasourceRasterdatasourceconfigurationProviderReleaseFfiHandle(_providerHandle);
  sdkMapviewDatasourceRasterdatasourceconfigurationCacheReleaseFfiHandle(_cacheHandle);
  booleanReleaseFfiHandle(_ignoreExpiredDataHandle);
  return _result;
}

RasterDataSourceConfiguration sdkMapviewDatasourceRasterdatasourceconfigurationFromFfi(Pointer<Void> handle) {
  final _nameHandle = _sdkMapviewDatasourceRasterdatasourceconfigurationGetFieldname(handle);
  final _providerHandle = _sdkMapviewDatasourceRasterdatasourceconfigurationGetFieldprovider(handle);
  final _cacheHandle = _sdkMapviewDatasourceRasterdatasourceconfigurationGetFieldcache(handle);
  final _ignoreExpiredDataHandle = _sdkMapviewDatasourceRasterdatasourceconfigurationGetFieldignoreExpiredData(handle);
  try {
    return RasterDataSourceConfiguration(
      stringFromFfi(_nameHandle), 
      sdkMapviewDatasourceRasterdatasourceconfigurationProviderFromFfi(_providerHandle), 
      sdkMapviewDatasourceRasterdatasourceconfigurationCacheFromFfi(_cacheHandle), 
      booleanFromFfi(_ignoreExpiredDataHandle)
    );
  } finally {
    stringReleaseFfiHandle(_nameHandle);
    sdkMapviewDatasourceRasterdatasourceconfigurationProviderReleaseFfiHandle(_providerHandle);
    sdkMapviewDatasourceRasterdatasourceconfigurationCacheReleaseFfiHandle(_cacheHandle);
    booleanReleaseFfiHandle(_ignoreExpiredDataHandle);
  }
}

void sdkMapviewDatasourceRasterdatasourceconfigurationReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewDatasourceRasterdatasourceconfigurationReleaseHandle(handle);

// Nullable RasterDataSourceConfiguration

final _sdkMapviewDatasourceRasterdatasourceconfigurationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_create_handle_nullable'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_release_handle_nullable'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfiguration_get_value_nullable'));

Pointer<Void> sdkMapviewDatasourceRasterdatasourceconfigurationToFfiNullable(RasterDataSourceConfiguration? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewDatasourceRasterdatasourceconfigurationToFfi(value);
  final result = _sdkMapviewDatasourceRasterdatasourceconfigurationCreateHandleNullable(_handle);
  sdkMapviewDatasourceRasterdatasourceconfigurationReleaseFfiHandle(_handle);
  return result;
}

RasterDataSourceConfiguration? sdkMapviewDatasourceRasterdatasourceconfigurationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewDatasourceRasterdatasourceconfigurationGetValueNullable(handle);
  final result = sdkMapviewDatasourceRasterdatasourceconfigurationFromFfi(_handle);
  sdkMapviewDatasourceRasterdatasourceconfigurationReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewDatasourceRasterdatasourceconfigurationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewDatasourceRasterdatasourceconfigurationReleaseHandleNullable(handle);

// End of RasterDataSourceConfiguration "private" section.


