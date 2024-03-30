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

/// Contains information about provider of the item
/// and a direct link to the item.

class WebSource {
  /// Direct link to the page containing source.
  String href;

  /// Original supplier of the item.
  String supplierId;

  /// Creates a new instance.
  /// [href] Direct link to the page containing source.
  /// [supplierId] Original supplier of the item.
  WebSource(this.href, this.supplierId);
  /// Creates a new instance.
  WebSource.withDefaults()
      : href = "", supplierId = "";
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WebSource) return false;
    WebSource _other = other;
    return href == _other.href &&
        supplierId == _other.supplierId;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + href.hashCode;
    result = 31 * result + supplierId.hashCode;
    return result;
  }
}


// WebSource "private" section, not exported.

final _sdkSearchWebsourceCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_WebSource_create_handle'));
final _sdkSearchWebsourceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebSource_release_handle'));
final _sdkSearchWebsourceGetFieldhref = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebSource_get_field_href'));
final _sdkSearchWebsourceGetFieldsupplierId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebSource_get_field_supplierId'));



Pointer<Void> sdkSearchWebsourceToFfi(WebSource value) {
  final _hrefHandle = stringToFfi(value.href);
  final _supplierIdHandle = stringToFfi(value.supplierId);
  final _result = _sdkSearchWebsourceCreateHandle(_hrefHandle, _supplierIdHandle);
  stringReleaseFfiHandle(_hrefHandle);
  stringReleaseFfiHandle(_supplierIdHandle);
  return _result;
}

WebSource sdkSearchWebsourceFromFfi(Pointer<Void> handle) {
  final _hrefHandle = _sdkSearchWebsourceGetFieldhref(handle);
  final _supplierIdHandle = _sdkSearchWebsourceGetFieldsupplierId(handle);
  try {
    return WebSource(
      stringFromFfi(_hrefHandle), 
      stringFromFfi(_supplierIdHandle)
    );
  } finally {
    stringReleaseFfiHandle(_hrefHandle);
    stringReleaseFfiHandle(_supplierIdHandle);
  }
}

void sdkSearchWebsourceReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchWebsourceReleaseHandle(handle);

// Nullable WebSource

final _sdkSearchWebsourceCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebSource_create_handle_nullable'));
final _sdkSearchWebsourceReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebSource_release_handle_nullable'));
final _sdkSearchWebsourceGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebSource_get_value_nullable'));

Pointer<Void> sdkSearchWebsourceToFfiNullable(WebSource? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchWebsourceToFfi(value);
  final result = _sdkSearchWebsourceCreateHandleNullable(_handle);
  sdkSearchWebsourceReleaseFfiHandle(_handle);
  return result;
}

WebSource? sdkSearchWebsourceFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchWebsourceGetValueNullable(handle);
  final result = sdkSearchWebsourceFromFfi(_handle);
  sdkSearchWebsourceReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchWebsourceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchWebsourceReleaseHandleNullable(handle);

// End of WebSource "private" section.


