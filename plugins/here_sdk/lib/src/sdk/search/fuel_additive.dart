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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/transport/fuel_additive_type.dart';

/// Contains fuel additive information for generic fuel type.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and
/// unexpected behaviors. Related APIs may change for new releases without a deprecation process.

class FuelAdditive {
  /// The type of the fuel additive. For now, only AUS 32 is supported.
  FuelAdditiveType type;

  /// Indicates if the fuel additive is available in cans or not. `null` means information is unknown.
  bool? availableInCans;

  /// Indicates if the fuel additive is available at the pump or not. `null` means information is unknown.
  bool? availableAtPump;

  /// Creates a new instance.

  /// [type] The type of the fuel additive. For now, only AUS 32 is supported.

  /// [availableInCans] Indicates if the fuel additive is available in cans or not. `null` means information is unknown.

  /// [availableAtPump] Indicates if the fuel additive is available at the pump or not. `null` means information is unknown.

  FuelAdditive._(this.type, this.availableInCans, this.availableAtPump);
  FuelAdditive()
    : type = FuelAdditiveType.aus32, availableInCans = null, availableAtPump = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FuelAdditive) return false;
    FuelAdditive _other = other;
    return type == _other.type &&
        availableInCans == _other.availableInCans &&
        availableAtPump == _other.availableAtPump;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + type.hashCode;
    result = 31 * result + availableInCans.hashCode;
    result = 31 * result + availableAtPump.hashCode;
    return result;
  }
}


// FuelAdditive "private" section, not exported.

final _sdkSearchFueladditiveCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_FuelAdditive_create_handle'));
final _sdkSearchFueladditiveReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_FuelAdditive_release_handle'));
final _sdkSearchFueladditiveGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_FuelAdditive_get_field_type'));
final _sdkSearchFueladditiveGetFieldavailableInCans = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_FuelAdditive_get_field_availableInCans'));
final _sdkSearchFueladditiveGetFieldavailableAtPump = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_FuelAdditive_get_field_availableAtPump'));



Pointer<Void> sdkSearchFueladditiveToFfi(FuelAdditive value) {
  final _typeHandle = sdkTransportFueladditivetypeToFfi(value.type);
  final _availableInCansHandle = booleanToFfiNullable(value.availableInCans);
  final _availableAtPumpHandle = booleanToFfiNullable(value.availableAtPump);
  final _result = _sdkSearchFueladditiveCreateHandle(_typeHandle, _availableInCansHandle, _availableAtPumpHandle);
  sdkTransportFueladditivetypeReleaseFfiHandle(_typeHandle);
  booleanReleaseFfiHandleNullable(_availableInCansHandle);
  booleanReleaseFfiHandleNullable(_availableAtPumpHandle);
  return _result;
}

FuelAdditive sdkSearchFueladditiveFromFfi(Pointer<Void> handle) {
  final _typeHandle = _sdkSearchFueladditiveGetFieldtype(handle);
  final _availableInCansHandle = _sdkSearchFueladditiveGetFieldavailableInCans(handle);
  final _availableAtPumpHandle = _sdkSearchFueladditiveGetFieldavailableAtPump(handle);
  try {
    return FuelAdditive._(
      sdkTransportFueladditivetypeFromFfi(_typeHandle), 
      booleanFromFfiNullable(_availableInCansHandle), 
      booleanFromFfiNullable(_availableAtPumpHandle)
    );
  } finally {
    sdkTransportFueladditivetypeReleaseFfiHandle(_typeHandle);
    booleanReleaseFfiHandleNullable(_availableInCansHandle);
    booleanReleaseFfiHandleNullable(_availableAtPumpHandle);
  }
}

void sdkSearchFueladditiveReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchFueladditiveReleaseHandle(handle);

// Nullable FuelAdditive

final _sdkSearchFueladditiveCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_FuelAdditive_create_handle_nullable'));
final _sdkSearchFueladditiveReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_FuelAdditive_release_handle_nullable'));
final _sdkSearchFueladditiveGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_FuelAdditive_get_value_nullable'));

Pointer<Void> sdkSearchFueladditiveToFfiNullable(FuelAdditive? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchFueladditiveToFfi(value);
  final result = _sdkSearchFueladditiveCreateHandleNullable(_handle);
  sdkSearchFueladditiveReleaseFfiHandle(_handle);
  return result;
}

FuelAdditive? sdkSearchFueladditiveFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchFueladditiveGetValueNullable(handle);
  final result = sdkSearchFueladditiveFromFfi(_handle);
  sdkSearchFueladditiveReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchFueladditiveReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchFueladditiveReleaseHandleNullable(handle);

// End of FuelAdditive "private" section.


