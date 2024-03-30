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
import 'package:here_sdk/src/sdk/mapview/datasource/raster_data_source_configuration.dart';
import 'package:here_sdk/src/sdk/mapview/datasource/raster_data_source_configuration_update.dart';
import 'package:here_sdk/src/sdk/mapview/datasource/raster_data_source_listener.dart';
import 'package:here_sdk/src/sdk/mapview/map_context.dart';
import 'package:meta/meta.dart';

/// Data source to load map layers using a raster image format (jpg, png).
///
/// The example below illustrates how to create a raster data source and how to link it to
/// a newly created map layer.
///
/// ```
///  final rasterDataSource = RasterDataSource(mapContext, rasterDataSourceConfig);
///
///  var layer = MapLayerBuilder()
///      // The name and the type of the data source have to be provided.
///      // In our case, the name of the raster data source is in rasterDataSourceConfig.
///      .withDataSource(asterDataSourceConfig.name, MapContentType.rasterImage)
///      .forMap(map)
///      .withName("rasterLayer")
///      .build();
/// ```
abstract class RasterDataSource {
  /// Creates a RasterDataSource instance with the provided data source configuration.
  ///
  /// [context] The map context to associate the data source with.
  ///
  /// [configuration] The data source configuration object to use.
  ///
  factory RasterDataSource(MapContext context, RasterDataSourceConfiguration configuration) => $prototype.$init(context, configuration);
  /// Creates a RasterDataSource instance with the provided data source configuration and
  /// registers a listener.
  ///
  /// [context] The map context to associate the data source with.
  ///
  /// [configuration] The data source configuration object to use.
  ///
  /// [listener] The initial listener to be registered for receiving state notifications.
  /// Due to the asynchronous nature of the data source initialization, the listeners
  /// registered later might miss some notifications. This listener is guaranteed to
  /// receive all notifications.
  /// The state notifications can occur on an arbitrary thread.
  ///
  factory RasterDataSource.withConfigurationAndListener(MapContext context, RasterDataSourceConfiguration configuration, RasterDataSourceListener listener) => $prototype.withConfigurationAndListener(context, configuration, listener);

  /// Applies the configuration update to the datasource.
  ///
  /// An example for a configuration update is the update
  /// to a new bearer token for authentication.
  ///
  /// [configuration] The data source configuration update to apply.
  ///
  void changeConfiguration(RasterDataSourceConfigurationUpdate configuration);
  /// Add listener for receiving state notifications.
  ///
  /// The new listener is
  /// appended to the set of data source listeners as a strong reference and will receive only
  /// the notifications occurring after the registration. Caller is responsible for releasing
  /// the strong reference by calling removeListener.
  /// The state notifications can occur on an arbitrary thread.
  ///
  /// [listener] Listener to be added for receiving state notifications.
  ///
  void addListener(RasterDataSourceListener listener);
  /// Remove a listener from receiving state notifications.
  ///
  /// Notification can still be received during removal.
  ///
  /// [listener] Listener to be removed from receiving state notifications.
  ///
  void removeListener(RasterDataSourceListener listener);
  /// Remove all listeners from receiving state notifications.
  ///
  /// Notification can still be received during removal.
  ///
  void removeListeners();
  /// Frees all internally used resources.
  ///
  /// After calling this method, the object
  /// is not usable anymore.
  ///
  void destroy();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = RasterDataSource$Impl(Pointer<Void>.fromAddress(0));
}


// RasterDataSource "private" section, not exported.

final _sdkMapviewDatasourceRasterdatasourceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_datasource_RasterDataSource_register_finalizer'));
final _sdkMapviewDatasourceRasterdatasourceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSource_copy_handle'));
final _sdkMapviewDatasourceRasterdatasourceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_RasterDataSource_release_handle'));









/// @nodoc
@visibleForTesting
class RasterDataSource$Impl extends __lib.NativeBase implements RasterDataSource {

  RasterDataSource$Impl(Pointer<Void> handle) : super(handle);


  RasterDataSource $init(MapContext context, RasterDataSourceConfiguration configuration) {
    final _result_handle = _$init(context, configuration);
    final _result = RasterDataSource$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewDatasourceRasterdatasourceRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  RasterDataSource withConfigurationAndListener(MapContext context, RasterDataSourceConfiguration configuration, RasterDataSourceListener listener) {
    final _result_handle = _withConfigurationAndListener(context, configuration, listener);
    final _result = RasterDataSource$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewDatasourceRasterdatasourceRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(MapContext context, RasterDataSourceConfiguration configuration) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_datasource_RasterDataSource_create__MapContext_RasterDataSourceConfiguration'));
    final _contextHandle = sdkMapviewMapcontextToFfi(context);
    final _configurationHandle = sdkMapviewDatasourceRasterdatasourceconfigurationToFfi(configuration);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _contextHandle, _configurationHandle);
    sdkMapviewMapcontextReleaseFfiHandle(_contextHandle);
    sdkMapviewDatasourceRasterdatasourceconfigurationReleaseFfiHandle(_configurationHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withConfigurationAndListener(MapContext context, RasterDataSourceConfiguration configuration, RasterDataSourceListener listener) {
    final _withConfigurationAndListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_datasource_RasterDataSource_create__MapContext_RasterDataSourceConfiguration_RasterDataSourceListener'));
    final _contextHandle = sdkMapviewMapcontextToFfi(context);
    final _configurationHandle = sdkMapviewDatasourceRasterdatasourceconfigurationToFfi(configuration);
    final _listenerHandle = sdkMapviewDatasourceRasterdatasourcelistenerToFfi(listener);
    final __resultHandle = _withConfigurationAndListenerFfi(__lib.LibraryContext.isolateId, _contextHandle, _configurationHandle, _listenerHandle);
    sdkMapviewMapcontextReleaseFfiHandle(_contextHandle);
    sdkMapviewDatasourceRasterdatasourceconfigurationReleaseFfiHandle(_configurationHandle);
    sdkMapviewDatasourceRasterdatasourcelistenerReleaseFfiHandle(_listenerHandle);
    return __resultHandle;
  }

  @override
  void changeConfiguration(RasterDataSourceConfigurationUpdate configuration) {
    final _changeConfigurationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_datasource_RasterDataSource_changeConfiguration__RasterDataSourceConfigurationUpdate'));
    final _configurationHandle = sdkMapviewDatasourceRasterdatasourceconfigurationupdateToFfi(configuration);
    final _handle = this.handle;
    _changeConfigurationFfi(_handle, __lib.LibraryContext.isolateId, _configurationHandle);
    sdkMapviewDatasourceRasterdatasourceconfigurationupdateReleaseFfiHandle(_configurationHandle);

  }

  @override
  void addListener(RasterDataSourceListener listener) {
    final _addListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_datasource_RasterDataSource_addListener__RasterDataSourceListener'));
    final _listenerHandle = sdkMapviewDatasourceRasterdatasourcelistenerToFfi(listener);
    final _handle = this.handle;
    _addListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkMapviewDatasourceRasterdatasourcelistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void removeListener(RasterDataSourceListener listener) {
    final _removeListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_datasource_RasterDataSource_removeListener__RasterDataSourceListener'));
    final _listenerHandle = sdkMapviewDatasourceRasterdatasourcelistenerToFfi(listener);
    final _handle = this.handle;
    _removeListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkMapviewDatasourceRasterdatasourcelistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void removeListeners() {
    final _removeListenersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_datasource_RasterDataSource_removeListeners'));
    final _handle = this.handle;
    _removeListenersFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void destroy() {
    final _destroyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_datasource_RasterDataSource_destroy'));
    final _handle = this.handle;
    _destroyFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

Pointer<Void> sdkMapviewDatasourceRasterdatasourceToFfi(RasterDataSource value) =>
  _sdkMapviewDatasourceRasterdatasourceCopyHandle((value as __lib.NativeBase).handle);

RasterDataSource sdkMapviewDatasourceRasterdatasourceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is RasterDataSource) return instance;

  final _copiedHandle = _sdkMapviewDatasourceRasterdatasourceCopyHandle(handle);
  final result = RasterDataSource$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewDatasourceRasterdatasourceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewDatasourceRasterdatasourceReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewDatasourceRasterdatasourceReleaseHandle(handle);

Pointer<Void> sdkMapviewDatasourceRasterdatasourceToFfiNullable(RasterDataSource? value) =>
  value != null ? sdkMapviewDatasourceRasterdatasourceToFfi(value) : Pointer<Void>.fromAddress(0);

RasterDataSource? sdkMapviewDatasourceRasterdatasourceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewDatasourceRasterdatasourceFromFfi(handle) : null;

void sdkMapviewDatasourceRasterdatasourceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewDatasourceRasterdatasourceReleaseHandle(handle);

// End of RasterDataSource "private" section.


