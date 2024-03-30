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
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_circle.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/geo_corridor.dart';
import 'package:here_sdk/src/sdk/search/place_filter.dart';
import 'package:meta/meta.dart';


/// The options to specify a text query.

class TextQuery {
  /// Desired query to search.
  String query;

  /// Area which to provide the most relevant places.
  TextQueryArea area;

  /// The filter options to specify a place in query.
  /// Consists of fuel and truck options.
  PlaceFilter placeFilter;

  TextQuery._(this.query, this.area, this.placeFilter);
  /// Constructs a TextQuery from the provided text query and geographic area.
  ///
  /// For Offline Search, search in a given `GeoBox`, `GeoCircle` or `GeoCorridor`
  /// restricts the results to only POIs.
  ///
  /// [query] Desired query to search.
  ///
  /// [area] Area which to provide the most relevant places.
  ///
  factory TextQuery.withArea(String query, TextQueryArea area) => $prototype.withArea(query, area);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TextQuery) return false;
    TextQuery _other = other;
    return query == _other.query &&
        area == _other.area &&
        placeFilter == _other.placeFilter;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + query.hashCode;
    result = 31 * result + area.hashCode;
    result = 31 * result + placeFilter.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = TextQuery$Impl();
}






/// Area to perform search on.
@immutable
class TextQueryArea {
  /// Geographic coordinates of the center around which to provide the most relevant places.
  /// For Offline Search, one of [TextQueryArea.areaCenter], [TextQueryArea.boxArea] and [TextQueryArea.circleArea] has to be set,
  /// otherwise it will result in [SearchError.invalidParameter].
  final GeoCoordinates? areaCenter;

  /// Geographic rectangle area in which to provide the most relevant places.
  /// For Offline Search, one of [TextQueryArea.areaCenter], [TextQueryArea.boxArea] and [TextQueryArea.circleArea] has to be set,
  /// otherwise it will result in [SearchError.invalidParameter].
  /// Also, for Offline Search, search in a given `GeoBox` restricts the results to only POIs.
  final GeoBox? boxArea;

  /// Geographic circle area in which to provide the most relevant places.
  /// For Offline Search, one of [TextQueryArea.areaCenter], [TextQueryArea.boxArea] and [TextQueryArea.circleArea] has to be set,
  /// otherwise it will result in [SearchError.invalidParameter].
  /// Also, for Offline Search, search in a given `GeoCircle` restricts the results to only POIs.
  final GeoCircle? circleArea;

  /// Geographic corridor area in which to provide the most relevant places.
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// More complex polylines (those with large amounts of GeoCoordinates) with smaller half-width
  /// can result in [SearchError.polylineTooLong].
  /// To avoid this, half-width can be increased or not set.
  /// If the corridor half-width is not set, then the algorithm will treat it as being flexible,
  /// which allows for greater tolerance in polyline compression.
  /// For example: Route between New York and Chicago with half-width 800 will work, but route
  /// of the same length (around 360km) between Milan (Italy) and Konstanz (Germany)
  /// will require the half-width to be bigger or not set, as its shape is more complex.
  /// When [TextQueryArea.corridorArea] is provided,
  /// [TextQueryArea.areaCenter] has to be within it, otherwise
  /// [TextQueryArea.areaCenter] is ignored when searching.
  /// For Offline Search, search in a given `GeoCorridor` restricts the results to only POIs.
  final GeoCorridor? corridorArea;

  /// A list of countries that the query is applied in.
  /// Usage of CountryCode list in search query is not supported when using
  /// offline search in OfflineSearchEngine.
  final List<CountryCode> countries;

  const TextQueryArea._(this.areaCenter, this.boxArea, this.circleArea, this.corridorArea, this.countries);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  factory TextQueryArea.withCenter(GeoCoordinates areaCenter) => $prototype.withCenter(areaCenter);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// For Offline Search, search in a given `GeoBox` restricts the results to only POIs.
  ///
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  ///
  factory TextQueryArea.withBox(GeoBox boxArea) => $prototype.withBox(boxArea);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// For Offline Search, search in a given `GeoCircle` restricts the results to only POIs.
  ///
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  ///
  factory TextQueryArea.withCircle(GeoCircle circleArea) => $prototype.withCircle(circleArea);
  /// Geographic corridor area in which to provide the most relevant places.
  ///
  /// The contained polyline and half-width define the area that will be used in a search query.
  /// For Offline Search, search in a given `GeoCorridor` restricts the results to only POIs.
  ///
  /// [corridorArea] Geographic circle area in which to provide the most relevant places.
  ///
  /// [areaCenter] Geographic coordinates of the prioritized area center.
  ///
  factory TextQueryArea.withCorridor(GeoCorridor corridorArea, GeoCoordinates areaCenter) => $prototype.withCorridor(corridorArea, areaCenter);
  /// Geographic corridor area in which to provide the most relevant places.
  ///
  /// The contained polyline and half-width define the area that will be used in a search query.
  ///
  /// [countries] A list of countries that the query is applied in.
  ///
  /// [areaCenter] Geographic coordinates of the prioritized area center.
  ///
  factory TextQueryArea.withCountries(List<CountryCode> countries, GeoCoordinates areaCenter) => $prototype.withCountries(countries, areaCenter);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TextQueryArea) return false;
    TextQueryArea _other = other;
    return areaCenter == _other.areaCenter &&
        boxArea == _other.boxArea &&
        circleArea == _other.circleArea &&
        corridorArea == _other.corridorArea &&
        DeepCollectionEquality().equals(countries, _other.countries);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + areaCenter.hashCode;
    result = 31 * result + boxArea.hashCode;
    result = 31 * result + circleArea.hashCode;
    result = 31 * result + corridorArea.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(countries);
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = TextQueryArea$Impl();
}


// TextQueryArea "private" section, not exported.

final _sdkSearchTextqueryAreaCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_Area_create_handle'));
final _sdkSearchTextqueryAreaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_Area_release_handle'));
final _sdkSearchTextqueryAreaGetFieldareaCenter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_Area_get_field_areaCenter'));
final _sdkSearchTextqueryAreaGetFieldboxArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_Area_get_field_boxArea'));
final _sdkSearchTextqueryAreaGetFieldcircleArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_Area_get_field_circleArea'));
final _sdkSearchTextqueryAreaGetFieldcorridorArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_Area_get_field_corridorArea'));
final _sdkSearchTextqueryAreaGetFieldcountries = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_Area_get_field_countries'));



/// @nodoc
@visibleForTesting
class TextQueryArea$Impl {
  TextQueryArea withCenter(GeoCoordinates areaCenter) {
    final _withCenterFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_TextQuery_Area_make__GeoCoordinates'));
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final __resultHandle = _withCenterFfi(__lib.LibraryContext.isolateId, _areaCenterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    try {
      return sdkSearchTextqueryAreaFromFfi(__resultHandle);
    } finally {
      sdkSearchTextqueryAreaReleaseFfiHandle(__resultHandle);

    }

  }

  TextQueryArea withBox(GeoBox boxArea) {
    final _withBoxFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_TextQuery_Area_make__GeoBox'));
    final _boxAreaHandle = sdkCoreGeoboxToFfi(boxArea);
    final __resultHandle = _withBoxFfi(__lib.LibraryContext.isolateId, _boxAreaHandle);
    sdkCoreGeoboxReleaseFfiHandle(_boxAreaHandle);
    try {
      return sdkSearchTextqueryAreaFromFfi(__resultHandle);
    } finally {
      sdkSearchTextqueryAreaReleaseFfiHandle(__resultHandle);

    }

  }

  TextQueryArea withCircle(GeoCircle circleArea) {
    final _withCircleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_TextQuery_Area_make__GeoCircle'));
    final _circleAreaHandle = sdkCoreGeocircleToFfi(circleArea);
    final __resultHandle = _withCircleFfi(__lib.LibraryContext.isolateId, _circleAreaHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleAreaHandle);
    try {
      return sdkSearchTextqueryAreaFromFfi(__resultHandle);
    } finally {
      sdkSearchTextqueryAreaReleaseFfiHandle(__resultHandle);

    }

  }

  TextQueryArea withCorridor(GeoCorridor corridorArea, GeoCoordinates areaCenter) {
    final _withCorridorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_TextQuery_Area_make__GeoCorridor_GeoCoordinates'));
    final _corridorAreaHandle = sdkCoreGeocorridorToFfi(corridorArea);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final __resultHandle = _withCorridorFfi(__lib.LibraryContext.isolateId, _corridorAreaHandle, _areaCenterHandle);
    sdkCoreGeocorridorReleaseFfiHandle(_corridorAreaHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    try {
      return sdkSearchTextqueryAreaFromFfi(__resultHandle);
    } finally {
      sdkSearchTextqueryAreaReleaseFfiHandle(__resultHandle);

    }

  }

  TextQueryArea withCountries(List<CountryCode> countries, GeoCoordinates areaCenter) {
    final _withCountriesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_TextQuery_Area_make__ListOf_sdk_core_CountryCode_GeoCoordinates'));
    final _countriesHandle = heresdkSearchCommonBindingslistofSdkCoreCountrycodeToFfi(countries);
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final __resultHandle = _withCountriesFfi(__lib.LibraryContext.isolateId, _countriesHandle, _areaCenterHandle);
    heresdkSearchCommonBindingslistofSdkCoreCountrycodeReleaseFfiHandle(_countriesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    try {
      return sdkSearchTextqueryAreaFromFfi(__resultHandle);
    } finally {
      sdkSearchTextqueryAreaReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkSearchTextqueryAreaToFfi(TextQueryArea value) {
  final _areaCenterHandle = sdkCoreGeocoordinatesToFfiNullable(value.areaCenter);
  final _boxAreaHandle = sdkCoreGeoboxToFfiNullable(value.boxArea);
  final _circleAreaHandle = sdkCoreGeocircleToFfiNullable(value.circleArea);
  final _corridorAreaHandle = sdkCoreGeocorridorToFfiNullable(value.corridorArea);
  final _countriesHandle = heresdkSearchCommonBindingslistofSdkCoreCountrycodeToFfi(value.countries);
  final _result = _sdkSearchTextqueryAreaCreateHandle(_areaCenterHandle, _boxAreaHandle, _circleAreaHandle, _corridorAreaHandle, _countriesHandle);
  sdkCoreGeocoordinatesReleaseFfiHandleNullable(_areaCenterHandle);
  sdkCoreGeoboxReleaseFfiHandleNullable(_boxAreaHandle);
  sdkCoreGeocircleReleaseFfiHandleNullable(_circleAreaHandle);
  sdkCoreGeocorridorReleaseFfiHandleNullable(_corridorAreaHandle);
  heresdkSearchCommonBindingslistofSdkCoreCountrycodeReleaseFfiHandle(_countriesHandle);
  return _result;
}

TextQueryArea sdkSearchTextqueryAreaFromFfi(Pointer<Void> handle) {
  final _areaCenterHandle = _sdkSearchTextqueryAreaGetFieldareaCenter(handle);
  final _boxAreaHandle = _sdkSearchTextqueryAreaGetFieldboxArea(handle);
  final _circleAreaHandle = _sdkSearchTextqueryAreaGetFieldcircleArea(handle);
  final _corridorAreaHandle = _sdkSearchTextqueryAreaGetFieldcorridorArea(handle);
  final _countriesHandle = _sdkSearchTextqueryAreaGetFieldcountries(handle);
  try {
    return TextQueryArea._(
      sdkCoreGeocoordinatesFromFfiNullable(_areaCenterHandle), 
      sdkCoreGeoboxFromFfiNullable(_boxAreaHandle), 
      sdkCoreGeocircleFromFfiNullable(_circleAreaHandle), 
      sdkCoreGeocorridorFromFfiNullable(_corridorAreaHandle), 
      heresdkSearchCommonBindingslistofSdkCoreCountrycodeFromFfi(_countriesHandle)
    );
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandleNullable(_areaCenterHandle);
    sdkCoreGeoboxReleaseFfiHandleNullable(_boxAreaHandle);
    sdkCoreGeocircleReleaseFfiHandleNullable(_circleAreaHandle);
    sdkCoreGeocorridorReleaseFfiHandleNullable(_corridorAreaHandle);
    heresdkSearchCommonBindingslistofSdkCoreCountrycodeReleaseFfiHandle(_countriesHandle);
  }
}

void sdkSearchTextqueryAreaReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchTextqueryAreaReleaseHandle(handle);

// Nullable TextQueryArea

final _sdkSearchTextqueryAreaCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_Area_create_handle_nullable'));
final _sdkSearchTextqueryAreaReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_Area_release_handle_nullable'));
final _sdkSearchTextqueryAreaGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_Area_get_value_nullable'));

Pointer<Void> sdkSearchTextqueryAreaToFfiNullable(TextQueryArea? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchTextqueryAreaToFfi(value);
  final result = _sdkSearchTextqueryAreaCreateHandleNullable(_handle);
  sdkSearchTextqueryAreaReleaseFfiHandle(_handle);
  return result;
}

TextQueryArea? sdkSearchTextqueryAreaFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchTextqueryAreaGetValueNullable(handle);
  final result = sdkSearchTextqueryAreaFromFfi(_handle);
  sdkSearchTextqueryAreaReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchTextqueryAreaReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchTextqueryAreaReleaseHandleNullable(handle);

// End of TextQueryArea "private" section.

// TextQuery "private" section, not exported.

final _sdkSearchTextqueryCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_create_handle'));
final _sdkSearchTextqueryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_release_handle'));
final _sdkSearchTextqueryGetFieldquery = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_get_field_query'));
final _sdkSearchTextqueryGetFieldarea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_get_field_area'));
final _sdkSearchTextqueryGetFieldplaceFilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_get_field_placeFilter'));



/// @nodoc
@visibleForTesting
class TextQuery$Impl {
  TextQuery withArea(String query, TextQueryArea area) {
    final _withAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_TextQuery_make__String_Area'));
    final _queryHandle = stringToFfi(query);
    final _areaHandle = sdkSearchTextqueryAreaToFfi(area);
    final __resultHandle = _withAreaFfi(__lib.LibraryContext.isolateId, _queryHandle, _areaHandle);
    stringReleaseFfiHandle(_queryHandle);
    sdkSearchTextqueryAreaReleaseFfiHandle(_areaHandle);
    try {
      return sdkSearchTextqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchTextqueryReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkSearchTextqueryToFfi(TextQuery value) {
  final _queryHandle = stringToFfi(value.query);
  final _areaHandle = sdkSearchTextqueryAreaToFfi(value.area);
  final _placeFilterHandle = sdkSearchPlacefilterToFfi(value.placeFilter);
  final _result = _sdkSearchTextqueryCreateHandle(_queryHandle, _areaHandle, _placeFilterHandle);
  stringReleaseFfiHandle(_queryHandle);
  sdkSearchTextqueryAreaReleaseFfiHandle(_areaHandle);
  sdkSearchPlacefilterReleaseFfiHandle(_placeFilterHandle);
  return _result;
}

TextQuery sdkSearchTextqueryFromFfi(Pointer<Void> handle) {
  final _queryHandle = _sdkSearchTextqueryGetFieldquery(handle);
  final _areaHandle = _sdkSearchTextqueryGetFieldarea(handle);
  final _placeFilterHandle = _sdkSearchTextqueryGetFieldplaceFilter(handle);
  try {
    return TextQuery._(
      stringFromFfi(_queryHandle), 
      sdkSearchTextqueryAreaFromFfi(_areaHandle), 
      sdkSearchPlacefilterFromFfi(_placeFilterHandle)
    );
  } finally {
    stringReleaseFfiHandle(_queryHandle);
    sdkSearchTextqueryAreaReleaseFfiHandle(_areaHandle);
    sdkSearchPlacefilterReleaseFfiHandle(_placeFilterHandle);
  }
}

void sdkSearchTextqueryReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchTextqueryReleaseHandle(handle);

// Nullable TextQuery

final _sdkSearchTextqueryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_create_handle_nullable'));
final _sdkSearchTextqueryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_release_handle_nullable'));
final _sdkSearchTextqueryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_TextQuery_get_value_nullable'));

Pointer<Void> sdkSearchTextqueryToFfiNullable(TextQuery? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchTextqueryToFfi(value);
  final result = _sdkSearchTextqueryCreateHandleNullable(_handle);
  sdkSearchTextqueryReleaseFfiHandle(_handle);
  return result;
}

TextQuery? sdkSearchTextqueryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchTextqueryGetValueNullable(handle);
  final result = sdkSearchTextqueryFromFfi(_handle);
  sdkSearchTextqueryReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchTextqueryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchTextqueryReleaseHandleNullable(handle);

// End of TextQuery "private" section.


