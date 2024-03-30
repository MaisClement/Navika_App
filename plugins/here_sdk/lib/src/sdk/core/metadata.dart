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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/custom_metadata_value.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/metadata_type.dart';
import 'package:meta/meta.dart';

/// Holds metadata on behalf of a map item.
///
/// An instance of this class can contain metadata items of varying types, such as
/// String, Integer, Double, GeoCoordinates etc. and can also hold arbitrary metadata
/// types by the use of the CustomMetadataValue abstract class.
abstract class Metadata {
  /// Creates an instance of this class.
  ///
  factory Metadata() => $prototype.make();

  /// Obtains an instance of the CustomMetadataValue class associated with a given key.
  ///
  /// [key] The name of the key for which to obtain the value.
  ///
  /// Returns [CustomMetadataValue?]. The value associated with the key.
  ///
  CustomMetadataValue? getCustomValue(String key);
  /// Obtains a Double value associated with a given key.
  ///
  /// [key] The name of the key for which to obtain the value.
  ///
  /// Returns [double?]. The value associated with the key.
  ///
  double? getDouble(String key);
  /// Obtains a GeoCoordinates value associated with a given key.
  ///
  /// [key] The name of the key for which to obtain the value.
  ///
  /// Returns [GeoCoordinates?]. The value associated with the key.
  ///
  GeoCoordinates? getGeoCoordinates(String key);
  /// Obtains an Integer value associated with a given key.
  ///
  /// [key] The name of the key for which to obtain the value.
  ///
  /// Returns [int?]. The value associated with the key.
  ///
  int? getInteger(String key);
  /// Obtains a String value associated with a given key.
  ///
  /// [key] The name of the key for which to obtain the value.
  ///
  /// Returns [String?]. The value associated with the key.
  ///
  String? getString(String key);
  /// Determines the type of a metadata value.
  ///
  /// If the type of a metadata value associated with a key is not known, this
  /// method will enable the type to be queried, in order to know which get method
  /// to call. i.e. getDouble(), getInteger() etc.
  ///
  /// [key] The name of the key for which to obtain the type.
  ///
  /// Returns [MetadataType?]. An enumeration describing the type of the value associated with the key.
  ///
  MetadataType? getType(String key);
  /// Removes a metadata key and its associated value.
  ///
  /// [key] The name of the key to be removed.
  ///
  void removeValue(String key);
  /// Creates a key:value pair, where the value is a type derived from CustomMetadataValue.
  ///
  /// If the given key already exists, its value will be replaced by the new one.
  ///
  /// [key] The name of the key to be created or replaced.
  ///
  /// [value] The value to be assigned to the key.
  ///
  void setCustomValue(String key, CustomMetadataValue value);
  /// Creates a key:value pair, where the value is of type Double.
  ///
  /// If the given key already exists, its value will be replaced by the new one.
  ///
  /// [key] The name of the key to be created or replaced.
  ///
  /// [value] The value to be assigned to the key.
  ///
  void setDouble(String key, double value);
  /// Creates a key:value pair, where the value is of type GeoCoordinates.
  ///
  /// If the given key already exists, its value will be replaced by the new one.
  ///
  /// [key] The name of the key to be created or replaced.
  ///
  /// [value] The value to be assigned to the key.
  ///
  void setGeoCoordinates(String key, GeoCoordinates value);
  /// Creates a key:value pair, where the value is of type Integer.
  ///
  /// If the given key already exists, its value will be replaced by the new one.
  ///
  /// [key] The name of the key to be created or replaced.
  ///
  /// [value] The value to be assigned to the key.
  ///
  void setInteger(String key, int value);
  /// Creates a key:value pair, where the value is of type String.
  ///
  /// If the given key already exists, its value will be replaced by the new one.
  ///
  /// [key] The name of the key to be created or replaced.
  ///
  /// [value] The value to be assigned to the key.
  ///
  void setString(String key, String value);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Metadata$Impl(Pointer<Void>.fromAddress(0));
}


// Metadata "private" section, not exported.

final _sdkCoreMetadataRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_Metadata_register_finalizer'));
final _sdkCoreMetadataCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Metadata_copy_handle'));
final _sdkCoreMetadataReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Metadata_release_handle'));















/// @nodoc
@visibleForTesting
class Metadata$Impl extends __lib.NativeBase implements Metadata {

  Metadata$Impl(Pointer<Void> handle) : super(handle);


  Metadata make() {
    final _result_handle = _make();
    final _result = Metadata$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkCoreMetadataRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make() {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_Metadata_make'));
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  @override
  CustomMetadataValue? getCustomValue(String key) {
    final _getCustomValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_Metadata_getCustomValue__String'));
    final _keyHandle = stringToFfi(key);
    final _handle = this.handle;
    final __resultHandle = _getCustomValueFfi(_handle, __lib.LibraryContext.isolateId, _keyHandle);
    stringReleaseFfiHandle(_keyHandle);
    try {
      return sdkCoreCustommetadatavalueFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreCustommetadatavalueReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  double? getDouble(String key) {
    final _getDoubleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_Metadata_getDouble__String'));
    final _keyHandle = stringToFfi(key);
    final _handle = this.handle;
    final __resultHandle = _getDoubleFfi(_handle, __lib.LibraryContext.isolateId, _keyHandle);
    stringReleaseFfiHandle(_keyHandle);
    try {
      return doubleFromFfiNullable(__resultHandle);
    } finally {
      doubleReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  GeoCoordinates? getGeoCoordinates(String key) {
    final _getGeoCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_Metadata_getGeoCoordinates__String'));
    final _keyHandle = stringToFfi(key);
    final _handle = this.handle;
    final __resultHandle = _getGeoCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _keyHandle);
    stringReleaseFfiHandle(_keyHandle);
    try {
      return sdkCoreGeocoordinatesFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  int? getInteger(String key) {
    final _getIntegerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_Metadata_getInteger__String'));
    final _keyHandle = stringToFfi(key);
    final _handle = this.handle;
    final __resultHandle = _getIntegerFfi(_handle, __lib.LibraryContext.isolateId, _keyHandle);
    stringReleaseFfiHandle(_keyHandle);
    try {
      return intFromFfiNullable(__resultHandle);
    } finally {
      intReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  String? getString(String key) {
    final _getStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_Metadata_getString__String'));
    final _keyHandle = stringToFfi(key);
    final _handle = this.handle;
    final __resultHandle = _getStringFfi(_handle, __lib.LibraryContext.isolateId, _keyHandle);
    stringReleaseFfiHandle(_keyHandle);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  MetadataType? getType(String key) {
    final _getTypeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_Metadata_getType__String'));
    final _keyHandle = stringToFfi(key);
    final _handle = this.handle;
    final __resultHandle = _getTypeFfi(_handle, __lib.LibraryContext.isolateId, _keyHandle);
    stringReleaseFfiHandle(_keyHandle);
    try {
      return sdkCoreMetadatatypeFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreMetadatatypeReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  void removeValue(String key) {
    final _removeValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_Metadata_removeValue__String'));
    final _keyHandle = stringToFfi(key);
    final _handle = this.handle;
    _removeValueFfi(_handle, __lib.LibraryContext.isolateId, _keyHandle);
    stringReleaseFfiHandle(_keyHandle);

  }

  @override
  void setCustomValue(String key, CustomMetadataValue value) {
    final _setCustomValueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_Metadata_setCustomValue__String_CustomMetadataValue'));
    final _keyHandle = stringToFfi(key);
    final _valueHandle = sdkCoreCustommetadatavalueToFfi(value);
    final _handle = this.handle;
    _setCustomValueFfi(_handle, __lib.LibraryContext.isolateId, _keyHandle, _valueHandle);
    stringReleaseFfiHandle(_keyHandle);
    sdkCoreCustommetadatavalueReleaseFfiHandle(_valueHandle);

  }

  @override
  void setDouble(String key, double value) {
    final _setDoubleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Double), void Function(Pointer<Void>, int, Pointer<Void>, double)>('here_sdk_sdk_core_Metadata_setDouble__String_Double'));
    final _keyHandle = stringToFfi(key);
    final _valueHandle = (value);
    final _handle = this.handle;
    _setDoubleFfi(_handle, __lib.LibraryContext.isolateId, _keyHandle, _valueHandle);
    stringReleaseFfiHandle(_keyHandle);


  }

  @override
  void setGeoCoordinates(String key, GeoCoordinates value) {
    final _setGeoCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_Metadata_setGeoCoordinates__String_GeoCoordinates'));
    final _keyHandle = stringToFfi(key);
    final _valueHandle = sdkCoreGeocoordinatesToFfi(value);
    final _handle = this.handle;
    _setGeoCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _keyHandle, _valueHandle);
    stringReleaseFfiHandle(_keyHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_valueHandle);

  }

  @override
  void setInteger(String key, int value) {
    final _setIntegerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Int32), void Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_core_Metadata_setInteger__String_Int'));
    final _keyHandle = stringToFfi(key);
    final _valueHandle = (value);
    final _handle = this.handle;
    _setIntegerFfi(_handle, __lib.LibraryContext.isolateId, _keyHandle, _valueHandle);
    stringReleaseFfiHandle(_keyHandle);


  }

  @override
  void setString(String key, String value) {
    final _setStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_Metadata_setString__String_String'));
    final _keyHandle = stringToFfi(key);
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setStringFfi(_handle, __lib.LibraryContext.isolateId, _keyHandle, _valueHandle);
    stringReleaseFfiHandle(_keyHandle);
    stringReleaseFfiHandle(_valueHandle);

  }


}

Pointer<Void> sdkCoreMetadataToFfi(Metadata value) =>
  _sdkCoreMetadataCopyHandle((value as __lib.NativeBase).handle);

Metadata sdkCoreMetadataFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Metadata) return instance;

  final _copiedHandle = _sdkCoreMetadataCopyHandle(handle);
  final result = Metadata$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkCoreMetadataRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreMetadataReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreMetadataReleaseHandle(handle);

Pointer<Void> sdkCoreMetadataToFfiNullable(Metadata? value) =>
  value != null ? sdkCoreMetadataToFfi(value) : Pointer<Void>.fromAddress(0);

Metadata? sdkCoreMetadataFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreMetadataFromFfi(handle) : null;

void sdkCoreMetadataReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreMetadataReleaseHandle(handle);

// End of Metadata "private" section.


