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

/// The options to specify a structured query.
///
/// Only supported in `OfflineSearchEngine` (not available for all editions).
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class StructuredQuery {
  /// Desired query to search.
  String query;

  /// Geographic coordinates of the prioritized area center.
  GeoCoordinates areaCenter;

  /// Query address elements to get the results from a specific geographical area.
  StructuredQueryAddressElements addressElements;

  /// An optional field to indicates the type of result expected.
  StructuredQueryResultType? resultType;

  /// Creates a new instance.

  /// [query] Desired query to search.

  /// [areaCenter] Geographic coordinates of the prioritized area center.

  /// [addressElements] Query address elements to get the results from a specific geographical area.

  /// [resultType] An optional field to indicates the type of result expected.

  StructuredQuery._(this.query, this.areaCenter, this.addressElements, this.resultType);
  StructuredQuery(String query, GeoCoordinates areaCenter)
    : query = query, areaCenter = areaCenter, addressElements = StructuredQueryAddressElements(), resultType = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StructuredQuery) return false;
    StructuredQuery _other = other;
    return query == _other.query &&
        areaCenter == _other.areaCenter &&
        addressElements == _other.addressElements &&
        resultType == _other.resultType;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + query.hashCode;
    result = 31 * result + areaCenter.hashCode;
    result = 31 * result + addressElements.hashCode;
    result = 31 * result + resultType.hashCode;
    return result;
  }
}

/// Specifies expected result type.
enum StructuredQueryResultType {
    /// Expected result type is country.
    country,
    /// Expected result type is city.
    city,
    /// Expected result type is postal code.
    postalCode,
    /// Expected result type is district.
    district,
    /// Expected result type is street.
    street
}

// StructuredQueryResultType "private" section, not exported.

int sdkSearchStructuredqueryResulttypeToFfi(StructuredQueryResultType value) {
  switch (value) {
  case StructuredQueryResultType.country:
    return 0;
  case StructuredQueryResultType.city:
    return 1;
  case StructuredQueryResultType.postalCode:
    return 2;
  case StructuredQueryResultType.district:
    return 3;
  case StructuredQueryResultType.street:
    return 4;
  default:
    throw StateError("Invalid enum value $value for StructuredQueryResultType enum.");
  }
}

StructuredQueryResultType sdkSearchStructuredqueryResulttypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return StructuredQueryResultType.country;
  case 1:
    return StructuredQueryResultType.city;
  case 2:
    return StructuredQueryResultType.postalCode;
  case 3:
    return StructuredQueryResultType.district;
  case 4:
    return StructuredQueryResultType.street;
  default:
    throw StateError("Invalid numeric value $handle for StructuredQueryResultType enum.");
  }
}

void sdkSearchStructuredqueryResulttypeReleaseFfiHandle(int handle) {}

final _sdkSearchStructuredqueryResulttypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_StructuredQuery_ResultType_create_handle_nullable'));
final _sdkSearchStructuredqueryResulttypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_ResultType_release_handle_nullable'));
final _sdkSearchStructuredqueryResulttypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_ResultType_get_value_nullable'));

Pointer<Void> sdkSearchStructuredqueryResulttypeToFfiNullable(StructuredQueryResultType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchStructuredqueryResulttypeToFfi(value);
  final result = _sdkSearchStructuredqueryResulttypeCreateHandleNullable(_handle);
  sdkSearchStructuredqueryResulttypeReleaseFfiHandle(_handle);
  return result;
}

StructuredQueryResultType? sdkSearchStructuredqueryResulttypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchStructuredqueryResulttypeGetValueNullable(handle);
  final result = sdkSearchStructuredqueryResulttypeFromFfi(_handle);
  sdkSearchStructuredqueryResulttypeReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchStructuredqueryResulttypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchStructuredqueryResulttypeReleaseHandleNullable(handle);

// End of StructuredQueryResultType "private" section.
/// Defines query address elements which will be used to apply constraints during searches.

class StructuredQueryAddressElements {
  /// An optional field of country name or code, which will be used to get the results only from the given country.
  String? country;

  /// An optional field of city name, which will be used to get the results only from the given city.
  String? city;

  /// An optional field of postal code, which will be used to get the results only within the given postal code.
  String? postalCode;

  /// An optional field of district, which will be used to get the results only from the given district.
  String? district;

  /// Creates a new instance.

  /// [country] An optional field of country name or code, which will be used to get the results only from the given country.

  /// [city] An optional field of city name, which will be used to get the results only from the given city.

  /// [postalCode] An optional field of postal code, which will be used to get the results only within the given postal code.

  /// [district] An optional field of district, which will be used to get the results only from the given district.

  StructuredQueryAddressElements._(this.country, this.city, this.postalCode, this.district);
  StructuredQueryAddressElements()
    : country = null, city = null, postalCode = null, district = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! StructuredQueryAddressElements) return false;
    StructuredQueryAddressElements _other = other;
    return country == _other.country &&
        city == _other.city &&
        postalCode == _other.postalCode &&
        district == _other.district;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + country.hashCode;
    result = 31 * result + city.hashCode;
    result = 31 * result + postalCode.hashCode;
    result = 31 * result + district.hashCode;
    return result;
  }
}


// StructuredQueryAddressElements "private" section, not exported.

final _sdkSearchStructuredqueryAddresselementsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_AddressElements_create_handle'));
final _sdkSearchStructuredqueryAddresselementsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_AddressElements_release_handle'));
final _sdkSearchStructuredqueryAddresselementsGetFieldcountry = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_AddressElements_get_field_country'));
final _sdkSearchStructuredqueryAddresselementsGetFieldcity = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_AddressElements_get_field_city'));
final _sdkSearchStructuredqueryAddresselementsGetFieldpostalCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_AddressElements_get_field_postalCode'));
final _sdkSearchStructuredqueryAddresselementsGetFielddistrict = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_AddressElements_get_field_district'));



Pointer<Void> sdkSearchStructuredqueryAddresselementsToFfi(StructuredQueryAddressElements value) {
  final _countryHandle = stringToFfiNullable(value.country);
  final _cityHandle = stringToFfiNullable(value.city);
  final _postalCodeHandle = stringToFfiNullable(value.postalCode);
  final _districtHandle = stringToFfiNullable(value.district);
  final _result = _sdkSearchStructuredqueryAddresselementsCreateHandle(_countryHandle, _cityHandle, _postalCodeHandle, _districtHandle);
  stringReleaseFfiHandleNullable(_countryHandle);
  stringReleaseFfiHandleNullable(_cityHandle);
  stringReleaseFfiHandleNullable(_postalCodeHandle);
  stringReleaseFfiHandleNullable(_districtHandle);
  return _result;
}

StructuredQueryAddressElements sdkSearchStructuredqueryAddresselementsFromFfi(Pointer<Void> handle) {
  final _countryHandle = _sdkSearchStructuredqueryAddresselementsGetFieldcountry(handle);
  final _cityHandle = _sdkSearchStructuredqueryAddresselementsGetFieldcity(handle);
  final _postalCodeHandle = _sdkSearchStructuredqueryAddresselementsGetFieldpostalCode(handle);
  final _districtHandle = _sdkSearchStructuredqueryAddresselementsGetFielddistrict(handle);
  try {
    return StructuredQueryAddressElements._(
      stringFromFfiNullable(_countryHandle), 
      stringFromFfiNullable(_cityHandle), 
      stringFromFfiNullable(_postalCodeHandle), 
      stringFromFfiNullable(_districtHandle)
    );
  } finally {
    stringReleaseFfiHandleNullable(_countryHandle);
    stringReleaseFfiHandleNullable(_cityHandle);
    stringReleaseFfiHandleNullable(_postalCodeHandle);
    stringReleaseFfiHandleNullable(_districtHandle);
  }
}

void sdkSearchStructuredqueryAddresselementsReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchStructuredqueryAddresselementsReleaseHandle(handle);

// Nullable StructuredQueryAddressElements

final _sdkSearchStructuredqueryAddresselementsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_AddressElements_create_handle_nullable'));
final _sdkSearchStructuredqueryAddresselementsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_AddressElements_release_handle_nullable'));
final _sdkSearchStructuredqueryAddresselementsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_AddressElements_get_value_nullable'));

Pointer<Void> sdkSearchStructuredqueryAddresselementsToFfiNullable(StructuredQueryAddressElements? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchStructuredqueryAddresselementsToFfi(value);
  final result = _sdkSearchStructuredqueryAddresselementsCreateHandleNullable(_handle);
  sdkSearchStructuredqueryAddresselementsReleaseFfiHandle(_handle);
  return result;
}

StructuredQueryAddressElements? sdkSearchStructuredqueryAddresselementsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchStructuredqueryAddresselementsGetValueNullable(handle);
  final result = sdkSearchStructuredqueryAddresselementsFromFfi(_handle);
  sdkSearchStructuredqueryAddresselementsReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchStructuredqueryAddresselementsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchStructuredqueryAddresselementsReleaseHandleNullable(handle);

// End of StructuredQueryAddressElements "private" section.

// StructuredQuery "private" section, not exported.

final _sdkSearchStructuredqueryCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_create_handle'));
final _sdkSearchStructuredqueryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_release_handle'));
final _sdkSearchStructuredqueryGetFieldquery = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_get_field_query'));
final _sdkSearchStructuredqueryGetFieldareaCenter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_get_field_areaCenter'));
final _sdkSearchStructuredqueryGetFieldaddressElements = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_get_field_addressElements'));
final _sdkSearchStructuredqueryGetFieldresultType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_get_field_resultType'));



Pointer<Void> sdkSearchStructuredqueryToFfi(StructuredQuery value) {
  final _queryHandle = stringToFfi(value.query);
  final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(value.areaCenter);
  final _addressElementsHandle = sdkSearchStructuredqueryAddresselementsToFfi(value.addressElements);
  final _resultTypeHandle = sdkSearchStructuredqueryResulttypeToFfiNullable(value.resultType);
  final _result = _sdkSearchStructuredqueryCreateHandle(_queryHandle, _areaCenterHandle, _addressElementsHandle, _resultTypeHandle);
  stringReleaseFfiHandle(_queryHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
  sdkSearchStructuredqueryAddresselementsReleaseFfiHandle(_addressElementsHandle);
  sdkSearchStructuredqueryResulttypeReleaseFfiHandleNullable(_resultTypeHandle);
  return _result;
}

StructuredQuery sdkSearchStructuredqueryFromFfi(Pointer<Void> handle) {
  final _queryHandle = _sdkSearchStructuredqueryGetFieldquery(handle);
  final _areaCenterHandle = _sdkSearchStructuredqueryGetFieldareaCenter(handle);
  final _addressElementsHandle = _sdkSearchStructuredqueryGetFieldaddressElements(handle);
  final _resultTypeHandle = _sdkSearchStructuredqueryGetFieldresultType(handle);
  try {
    return StructuredQuery._(
      stringFromFfi(_queryHandle), 
      sdkCoreGeocoordinatesFromFfi(_areaCenterHandle), 
      sdkSearchStructuredqueryAddresselementsFromFfi(_addressElementsHandle), 
      sdkSearchStructuredqueryResulttypeFromFfiNullable(_resultTypeHandle)
    );
  } finally {
    stringReleaseFfiHandle(_queryHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkSearchStructuredqueryAddresselementsReleaseFfiHandle(_addressElementsHandle);
    sdkSearchStructuredqueryResulttypeReleaseFfiHandleNullable(_resultTypeHandle);
  }
}

void sdkSearchStructuredqueryReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchStructuredqueryReleaseHandle(handle);

// Nullable StructuredQuery

final _sdkSearchStructuredqueryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_create_handle_nullable'));
final _sdkSearchStructuredqueryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_release_handle_nullable'));
final _sdkSearchStructuredqueryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_StructuredQuery_get_value_nullable'));

Pointer<Void> sdkSearchStructuredqueryToFfiNullable(StructuredQuery? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchStructuredqueryToFfi(value);
  final result = _sdkSearchStructuredqueryCreateHandleNullable(_handle);
  sdkSearchStructuredqueryReleaseFfiHandle(_handle);
  return result;
}

StructuredQuery? sdkSearchStructuredqueryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchStructuredqueryGetValueNullable(handle);
  final result = sdkSearchStructuredqueryFromFfi(_handle);
  sdkSearchStructuredqueryReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchStructuredqueryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchStructuredqueryReleaseHandleNullable(handle);

// End of StructuredQuery "private" section.


