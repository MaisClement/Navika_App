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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/search/highlight_type.dart';
import 'package:here_sdk/src/sdk/search/index_range.dart';
import 'package:here_sdk/src/sdk/search/place.dart';
import 'package:here_sdk/src/sdk/search/suggestion_type.dart';

/// Suggestion is meant to provide relevant suggestions to partial queries, like "restaur", "starbu", "eiffel".
///
/// Represents a relevant response to user queries.
/// Suggestions (please check [SuggestionType]) are either:
/// Place: [SuggestionType.place]
/// Query: [SuggestionType.chain] or [SuggestionType.category]
///
/// With "Place" you get data for a concrete place in the world.
/// With "Query" something to follow-up, a way to perform more focused search.
/// This API is not supported by offline search.
abstract class Suggestion {

  /// The text slices matching the input query.
  ///
  /// Returns [Map<HighlightType, List<IndexRange>>]. Associated container where [HighlightType] is a key and list of [IndexRange] value.
  ///
  Map<HighlightType, List<IndexRange>> getHighlights();
  /// Gets the localized title for the suggestion.
  String get title;

  /// Gets the type of suggestion.
  SuggestionType get type;

  /// Gets the suggested place item.
  Place? get place;

  /// Gets the suggested item id.
  String? get id;

  /// Gets the direct link for Discover query.
  String? get href;

}


// Suggestion "private" section, not exported.

final _sdkSearchSuggestionRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_Suggestion_register_finalizer'));
final _sdkSearchSuggestionCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Suggestion_copy_handle'));
final _sdkSearchSuggestionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Suggestion_release_handle'));



class Suggestion$Impl extends __lib.NativeBase implements Suggestion {

  Suggestion$Impl(Pointer<Void> handle) : super(handle);

  @override
  Map<HighlightType, List<IndexRange>> getHighlights() {
    final _getHighlightsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Suggestion_getHighlights'));
    final _handle = this.handle;
    final __resultHandle = _getHighlightsFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkSearchCommonBindingsmapofSdkSearchHighlighttypeToHeresdkSearchCommonBindingslistofSdkSearchIndexrangeFromFfi(__resultHandle);
    } finally {
      heresdkSearchCommonBindingsmapofSdkSearchHighlighttypeToHeresdkSearchCommonBindingslistofSdkSearchIndexrangeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  String get title {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Suggestion_title_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  SuggestionType get type {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_search_Suggestion_type_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkSearchSuggestiontypeFromFfi(__resultHandle);
    } finally {
      sdkSearchSuggestiontypeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Place? get place {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Suggestion_place_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkSearchPlaceFromFfiNullable(__resultHandle);
    } finally {
      sdkSearchPlaceReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  String? get id {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Suggestion_id_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  String? get href {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Suggestion_href_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }



}

Pointer<Void> sdkSearchSuggestionToFfi(Suggestion value) =>
  _sdkSearchSuggestionCopyHandle((value as __lib.NativeBase).handle);

Suggestion sdkSearchSuggestionFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Suggestion) return instance;

  final _copiedHandle = _sdkSearchSuggestionCopyHandle(handle);
  final result = Suggestion$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkSearchSuggestionRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchSuggestionReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchSuggestionReleaseHandle(handle);

Pointer<Void> sdkSearchSuggestionToFfiNullable(Suggestion? value) =>
  value != null ? sdkSearchSuggestionToFfi(value) : Pointer<Void>.fromAddress(0);

Suggestion? sdkSearchSuggestionFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkSearchSuggestionFromFfi(handle) : null;

void sdkSearchSuggestionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchSuggestionReleaseHandle(handle);

// End of Suggestion "private" section.


