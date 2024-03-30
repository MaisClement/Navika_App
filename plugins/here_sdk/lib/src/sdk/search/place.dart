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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/search/address.dart';
import 'package:here_sdk/src/sdk/search/area_type.dart';
import 'package:here_sdk/src/sdk/search/details.dart';
import 'package:here_sdk/src/sdk/search/place_serialization_error.dart';
import 'package:here_sdk/src/sdk/search/place_serialization_exception_exception.dart';
import 'package:here_sdk/src/sdk/search/place_type.dart';
import 'package:meta/meta.dart';

/// Represents a location object, such as a country, a city, a point of interest (POI) etc.
abstract class Place {

  /// Serializes [Place] to persist or transfer.
  ///
  /// Preserves limited amount of data:
  /// * [Place.title]
  /// * [Place.id]
  /// * [Place.geoCoordinates]
  /// * [Place.accessPoints]
  /// * [Place.placeType]
  /// * [Place.boundingBox]
  /// * [Details.getPrimaryCategories]
  /// * [Address.addressText]
  /// * [Address.countryCode]
  ///
  /// Returns [String]. The serialized place
  ///
  String serializeCompact();
  /// Returns a [Place] created from serialized string.
  ///
  /// [serializedPlace] The serialized place
  ///
  /// Returns [Place]. A [Place] created from serialized string.
  ///
  /// Throws [PlaceSerializationExceptionException]. Indicates what went wrong during deserialization attempt.
  ///
  static Place deserialize(String serializedPlace) => $prototype.deserialize(serializedPlace);
  /// Gets the localized title for the resource.
  String get title;

  /// Gets the unique id of this resource. It can be used to query further information.
  /// When returned from `OfflineSearchEngine`, `id` is valid only for `Place` objects whose
  /// `place_type` is `POI`. Otherwise, it is empty.
  String get id;

  /// Gets the place type.
  PlaceType get placeType;

  /// Gets the area type. It is available only when the [Place.placeType] is [PlaceType.area].
  AreaType? get areaType;

  /// Gets the address of the place.
  Address get address;

  /// Gets the place's detailed information.
  Details get details;

  /// Gets the geographic coordinates of the place.
  /// <br>
  /// Note: Can be `null` when retrieved from a suggestion's place property.
  GeoCoordinates? get geoCoordinates;

  /// Gets the flag saying whether the coordinates of the house number were interpolated or not.
  /// This property is valid only for house number results retrieved using online search.
  /// When false, it means [Place.geoCoordinates] point to an accurate position of the house. Otherwise
  /// coordinates are slightly less accurate, but are based on a highly optimized interpolation algorithm.
  bool get isCoordinatesInterpolated;

  /// Gets the access points to the place, such as the points on a road or in a parking lot.
  /// A place can have multiple access points. For example, a large warehouse can have
  /// multiple entrances, while the center of the warehouse may not be directly reachable.
  /// Note that access points are meant to be reachable by vehicles.
  /// For routes it is recommended to navigate to one of the available access points (if any),
  /// whereas the `sideOfStreetHint` should be set to the geographic coordinates of the place.
  /// The list is empty when no access points are known or when the place is directly reachable.
  List<GeoCoordinates> get accessPoints;

  /// Gets the geographic coordinates of the bounding box containing the place.
  GeoBox? get boundingBox;

  /// Gets the distance from the search center to the place in meters.
  int? get distanceInMeters;

  /// Gets the geopolitical view, defined as a three letter country code, each disputed territory has
  /// international and alternative views. Populated when the geopolitical view parameter is set in
  /// the [SDKOptions] and passed to [SDKNativeEngine] on instantiation,
  /// but only if it is an alternative view.
  /// For more details refer to [SDKOptions].
  String? get politicalView;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Place$Impl(Pointer<Void>.fromAddress(0));
}


// Place "private" section, not exported.

final _sdkSearchPlaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_Place_register_finalizer'));
final _sdkSearchPlaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Place_copy_handle'));
final _sdkSearchPlaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Place_release_handle'));



final _deserializesdkSearchPlaceDeserializeStringReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_Place_deserialize__String_return_release_handle'));
final _deserializesdkSearchPlaceDeserializeStringReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_Place_deserialize__String_return_get_result'));
final _deserializesdkSearchPlaceDeserializeStringReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_Place_deserialize__String_return_get_error'));
final _deserializesdkSearchPlaceDeserializeStringReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_Place_deserialize__String_return_has_error'));


/// @nodoc
@visibleForTesting
class Place$Impl extends __lib.NativeBase implements Place {

  Place$Impl(Pointer<Void> handle) : super(handle);

  @override
  String serializeCompact() {
    final _serializeCompactFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_serializeCompact'));
    final _handle = this.handle;
    final __resultHandle = _serializeCompactFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  Place deserialize(String serializedPlace) {
    final _deserializeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_Place_deserialize__String'));
    final _serializedPlaceHandle = stringToFfi(serializedPlace);
    final __callResultHandle = _deserializeFfi(__lib.LibraryContext.isolateId, _serializedPlaceHandle);
    stringReleaseFfiHandle(_serializedPlaceHandle);
    if (_deserializesdkSearchPlaceDeserializeStringReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _deserializesdkSearchPlaceDeserializeStringReturnGetError(__callResultHandle);
        _deserializesdkSearchPlaceDeserializeStringReturnReleaseHandle(__callResultHandle);
        try {
          throw PlaceSerializationExceptionException(sdkSearchPlaceserializationerrorFromFfi(__errorHandle));
        } finally {
          sdkSearchPlaceserializationerrorReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _deserializesdkSearchPlaceDeserializeStringReturnGetResult(__callResultHandle);
    _deserializesdkSearchPlaceDeserializeStringReturnReleaseHandle(__callResultHandle);
    try {
      return sdkSearchPlaceFromFfi(__resultHandle);
    } finally {
      sdkSearchPlaceReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  String get title {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_title_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get id {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_id_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  PlaceType get placeType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_placeType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkSearchPlacetypeFromFfi(__resultHandle);
    } finally {
      sdkSearchPlacetypeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  AreaType? get areaType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_areaType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkSearchAreatypeFromFfiNullable(__resultHandle);
    } finally {
      sdkSearchAreatypeReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  Address get address {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_address_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkSearchAddressFromFfi(__resultHandle);
    } finally {
      sdkSearchAddressReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Details get details {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_details_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkSearchDetailsFromFfi(__resultHandle);
    } finally {
      sdkSearchDetailsReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  GeoCoordinates? get geoCoordinates {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_geoCoordinates_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeocoordinatesFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  bool get isCoordinatesInterpolated {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_isCoordinatesInterpolated_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<GeoCoordinates> get accessPoints {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_accessPoints_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkSearchCommonBindingslistofSdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      heresdkSearchCommonBindingslistofSdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  GeoBox? get boundingBox {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_boundingBox_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeoboxFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  int? get distanceInMeters {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_distanceInMeters_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return intFromFfiNullable(__resultHandle);
    } finally {
      intReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  String? get politicalView {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_Place_politicalView_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }



}

Pointer<Void> sdkSearchPlaceToFfi(Place value) =>
  _sdkSearchPlaceCopyHandle((value as __lib.NativeBase).handle);

Place sdkSearchPlaceFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Place) return instance;

  final _copiedHandle = _sdkSearchPlaceCopyHandle(handle);
  final result = Place$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkSearchPlaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchPlaceReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchPlaceReleaseHandle(handle);

Pointer<Void> sdkSearchPlaceToFfiNullable(Place? value) =>
  value != null ? sdkSearchPlaceToFfi(value) : Pointer<Void>.fromAddress(0);

Place? sdkSearchPlaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkSearchPlaceFromFfi(handle) : null;

void sdkSearchPlaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchPlaceReleaseHandle(handle);

// End of Place "private" section.


