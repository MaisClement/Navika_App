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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:meta/meta.dart';


/// A GeoCoordinatesKeyframe consists of a GeoCoordinates and an animation duration.
@immutable
class GeoCoordinatesKeyframe {
  /// GeoCoordinates keyframe value.
  /// Altitude component is ignored.
  final GeoCoordinates value;

  /// Relative animation duration for reaching the keyframe value from previous keyframe value.
  /// Negative duration value gets clamped to 0.
  final Duration duration;

  const GeoCoordinatesKeyframe._(this.value, this.duration);
  /// Constructs a GeoCoordinatesKeyframe from the value and offset.
  ///
  /// [value] GeoCoordinates keyframe value.
  ///
  /// [duration] Relative animation duration for reaching the keyframe value.
  /// Negative duration value gets clamped to 0.
  ///
  factory GeoCoordinatesKeyframe(GeoCoordinates value, Duration duration) => $prototype.create(value, duration);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GeoCoordinatesKeyframe) return false;
    GeoCoordinatesKeyframe _other = other;
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
  static dynamic $prototype = GeoCoordinatesKeyframe$Impl();
}


// GeoCoordinatesKeyframe "private" section, not exported.

final _sdkAnimationGeocoordinateskeyframeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint64),
    Pointer<Void> Function(Pointer<Void>, int)
  >('here_sdk_sdk_animation_GeoCoordinatesKeyframe_create_handle'));
final _sdkAnimationGeocoordinateskeyframeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_GeoCoordinatesKeyframe_release_handle'));
final _sdkAnimationGeocoordinateskeyframeGetFieldvalue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_GeoCoordinatesKeyframe_get_field_value'));
final _sdkAnimationGeocoordinateskeyframeGetFieldduration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_GeoCoordinatesKeyframe_get_field_duration'));



/// @nodoc
@visibleForTesting
class GeoCoordinatesKeyframe$Impl {
  GeoCoordinatesKeyframe create(GeoCoordinates value, Duration duration) {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint64), Pointer<Void> Function(int, Pointer<Void>, int)>('here_sdk_sdk_animation_GeoCoordinatesKeyframe_create__GeoCoordinates_Duration'));
    final _valueHandle = sdkCoreGeocoordinatesToFfi(value);
    final _durationHandle = durationToFfi(duration);
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId, _valueHandle, _durationHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_valueHandle);
    durationReleaseFfiHandle(_durationHandle);
    try {
      return sdkAnimationGeocoordinateskeyframeFromFfi(__resultHandle);
    } finally {
      sdkAnimationGeocoordinateskeyframeReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkAnimationGeocoordinateskeyframeToFfi(GeoCoordinatesKeyframe value) {
  final _valueHandle = sdkCoreGeocoordinatesToFfi(value.value);
  final _durationHandle = durationToFfi(value.duration);
  final _result = _sdkAnimationGeocoordinateskeyframeCreateHandle(_valueHandle, _durationHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_valueHandle);
  durationReleaseFfiHandle(_durationHandle);
  return _result;
}

GeoCoordinatesKeyframe sdkAnimationGeocoordinateskeyframeFromFfi(Pointer<Void> handle) {
  final _valueHandle = _sdkAnimationGeocoordinateskeyframeGetFieldvalue(handle);
  final _durationHandle = _sdkAnimationGeocoordinateskeyframeGetFieldduration(handle);
  try {
    return GeoCoordinatesKeyframe._(
      sdkCoreGeocoordinatesFromFfi(_valueHandle), 
      durationFromFfi(_durationHandle)
    );
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandle(_valueHandle);
    durationReleaseFfiHandle(_durationHandle);
  }
}

void sdkAnimationGeocoordinateskeyframeReleaseFfiHandle(Pointer<Void> handle) => _sdkAnimationGeocoordinateskeyframeReleaseHandle(handle);

// Nullable GeoCoordinatesKeyframe

final _sdkAnimationGeocoordinateskeyframeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_GeoCoordinatesKeyframe_create_handle_nullable'));
final _sdkAnimationGeocoordinateskeyframeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_GeoCoordinatesKeyframe_release_handle_nullable'));
final _sdkAnimationGeocoordinateskeyframeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_GeoCoordinatesKeyframe_get_value_nullable'));

Pointer<Void> sdkAnimationGeocoordinateskeyframeToFfiNullable(GeoCoordinatesKeyframe? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkAnimationGeocoordinateskeyframeToFfi(value);
  final result = _sdkAnimationGeocoordinateskeyframeCreateHandleNullable(_handle);
  sdkAnimationGeocoordinateskeyframeReleaseFfiHandle(_handle);
  return result;
}

GeoCoordinatesKeyframe? sdkAnimationGeocoordinateskeyframeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkAnimationGeocoordinateskeyframeGetValueNullable(handle);
  final result = sdkAnimationGeocoordinateskeyframeFromFfi(_handle);
  sdkAnimationGeocoordinateskeyframeReleaseFfiHandle(_handle);
  return result;
}

void sdkAnimationGeocoordinateskeyframeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationGeocoordinateskeyframeReleaseHandleNullable(handle);

// End of GeoCoordinatesKeyframe "private" section.


