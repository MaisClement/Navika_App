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
import 'package:here_sdk/src/sdk/search/web_source.dart';

/// Contains image information and direct link to it.

class WebImage {
  /// Photo publication date.
  DateTime date;

  /// Detailed information about image.
  WebSource source;

  /// Creates a new instance.

  /// [date] Photo publication date.

  /// [source] Detailed information about image.

  WebImage(this.date, this.source);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WebImage) return false;
    WebImage _other = other;
    return date == _other.date &&
        source == _other.source;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + date.hashCode;
    result = 31 * result + source.hashCode;
    return result;
  }
}


// WebImage "private" section, not exported.

final _sdkSearchWebimageCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('here_sdk_sdk_search_WebImage_create_handle'));
final _sdkSearchWebimageReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebImage_release_handle'));
final _sdkSearchWebimageGetFielddate = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebImage_get_field_date'));
final _sdkSearchWebimageGetFieldsource = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebImage_get_field_source'));



Pointer<Void> sdkSearchWebimageToFfi(WebImage value) {
  final _dateHandle = dateToFfi(value.date);
  final _sourceHandle = sdkSearchWebsourceToFfi(value.source);
  final _result = _sdkSearchWebimageCreateHandle(_dateHandle, _sourceHandle);
  dateReleaseFfiHandle(_dateHandle);
  sdkSearchWebsourceReleaseFfiHandle(_sourceHandle);
  return _result;
}

WebImage sdkSearchWebimageFromFfi(Pointer<Void> handle) {
  final _dateHandle = _sdkSearchWebimageGetFielddate(handle);
  final _sourceHandle = _sdkSearchWebimageGetFieldsource(handle);
  try {
    return WebImage(
      dateFromFfi(_dateHandle), 
      sdkSearchWebsourceFromFfi(_sourceHandle)
    );
  } finally {
    dateReleaseFfiHandle(_dateHandle);
    sdkSearchWebsourceReleaseFfiHandle(_sourceHandle);
  }
}

void sdkSearchWebimageReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchWebimageReleaseHandle(handle);

// Nullable WebImage

final _sdkSearchWebimageCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebImage_create_handle_nullable'));
final _sdkSearchWebimageReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebImage_release_handle_nullable'));
final _sdkSearchWebimageGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebImage_get_value_nullable'));

Pointer<Void> sdkSearchWebimageToFfiNullable(WebImage? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchWebimageToFfi(value);
  final result = _sdkSearchWebimageCreateHandleNullable(_handle);
  sdkSearchWebimageReleaseFfiHandle(_handle);
  return result;
}

WebImage? sdkSearchWebimageFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchWebimageGetValueNullable(handle);
  final result = sdkSearchWebimageFromFfi(_handle);
  sdkSearchWebimageReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchWebimageReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchWebimageReleaseHandleNullable(handle);

// End of WebImage "private" section.


