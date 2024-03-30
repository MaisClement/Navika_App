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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

/// Information about the user defined coordinates and where they match to the map.

class MapMatchedCoordinates {
  /// The user defined geographic coordinates.
  GeoCoordinates originalCoordinates;

  /// Map-matched geographic coordinates.
  GeoCoordinates matchedCoordinates;

  /// Creates a new instance.

  /// [originalCoordinates] The user defined geographic coordinates.

  /// [matchedCoordinates] Map-matched geographic coordinates.

  MapMatchedCoordinates(this.originalCoordinates, this.matchedCoordinates);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MapMatchedCoordinates) return false;
    MapMatchedCoordinates _other = other;
    return originalCoordinates == _other.originalCoordinates &&
        matchedCoordinates == _other.matchedCoordinates;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + originalCoordinates.hashCode;
    result = 31 * result + matchedCoordinates.hashCode;
    return result;
  }
}


// MapMatchedCoordinates "private" section, not exported.

final _sdkRoutingMapmatchedcoordinatesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_MapMatchedCoordinates_create_handle'));
final _sdkRoutingMapmatchedcoordinatesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MapMatchedCoordinates_release_handle'));
final _sdkRoutingMapmatchedcoordinatesGetFieldoriginalCoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MapMatchedCoordinates_get_field_originalCoordinates'));
final _sdkRoutingMapmatchedcoordinatesGetFieldmatchedCoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MapMatchedCoordinates_get_field_matchedCoordinates'));



Pointer<Void> sdkRoutingMapmatchedcoordinatesToFfi(MapMatchedCoordinates value) {
  final _originalCoordinatesHandle = sdkCoreGeocoordinatesToFfi(value.originalCoordinates);
  final _matchedCoordinatesHandle = sdkCoreGeocoordinatesToFfi(value.matchedCoordinates);
  final _result = _sdkRoutingMapmatchedcoordinatesCreateHandle(_originalCoordinatesHandle, _matchedCoordinatesHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_originalCoordinatesHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_matchedCoordinatesHandle);
  return _result;
}

MapMatchedCoordinates sdkRoutingMapmatchedcoordinatesFromFfi(Pointer<Void> handle) {
  final _originalCoordinatesHandle = _sdkRoutingMapmatchedcoordinatesGetFieldoriginalCoordinates(handle);
  final _matchedCoordinatesHandle = _sdkRoutingMapmatchedcoordinatesGetFieldmatchedCoordinates(handle);
  try {
    return MapMatchedCoordinates(
      sdkCoreGeocoordinatesFromFfi(_originalCoordinatesHandle), 
      sdkCoreGeocoordinatesFromFfi(_matchedCoordinatesHandle)
    );
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandle(_originalCoordinatesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_matchedCoordinatesHandle);
  }
}

void sdkRoutingMapmatchedcoordinatesReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingMapmatchedcoordinatesReleaseHandle(handle);

// Nullable MapMatchedCoordinates

final _sdkRoutingMapmatchedcoordinatesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MapMatchedCoordinates_create_handle_nullable'));
final _sdkRoutingMapmatchedcoordinatesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MapMatchedCoordinates_release_handle_nullable'));
final _sdkRoutingMapmatchedcoordinatesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MapMatchedCoordinates_get_value_nullable'));

Pointer<Void> sdkRoutingMapmatchedcoordinatesToFfiNullable(MapMatchedCoordinates? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingMapmatchedcoordinatesToFfi(value);
  final result = _sdkRoutingMapmatchedcoordinatesCreateHandleNullable(_handle);
  sdkRoutingMapmatchedcoordinatesReleaseFfiHandle(_handle);
  return result;
}

MapMatchedCoordinates? sdkRoutingMapmatchedcoordinatesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingMapmatchedcoordinatesGetValueNullable(handle);
  final result = sdkRoutingMapmatchedcoordinatesFromFfi(_handle);
  sdkRoutingMapmatchedcoordinatesReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingMapmatchedcoordinatesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingMapmatchedcoordinatesReleaseHandleNullable(handle);

// End of MapMatchedCoordinates "private" section.


