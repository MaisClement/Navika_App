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
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/geo_circle.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/language_code.dart';
import 'package:here_sdk/src/sdk/core/picked_place.dart';
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/search/address_query.dart';
import 'package:here_sdk/src/sdk/search/category_query.dart';
import 'package:here_sdk/src/sdk/search/place_id_query.dart';
import 'package:here_sdk/src/sdk/search/place_id_search_callback.dart';
import 'package:here_sdk/src/sdk/search/place_id_search_callback_extended.dart';
import 'package:here_sdk/src/sdk/search/search_callback.dart';
import 'package:here_sdk/src/sdk/search/search_callback_extended.dart';
import 'package:here_sdk/src/sdk/search/search_error.dart';
import 'package:here_sdk/src/sdk/search/search_options.dart';
import 'package:here_sdk/src/sdk/search/suggest_callback.dart';
import 'package:here_sdk/src/sdk/search/suggest_callback_extended.dart';
import 'package:here_sdk/src/sdk/search/text_query.dart';
import 'package:meta/meta.dart';

/// The SearchEngine API unlocks the search, geocoding and suggesting capabilities of HERE services
/// to provide developers with unmatched flexibility to create differentiating location-enabled
/// applications.
///
/// It enables to search for HERE points of interests, forward and reverse
/// geocode addresses and geographic coordinates from the HERE map and search for suggested addresses
/// or place candidates based on incomplete or misspelled queries.
///
/// It also allows to search along a given [GeoPolyline] set inside a [GeoCorridor]
/// as part of a [TextQuery].
///
/// The SearchEngine API requires an online connection to execute the requests.
///
/// **Note:** All methods are provided in two flavors. One uses a [SearchCallback] and the
/// other uses a [SearchCallbackExtended]: The later adds a `ResponseDetails` result type
/// that provides the `requestId` of a search request and a `correlationId` to identify multiple,
/// related queries. This may be useful for debug purposes.
abstract class SearchEngine {
  /// Creates a new instance of this class.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory SearchEngine() => $prototype.$init();
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] Instance of an existing SDKEngine.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory SearchEngine.withSdkEngine(SDKNativeEngine sdkEngine) => $prototype.withSdkEngine(sdkEngine);

  /// Performs an asynchronous request to do a text query search for [Place] instances.
  ///
  /// Optionally, search along a polyline, such as a route, by specifying a [GeoCorridor].
  /// Provides candidate places sorted by relevance.
  ///
  /// [query] Desired free-form text query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByText(TextQuery query, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to do a text query search for [Place] instances.
  ///
  /// Optionally, search along a polyline, such as a route, by specifying a [GeoCorridor].
  /// Provides candidate places sorted by relevance.
  ///
  /// [query] Desired free-form text query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByTextExtended(TextQuery query, SearchOptions options, SearchCallbackExtended callback);
  /// Performs an asynchronous request to search for places based on a given address.
  ///
  /// This is the same process as forward geocoding, except that more data is returned
  /// than just the geographic coordinates of a given address. Note that an address can
  /// belong to more than one [Place] result, although all found places will
  /// share the same geographic coordinates.
  /// Provides candidate places sorted by relevance.
  ///
  /// [query] Desired free-form address query text to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByAddress(AddressQuery query, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to search for places based on a given address.
  ///
  /// This is the same process as forward geocoding, except that more data is returned
  /// than just the geographic coordinates of a given address. Note that an address can
  /// belong to more than one [Place] result, although all found places will
  /// share the same geographic coordinates.
  /// Provides candidate places sorted by relevance.
  ///
  /// [query] Desired free-form address query text to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByAddressExtended(AddressQuery query, SearchOptions options, SearchCallbackExtended callback);
  /// Performs an asynchronous request to search for a [Place] based on the content
  /// found in `PickedPlace`.
  ///
  /// If `PickedPlace` data is obtained from the offline map, it may happen that the newer version
  /// that is used by the online service represented by `SearchEngine` no longer contains the
  /// related POI. In that case, [SearchError.noResultsFound] error is reported.
  /// When that happens, you may try to obtain the POI from the offline map by calling
  /// `OfflineSearchEngine.searchPickedPlace`. Note that not all editions include the
  /// `OfflineSearchEngine`.
  ///
  /// [pickedPlace] The content picked from map.
  ///
  /// [languageCode] The preferred language for the search result. When unset or unsupported language is chosen,
  /// result will be returned in the local language.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchPickedPlace(PickedPlace pickedPlace, LanguageCode? languageCode, PlaceIdSearchCallback callback);
  /// Performs an asynchronous request to search for a [Place] based on its ID and
  /// [LanguageCode].
  ///
  /// [query] The id of place to search.
  ///
  /// [languageCode] The preferred language for the search results. When unset or unsupported language is chosen,
  /// results will be returned in their local language.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByPlaceIdWithLanguageCode(PlaceIdQuery query, LanguageCode? languageCode, PlaceIdSearchCallback callback);
  /// Performs an asynchronous request to search for a [Place] based on its ID and
  /// [LanguageCode].
  ///
  /// [query] The id of place to search.
  ///
  /// [languageCode] The preferred language for the search results. When unset or unsupported language is
  /// chosen, results will be returned in their local language.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByPlaceIdWithLanguageCodeExtended(PlaceIdQuery query, LanguageCode? languageCode, PlaceIdSearchCallbackExtended callback);
  /// Performs an asynchronous request to search for places based on given geographic coordinates.
  ///
  /// This is the same process as reverse geocoding, except that more data is returned
  /// than just the [Address] that belongs to given coordinates. Note that coordinates
  /// can belong to more than one [Place] result.
  /// Provides candidate places sorted by relevance.
  ///
  /// [coordinates] The coordinates where to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate execution of the task.
  ///
  TaskHandle searchByCoordinates(GeoCoordinates coordinates, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to search for places based on given geographic coordinates.
  ///
  /// This is the same process as reverse geocoding, except that more data is returned
  /// than just the [Address] that belongs to given coordinates. Note that coordinates
  /// can belong to more than one [Place] result.
  /// Provides candidate places sorted by relevance.
  ///
  /// [coordinates] The coordinates where to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate execution of the task.
  ///
  TaskHandle searchByCoordinatesExtended(GeoCoordinates coordinates, SearchOptions options, SearchCallbackExtended callback);
  /// Performs an asynchronous request to search for places based on given circular spatial filter.
  ///
  /// This is the same process as reverse geocoding, except that more data is returned
  /// than just the [Address] that belongs to given coordinates. Note that coordinates
  /// can belong to more than one [Place] result.
  /// Provides candidate places sorted by relevance and located inside the radius of filter.
  ///
  /// [circle] The coordinates where to search and radius of the circular spatial filter.
  /// Passed in form of [GeoCircle].
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate execution of the task.
  ///
  TaskHandle searchByCoordinatesWithRadius(GeoCircle circle, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to search for places based on given circular spatial filter.
  ///
  /// This is the same process as reverse geocoding, except that more data is returned
  /// than just the [Address] that belongs to given coordinates. Note that coordinates
  /// can belong to more than one [Place] result.
  /// Provides candidate places sorted by relevance and located inside the radius of filter.
  ///
  /// [circle] The coordinates where to search and radius of the circular spatial filter.
  /// Passed in form of [GeoCircle].
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate execution of the task.
  ///
  TaskHandle searchByCoordinatesWithRadiusExtended(GeoCircle circle, SearchOptions options, SearchCallbackExtended callback);
  /// Performs an asynchronous request by using the given href.
  ///
  /// The href value can be obtained from [Suggestion] objects,
  /// which are the result of successful call to [SearchEngine.suggestExtended].
  /// Currently supports only /v1/discover path.
  /// Provides candidate places sorted by relevance.
  ///
  /// [href] The direct link.
  ///
  /// [callback] Callback which receives result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate execution of the task.
  ///
  TaskHandle sendRequest(String href, SearchCallback callback);
  /// Performs an asynchronous request by using the given href.
  ///
  /// The href value can be obtained from [Suggestion] objects,
  /// which are the result of successful call to [SearchEngine.suggestExtended].
  /// Currently supports only /v1/discover path.
  /// Provides candidate places sorted by relevance.
  ///
  /// [href] The direct link.
  ///
  /// [callback] Callback which receives result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate execution of the task.
  ///
  TaskHandle sendRequestExtended(String href, SearchCallbackExtended callback);
  /// Performs an asynchronous request to do a category search for [Place] instances.
  ///
  /// A list containing at least one [PlaceCategory] must be provided
  /// as part of the [SearchEngine.searchByCategory.query].
  ///
  /// [query] Query with list of desired categories.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByCategory(CategoryQuery query, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to do a category search for [Place] instances.
  ///
  /// A list containing at least one [PlaceCategory] must be provided
  /// as part of the [SearchEngine.searchByCategoryExtended.query].
  ///
  /// [query] Query with list of desired categories.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByCategoryExtended(CategoryQuery query, SearchOptions options, SearchCallbackExtended callback);
  /// Performs an asynchronous request to suggest places for text queries and
  /// returns candidate suggestions sorted by relevance.
  ///
  /// [query] Desired text query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle suggest(TextQuery query, SearchOptions options, SuggestCallback callback);
  /// Performs an asynchronous request to suggest places for text queries and
  /// returns candidate suggestions sorted by relevance.
  ///
  /// [query] Desired text query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle suggestExtended(TextQuery query, SearchOptions options, SuggestCallbackExtended callback);
  /// Sets a custom option for search backend queries.
  ///
  /// This allows more control over the behavior
  /// of the search algorithm.
  /// Name has the format <endpoint_name>.<option_name>, for example "discover.show".
  /// Values can be combined for the same name by using a comma, for example "truck,fuel".
  /// The custom option is applied only for the endpoint that is specified as prefix in `name`.
  /// Some of the supported name/value options are:
  /// - name = "revgeocode.with", value = "unnamedStreets" enables the retrieval of access points
  ///   on unnamed streets.
  /// - name = "lookup.show" or "discover.show" or "autosuggest.show" or "browse.show", value = "truck"
  ///   enables retreival of truck amenities.
  ///   **Note:** Only participants of the closed-alpha group can get access from HERE to use this feature,
  ///   otherwise, a [SearchError.forbidden] will be propagated in callbacks.
  /// - name = "lookup.show" or "discover.show" or "autosuggest.show" or "browse.show", value = "fuel"
  ///   enables retreival of fuel station details.
  ///   **Note:** Only participants of the closed-alpha group can get access from HERE to use this feature,
  ///   otherwise, a [SearchError.forbidden] will be propagated in callbacks.
  /// - name = "lookup.show" or "discover.show" or "browse.show", value = "ev"
  ///   enables retreival of EV charging station details.
  ///   **Note:** Only participants of the closed-alpha group can get access from HERE to use this feature,
  ///   otherwise, a [SearchError.forbidden] will be propagated in callbacks.
  /// - name = "lookup.datasets" or "discover.datasets" or "browse.datasets" or "autosuggest.datasets",
  ///   value = <your_dataset_hrn> enables ingesting and searching of private POIs.
  ///   **Note:** Only participants of the search customization can get access from HERE to use this feature,
  ///   otherwise, a [SearchError.invalidParameter] will be propagated in callbacks.
  ///   For a complete list of available endpoints, parameter names and their valid values, refer to
  ///   [HERE Geocoding & Search API v7](https://developer.here.com/documentation/geocoding-search-api/api-reference-swagger.html).
  ///   **Note:** It's easy to set a wrong option that makes queries invalid,
  ///   so make sure you read and understand the backend documentation.
  ///
  /// [name] Option name in the format <endpoint_name>.<option_name>, for example "discover.show".
  ///
  /// [value] Option value.
  ///
  /// Returns [SearchError?]. Error in case when setting the option fails.
  ///
  SearchError? setCustomOption(String name, String value);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SearchEngine$Impl(Pointer<Void>.fromAddress(0));
}


// SearchEngine "private" section, not exported.

final _sdkSearchSearchengineRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_SearchEngine_register_finalizer'));
final _sdkSearchSearchengineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_copy_handle'));
final _sdkSearchSearchengineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_release_handle'));


final _$initsdkSearchSearchengineMakeReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make_return_release_handle'));
final _$initsdkSearchSearchengineMakeReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make_return_get_result'));
final _$initsdkSearchSearchengineMakeReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make_return_get_error'));
final _$initsdkSearchSearchengineMakeReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make_return_has_error'));


final _withSdkEnginesdkSearchSearchengineMakeSdknativeengineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make__SDKNativeEngine_return_release_handle'));
final _withSdkEnginesdkSearchSearchengineMakeSdknativeengineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make__SDKNativeEngine_return_get_result'));
final _withSdkEnginesdkSearchSearchengineMakeSdknativeengineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make__SDKNativeEngine_return_get_error'));
final _withSdkEnginesdkSearchSearchengineMakeSdknativeengineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchEngine_make__SDKNativeEngine_return_has_error'));




















/// @nodoc
@visibleForTesting
class SearchEngine$Impl extends __lib.NativeBase implements SearchEngine {

  SearchEngine$Impl(Pointer<Void> handle) : super(handle);


  SearchEngine $init() {
    final _result_handle = _$init();
    final _result = SearchEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkSearchSearchengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  SearchEngine withSdkEngine(SDKNativeEngine sdkEngine) {
    final _result_handle = _withSdkEngine(sdkEngine);
    final _result = SearchEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkSearchSearchengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_search_SearchEngine_make'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    if (_$initsdkSearchSearchengineMakeReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsdkSearchSearchengineMakeReturnGetError(__callResultHandle);
        _$initsdkSearchSearchengineMakeReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsdkSearchSearchengineMakeReturnGetResult(__callResultHandle);
    _$initsdkSearchSearchengineMakeReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine) {
    final _withSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _withSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    if (_withSdkEnginesdkSearchSearchengineMakeSdknativeengineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withSdkEnginesdkSearchSearchengineMakeSdknativeengineReturnGetError(__callResultHandle);
        _withSdkEnginesdkSearchSearchengineMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withSdkEnginesdkSearchSearchengineMakeSdknativeengineReturnGetResult(__callResultHandle);
    _withSdkEnginesdkSearchSearchengineMakeSdknativeengineReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  TaskHandle searchByText(TextQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByTextFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__TextQuery_SearchOptions_SearchCallback'));
    final _queryHandle = sdkSearchTextqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByTextFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchTextqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByTextExtended(TextQuery query, SearchOptions options, SearchCallbackExtended callback) {
    final _searchByTextExtendedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__TextQuery_SearchOptions_SearchCallbackExtended'));
    final _queryHandle = sdkSearchTextqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackextendedToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByTextExtendedFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchTextqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackextendedReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByAddress(AddressQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByAddressFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__AddressQuery_SearchOptions_SearchCallback'));
    final _queryHandle = sdkSearchAddressqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByAddressFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchAddressqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByAddressExtended(AddressQuery query, SearchOptions options, SearchCallbackExtended callback) {
    final _searchByAddressExtendedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__AddressQuery_SearchOptions_SearchCallbackExtended'));
    final _queryHandle = sdkSearchAddressqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackextendedToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByAddressExtendedFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchAddressqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackextendedReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchPickedPlace(PickedPlace pickedPlace, LanguageCode? languageCode, PlaceIdSearchCallback callback) {
    final _searchPickedPlaceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_searchPickedPlace__PickedPlace_LanguageCode__PlaceIdSearchCallback'));
    final _pickedPlaceHandle = sdkCorePickedplaceToFfi(pickedPlace);
    final _languageCodeHandle = sdkCoreLanguagecodeToFfiNullable(languageCode);
    final _callbackHandle = sdkSearchPlaceidsearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchPickedPlaceFfi(_handle, __lib.LibraryContext.isolateId, _pickedPlaceHandle, _languageCodeHandle, _callbackHandle);
    sdkCorePickedplaceReleaseFfiHandle(_pickedPlaceHandle);
    sdkCoreLanguagecodeReleaseFfiHandleNullable(_languageCodeHandle);
    sdkSearchPlaceidsearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByPlaceIdWithLanguageCode(PlaceIdQuery query, LanguageCode? languageCode, PlaceIdSearchCallback callback) {
    final _searchByPlaceIdWithLanguageCodeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__PlaceIdQuery_LanguageCode__PlaceIdSearchCallback'));
    final _queryHandle = sdkSearchPlaceidqueryToFfi(query);
    final _languageCodeHandle = sdkCoreLanguagecodeToFfiNullable(languageCode);
    final _callbackHandle = sdkSearchPlaceidsearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByPlaceIdWithLanguageCodeFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _languageCodeHandle, _callbackHandle);
    sdkSearchPlaceidqueryReleaseFfiHandle(_queryHandle);
    sdkCoreLanguagecodeReleaseFfiHandleNullable(_languageCodeHandle);
    sdkSearchPlaceidsearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByPlaceIdWithLanguageCodeExtended(PlaceIdQuery query, LanguageCode? languageCode, PlaceIdSearchCallbackExtended callback) {
    final _searchByPlaceIdWithLanguageCodeExtendedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__PlaceIdQuery_LanguageCode__PlaceIdSearchCallbackExtended'));
    final _queryHandle = sdkSearchPlaceidqueryToFfi(query);
    final _languageCodeHandle = sdkCoreLanguagecodeToFfiNullable(languageCode);
    final _callbackHandle = sdkSearchPlaceidsearchcallbackextendedToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByPlaceIdWithLanguageCodeExtendedFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _languageCodeHandle, _callbackHandle);
    sdkSearchPlaceidqueryReleaseFfiHandle(_queryHandle);
    sdkCoreLanguagecodeReleaseFfiHandleNullable(_languageCodeHandle);
    sdkSearchPlaceidsearchcallbackextendedReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByCoordinates(GeoCoordinates coordinates, SearchOptions options, SearchCallback callback) {
    final _searchByCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__GeoCoordinates_SearchOptions_SearchCallback'));
    final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(coordinates);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _coordinatesHandle, _optionsHandle, _callbackHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByCoordinatesExtended(GeoCoordinates coordinates, SearchOptions options, SearchCallbackExtended callback) {
    final _searchByCoordinatesExtendedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__GeoCoordinates_SearchOptions_SearchCallbackExtended'));
    final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(coordinates);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackextendedToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByCoordinatesExtendedFfi(_handle, __lib.LibraryContext.isolateId, _coordinatesHandle, _optionsHandle, _callbackHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackextendedReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByCoordinatesWithRadius(GeoCircle circle, SearchOptions options, SearchCallback callback) {
    final _searchByCoordinatesWithRadiusFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__GeoCircle_SearchOptions_SearchCallback'));
    final _circleHandle = sdkCoreGeocircleToFfi(circle);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByCoordinatesWithRadiusFfi(_handle, __lib.LibraryContext.isolateId, _circleHandle, _optionsHandle, _callbackHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByCoordinatesWithRadiusExtended(GeoCircle circle, SearchOptions options, SearchCallbackExtended callback) {
    final _searchByCoordinatesWithRadiusExtendedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__GeoCircle_SearchOptions_SearchCallbackExtended'));
    final _circleHandle = sdkCoreGeocircleToFfi(circle);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackextendedToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByCoordinatesWithRadiusExtendedFfi(_handle, __lib.LibraryContext.isolateId, _circleHandle, _optionsHandle, _callbackHandle);
    sdkCoreGeocircleReleaseFfiHandle(_circleHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackextendedReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle sendRequest(String href, SearchCallback callback) {
    final _sendRequestFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_sendRequest__String_SearchCallback'));
    final _hrefHandle = stringToFfi(href);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _sendRequestFfi(_handle, __lib.LibraryContext.isolateId, _hrefHandle, _callbackHandle);
    stringReleaseFfiHandle(_hrefHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle sendRequestExtended(String href, SearchCallbackExtended callback) {
    final _sendRequestExtendedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_sendRequest__String_SearchCallbackExtended'));
    final _hrefHandle = stringToFfi(href);
    final _callbackHandle = sdkSearchSearchcallbackextendedToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _sendRequestExtendedFfi(_handle, __lib.LibraryContext.isolateId, _hrefHandle, _callbackHandle);
    stringReleaseFfiHandle(_hrefHandle);
    sdkSearchSearchcallbackextendedReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByCategory(CategoryQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByCategoryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__CategoryQuery_SearchOptions_SearchCallback'));
    final _queryHandle = sdkSearchCategoryqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByCategoryFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchCategoryqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByCategoryExtended(CategoryQuery query, SearchOptions options, SearchCallbackExtended callback) {
    final _searchByCategoryExtendedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_search__CategoryQuery_SearchOptions_SearchCallbackExtended'));
    final _queryHandle = sdkSearchCategoryqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackextendedToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByCategoryExtendedFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchCategoryqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackextendedReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle suggest(TextQuery query, SearchOptions options, SuggestCallback callback) {
    final _suggestFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_suggest__TextQuery_SearchOptions_SuggestCallback'));
    final _queryHandle = sdkSearchTextqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSuggestcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _suggestFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchTextqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSuggestcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle suggestExtended(TextQuery query, SearchOptions options, SuggestCallbackExtended callback) {
    final _suggestExtendedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_suggest__TextQuery_SearchOptions_SuggestCallbackExtended'));
    final _queryHandle = sdkSearchTextqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSuggestcallbackextendedToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _suggestExtendedFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchTextqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSuggestcallbackextendedReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  SearchError? setCustomOption(String name, String value) {
    final _setCustomOptionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_SearchEngine_setCustomOption__String_String'));
    final _nameHandle = stringToFfi(name);
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    final __resultHandle = _setCustomOptionFfi(_handle, __lib.LibraryContext.isolateId, _nameHandle, _valueHandle);
    stringReleaseFfiHandle(_nameHandle);
    stringReleaseFfiHandle(_valueHandle);
    try {
      return sdkSearchSearcherrorFromFfiNullable(__resultHandle);
    } finally {
      sdkSearchSearcherrorReleaseFfiHandleNullable(__resultHandle);

    }

  }


}

Pointer<Void> sdkSearchSearchengineToFfi(SearchEngine value) =>
  _sdkSearchSearchengineCopyHandle((value as __lib.NativeBase).handle);

SearchEngine sdkSearchSearchengineFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SearchEngine) return instance;

  final _copiedHandle = _sdkSearchSearchengineCopyHandle(handle);
  final result = SearchEngine$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkSearchSearchengineRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchSearchengineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchSearchengineReleaseHandle(handle);

Pointer<Void> sdkSearchSearchengineToFfiNullable(SearchEngine? value) =>
  value != null ? sdkSearchSearchengineToFfi(value) : Pointer<Void>.fromAddress(0);

SearchEngine? sdkSearchSearchengineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkSearchSearchengineFromFfi(handle) : null;

void sdkSearchSearchengineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchSearchengineReleaseHandle(handle);

// End of SearchEngine "private" section.


