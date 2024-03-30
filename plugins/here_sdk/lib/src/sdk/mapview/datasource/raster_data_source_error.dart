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

/// Raster data source error codes.
enum RasterDataSourceError {
    /// Data source configuration is invalid.
    invalidConfiguration,
    /// An authentication error has occurred.
    authenticationError
}

// RasterDataSourceError "private" section, not exported.

int sdkMapviewDatasourceRasterdatasourceerrorToFfi(RasterDataSourceError value) {
  switch (value) {
  case RasterDataSourceError.invalidConfiguration:
    return 0;
  case RasterDataSourceError.authenticationError:
    return 1;
  default:
    throw StateError("Invalid enum value $value for RasterDataSourceError enum.");
  }
}

RasterDataSourceError sdkMapviewDatasourceRasterdatasourceerrorFromFfi(int handle) {
  switch (handle) {
  case 0:
    return RasterDataSourceError.invalidConfiguration;
  case 1:
    return RasterDataSourceError.authenticationError;
  default:
    throw StateError("Invalid numeric value $handle for RasterDataSourceError enum.");
  }
}

void sdkMapviewDatasourceRasterdatasourceerrorReleaseFfiHandle(int handle) {}

final _sdkMapviewDatasourceRasterdatasourceerrorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceError_create_handle_nullable'));
final _sdkMapviewDatasourceRasterdatasourceerrorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceError_release_handle_nullable'));
final _sdkMapviewDatasourceRasterdatasourceerrorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceError_get_value_nullable'));

Pointer<Void> sdkMapviewDatasourceRasterdatasourceerrorToFfiNullable(RasterDataSourceError? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewDatasourceRasterdatasourceerrorToFfi(value);
  final result = _sdkMapviewDatasourceRasterdatasourceerrorCreateHandleNullable(_handle);
  sdkMapviewDatasourceRasterdatasourceerrorReleaseFfiHandle(_handle);
  return result;
}

RasterDataSourceError? sdkMapviewDatasourceRasterdatasourceerrorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewDatasourceRasterdatasourceerrorGetValueNullable(handle);
  final result = sdkMapviewDatasourceRasterdatasourceerrorFromFfi(_handle);
  sdkMapviewDatasourceRasterdatasourceerrorReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewDatasourceRasterdatasourceerrorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewDatasourceRasterdatasourceerrorReleaseHandleNullable(handle);

// End of RasterDataSourceError "private" section.


