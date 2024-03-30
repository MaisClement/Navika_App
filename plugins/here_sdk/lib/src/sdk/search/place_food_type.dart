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

/// Parameters related to HERE Places cuisine system.

class PlaceFoodType {
  /// Identifier for an associated food type. For example, the food type ID "200-000" represents
  /// the unique culture and flavor of Asia.
  /// The complete list of supported food type IDs can be found
  /// [here](https://docs.in.here.com/static/122041/1149894/html/topics-places/food-types-category-system-full.html).
  String id;

  /// Name of the food type in the requested language.
  /// Ignored when used in [PlaceFilter].
  String? name;

  /// Whether or not it is a primary food type.
  bool primary;

  /// Creates a new instance.

  /// [id] Identifier for an associated food type. For example, the food type ID "200-000" represents
  /// the unique culture and flavor of Asia.
  /// The complete list of supported food type IDs can be found
  /// [here](https://docs.in.here.com/static/122041/1149894/html/topics-places/food-types-category-system-full.html).

  /// [name] Name of the food type in the requested language.
  /// Ignored when used in [PlaceFilter].

  /// [primary] Whether or not it is a primary food type.

  PlaceFoodType._(this.id, this.name, this.primary);
  PlaceFoodType(String id)
    : id = id, name = null, primary = false;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PlaceFoodType) return false;
    PlaceFoodType _other = other;
    return id == _other.id &&
        name == _other.name &&
        primary == _other.primary;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + id.hashCode;
    result = 31 * result + name.hashCode;
    result = 31 * result + primary.hashCode;
    return result;
  }
}


// PlaceFoodType "private" section, not exported.

final _sdkSearchPlacefoodtypeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Uint8),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_search_PlaceFoodType_create_handle'));
final _sdkSearchPlacefoodtypeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFoodType_release_handle'));
final _sdkSearchPlacefoodtypeGetFieldid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFoodType_get_field_id'));
final _sdkSearchPlacefoodtypeGetFieldname = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFoodType_get_field_name'));
final _sdkSearchPlacefoodtypeGetFieldprimary = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFoodType_get_field_primary'));



Pointer<Void> sdkSearchPlacefoodtypeToFfi(PlaceFoodType value) {
  final _idHandle = stringToFfi(value.id);
  final _nameHandle = stringToFfiNullable(value.name);
  final _primaryHandle = booleanToFfi(value.primary);
  final _result = _sdkSearchPlacefoodtypeCreateHandle(_idHandle, _nameHandle, _primaryHandle);
  stringReleaseFfiHandle(_idHandle);
  stringReleaseFfiHandleNullable(_nameHandle);
  booleanReleaseFfiHandle(_primaryHandle);
  return _result;
}

PlaceFoodType sdkSearchPlacefoodtypeFromFfi(Pointer<Void> handle) {
  final _idHandle = _sdkSearchPlacefoodtypeGetFieldid(handle);
  final _nameHandle = _sdkSearchPlacefoodtypeGetFieldname(handle);
  final _primaryHandle = _sdkSearchPlacefoodtypeGetFieldprimary(handle);
  try {
    return PlaceFoodType._(
      stringFromFfi(_idHandle), 
      stringFromFfiNullable(_nameHandle), 
      booleanFromFfi(_primaryHandle)
    );
  } finally {
    stringReleaseFfiHandle(_idHandle);
    stringReleaseFfiHandleNullable(_nameHandle);
    booleanReleaseFfiHandle(_primaryHandle);
  }
}

void sdkSearchPlacefoodtypeReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchPlacefoodtypeReleaseHandle(handle);

// Nullable PlaceFoodType

final _sdkSearchPlacefoodtypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFoodType_create_handle_nullable'));
final _sdkSearchPlacefoodtypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFoodType_release_handle_nullable'));
final _sdkSearchPlacefoodtypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceFoodType_get_value_nullable'));

Pointer<Void> sdkSearchPlacefoodtypeToFfiNullable(PlaceFoodType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchPlacefoodtypeToFfi(value);
  final result = _sdkSearchPlacefoodtypeCreateHandleNullable(_handle);
  sdkSearchPlacefoodtypeReleaseFfiHandle(_handle);
  return result;
}

PlaceFoodType? sdkSearchPlacefoodtypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchPlacefoodtypeGetValueNullable(handle);
  final result = sdkSearchPlacefoodtypeFromFfi(_handle);
  sdkSearchPlacefoodtypeReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchPlacefoodtypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchPlacefoodtypeReleaseHandleNullable(handle);

// End of PlaceFoodType "private" section.


