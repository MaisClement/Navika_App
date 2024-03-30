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
import 'package:meta/meta.dart';


/// A ScalarKeyframe consists of a scalar value (distance in meters) and an animation duration.
@immutable
class ScalarKeyframe {
  /// Scalar keyframe value.
  final double value;

  /// Relative animation duration for reaching the keyframe value from previous keyframe value.
  /// Negative duration value gets clamped to 0.
  final Duration duration;

  const ScalarKeyframe._(this.value, this.duration);
  /// Constructs a ScalarKeyframe from the value and offset.
  ///
  /// [value] Scalar keyframe value.
  ///
  /// [duration] Relative animation duration for reaching the keyframe value.
  /// Negative duration value gets clamped to 0.
  ///
  factory ScalarKeyframe(double value, Duration duration) => $prototype.create(value, duration);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ScalarKeyframe) return false;
    ScalarKeyframe _other = other;
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
  static dynamic $prototype = ScalarKeyframe$Impl();
}


// ScalarKeyframe "private" section, not exported.

final _sdkAnimationScalarkeyframeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Uint64),
    Pointer<Void> Function(double, int)
  >('here_sdk_sdk_animation_ScalarKeyframe_create_handle'));
final _sdkAnimationScalarkeyframeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_ScalarKeyframe_release_handle'));
final _sdkAnimationScalarkeyframeGetFieldvalue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_animation_ScalarKeyframe_get_field_value'));
final _sdkAnimationScalarkeyframeGetFieldduration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_ScalarKeyframe_get_field_duration'));



/// @nodoc
@visibleForTesting
class ScalarKeyframe$Impl {
  ScalarKeyframe create(double value, Duration duration) {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Uint64), Pointer<Void> Function(int, double, int)>('here_sdk_sdk_animation_ScalarKeyframe_create__Double_Duration'));
    final _valueHandle = (value);
    final _durationHandle = durationToFfi(duration);
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId, _valueHandle, _durationHandle);

    durationReleaseFfiHandle(_durationHandle);
    try {
      return sdkAnimationScalarkeyframeFromFfi(__resultHandle);
    } finally {
      sdkAnimationScalarkeyframeReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkAnimationScalarkeyframeToFfi(ScalarKeyframe value) {
  final _valueHandle = (value.value);
  final _durationHandle = durationToFfi(value.duration);
  final _result = _sdkAnimationScalarkeyframeCreateHandle(_valueHandle, _durationHandle);
  
  durationReleaseFfiHandle(_durationHandle);
  return _result;
}

ScalarKeyframe sdkAnimationScalarkeyframeFromFfi(Pointer<Void> handle) {
  final _valueHandle = _sdkAnimationScalarkeyframeGetFieldvalue(handle);
  final _durationHandle = _sdkAnimationScalarkeyframeGetFieldduration(handle);
  try {
    return ScalarKeyframe._(
      (_valueHandle), 
      durationFromFfi(_durationHandle)
    );
  } finally {
    
    durationReleaseFfiHandle(_durationHandle);
  }
}

void sdkAnimationScalarkeyframeReleaseFfiHandle(Pointer<Void> handle) => _sdkAnimationScalarkeyframeReleaseHandle(handle);

// Nullable ScalarKeyframe

final _sdkAnimationScalarkeyframeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_ScalarKeyframe_create_handle_nullable'));
final _sdkAnimationScalarkeyframeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_ScalarKeyframe_release_handle_nullable'));
final _sdkAnimationScalarkeyframeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_ScalarKeyframe_get_value_nullable'));

Pointer<Void> sdkAnimationScalarkeyframeToFfiNullable(ScalarKeyframe? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkAnimationScalarkeyframeToFfi(value);
  final result = _sdkAnimationScalarkeyframeCreateHandleNullable(_handle);
  sdkAnimationScalarkeyframeReleaseFfiHandle(_handle);
  return result;
}

ScalarKeyframe? sdkAnimationScalarkeyframeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkAnimationScalarkeyframeGetValueNullable(handle);
  final result = sdkAnimationScalarkeyframeFromFfi(_handle);
  sdkAnimationScalarkeyframeReleaseFfiHandle(_handle);
  return result;
}

void sdkAnimationScalarkeyframeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationScalarkeyframeReleaseHandleNullable(handle);

// End of ScalarKeyframe "private" section.


