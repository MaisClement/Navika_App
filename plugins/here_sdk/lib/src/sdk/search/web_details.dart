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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/search/web_editorial.dart';
import 'package:here_sdk/src/sdk/search/web_image.dart';
import 'package:here_sdk/src/sdk/search/web_rating.dart';

/// Contains information about images, editorials, rating and a urls to them.

class WebDetails {
  /// The list of images associated with the place.
  /// The images are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.
  List<WebImage> images;

  /// The list of editorials associated with the place.
  /// The editorials are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.
  List<WebEditorial> editorials;

  /// The list of ratings associated with the place.
  /// The ratings are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.
  List<WebRating> ratings;

  /// Creates a new instance.

  /// [images] The list of images associated with the place.
  /// The images are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.

  /// [editorials] The list of editorials associated with the place.
  /// The editorials are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.

  /// [ratings] The list of ratings associated with the place.
  /// The ratings are provided by external suppliers and are only available to users with
  /// valid contracts with said suppliers. If the user has no such contracts, the list is empty.

  WebDetails._(this.images, this.editorials, this.ratings);
  /// Creates a new instance.
  WebDetails()
      : images = [], editorials = [], ratings = [];
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WebDetails) return false;
    WebDetails _other = other;
    return DeepCollectionEquality().equals(images, _other.images) &&
        DeepCollectionEquality().equals(editorials, _other.editorials) &&
        DeepCollectionEquality().equals(ratings, _other.ratings);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(images);
    result = 31 * result + DeepCollectionEquality().hash(editorials);
    result = 31 * result + DeepCollectionEquality().hash(ratings);
    return result;
  }
}


// WebDetails "private" section, not exported.

final _sdkSearchWebdetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_WebDetails_create_handle'));
final _sdkSearchWebdetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebDetails_release_handle'));
final _sdkSearchWebdetailsGetFieldimages = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebDetails_get_field_images'));
final _sdkSearchWebdetailsGetFieldeditorials = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebDetails_get_field_editorials'));
final _sdkSearchWebdetailsGetFieldratings = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebDetails_get_field_ratings'));



Pointer<Void> sdkSearchWebdetailsToFfi(WebDetails value) {
  final _imagesHandle = heresdkSearchCommonBindingslistofSdkSearchWebimageToFfi(value.images);
  final _editorialsHandle = heresdkSearchCommonBindingslistofSdkSearchWebeditorialToFfi(value.editorials);
  final _ratingsHandle = heresdkSearchCommonBindingslistofSdkSearchWebratingToFfi(value.ratings);
  final _result = _sdkSearchWebdetailsCreateHandle(_imagesHandle, _editorialsHandle, _ratingsHandle);
  heresdkSearchCommonBindingslistofSdkSearchWebimageReleaseFfiHandle(_imagesHandle);
  heresdkSearchCommonBindingslistofSdkSearchWebeditorialReleaseFfiHandle(_editorialsHandle);
  heresdkSearchCommonBindingslistofSdkSearchWebratingReleaseFfiHandle(_ratingsHandle);
  return _result;
}

WebDetails sdkSearchWebdetailsFromFfi(Pointer<Void> handle) {
  final _imagesHandle = _sdkSearchWebdetailsGetFieldimages(handle);
  final _editorialsHandle = _sdkSearchWebdetailsGetFieldeditorials(handle);
  final _ratingsHandle = _sdkSearchWebdetailsGetFieldratings(handle);
  try {
    return WebDetails._(
      heresdkSearchCommonBindingslistofSdkSearchWebimageFromFfi(_imagesHandle), 
      heresdkSearchCommonBindingslistofSdkSearchWebeditorialFromFfi(_editorialsHandle), 
      heresdkSearchCommonBindingslistofSdkSearchWebratingFromFfi(_ratingsHandle)
    );
  } finally {
    heresdkSearchCommonBindingslistofSdkSearchWebimageReleaseFfiHandle(_imagesHandle);
    heresdkSearchCommonBindingslistofSdkSearchWebeditorialReleaseFfiHandle(_editorialsHandle);
    heresdkSearchCommonBindingslistofSdkSearchWebratingReleaseFfiHandle(_ratingsHandle);
  }
}

void sdkSearchWebdetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchWebdetailsReleaseHandle(handle);

// Nullable WebDetails

final _sdkSearchWebdetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebDetails_create_handle_nullable'));
final _sdkSearchWebdetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebDetails_release_handle_nullable'));
final _sdkSearchWebdetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebDetails_get_value_nullable'));

Pointer<Void> sdkSearchWebdetailsToFfiNullable(WebDetails? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchWebdetailsToFfi(value);
  final result = _sdkSearchWebdetailsCreateHandleNullable(_handle);
  sdkSearchWebdetailsReleaseFfiHandle(_handle);
  return result;
}

WebDetails? sdkSearchWebdetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchWebdetailsGetValueNullable(handle);
  final result = sdkSearchWebdetailsFromFfi(_handle);
  sdkSearchWebdetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchWebdetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchWebdetailsReleaseHandleNullable(handle);

// End of WebDetails "private" section.


