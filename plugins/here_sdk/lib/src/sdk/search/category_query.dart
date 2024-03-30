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
import 'package:here_sdk/src/sdk/core/geo_circle.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/geo_corridor.dart';
import 'package:here_sdk/src/sdk/search/place_category.dart';
import 'package:here_sdk/src/sdk/search/place_chain.dart';
import 'package:here_sdk/src/sdk/search/place_filter.dart';
import 'package:here_sdk/src/sdk/search/place_food_type.dart';
import 'package:meta/meta.dart';





/// The options to specify a query by categories.

class CategoryQuery {
  /// List of categories to be included.
  /// A place can be assigned multiple categories. If any of them is in `CategoryQuery.categories`,
  /// but none are in `CategoryQuery.excludeCategories`, that place will be included in the response.
  List<PlaceCategory> categories;

  /// List of categories and subcategories to be excluded.
  /// A place can be assigned multiple categories. If any of them is in `CategoryQuery.excludeCategories`,
  /// that place will not be included in the response, regardless of whether any of its assigned
  /// categories have been included in `CategoryQuery.categories`.
  /// In short, an exclusion will always win over an inclusion.
  /// This is especially useful for excluding specific subcategories from the main category.
  List<PlaceCategory> excludeCategories;

  /// List of chains to be included.
  /// A place can be assigned multiple chains. If any of them is in `CategoryQuery.includeChains`,
  /// but none are in `CategoryQuery.excludeChains`, that place will be included in the response.
  List<PlaceChain> includeChains;

  /// List of chains to be excluded.
  /// A place can be assigned multiple chains. If any of them is in `CategoryQuery.excludeChains`,
  /// that place will not be included in the response, regardless of whether any of its assigned
  /// chains have been included in `CategoryQuery.includeChains`.
  /// In short, an exclusion will always win over an inclusion.
  List<PlaceChain> excludeChains;

  /// List of food types to be included.
  /// A place can be assigned multiple food types. If any of them is in `CategoryQuery.includeFoodTypes`,
  /// but none are in `CategoryQuery.excludeFoodTypes`, that place will be included in the response.
  /// Not supported in `OfflineSearchEngine` (not available in all editions).
  List<PlaceFoodType> includeFoodTypes;

  /// List of food types to be excluded.
  /// A place can be assigned multiple food types. If any of them is in `CategoryQuery.excludeFoodTypes`,
  /// that place will not be included in the response, regardless of whether any of its assigned
  /// food types have been included in `CategoryQuery.includeFoodTypes`.
  /// In short, an exclusion will always win over an inclusion.
  /// Not supported in `OfflineSearchEngine` (not available in all editions).
  List<PlaceFoodType> excludeFoodTypes;

  /// Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  /// By default the value is set to null
  /// and results will be based on other parameters provided.
  String? filter;

  /// The filter options to specify a place in query.
  /// Consists of fuel and truck options.
  PlaceFilter placeFilter;

  /// Area in which to provide the most relevant places.
  CategoryQueryArea area;

  CategoryQuery._(this.categories, this.excludeCategories, this.includeChains, this.excludeChains, this.includeFoodTypes, this.excludeFoodTypes, this.filter, this.placeFilter, this.area);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [category] Category for query
  ///
  /// [area] Area in which to provide the most relevant places.
  ///
  factory CategoryQuery.withCategoryInArea(PlaceCategory category, CategoryQueryArea area) => $prototype.withCategoryInArea(category, area);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [categories] List of categories.
  ///
  /// [area] Area in which to provide the most relevant places.
  ///
  factory CategoryQuery.withCategoriesInArea(List<PlaceCategory> categories, CategoryQueryArea area) => $prototype.withCategoriesInArea(categories, area);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [category] Category for query
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [area] Area in which to provide the most relevant places.
  ///
  factory CategoryQuery.withCategoryAndFilterInArea(PlaceCategory category, String filter, CategoryQueryArea area) => $prototype.withCategoryAndFilterInArea(category, filter, area);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [categories] List of categories.
  ///
  /// [filter] Full-text filter on POI names/titles.
  /// Results with a partial match on the name parameter are included in the response.
  ///
  /// [area] Area in which to provide the most relevant places.
  ///
  factory CategoryQuery.withCategoriesAndFilterInArea(List<PlaceCategory> categories, String filter, CategoryQueryArea area) => $prototype.withCategoriesAndFilterInArea(categories, filter, area);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CategoryQuery) return false;
    CategoryQuery _other = other;
    return DeepCollectionEquality().equals(categories, _other.categories) &&
        DeepCollectionEquality().equals(excludeCategories, _other.excludeCategories) &&
        DeepCollectionEquality().equals(includeChains, _other.includeChains) &&
        DeepCollectionEquality().equals(excludeChains, _other.excludeChains) &&
        DeepCollectionEquality().equals(includeFoodTypes, _other.includeFoodTypes) &&
        DeepCollectionEquality().equals(excludeFoodTypes, _other.excludeFoodTypes) &&
        filter == _other.filter &&
        placeFilter == _other.placeFilter &&
        area == _other.area;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(categories);
    result = 31 * result + DeepCollectionEquality().hash(excludeCategories);
    result = 31 * result + DeepCollectionEquality().hash(includeChains);
    result = 31 * result + DeepCollectionEquality().hash(excludeChains);
    result = 31 * result + DeepCollectionEquality().hash(includeFoodTypes);
    result = 31 * result + DeepCollectionEquality().hash(excludeFoodTypes);
    result = 31 * result + filter.hashCode;
    result = 31 * result + placeFilter.hashCode;
    result = 31 * result + area.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = CategoryQuery$Impl();
}





/// Area to perform search on.
@immutable
class CategoryQueryArea {
  /// Geographic coordinates of the center around which to provide the most relevant places.
  final GeoCoordinates areaCenter;

  /// Geographic rectangle area in which to provide the most relevant places.
  final GeoBox? boxArea;

  /// Geographic circle area in which to provide the most relevant places.
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
  /// When [CategoryQueryArea.corridorArea] is provided,
  /// [CategoryQueryArea.areaCenter] has to be within it, otherwise
  /// [CategoryQueryArea.areaCenter] is ignored when searching.
  final GeoCorridor? corridorArea;

  const CategoryQueryArea._(this.areaCenter, this.boxArea, this.circleArea, this.corridorArea);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  factory CategoryQueryArea.withCenter(GeoCoordinates areaCenter) => $prototype.withCenter(areaCenter);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [boxArea] Geographic rectangle area in which to provide the most relevant places.
  ///
  factory CategoryQueryArea.withBox(GeoCoordinates areaCenter, GeoBox boxArea) => $prototype.withBox(areaCenter, boxArea);
  /// Constructs a new instance of this class from provided parameters.
  ///
  /// [areaCenter] Geographic coordinates of the center around which to provide the most relevant places.
  ///
  /// [circleArea] Geographic circle area in which to provide the most relevant places.
  ///
  factory CategoryQueryArea.withCircle(GeoCoordinates areaCenter, GeoCircle circleArea) => $prototype.withCircle(areaCenter, circleArea);
  /// Geographic corridor area in which to provide the most relevant places.
  ///
  /// The contained polyline and half-width define the area that will be used in a search query.
  ///
  /// [corridorArea] Geographic circle area in which to provide the most relevant places.
  ///
  factory CategoryQueryArea.withCorridor(GeoCorridor corridorArea) => $prototype.withCorridor(corridorArea);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CategoryQueryArea) return false;
    CategoryQueryArea _other = other;
    return areaCenter == _other.areaCenter &&
        boxArea == _other.boxArea &&
        circleArea == _other.circleArea &&
        corridorArea == _other.corridorArea;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + areaCenter.hashCode;
    result = 31 * result + boxArea.hashCode;
    result = 31 * result + circleArea.hashCode;
    result = 31 * result + corridorArea.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = CategoryQueryArea$Impl();
}


// CategoryQueryArea "private" section, not exported.

final _sdkSearchCategoryqueryAreaCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_create_handle'));
final _sdkSearchCategoryqueryAreaReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_release_handle'));
final _sdkSearchCategoryqueryAreaGetFieldareaCenter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_get_field_areaCenter'));
final _sdkSearchCategoryqueryAreaGetFieldboxArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_get_field_boxArea'));
final _sdkSearchCategoryqueryAreaGetFieldcircleArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_get_field_circleArea'));
final _sdkSearchCategoryqueryAreaGetFieldcorridorArea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_get_field_corridorArea'));



/// @nodoc
@visibleForTesting
class CategoryQueryArea$Impl {
  CategoryQueryArea withCenter(GeoCoordinates areaCenter) {
    final _withCenterFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_Area_make__GeoCoordinates'));
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final __resultHandle = _withCenterFfi(__lib.LibraryContext.isolateId, _areaCenterHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    try {
      return sdkSearchCategoryqueryAreaFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryAreaReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQueryArea withBox(GeoCoordinates areaCenter, GeoBox boxArea) {
    final _withBoxFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_Area_make__GeoCoordinates_GeoBox'));
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _boxAreaHandle = sdkCoreGeoboxToFfi(boxArea);
    final __resultHandle = _withBoxFfi(__lib.LibraryContext.isolateId, _areaCenterHandle, _boxAreaHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeoboxReleaseFfiHandle(_boxAreaHandle);
    try {
      return sdkSearchCategoryqueryAreaFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryAreaReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQueryArea withCircle(GeoCoordinates areaCenter, GeoCircle circleArea) {
    final _withCircleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_Area_make__GeoCoordinates_GeoCircle'));
    final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(areaCenter);
    final _circleAreaHandle = sdkCoreGeocircleToFfi(circleArea);
    final __resultHandle = _withCircleFfi(__lib.LibraryContext.isolateId, _areaCenterHandle, _circleAreaHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleAreaHandle);
    try {
      return sdkSearchCategoryqueryAreaFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryAreaReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQueryArea withCorridor(GeoCorridor corridorArea) {
    final _withCorridorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_Area_make__GeoCorridor'));
    final _corridorAreaHandle = sdkCoreGeocorridorToFfi(corridorArea);
    final __resultHandle = _withCorridorFfi(__lib.LibraryContext.isolateId, _corridorAreaHandle);
    sdkCoreGeocorridorReleaseFfiHandle(_corridorAreaHandle);
    try {
      return sdkSearchCategoryqueryAreaFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryAreaReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkSearchCategoryqueryAreaToFfi(CategoryQueryArea value) {
  final _areaCenterHandle = sdkCoreGeocoordinatesToFfi(value.areaCenter);
  final _boxAreaHandle = sdkCoreGeoboxToFfiNullable(value.boxArea);
  final _circleAreaHandle = sdkCoreGeocircleToFfiNullable(value.circleArea);
  final _corridorAreaHandle = sdkCoreGeocorridorToFfiNullable(value.corridorArea);
  final _result = _sdkSearchCategoryqueryAreaCreateHandle(_areaCenterHandle, _boxAreaHandle, _circleAreaHandle, _corridorAreaHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
  sdkCoreGeoboxReleaseFfiHandleNullable(_boxAreaHandle);
  sdkCoreGeocircleReleaseFfiHandleNullable(_circleAreaHandle);
  sdkCoreGeocorridorReleaseFfiHandleNullable(_corridorAreaHandle);
  return _result;
}

CategoryQueryArea sdkSearchCategoryqueryAreaFromFfi(Pointer<Void> handle) {
  final _areaCenterHandle = _sdkSearchCategoryqueryAreaGetFieldareaCenter(handle);
  final _boxAreaHandle = _sdkSearchCategoryqueryAreaGetFieldboxArea(handle);
  final _circleAreaHandle = _sdkSearchCategoryqueryAreaGetFieldcircleArea(handle);
  final _corridorAreaHandle = _sdkSearchCategoryqueryAreaGetFieldcorridorArea(handle);
  try {
    return CategoryQueryArea._(
      sdkCoreGeocoordinatesFromFfi(_areaCenterHandle), 
      sdkCoreGeoboxFromFfiNullable(_boxAreaHandle), 
      sdkCoreGeocircleFromFfiNullable(_circleAreaHandle), 
      sdkCoreGeocorridorFromFfiNullable(_corridorAreaHandle)
    );
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandle(_areaCenterHandle);
    sdkCoreGeoboxReleaseFfiHandleNullable(_boxAreaHandle);
    sdkCoreGeocircleReleaseFfiHandleNullable(_circleAreaHandle);
    sdkCoreGeocorridorReleaseFfiHandleNullable(_corridorAreaHandle);
  }
}

void sdkSearchCategoryqueryAreaReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchCategoryqueryAreaReleaseHandle(handle);

// Nullable CategoryQueryArea

final _sdkSearchCategoryqueryAreaCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_create_handle_nullable'));
final _sdkSearchCategoryqueryAreaReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_release_handle_nullable'));
final _sdkSearchCategoryqueryAreaGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_Area_get_value_nullable'));

Pointer<Void> sdkSearchCategoryqueryAreaToFfiNullable(CategoryQueryArea? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchCategoryqueryAreaToFfi(value);
  final result = _sdkSearchCategoryqueryAreaCreateHandleNullable(_handle);
  sdkSearchCategoryqueryAreaReleaseFfiHandle(_handle);
  return result;
}

CategoryQueryArea? sdkSearchCategoryqueryAreaFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchCategoryqueryAreaGetValueNullable(handle);
  final result = sdkSearchCategoryqueryAreaFromFfi(_handle);
  sdkSearchCategoryqueryAreaReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchCategoryqueryAreaReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchCategoryqueryAreaReleaseHandleNullable(handle);

// End of CategoryQueryArea "private" section.

// CategoryQuery "private" section, not exported.

final _sdkSearchCategoryqueryCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_create_handle'));
final _sdkSearchCategoryqueryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_release_handle'));
final _sdkSearchCategoryqueryGetFieldcategories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_categories'));
final _sdkSearchCategoryqueryGetFieldexcludeCategories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_excludeCategories'));
final _sdkSearchCategoryqueryGetFieldincludeChains = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_includeChains'));
final _sdkSearchCategoryqueryGetFieldexcludeChains = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_excludeChains'));
final _sdkSearchCategoryqueryGetFieldincludeFoodTypes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_includeFoodTypes'));
final _sdkSearchCategoryqueryGetFieldexcludeFoodTypes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_excludeFoodTypes'));
final _sdkSearchCategoryqueryGetFieldfilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_filter'));
final _sdkSearchCategoryqueryGetFieldplaceFilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_placeFilter'));
final _sdkSearchCategoryqueryGetFieldarea = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_field_area'));



/// @nodoc
@visibleForTesting
class CategoryQuery$Impl {
  CategoryQuery withCategoryInArea(PlaceCategory category, CategoryQueryArea area) {
    final _withCategoryInAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_Area'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _areaHandle = sdkSearchCategoryqueryAreaToFfi(area);
    final __resultHandle = _withCategoryInAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _areaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    sdkSearchCategoryqueryAreaReleaseFfiHandle(_areaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withCategoriesInArea(List<PlaceCategory> categories, CategoryQueryArea area) {
    final _withCategoriesInAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_sdk_search_PlaceCategory_Area'));
    final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(categories);
    final _areaHandle = sdkSearchCategoryqueryAreaToFfi(area);
    final __resultHandle = _withCategoriesInAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _areaHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    sdkSearchCategoryqueryAreaReleaseFfiHandle(_areaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withCategoryAndFilterInArea(PlaceCategory category, String filter, CategoryQueryArea area) {
    final _withCategoryAndFilterInAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__PlaceCategory_String_Area'));
    final _categoryHandle = sdkSearchPlacecategoryToFfi(category);
    final _filterHandle = stringToFfi(filter);
    final _areaHandle = sdkSearchCategoryqueryAreaToFfi(area);
    final __resultHandle = _withCategoryAndFilterInAreaFfi(__lib.LibraryContext.isolateId, _categoryHandle, _filterHandle, _areaHandle);
    sdkSearchPlacecategoryReleaseFfiHandle(_categoryHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkSearchCategoryqueryAreaReleaseFfiHandle(_areaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

  CategoryQuery withCategoriesAndFilterInArea(List<PlaceCategory> categories, String filter, CategoryQueryArea area) {
    final _withCategoriesAndFilterInAreaFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_CategoryQuery_make__ListOf_sdk_search_PlaceCategory_String_Area'));
    final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(categories);
    final _filterHandle = stringToFfi(filter);
    final _areaHandle = sdkSearchCategoryqueryAreaToFfi(area);
    final __resultHandle = _withCategoriesAndFilterInAreaFfi(__lib.LibraryContext.isolateId, _categoriesHandle, _filterHandle, _areaHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkSearchCategoryqueryAreaReleaseFfiHandle(_areaHandle);
    try {
      return sdkSearchCategoryqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchCategoryqueryReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkSearchCategoryqueryToFfi(CategoryQuery value) {
  final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(value.categories);
  final _excludeCategoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(value.excludeCategories);
  final _includeChainsHandle = heresdkSearchCommonBindingslistofSdkSearchPlacechainToFfi(value.includeChains);
  final _excludeChainsHandle = heresdkSearchCommonBindingslistofSdkSearchPlacechainToFfi(value.excludeChains);
  final _includeFoodTypesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacefoodtypeToFfi(value.includeFoodTypes);
  final _excludeFoodTypesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacefoodtypeToFfi(value.excludeFoodTypes);
  final _filterHandle = stringToFfiNullable(value.filter);
  final _placeFilterHandle = sdkSearchPlacefilterToFfi(value.placeFilter);
  final _areaHandle = sdkSearchCategoryqueryAreaToFfi(value.area);
  final _result = _sdkSearchCategoryqueryCreateHandle(_categoriesHandle, _excludeCategoriesHandle, _includeChainsHandle, _excludeChainsHandle, _includeFoodTypesHandle, _excludeFoodTypesHandle, _filterHandle, _placeFilterHandle, _areaHandle);
  heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_excludeCategoriesHandle);
  heresdkSearchCommonBindingslistofSdkSearchPlacechainReleaseFfiHandle(_includeChainsHandle);
  heresdkSearchCommonBindingslistofSdkSearchPlacechainReleaseFfiHandle(_excludeChainsHandle);
  heresdkSearchCommonBindingslistofSdkSearchPlacefoodtypeReleaseFfiHandle(_includeFoodTypesHandle);
  heresdkSearchCommonBindingslistofSdkSearchPlacefoodtypeReleaseFfiHandle(_excludeFoodTypesHandle);
  stringReleaseFfiHandleNullable(_filterHandle);
  sdkSearchPlacefilterReleaseFfiHandle(_placeFilterHandle);
  sdkSearchCategoryqueryAreaReleaseFfiHandle(_areaHandle);
  return _result;
}

CategoryQuery sdkSearchCategoryqueryFromFfi(Pointer<Void> handle) {
  final _categoriesHandle = _sdkSearchCategoryqueryGetFieldcategories(handle);
  final _excludeCategoriesHandle = _sdkSearchCategoryqueryGetFieldexcludeCategories(handle);
  final _includeChainsHandle = _sdkSearchCategoryqueryGetFieldincludeChains(handle);
  final _excludeChainsHandle = _sdkSearchCategoryqueryGetFieldexcludeChains(handle);
  final _includeFoodTypesHandle = _sdkSearchCategoryqueryGetFieldincludeFoodTypes(handle);
  final _excludeFoodTypesHandle = _sdkSearchCategoryqueryGetFieldexcludeFoodTypes(handle);
  final _filterHandle = _sdkSearchCategoryqueryGetFieldfilter(handle);
  final _placeFilterHandle = _sdkSearchCategoryqueryGetFieldplaceFilter(handle);
  final _areaHandle = _sdkSearchCategoryqueryGetFieldarea(handle);
  try {
    return CategoryQuery._(
      heresdkSearchCommonBindingslistofSdkSearchPlacecategoryFromFfi(_categoriesHandle), 
      heresdkSearchCommonBindingslistofSdkSearchPlacecategoryFromFfi(_excludeCategoriesHandle), 
      heresdkSearchCommonBindingslistofSdkSearchPlacechainFromFfi(_includeChainsHandle), 
      heresdkSearchCommonBindingslistofSdkSearchPlacechainFromFfi(_excludeChainsHandle), 
      heresdkSearchCommonBindingslistofSdkSearchPlacefoodtypeFromFfi(_includeFoodTypesHandle), 
      heresdkSearchCommonBindingslistofSdkSearchPlacefoodtypeFromFfi(_excludeFoodTypesHandle), 
      stringFromFfiNullable(_filterHandle), 
      sdkSearchPlacefilterFromFfi(_placeFilterHandle), 
      sdkSearchCategoryqueryAreaFromFfi(_areaHandle)
    );
  } finally {
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_excludeCategoriesHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacechainReleaseFfiHandle(_includeChainsHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacechainReleaseFfiHandle(_excludeChainsHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacefoodtypeReleaseFfiHandle(_includeFoodTypesHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacefoodtypeReleaseFfiHandle(_excludeFoodTypesHandle);
    stringReleaseFfiHandleNullable(_filterHandle);
    sdkSearchPlacefilterReleaseFfiHandle(_placeFilterHandle);
    sdkSearchCategoryqueryAreaReleaseFfiHandle(_areaHandle);
  }
}

void sdkSearchCategoryqueryReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchCategoryqueryReleaseHandle(handle);

// Nullable CategoryQuery

final _sdkSearchCategoryqueryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_create_handle_nullable'));
final _sdkSearchCategoryqueryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_release_handle_nullable'));
final _sdkSearchCategoryqueryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_CategoryQuery_get_value_nullable'));

Pointer<Void> sdkSearchCategoryqueryToFfiNullable(CategoryQuery? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchCategoryqueryToFfi(value);
  final result = _sdkSearchCategoryqueryCreateHandleNullable(_handle);
  sdkSearchCategoryqueryReleaseFfiHandle(_handle);
  return result;
}

CategoryQuery? sdkSearchCategoryqueryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchCategoryqueryGetValueNullable(handle);
  final result = sdkSearchCategoryqueryFromFfi(_handle);
  sdkSearchCategoryqueryReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchCategoryqueryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchCategoryqueryReleaseHandleNullable(handle);

// End of CategoryQuery "private" section.


