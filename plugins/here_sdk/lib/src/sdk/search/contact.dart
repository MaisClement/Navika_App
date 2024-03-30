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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/search/email_address.dart';
import 'package:here_sdk/src/sdk/search/landline_phone.dart';
import 'package:here_sdk/src/sdk/search/mobile_phone.dart';
import 'package:here_sdk/src/sdk/search/website_address.dart';

/// Represents contact information.

class Contact {
  /// The list of landline phone numbers with associated categories.
  /// This data is not available in offline search.
  List<LandlinePhone> landlinePhones;

  /// The list of mobile phones numbers with associated categories.
  /// This data is not available in offline search.
  List<MobilePhone> mobilePhones;

  /// The list of email addresses with associated categories.
  /// This data is not available in offline search.
  List<EmailAddress> emails;

  /// The list of website addresses with associated categories.
  /// This data is not available in offline search.
  List<WebsiteAddress> websites;

  /// Creates a new instance.
  Contact.withDefaults()
      : landlinePhones = [], mobilePhones = [], emails = [], websites = [];
  /// Creates a new instance.
  /// [landlinePhones] The list of landline phone numbers with associated categories.
  /// This data is not available in offline search.
  /// [mobilePhones] The list of mobile phones numbers with associated categories.
  /// This data is not available in offline search.
  /// [emails] The list of email addresses with associated categories.
  /// This data is not available in offline search.
  /// [websites] The list of website addresses with associated categories.
  /// This data is not available in offline search.
  Contact(this.landlinePhones, this.mobilePhones, this.emails, this.websites);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Contact) return false;
    Contact _other = other;
    return DeepCollectionEquality().equals(landlinePhones, _other.landlinePhones) &&
        DeepCollectionEquality().equals(mobilePhones, _other.mobilePhones) &&
        DeepCollectionEquality().equals(emails, _other.emails) &&
        DeepCollectionEquality().equals(websites, _other.websites);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(landlinePhones);
    result = 31 * result + DeepCollectionEquality().hash(mobilePhones);
    result = 31 * result + DeepCollectionEquality().hash(emails);
    result = 31 * result + DeepCollectionEquality().hash(websites);
    return result;
  }
}


// Contact "private" section, not exported.

final _sdkSearchContactCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_Contact_create_handle'));
final _sdkSearchContactReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_release_handle'));
final _sdkSearchContactGetFieldlandlinePhones = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_get_field_landlinePhones'));
final _sdkSearchContactGetFieldmobilePhones = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_get_field_mobilePhones'));
final _sdkSearchContactGetFieldemails = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_get_field_emails'));
final _sdkSearchContactGetFieldwebsites = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_get_field_websites'));



Pointer<Void> sdkSearchContactToFfi(Contact value) {
  final _landlinePhonesHandle = heresdkSearchCommonBindingslistofSdkSearchLandlinephoneToFfi(value.landlinePhones);
  final _mobilePhonesHandle = heresdkSearchCommonBindingslistofSdkSearchMobilephoneToFfi(value.mobilePhones);
  final _emailsHandle = heresdkSearchCommonBindingslistofSdkSearchEmailaddressToFfi(value.emails);
  final _websitesHandle = heresdkSearchCommonBindingslistofSdkSearchWebsiteaddressToFfi(value.websites);
  final _result = _sdkSearchContactCreateHandle(_landlinePhonesHandle, _mobilePhonesHandle, _emailsHandle, _websitesHandle);
  heresdkSearchCommonBindingslistofSdkSearchLandlinephoneReleaseFfiHandle(_landlinePhonesHandle);
  heresdkSearchCommonBindingslistofSdkSearchMobilephoneReleaseFfiHandle(_mobilePhonesHandle);
  heresdkSearchCommonBindingslistofSdkSearchEmailaddressReleaseFfiHandle(_emailsHandle);
  heresdkSearchCommonBindingslistofSdkSearchWebsiteaddressReleaseFfiHandle(_websitesHandle);
  return _result;
}

Contact sdkSearchContactFromFfi(Pointer<Void> handle) {
  final _landlinePhonesHandle = _sdkSearchContactGetFieldlandlinePhones(handle);
  final _mobilePhonesHandle = _sdkSearchContactGetFieldmobilePhones(handle);
  final _emailsHandle = _sdkSearchContactGetFieldemails(handle);
  final _websitesHandle = _sdkSearchContactGetFieldwebsites(handle);
  try {
    return Contact(
      heresdkSearchCommonBindingslistofSdkSearchLandlinephoneFromFfi(_landlinePhonesHandle), 
      heresdkSearchCommonBindingslistofSdkSearchMobilephoneFromFfi(_mobilePhonesHandle), 
      heresdkSearchCommonBindingslistofSdkSearchEmailaddressFromFfi(_emailsHandle), 
      heresdkSearchCommonBindingslistofSdkSearchWebsiteaddressFromFfi(_websitesHandle)
    );
  } finally {
    heresdkSearchCommonBindingslistofSdkSearchLandlinephoneReleaseFfiHandle(_landlinePhonesHandle);
    heresdkSearchCommonBindingslistofSdkSearchMobilephoneReleaseFfiHandle(_mobilePhonesHandle);
    heresdkSearchCommonBindingslistofSdkSearchEmailaddressReleaseFfiHandle(_emailsHandle);
    heresdkSearchCommonBindingslistofSdkSearchWebsiteaddressReleaseFfiHandle(_websitesHandle);
  }
}

void sdkSearchContactReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchContactReleaseHandle(handle);

// Nullable Contact

final _sdkSearchContactCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_create_handle_nullable'));
final _sdkSearchContactReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_release_handle_nullable'));
final _sdkSearchContactGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Contact_get_value_nullable'));

Pointer<Void> sdkSearchContactToFfiNullable(Contact? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchContactToFfi(value);
  final result = _sdkSearchContactCreateHandleNullable(_handle);
  sdkSearchContactReleaseFfiHandle(_handle);
  return result;
}

Contact? sdkSearchContactFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchContactGetValueNullable(handle);
  final result = sdkSearchContactFromFfi(_handle);
  sdkSearchContactReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchContactReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchContactReleaseHandleNullable(handle);

// End of Contact "private" section.


