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

/// Different types of objects that can be stored in a Metadata class instance.
enum MetadataType {
    /// CustomMetadataValue based object.
    custom,
    /// Double sized floating point value.
    double,
    /// GeoCoordinates object.
    geoCoordinates,
    /// Integer.
    integer,
    /// String object.
    string
}

// MetadataType "private" section, not exported.

int sdkCoreMetadatatypeToFfi(MetadataType value) {
  switch (value) {
  case MetadataType.custom:
    return 0;
  case MetadataType.double:
    return 1;
  case MetadataType.geoCoordinates:
    return 2;
  case MetadataType.integer:
    return 3;
  case MetadataType.string:
    return 4;
  default:
    throw StateError("Invalid enum value $value for MetadataType enum.");
  }
}

MetadataType sdkCoreMetadatatypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MetadataType.custom;
  case 1:
    return MetadataType.double;
  case 2:
    return MetadataType.geoCoordinates;
  case 3:
    return MetadataType.integer;
  case 4:
    return MetadataType.string;
  default:
    throw StateError("Invalid numeric value $handle for MetadataType enum.");
  }
}

void sdkCoreMetadatatypeReleaseFfiHandle(int handle) {}

final _sdkCoreMetadatatypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_MetadataType_create_handle_nullable'));
final _sdkCoreMetadatatypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_MetadataType_release_handle_nullable'));
final _sdkCoreMetadatatypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_MetadataType_get_value_nullable'));

Pointer<Void> sdkCoreMetadatatypeToFfiNullable(MetadataType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreMetadatatypeToFfi(value);
  final result = _sdkCoreMetadatatypeCreateHandleNullable(_handle);
  sdkCoreMetadatatypeReleaseFfiHandle(_handle);
  return result;
}

MetadataType? sdkCoreMetadatatypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreMetadatatypeGetValueNullable(handle);
  final result = sdkCoreMetadatatypeFromFfi(_handle);
  sdkCoreMetadatatypeReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreMetadatatypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreMetadatatypeReleaseHandleNullable(handle);

// End of MetadataType "private" section.


