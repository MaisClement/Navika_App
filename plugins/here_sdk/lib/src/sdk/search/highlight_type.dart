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

/// Specifies members of Suggestion class to which input query can be matched.
///
/// This API is not supported by offline search.
enum HighlightType {
    /// Suggestion.title
    title,
    /// Suggestion.Place.Address.label
    addressLabel
}

// HighlightType "private" section, not exported.

int sdkSearchHighlighttypeToFfi(HighlightType value) {
  switch (value) {
  case HighlightType.title:
    return 0;
  case HighlightType.addressLabel:
    return 1;
  default:
    throw StateError("Invalid enum value $value for HighlightType enum.");
  }
}

HighlightType sdkSearchHighlighttypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return HighlightType.title;
  case 1:
    return HighlightType.addressLabel;
  default:
    throw StateError("Invalid numeric value $handle for HighlightType enum.");
  }
}

void sdkSearchHighlighttypeReleaseFfiHandle(int handle) {}

final _sdkSearchHighlighttypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_HighlightType_create_handle_nullable'));
final _sdkSearchHighlighttypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_HighlightType_release_handle_nullable'));
final _sdkSearchHighlighttypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_HighlightType_get_value_nullable'));

Pointer<Void> sdkSearchHighlighttypeToFfiNullable(HighlightType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchHighlighttypeToFfi(value);
  final result = _sdkSearchHighlighttypeCreateHandleNullable(_handle);
  sdkSearchHighlighttypeReleaseFfiHandle(_handle);
  return result;
}

HighlightType? sdkSearchHighlighttypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchHighlighttypeGetValueNullable(handle);
  final result = sdkSearchHighlighttypeFromFfi(_handle);
  sdkSearchHighlighttypeReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchHighlighttypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchHighlighttypeReleaseHandleNullable(handle);

// End of HighlightType "private" section.


