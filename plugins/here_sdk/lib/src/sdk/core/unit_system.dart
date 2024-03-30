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

/// Represents the available unit systems(imperial/metric).
enum UnitSystem {
    /// The metric system, also known as International System
    /// of Units (SI).
    metric,
    /// The system of imperial units used in UK.
    imperialUk,
    /// The system of imperial units used in US.
    imperialUs
}

// UnitSystem "private" section, not exported.

int sdkCoreUnitsystemToFfi(UnitSystem value) {
  switch (value) {
  case UnitSystem.metric:
    return 0;
  case UnitSystem.imperialUk:
    return 1;
  case UnitSystem.imperialUs:
    return 2;
  default:
    throw StateError("Invalid enum value $value for UnitSystem enum.");
  }
}

UnitSystem sdkCoreUnitsystemFromFfi(int handle) {
  switch (handle) {
  case 0:
    return UnitSystem.metric;
  case 1:
    return UnitSystem.imperialUk;
  case 2:
    return UnitSystem.imperialUs;
  default:
    throw StateError("Invalid numeric value $handle for UnitSystem enum.");
  }
}

void sdkCoreUnitsystemReleaseFfiHandle(int handle) {}

final _sdkCoreUnitsystemCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_UnitSystem_create_handle_nullable'));
final _sdkCoreUnitsystemReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_UnitSystem_release_handle_nullable'));
final _sdkCoreUnitsystemGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_UnitSystem_get_value_nullable'));

Pointer<Void> sdkCoreUnitsystemToFfiNullable(UnitSystem? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreUnitsystemToFfi(value);
  final result = _sdkCoreUnitsystemCreateHandleNullable(_handle);
  sdkCoreUnitsystemReleaseFfiHandle(_handle);
  return result;
}

UnitSystem? sdkCoreUnitsystemFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreUnitsystemGetValueNullable(handle);
  final result = sdkCoreUnitsystemFromFfi(_handle);
  sdkCoreUnitsystemReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreUnitsystemReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreUnitsystemReleaseHandleNullable(handle);

// End of UnitSystem "private" section.


