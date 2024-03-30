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

/// Represents a type of area like country, state, city, county, etc.
enum AreaType {
    /// Represents a country, ie. a territory with its own borders and total sovereignty
    country,
    /// Represents a state, ie. a part of a large country.
    state,
    /// Represents a county, ie. an administrative division in a state or country.
    county,
    /// Represents a city.
    city,
    /// Represents a postal code area.
    postalCode,
    /// Represents a district.
    district,
    /// Represents a subdistrict.
    subDistrict
}

// AreaType "private" section, not exported.

int sdkSearchAreatypeToFfi(AreaType value) {
  switch (value) {
  case AreaType.country:
    return 0;
  case AreaType.state:
    return 1;
  case AreaType.county:
    return 2;
  case AreaType.city:
    return 3;
  case AreaType.postalCode:
    return 4;
  case AreaType.district:
    return 5;
  case AreaType.subDistrict:
    return 6;
  default:
    throw StateError("Invalid enum value $value for AreaType enum.");
  }
}

AreaType sdkSearchAreatypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return AreaType.country;
  case 1:
    return AreaType.state;
  case 2:
    return AreaType.county;
  case 3:
    return AreaType.city;
  case 4:
    return AreaType.postalCode;
  case 5:
    return AreaType.district;
  case 6:
    return AreaType.subDistrict;
  default:
    throw StateError("Invalid numeric value $handle for AreaType enum.");
  }
}

void sdkSearchAreatypeReleaseFfiHandle(int handle) {}

final _sdkSearchAreatypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_AreaType_create_handle_nullable'));
final _sdkSearchAreatypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_AreaType_release_handle_nullable'));
final _sdkSearchAreatypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_AreaType_get_value_nullable'));

Pointer<Void> sdkSearchAreatypeToFfiNullable(AreaType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchAreatypeToFfi(value);
  final result = _sdkSearchAreatypeCreateHandleNullable(_handle);
  sdkSearchAreatypeReleaseFfiHandle(_handle);
  return result;
}

AreaType? sdkSearchAreatypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchAreatypeGetValueNullable(handle);
  final result = sdkSearchAreatypeFromFfi(_handle);
  sdkSearchAreatypeReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchAreatypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchAreatypeReleaseHandleNullable(handle);

// End of AreaType "private" section.


