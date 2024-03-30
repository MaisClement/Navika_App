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

/// Technology or provider of the location.
enum LocationTechnology {
    /// Cellular network positioning.
    cellular,
    /// GNSS positioning.
    gnss,
    /// HD GNSS positioning.
    hdGnss,
    /// WiFi network positioning.
    wifi
}

// LocationTechnology "private" section, not exported.

int sdkCoreLocationtechnologyToFfi(LocationTechnology value) {
  switch (value) {
  case LocationTechnology.cellular:
    return 0;
  case LocationTechnology.gnss:
    return 1;
  case LocationTechnology.hdGnss:
    return 2;
  case LocationTechnology.wifi:
    return 3;
  default:
    throw StateError("Invalid enum value $value for LocationTechnology enum.");
  }
}

LocationTechnology sdkCoreLocationtechnologyFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LocationTechnology.cellular;
  case 1:
    return LocationTechnology.gnss;
  case 2:
    return LocationTechnology.hdGnss;
  case 3:
    return LocationTechnology.wifi;
  default:
    throw StateError("Invalid numeric value $handle for LocationTechnology enum.");
  }
}

void sdkCoreLocationtechnologyReleaseFfiHandle(int handle) {}

final _sdkCoreLocationtechnologyCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_LocationTechnology_create_handle_nullable'));
final _sdkCoreLocationtechnologyReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationTechnology_release_handle_nullable'));
final _sdkCoreLocationtechnologyGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationTechnology_get_value_nullable'));

Pointer<Void> sdkCoreLocationtechnologyToFfiNullable(LocationTechnology? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreLocationtechnologyToFfi(value);
  final result = _sdkCoreLocationtechnologyCreateHandleNullable(_handle);
  sdkCoreLocationtechnologyReleaseFfiHandle(_handle);
  return result;
}

LocationTechnology? sdkCoreLocationtechnologyFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreLocationtechnologyGetValueNullable(handle);
  final result = sdkCoreLocationtechnologyFromFfi(_handle);
  sdkCoreLocationtechnologyReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreLocationtechnologyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreLocationtechnologyReleaseHandleNullable(handle);

// End of LocationTechnology "private" section.


