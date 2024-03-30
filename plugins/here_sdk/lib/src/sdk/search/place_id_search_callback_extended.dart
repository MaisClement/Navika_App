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
import 'package:here_sdk/src/sdk/search/response_details.dart';
import 'package:here_sdk/src/sdk/search/search_error.dart';

/// The method will be called on the main thread when a search by id call has been completed.
///
/// [p0] The search error
///
/// [p1] The place
///
/// [p2] The response details
typedef PlaceIdSearchCallbackExtended = void Function(SearchError?, Place?, ResponseDetails?);

// PlaceIdSearchCallbackExtended "private" section, not exported.

final _sdkSearchPlaceidsearchcallbackextendedRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_PlaceIdSearchCallbackExtended_register_finalizer'));
final _sdkSearchPlaceidsearchcallbackextendedCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdSearchCallbackExtended_copy_handle'));
final _sdkSearchPlaceidsearchcallbackextendedReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdSearchCallbackExtended_release_handle'));
final _sdkSearchPlaceidsearchcallbackextendedCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_search_PlaceIdSearchCallbackExtended_create_proxy'));

class PlaceIdSearchCallbackExtended$Impl {
  final Pointer<Void> handle;
  PlaceIdSearchCallbackExtended$Impl(this.handle);

  void call(SearchError? p0, Place? p1, ResponseDetails? p2) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_PlaceIdSearchCallbackExtended_call__SearchError__Place__ResponseDetails_'));
    final _p0Handle = sdkSearchSearcherrorToFfiNullable(p0);
    final _p1Handle = sdkSearchPlaceToFfiNullable(p1);
    final _p2Handle = sdkSearchResponsedetailsToFfiNullable(p2);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle, _p2Handle);
    sdkSearchSearcherrorReleaseFfiHandleNullable(_p0Handle);
    sdkSearchPlaceReleaseFfiHandleNullable(_p1Handle);
    sdkSearchResponsedetailsReleaseFfiHandleNullable(_p2Handle);

  }

}

int _sdkSearchPlaceidsearchcallbackextendedcallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1, Pointer<Void> p2) {
  
  try {
    (_obj as PlaceIdSearchCallbackExtended)(sdkSearchSearcherrorFromFfiNullable(p0), sdkSearchPlaceFromFfiNullable(p1), sdkSearchResponsedetailsFromFfiNullable(p2));
  } finally {
    sdkSearchSearcherrorReleaseFfiHandleNullable(p0);
    sdkSearchPlaceReleaseFfiHandleNullable(p1);
    sdkSearchResponsedetailsReleaseFfiHandleNullable(p2);
  }
  return 0;
}

Pointer<Void> sdkSearchPlaceidsearchcallbackextendedToFfi(PlaceIdSearchCallbackExtended value) =>
  _sdkSearchPlaceidsearchcallbackextendedCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_sdkSearchPlaceidsearchcallbackextendedcallStatic, __lib.unknownError)
  );

PlaceIdSearchCallbackExtended sdkSearchPlaceidsearchcallbackextendedFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkSearchPlaceidsearchcallbackextendedCopyHandle(handle);
  final _impl = PlaceIdSearchCallbackExtended$Impl(_copiedHandle);
  final result = (SearchError? p0, Place? p1, ResponseDetails? p2) => _impl.call(p0, p1, p2);
  _sdkSearchPlaceidsearchcallbackextendedRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchPlaceidsearchcallbackextendedReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchPlaceidsearchcallbackextendedReleaseHandle(handle);

// Nullable PlaceIdSearchCallbackExtended

final _sdkSearchPlaceidsearchcallbackextendedCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdSearchCallbackExtended_create_handle_nullable'));
final _sdkSearchPlaceidsearchcallbackextendedReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdSearchCallbackExtended_release_handle_nullable'));
final _sdkSearchPlaceidsearchcallbackextendedGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdSearchCallbackExtended_get_value_nullable'));

Pointer<Void> sdkSearchPlaceidsearchcallbackextendedToFfiNullable(PlaceIdSearchCallbackExtended? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchPlaceidsearchcallbackextendedToFfi(value);
  final result = _sdkSearchPlaceidsearchcallbackextendedCreateHandleNullable(_handle);
  sdkSearchPlaceidsearchcallbackextendedReleaseFfiHandle(_handle);
  return result;
}

PlaceIdSearchCallbackExtended? sdkSearchPlaceidsearchcallbackextendedFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchPlaceidsearchcallbackextendedGetValueNullable(handle);
  final result = sdkSearchPlaceidsearchcallbackextendedFromFfi(_handle);
  sdkSearchPlaceidsearchcallbackextendedReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchPlaceidsearchcallbackextendedReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchPlaceidsearchcallbackextendedReleaseHandleNullable(handle);

// End of PlaceIdSearchCallbackExtended "private" section.


