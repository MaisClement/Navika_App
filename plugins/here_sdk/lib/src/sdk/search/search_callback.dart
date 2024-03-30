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
import 'package:here_sdk/src/sdk/search/search_error.dart';

/// The method will be called on the main thread when a search call has been completed.
///
/// The first argument indicates an error in case of a failure. The second argument contains the results.
/// Both arguments cannot be `null` at the same time - or not `null` at the same time.
///
/// [p0] An error enum indicating what went wrong. It is `null` for an operation that succeeds.
///
/// [p1] The list of search results. It is `null` in case of an error.
typedef SearchCallback = void Function(SearchError?, List<Place>?);

// SearchCallback "private" section, not exported.

final _sdkSearchSearchcallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_SearchCallback_register_finalizer'));
final _sdkSearchSearchcallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchCallback_copy_handle'));
final _sdkSearchSearchcallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchCallback_release_handle'));
final _sdkSearchSearchcallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_search_SearchCallback_create_proxy'));

class SearchCallback$Impl {
  final Pointer<Void> handle;
  SearchCallback$Impl(this.handle);

  void call(SearchError? p0, List<Place>? p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchCallback_call__SearchError__ListOf_sdk_search_Place_'));
    final _p0Handle = sdkSearchSearcherrorToFfiNullable(p0);
    final _p1Handle = heresdkSearchCommonBindingslistofSdkSearchPlaceToFfiNullable(p1);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    sdkSearchSearcherrorReleaseFfiHandleNullable(_p0Handle);
    heresdkSearchCommonBindingslistofSdkSearchPlaceReleaseFfiHandleNullable(_p1Handle);

  }

}

int _sdkSearchSearchcallbackcallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (_obj as SearchCallback)(sdkSearchSearcherrorFromFfiNullable(p0), heresdkSearchCommonBindingslistofSdkSearchPlaceFromFfiNullable(p1));
  } finally {
    sdkSearchSearcherrorReleaseFfiHandleNullable(p0);
    heresdkSearchCommonBindingslistofSdkSearchPlaceReleaseFfiHandleNullable(p1);
  }
  return 0;
}

Pointer<Void> sdkSearchSearchcallbackToFfi(SearchCallback value) =>
  _sdkSearchSearchcallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkSearchSearchcallbackcallStatic, __lib.unknownError)
  );

SearchCallback sdkSearchSearchcallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkSearchSearchcallbackCopyHandle(handle);
  final _impl = SearchCallback$Impl(_copiedHandle);
  final result = (SearchError? p0, List<Place>? p1) => _impl.call(p0, p1);
  _sdkSearchSearchcallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchSearchcallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchSearchcallbackReleaseHandle(handle);

// Nullable SearchCallback

final _sdkSearchSearchcallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchCallback_create_handle_nullable'));
final _sdkSearchSearchcallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchCallback_release_handle_nullable'));
final _sdkSearchSearchcallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchCallback_get_value_nullable'));

Pointer<Void> sdkSearchSearchcallbackToFfiNullable(SearchCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchSearchcallbackToFfi(value);
  final result = _sdkSearchSearchcallbackCreateHandleNullable(_handle);
  sdkSearchSearchcallbackReleaseFfiHandle(_handle);
  return result;
}

SearchCallback? sdkSearchSearchcallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchSearchcallbackGetValueNullable(handle);
  final result = sdkSearchSearchcallbackFromFfi(_handle);
  sdkSearchSearchcallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchSearchcallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchSearchcallbackReleaseHandleNullable(handle);

// End of SearchCallback "private" section.


