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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/search/place_category.dart';

/// Represents data related to specific website address

class WebsiteAddress {
  /// The website address.
  String address;

  /// Categories associated with website address.
  /// Note: In case [WebsiteAddress.categories] are not empty, then [WebsiteAddress.address] should be used according to given categories.
  /// Otherwise, [WebsiteAddress.address] is meant for general use.
  List<PlaceCategory> categories;

  /// Creates a new instance.

  /// [address] The website address.

  /// [categories] Categories associated with website address.
  /// Note: In case [WebsiteAddress.categories] are not empty, then [WebsiteAddress.address] should be used according to given categories.
  /// Otherwise, [WebsiteAddress.address] is meant for general use.

  WebsiteAddress(this.address, this.categories);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WebsiteAddress) return false;
    WebsiteAddress _other = other;
    return address == _other.address &&
        DeepCollectionEquality().equals(categories, _other.categories);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + address.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(categories);
    return result;
  }
}


// WebsiteAddress "private" section, not exported.

final _sdkSearchWebsiteaddressCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_WebsiteAddress_create_handle'));
final _sdkSearchWebsiteaddressReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebsiteAddress_release_handle'));
final _sdkSearchWebsiteaddressGetFieldaddress = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebsiteAddress_get_field_address'));
final _sdkSearchWebsiteaddressGetFieldcategories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebsiteAddress_get_field_categories'));



Pointer<Void> sdkSearchWebsiteaddressToFfi(WebsiteAddress value) {
  final _addressHandle = stringToFfi(value.address);
  final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(value.categories);
  final _result = _sdkSearchWebsiteaddressCreateHandle(_addressHandle, _categoriesHandle);
  stringReleaseFfiHandle(_addressHandle);
  heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  return _result;
}

WebsiteAddress sdkSearchWebsiteaddressFromFfi(Pointer<Void> handle) {
  final _addressHandle = _sdkSearchWebsiteaddressGetFieldaddress(handle);
  final _categoriesHandle = _sdkSearchWebsiteaddressGetFieldcategories(handle);
  try {
    return WebsiteAddress(
      stringFromFfi(_addressHandle), 
      heresdkSearchCommonBindingslistofSdkSearchPlacecategoryFromFfi(_categoriesHandle)
    );
  } finally {
    stringReleaseFfiHandle(_addressHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  }
}

void sdkSearchWebsiteaddressReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchWebsiteaddressReleaseHandle(handle);

// Nullable WebsiteAddress

final _sdkSearchWebsiteaddressCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebsiteAddress_create_handle_nullable'));
final _sdkSearchWebsiteaddressReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebsiteAddress_release_handle_nullable'));
final _sdkSearchWebsiteaddressGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebsiteAddress_get_value_nullable'));

Pointer<Void> sdkSearchWebsiteaddressToFfiNullable(WebsiteAddress? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchWebsiteaddressToFfi(value);
  final result = _sdkSearchWebsiteaddressCreateHandleNullable(_handle);
  sdkSearchWebsiteaddressReleaseFfiHandle(_handle);
  return result;
}

WebsiteAddress? sdkSearchWebsiteaddressFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchWebsiteaddressGetValueNullable(handle);
  final result = sdkSearchWebsiteaddressFromFfi(_handle);
  sdkSearchWebsiteaddressReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchWebsiteaddressReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchWebsiteaddressReleaseHandleNullable(handle);

// End of WebsiteAddress "private" section.


