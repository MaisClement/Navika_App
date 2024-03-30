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

/// Indicates the level of significance of a route in a range from 1 to 6.
///
/// A value of 1 stands for
/// the most major route and 6 the most minor. The route type indicates that the road's name is
/// actually a route number and in many countries is displayed in a shield symbol (e.g., Interstate
/// and State routes in the U.S.).
/// See https://developer.here.com/documentation/here-map-content-schema/dev_guide/topics_schema/streetname.routetype.html
enum RouteType {
    /// Unknown
    typeUnknown,
    /// International / European road
    level1Road,
    /// National road
    level2Road,
    /// Primary road
    level3Road,
    /// Secondary road
    level4Road,
    /// Minor road
    level5Road,
    /// Avenue
    level6Road
}

// RouteType "private" section, not exported.

int sdkCoreRoutetypeToFfi(RouteType value) {
  switch (value) {
  case RouteType.typeUnknown:
    return 0;
  case RouteType.level1Road:
    return 1;
  case RouteType.level2Road:
    return 2;
  case RouteType.level3Road:
    return 3;
  case RouteType.level4Road:
    return 4;
  case RouteType.level5Road:
    return 5;
  case RouteType.level6Road:
    return 6;
  default:
    throw StateError("Invalid enum value $value for RouteType enum.");
  }
}

RouteType sdkCoreRoutetypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return RouteType.typeUnknown;
  case 1:
    return RouteType.level1Road;
  case 2:
    return RouteType.level2Road;
  case 3:
    return RouteType.level3Road;
  case 4:
    return RouteType.level4Road;
  case 5:
    return RouteType.level5Road;
  case 6:
    return RouteType.level6Road;
  default:
    throw StateError("Invalid numeric value $handle for RouteType enum.");
  }
}

void sdkCoreRoutetypeReleaseFfiHandle(int handle) {}

final _sdkCoreRoutetypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_RouteType_create_handle_nullable'));
final _sdkCoreRoutetypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_RouteType_release_handle_nullable'));
final _sdkCoreRoutetypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_RouteType_get_value_nullable'));

Pointer<Void> sdkCoreRoutetypeToFfiNullable(RouteType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreRoutetypeToFfi(value);
  final result = _sdkCoreRoutetypeCreateHandleNullable(_handle);
  sdkCoreRoutetypeReleaseFfiHandle(_handle);
  return result;
}

RouteType? sdkCoreRoutetypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreRoutetypeGetValueNullable(handle);
  final result = sdkCoreRoutetypeFromFfi(_handle);
  sdkCoreRoutetypeReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreRoutetypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreRoutetypeReleaseHandleNullable(handle);

// End of RouteType "private" section.


