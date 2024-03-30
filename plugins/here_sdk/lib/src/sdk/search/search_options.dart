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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/language_code.dart';

/// Encapsulates options that control the behavior of search and suggest operations.

class SearchOptions {
  /// The preferred language of the result. When unset or unsupported language is chosen,
  /// results will be returned in their local language.
  LanguageCode? languageCode;

  /// The maximum number of items in the response. It should be in the range \[1, 100\].
  /// When not set, results will be limited to 20.
  /// For location search (reverse geocode) by default results limited to 1.
  int? maxItems;

  /// Creates an Options object.
  ///
  /// If no parameters are passed, uses default values
  /// (see fields description).

  /// [languageCode] The preferred language of the result. When unset or unsupported language is chosen,
  /// results will be returned in their local language.

  /// [maxItems] The maximum number of items in the response. It should be in the range \[1, 100\].
  /// When not set, results will be limited to 20.
  /// For location search (reverse geocode) by default results limited to 1.

  SearchOptions._(this.languageCode, this.maxItems);
  SearchOptions()
    : languageCode = null, maxItems = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SearchOptions) return false;
    SearchOptions _other = other;
    return languageCode == _other.languageCode &&
        maxItems == _other.maxItems;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + languageCode.hashCode;
    result = 31 * result + maxItems.hashCode;
    return result;
  }
}


// SearchOptions "private" section, not exported.

final _sdkSearchSearchoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_SearchOptions_create_handle'));
final _sdkSearchSearchoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchOptions_release_handle'));
final _sdkSearchSearchoptionsGetFieldlanguageCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchOptions_get_field_languageCode'));
final _sdkSearchSearchoptionsGetFieldmaxItems = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchOptions_get_field_maxItems'));



Pointer<Void> sdkSearchSearchoptionsToFfi(SearchOptions value) {
  final _languageCodeHandle = sdkCoreLanguagecodeToFfiNullable(value.languageCode);
  final _maxItemsHandle = intToFfiNullable(value.maxItems);
  final _result = _sdkSearchSearchoptionsCreateHandle(_languageCodeHandle, _maxItemsHandle);
  sdkCoreLanguagecodeReleaseFfiHandleNullable(_languageCodeHandle);
  intReleaseFfiHandleNullable(_maxItemsHandle);
  return _result;
}

SearchOptions sdkSearchSearchoptionsFromFfi(Pointer<Void> handle) {
  final _languageCodeHandle = _sdkSearchSearchoptionsGetFieldlanguageCode(handle);
  final _maxItemsHandle = _sdkSearchSearchoptionsGetFieldmaxItems(handle);
  try {
    return SearchOptions._(
      sdkCoreLanguagecodeFromFfiNullable(_languageCodeHandle), 
      intFromFfiNullable(_maxItemsHandle)
    );
  } finally {
    sdkCoreLanguagecodeReleaseFfiHandleNullable(_languageCodeHandle);
    intReleaseFfiHandleNullable(_maxItemsHandle);
  }
}

void sdkSearchSearchoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchSearchoptionsReleaseHandle(handle);

// Nullable SearchOptions

final _sdkSearchSearchoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchOptions_create_handle_nullable'));
final _sdkSearchSearchoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchOptions_release_handle_nullable'));
final _sdkSearchSearchoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchOptions_get_value_nullable'));

Pointer<Void> sdkSearchSearchoptionsToFfiNullable(SearchOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchSearchoptionsToFfi(value);
  final result = _sdkSearchSearchoptionsCreateHandleNullable(_handle);
  sdkSearchSearchoptionsReleaseFfiHandle(_handle);
  return result;
}

SearchOptions? sdkSearchSearchoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchSearchoptionsGetValueNullable(handle);
  final result = sdkSearchSearchoptionsFromFfi(_handle);
  sdkSearchSearchoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchSearchoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchSearchoptionsReleaseHandleNullable(handle);

// End of SearchOptions "private" section.


