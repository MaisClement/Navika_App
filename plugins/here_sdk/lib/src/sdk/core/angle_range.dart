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
import 'package:meta/meta.dart';








/// Represents angle ranges as a circular sector by using an absolute start angle
/// and a relative range angle called extent.
///
/// They both define a sector on a
/// circle. All angles are in degrees and are clockwise-oriented.
/// By default, the AngleRange represents the entire circle, the value is in the range of \[0, 360\].
/// Values will be corrected during construction using normalization
/// for the start angle and clamping for the extent angle, ensuring a valid range
/// for all possible inputs.
@immutable
class AngleRange {
  /// Start angle, running clockwise, in degrees from north.
  /// The value is in the range of \[0, 360) degrees.
  final double start;

  /// The angle range extent, running clockwise, in degrees from start.
  /// The value is in the range of \[0, 360\] degrees.
  final double extent;

  const AngleRange._(this.start, this.extent);
  /// Constructs an AngleRange from the provided start and extent angles.
  ///
  /// Corrects values if they exceed the ranges.
  ///
  /// [start] Start angle, running clockwise, in degrees from north.
  /// The value will be normalized to \[0.0, 360.0).
  ///
  /// [extent] The range's extent, running clockwise, in degrees from start.
  /// The value will be clamped to the range of \[0, 360\] degrees.
  ///
  factory AngleRange(double start, double extent) => $prototype.$init(start, extent);
  /// Constructs a range covering a full circle.
  ///
  factory AngleRange.fullCircle() => $prototype.fullCircle();
  /// Constructs an AngleRange from the provided minimum and maximum angles.
  ///
  /// Corrects values if they exceed the ranges. The angles are always
  /// interpreted in clockwise orientation.
  ///
  /// [min] Angle where to start the circular sector, running clockwise, in
  /// degrees from north.
  /// The value will be normalized to \[0.0, 360.0).
  ///
  /// [max] Angle where the circular sector ends, running clockwise, in
  /// degrees from north.
  /// The value will be normalized to \[0.0, 360.0).
  ///
  /// Returns [AngleRange]. Created AngleRange from the provided minimum and maximum angles.
  ///
  static AngleRange fromMinMaxDegreesClockwise(double min, double max) => $prototype.fromMinMaxDegreesClockwise(min, max);
  /// Constructs an AngleRange from the provided center angle defining the
  /// direction and an angular width to extent the range by 50% clockwise and
  /// 50% counter-clockwise from its center angle.
  ///
  /// Corrects values if they exceed the ranges.
  /// Example: direction = 90, extent = 10 means the circle sector is pointing
  /// east, with an extent of 5 degrees north-wards and 5 degrees south-wards.
  ///
  /// [center] Start angle, running clockwise, in degrees from north.
  /// The value will be normalized to \[0.0, 360.0).
  ///
  /// [extent] The range's extent, running clockwise, in degrees from start.
  /// The value will be clamped to the range of \[0, 360\] degrees.
  ///
  /// Returns [AngleRange]. Created AngleRange from the provided center angle and the range's extent.
  ///
  static AngleRange fromDirectionDegreesClockwise(double center, double extent) => $prototype.fromDirectionDegreesClockwise(center, extent);
  /// Check if a given angle in degrees, clockwise from north is in range or not.
  ///
  /// [angleClockwiseInDegreesFromNorth] An angle in degrees from north. Will be normalized before testing.
  ///
  /// Returns [bool]. True, if an angle is in range, false otherwise.
  ///
  bool inRange(double angleClockwiseInDegreesFromNorth) => $prototype.inRange(this, angleClockwiseInDegreesFromNorth);
  /// Get the angle that is closest to the given one and in range.
  ///
  /// If the
  /// angle to both ends of the range is the same, the value in the clockwise
  /// direction is returned. If the given angle is in range already,
  /// it will be returned as normalized angle.
  ///
  /// [angleClockwiseInDegreesFromNorth] An angle in degrees from north. Will be normalized.
  ///
  /// Returns [double]. The closest, normalized in-range angle in degrees, clockwise from north.
  ///
  /// If the given angle is in range already, the given angle will be returned as
  /// normalized angle in degree, clockwise from north.
  ///
  double closestInRange(double angleClockwiseInDegreesFromNorth) => $prototype.closestInRange(this, angleClockwiseInDegreesFromNorth);
  /// Get the maximum angle defined by the range in degrees, clockwise from north,
  /// normalized to \[0,360).
  ///
  /// Returns [double]. Maximum angle of the range in degrees, clockwise from north, normalized to
  /// \[0,360).
  ///
  double max() => $prototype.max(this);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AngleRange) return false;
    AngleRange _other = other;
    return start == _other.start &&
        extent == _other.extent;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + start.hashCode;
    result = 31 * result + extent.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = AngleRange$Impl();
}


// AngleRange "private" section, not exported.

final _sdkCoreAnglerangeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('here_sdk_sdk_core_AngleRange_create_handle'));
final _sdkCoreAnglerangeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_AngleRange_release_handle'));
final _sdkCoreAnglerangeGetFieldstart = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_AngleRange_get_field_start'));
final _sdkCoreAnglerangeGetFieldextent = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_AngleRange_get_field_extent'));



/// @nodoc
@visibleForTesting
class AngleRange$Impl {
  AngleRange $init(double start, double extent) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('here_sdk_sdk_core_AngleRange_fromDegreesClockwise__Double_Double'));
    final _startHandle = (start);
    final _extentHandle = (extent);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _startHandle, _extentHandle);


    try {
      return sdkCoreAnglerangeFromFfi(__resultHandle);
    } finally {
      sdkCoreAnglerangeReleaseFfiHandle(__resultHandle);

    }

  }

  AngleRange fullCircle() {
    final _fullCircleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_core_AngleRange_fullCircle'));
    final __resultHandle = _fullCircleFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkCoreAnglerangeFromFfi(__resultHandle);
    } finally {
      sdkCoreAnglerangeReleaseFfiHandle(__resultHandle);

    }

  }

  AngleRange fromMinMaxDegreesClockwise(double min, double max) {
    final _fromMinMaxDegreesClockwiseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('here_sdk_sdk_core_AngleRange_fromMinMaxDegreesClockwise__Double_Double'));
    final _minHandle = (min);
    final _maxHandle = (max);
    final __resultHandle = _fromMinMaxDegreesClockwiseFfi(__lib.LibraryContext.isolateId, _minHandle, _maxHandle);


    try {
      return sdkCoreAnglerangeFromFfi(__resultHandle);
    } finally {
      sdkCoreAnglerangeReleaseFfiHandle(__resultHandle);

    }

  }

  AngleRange fromDirectionDegreesClockwise(double center, double extent) {
    final _fromDirectionDegreesClockwiseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('here_sdk_sdk_core_AngleRange_fromDirectionDegreesClockwise__Double_Double'));
    final _centerHandle = (center);
    final _extentHandle = (extent);
    final __resultHandle = _fromDirectionDegreesClockwiseFfi(__lib.LibraryContext.isolateId, _centerHandle, _extentHandle);


    try {
      return sdkCoreAnglerangeFromFfi(__resultHandle);
    } finally {
      sdkCoreAnglerangeReleaseFfiHandle(__resultHandle);

    }

  }

  bool inRange(AngleRange $that, double angleClockwiseInDegreesFromNorth) {
    final _inRangeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Double), int Function(Pointer<Void>, int, double)>('here_sdk_sdk_core_AngleRange_inRange__Double'));
    final _angleClockwiseInDegreesFromNorthHandle = (angleClockwiseInDegreesFromNorth);
    final _handle = sdkCoreAnglerangeToFfi($that);
    final __resultHandle = _inRangeFfi(_handle, __lib.LibraryContext.isolateId, _angleClockwiseInDegreesFromNorthHandle);
    sdkCoreAnglerangeReleaseFfiHandle(_handle);

    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  double closestInRange(AngleRange $that, double angleClockwiseInDegreesFromNorth) {
    final _closestInRangeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Double), double Function(Pointer<Void>, int, double)>('here_sdk_sdk_core_AngleRange_closestInRange__Double'));
    final _angleClockwiseInDegreesFromNorthHandle = (angleClockwiseInDegreesFromNorth);
    final _handle = sdkCoreAnglerangeToFfi($that);
    final __resultHandle = _closestInRangeFfi(_handle, __lib.LibraryContext.isolateId, _angleClockwiseInDegreesFromNorthHandle);
    sdkCoreAnglerangeReleaseFfiHandle(_handle);

    try {
      return (__resultHandle);
    } finally {


    }

  }

  double max(AngleRange $that) {
    final _maxFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_core_AngleRange_max'));
    final _handle = sdkCoreAnglerangeToFfi($that);
    final __resultHandle = _maxFfi(_handle, __lib.LibraryContext.isolateId);
    sdkCoreAnglerangeReleaseFfiHandle(_handle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

}

Pointer<Void> sdkCoreAnglerangeToFfi(AngleRange value) {
  final _startHandle = (value.start);
  final _extentHandle = (value.extent);
  final _result = _sdkCoreAnglerangeCreateHandle(_startHandle, _extentHandle);
  
  
  return _result;
}

AngleRange sdkCoreAnglerangeFromFfi(Pointer<Void> handle) {
  final _startHandle = _sdkCoreAnglerangeGetFieldstart(handle);
  final _extentHandle = _sdkCoreAnglerangeGetFieldextent(handle);
  try {
    return AngleRange._(
      (_startHandle), 
      (_extentHandle)
    );
  } finally {
    
    
  }
}

void sdkCoreAnglerangeReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreAnglerangeReleaseHandle(handle);

// Nullable AngleRange

final _sdkCoreAnglerangeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AngleRange_create_handle_nullable'));
final _sdkCoreAnglerangeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_AngleRange_release_handle_nullable'));
final _sdkCoreAnglerangeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_AngleRange_get_value_nullable'));

Pointer<Void> sdkCoreAnglerangeToFfiNullable(AngleRange? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreAnglerangeToFfi(value);
  final result = _sdkCoreAnglerangeCreateHandleNullable(_handle);
  sdkCoreAnglerangeReleaseFfiHandle(_handle);
  return result;
}

AngleRange? sdkCoreAnglerangeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreAnglerangeGetValueNullable(handle);
  final result = sdkCoreAnglerangeFromFfi(_handle);
  sdkCoreAnglerangeReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreAnglerangeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreAnglerangeReleaseHandleNullable(handle);

// End of AngleRange "private" section.


