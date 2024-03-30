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

/// Specifies the type of suggestion returned for query.
///
/// This API is not supported by offline search.
enum SuggestionType {
    /// Suggestion of category, for example restaurant, museum, hotel, etc.
    category,
    /// Suggestion of a business or non-business chain, for example specific supermarket or restaurant chain.
    chain,
    /// Suggestion of a concrete place in the world, for example a specific restaurant, address, country, etc.
    place
}

// SuggestionType "private" section, not exported.

int sdkSearchSuggestiontypeToFfi(SuggestionType value) {
  switch (value) {
  case SuggestionType.category:
    return 0;
  case SuggestionType.chain:
    return 1;
  case SuggestionType.place:
    return 2;
  default:
    throw StateError("Invalid enum value $value for SuggestionType enum.");
  }
}

SuggestionType sdkSearchSuggestiontypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return SuggestionType.category;
  case 1:
    return SuggestionType.chain;
  case 2:
    return SuggestionType.place;
  default:
    throw StateError("Invalid numeric value $handle for SuggestionType enum.");
  }
}

void sdkSearchSuggestiontypeReleaseFfiHandle(int handle) {}

final _sdkSearchSuggestiontypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_SuggestionType_create_handle_nullable'));
final _sdkSearchSuggestiontypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestionType_release_handle_nullable'));
final _sdkSearchSuggestiontypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SuggestionType_get_value_nullable'));

Pointer<Void> sdkSearchSuggestiontypeToFfiNullable(SuggestionType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchSuggestiontypeToFfi(value);
  final result = _sdkSearchSuggestiontypeCreateHandleNullable(_handle);
  sdkSearchSuggestiontypeReleaseFfiHandle(_handle);
  return result;
}

SuggestionType? sdkSearchSuggestiontypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchSuggestiontypeGetValueNullable(handle);
  final result = sdkSearchSuggestiontypeFromFfi(_handle);
  sdkSearchSuggestiontypeReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchSuggestiontypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchSuggestiontypeReleaseHandleNullable(handle);

// End of SuggestionType "private" section.


