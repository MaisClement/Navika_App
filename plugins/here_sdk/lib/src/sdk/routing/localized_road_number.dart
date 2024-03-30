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
import 'package:here_sdk/src/sdk/core/cardinal_direction.dart';
import 'package:here_sdk/src/sdk/core/localized_text.dart';
import 'package:here_sdk/src/sdk/core/route_type.dart';
import 'package:meta/meta.dart';


/// Used to represent road number localized to specific language with optional direction and route type information.

class LocalizedRoadNumber {
  /// Road number with locale information.
  LocalizedText localizedNumber;

  /// Road direction.
  /// This property indicates the official directional identifier assigned to highways.
  /// Can be `null` when direction is not assigned to highways.
  /// The direction indicates the same information as on the signpost shield: For example, if is "101 West", the directions contains WEST.
  /// Note that the official direction is not necessarily the travel direction.
  /// For example, US-101 through the city of Sunnyvale is physically located East to West.
  /// However, the official direction on sign is North/South.
  CardinalDirection? direction;

  /// The route type of the LocalizedRoadNumber.
  RouteType routeType;

  /// Creates a new instance.

  /// [localizedNumber] Road number with locale information.

  /// [direction] Road direction.
  /// This property indicates the official directional identifier assigned to highways.
  /// Can be `null` when direction is not assigned to highways.
  /// The direction indicates the same information as on the signpost shield: For example, if is "101 West", the directions contains WEST.
  /// Note that the official direction is not necessarily the travel direction.
  /// For example, US-101 through the city of Sunnyvale is physically located East to West.
  /// However, the official direction on sign is North/South.

  /// [routeType] The route type of the LocalizedRoadNumber.

  LocalizedRoadNumber._(this.localizedNumber, this.direction, this.routeType);
  LocalizedRoadNumber(LocalizedText localizedNumber, RouteType routeType)
    : localizedNumber = localizedNumber, direction = null, routeType = routeType;
  /// Returns the whole road number information including its cardinal direction.
  ///
  /// In case direction is empty, the original localized text will be returned.
  ///
  /// Returns [String]. The whole road number information including its cardinal direction.
  ///
  String getTextWithDirection() => $prototype.getTextWithDirection(this);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LocalizedRoadNumber) return false;
    LocalizedRoadNumber _other = other;
    return localizedNumber == _other.localizedNumber &&
        direction == _other.direction &&
        routeType == _other.routeType;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + localizedNumber.hashCode;
    result = 31 * result + direction.hashCode;
    result = 31 * result + routeType.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = LocalizedRoadNumber$Impl();
}


// LocalizedRoadNumber "private" section, not exported.

final _sdkRoutingLocalizedroadnumberCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Uint32),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_routing_LocalizedRoadNumber_create_handle'));
final _sdkRoutingLocalizedroadnumberReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_LocalizedRoadNumber_release_handle'));
final _sdkRoutingLocalizedroadnumberGetFieldlocalizedNumber = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_LocalizedRoadNumber_get_field_localizedNumber'));
final _sdkRoutingLocalizedroadnumberGetFielddirection = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_LocalizedRoadNumber_get_field_direction'));
final _sdkRoutingLocalizedroadnumberGetFieldrouteType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_LocalizedRoadNumber_get_field_routeType'));



/// @nodoc
@visibleForTesting
class LocalizedRoadNumber$Impl {
  String getTextWithDirection(LocalizedRoadNumber $that) {
    final _getTextWithDirectionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_routing_LocalizedRoadNumber_getTextWithDirection'));
    final _handle = sdkRoutingLocalizedroadnumberToFfi($that);
    final __resultHandle = _getTextWithDirectionFfi(_handle, __lib.LibraryContext.isolateId);
    sdkRoutingLocalizedroadnumberReleaseFfiHandle(_handle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkRoutingLocalizedroadnumberToFfi(LocalizedRoadNumber value) {
  final _localizedNumberHandle = sdkCoreLocalizedtextToFfi(value.localizedNumber);
  final _directionHandle = sdkCoreCardinaldirectionToFfiNullable(value.direction);
  final _routeTypeHandle = sdkCoreRoutetypeToFfi(value.routeType);
  final _result = _sdkRoutingLocalizedroadnumberCreateHandle(_localizedNumberHandle, _directionHandle, _routeTypeHandle);
  sdkCoreLocalizedtextReleaseFfiHandle(_localizedNumberHandle);
  sdkCoreCardinaldirectionReleaseFfiHandleNullable(_directionHandle);
  sdkCoreRoutetypeReleaseFfiHandle(_routeTypeHandle);
  return _result;
}

LocalizedRoadNumber sdkRoutingLocalizedroadnumberFromFfi(Pointer<Void> handle) {
  final _localizedNumberHandle = _sdkRoutingLocalizedroadnumberGetFieldlocalizedNumber(handle);
  final _directionHandle = _sdkRoutingLocalizedroadnumberGetFielddirection(handle);
  final _routeTypeHandle = _sdkRoutingLocalizedroadnumberGetFieldrouteType(handle);
  try {
    return LocalizedRoadNumber._(
      sdkCoreLocalizedtextFromFfi(_localizedNumberHandle), 
      sdkCoreCardinaldirectionFromFfiNullable(_directionHandle), 
      sdkCoreRoutetypeFromFfi(_routeTypeHandle)
    );
  } finally {
    sdkCoreLocalizedtextReleaseFfiHandle(_localizedNumberHandle);
    sdkCoreCardinaldirectionReleaseFfiHandleNullable(_directionHandle);
    sdkCoreRoutetypeReleaseFfiHandle(_routeTypeHandle);
  }
}

void sdkRoutingLocalizedroadnumberReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingLocalizedroadnumberReleaseHandle(handle);

// Nullable LocalizedRoadNumber

final _sdkRoutingLocalizedroadnumberCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_LocalizedRoadNumber_create_handle_nullable'));
final _sdkRoutingLocalizedroadnumberReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_LocalizedRoadNumber_release_handle_nullable'));
final _sdkRoutingLocalizedroadnumberGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_LocalizedRoadNumber_get_value_nullable'));

Pointer<Void> sdkRoutingLocalizedroadnumberToFfiNullable(LocalizedRoadNumber? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingLocalizedroadnumberToFfi(value);
  final result = _sdkRoutingLocalizedroadnumberCreateHandleNullable(_handle);
  sdkRoutingLocalizedroadnumberReleaseFfiHandle(_handle);
  return result;
}

LocalizedRoadNumber? sdkRoutingLocalizedroadnumberFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingLocalizedroadnumberGetValueNullable(handle);
  final result = sdkRoutingLocalizedroadnumberFromFfi(_handle);
  sdkRoutingLocalizedroadnumberReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingLocalizedroadnumberReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingLocalizedroadnumberReleaseHandleNullable(handle);

// End of LocalizedRoadNumber "private" section.


