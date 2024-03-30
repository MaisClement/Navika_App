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

/// Represents and error, which occurs during place serialization and deserialization routines.
enum PlaceSerializationError {
    /// Reason for error is unknown.
    unknown
}

// PlaceSerializationError "private" section, not exported.

int sdkSearchPlaceserializationerrorToFfi(PlaceSerializationError value) {
  switch (value) {
  case PlaceSerializationError.unknown:
    return 0;
  default:
    throw StateError("Invalid enum value $value for PlaceSerializationError enum.");
  }
}

PlaceSerializationError sdkSearchPlaceserializationerrorFromFfi(int handle) {
  switch (handle) {
  case 0:
    return PlaceSerializationError.unknown;
  default:
    throw StateError("Invalid numeric value $handle for PlaceSerializationError enum.");
  }
}

void sdkSearchPlaceserializationerrorReleaseFfiHandle(int handle) {}

final _sdkSearchPlaceserializationerrorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_PlaceSerializationError_create_handle_nullable'));
final _sdkSearchPlaceserializationerrorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceSerializationError_release_handle_nullable'));
final _sdkSearchPlaceserializationerrorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceSerializationError_get_value_nullable'));

Pointer<Void> sdkSearchPlaceserializationerrorToFfiNullable(PlaceSerializationError? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchPlaceserializationerrorToFfi(value);
  final result = _sdkSearchPlaceserializationerrorCreateHandleNullable(_handle);
  sdkSearchPlaceserializationerrorReleaseFfiHandle(_handle);
  return result;
}

PlaceSerializationError? sdkSearchPlaceserializationerrorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchPlaceserializationerrorGetValueNullable(handle);
  final result = sdkSearchPlaceserializationerrorFromFfi(_handle);
  sdkSearchPlaceserializationerrorReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchPlaceserializationerrorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchPlaceserializationerrorReleaseHandleNullable(handle);

// End of PlaceSerializationError "private" section.


