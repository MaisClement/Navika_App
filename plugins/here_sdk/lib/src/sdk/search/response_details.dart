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

/// Structure holding various information received with response to a query.

class ResponseDetails {
  /// ID used to correlate multiple, related queries.
  String correlationId;

  /// ID of original query request.
  String requestId;

  /// Creates a new instance.

  /// [correlationId] ID used to correlate multiple, related queries.

  /// [requestId] ID of original query request.

  ResponseDetails(this.correlationId, this.requestId);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ResponseDetails) return false;
    ResponseDetails _other = other;
    return correlationId == _other.correlationId &&
        requestId == _other.requestId;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + correlationId.hashCode;
    result = 31 * result + requestId.hashCode;
    return result;
  }
}


// ResponseDetails "private" section, not exported.

final _sdkSearchResponsedetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_ResponseDetails_create_handle'));
final _sdkSearchResponsedetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_ResponseDetails_release_handle'));
final _sdkSearchResponsedetailsGetFieldcorrelationId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ResponseDetails_get_field_correlationId'));
final _sdkSearchResponsedetailsGetFieldrequestId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ResponseDetails_get_field_requestId'));



Pointer<Void> sdkSearchResponsedetailsToFfi(ResponseDetails value) {
  final _correlationIdHandle = stringToFfi(value.correlationId);
  final _requestIdHandle = stringToFfi(value.requestId);
  final _result = _sdkSearchResponsedetailsCreateHandle(_correlationIdHandle, _requestIdHandle);
  stringReleaseFfiHandle(_correlationIdHandle);
  stringReleaseFfiHandle(_requestIdHandle);
  return _result;
}

ResponseDetails sdkSearchResponsedetailsFromFfi(Pointer<Void> handle) {
  final _correlationIdHandle = _sdkSearchResponsedetailsGetFieldcorrelationId(handle);
  final _requestIdHandle = _sdkSearchResponsedetailsGetFieldrequestId(handle);
  try {
    return ResponseDetails(
      stringFromFfi(_correlationIdHandle), 
      stringFromFfi(_requestIdHandle)
    );
  } finally {
    stringReleaseFfiHandle(_correlationIdHandle);
    stringReleaseFfiHandle(_requestIdHandle);
  }
}

void sdkSearchResponsedetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchResponsedetailsReleaseHandle(handle);

// Nullable ResponseDetails

final _sdkSearchResponsedetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ResponseDetails_create_handle_nullable'));
final _sdkSearchResponsedetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_ResponseDetails_release_handle_nullable'));
final _sdkSearchResponsedetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ResponseDetails_get_value_nullable'));

Pointer<Void> sdkSearchResponsedetailsToFfiNullable(ResponseDetails? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchResponsedetailsToFfi(value);
  final result = _sdkSearchResponsedetailsCreateHandleNullable(_handle);
  sdkSearchResponsedetailsReleaseFfiHandle(_handle);
  return result;
}

ResponseDetails? sdkSearchResponsedetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchResponsedetailsGetValueNullable(handle);
  final result = sdkSearchResponsedetailsFromFfi(_handle);
  sdkSearchResponsedetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchResponsedetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchResponsedetailsReleaseHandleNullable(handle);

// End of ResponseDetails "private" section.


