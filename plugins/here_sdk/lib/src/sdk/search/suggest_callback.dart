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
import 'package:here_sdk/src/sdk/search/search_error.dart';
import 'package:here_sdk/src/sdk/search/suggestion.dart';

/// The method will be called on the main thread when a suggest call has been completed.
///
/// The first argument indicates an error in case of a failure. The second argument contains the results.
/// Both arguments cannot be `null` at the same time - or not `null` at the same time.
/// This API is not supported by offline search.
///
/// [p0] An error enum indicating what went wrong. It is `null` for an operation that succeeds.
///
/// [p1] The list of suggestion results. It is `null` in case of an error.
typedef SuggestCallback = void Function(SearchError?, List<Suggestion>?);

// SuggestCallback "private" section, not exported.

final _sdkSearchSuggestcallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_SuggestCallback_register_finalizer'));
final _sdkSearchSuggestcallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestCallback_copy_handle'));
final _sdkSearchSuggestcallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestCallback_release_handle'));
final _sdkSearchSuggestcallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_search_SuggestCallback_create_proxy'));

class SuggestCallback$Impl {
  final Pointer<Void> handle;
  SuggestCallback$Impl(this.handle);

  void call(SearchError? p0, List<Suggestion>? p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SuggestCallback_call__SearchError__ListOf_sdk_search_Suggestion_'));
    final _p0Handle = sdkSearchSearcherrorToFfiNullable(p0);
    final _p1Handle = heresdkSearchCommonBindingslistofSdkSearchSuggestionToFfiNullable(p1);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    sdkSearchSearcherrorReleaseFfiHandleNullable(_p0Handle);
    heresdkSearchCommonBindingslistofSdkSearchSuggestionReleaseFfiHandleNullable(_p1Handle);

  }

}

int _sdkSearchSuggestcallbackcallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (_obj as SuggestCallback)(sdkSearchSearcherrorFromFfiNullable(p0), heresdkSearchCommonBindingslistofSdkSearchSuggestionFromFfiNullable(p1));
  } finally {
    sdkSearchSearcherrorReleaseFfiHandleNullable(p0);
    heresdkSearchCommonBindingslistofSdkSearchSuggestionReleaseFfiHandleNullable(p1);
  }
  return 0;
}

Pointer<Void> sdkSearchSuggestcallbackToFfi(SuggestCallback value) =>
  _sdkSearchSuggestcallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkSearchSuggestcallbackcallStatic, __lib.unknownError)
  );

SuggestCallback sdkSearchSuggestcallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkSearchSuggestcallbackCopyHandle(handle);
  final _impl = SuggestCallback$Impl(_copiedHandle);
  final result = (SearchError? p0, List<Suggestion>? p1) => _impl.call(p0, p1);
  _sdkSearchSuggestcallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchSuggestcallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchSuggestcallbackReleaseHandle(handle);

// Nullable SuggestCallback

final _sdkSearchSuggestcallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestCallback_create_handle_nullable'));
final _sdkSearchSuggestcallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestCallback_release_handle_nullable'));
final _sdkSearchSuggestcallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestCallback_get_value_nullable'));

Pointer<Void> sdkSearchSuggestcallbackToFfiNullable(SuggestCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchSuggestcallbackToFfi(value);
  final result = _sdkSearchSuggestcallbackCreateHandleNullable(_handle);
  sdkSearchSuggestcallbackReleaseFfiHandle(_handle);
  return result;
}

SuggestCallback? sdkSearchSuggestcallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchSuggestcallbackGetValueNullable(handle);
  final result = sdkSearchSuggestcallbackFromFfi(_handle);
  sdkSearchSuggestcallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchSuggestcallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchSuggestcallbackReleaseHandleNullable(handle);

// End of SuggestCallback "private" section.


