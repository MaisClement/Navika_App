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

/// Configuration update for a RasterDataSource.

class RasterDataSourceConfigurationUpdate {
  /// Optional update of the provider headers. The new list replaces the current one.
  /// When not set, no change is made to the current list.
  Map<String, String>? providerHeaders;

  /// Optional update of the flag indicating whether expired data should be ignored until refreshed.
  /// When not set, no change is made to the current flag state.
  bool? ignoreExpiredData;

  /// Optional update of the cache disk size, in bytes.
  /// When not set, no change is made to the current value.
  int? cacheDiskSize;

  /// Creates a new instance.
  /// [providerHeaders] Optional update of the provider headers. The new list replaces the current one.
  /// When not set, no change is made to the current list.
  /// [ignoreExpiredData] Optional update of the flag indicating whether expired data should be ignored until refreshed.
  /// When not set, no change is made to the current flag state.
  /// [cacheDiskSize] Optional update of the cache disk size, in bytes.
  /// When not set, no change is made to the current value.
  RasterDataSourceConfigurationUpdate(this.providerHeaders, this.ignoreExpiredData, this.cacheDiskSize);
}


// RasterDataSourceConfigurationUpdate "private" section, not exported.

final _sdkMapviewDatasourceRasterdatasourceconfigurationupdateCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfigurationUpdate_create_handle'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationupdateReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfigurationUpdate_release_handle'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationupdateGetFieldproviderHeaders = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfigurationUpdate_get_field_providerHeaders'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationupdateGetFieldignoreExpiredData = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfigurationUpdate_get_field_ignoreExpiredData'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationupdateGetFieldcacheDiskSize = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfigurationUpdate_get_field_cacheDiskSize'));



Pointer<Void> sdkMapviewDatasourceRasterdatasourceconfigurationupdateToFfi(RasterDataSourceConfigurationUpdate value) {
  final _providerHeadersHandle = harpPluginsRasterBindingsmapofStringToStringToFfiNullable(value.providerHeaders);
  final _ignoreExpiredDataHandle = booleanToFfiNullable(value.ignoreExpiredData);
  final _cacheDiskSizeHandle = longToFfiNullable(value.cacheDiskSize);
  final _result = _sdkMapviewDatasourceRasterdatasourceconfigurationupdateCreateHandle(_providerHeadersHandle, _ignoreExpiredDataHandle, _cacheDiskSizeHandle);
  harpPluginsRasterBindingsmapofStringToStringReleaseFfiHandleNullable(_providerHeadersHandle);
  booleanReleaseFfiHandleNullable(_ignoreExpiredDataHandle);
  longReleaseFfiHandleNullable(_cacheDiskSizeHandle);
  return _result;
}

RasterDataSourceConfigurationUpdate sdkMapviewDatasourceRasterdatasourceconfigurationupdateFromFfi(Pointer<Void> handle) {
  final _providerHeadersHandle = _sdkMapviewDatasourceRasterdatasourceconfigurationupdateGetFieldproviderHeaders(handle);
  final _ignoreExpiredDataHandle = _sdkMapviewDatasourceRasterdatasourceconfigurationupdateGetFieldignoreExpiredData(handle);
  final _cacheDiskSizeHandle = _sdkMapviewDatasourceRasterdatasourceconfigurationupdateGetFieldcacheDiskSize(handle);
  try {
    return RasterDataSourceConfigurationUpdate(
      harpPluginsRasterBindingsmapofStringToStringFromFfiNullable(_providerHeadersHandle), 
      booleanFromFfiNullable(_ignoreExpiredDataHandle), 
      longFromFfiNullable(_cacheDiskSizeHandle)
    );
  } finally {
    harpPluginsRasterBindingsmapofStringToStringReleaseFfiHandleNullable(_providerHeadersHandle);
    booleanReleaseFfiHandleNullable(_ignoreExpiredDataHandle);
    longReleaseFfiHandleNullable(_cacheDiskSizeHandle);
  }
}

void sdkMapviewDatasourceRasterdatasourceconfigurationupdateReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewDatasourceRasterdatasourceconfigurationupdateReleaseHandle(handle);

// Nullable RasterDataSourceConfigurationUpdate

final _sdkMapviewDatasourceRasterdatasourceconfigurationupdateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfigurationUpdate_create_handle_nullable'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationupdateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfigurationUpdate_release_handle_nullable'));
final _sdkMapviewDatasourceRasterdatasourceconfigurationupdateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceConfigurationUpdate_get_value_nullable'));

Pointer<Void> sdkMapviewDatasourceRasterdatasourceconfigurationupdateToFfiNullable(RasterDataSourceConfigurationUpdate? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewDatasourceRasterdatasourceconfigurationupdateToFfi(value);
  final result = _sdkMapviewDatasourceRasterdatasourceconfigurationupdateCreateHandleNullable(_handle);
  sdkMapviewDatasourceRasterdatasourceconfigurationupdateReleaseFfiHandle(_handle);
  return result;
}

RasterDataSourceConfigurationUpdate? sdkMapviewDatasourceRasterdatasourceconfigurationupdateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewDatasourceRasterdatasourceconfigurationupdateGetValueNullable(handle);
  final result = sdkMapviewDatasourceRasterdatasourceconfigurationupdateFromFfi(_handle);
  sdkMapviewDatasourceRasterdatasourceconfigurationupdateReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewDatasourceRasterdatasourceconfigurationupdateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewDatasourceRasterdatasourceconfigurationupdateReleaseHandleNullable(handle);

// End of RasterDataSourceConfigurationUpdate "private" section.


