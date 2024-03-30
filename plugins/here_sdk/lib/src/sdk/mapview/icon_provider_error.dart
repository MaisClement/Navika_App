// Copyright (c) 2019-2023 HERE Global B.V. and its affiliate(s).
// All rights reserved.
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

/// Error which indicates why an icon could not be retrieved.
enum IconProviderError {
    /// The provided MapView has been destroyed.
    invalidState,
    /// For the given combination of parameters there was no entry found in the list of icons.
    iconNotFound,
    /// There was an error processing the icon.
    iconHandlingFailed
}

// IconProviderError "private" section, not exported.

int sdkMapviewIconprovidererrorToFfi(IconProviderError value) {
  switch (value) {
  case IconProviderError.invalidState:
    return 0;
  case IconProviderError.iconNotFound:
    return 1;
  case IconProviderError.iconHandlingFailed:
    return 2;
  default:
    throw StateError("Invalid enum value $value for IconProviderError enum.");
  }
}

IconProviderError sdkMapviewIconprovidererrorFromFfi(int handle) {
  switch (handle) {
  case 0:
    return IconProviderError.invalidState;
  case 1:
    return IconProviderError.iconNotFound;
  case 2:
    return IconProviderError.iconHandlingFailed;
  default:
    throw StateError("Invalid numeric value $handle for IconProviderError enum.");
  }
}

void sdkMapviewIconprovidererrorReleaseFfiHandle(int handle) {}

final _sdkMapviewIconprovidererrorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_IconProviderError_create_handle_nullable'));
final _sdkMapviewIconprovidererrorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_IconProviderError_release_handle_nullable'));
final _sdkMapviewIconprovidererrorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_IconProviderError_get_value_nullable'));

Pointer<Void> sdkMapviewIconprovidererrorToFfiNullable(IconProviderError? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewIconprovidererrorToFfi(value);
  final result = _sdkMapviewIconprovidererrorCreateHandleNullable(_handle);
  sdkMapviewIconprovidererrorReleaseFfiHandle(_handle);
  return result;
}

IconProviderError? sdkMapviewIconprovidererrorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewIconprovidererrorGetValueNullable(handle);
  final result = sdkMapviewIconprovidererrorFromFfi(_handle);
  sdkMapviewIconprovidererrorReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewIconprovidererrorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewIconprovidererrorReleaseHandleNullable(handle);

// End of IconProviderError "private" section.


