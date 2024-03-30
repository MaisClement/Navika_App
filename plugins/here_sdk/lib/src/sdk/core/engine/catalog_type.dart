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

/// Represents default HERE catalog types.
enum CatalogType {
    /// Catalog type for the so-called "rest of the world" (ROW). It covers the whole world, but
    /// may contain only a base map with fewer details for regions such as Japan.
    optimizedClientMap,
    /// Catalog type for Japan. Has to be used in combination with [CatalogType.optimizedClientMap].
    ///
    /// **Note:** This catalog type is only available on request. Please contact your HERE representative for more
    /// details. In order to load this map you need to enable your credentials with the help of the HERE team.
    optimizedClientMapJapan
}

// CatalogType "private" section, not exported.

int sdkCoreEngineCatalogtypeToFfi(CatalogType value) {
  switch (value) {
  case CatalogType.optimizedClientMap:
    return 0;
  case CatalogType.optimizedClientMapJapan:
    return 1;
  default:
    throw StateError("Invalid enum value $value for CatalogType enum.");
  }
}

CatalogType sdkCoreEngineCatalogtypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return CatalogType.optimizedClientMap;
  case 1:
    return CatalogType.optimizedClientMapJapan;
  default:
    throw StateError("Invalid numeric value $handle for CatalogType enum.");
  }
}

void sdkCoreEngineCatalogtypeReleaseFfiHandle(int handle) {}

final _sdkCoreEngineCatalogtypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_engine_CatalogType_create_handle_nullable'));
final _sdkCoreEngineCatalogtypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogType_release_handle_nullable'));
final _sdkCoreEngineCatalogtypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogType_get_value_nullable'));

Pointer<Void> sdkCoreEngineCatalogtypeToFfiNullable(CatalogType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineCatalogtypeToFfi(value);
  final result = _sdkCoreEngineCatalogtypeCreateHandleNullable(_handle);
  sdkCoreEngineCatalogtypeReleaseFfiHandle(_handle);
  return result;
}

CatalogType? sdkCoreEngineCatalogtypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineCatalogtypeGetValueNullable(handle);
  final result = sdkCoreEngineCatalogtypeFromFfi(_handle);
  sdkCoreEngineCatalogtypeReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineCatalogtypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineCatalogtypeReleaseHandleNullable(handle);

// End of CatalogType "private" section.


