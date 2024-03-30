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
import 'package:here_sdk/src/sdk/transport/truck_class.dart';
import 'package:here_sdk/src/sdk/transport/truck_fuel_type.dart';

/// Contains truck fuel type info of fuel station.
///
/// Note: This is a BETA feature and thus subject to change.

class TruckFuel {
  /// The type of the fuel.
  TruckFuelType type;

  /// The maximum truck class that this fuel type supports. `null` means information is unknown.
  TruckClass? maximumTruckClass;

  /// Creates a new instance.

  /// [type] The type of the fuel.

  /// [maximumTruckClass] The maximum truck class that this fuel type supports. `null` means information is unknown.

  TruckFuel._(this.type, this.maximumTruckClass);
  TruckFuel(TruckFuelType type)
    : type = type, maximumTruckClass = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TruckFuel) return false;
    TruckFuel _other = other;
    return type == _other.type &&
        maximumTruckClass == _other.maximumTruckClass;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + type.hashCode;
    result = 31 * result + maximumTruckClass.hashCode;
    return result;
  }
}


// TruckFuel "private" section, not exported.

final _sdkSearchTruckfuelCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('here_sdk_sdk_search_TruckFuel_create_handle'));
final _sdkSearchTruckfuelReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckFuel_release_handle'));
final _sdkSearchTruckfuelGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckFuel_get_field_type'));
final _sdkSearchTruckfuelGetFieldmaximumTruckClass = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckFuel_get_field_maximumTruckClass'));



Pointer<Void> sdkSearchTruckfuelToFfi(TruckFuel value) {
  final _typeHandle = sdkTransportTruckfueltypeToFfi(value.type);
  final _maximumTruckClassHandle = sdkTransportTruckclassToFfiNullable(value.maximumTruckClass);
  final _result = _sdkSearchTruckfuelCreateHandle(_typeHandle, _maximumTruckClassHandle);
  sdkTransportTruckfueltypeReleaseFfiHandle(_typeHandle);
  sdkTransportTruckclassReleaseFfiHandleNullable(_maximumTruckClassHandle);
  return _result;
}

TruckFuel sdkSearchTruckfuelFromFfi(Pointer<Void> handle) {
  final _typeHandle = _sdkSearchTruckfuelGetFieldtype(handle);
  final _maximumTruckClassHandle = _sdkSearchTruckfuelGetFieldmaximumTruckClass(handle);
  try {
    return TruckFuel._(
      sdkTransportTruckfueltypeFromFfi(_typeHandle), 
      sdkTransportTruckclassFromFfiNullable(_maximumTruckClassHandle)
    );
  } finally {
    sdkTransportTruckfueltypeReleaseFfiHandle(_typeHandle);
    sdkTransportTruckclassReleaseFfiHandleNullable(_maximumTruckClassHandle);
  }
}

void sdkSearchTruckfuelReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchTruckfuelReleaseHandle(handle);

// Nullable TruckFuel

final _sdkSearchTruckfuelCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckFuel_create_handle_nullable'));
final _sdkSearchTruckfuelReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckFuel_release_handle_nullable'));
final _sdkSearchTruckfuelGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TruckFuel_get_value_nullable'));

Pointer<Void> sdkSearchTruckfuelToFfiNullable(TruckFuel? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchTruckfuelToFfi(value);
  final result = _sdkSearchTruckfuelCreateHandleNullable(_handle);
  sdkSearchTruckfuelReleaseFfiHandle(_handle);
  return result;
}

TruckFuel? sdkSearchTruckfuelFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchTruckfuelGetValueNullable(handle);
  final result = sdkSearchTruckfuelFromFfi(_handle);
  sdkSearchTruckfuelReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchTruckfuelReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchTruckfuelReleaseHandleNullable(handle);

// End of TruckFuel "private" section.


