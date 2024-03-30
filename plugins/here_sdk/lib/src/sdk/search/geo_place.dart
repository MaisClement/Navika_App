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
import 'package:here_sdk/src/sdk/core/external_i_d.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/search/address.dart';
import 'package:here_sdk/src/sdk/search/business_details.dart';
import 'package:here_sdk/src/sdk/search/location_details.dart';
import 'package:here_sdk/src/sdk/search/place_category.dart';
import 'package:here_sdk/src/sdk/search/place_type.dart';
import 'package:here_sdk/src/sdk/search/web_details.dart';
import 'package:meta/meta.dart';




/// GeoPlace struct represents a location object:
/// such as a country, a city, a point of interest (POI) etc.
///
/// It can be used for PersonalPlace creation, in order to provide search on custom places.

class GeoPlace {
  /// The localized title for the resource.
  /// Note: This String can be empty when no data is available.
  String title;

  /// Allows the client to set the id in their own system.
  /// The list of supplier references to this place.
  /// The references are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.
  List<ExternalID> externalIDs;

  /// Specifies place type
  PlaceType type;

  /// List of corresponding categories
  /// Note: This list can be empty when no data is available.
  List<PlaceCategory> categories;

  /// Address of the place
  /// Note: Address can have default value when no data is available.
  Address address;

  /// Geographical details
  /// Note: Can be `null` when retrieved from a suggestion's place property.
  LocationDetails? location;

  /// Business details
  /// Note: BusinessDetails can have default value when no data is available.
  BusinessDetails business;

  /// Contains info and direct web links to corresponding items
  /// Note: WebDetails can have default value when no data is available.
  WebDetails web;

  /// Represents GeoPlace id
  /// Note: This String can be empty when no data is available.
  /// @nodoc
  String _id;

  /// Represents info about is it my place or not
  /// @nodoc
  bool _myPlace;

  /// Creates a new instance.

  /// [title] The localized title for the resource.
  /// Note: This String can be empty when no data is available.

  /// [externalIDs] Allows the client to set the id in their own system.
  /// The list of supplier references to this place.
  /// The references are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.

  /// [type] Specifies place type

  /// [categories] List of corresponding categories
  /// Note: This list can be empty when no data is available.

  /// [address] Address of the place
  /// Note: Address can have default value when no data is available.

  /// [location] Geographical details
  /// Note: Can be `null` when retrieved from a suggestion's place property.

  /// [business] Business details
  /// Note: BusinessDetails can have default value when no data is available.

  /// [web] Contains info and direct web links to corresponding items
  /// Note: WebDetails can have default value when no data is available.

  /// [id] Represents GeoPlace id
  /// Note: This String can be empty when no data is available.

  /// [myPlace] Represents info about is it my place or not

  GeoPlace._(this.title, this.externalIDs, this.type, this.categories, this.address, this.location, this.business, this.web, this._id, this._myPlace);
  GeoPlace()
    : title = "", externalIDs = [], type = PlaceType.unknown, categories = [], address = Address(), location = null, business = BusinessDetails(), web = WebDetails(), _id = "", _myPlace = false;
  /// Creates a new instance of this class.
  ///
  /// All other properties will keep their default value
  /// and all properties containing lists will contain empty lists.
  ///
  /// [title] The title.
  ///
  /// [coordinates] The coordinates.
  ///
  /// Returns [GeoPlace]. An instance of [GeoPlace].
  ///
  static GeoPlace makeMyPlace(String title, GeoCoordinates coordinates) => $prototype.makeMyPlace(title, coordinates);
  /// Allow the client to access GeoPlace id
  ///
  /// Returns [String]. The place id.
  ///
  String getID() => $prototype.getID(this);
  /// Allow the client to access info about is it my place or not
  ///
  /// Returns [bool]. True if it is my place false otherwise.
  ///
  bool isMyPlace() => $prototype.isMyPlace(this);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GeoPlace) return false;
    GeoPlace _other = other;
    return title == _other.title &&
        DeepCollectionEquality().equals(externalIDs, _other.externalIDs) &&
        type == _other.type &&
        DeepCollectionEquality().equals(categories, _other.categories) &&
        address == _other.address &&
        location == _other.location &&
        business == _other.business &&
        web == _other.web &&
        _id == _other._id &&
        _myPlace == _other._myPlace;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + title.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(externalIDs);
    result = 31 * result + type.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(categories);
    result = 31 * result + address.hashCode;
    result = 31 * result + location.hashCode;
    result = 31 * result + business.hashCode;
    result = 31 * result + web.hashCode;
    result = 31 * result + _id.hashCode;
    result = 31 * result + _myPlace.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = GeoPlace$Impl();
}


// GeoPlace "private" section, not exported.

final _sdkSearchGeoplaceCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Uint32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint8),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_search_GeoPlace_create_handle'));
final _sdkSearchGeoplaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_GeoPlace_release_handle'));
final _sdkSearchGeoplaceGetFieldtitle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_GeoPlace_get_field_title'));
final _sdkSearchGeoplaceGetFieldexternalIDs = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_GeoPlace_get_field_externalIDs'));
final _sdkSearchGeoplaceGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_GeoPlace_get_field_type'));
final _sdkSearchGeoplaceGetFieldcategories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_GeoPlace_get_field_categories'));
final _sdkSearchGeoplaceGetFieldaddress = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_GeoPlace_get_field_address'));
final _sdkSearchGeoplaceGetFieldlocation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_GeoPlace_get_field_location'));
final _sdkSearchGeoplaceGetFieldbusiness = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_GeoPlace_get_field_business'));
final _sdkSearchGeoplaceGetFieldweb = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_GeoPlace_get_field_web'));
final _sdkSearchGeoplaceGetFieldid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_GeoPlace_get_field_id'));
final _sdkSearchGeoplaceGetFieldmyPlace = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_GeoPlace_get_field_myPlace'));



/// @nodoc
@visibleForTesting
class GeoPlace$Impl {
  GeoPlace makeMyPlace(String title, GeoCoordinates coordinates) {
    final _makeMyPlaceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_GeoPlace_makeMyPlace__String_GeoCoordinates'));
    final _titleHandle = stringToFfi(title);
    final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(coordinates);
    final __resultHandle = _makeMyPlaceFfi(__lib.LibraryContext.isolateId, _titleHandle, _coordinatesHandle);
    stringReleaseFfiHandle(_titleHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    try {
      return sdkSearchGeoplaceFromFfi(__resultHandle);
    } finally {
      sdkSearchGeoplaceReleaseFfiHandle(__resultHandle);

    }

  }

  String getID(GeoPlace $that) {
    final _getIDFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_GeoPlace_getID'));
    final _handle = sdkSearchGeoplaceToFfi($that);
    final __resultHandle = _getIDFfi(_handle, __lib.LibraryContext.isolateId);
    sdkSearchGeoplaceReleaseFfiHandle(_handle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  bool isMyPlace(GeoPlace $that) {
    final _isMyPlaceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_search_GeoPlace_isMyPlace'));
    final _handle = sdkSearchGeoplaceToFfi($that);
    final __resultHandle = _isMyPlaceFfi(_handle, __lib.LibraryContext.isolateId);
    sdkSearchGeoplaceReleaseFfiHandle(_handle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkSearchGeoplaceToFfi(GeoPlace value) {
  final _titleHandle = stringToFfi(value.title);
  final _externalIDsHandle = heresdkSearchCommonBindingslistofSdkCoreExternalidToFfi(value.externalIDs);
  final _typeHandle = sdkSearchPlacetypeToFfi(value.type);
  final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(value.categories);
  final _addressHandle = sdkSearchAddressToFfi(value.address);
  final _locationHandle = sdkSearchLocationdetailsToFfiNullable(value.location);
  final _businessHandle = sdkSearchBusinessdetailsToFfi(value.business);
  final _webHandle = sdkSearchWebdetailsToFfi(value.web);
  final _idHandle = stringToFfi(value._id);
  final _myPlaceHandle = booleanToFfi(value._myPlace);
  final _result = _sdkSearchGeoplaceCreateHandle(_titleHandle, _externalIDsHandle, _typeHandle, _categoriesHandle, _addressHandle, _locationHandle, _businessHandle, _webHandle, _idHandle, _myPlaceHandle);
  stringReleaseFfiHandle(_titleHandle);
  heresdkSearchCommonBindingslistofSdkCoreExternalidReleaseFfiHandle(_externalIDsHandle);
  sdkSearchPlacetypeReleaseFfiHandle(_typeHandle);
  heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  sdkSearchAddressReleaseFfiHandle(_addressHandle);
  sdkSearchLocationdetailsReleaseFfiHandleNullable(_locationHandle);
  sdkSearchBusinessdetailsReleaseFfiHandle(_businessHandle);
  sdkSearchWebdetailsReleaseFfiHandle(_webHandle);
  stringReleaseFfiHandle(_idHandle);
  booleanReleaseFfiHandle(_myPlaceHandle);
  return _result;
}

GeoPlace sdkSearchGeoplaceFromFfi(Pointer<Void> handle) {
  final _titleHandle = _sdkSearchGeoplaceGetFieldtitle(handle);
  final _externalIDsHandle = _sdkSearchGeoplaceGetFieldexternalIDs(handle);
  final _typeHandle = _sdkSearchGeoplaceGetFieldtype(handle);
  final _categoriesHandle = _sdkSearchGeoplaceGetFieldcategories(handle);
  final _addressHandle = _sdkSearchGeoplaceGetFieldaddress(handle);
  final _locationHandle = _sdkSearchGeoplaceGetFieldlocation(handle);
  final _businessHandle = _sdkSearchGeoplaceGetFieldbusiness(handle);
  final _webHandle = _sdkSearchGeoplaceGetFieldweb(handle);
  final _idHandle = _sdkSearchGeoplaceGetFieldid(handle);
  final _myPlaceHandle = _sdkSearchGeoplaceGetFieldmyPlace(handle);
  try {
    return GeoPlace._(
      stringFromFfi(_titleHandle), 
      heresdkSearchCommonBindingslistofSdkCoreExternalidFromFfi(_externalIDsHandle), 
      sdkSearchPlacetypeFromFfi(_typeHandle), 
      heresdkSearchCommonBindingslistofSdkSearchPlacecategoryFromFfi(_categoriesHandle), 
      sdkSearchAddressFromFfi(_addressHandle), 
      sdkSearchLocationdetailsFromFfiNullable(_locationHandle), 
      sdkSearchBusinessdetailsFromFfi(_businessHandle), 
      sdkSearchWebdetailsFromFfi(_webHandle), 
      stringFromFfi(_idHandle), 
      booleanFromFfi(_myPlaceHandle)
    );
  } finally {
    stringReleaseFfiHandle(_titleHandle);
    heresdkSearchCommonBindingslistofSdkCoreExternalidReleaseFfiHandle(_externalIDsHandle);
    sdkSearchPlacetypeReleaseFfiHandle(_typeHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
    sdkSearchAddressReleaseFfiHandle(_addressHandle);
    sdkSearchLocationdetailsReleaseFfiHandleNullable(_locationHandle);
    sdkSearchBusinessdetailsReleaseFfiHandle(_businessHandle);
    sdkSearchWebdetailsReleaseFfiHandle(_webHandle);
    stringReleaseFfiHandle(_idHandle);
    booleanReleaseFfiHandle(_myPlaceHandle);
  }
}

void sdkSearchGeoplaceReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchGeoplaceReleaseHandle(handle);

// Nullable GeoPlace

final _sdkSearchGeoplaceCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_GeoPlace_create_handle_nullable'));
final _sdkSearchGeoplaceReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_GeoPlace_release_handle_nullable'));
final _sdkSearchGeoplaceGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_GeoPlace_get_value_nullable'));

Pointer<Void> sdkSearchGeoplaceToFfiNullable(GeoPlace? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchGeoplaceToFfi(value);
  final result = _sdkSearchGeoplaceCreateHandleNullable(_handle);
  sdkSearchGeoplaceReleaseFfiHandle(_handle);
  return result;
}

GeoPlace? sdkSearchGeoplaceFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchGeoplaceGetValueNullable(handle);
  final result = sdkSearchGeoplaceFromFfi(_handle);
  sdkSearchGeoplaceReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchGeoplaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchGeoplaceReleaseHandleNullable(handle);

// End of GeoPlace "private" section.


