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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:meta/meta.dart';









final _expandedBysdkCoreGeoboxExpandedbyDoubleDoubleDoubleDoubleReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_expandedBy__Double_Double_Double_Double_return_release_handle'));
final _expandedBysdkCoreGeoboxExpandedbyDoubleDoubleDoubleDoubleReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_expandedBy__Double_Double_Double_Double_return_get_result'));
final _expandedBysdkCoreGeoboxExpandedbyDoubleDoubleDoubleDoubleReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_expandedBy__Double_Double_Double_Double_return_get_error'));
final _expandedBysdkCoreGeoboxExpandedbyDoubleDoubleDoubleDoubleReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_expandedBy__Double_Double_Double_Double_return_has_error'));


/// Represents a bounding rectangle aligned with latitude and longitude.
///
/// Geographic area represented by this would be visualised as a rectangle
/// when using a normal cylindrical projection (such as Mercator).
/// The box has a maximum span of 360 degrees in longitude and 180 degrees in latitude direction.
/// The box with equal values in longitude for the corners is considered as a span of 360 degrees.
/// The box is considered empty if the latitude of the [GeoBox.southWestCorner] is larger than the the
/// latitude of the [GeoBox.northEastCorner].
@immutable
class GeoBox {
  /// South west corner coordinates.
  final GeoCoordinates southWestCorner;

  /// North east corner coordinates.
  final GeoCoordinates northEastCorner;

  /// Creates a new instance.
  /// [southWestCorner] South west corner coordinates.
  /// [northEastCorner] North east corner coordinates.
  const GeoBox(this.southWestCorner, this.northEastCorner);
  /// Creates a GeoBox which encompases all coordinates from the list.
  ///
  /// The provided list must contain at least two points.
  /// The altitude values of the input coordinates are not considered for the result.
  ///
  /// [geoCoordinates] List of coordinates to encompass inside bounding box.
  ///
  /// Returns [GeoBox?]. GeoBox containing all supplied coordinates, or `null` if less than two coordinates were provided.
  ///
  static GeoBox? containingGeoCoordinates(List<GeoCoordinates> geoCoordinates) => $prototype.containingGeoCoordinates(geoCoordinates);
  /// Envelopes two GeoBox areas by returning the smallest GeoBox covering both this
  /// GeoBox and the specified GeoBox.
  ///
  /// [geoBox] Another GeoBox to envelope with.
  ///
  /// Returns [GeoBox]. GeoBox covering two GeoBox areas
  ///
  GeoBox envelope(GeoBox geoBox) => $prototype.envelope(this, geoBox);
  /// Envelopes the list of GeoBox areas by returning the smallest
  /// GeoBox covering all specified GeoBox objects.
  ///
  /// [geoBoxes] List of GeoBox objects.
  ///
  /// Returns [GeoBox?]. GeoBox covering all GeoBox areas, or null
  /// if input is empty.
  ///
  static GeoBox? envelopeGeoBoxes(List<GeoBox> geoBoxes) => $prototype.envelopeGeoBoxes(geoBoxes);
  /// Determines whether this GeoBox intersects with the passed GeoBox.
  ///
  /// The altitude values are ignored.
  ///
  /// [geoBox] A GeoBox to check for intersection.
  ///
  /// Returns [bool]. true if intersects with the GeoBox, false otherwise.
  ///
  bool intersects(GeoBox geoBox) => $prototype.intersects(this, geoBox);
  /// Computes the intersection with the passed [GeoBox].
  ///
  /// The altitude values are ignored.
  /// Limitation: Geo boxes are considered as non-intersecting if they overlap only on a single point, horizontal line or vertical line.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [geoBox] Another geo box to check intersection with.
  ///
  /// Returns [List<GeoBox>]. It will be empty if there is no overlap.
  ///
  /// Otherwise, 1 or more geo boxes covering common area by this and passed [GeoBox].
  ///
  List<GeoBox> intersection(GeoBox geoBox) => $prototype.intersection(this, geoBox);
  /// Computes intersection of list of [GeoBox] instances.
  ///
  /// The altitude values are ignored.
  /// Limitation: Geo boxes are considered as non-intersecting if they overlap only on a single point, horizontal line or vertical line.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  ///
  /// [geoBoxes] List of [GeoBox] instances.
  ///
  /// Returns [List<GeoBox>]. It will be empty if there is no overlap between all the passed [GeoBox] instances.
  ///
  /// Otherwise, 1 or more geo boxes covering common area by all the passed [GeoBox] instances.
  ///
  static List<GeoBox> intersectionGeoBoxes(List<GeoBox> geoBoxes) => $prototype.intersectionGeoBoxes(geoBoxes);
  /// Determines whether the specified GeoBox is covered entirely by this GeoBox.
  ///
  /// The altitude values are ignored.
  ///
  /// [geoBox] A GeoBox to check for containment within this GeoBox.
  ///
  /// Returns [bool]. true if covered by the GeoBox, false otherwise.
  ///
  bool containsGeoBox(GeoBox geoBox) => $prototype.containsGeoBox(this, geoBox);
  /// Determines whether the specified GeoCoordinates is contained within this GeoBox.
  ///
  /// The altitude values are ignored.
  ///
  /// [geoCoordinates] A GeoCoordinates to check for containment within this GeoBox.
  ///
  /// Returns [bool]. true if contained within the GeoBox, false otherwise.
  ///
  bool containsGeoCoordinates(GeoCoordinates geoCoordinates) => $prototype.containsGeoCoordinates(this, geoCoordinates);
  /// Creates a GeoBox which is expanded by a fixed distance.
  ///
  /// Throws an InstantiationError if it is not possible to create a valid
  /// GeoBox with the given arguments.
  ///
  /// [southMeters] Distance in the south direction in meters to expand the GeoBox.
  ///
  /// [westMeters] Distance in the west direction in meters to expand the GeoBox.
  ///
  /// [northMeters] Distance in the north direction in meters to expand the GeoBox.
  ///
  /// [eastMeters] Distance in the east direction in meters to expand the GeoBox.
  ///
  /// Returns [GeoBox]. The expanded GeoBox.
  ///
  /// Throws [InstantiationException]. Instantiation error.
  ///
  GeoBox expandedBy(double southMeters, double westMeters, double northMeters, double eastMeters) => $prototype.expandedBy(this, southMeters, westMeters, northMeters, eastMeters);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GeoBox) return false;
    GeoBox _other = other;
    return southWestCorner == _other.southWestCorner &&
        northEastCorner == _other.northEastCorner;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + southWestCorner.hashCode;
    result = 31 * result + northEastCorner.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = GeoBox$Impl();
}


// GeoBox "private" section, not exported.

final _sdkCoreGeoboxCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_create_handle'));
final _sdkCoreGeoboxReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_release_handle'));
final _sdkCoreGeoboxGetFieldsouthWestCorner = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_get_field_southWestCorner'));
final _sdkCoreGeoboxGetFieldnorthEastCorner = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_get_field_northEastCorner'));



/// @nodoc
@visibleForTesting
class GeoBox$Impl {
  GeoBox? containingGeoCoordinates(List<GeoCoordinates> geoCoordinates) {
    final _containingGeoCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_containing__ListOf_sdk_core_GeoCoordinates'));
    final _geoCoordinatesHandle = coreTypeslistofSdkCoreGeocoordinatesToFfi(geoCoordinates);
    final __resultHandle = _containingGeoCoordinatesFfi(__lib.LibraryContext.isolateId, _geoCoordinatesHandle);
    coreTypeslistofSdkCoreGeocoordinatesReleaseFfiHandle(_geoCoordinatesHandle);
    try {
      return sdkCoreGeoboxFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandleNullable(__resultHandle);

    }

  }

  GeoBox envelope(GeoBox $that, GeoBox geoBox) {
    final _envelopeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_envelope__GeoBox'));
    final _geoBoxHandle = sdkCoreGeoboxToFfi(geoBox);
    final _handle = sdkCoreGeoboxToFfi($that);
    final __resultHandle = _envelopeFfi(_handle, __lib.LibraryContext.isolateId, _geoBoxHandle);
    sdkCoreGeoboxReleaseFfiHandle(_handle);
    sdkCoreGeoboxReleaseFfiHandle(_geoBoxHandle);
    try {
      return sdkCoreGeoboxFromFfi(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandle(__resultHandle);

    }

  }

  GeoBox? envelopeGeoBoxes(List<GeoBox> geoBoxes) {
    final _envelopeGeoBoxesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_envelopeGeoBoxes__ListOf_sdk_core_GeoBox'));
    final _geoBoxesHandle = coreTypeslistofSdkCoreGeoboxToFfi(geoBoxes);
    final __resultHandle = _envelopeGeoBoxesFfi(__lib.LibraryContext.isolateId, _geoBoxesHandle);
    coreTypeslistofSdkCoreGeoboxReleaseFfiHandle(_geoBoxesHandle);
    try {
      return sdkCoreGeoboxFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandleNullable(__resultHandle);

    }

  }

  bool intersects(GeoBox $that, GeoBox geoBox) {
    final _intersectsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_intersects__GeoBox'));
    final _geoBoxHandle = sdkCoreGeoboxToFfi(geoBox);
    final _handle = sdkCoreGeoboxToFfi($that);
    final __resultHandle = _intersectsFfi(_handle, __lib.LibraryContext.isolateId, _geoBoxHandle);
    sdkCoreGeoboxReleaseFfiHandle(_handle);
    sdkCoreGeoboxReleaseFfiHandle(_geoBoxHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  List<GeoBox> intersection(GeoBox $that, GeoBox geoBox) {
    final _intersectionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_intersection__GeoBox'));
    final _geoBoxHandle = sdkCoreGeoboxToFfi(geoBox);
    final _handle = sdkCoreGeoboxToFfi($that);
    final __resultHandle = _intersectionFfi(_handle, __lib.LibraryContext.isolateId, _geoBoxHandle);
    sdkCoreGeoboxReleaseFfiHandle(_handle);
    sdkCoreGeoboxReleaseFfiHandle(_geoBoxHandle);
    try {
      return coreTypeslistofSdkCoreGeoboxFromFfi(__resultHandle);
    } finally {
      coreTypeslistofSdkCoreGeoboxReleaseFfiHandle(__resultHandle);

    }

  }

  List<GeoBox> intersectionGeoBoxes(List<GeoBox> geoBoxes) {
    final _intersectionGeoBoxesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_intersection__ListOf_sdk_core_GeoBox'));
    final _geoBoxesHandle = coreTypeslistofSdkCoreGeoboxToFfi(geoBoxes);
    final __resultHandle = _intersectionGeoBoxesFfi(__lib.LibraryContext.isolateId, _geoBoxesHandle);
    coreTypeslistofSdkCoreGeoboxReleaseFfiHandle(_geoBoxesHandle);
    try {
      return coreTypeslistofSdkCoreGeoboxFromFfi(__resultHandle);
    } finally {
      coreTypeslistofSdkCoreGeoboxReleaseFfiHandle(__resultHandle);

    }

  }

  bool containsGeoBox(GeoBox $that, GeoBox geoBox) {
    final _containsGeoBoxFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_contains__GeoBox'));
    final _geoBoxHandle = sdkCoreGeoboxToFfi(geoBox);
    final _handle = sdkCoreGeoboxToFfi($that);
    final __resultHandle = _containsGeoBoxFfi(_handle, __lib.LibraryContext.isolateId, _geoBoxHandle);
    sdkCoreGeoboxReleaseFfiHandle(_handle);
    sdkCoreGeoboxReleaseFfiHandle(_geoBoxHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  bool containsGeoCoordinates(GeoBox $that, GeoCoordinates geoCoordinates) {
    final _containsGeoCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_GeoBox_contains__GeoCoordinates'));
    final _geoCoordinatesHandle = sdkCoreGeocoordinatesToFfi(geoCoordinates);
    final _handle = sdkCoreGeoboxToFfi($that);
    final __resultHandle = _containsGeoCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _geoCoordinatesHandle);
    sdkCoreGeoboxReleaseFfiHandle(_handle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_geoCoordinatesHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  GeoBox expandedBy(GeoBox $that, double southMeters, double westMeters, double northMeters, double eastMeters) {
    final _expandedByFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double, Double, Double, Double), Pointer<Void> Function(Pointer<Void>, int, double, double, double, double)>('here_sdk_sdk_core_GeoBox_expandedBy__Double_Double_Double_Double'));
    final _southMetersHandle = (southMeters);
    final _westMetersHandle = (westMeters);
    final _northMetersHandle = (northMeters);
    final _eastMetersHandle = (eastMeters);
    final _handle = sdkCoreGeoboxToFfi($that);
    final __callResultHandle = _expandedByFfi(_handle, __lib.LibraryContext.isolateId, _southMetersHandle, _westMetersHandle, _northMetersHandle, _eastMetersHandle);
    sdkCoreGeoboxReleaseFfiHandle(_handle);




    if (_expandedBysdkCoreGeoboxExpandedbyDoubleDoubleDoubleDoubleReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _expandedBysdkCoreGeoboxExpandedbyDoubleDoubleDoubleDoubleReturnGetError(__callResultHandle);
        _expandedBysdkCoreGeoboxExpandedbyDoubleDoubleDoubleDoubleReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _expandedBysdkCoreGeoboxExpandedbyDoubleDoubleDoubleDoubleReturnGetResult(__callResultHandle);
    _expandedBysdkCoreGeoboxExpandedbyDoubleDoubleDoubleDoubleReturnReleaseHandle(__callResultHandle);
    try {
      return sdkCoreGeoboxFromFfi(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkCoreGeoboxToFfi(GeoBox value) {
  final _southWestCornerHandle = sdkCoreGeocoordinatesToFfi(value.southWestCorner);
  final _northEastCornerHandle = sdkCoreGeocoordinatesToFfi(value.northEastCorner);
  final _result = _sdkCoreGeoboxCreateHandle(_southWestCornerHandle, _northEastCornerHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_southWestCornerHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_northEastCornerHandle);
  return _result;
}

GeoBox sdkCoreGeoboxFromFfi(Pointer<Void> handle) {
  final _southWestCornerHandle = _sdkCoreGeoboxGetFieldsouthWestCorner(handle);
  final _northEastCornerHandle = _sdkCoreGeoboxGetFieldnorthEastCorner(handle);
  try {
    return GeoBox(
      sdkCoreGeocoordinatesFromFfi(_southWestCornerHandle), 
      sdkCoreGeocoordinatesFromFfi(_northEastCornerHandle)
    );
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandle(_southWestCornerHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_northEastCornerHandle);
  }
}

void sdkCoreGeoboxReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreGeoboxReleaseHandle(handle);

// Nullable GeoBox

final _sdkCoreGeoboxCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_create_handle_nullable'));
final _sdkCoreGeoboxReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_release_handle_nullable'));
final _sdkCoreGeoboxGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_GeoBox_get_value_nullable'));

Pointer<Void> sdkCoreGeoboxToFfiNullable(GeoBox? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreGeoboxToFfi(value);
  final result = _sdkCoreGeoboxCreateHandleNullable(_handle);
  sdkCoreGeoboxReleaseFfiHandle(_handle);
  return result;
}

GeoBox? sdkCoreGeoboxFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreGeoboxGetValueNullable(handle);
  final result = sdkCoreGeoboxFromFfi(_handle);
  sdkCoreGeoboxReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreGeoboxReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreGeoboxReleaseHandleNullable(handle);

// End of GeoBox "private" section.


