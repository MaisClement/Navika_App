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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/mapview/datasource/raster_data_source_error.dart';

/// Listener for RasterDataSource events.
abstract class RasterDataSourceListener {
  /// Listener for RasterDataSource events.

  factory RasterDataSourceListener(
    void Function() onRasterDataSourceReadyLambda,
    void Function(RasterDataSourceError) onRasterDataSourceErrorLambda,

  ) => RasterDataSourceListener$Lambdas(
    onRasterDataSourceReadyLambda,
    onRasterDataSourceErrorLambda,

  );

  /// The method to call on the listener when data source is ready to use.
  ///
  void onRasterDataSourceReady();
  /// The method to call on the listener when a data source error occurs.
  ///
  /// [dataSourceError] a data source error.
  ///
  void onRasterDataSourceError(RasterDataSourceError dataSourceError);
}


// RasterDataSourceListener "private" section, not exported.

final _sdkMapviewDatasourceRasterdatasourcelistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceListener_register_finalizer'));
final _sdkMapviewDatasourceRasterdatasourcelistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceListener_copy_handle'));
final _sdkMapviewDatasourceRasterdatasourcelistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceListener_release_handle'));
final _sdkMapviewDatasourceRasterdatasourcelistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceListener_create_proxy'));
final _sdkMapviewDatasourceRasterdatasourcelistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSourceListener_get_type_id'));



class RasterDataSourceListener$Lambdas implements RasterDataSourceListener {
  void Function() onRasterDataSourceReadyLambda;
  void Function(RasterDataSourceError) onRasterDataSourceErrorLambda;

  RasterDataSourceListener$Lambdas(
    this.onRasterDataSourceReadyLambda,
    this.onRasterDataSourceErrorLambda,

  );

  @override
  void onRasterDataSourceReady() =>
    onRasterDataSourceReadyLambda();
  @override
  void onRasterDataSourceError(RasterDataSourceError dataSourceError) =>
    onRasterDataSourceErrorLambda(dataSourceError);
}

class RasterDataSourceListener$Impl extends __lib.NativeBase implements RasterDataSourceListener {

  RasterDataSourceListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onRasterDataSourceReady() {
    final _onRasterDataSourceReadyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_datasource_RasterDataSourceListener_onRasterDataSourceReady'));
    final _handle = this.handle;
    _onRasterDataSourceReadyFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void onRasterDataSourceError(RasterDataSourceError dataSourceError) {
    final _onRasterDataSourceErrorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_datasource_RasterDataSourceListener_onRasterDataSourceError__RasterDataSourceError'));
    final _dataSourceErrorHandle = sdkMapviewDatasourceRasterdatasourceerrorToFfi(dataSourceError);
    final _handle = this.handle;
    _onRasterDataSourceErrorFfi(_handle, __lib.LibraryContext.isolateId, _dataSourceErrorHandle);
    sdkMapviewDatasourceRasterdatasourceerrorReleaseFfiHandle(_dataSourceErrorHandle);

  }


}

int _sdkMapviewDatasourceRasterdatasourcelisteneronRasterDataSourceReadyStatic(Object _obj) {

  try {
    (_obj as RasterDataSourceListener).onRasterDataSourceReady();
  } finally {
  }
  return 0;
}
int _sdkMapviewDatasourceRasterdatasourcelisteneronRasterDataSourceErrorStatic(Object _obj, int dataSourceError) {

  try {
    (_obj as RasterDataSourceListener).onRasterDataSourceError(sdkMapviewDatasourceRasterdatasourceerrorFromFfi(dataSourceError));
  } finally {
    sdkMapviewDatasourceRasterdatasourceerrorReleaseFfiHandle(dataSourceError);
  }
  return 0;
}


Pointer<Void> sdkMapviewDatasourceRasterdatasourcelistenerToFfi(RasterDataSourceListener value) {
  if (value is __lib.NativeBase) return _sdkMapviewDatasourceRasterdatasourcelistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkMapviewDatasourceRasterdatasourcelistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkMapviewDatasourceRasterdatasourcelisteneronRasterDataSourceReadyStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint32)>(_sdkMapviewDatasourceRasterdatasourcelisteneronRasterDataSourceErrorStatic, __lib.unknownError)
  );

  return result;
}

RasterDataSourceListener sdkMapviewDatasourceRasterdatasourcelistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is RasterDataSourceListener) return instance;

  final _typeIdHandle = _sdkMapviewDatasourceRasterdatasourcelistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewDatasourceRasterdatasourcelistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : RasterDataSourceListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewDatasourceRasterdatasourcelistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewDatasourceRasterdatasourcelistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewDatasourceRasterdatasourcelistenerReleaseHandle(handle);

Pointer<Void> sdkMapviewDatasourceRasterdatasourcelistenerToFfiNullable(RasterDataSourceListener? value) =>
  value != null ? sdkMapviewDatasourceRasterdatasourcelistenerToFfi(value) : Pointer<Void>.fromAddress(0);

RasterDataSourceListener? sdkMapviewDatasourceRasterdatasourcelistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewDatasourceRasterdatasourcelistenerFromFfi(handle) : null;

void sdkMapviewDatasourceRasterdatasourcelistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewDatasourceRasterdatasourcelistenerReleaseHandle(handle);

// End of RasterDataSourceListener "private" section.


