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

/// Address type
enum AddressType {
    /// Block
    block,
    /// Subblock
    subblock,
    /// House number
    houseNumber
}

// AddressType "private" section, not exported.

int sdkSearchAddresstypeToFfi(AddressType value) {
  switch (value) {
  case AddressType.block:
    return 0;
  case AddressType.subblock:
    return 1;
  case AddressType.houseNumber:
    return 2;
  default:
    throw StateError("Invalid enum value $value for AddressType enum.");
  }
}

AddressType sdkSearchAddresstypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return AddressType.block;
  case 1:
    return AddressType.subblock;
  case 2:
    return AddressType.houseNumber;
  default:
    throw StateError("Invalid numeric value $handle for AddressType enum.");
  }
}

void sdkSearchAddresstypeReleaseFfiHandle(int handle) {}

final _sdkSearchAddresstypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_AddressType_create_handle_nullable'));
final _sdkSearchAddresstypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressType_release_handle_nullable'));
final _sdkSearchAddresstypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressType_get_value_nullable'));

Pointer<Void> sdkSearchAddresstypeToFfiNullable(AddressType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchAddresstypeToFfi(value);
  final result = _sdkSearchAddresstypeCreateHandleNullable(_handle);
  sdkSearchAddresstypeReleaseFfiHandle(_handle);
  return result;
}

AddressType? sdkSearchAddresstypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchAddresstypeGetValueNullable(handle);
  final result = sdkSearchAddresstypeFromFfi(_handle);
  sdkSearchAddresstypeReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchAddresstypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchAddresstypeReleaseHandleNullable(handle);

// End of AddressType "private" section.


