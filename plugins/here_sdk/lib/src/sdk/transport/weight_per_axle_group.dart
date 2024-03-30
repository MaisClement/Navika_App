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

/// Struct which defines the weight of the different axle groups of a truck.
///
/// The provided value must be greater or equal to 0.

class WeightPerAxleGroup {
  /// Single axle group in kilograms
  int? singleAxleGroupInKilograms;

  /// Tandem axle group in kilograms
  int? tandemAxleGroupInKilograms;

  /// Triple axle group in kilograms
  int? tripleAxleGroupInKilograms;

  /// Quad axle group in kilograms
  int? quadAxleGroupInKilograms;

  /// Quint axle group in kilograms
  int? quintAxleGroupInKilograms;

  /// Creates a new instance.

  /// [singleAxleGroupInKilograms] Single axle group in kilograms

  /// [tandemAxleGroupInKilograms] Tandem axle group in kilograms

  /// [tripleAxleGroupInKilograms] Triple axle group in kilograms

  /// [quadAxleGroupInKilograms] Quad axle group in kilograms

  /// [quintAxleGroupInKilograms] Quint axle group in kilograms

  WeightPerAxleGroup._(this.singleAxleGroupInKilograms, this.tandemAxleGroupInKilograms, this.tripleAxleGroupInKilograms, this.quadAxleGroupInKilograms, this.quintAxleGroupInKilograms);
  WeightPerAxleGroup()
    : singleAxleGroupInKilograms = null, tandemAxleGroupInKilograms = null, tripleAxleGroupInKilograms = null, quadAxleGroupInKilograms = null, quintAxleGroupInKilograms = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WeightPerAxleGroup) return false;
    WeightPerAxleGroup _other = other;
    return singleAxleGroupInKilograms == _other.singleAxleGroupInKilograms &&
        tandemAxleGroupInKilograms == _other.tandemAxleGroupInKilograms &&
        tripleAxleGroupInKilograms == _other.tripleAxleGroupInKilograms &&
        quadAxleGroupInKilograms == _other.quadAxleGroupInKilograms &&
        quintAxleGroupInKilograms == _other.quintAxleGroupInKilograms;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + singleAxleGroupInKilograms.hashCode;
    result = 31 * result + tandemAxleGroupInKilograms.hashCode;
    result = 31 * result + tripleAxleGroupInKilograms.hashCode;
    result = 31 * result + quadAxleGroupInKilograms.hashCode;
    result = 31 * result + quintAxleGroupInKilograms.hashCode;
    return result;
  }
}


// WeightPerAxleGroup "private" section, not exported.

final _sdkTransportWeightperaxlegroupCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_transport_WeightPerAxleGroup_create_handle'));
final _sdkTransportWeightperaxlegroupReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_WeightPerAxleGroup_release_handle'));
final _sdkTransportWeightperaxlegroupGetFieldsingleAxleGroupInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_WeightPerAxleGroup_get_field_singleAxleGroupInKilograms'));
final _sdkTransportWeightperaxlegroupGetFieldtandemAxleGroupInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_WeightPerAxleGroup_get_field_tandemAxleGroupInKilograms'));
final _sdkTransportWeightperaxlegroupGetFieldtripleAxleGroupInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_WeightPerAxleGroup_get_field_tripleAxleGroupInKilograms'));
final _sdkTransportWeightperaxlegroupGetFieldquadAxleGroupInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_WeightPerAxleGroup_get_field_quadAxleGroupInKilograms'));
final _sdkTransportWeightperaxlegroupGetFieldquintAxleGroupInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_WeightPerAxleGroup_get_field_quintAxleGroupInKilograms'));



Pointer<Void> sdkTransportWeightperaxlegroupToFfi(WeightPerAxleGroup value) {
  final _singleAxleGroupInKilogramsHandle = intToFfiNullable(value.singleAxleGroupInKilograms);
  final _tandemAxleGroupInKilogramsHandle = intToFfiNullable(value.tandemAxleGroupInKilograms);
  final _tripleAxleGroupInKilogramsHandle = intToFfiNullable(value.tripleAxleGroupInKilograms);
  final _quadAxleGroupInKilogramsHandle = intToFfiNullable(value.quadAxleGroupInKilograms);
  final _quintAxleGroupInKilogramsHandle = intToFfiNullable(value.quintAxleGroupInKilograms);
  final _result = _sdkTransportWeightperaxlegroupCreateHandle(_singleAxleGroupInKilogramsHandle, _tandemAxleGroupInKilogramsHandle, _tripleAxleGroupInKilogramsHandle, _quadAxleGroupInKilogramsHandle, _quintAxleGroupInKilogramsHandle);
  intReleaseFfiHandleNullable(_singleAxleGroupInKilogramsHandle);
  intReleaseFfiHandleNullable(_tandemAxleGroupInKilogramsHandle);
  intReleaseFfiHandleNullable(_tripleAxleGroupInKilogramsHandle);
  intReleaseFfiHandleNullable(_quadAxleGroupInKilogramsHandle);
  intReleaseFfiHandleNullable(_quintAxleGroupInKilogramsHandle);
  return _result;
}

WeightPerAxleGroup sdkTransportWeightperaxlegroupFromFfi(Pointer<Void> handle) {
  final _singleAxleGroupInKilogramsHandle = _sdkTransportWeightperaxlegroupGetFieldsingleAxleGroupInKilograms(handle);
  final _tandemAxleGroupInKilogramsHandle = _sdkTransportWeightperaxlegroupGetFieldtandemAxleGroupInKilograms(handle);
  final _tripleAxleGroupInKilogramsHandle = _sdkTransportWeightperaxlegroupGetFieldtripleAxleGroupInKilograms(handle);
  final _quadAxleGroupInKilogramsHandle = _sdkTransportWeightperaxlegroupGetFieldquadAxleGroupInKilograms(handle);
  final _quintAxleGroupInKilogramsHandle = _sdkTransportWeightperaxlegroupGetFieldquintAxleGroupInKilograms(handle);
  try {
    return WeightPerAxleGroup._(
      intFromFfiNullable(_singleAxleGroupInKilogramsHandle), 
      intFromFfiNullable(_tandemAxleGroupInKilogramsHandle), 
      intFromFfiNullable(_tripleAxleGroupInKilogramsHandle), 
      intFromFfiNullable(_quadAxleGroupInKilogramsHandle), 
      intFromFfiNullable(_quintAxleGroupInKilogramsHandle)
    );
  } finally {
    intReleaseFfiHandleNullable(_singleAxleGroupInKilogramsHandle);
    intReleaseFfiHandleNullable(_tandemAxleGroupInKilogramsHandle);
    intReleaseFfiHandleNullable(_tripleAxleGroupInKilogramsHandle);
    intReleaseFfiHandleNullable(_quadAxleGroupInKilogramsHandle);
    intReleaseFfiHandleNullable(_quintAxleGroupInKilogramsHandle);
  }
}

void sdkTransportWeightperaxlegroupReleaseFfiHandle(Pointer<Void> handle) => _sdkTransportWeightperaxlegroupReleaseHandle(handle);

// Nullable WeightPerAxleGroup

final _sdkTransportWeightperaxlegroupCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_WeightPerAxleGroup_create_handle_nullable'));
final _sdkTransportWeightperaxlegroupReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_WeightPerAxleGroup_release_handle_nullable'));
final _sdkTransportWeightperaxlegroupGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_WeightPerAxleGroup_get_value_nullable'));

Pointer<Void> sdkTransportWeightperaxlegroupToFfiNullable(WeightPerAxleGroup? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportWeightperaxlegroupToFfi(value);
  final result = _sdkTransportWeightperaxlegroupCreateHandleNullable(_handle);
  sdkTransportWeightperaxlegroupReleaseFfiHandle(_handle);
  return result;
}

WeightPerAxleGroup? sdkTransportWeightperaxlegroupFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportWeightperaxlegroupGetValueNullable(handle);
  final result = sdkTransportWeightperaxlegroupFromFfi(_handle);
  sdkTransportWeightperaxlegroupReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportWeightperaxlegroupReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportWeightperaxlegroupReleaseHandleNullable(handle);

// End of WeightPerAxleGroup "private" section.


