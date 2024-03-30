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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/search/place.dart';
import 'package:here_sdk/src/sdk/search/response_details.dart';
import 'package:here_sdk/src/sdk/search/search_error.dart';

/// The method will be called on the main thread when a search call has been completed.
///
/// The first argument indicates an error in case of a failure. The second argument contains the results.
/// Both arguments cannot be `null` at the same time - or not `null` at the same time.
///
/// [p0] An error enum indicating what went wrong. It is `null` for an operation that succeeds.
///
/// [p1] The list of search results. It is `null` in case of an error.
///
/// [p2] Additional information provided with response. It is `null` in case of an error.
typedef SearchCallbackExtended = void Function(SearchError?, List<Place>?, ResponseDetails?);

// SearchCallbackExtended "private" section, not exported.

final _sdkSearchSearchcallbackextendedRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_SearchCallbackExtended_register_finalizer'));
final _sdkSearchSearchcallbackextendedCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchCallbackExtended_copy_handle'));
final _sdkSearchSearchcallbackextendedReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchCallbackExtended_release_handle'));
final _sdkSearchSearchcallbackextendedCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_search_SearchCallbackExtended_create_proxy'));

class SearchCallbackExtended$Impl {
  final Pointer<Void> handle;
  SearchCallbackExtended$Impl(this.handle);

  void call(SearchError? p0, List<Place>? p1, ResponseDetails? p2) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchCallbackExtended_call__SearchError__ListOf_sdk_search_Place__ResponseDetails_'));
    final _p0Handle = sdkSearchSearcherrorToFfiNullable(p0);
    final _p1Handle = heresdkSearchCommonBindingslistofSdkSearchPlaceToFfiNullable(p1);
    final _p2Handle = sdkSearchResponsedetailsToFfiNullable(p2);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle, _p2Handle);
    sdkSearchSearcherrorReleaseFfiHandleNullable(_p0Handle);
    heresdkSearchCommonBindingslistofSdkSearchPlaceReleaseFfiHandleNullable(_p1Handle);
    sdkSearchResponsedetailsReleaseFfiHandleNullable(_p2Handle);

  }

}

int _sdkSearchSearchcallbackextendedcallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1, Pointer<Void> p2) {
  
  try {
    (_obj as SearchCallbackExtended)(sdkSearchSearcherrorFromFfiNullable(p0), heresdkSearchCommonBindingslistofSdkSearchPlaceFromFfiNullable(p1), sdkSearchResponsedetailsFromFfiNullable(p2));
  } finally {
    sdkSearchSearcherrorReleaseFfiHandleNullable(p0);
    heresdkSearchCommonBindingslistofSdkSearchPlaceReleaseFfiHandleNullable(p1);
    sdkSearchResponsedetailsReleaseFfiHandleNullable(p2);
  }
  return 0;
}

Pointer<Void> sdkSearchSearchcallbackextendedToFfi(SearchCallbackExtended value) =>
  _sdkSearchSearchcallbackextendedCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_sdkSearchSearchcallbackextendedcallStatic, __lib.unknownError)
  );

SearchCallbackExtended sdkSearchSearchcallbackextendedFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkSearchSearchcallbackextendedCopyHandle(handle);
  final _impl = SearchCallbackExtended$Impl(_copiedHandle);
  final result = (SearchError? p0, List<Place>? p1, ResponseDetails? p2) => _impl.call(p0, p1, p2);
  _sdkSearchSearchcallbackextendedRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchSearchcallbackextendedReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchSearchcallbackextendedReleaseHandle(handle);

// Nullable SearchCallbackExtended

final _sdkSearchSearchcallbackextendedCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchCallbackExtended_create_handle_nullable'));
final _sdkSearchSearchcallbackextendedReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchCallbackExtended_release_handle_nullable'));
final _sdkSearchSearchcallbackextendedGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchCallbackExtended_get_value_nullable'));

Pointer<Void> sdkSearchSearchcallbackextendedToFfiNullable(SearchCallbackExtended? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchSearchcallbackextendedToFfi(value);
  final result = _sdkSearchSearchcallbackextendedCreateHandleNullable(_handle);
  sdkSearchSearchcallbackextendedReleaseFfiHandle(_handle);
  return result;
}

SearchCallbackExtended? sdkSearchSearchcallbackextendedFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchSearchcallbackextendedGetValueNullable(handle);
  final result = sdkSearchSearchcallbackextendedFromFfi(_handle);
  sdkSearchSearchcallbackextendedReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchSearchcallbackextendedReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchSearchcallbackextendedReleaseHandleNullable(handle);

// End of SearchCallbackExtended "private" section.


