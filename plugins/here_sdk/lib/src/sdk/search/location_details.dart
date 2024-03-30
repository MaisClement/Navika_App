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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

/// Contains geographical info about location

class LocationDetails {
  /// The geographic coordinates of the place.
  GeoCoordinates coordinates;

  /// True if has house number with coordinates interpolated from the address range.
  bool coordinatesInterpolated;

  /// The access points to the place, such as the points on a road or in a parking lot.
  List<GeoCoordinates> accessPoints;

  /// The geographic coordinates of the map bounding box containing the place.
  GeoBox? boundingBox;

  /// Creates a new instance.

  /// [coordinates] The geographic coordinates of the place.

  /// [coordinatesInterpolated] True if has house number with coordinates interpolated from the address range.

  /// [accessPoints] The access points to the place, such as the points on a road or in a parking lot.

  /// [boundingBox] The geographic coordinates of the map bounding box containing the place.

  LocationDetails._(this.coordinates, this.coordinatesInterpolated, this.accessPoints, this.boundingBox);
  /// Creates a new instance.
  /// [coordinates] The geographic coordinates of the place.
  LocationDetails(this.coordinates)
      : coordinatesInterpolated = false, accessPoints = [], boundingBox = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LocationDetails) return false;
    LocationDetails _other = other;
    return coordinates == _other.coordinates &&
        coordinatesInterpolated == _other.coordinatesInterpolated &&
        DeepCollectionEquality().equals(accessPoints, _other.accessPoints) &&
        boundingBox == _other.boundingBox;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + coordinates.hashCode;
    result = 31 * result + coordinatesInterpolated.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(accessPoints);
    result = 31 * result + boundingBox.hashCode;
    return result;
  }
}


// LocationDetails "private" section, not exported.

final _sdkSearchLocationdetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint8, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_LocationDetails_create_handle'));
final _sdkSearchLocationdetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_LocationDetails_release_handle'));
final _sdkSearchLocationdetailsGetFieldcoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_LocationDetails_get_field_coordinates'));
final _sdkSearchLocationdetailsGetFieldcoordinatesInterpolated = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_LocationDetails_get_field_coordinatesInterpolated'));
final _sdkSearchLocationdetailsGetFieldaccessPoints = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_LocationDetails_get_field_accessPoints'));
final _sdkSearchLocationdetailsGetFieldboundingBox = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_LocationDetails_get_field_boundingBox'));



Pointer<Void> sdkSearchLocationdetailsToFfi(LocationDetails value) {
  final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(value.coordinates);
  final _coordinatesInterpolatedHandle = booleanToFfi(value.coordinatesInterpolated);
  final _accessPointsHandle = heresdkSearchCommonBindingslistofSdkCoreGeocoordinatesToFfi(value.accessPoints);
  final _boundingBoxHandle = sdkCoreGeoboxToFfiNullable(value.boundingBox);
  final _result = _sdkSearchLocationdetailsCreateHandle(_coordinatesHandle, _coordinatesInterpolatedHandle, _accessPointsHandle, _boundingBoxHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
  booleanReleaseFfiHandle(_coordinatesInterpolatedHandle);
  heresdkSearchCommonBindingslistofSdkCoreGeocoordinatesReleaseFfiHandle(_accessPointsHandle);
  sdkCoreGeoboxReleaseFfiHandleNullable(_boundingBoxHandle);
  return _result;
}

LocationDetails sdkSearchLocationdetailsFromFfi(Pointer<Void> handle) {
  final _coordinatesHandle = _sdkSearchLocationdetailsGetFieldcoordinates(handle);
  final _coordinatesInterpolatedHandle = _sdkSearchLocationdetailsGetFieldcoordinatesInterpolated(handle);
  final _accessPointsHandle = _sdkSearchLocationdetailsGetFieldaccessPoints(handle);
  final _boundingBoxHandle = _sdkSearchLocationdetailsGetFieldboundingBox(handle);
  try {
    return LocationDetails._(
      sdkCoreGeocoordinatesFromFfi(_coordinatesHandle), 
      booleanFromFfi(_coordinatesInterpolatedHandle), 
      heresdkSearchCommonBindingslistofSdkCoreGeocoordinatesFromFfi(_accessPointsHandle), 
      sdkCoreGeoboxFromFfiNullable(_boundingBoxHandle)
    );
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    booleanReleaseFfiHandle(_coordinatesInterpolatedHandle);
    heresdkSearchCommonBindingslistofSdkCoreGeocoordinatesReleaseFfiHandle(_accessPointsHandle);
    sdkCoreGeoboxReleaseFfiHandleNullable(_boundingBoxHandle);
  }
}

void sdkSearchLocationdetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchLocationdetailsReleaseHandle(handle);

// Nullable LocationDetails

final _sdkSearchLocationdetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_LocationDetails_create_handle_nullable'));
final _sdkSearchLocationdetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_LocationDetails_release_handle_nullable'));
final _sdkSearchLocationdetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_LocationDetails_get_value_nullable'));

Pointer<Void> sdkSearchLocationdetailsToFfiNullable(LocationDetails? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchLocationdetailsToFfi(value);
  final result = _sdkSearchLocationdetailsCreateHandleNullable(_handle);
  sdkSearchLocationdetailsReleaseFfiHandle(_handle);
  return result;
}

LocationDetails? sdkSearchLocationdetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchLocationdetailsGetValueNullable(handle);
  final result = sdkSearchLocationdetailsFromFfi(_handle);
  sdkSearchLocationdetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchLocationdetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchLocationdetailsReleaseHandleNullable(handle);

// End of LocationDetails "private" section.


