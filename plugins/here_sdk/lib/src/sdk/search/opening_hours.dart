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
import 'package:here_sdk/src/sdk/search/place_category.dart';
import 'package:here_sdk/src/sdk/search/schedule_details.dart';

/// Represents opening hours information.

class OpeningHours {
  /// The list of opening hours presented as localized text.
  List<String> text;

  /// Boolean flag informing if the place is open or closed at the time when the search request was initiated.
  bool isOpen;

  /// The list of schedule details.
  List<ScheduleDetails> scheduleDetailsList;

  /// The list of categories related to opening hours information.
  /// This data is not available in offline search.
  List<PlaceCategory> categories;

  /// Creates a new instance.

  /// [text] The list of opening hours presented as localized text.

  /// [isOpen] Boolean flag informing if the place is open or closed at the time when the search request was initiated.

  /// [scheduleDetailsList] The list of schedule details.

  /// [categories] The list of categories related to opening hours information.
  /// This data is not available in offline search.

  OpeningHours(this.text, this.isOpen, this.scheduleDetailsList, this.categories);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OpeningHours) return false;
    OpeningHours _other = other;
    return DeepCollectionEquality().equals(text, _other.text) &&
        isOpen == _other.isOpen &&
        DeepCollectionEquality().equals(scheduleDetailsList, _other.scheduleDetailsList) &&
        DeepCollectionEquality().equals(categories, _other.categories);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(text);
    result = 31 * result + isOpen.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(scheduleDetailsList);
    result = 31 * result + DeepCollectionEquality().hash(categories);
    return result;
  }
}


// OpeningHours "private" section, not exported.

final _sdkSearchOpeninghoursCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint8, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_create_handle'));
final _sdkSearchOpeninghoursReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_release_handle'));
final _sdkSearchOpeninghoursGetFieldtext = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_get_field_text'));
final _sdkSearchOpeninghoursGetFieldisOpen = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_get_field_isOpen'));
final _sdkSearchOpeninghoursGetFieldscheduleDetailsList = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_get_field_scheduleDetailsList'));
final _sdkSearchOpeninghoursGetFieldcategories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_get_field_categories'));



Pointer<Void> sdkSearchOpeninghoursToFfi(OpeningHours value) {
  final _textHandle = heresdkSearchCommonBindingslistofStringToFfi(value.text);
  final _isOpenHandle = booleanToFfi(value.isOpen);
  final _scheduleDetailsListHandle = heresdkSearchCommonBindingslistofSdkSearchScheduledetailsToFfi(value.scheduleDetailsList);
  final _categoriesHandle = heresdkSearchCommonBindingslistofSdkSearchPlacecategoryToFfi(value.categories);
  final _result = _sdkSearchOpeninghoursCreateHandle(_textHandle, _isOpenHandle, _scheduleDetailsListHandle, _categoriesHandle);
  heresdkSearchCommonBindingslistofStringReleaseFfiHandle(_textHandle);
  booleanReleaseFfiHandle(_isOpenHandle);
  heresdkSearchCommonBindingslistofSdkSearchScheduledetailsReleaseFfiHandle(_scheduleDetailsListHandle);
  heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  return _result;
}

OpeningHours sdkSearchOpeninghoursFromFfi(Pointer<Void> handle) {
  final _textHandle = _sdkSearchOpeninghoursGetFieldtext(handle);
  final _isOpenHandle = _sdkSearchOpeninghoursGetFieldisOpen(handle);
  final _scheduleDetailsListHandle = _sdkSearchOpeninghoursGetFieldscheduleDetailsList(handle);
  final _categoriesHandle = _sdkSearchOpeninghoursGetFieldcategories(handle);
  try {
    return OpeningHours(
      heresdkSearchCommonBindingslistofStringFromFfi(_textHandle), 
      booleanFromFfi(_isOpenHandle), 
      heresdkSearchCommonBindingslistofSdkSearchScheduledetailsFromFfi(_scheduleDetailsListHandle), 
      heresdkSearchCommonBindingslistofSdkSearchPlacecategoryFromFfi(_categoriesHandle)
    );
  } finally {
    heresdkSearchCommonBindingslistofStringReleaseFfiHandle(_textHandle);
    booleanReleaseFfiHandle(_isOpenHandle);
    heresdkSearchCommonBindingslistofSdkSearchScheduledetailsReleaseFfiHandle(_scheduleDetailsListHandle);
    heresdkSearchCommonBindingslistofSdkSearchPlacecategoryReleaseFfiHandle(_categoriesHandle);
  }
}

void sdkSearchOpeninghoursReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchOpeninghoursReleaseHandle(handle);

// Nullable OpeningHours

final _sdkSearchOpeninghoursCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_create_handle_nullable'));
final _sdkSearchOpeninghoursReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_release_handle_nullable'));
final _sdkSearchOpeninghoursGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OpeningHours_get_value_nullable'));

Pointer<Void> sdkSearchOpeninghoursToFfiNullable(OpeningHours? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchOpeninghoursToFfi(value);
  final result = _sdkSearchOpeninghoursCreateHandleNullable(_handle);
  sdkSearchOpeninghoursReleaseFfiHandle(_handle);
  return result;
}

OpeningHours? sdkSearchOpeninghoursFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchOpeninghoursGetValueNullable(handle);
  final result = sdkSearchOpeninghoursFromFfi(_handle);
  sdkSearchOpeninghoursReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchOpeninghoursReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchOpeninghoursReleaseHandleNullable(handle);

// End of OpeningHours "private" section.


