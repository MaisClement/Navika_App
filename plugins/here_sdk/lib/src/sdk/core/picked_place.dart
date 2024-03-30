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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

/// Carries the result of picking a Carto POI (point of interest) object.

class PickedPlace {
  /// The name of the POI localized in the currently selected map language.
  String name;

  /// The geographic coordinates of the POI.
  GeoCoordinates coordinates;

  /// The place category ID of the POI.
  /// This is the same String value as `PlaceCategory.id` that can be obtained from the
  /// `SearchEngine` and the `OfflineSearchEngine`. Note that not all editions include the
  /// `OfflineSearchEngine`.
  String placeCategoryId;

  /// Creates a new instance.

  /// [name] The name of the POI localized in the currently selected map language.

  /// [coordinates] The geographic coordinates of the POI.

  /// [placeCategoryId] The place category ID of the POI.
  /// This is the same String value as `PlaceCategory.id` that can be obtained from the
  /// `SearchEngine` and the `OfflineSearchEngine`. Note that not all editions include the
  /// `OfflineSearchEngine`.

  PickedPlace(this.name, this.coordinates, this.placeCategoryId);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PickedPlace) return false;
    PickedPlace _other = other;
    return name == _other.name &&
        coordinates == _other.coordinates &&
        placeCategoryId == _other.placeCategoryId;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + name.hashCode;
    result = 31 * result + coordinates.hashCode;
    result = 31 * result + placeCategoryId.hashCode;
    return result;
  }
}


// PickedPlace "private" section, not exported.

final _sdkCorePickedplaceCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_PickedPlace_create_handle'));
final _sdkCorePickedplaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_PickedPlace_release_handle'));
final _sdkCorePickedplaceGetFieldname = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_PickedPlace_get_field_name'));
final _sdkCorePickedplaceGetFieldcoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_PickedPlace_get_field_coordinates'));
final _sdkCorePickedplaceGetFieldplaceCategoryId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_PickedPlace_get_field_placeCategoryId'));



Pointer<Void> sdkCorePickedplaceToFfi(PickedPlace value) {
  final _nameHandle = stringToFfi(value.name);
  final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(value.coordinates);
  final _placeCategoryIdHandle = stringToFfi(value.placeCategoryId);
  final _result = _sdkCorePickedplaceCreateHandle(_nameHandle, _coordinatesHandle, _placeCategoryIdHandle);
  stringReleaseFfiHandle(_nameHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
  stringReleaseFfiHandle(_placeCategoryIdHandle);
  return _result;
}

PickedPlace sdkCorePickedplaceFromFfi(Pointer<Void> handle) {
  final _nameHandle = _sdkCorePickedplaceGetFieldname(handle);
  final _coordinatesHandle = _sdkCorePickedplaceGetFieldcoordinates(handle);
  final _placeCategoryIdHandle = _sdkCorePickedplaceGetFieldplaceCategoryId(handle);
  try {
    return PickedPlace(
      stringFromFfi(_nameHandle), 
      sdkCoreGeocoordinatesFromFfi(_coordinatesHandle), 
      stringFromFfi(_placeCategoryIdHandle)
    );
  } finally {
    stringReleaseFfiHandle(_nameHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    stringReleaseFfiHandle(_placeCategoryIdHandle);
  }
}

void sdkCorePickedplaceReleaseFfiHandle(Pointer<Void> handle) => _sdkCorePickedplaceReleaseHandle(handle);

// Nullable PickedPlace

final _sdkCorePickedplaceCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_PickedPlace_create_handle_nullable'));
final _sdkCorePickedplaceReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_PickedPlace_release_handle_nullable'));
final _sdkCorePickedplaceGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_PickedPlace_get_value_nullable'));

Pointer<Void> sdkCorePickedplaceToFfiNullable(PickedPlace? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCorePickedplaceToFfi(value);
  final result = _sdkCorePickedplaceCreateHandleNullable(_handle);
  sdkCorePickedplaceReleaseFfiHandle(_handle);
  return result;
}

PickedPlace? sdkCorePickedplaceFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCorePickedplaceGetValueNullable(handle);
  final result = sdkCorePickedplaceFromFfi(_handle);
  sdkCorePickedplaceReleaseFfiHandle(_handle);
  return result;
}

void sdkCorePickedplaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCorePickedplaceReleaseHandleNullable(handle);

// End of PickedPlace "private" section.


