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
import 'package:here_sdk/src/sdk/core/geo_orientation.dart';
import 'package:meta/meta.dart';


/// A GeoOrientationKeyframe consists of a GeoOrientation (camera orientation) and an animation duration.
@immutable
class GeoOrientationKeyframe {
  /// GeoOrientation keyframe value.
  final GeoOrientation value;

  /// Relative animation duration for reaching the keyframe value from previous keyframe value.
  /// Negative duration value gets clamped to 0.
  final Duration duration;

  const GeoOrientationKeyframe._(this.value, this.duration);
  /// Constructs a GeoOrientationKeyframe from the value and offset.
  ///
  /// [value] GeoOrientation keyframe value.
  ///
  /// [duration] Relative animation duration for reaching the keyframe value.
  /// Negative duration value gets clamped to 0.
  ///
  factory GeoOrientationKeyframe(GeoOrientation value, Duration duration) => $prototype.create(value, duration);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GeoOrientationKeyframe) return false;
    GeoOrientationKeyframe _other = other;
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
  static dynamic $prototype = GeoOrientationKeyframe$Impl();
}


// GeoOrientationKeyframe "private" section, not exported.

final _sdkAnimationGeoorientationkeyframeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint64),
    Pointer<Void> Function(Pointer<Void>, int)
  >('here_sdk_sdk_animation_GeoOrientationKeyframe_create_handle'));
final _sdkAnimationGeoorientationkeyframeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_GeoOrientationKeyframe_release_handle'));
final _sdkAnimationGeoorientationkeyframeGetFieldvalue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_GeoOrientationKeyframe_get_field_value'));
final _sdkAnimationGeoorientationkeyframeGetFieldduration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_GeoOrientationKeyframe_get_field_duration'));



/// @nodoc
@visibleForTesting
class GeoOrientationKeyframe$Impl {
  GeoOrientationKeyframe create(GeoOrientation value, Duration duration) {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint64), Pointer<Void> Function(int, Pointer<Void>, int)>('here_sdk_sdk_animation_GeoOrientationKeyframe_create__GeoOrientation_Duration'));
    final _valueHandle = sdkCoreGeoorientationToFfi(value);
    final _durationHandle = durationToFfi(duration);
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId, _valueHandle, _durationHandle);
    sdkCoreGeoorientationReleaseFfiHandle(_valueHandle);
    durationReleaseFfiHandle(_durationHandle);
    try {
      return sdkAnimationGeoorientationkeyframeFromFfi(__resultHandle);
    } finally {
      sdkAnimationGeoorientationkeyframeReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkAnimationGeoorientationkeyframeToFfi(GeoOrientationKeyframe value) {
  final _valueHandle = sdkCoreGeoorientationToFfi(value.value);
  final _durationHandle = durationToFfi(value.duration);
  final _result = _sdkAnimationGeoorientationkeyframeCreateHandle(_valueHandle, _durationHandle);
  sdkCoreGeoorientationReleaseFfiHandle(_valueHandle);
  durationReleaseFfiHandle(_durationHandle);
  return _result;
}

GeoOrientationKeyframe sdkAnimationGeoorientationkeyframeFromFfi(Pointer<Void> handle) {
  final _valueHandle = _sdkAnimationGeoorientationkeyframeGetFieldvalue(handle);
  final _durationHandle = _sdkAnimationGeoorientationkeyframeGetFieldduration(handle);
  try {
    return GeoOrientationKeyframe._(
      sdkCoreGeoorientationFromFfi(_valueHandle), 
      durationFromFfi(_durationHandle)
    );
  } finally {
    sdkCoreGeoorientationReleaseFfiHandle(_valueHandle);
    durationReleaseFfiHandle(_durationHandle);
  }
}

void sdkAnimationGeoorientationkeyframeReleaseFfiHandle(Pointer<Void> handle) => _sdkAnimationGeoorientationkeyframeReleaseHandle(handle);

// Nullable GeoOrientationKeyframe

final _sdkAnimationGeoorientationkeyframeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_GeoOrientationKeyframe_create_handle_nullable'));
final _sdkAnimationGeoorientationkeyframeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_GeoOrientationKeyframe_release_handle_nullable'));
final _sdkAnimationGeoorientationkeyframeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_GeoOrientationKeyframe_get_value_nullable'));

Pointer<Void> sdkAnimationGeoorientationkeyframeToFfiNullable(GeoOrientationKeyframe? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkAnimationGeoorientationkeyframeToFfi(value);
  final result = _sdkAnimationGeoorientationkeyframeCreateHandleNullable(_handle);
  sdkAnimationGeoorientationkeyframeReleaseFfiHandle(_handle);
  return result;
}

GeoOrientationKeyframe? sdkAnimationGeoorientationkeyframeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkAnimationGeoorientationkeyframeGetValueNullable(handle);
  final result = sdkAnimationGeoorientationkeyframeFromFfi(_handle);
  sdkAnimationGeoorientationkeyframeReleaseFfiHandle(_handle);
  return result;
}

void sdkAnimationGeoorientationkeyframeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationGeoorientationkeyframeReleaseHandleNullable(handle);

// End of GeoOrientationKeyframe "private" section.


