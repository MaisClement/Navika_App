// Copyright (c) 2019-2023 HERE Global B.V. and its affiliate(s).
// All rights reserved.
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
import 'package:here_sdk/src/sdk/core/route_type.dart';

/// Contains the information required to create a road shield image.

class RoadShieldIconProperties {
  /// The type of route indicating the significance of the road in a range from 0 to 6. A value of
  /// 1 stands for the most major route and 6 the most minor, with 0 being of unknown type.
  RouteType routeType;

  /// The country code in ISO-3166-1 alpha-3 format, which will determine the type of road shield.
  String countryCode;

  /// The state code for the road. It's a 2-letter code in ISO 3166-2 format. For example
  /// the ones listed for US on this page https://en.wikipedia.org/wiki/ISO_3166-2:US.
  /// The code "AL" is for Alabama. Another example is the code for autonomous
  /// communities listed on https://en.wikipedia.org/wiki/ISO_3166-2:ES. Can be empty if
  /// not required for the particular country.
  String stateCode;

  /// A string that is used to additionally determine the road shield's visual representation.
  /// In a routing context, the text can be taken from a `LocalizedRoadNumber`, which
  /// is available for each `Span` of a `Route` object.
  /// Typically, the string contains the number of a road, such as "E100". Internally, the text
  /// is parsed with a RegEx pattern and the results will be used along with other properties
  /// such as `routeType`, `countryCode` and `stateCode` to identify the visual representation
  /// of a road shield icon.
  /// Note that the actual text which will be displayed on the road shield icon is set with
  /// [RoadShieldIconProperties.shieldText]. In order to determine the visuals of the icon, `countryCode`, `routeType`
  /// and eventually the `stateCode` is in most cases sufficient to determine the type of road
  /// shield. In this case an empty string should be passed.
  ///
  /// **Note:** Texts that contain a `CardinalDirection` are currently not supported and may lead
  /// to unexpected results. See `LocalizedRoadNumber` for more details, it provides texts with
  /// and without a cardinal direction.
  String routeNumberName;

  /// The text of the road-shield. This is the text which is displayed on the road-shield
  /// in reality. It will be in the output road-shield icon.
  String shieldText;

  /// Creates a new instance.

  /// [routeType] The type of route indicating the significance of the road in a range from 0 to 6. A value of
  /// 1 stands for the most major route and 6 the most minor, with 0 being of unknown type.

  /// [countryCode] The country code in ISO-3166-1 alpha-3 format, which will determine the type of road shield.

  /// [stateCode] The state code for the road. It's a 2-letter code in ISO 3166-2 format. For example
  /// the ones listed for US on this page https://en.wikipedia.org/wiki/ISO_3166-2:US.
  /// The code "AL" is for Alabama. Another example is the code for autonomous
  /// communities listed on https://en.wikipedia.org/wiki/ISO_3166-2:ES. Can be empty if
  /// not required for the particular country.

  /// [routeNumberName] A string that is used to additionally determine the road shield's visual representation.
  /// In a routing context, the text can be taken from a `LocalizedRoadNumber`, which
  /// is available for each `Span` of a `Route` object.
  /// Typically, the string contains the number of a road, such as "E100". Internally, the text
  /// is parsed with a RegEx pattern and the results will be used along with other properties
  /// such as `routeType`, `countryCode` and `stateCode` to identify the visual representation
  /// of a road shield icon.
  /// Note that the actual text which will be displayed on the road shield icon is set with
  /// [RoadShieldIconProperties.shieldText]. In order to determine the visuals of the icon, `countryCode`, `routeType`
  /// and eventually the `stateCode` is in most cases sufficient to determine the type of road
  /// shield. In this case an empty string should be passed.
  ///
  /// **Note:** Texts that contain a `CardinalDirection` are currently not supported and may lead
  /// to unexpected results. See `LocalizedRoadNumber` for more details, it provides texts with
  /// and without a cardinal direction.

  /// [shieldText] The text of the road-shield. This is the text which is displayed on the road-shield
  /// in reality. It will be in the output road-shield icon.

  RoadShieldIconProperties(this.routeType, this.countryCode, this.stateCode, this.routeNumberName, this.shieldText);
}


// RoadShieldIconProperties "private" section, not exported.

final _sdkMapviewRoadshieldiconpropertiesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_RoadShieldIconProperties_create_handle'));
final _sdkMapviewRoadshieldiconpropertiesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RoadShieldIconProperties_release_handle'));
final _sdkMapviewRoadshieldiconpropertiesGetFieldrouteType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RoadShieldIconProperties_get_field_routeType'));
final _sdkMapviewRoadshieldiconpropertiesGetFieldcountryCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RoadShieldIconProperties_get_field_countryCode'));
final _sdkMapviewRoadshieldiconpropertiesGetFieldstateCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RoadShieldIconProperties_get_field_stateCode'));
final _sdkMapviewRoadshieldiconpropertiesGetFieldrouteNumberName = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RoadShieldIconProperties_get_field_routeNumberName'));
final _sdkMapviewRoadshieldiconpropertiesGetFieldshieldText = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RoadShieldIconProperties_get_field_shieldText'));



Pointer<Void> sdkMapviewRoadshieldiconpropertiesToFfi(RoadShieldIconProperties value) {
  final _routeTypeHandle = sdkCoreRoutetypeToFfi(value.routeType);
  final _countryCodeHandle = stringToFfi(value.countryCode);
  final _stateCodeHandle = stringToFfi(value.stateCode);
  final _routeNumberNameHandle = stringToFfi(value.routeNumberName);
  final _shieldTextHandle = stringToFfi(value.shieldText);
  final _result = _sdkMapviewRoadshieldiconpropertiesCreateHandle(_routeTypeHandle, _countryCodeHandle, _stateCodeHandle, _routeNumberNameHandle, _shieldTextHandle);
  sdkCoreRoutetypeReleaseFfiHandle(_routeTypeHandle);
  stringReleaseFfiHandle(_countryCodeHandle);
  stringReleaseFfiHandle(_stateCodeHandle);
  stringReleaseFfiHandle(_routeNumberNameHandle);
  stringReleaseFfiHandle(_shieldTextHandle);
  return _result;
}

RoadShieldIconProperties sdkMapviewRoadshieldiconpropertiesFromFfi(Pointer<Void> handle) {
  final _routeTypeHandle = _sdkMapviewRoadshieldiconpropertiesGetFieldrouteType(handle);
  final _countryCodeHandle = _sdkMapviewRoadshieldiconpropertiesGetFieldcountryCode(handle);
  final _stateCodeHandle = _sdkMapviewRoadshieldiconpropertiesGetFieldstateCode(handle);
  final _routeNumberNameHandle = _sdkMapviewRoadshieldiconpropertiesGetFieldrouteNumberName(handle);
  final _shieldTextHandle = _sdkMapviewRoadshieldiconpropertiesGetFieldshieldText(handle);
  try {
    return RoadShieldIconProperties(
      sdkCoreRoutetypeFromFfi(_routeTypeHandle), 
      stringFromFfi(_countryCodeHandle), 
      stringFromFfi(_stateCodeHandle), 
      stringFromFfi(_routeNumberNameHandle), 
      stringFromFfi(_shieldTextHandle)
    );
  } finally {
    sdkCoreRoutetypeReleaseFfiHandle(_routeTypeHandle);
    stringReleaseFfiHandle(_countryCodeHandle);
    stringReleaseFfiHandle(_stateCodeHandle);
    stringReleaseFfiHandle(_routeNumberNameHandle);
    stringReleaseFfiHandle(_shieldTextHandle);
  }
}

void sdkMapviewRoadshieldiconpropertiesReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewRoadshieldiconpropertiesReleaseHandle(handle);

// Nullable RoadShieldIconProperties

final _sdkMapviewRoadshieldiconpropertiesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RoadShieldIconProperties_create_handle_nullable'));
final _sdkMapviewRoadshieldiconpropertiesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RoadShieldIconProperties_release_handle_nullable'));
final _sdkMapviewRoadshieldiconpropertiesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_RoadShieldIconProperties_get_value_nullable'));

Pointer<Void> sdkMapviewRoadshieldiconpropertiesToFfiNullable(RoadShieldIconProperties? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewRoadshieldiconpropertiesToFfi(value);
  final result = _sdkMapviewRoadshieldiconpropertiesCreateHandleNullable(_handle);
  sdkMapviewRoadshieldiconpropertiesReleaseFfiHandle(_handle);
  return result;
}

RoadShieldIconProperties? sdkMapviewRoadshieldiconpropertiesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewRoadshieldiconpropertiesGetValueNullable(handle);
  final result = sdkMapviewRoadshieldiconpropertiesFromFfi(_handle);
  sdkMapviewRoadshieldiconpropertiesReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewRoadshieldiconpropertiesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewRoadshieldiconpropertiesReleaseHandleNullable(handle);

// End of RoadShieldIconProperties "private" section.


