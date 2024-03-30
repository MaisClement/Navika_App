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

/// Specifies place type of Place result from a search query.
enum PlaceType {
    /// Point of interest, for example a shop, restaurant, museum.
    poi,
    /// Address of a place. It can have different formats based on the addressing system.
    address,
    /// Geographical area, for example a country, a city or a district.
    area,
    /// A street.
    street,
    /// An intersection of two, or more, streets.
    /// Note: This is a BETA feature and thus there can be bugs and unexpected behavior.
    /// Note: This type is not supported in offline search.
    intersection,
    /// Default value, none of current values is corresponded to actual value
    unknown
}

// PlaceType "private" section, not exported.

int sdkSearchPlacetypeToFfi(PlaceType value) {
  switch (value) {
  case PlaceType.poi:
    return 0;
  case PlaceType.address:
    return 1;
  case PlaceType.area:
    return 2;
  case PlaceType.street:
    return 3;
  case PlaceType.intersection:
    return 4;
  case PlaceType.unknown:
    return 5;
  default:
    throw StateError("Invalid enum value $value for PlaceType enum.");
  }
}

PlaceType sdkSearchPlacetypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return PlaceType.poi;
  case 1:
    return PlaceType.address;
  case 2:
    return PlaceType.area;
  case 3:
    return PlaceType.street;
  case 4:
    return PlaceType.intersection;
  case 5:
    return PlaceType.unknown;
  default:
    throw StateError("Invalid numeric value $handle for PlaceType enum.");
  }
}

void sdkSearchPlacetypeReleaseFfiHandle(int handle) {}

final _sdkSearchPlacetypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_PlaceType_create_handle_nullable'));
final _sdkSearchPlacetypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceType_release_handle_nullable'));
final _sdkSearchPlacetypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceType_get_value_nullable'));

Pointer<Void> sdkSearchPlacetypeToFfiNullable(PlaceType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchPlacetypeToFfi(value);
  final result = _sdkSearchPlacetypeCreateHandleNullable(_handle);
  sdkSearchPlacetypeReleaseFfiHandle(_handle);
  return result;
}

PlaceType? sdkSearchPlacetypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchPlacetypeGetValueNullable(handle);
  final result = sdkSearchPlacetypeFromFfi(_handle);
  sdkSearchPlacetypeReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchPlacetypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchPlacetypeReleaseHandleNullable(handle);

// End of PlaceType "private" section.


