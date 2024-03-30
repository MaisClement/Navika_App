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

/// Represents data related to specific mobile phone number.

class MobilePhone {
  /// The phone number.
  String phoneNumber;

  /// Categories associated with phone number.
  /// Note: In case [MobilePhone.categories] are not empty, then [MobilePhone.phoneNumber] should be used according to given categories.
  /// Otherwise, [MobilePhone.phoneNumber] is meant for general use.
  List<PlaceCategory> categories;

  /// Creates a new instance.
  MobilePhone.withDefaults()
      : phoneNumber = "", categories = [];
  /// Creates a new instance.
  /// [phoneNumber] The phone number.
  /// [categories] Categories associated with phone number.
  /// Note: In case [MobilePhone.categories] are not empty, then [MobilePhone.phoneNumber] should be used according to given categories.
  /// Otherwise, [MobilePhone.phoneNumber] is meant for general use.
  MobilePhone(this.phoneNumber, this.categories);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MobilePhone) return false;
    MobilePhone _other = other;
    return phoneNumber == _other.phoneNumber &&
        DeepCollectionEquality().equals(categories, _other.categories);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + phoneNumber.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(categories);
    return result;
  }
}


// MobilePhone "private" section, not exported.

final _sdkSearchMobilephoneCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_MobilePhone_create_handle'));
final _sdkSearchMobilephoneReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_MobilePhone_release_handle'));
final _sdkSearchMobilephoneGetFieldphoneNumber = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_MobilePhone_get_field_phoneNumber'));
final _sdkSearchMobilephoneGetFieldcategories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_MobilePhone_get_field_categories'));



Pointer<Void> sdkSearchMobilephoneToFfi(MobilePhone value) {
  final _phoneNumberHandle = stringToFfi(value.phoneNumber);
  final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(value.categories);
  final _result = _sdkSearchMobilephoneCreateHandle(_phoneNumberHandle, _categoriesHandle);
  stringReleaseFfiHandle(_phoneNumberHandle);
  heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  return _result;
}

MobilePhone sdkSearchMobilephoneFromFfi(Pointer<Void> handle) {
  final _phoneNumberHandle = _sdkSearchMobilephoneGetFieldphoneNumber(handle);
  final _categoriesHandle = _sdkSearchMobilephoneGetFieldcategories(handle);
  try {
    return MobilePhone(
      stringFromFfi(_phoneNumberHandle), 
      heresdkSearchCommonBindingslistofSdkSearchPlacecategoryFromFfi(_categoriesHandle)
    );
  } finally {
    stringReleaseFfiHandle(_phoneNumberHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  }
}

void sdkSearchMobilephoneReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchMobilephoneReleaseHandle(handle);

// Nullable MobilePhone

final _sdkSearchMobilephoneCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_MobilePhone_create_handle_nullable'));
final _sdkSearchMobilephoneReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_MobilePhone_release_handle_nullable'));
final _sdkSearchMobilephoneGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_MobilePhone_get_value_nullable'));

Pointer<Void> sdkSearchMobilephoneToFfiNullable(MobilePhone? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchMobilephoneToFfi(value);
  final result = _sdkSearchMobilephoneCreateHandleNullable(_handle);
  sdkSearchMobilephoneReleaseFfiHandle(_handle);
  return result;
}

MobilePhone? sdkSearchMobilephoneFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchMobilephoneGetValueNullable(handle);
  final result = sdkSearchMobilephoneFromFfi(_handle);
  sdkSearchMobilephoneReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchMobilephoneReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchMobilephoneReleaseHandleNullable(handle);

// End of MobilePhone "private" section.


