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
import 'dart:io' as io;
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'internet_address_converter.dart';


class InternetAddressInternal {
  /// Representation of IP Address
  String address;

  InternetAddressInternal(this.address);
}


// InternetAddress "private" section, not exported.

final _sdkCoreInternetaddressCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_InternetAddress_create_handle'));
final _sdkCoreInternetaddressReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_InternetAddress_release_handle'));
final _sdkCoreInternetaddressGetFieldaddress = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_InternetAddress_get_field_address'));



Pointer<Void> sdkCoreInternetaddressToFfi(io.InternetAddress valueExternal) {
  final value = InternetAddressConverter.convertToInternal(valueExternal);
  final _addressHandle = stringToFfi(value.address);
  final _result = _sdkCoreInternetaddressCreateHandle(_addressHandle);
  stringReleaseFfiHandle(_addressHandle);
  return _result;
}

io.InternetAddress sdkCoreInternetaddressFromFfi(Pointer<Void> handle) {
  final _addressHandle = _sdkCoreInternetaddressGetFieldaddress(handle);
  try {
    final resultInternal = InternetAddressInternal(
      stringFromFfi(_addressHandle)
    );
    return InternetAddressConverter.convertFromInternal(resultInternal);
  } finally {
    stringReleaseFfiHandle(_addressHandle);
  }
}

void sdkCoreInternetaddressReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreInternetaddressReleaseHandle(handle);

// Nullable InternetAddress

final _sdkCoreInternetaddressCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_InternetAddress_create_handle_nullable'));
final _sdkCoreInternetaddressReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_InternetAddress_release_handle_nullable'));
final _sdkCoreInternetaddressGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_InternetAddress_get_value_nullable'));

Pointer<Void> sdkCoreInternetaddressToFfiNullable(io.InternetAddress? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreInternetaddressToFfi(value);
  final result = _sdkCoreInternetaddressCreateHandleNullable(_handle);
  sdkCoreInternetaddressReleaseFfiHandle(_handle);
  return result;
}

io.InternetAddress? sdkCoreInternetaddressFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreInternetaddressGetValueNullable(handle);
  final result = sdkCoreInternetaddressFromFfi(_handle);
  sdkCoreInternetaddressReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreInternetaddressReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreInternetaddressReleaseHandleNullable(handle);

// End of InternetAddress "private" section.


