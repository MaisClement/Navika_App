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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/sdk/core/angle_range.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/mapview/map_measure.dart';
import 'package:here_sdk/src/sdk/mapview/map_measure_range.dart';

/// Controls constraints on map camera parameters.
abstract class MapCameraLimits {

  /// Absolute minimum possible value of tilt angle.
  static final double minTilt = 0.0;

  /// Absolute maximum possible value of tilt angle.
  static final double maxTilt = 70.0;

  /// Absolute minimum possible value of zoom level.
  static final double minZoomLevel = 0.0;

  /// Absolute maximum possible value of zoom level.
  static final double maxZoomLevel = 23.0;

  /// Sets the bearing range within which to rotate the camera at a given zoom.
  ///
  /// The resulting camera bearing at a zoom is an interpolated value of the ranges set for closest matching zoom values.
  /// When no bearing range is specified for [MapCameraLimits.minZoomLevel], the bearing range set through [MapCameraLimits.bearingRange] is used for interpolation.
  /// Zoom values outside the supported zoom range are ignored.
  /// By default, the maximum bearing range for all zoom values is set during initialization.
  ///
  /// [zoom] Zoom at which the range is set.
  ///
  /// [bearingRange] Bearing range.
  ///
  void setBearingRangeAtZoom(MapMeasure zoom, AngleRange bearingRange);
  /// Clears bearing ranges for all zoom values and resets [MapCameraLimits.bearingRange] to default.
  ///
  void clearBearingRanges();
  /// Sets tilt ranges that can be set on the camera at given zoom.
  ///
  /// The resulting camera tilt at a zoom is an interpolated value of the ranges set for closest matching zoom values.
  /// When no tilt range is specified for [MapCameraLimits.minZoomLevel], the tilt range set through [MapCameraLimits.tiltRange] is used for interpolation.
  /// Zoom or tilt values outside the supported zoom and tilt range are ignored.
  /// By default, the maximum tilt range for all zoom values is set during initialization.
  ///
  /// [zoom] Zoom at which the range is set.
  ///
  /// [tiltRange] Tilt range.
  ///
  void setTiltRangeAtZoom(MapMeasure zoom, AngleRange tiltRange);
  /// Clears tilt ranges for all zoom values and resets [MapCameraLimits.tiltRange] to default.
  ///
  void clearTiltRanges();
  /// Gets the current tilt range. This range might not be yet active if no rendering
  /// cycle has been executed since the last call to set the range.
  AngleRange get tiltRange;
  /// Sets a new tilt limit range. This new limit range becomes active during the next rendering cycle.
  /// All previously set tilt ranges are cleared and the new tilt range is applied for all zoom values.
  set tiltRange(AngleRange value);

  /// Gets the bearing range set currently. This may not be active now if no rendering
  /// loop has been executed since the last call to set the range.
  AngleRange get bearingRange;
  /// Sets a new bearing range. It will be updated during the next rendering loop.
  /// All previously set bearing ranges are cleared and the new bearing range is applied for all zoom values.
  set bearingRange(AngleRange value);

  /// Gets the currently active camera zoom range.
  MapMeasureRange get zoomRange;
  /// Sets a new camera zoom range. This new limit range becomes active during the next rendering cycle.
  set zoomRange(MapMeasureRange value);

  /// Gets a GeoBox that limits the camera target to a specific geographical area. Absence of a value means that there is no limit.
  GeoBox? get targetArea;
  /// Sets a GeoBox that limits the camera target to a specific geographical area.
  set targetArea(GeoBox? value);

}


// MapCameraLimits "private" section, not exported.

final _sdkMapviewMapcameralimitsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapCameraLimits_register_finalizer'));
final _sdkMapviewMapcameralimitsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_copy_handle'));
final _sdkMapviewMapcameralimitsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_release_handle'));






class MapCameraLimits$Impl extends __lib.NativeBase implements MapCameraLimits {

  MapCameraLimits$Impl(Pointer<Void> handle) : super(handle);

  @override
  void setBearingRangeAtZoom(MapMeasure zoom, AngleRange bearingRange) {
    final _setBearingRangeAtZoomFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraLimits_setBearingRangeAtZoom__MapMeasure_AngleRange'));
    final _zoomHandle = sdkMapviewMapmeasureToFfi(zoom);
    final _bearingRangeHandle = sdkCoreAnglerangeToFfi(bearingRange);
    final _handle = this.handle;
    _setBearingRangeAtZoomFfi(_handle, __lib.LibraryContext.isolateId, _zoomHandle, _bearingRangeHandle);
    sdkMapviewMapmeasureReleaseFfiHandle(_zoomHandle);
    sdkCoreAnglerangeReleaseFfiHandle(_bearingRangeHandle);

  }

  @override
  void clearBearingRanges() {
    final _clearBearingRangesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraLimits_clearBearingRanges'));
    final _handle = this.handle;
    _clearBearingRangesFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void setTiltRangeAtZoom(MapMeasure zoom, AngleRange tiltRange) {
    final _setTiltRangeAtZoomFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraLimits_setTiltRangeAtZoom__MapMeasure_AngleRange'));
    final _zoomHandle = sdkMapviewMapmeasureToFfi(zoom);
    final _tiltRangeHandle = sdkCoreAnglerangeToFfi(tiltRange);
    final _handle = this.handle;
    _setTiltRangeAtZoomFfi(_handle, __lib.LibraryContext.isolateId, _zoomHandle, _tiltRangeHandle);
    sdkMapviewMapmeasureReleaseFfiHandle(_zoomHandle);
    sdkCoreAnglerangeReleaseFfiHandle(_tiltRangeHandle);

  }

  @override
  void clearTiltRanges() {
    final _clearTiltRangesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraLimits_clearTiltRanges'));
    final _handle = this.handle;
    _clearTiltRangesFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  AngleRange get tiltRange {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraLimits_tiltRange_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreAnglerangeFromFfi(__resultHandle);
    } finally {
      sdkCoreAnglerangeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set tiltRange(AngleRange value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraLimits_tiltRange_set__AngleRange'));
    final _valueHandle = sdkCoreAnglerangeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreAnglerangeReleaseFfiHandle(_valueHandle);

  }


  @override
  AngleRange get bearingRange {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraLimits_bearingRange_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreAnglerangeFromFfi(__resultHandle);
    } finally {
      sdkCoreAnglerangeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set bearingRange(AngleRange value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraLimits_bearingRange_set__AngleRange'));
    final _valueHandle = sdkCoreAnglerangeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreAnglerangeReleaseFfiHandle(_valueHandle);

  }


  @override
  MapMeasureRange get zoomRange {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraLimits_zoomRange_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapmeasurerangeFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmeasurerangeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set zoomRange(MapMeasureRange value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraLimits_zoomRange_set__MapMeasureRange'));
    final _valueHandle = sdkMapviewMapmeasurerangeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkMapviewMapmeasurerangeReleaseFfiHandle(_valueHandle);

  }


  @override
  GeoBox? get targetArea {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraLimits_targetArea_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeoboxFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set targetArea(GeoBox? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraLimits_targetArea_set__GeoBox_'));
    final _valueHandle = sdkCoreGeoboxToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreGeoboxReleaseFfiHandleNullable(_valueHandle);

  }



}

Pointer<Void> sdkMapviewMapcameralimitsToFfi(MapCameraLimits value) =>
  _sdkMapviewMapcameralimitsCopyHandle((value as __lib.NativeBase).handle);

MapCameraLimits sdkMapviewMapcameralimitsFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapCameraLimits) return instance;

  final _copiedHandle = _sdkMapviewMapcameralimitsCopyHandle(handle);
  final result = MapCameraLimits$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapcameralimitsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapcameralimitsReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcameralimitsReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcameralimitsToFfiNullable(MapCameraLimits? value) =>
  value != null ? sdkMapviewMapcameralimitsToFfi(value) : Pointer<Void>.fromAddress(0);

MapCameraLimits? sdkMapviewMapcameralimitsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcameralimitsFromFfi(handle) : null;

void sdkMapviewMapcameralimitsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcameralimitsReleaseHandle(handle);

// End of MapCameraLimits "private" section.


