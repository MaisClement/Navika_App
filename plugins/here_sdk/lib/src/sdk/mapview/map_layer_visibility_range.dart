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
import 'package:meta/meta.dart';

/// A layer's visibility along a zoom level range.
///
/// The range is half open - [minimumZoomLevel, maximumZoomLevel), the given maximum value is not contained in the range.
@immutable
class MapLayerVisibilityRange {
  /// Minimum zoom level on which the layer will be visible.
  final double minimumZoomLevel;

  /// Minimum zoom level from which the layer will not be visible.
  final double maximumZoomLevel;

  /// Creates a new instance.
  /// [minimumZoomLevel] Minimum zoom level on which the layer will be visible.
  /// [maximumZoomLevel] Minimum zoom level from which the layer will not be visible.
  const MapLayerVisibilityRange(this.minimumZoomLevel, this.maximumZoomLevel);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MapLayerVisibilityRange) return false;
    MapLayerVisibilityRange _other = other;
    return minimumZoomLevel == _other.minimumZoomLevel &&
        maximumZoomLevel == _other.maximumZoomLevel;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + minimumZoomLevel.hashCode;
    result = 31 * result + maximumZoomLevel.hashCode;
    return result;
  }
}


// MapLayerVisibilityRange "private" section, not exported.

final _sdkMapviewMaplayervisibilityrangeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('here_sdk_sdk_mapview_MapLayerVisibilityRange_create_handle'));
final _sdkMapviewMaplayervisibilityrangeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerVisibilityRange_release_handle'));
final _sdkMapviewMaplayervisibilityrangeGetFieldminimumZoomLevel = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerVisibilityRange_get_field_minimumZoomLevel'));
final _sdkMapviewMaplayervisibilityrangeGetFieldmaximumZoomLevel = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerVisibilityRange_get_field_maximumZoomLevel'));



Pointer<Void> sdkMapviewMaplayervisibilityrangeToFfi(MapLayerVisibilityRange value) {
  final _minimumZoomLevelHandle = (value.minimumZoomLevel);
  final _maximumZoomLevelHandle = (value.maximumZoomLevel);
  final _result = _sdkMapviewMaplayervisibilityrangeCreateHandle(_minimumZoomLevelHandle, _maximumZoomLevelHandle);
  
  
  return _result;
}

MapLayerVisibilityRange sdkMapviewMaplayervisibilityrangeFromFfi(Pointer<Void> handle) {
  final _minimumZoomLevelHandle = _sdkMapviewMaplayervisibilityrangeGetFieldminimumZoomLevel(handle);
  final _maximumZoomLevelHandle = _sdkMapviewMaplayervisibilityrangeGetFieldmaximumZoomLevel(handle);
  try {
    return MapLayerVisibilityRange(
      (_minimumZoomLevelHandle), 
      (_maximumZoomLevelHandle)
    );
  } finally {
    
    
  }
}

void sdkMapviewMaplayervisibilityrangeReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewMaplayervisibilityrangeReleaseHandle(handle);

// Nullable MapLayerVisibilityRange

final _sdkMapviewMaplayervisibilityrangeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerVisibilityRange_create_handle_nullable'));
final _sdkMapviewMaplayervisibilityrangeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerVisibilityRange_release_handle_nullable'));
final _sdkMapviewMaplayervisibilityrangeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerVisibilityRange_get_value_nullable'));

Pointer<Void> sdkMapviewMaplayervisibilityrangeToFfiNullable(MapLayerVisibilityRange? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMaplayervisibilityrangeToFfi(value);
  final result = _sdkMapviewMaplayervisibilityrangeCreateHandleNullable(_handle);
  sdkMapviewMaplayervisibilityrangeReleaseFfiHandle(_handle);
  return result;
}

MapLayerVisibilityRange? sdkMapviewMaplayervisibilityrangeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMaplayervisibilityrangeGetValueNullable(handle);
  final result = sdkMapviewMaplayervisibilityrangeFromFfi(_handle);
  sdkMapviewMaplayervisibilityrangeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMaplayervisibilityrangeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMaplayervisibilityrangeReleaseHandleNullable(handle);

// End of MapLayerVisibilityRange "private" section.


