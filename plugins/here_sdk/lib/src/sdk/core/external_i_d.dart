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

/// Identifier of the entity as provided by the external source

class ExternalID {
  /// Information about the source of this reference.
  String source;

  /// Identifier of the entity as provided by the source.
  String id;

  ExternalID._(this.source, this.id);
  /// Creates a new instance with default values.
  ExternalID()
      : source = "", id = "";
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ExternalID) return false;
    ExternalID _other = other;
    return source == _other.source &&
        id == _other.id;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + source.hashCode;
    result = 31 * result + id.hashCode;
    return result;
  }
}


// ExternalID "private" section, not exported.

final _sdkCoreExternalidCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_ExternalID_create_handle'));
final _sdkCoreExternalidReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_ExternalID_release_handle'));
final _sdkCoreExternalidGetFieldsource = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_ExternalID_get_field_source'));
final _sdkCoreExternalidGetFieldid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_ExternalID_get_field_id'));



Pointer<Void> sdkCoreExternalidToFfi(ExternalID value) {
  final _sourceHandle = stringToFfi(value.source);
  final _idHandle = stringToFfi(value.id);
  final _result = _sdkCoreExternalidCreateHandle(_sourceHandle, _idHandle);
  stringReleaseFfiHandle(_sourceHandle);
  stringReleaseFfiHandle(_idHandle);
  return _result;
}

ExternalID sdkCoreExternalidFromFfi(Pointer<Void> handle) {
  final _sourceHandle = _sdkCoreExternalidGetFieldsource(handle);
  final _idHandle = _sdkCoreExternalidGetFieldid(handle);
  try {
    return ExternalID._(
      stringFromFfi(_sourceHandle), 
      stringFromFfi(_idHandle)
    );
  } finally {
    stringReleaseFfiHandle(_sourceHandle);
    stringReleaseFfiHandle(_idHandle);
  }
}

void sdkCoreExternalidReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreExternalidReleaseHandle(handle);

// Nullable ExternalID

final _sdkCoreExternalidCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_ExternalID_create_handle_nullable'));
final _sdkCoreExternalidReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_ExternalID_release_handle_nullable'));
final _sdkCoreExternalidGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_ExternalID_get_value_nullable'));

Pointer<Void> sdkCoreExternalidToFfiNullable(ExternalID? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreExternalidToFfi(value);
  final result = _sdkCoreExternalidCreateHandleNullable(_handle);
  sdkCoreExternalidReleaseFfiHandle(_handle);
  return result;
}

ExternalID? sdkCoreExternalidFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreExternalidGetValueNullable(handle);
  final result = sdkCoreExternalidFromFfi(_handle);
  sdkCoreExternalidReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreExternalidReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreExternalidReleaseHandleNullable(handle);

// End of ExternalID "private" section.


