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

/// Represents data related to specific landline phone number.

class LandlinePhone {
  /// The phone number.
  String phoneNumber;

  /// Categories associated with phone number.
  /// Note: In case [LandlinePhone.categories] are not empty, then [LandlinePhone.phoneNumber] should be used according to given categories.
  /// Otherwise, [LandlinePhone.phoneNumber] is meant for general use.
  List<PlaceCategory> categories;

  /// Creates a new instance.
  LandlinePhone.withDefaults()
      : phoneNumber = "", categories = [];
  /// Creates a new instance.
  /// [phoneNumber] The phone number.
  /// [categories] Categories associated with phone number.
  /// Note: In case [LandlinePhone.categories] are not empty, then [LandlinePhone.phoneNumber] should be used according to given categories.
  /// Otherwise, [LandlinePhone.phoneNumber] is meant for general use.
  LandlinePhone(this.phoneNumber, this.categories);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LandlinePhone) return false;
    LandlinePhone _other = other;
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


// LandlinePhone "private" section, not exported.

final _sdkSearchLandlinephoneCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_LandlinePhone_create_handle'));
final _sdkSearchLandlinephoneReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_LandlinePhone_release_handle'));
final _sdkSearchLandlinephoneGetFieldphoneNumber = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_LandlinePhone_get_field_phoneNumber'));
final _sdkSearchLandlinephoneGetFieldcategories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_LandlinePhone_get_field_categories'));



Pointer<Void> sdkSearchLandlinephoneToFfi(LandlinePhone value) {
  final _phoneNumberHandle = stringToFfi(value.phoneNumber);
  final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(value.categories);
  final _result = _sdkSearchLandlinephoneCreateHandle(_phoneNumberHandle, _categoriesHandle);
  stringReleaseFfiHandle(_phoneNumberHandle);
  heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  return _result;
}

LandlinePhone sdkSearchLandlinephoneFromFfi(Pointer<Void> handle) {
  final _phoneNumberHandle = _sdkSearchLandlinephoneGetFieldphoneNumber(handle);
  final _categoriesHandle = _sdkSearchLandlinephoneGetFieldcategories(handle);
  try {
    return LandlinePhone(
      stringFromFfi(_phoneNumberHandle), 
      heresdkSearchCommonBindingslistofSdkSearchPlacecategoryFromFfi(_categoriesHandle)
    );
  } finally {
    stringReleaseFfiHandle(_phoneNumberHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  }
}

void sdkSearchLandlinephoneReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchLandlinephoneReleaseHandle(handle);

// Nullable LandlinePhone

final _sdkSearchLandlinephoneCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_LandlinePhone_create_handle_nullable'));
final _sdkSearchLandlinephoneReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_LandlinePhone_release_handle_nullable'));
final _sdkSearchLandlinephoneGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_LandlinePhone_get_value_nullable'));

Pointer<Void> sdkSearchLandlinephoneToFfiNullable(LandlinePhone? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchLandlinephoneToFfi(value);
  final result = _sdkSearchLandlinephoneCreateHandleNullable(_handle);
  sdkSearchLandlinephoneReleaseFfiHandle(_handle);
  return result;
}

LandlinePhone? sdkSearchLandlinephoneFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchLandlinephoneGetValueNullable(handle);
  final result = sdkSearchLandlinephoneFromFfi(_handle);
  sdkSearchLandlinephoneReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchLandlinephoneReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchLandlinephoneReleaseHandleNullable(handle);

// End of LandlinePhone "private" section.


