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

/// Charge Point Operator (CPO) ID uses the Electric Vehicle Supply Equipment ID (EVSE ID) for an exact identification of the charging infrastructure and charging point.
///
/// **Note:** Currently, this is a closed-alpha feature, so it is available only for selected
/// customers.
/// There could be a few bugs and unexpected behaviors.
/// **Note:** Participants of the closed-alpha group can get access from HERE to use this feature.
/// If the credentials are not enabled, a [SearchError.forbidden] will be propagated.
/// Related APIs may change for new releases without a deprecation process.

class Evse {
  /// Electric Vehicle Supply Equipment ID (EVSE ID).
  String? id;

  /// CPO (Charge Point Operator) EVSE UID.
  String? cpoId;

  /// Creates a new instance.

  /// [id] Electric Vehicle Supply Equipment ID (EVSE ID).

  /// [cpoId] CPO (Charge Point Operator) EVSE UID.

  Evse._(this.id, this.cpoId);
  Evse()
    : id = null, cpoId = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Evse) return false;
    Evse _other = other;
    return id == _other.id &&
        cpoId == _other.cpoId;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + id.hashCode;
    result = 31 * result + cpoId.hashCode;
    return result;
  }
}


// Evse "private" section, not exported.

final _sdkSearchEvseCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_Evse_create_handle'));
final _sdkSearchEvseReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Evse_release_handle'));
final _sdkSearchEvseGetFieldid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Evse_get_field_id'));
final _sdkSearchEvseGetFieldcpoId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Evse_get_field_cpoId'));



Pointer<Void> sdkSearchEvseToFfi(Evse value) {
  final _idHandle = stringToFfiNullable(value.id);
  final _cpoIdHandle = stringToFfiNullable(value.cpoId);
  final _result = _sdkSearchEvseCreateHandle(_idHandle, _cpoIdHandle);
  stringReleaseFfiHandleNullable(_idHandle);
  stringReleaseFfiHandleNullable(_cpoIdHandle);
  return _result;
}

Evse sdkSearchEvseFromFfi(Pointer<Void> handle) {
  final _idHandle = _sdkSearchEvseGetFieldid(handle);
  final _cpoIdHandle = _sdkSearchEvseGetFieldcpoId(handle);
  try {
    return Evse._(
      stringFromFfiNullable(_idHandle), 
      stringFromFfiNullable(_cpoIdHandle)
    );
  } finally {
    stringReleaseFfiHandleNullable(_idHandle);
    stringReleaseFfiHandleNullable(_cpoIdHandle);
  }
}

void sdkSearchEvseReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchEvseReleaseHandle(handle);

// Nullable Evse

final _sdkSearchEvseCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Evse_create_handle_nullable'));
final _sdkSearchEvseReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Evse_release_handle_nullable'));
final _sdkSearchEvseGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Evse_get_value_nullable'));

Pointer<Void> sdkSearchEvseToFfiNullable(Evse? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchEvseToFfi(value);
  final result = _sdkSearchEvseCreateHandleNullable(_handle);
  sdkSearchEvseReleaseFfiHandle(_handle);
  return result;
}

Evse? sdkSearchEvseFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchEvseGetValueNullable(handle);
  final result = sdkSearchEvseFromFfi(_handle);
  sdkSearchEvseReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchEvseReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchEvseReleaseHandleNullable(handle);

// End of Evse "private" section.


