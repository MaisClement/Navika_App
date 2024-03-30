// Copyright (c) 2018-2023 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
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
import 'package:here_sdk/src/sdk/search/place.dart';
import 'package:here_sdk/src/sdk/search/search_error.dart';

/// The method will be called on the main thread when a search by id call has been completed.
///
/// [p0] The search error
///
/// [p1] The place
typedef PlaceIdSearchCallback = void Function(SearchError?, Place?);

// PlaceIdSearchCallback "private" section, not exported.

final _sdkSearchPlaceidsearchcallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_PlaceIdSearchCallback_register_finalizer'));
final _sdkSearchPlaceidsearchcallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdSearchCallback_copy_handle'));
final _sdkSearchPlaceidsearchcallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdSearchCallback_release_handle'));
final _sdkSearchPlaceidsearchcallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_search_PlaceIdSearchCallback_create_proxy'));

class PlaceIdSearchCallback$Impl {
  final Pointer<Void> handle;
  PlaceIdSearchCallback$Impl(this.handle);

  void call(SearchError? p0, Place? p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_PlaceIdSearchCallback_call__SearchError__Place_'));
    final _p0Handle = sdkSearchSearcherrorToFfiNullable(p0);
    final _p1Handle = sdkSearchPlaceToFfiNullable(p1);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    sdkSearchSearcherrorReleaseFfiHandleNullable(_p0Handle);
    sdkSearchPlaceReleaseFfiHandleNullable(_p1Handle);

  }

}

int _sdkSearchPlaceidsearchcallbackcallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (_obj as PlaceIdSearchCallback)(sdkSearchSearcherrorFromFfiNullable(p0), sdkSearchPlaceFromFfiNullable(p1));
  } finally {
    sdkSearchSearcherrorReleaseFfiHandleNullable(p0);
    sdkSearchPlaceReleaseFfiHandleNullable(p1);
  }
  return 0;
}

Pointer<Void> sdkSearchPlaceidsearchcallbackToFfi(PlaceIdSearchCallback value) =>
  _sdkSearchPlaceidsearchcallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkSearchPlaceidsearchcallbackcallStatic, __lib.unknownError)
  );

PlaceIdSearchCallback sdkSearchPlaceidsearchcallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkSearchPlaceidsearchcallbackCopyHandle(handle);
  final _impl = PlaceIdSearchCallback$Impl(_copiedHandle);
  final result = (SearchError? p0, Place? p1) => _impl.call(p0, p1);
  _sdkSearchPlaceidsearchcallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchPlaceidsearchcallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchPlaceidsearchcallbackReleaseHandle(handle);

// Nullable PlaceIdSearchCallback

final _sdkSearchPlaceidsearchcallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdSearchCallback_create_handle_nullable'));
final _sdkSearchPlaceidsearchcallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdSearchCallback_release_handle_nullable'));
final _sdkSearchPlaceidsearchcallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdSearchCallback_get_value_nullable'));

Pointer<Void> sdkSearchPlaceidsearchcallbackToFfiNullable(PlaceIdSearchCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchPlaceidsearchcallbackToFfi(value);
  final result = _sdkSearchPlaceidsearchcallbackCreateHandleNullable(_handle);
  sdkSearchPlaceidsearchcallbackReleaseFfiHandle(_handle);
  return result;
}

PlaceIdSearchCallback? sdkSearchPlaceidsearchcallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchPlaceidsearchcallbackGetValueNullable(handle);
  final result = sdkSearchPlaceidsearchcallbackFromFfi(_handle);
  sdkSearchPlaceidsearchcallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchPlaceidsearchcallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchPlaceidsearchcallbackReleaseHandleNullable(handle);

// End of PlaceIdSearchCallback "private" section.


