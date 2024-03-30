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
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';

/// Provides the URL as String for the given tile coordinates and storage level.
///
/// The first and second parameters correspond to the X and Y coordinates of the tile, respectively, and have values ranging from 0 to 2^level − 1.
/// The third parameter indicates the level of the tile.
///
/// [p0] X coordinate of the tile. This ranges from 0 to 2^level − 1.
///
/// [p1] Y coordinate of the tile. This ranges from 0 to 2^level − 1.
///
/// [p2] Level of the tile.
///
/// Returns the URL.
typedef TileUrlProviderCallback = String Function(int, int, int);

// TileUrlProviderCallback "private" section, not exported.

final _sdkMapviewDatasourceTileurlprovidercallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_datasource_TileUrlProviderCallback_register_finalizer'));
final _sdkMapviewDatasourceTileurlprovidercallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_TileUrlProviderCallback_copy_handle'));
final _sdkMapviewDatasourceTileurlprovidercallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_TileUrlProviderCallback_release_handle'));
final _sdkMapviewDatasourceTileurlprovidercallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_mapview_datasource_TileUrlProviderCallback_create_proxy'));

class TileUrlProviderCallback$Impl {
  final Pointer<Void> handle;
  TileUrlProviderCallback$Impl(this.handle);

  String call(int p0, int p1, int p2) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Int32, Int32, Int32), Pointer<Void> Function(Pointer<Void>, int, int, int, int)>('here_sdk_sdk_mapview_datasource_TileUrlProviderCallback_call__Int_Int_Int'));
    final _p0Handle = (p0);
    final _p1Handle = (p1);
    final _p2Handle = (p2);
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle, _p2Handle);



    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

}

int _sdkMapviewDatasourceTileurlprovidercallbackcallStatic(Object _obj, int p0, int p1, int p2, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = (_obj as TileUrlProviderCallback)((p0), (p1), (p2));
    _result.value = stringToFfi(_resultObject);
  } finally {
    
    
    
  }
  return 0;
}

Pointer<Void> sdkMapviewDatasourceTileurlprovidercallbackToFfi(TileUrlProviderCallback value) =>
  _sdkMapviewDatasourceTileurlprovidercallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Int32, Int32, Int32, Pointer<Pointer<Void>>)>(_sdkMapviewDatasourceTileurlprovidercallbackcallStatic, __lib.unknownError)
  );

TileUrlProviderCallback sdkMapviewDatasourceTileurlprovidercallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkMapviewDatasourceTileurlprovidercallbackCopyHandle(handle);
  final _impl = TileUrlProviderCallback$Impl(_copiedHandle);
  final result = (int p0, int p1, int p2) => _impl.call(p0, p1, p2);
  _sdkMapviewDatasourceTileurlprovidercallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewDatasourceTileurlprovidercallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewDatasourceTileurlprovidercallbackReleaseHandle(handle);

// Nullable TileUrlProviderCallback

final _sdkMapviewDatasourceTileurlprovidercallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_TileUrlProviderCallback_create_handle_nullable'));
final _sdkMapviewDatasourceTileurlprovidercallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_TileUrlProviderCallback_release_handle_nullable'));
final _sdkMapviewDatasourceTileurlprovidercallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_TileUrlProviderCallback_get_value_nullable'));

Pointer<Void> sdkMapviewDatasourceTileurlprovidercallbackToFfiNullable(TileUrlProviderCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewDatasourceTileurlprovidercallbackToFfi(value);
  final result = _sdkMapviewDatasourceTileurlprovidercallbackCreateHandleNullable(_handle);
  sdkMapviewDatasourceTileurlprovidercallbackReleaseFfiHandle(_handle);
  return result;
}

TileUrlProviderCallback? sdkMapviewDatasourceTileurlprovidercallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewDatasourceTileurlprovidercallbackGetValueNullable(handle);
  final result = sdkMapviewDatasourceTileurlprovidercallbackFromFfi(_handle);
  sdkMapviewDatasourceTileurlprovidercallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewDatasourceTileurlprovidercallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewDatasourceTileurlprovidercallbackReleaseHandleNullable(handle);

// End of TileUrlProviderCallback "private" section.


