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
import 'package:here_sdk/src/sdk/search/web_source.dart';

/// Contains information about rating and a url to review.

class WebRating {
  /// Total number of ratings.
  int count;

  /// Avarage value of all ratings.
  double average;

  /// Detailed information about rating.
  WebSource source;

  /// Creates a new instance.
  /// [count] Total number of ratings.
  /// [average] Avarage value of all ratings.
  /// [source] Detailed information about rating.
  WebRating(this.count, this.average, this.source);
  /// Creates a new instance.
  WebRating.withDefaults()
      : count = 0, average = 0, source = WebSource.withDefaults();
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WebRating) return false;
    WebRating _other = other;
    return count == _other.count &&
        average == _other.average &&
        source == _other.source;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + count.hashCode;
    result = 31 * result + average.hashCode;
    result = 31 * result + source.hashCode;
    return result;
  }
}


// WebRating "private" section, not exported.

final _sdkSearchWebratingCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Double, Pointer<Void>),
    Pointer<Void> Function(int, double, Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_create_handle'));
final _sdkSearchWebratingReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_release_handle'));
final _sdkSearchWebratingGetFieldcount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_get_field_count'));
final _sdkSearchWebratingGetFieldaverage = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_get_field_average'));
final _sdkSearchWebratingGetFieldsource = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_get_field_source'));



Pointer<Void> sdkSearchWebratingToFfi(WebRating value) {
  final _countHandle = (value.count);
  final _averageHandle = (value.average);
  final _sourceHandle = sdkSearchWebsourceToFfi(value.source);
  final _result = _sdkSearchWebratingCreateHandle(_countHandle, _averageHandle, _sourceHandle);
  
  
  sdkSearchWebsourceReleaseFfiHandle(_sourceHandle);
  return _result;
}

WebRating sdkSearchWebratingFromFfi(Pointer<Void> handle) {
  final _countHandle = _sdkSearchWebratingGetFieldcount(handle);
  final _averageHandle = _sdkSearchWebratingGetFieldaverage(handle);
  final _sourceHandle = _sdkSearchWebratingGetFieldsource(handle);
  try {
    return WebRating(
      (_countHandle), 
      (_averageHandle), 
      sdkSearchWebsourceFromFfi(_sourceHandle)
    );
  } finally {
    
    
    sdkSearchWebsourceReleaseFfiHandle(_sourceHandle);
  }
}

void sdkSearchWebratingReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchWebratingReleaseHandle(handle);

// Nullable WebRating

final _sdkSearchWebratingCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_create_handle_nullable'));
final _sdkSearchWebratingReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_release_handle_nullable'));
final _sdkSearchWebratingGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebRating_get_value_nullable'));

Pointer<Void> sdkSearchWebratingToFfiNullable(WebRating? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchWebratingToFfi(value);
  final result = _sdkSearchWebratingCreateHandleNullable(_handle);
  sdkSearchWebratingReleaseFfiHandle(_handle);
  return result;
}

WebRating? sdkSearchWebratingFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchWebratingGetValueNullable(handle);
  final result = sdkSearchWebratingFromFfi(_handle);
  sdkSearchWebratingReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchWebratingReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchWebratingReleaseHandleNullable(handle);

// End of WebRating "private" section.


