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

/// Represents data related to specific email address.

class EmailAddress {
  /// The email address.
  String address;

  /// Categories associated with email address.
  /// Note: In case [EmailAddress.categories] are not empty, then [EmailAddress.address] should be used according to given categories.
  /// Otherwise, [EmailAddress.address] is meant for general use.
  List<PlaceCategory> categories;

  /// Creates a new instance.

  /// [address] The email address.

  /// [categories] Categories associated with email address.
  /// Note: In case [EmailAddress.categories] are not empty, then [EmailAddress.address] should be used according to given categories.
  /// Otherwise, [EmailAddress.address] is meant for general use.

  EmailAddress(this.address, this.categories);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EmailAddress) return false;
    EmailAddress _other = other;
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


// EmailAddress "private" section, not exported.

final _sdkSearchEmailaddressCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_EmailAddress_create_handle'));
final _sdkSearchEmailaddressReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EmailAddress_release_handle'));
final _sdkSearchEmailaddressGetFieldaddress = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EmailAddress_get_field_address'));
final _sdkSearchEmailaddressGetFieldcategories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EmailAddress_get_field_categories'));



Pointer<Void> sdkSearchEmailaddressToFfi(EmailAddress value) {
  final _addressHandle = stringToFfi(value.address);
  final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(value.categories);
  final _result = _sdkSearchEmailaddressCreateHandle(_addressHandle, _categoriesHandle);
  stringReleaseFfiHandle(_addressHandle);
  heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  return _result;
}

EmailAddress sdkSearchEmailaddressFromFfi(Pointer<Void> handle) {
  final _addressHandle = _sdkSearchEmailaddressGetFieldaddress(handle);
  final _categoriesHandle = _sdkSearchEmailaddressGetFieldcategories(handle);
  try {
    return EmailAddress(
      stringFromFfi(_addressHandle), 
      heresdkSearchCommonBindingslistofSdkSearchPlacecategoryFromFfi(_categoriesHandle)
    );
  } finally {
    stringReleaseFfiHandle(_addressHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  }
}

void sdkSearchEmailaddressReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchEmailaddressReleaseHandle(handle);

// Nullable EmailAddress

final _sdkSearchEmailaddressCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EmailAddress_create_handle_nullable'));
final _sdkSearchEmailaddressReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EmailAddress_release_handle_nullable'));
final _sdkSearchEmailaddressGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EmailAddress_get_value_nullable'));

Pointer<Void> sdkSearchEmailaddressToFfiNullable(EmailAddress? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchEmailaddressToFfi(value);
  final result = _sdkSearchEmailaddressCreateHandleNullable(_handle);
  sdkSearchEmailaddressReleaseFfiHandle(_handle);
  return result;
}

EmailAddress? sdkSearchEmailaddressFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchEmailaddressGetValueNullable(handle);
  final result = sdkSearchEmailaddressFromFfi(_handle);
  sdkSearchEmailaddressReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchEmailaddressReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchEmailaddressReleaseHandleNullable(handle);

// End of EmailAddress "private" section.


