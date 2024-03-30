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
import 'package:here_sdk/src/sdk/core/anchor2_d.dart';
import 'package:meta/meta.dart';


/// An Anchor2D keyframe.
///
/// A keyframe consists of a value and an animation duration.
@immutable
class Anchor2DKeyframe {
  /// Anchor2D keyframe value.
  final Anchor2D value;

  /// Relative animation duration for reaching the keyframe value.
  /// Negative duration value gets clamped to 0.
  final Duration duration;

  const Anchor2DKeyframe._(this.value, this.duration);
  /// Constructs a Anchor2DKeyframe from the value and offset.
  ///
  /// [value] Anchor2D keyframe value.
  ///
  /// [duration] Relative animation duration for reaching the keyframe value.
  /// Negative duration value gets clamped to 0.
  ///
  factory Anchor2DKeyframe(Anchor2D value, Duration duration) => $prototype.create(value, duration);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Anchor2DKeyframe) return false;
    Anchor2DKeyframe _other = other;
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
  static dynamic $prototype = Anchor2DKeyframe$Impl();
}


// Anchor2DKeyframe "private" section, not exported.

final _sdkAnimationAnchor2dkeyframeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint64),
    Pointer<Void> Function(Pointer<Void>, int)
  >('here_sdk_sdk_animation_Anchor2DKeyframe_create_handle'));
final _sdkAnimationAnchor2dkeyframeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Anchor2DKeyframe_release_handle'));
final _sdkAnimationAnchor2dkeyframeGetFieldvalue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Anchor2DKeyframe_get_field_value'));
final _sdkAnimationAnchor2dkeyframeGetFieldduration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Anchor2DKeyframe_get_field_duration'));



/// @nodoc
@visibleForTesting
class Anchor2DKeyframe$Impl {
  Anchor2DKeyframe create(Anchor2D value, Duration duration) {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint64), Pointer<Void> Function(int, Pointer<Void>, int)>('here_sdk_sdk_animation_Anchor2DKeyframe_create__Anchor2D_Duration'));
    final _valueHandle = sdkCoreAnchor2dToFfi(value);
    final _durationHandle = durationToFfi(duration);
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId, _valueHandle, _durationHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_valueHandle);
    durationReleaseFfiHandle(_durationHandle);
    try {
      return sdkAnimationAnchor2dkeyframeFromFfi(__resultHandle);
    } finally {
      sdkAnimationAnchor2dkeyframeReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkAnimationAnchor2dkeyframeToFfi(Anchor2DKeyframe value) {
  final _valueHandle = sdkCoreAnchor2dToFfi(value.value);
  final _durationHandle = durationToFfi(value.duration);
  final _result = _sdkAnimationAnchor2dkeyframeCreateHandle(_valueHandle, _durationHandle);
  sdkCoreAnchor2dReleaseFfiHandle(_valueHandle);
  durationReleaseFfiHandle(_durationHandle);
  return _result;
}

Anchor2DKeyframe sdkAnimationAnchor2dkeyframeFromFfi(Pointer<Void> handle) {
  final _valueHandle = _sdkAnimationAnchor2dkeyframeGetFieldvalue(handle);
  final _durationHandle = _sdkAnimationAnchor2dkeyframeGetFieldduration(handle);
  try {
    return Anchor2DKeyframe._(
      sdkCoreAnchor2dFromFfi(_valueHandle), 
      durationFromFfi(_durationHandle)
    );
  } finally {
    sdkCoreAnchor2dReleaseFfiHandle(_valueHandle);
    durationReleaseFfiHandle(_durationHandle);
  }
}

void sdkAnimationAnchor2dkeyframeReleaseFfiHandle(Pointer<Void> handle) => _sdkAnimationAnchor2dkeyframeReleaseHandle(handle);

// Nullable Anchor2DKeyframe

final _sdkAnimationAnchor2dkeyframeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Anchor2DKeyframe_create_handle_nullable'));
final _sdkAnimationAnchor2dkeyframeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Anchor2DKeyframe_release_handle_nullable'));
final _sdkAnimationAnchor2dkeyframeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Anchor2DKeyframe_get_value_nullable'));

Pointer<Void> sdkAnimationAnchor2dkeyframeToFfiNullable(Anchor2DKeyframe? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkAnimationAnchor2dkeyframeToFfi(value);
  final result = _sdkAnimationAnchor2dkeyframeCreateHandleNullable(_handle);
  sdkAnimationAnchor2dkeyframeReleaseFfiHandle(_handle);
  return result;
}

Anchor2DKeyframe? sdkAnimationAnchor2dkeyframeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkAnimationAnchor2dkeyframeGetValueNullable(handle);
  final result = sdkAnimationAnchor2dkeyframeFromFfi(_handle);
  sdkAnimationAnchor2dkeyframeReleaseFfiHandle(_handle);
  return result;
}

void sdkAnimationAnchor2dkeyframeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationAnchor2dkeyframeReleaseHandleNullable(handle);

// End of Anchor2DKeyframe "private" section.


