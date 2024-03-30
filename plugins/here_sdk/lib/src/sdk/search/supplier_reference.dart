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

/// Identifier of the place as provided by the supplier

class SupplierReference {
  /// Information about the supplier of this reference.
  String supplier;

  /// Identifier of the place as provided by the supplier.
  String id;

  /// Creates a new instance.
  /// [supplier] Information about the supplier of this reference.
  /// [id] Identifier of the place as provided by the supplier.
  SupplierReference(this.supplier, this.id);
  /// Creates a new instance.
  SupplierReference.withDefaults()
      : supplier = "", id = "";
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SupplierReference) return false;
    SupplierReference _other = other;
    return supplier == _other.supplier &&
        id == _other.id;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + supplier.hashCode;
    result = 31 * result + id.hashCode;
    return result;
  }
}


// SupplierReference "private" section, not exported.

final _sdkSearchSupplierreferenceCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_SupplierReference_create_handle'));
final _sdkSearchSupplierreferenceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SupplierReference_release_handle'));
final _sdkSearchSupplierreferenceGetFieldsupplier = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SupplierReference_get_field_supplier'));
final _sdkSearchSupplierreferenceGetFieldid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SupplierReference_get_field_id'));



Pointer<Void> sdkSearchSupplierreferenceToFfi(SupplierReference value) {
  final _supplierHandle = stringToFfi(value.supplier);
  final _idHandle = stringToFfi(value.id);
  final _result = _sdkSearchSupplierreferenceCreateHandle(_supplierHandle, _idHandle);
  stringReleaseFfiHandle(_supplierHandle);
  stringReleaseFfiHandle(_idHandle);
  return _result;
}

SupplierReference sdkSearchSupplierreferenceFromFfi(Pointer<Void> handle) {
  final _supplierHandle = _sdkSearchSupplierreferenceGetFieldsupplier(handle);
  final _idHandle = _sdkSearchSupplierreferenceGetFieldid(handle);
  try {
    return SupplierReference(
      stringFromFfi(_supplierHandle), 
      stringFromFfi(_idHandle)
    );
  } finally {
    stringReleaseFfiHandle(_supplierHandle);
    stringReleaseFfiHandle(_idHandle);
  }
}

void sdkSearchSupplierreferenceReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchSupplierreferenceReleaseHandle(handle);

// Nullable SupplierReference

final _sdkSearchSupplierreferenceCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SupplierReference_create_handle_nullable'));
final _sdkSearchSupplierreferenceReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SupplierReference_release_handle_nullable'));
final _sdkSearchSupplierreferenceGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SupplierReference_get_value_nullable'));

Pointer<Void> sdkSearchSupplierreferenceToFfiNullable(SupplierReference? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchSupplierreferenceToFfi(value);
  final result = _sdkSearchSupplierreferenceCreateHandleNullable(_handle);
  sdkSearchSupplierreferenceReleaseFfiHandle(_handle);
  return result;
}

SupplierReference? sdkSearchSupplierreferenceFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchSupplierreferenceGetValueNullable(handle);
  final result = sdkSearchSupplierreferenceFromFfi(_handle);
  sdkSearchSupplierreferenceReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchSupplierreferenceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchSupplierreferenceReleaseHandleNullable(handle);

// End of SupplierReference "private" section.


