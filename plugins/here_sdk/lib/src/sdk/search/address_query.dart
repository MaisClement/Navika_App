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
import 'package:here_sdk/src/sdk/core/country_code.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:meta/meta.dart';




/// The options to specify an address query.
///
/// A [AddressQuery.query] can consist of parts of an address or full addresses,
/// optionally comma separated, for example: "HERE, Invalidenstraße 116, Berlin, Germany".
/// [SearchOptions.languageCode] specifies the language of the [AddressQuery.query] and determines the preferred
/// language of the results.
@immutable
class AddressQuery {
  /// Desired address query to search.
  final String query;

  /// Geographical coordinates of the center around which to provide the most relevant places.
  /// For Offline Search null value will result in [SearchError.invalidParameter]
  final GeoCoordinates? areaCenter;

  /// A list of countries that the query is applied in.
  /// Usage of CountryCode list in search query is not supported when using
  /// offline search in OfflineSearchEngine.
  final List<CountryCode> countries;

  const AddressQuery._(this.query, this.areaCenter, this.countries);
  /// Constructs an AddressQuery from the provided text query and geographical coordinates.
  ///
  /// [query] Desired query to search.
  ///
  /// [areaCenter] Geographical coordinates of the center around which to provide the most relevant places.
  ///
  factory AddressQuery.withAreaCenter(String query, GeoCoordinates areaCenter) => $prototype.withAreaCenter(query, areaCenter);
  /// Constructs an AddressQuery from the provided text query, geographical coordinates and the
  /// list of countries the query is applied in.
  ///
  /// [query] Desired query to search.
  ///
  /// [areaCenter] Geographical coordinates of the center around which to provide the most relevant places.
  ///
  /// [countries] A list of countries that the query is applied in.
  ///
  factory AddressQuery.withAreaCenterInCountries(String query, GeoCoordinates areaCenter, List<CountryCode> countries) => $prototype.withAreaCenterInCountries(query, areaCenter, countries);
  /// Constructs an AddressQuery from the provided text query.
  ///
  /// Not supported in `OfflineSearchEngine` (not available in all editions).
  ///
  /// [query] Desired query to search.
  ///
  factory AddressQuery(String query) => $prototype.$init(query);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AddressQuery) return false;
    AddressQuery _other = other;
    return query == _other.query &&
        areaCenter == _other.areaCenter &&
        DeepCollectionEquality().equals(countries, _other.countries);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + query.hashCode;
    result = 31 * result + areaCenter.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(countries);
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = AddressQuery$Impl();
}


// AddressQuery "private" section, not exported.

final _sdkSearchAddressqueryCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_create_handle'));
final _sdkSearchAddressqueryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_release_handle'));
final _sdkSearchAddressqueryGetFieldquery = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_get_field_query'));
final _sdkSearchAddressqueryGetFieldareaCenter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_get_field_areaCenter'));
final _sdkSearchAddressqueryGetFieldcountries = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_get_field_countries'));



/// @nodoc
@visibleForTesting
class AddressQuery$Impl {
  AddressQuery withAreaCenter(String query, GeoCoordinates areaCenter) {
    final _withAreaCenterFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_AddressQuery_make__String_GeoCoordinates'));
    final _queryHandle = stringToFfi(query);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final __resultHandle = _withAreaCenterFfi(__lib.LibraryContext.isolateId, _queryHandle, _areaCenterHandle);
    stringReleaseFfiHandle(_queryHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    try {
      return sdkSearchAddressqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchAddressqueryReleaseFfiHandle(__resultHandle);

    }

  }

  AddressQuery withAreaCenterInCountries(String query, GeoCoordinates areaCenter, List<CountryCode> countries) {
    final _withAreaCenterInCountriesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_AddressQuery_make__String_GeoCoordinates_ListOf_sdk_core_CountryCode'));
    final _queryHandle = stringToFfi(query);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _countriesHandle = heresdkSearchCommonBindingslistofSdkCoreCountrycodeToFfi(countries);
    final __resultHandle = _withAreaCenterInCountriesFfi(__lib.LibraryContext.isolateId, _queryHandle, _areaCenterHandle, _countriesHandle);
    stringReleaseFfiHandle(_queryHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    heresdkSearchCommonBindingslistofSdkCoreCountrycodeReleaseFfiHandle(_countriesHandle);
    try {
      return sdkSearchAddressqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchAddressqueryReleaseFfiHandle(__resultHandle);

    }

  }

  AddressQuery $init(String query) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_AddressQuery_make__String'));
    final _queryHandle = stringToFfi(query);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _queryHandle);
    stringReleaseFfiHandle(_queryHandle);
    try {
      return sdkSearchAddressqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchAddressqueryReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkSearchAddressqueryToFfi(AddressQuery value) {
  final _queryHandle = stringToFfi(value.query);
  final _areaCenterHandle = sdkCoreGeocoordinatesToFfiNullable(value.areaCenter);
  final _countriesHandle = heresdkSearchCommonBindingslistofSdkCoreCountrycodeToFfi(value.countries);
  final _result = _sdkSearchAddressqueryCreateHandle(_queryHandle, _areaCenterHandle, _countriesHandle);
  stringReleaseFfiHandle(_queryHandle);
  sdkCoreGeocoordinatesReleaseFfiHandleNullable(_areaCenterHandle);
  heresdkSearchCommonBindingslistofSdkCoreCountrycodeReleaseFfiHandle(_countriesHandle);
  return _result;
}

AddressQuery sdkSearchAddressqueryFromFfi(Pointer<Void> handle) {
  final _queryHandle = _sdkSearchAddressqueryGetFieldquery(handle);
  final _areaCenterHandle = _sdkSearchAddressqueryGetFieldareaCenter(handle);
  final _countriesHandle = _sdkSearchAddressqueryGetFieldcountries(handle);
  try {
    return AddressQuery._(
      stringFromFfi(_queryHandle), 
      sdkCoreGeocoordinatesFromFfiNullable(_areaCenterHandle), 
      heresdkSearchCommonBindingslistofSdkCoreCountrycodeFromFfi(_countriesHandle)
    );
  } finally {
    stringReleaseFfiHandle(_queryHandle);
    sdkCoreGeocoordinatesReleaseFfiHandleNullable(_areaCenterHandle);
    heresdkSearchCommonBindingslistofSdkCoreCountrycodeReleaseFfiHandle(_countriesHandle);
  }
}

void sdkSearchAddressqueryReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchAddressqueryReleaseHandle(handle);

// Nullable AddressQuery

final _sdkSearchAddressqueryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_create_handle_nullable'));
final _sdkSearchAddressqueryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_release_handle_nullable'));
final _sdkSearchAddressqueryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_AddressQuery_get_value_nullable'));

Pointer<Void> sdkSearchAddressqueryToFfiNullable(AddressQuery? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchAddressqueryToFfi(value);
  final result = _sdkSearchAddressqueryCreateHandleNullable(_handle);
  sdkSearchAddressqueryReleaseFfiHandle(_handle);
  return result;
}

AddressQuery? sdkSearchAddressqueryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchAddressqueryGetValueNullable(handle);
  final result = sdkSearchAddressqueryFromFfi(_handle);
  sdkSearchAddressqueryReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchAddressqueryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchAddressqueryReleaseHandleNullable(handle);

// End of AddressQuery "private" section.


