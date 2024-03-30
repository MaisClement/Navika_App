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
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:meta/meta.dart';


/// A Point2D keyframe.
///
/// A keyframe consists of a value and an animation duration.
@immutable
class Point2DKeyframe {
  /// Point2D keyframe value.
  final Point2D value;

  /// Relative animation duration for reaching the keyframe value.
  /// Negative duration value gets clamped to 0.
  final Duration duration;

  const Point2DKeyframe._(this.value, this.duration);
  /// Constructs a Point2DKeyframe from the value and offset.
  ///
  /// [value] Point2D keyframe value.
  ///
  /// [duration] Relative animation duration for reaching the keyframe value.
  /// Negative duration value gets clamped to 0.
  ///
  factory Point2DKeyframe(Point2D value, Duration duration) => $prototype.create(value, duration);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Point2DKeyframe) return false;
    Point2DKeyframe _other = other;
    return value == _other.value &&
        duration == _other.duration;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + value.hashCode;
    result = 31 * result + duration.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Point2DKeyframe$Impl();
}


// Point2DKeyframe "private" section, not exported.

final _sdkAnimationPoint2dkeyframeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint64),
    Pointer<Void> Function(Pointer<Void>, int)
  >('here_sdk_sdk_animation_Point2DKeyframe_create_handle'));
final _sdkAnimationPoint2dkeyframeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Point2DKeyframe_release_handle'));
final _sdkAnimationPoint2dkeyframeGetFieldvalue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Point2DKeyframe_get_field_value'));
final _sdkAnimationPoint2dkeyframeGetFieldduration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Point2DKeyframe_get_field_duration'));



/// @nodoc
@visibleForTesting
class Point2DKeyframe$Impl {
  Point2DKeyframe create(Point2D value, Duration duration) {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint64), Pointer<Void> Function(int, Pointer<Void>, int)>('here_sdk_sdk_animation_Point2DKeyframe_create__Point2D_Duration'));
    final _valueHandle = sdkCorePoint2dToFfi(value);
    final _durationHandle = durationToFfi(duration);
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId, _valueHandle, _durationHandle);
    sdkCorePoint2dReleaseFfiHandle(_valueHandle);
    durationReleaseFfiHandle(_durationHandle);
    try {
      return sdkAnimationPoint2dkeyframeFromFfi(__resultHandle);
    } finally {
      sdkAnimationPoint2dkeyframeReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkAnimationPoint2dkeyframeToFfi(Point2DKeyframe value) {
  final _valueHandle = sdkCorePoint2dToFfi(value.value);
  final _durationHandle = durationToFfi(value.duration);
  final _result = _sdkAnimationPoint2dkeyframeCreateHandle(_valueHandle, _durationHandle);
  sdkCorePoint2dReleaseFfiHandle(_valueHandle);
  durationReleaseFfiHandle(_durationHandle);
  return _result;
}

Point2DKeyframe sdkAnimationPoint2dkeyframeFromFfi(Pointer<Void> handle) {
  final _valueHandle = _sdkAnimationPoint2dkeyframeGetFieldvalue(handle);
  final _durationHandle = _sdkAnimationPoint2dkeyframeGetFieldduration(handle);
  try {
    return Point2DKeyframe._(
      sdkCorePoint2dFromFfi(_valueHandle), 
      durationFromFfi(_durationHandle)
    );
  } finally {
    sdkCorePoint2dReleaseFfiHandle(_valueHandle);
    durationReleaseFfiHandle(_durationHandle);
  }
}

void sdkAnimationPoint2dkeyframeReleaseFfiHandle(Pointer<Void> handle) => _sdkAnimationPoint2dkeyframeReleaseHandle(handle);

// Nullable Point2DKeyframe

final _sdkAnimationPoint2dkeyframeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Point2DKeyframe_create_handle_nullable'));
final _sdkAnimationPoint2dkeyframeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Point2DKeyframe_release_handle_nullable'));
final _sdkAnimationPoint2dkeyframeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Point2DKeyframe_get_value_nullable'));

Pointer<Void> sdkAnimationPoint2dkeyframeToFfiNullable(Point2DKeyframe? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkAnimationPoint2dkeyframeToFfi(value);
  final result = _sdkAnimationPoint2dkeyframeCreateHandleNullable(_handle);
  sdkAnimationPoint2dkeyframeReleaseFfiHandle(_handle);
  return result;
}

Point2DKeyframe? sdkAnimationPoint2dkeyframeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkAnimationPoint2dkeyframeGetValueNullable(handle);
  final result = sdkAnimationPoint2dkeyframeFromFfi(_handle);
  sdkAnimationPoint2dkeyframeReleaseFfiHandle(_handle);
  return result;
}

void sdkAnimationPoint2dkeyframeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationPoint2dkeyframeReleaseHandleNullable(handle);

// End of Point2DKeyframe "private" section.


