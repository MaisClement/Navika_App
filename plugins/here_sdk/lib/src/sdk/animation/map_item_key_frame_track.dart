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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/animation/easing.dart';
import 'package:here_sdk/src/sdk/animation/easing_function.dart';
import 'package:here_sdk/src/sdk/animation/geo_coordinates_keyframe.dart';
import 'package:here_sdk/src/sdk/animation/keyframe_interpolation_mode.dart';
import 'package:here_sdk/src/sdk/animation/scalar_keyframe.dart';
import 'package:meta/meta.dart';

/// Stores keyframes for interpolation of a map item property using a specific
/// easing function and interpolation mode.
///
/// The keyframe track object
/// is used to create animations, see [MapMarkerAnimation] and [MapPolylineAnimation].
abstract class MapItemKeyFrameTrack {

  /// Creates a map item position keyframe track.
  ///
  /// It enables animations over the geographical
  /// coordinates where the map item is positioned.
  ///
  /// [keyframes] The list of keyframes that specify how the map item position changes over time.
  ///
  /// [easingFunction] The easing function to apply during keyframe interpolation.
  ///
  /// [interpolationMode] The type of interpolation done between keyframe values.
  ///
  /// Returns [MapItemKeyFrameTrack]. MapItemKeyFrameTrack instance.
  ///
  /// Throws [MapItemKeyFrameTrackInstantiationException]. If the supplied keyframe list is empty or first keyframe duration is not 0.
  ///
  @Deprecated("Will be removed in v4.19.0. Please use the method with [Easing] parameter instead.")

  static MapItemKeyFrameTrack moveTo(List<GeoCoordinatesKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) => $prototype.moveTo(keyframes, easingFunction, interpolationMode);
  /// Creates a map item position keyframe track.
  ///
  /// It enables animations over the geographical
  /// coordinates where the map item is positioned.
  ///
  /// [keyframes] The list of keyframes that specify how the map item position changes over time.
  ///
  /// [easing] The easing to apply during keyframe interpolation.
  ///
  /// [interpolationMode] The type of interpolation done between keyframe values.
  ///
  /// Returns [MapItemKeyFrameTrack]. MapItemKeyFrameTrack instance.
  ///
  /// Throws [MapItemKeyFrameTrackInstantiationException]. If the supplied keyframe list is empty or first keyframe duration is not 0.
  ///
  static MapItemKeyFrameTrack moveToWithEasing(List<GeoCoordinatesKeyframe> keyframes, Easing easing, KeyframeInterpolationMode interpolationMode) => $prototype.moveToWithEasing(keyframes, easing, interpolationMode);
  /// Creates a keyframe track used to animate the progress of a polyline.
  ///
  /// Each scalar keyframe specifies the value of [MapPolyline.progress]
  /// at key points of the animation.
  ///
  /// [keyframes] The list of keyframes that specify how the polyline progress changes
  /// over time.
  ///
  /// [easingFunction] The easing function to apply during keyframe interpolation.
  ///
  /// [interpolationMode] The type of interpolation done between keyframe values.
  ///
  /// Returns [MapItemKeyFrameTrack]. MapItemKeyFrameTrack instance.
  ///
  /// Throws [MapItemKeyFrameTrackInstantiationException]. If the supplied keyframe list is empty or first keyframe duration is not 0.
  ///
  @Deprecated("Will be removed in v4.19.0. Please use the method with [Easing] parameter instead.")

  static MapItemKeyFrameTrack polylineProgress(List<ScalarKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) => $prototype.polylineProgress(keyframes, easingFunction, interpolationMode);
  /// Creates a keyframe track used to animate the progress of a polyline.
  ///
  /// Each scalar keyframe specifies the value of [MapPolyline.progress]
  /// at key points of the animation.
  ///
  /// [keyframes] The list of keyframes that specify how the polyline progress changes
  /// over time.
  ///
  /// [easing] The easing to apply during keyframe interpolation.
  ///
  /// [interpolationMode] The type of interpolation done between keyframe values.
  ///
  /// Returns [MapItemKeyFrameTrack]. MapItemKeyFrameTrack instance.
  ///
  /// Throws [MapItemKeyFrameTrackInstantiationException]. If the supplied keyframe list is empty or first keyframe duration is not 0.
  ///
  static MapItemKeyFrameTrack polylineProgressWithEasing(List<ScalarKeyframe> keyframes, Easing easing, KeyframeInterpolationMode interpolationMode) => $prototype.polylineProgressWithEasing(keyframes, easing, interpolationMode);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapItemKeyFrameTrack$Impl(Pointer<Void>.fromAddress(0));
}

/// Describes a reason for failing to create a [MapItemKeyFrameTrack].
enum MapItemKeyFrameTrackInstantiationErrorCode {
    /// List of keyframes is empty.
    emptyKeyframeList,
    /// Duration of first keyframe is not 0, which is invalid.
    invalidKeyframeDuration
}

// MapItemKeyFrameTrackInstantiationErrorCode "private" section, not exported.

int sdkAnimationMapitemkeyframetrackInstantiationerrorcodeToFfi(MapItemKeyFrameTrackInstantiationErrorCode value) {
  switch (value) {
  case MapItemKeyFrameTrackInstantiationErrorCode.emptyKeyframeList:
    return 1;
  case MapItemKeyFrameTrackInstantiationErrorCode.invalidKeyframeDuration:
    return 2;
  default:
    throw StateError("Invalid enum value $value for MapItemKeyFrameTrackInstantiationErrorCode enum.");
  }
}

MapItemKeyFrameTrackInstantiationErrorCode sdkAnimationMapitemkeyframetrackInstantiationerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return MapItemKeyFrameTrackInstantiationErrorCode.emptyKeyframeList;
  case 2:
    return MapItemKeyFrameTrackInstantiationErrorCode.invalidKeyframeDuration;
  default:
    throw StateError("Invalid numeric value $handle for MapItemKeyFrameTrackInstantiationErrorCode enum.");
  }
}

void sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseFfiHandle(int handle) {}

final _sdkAnimationMapitemkeyframetrackInstantiationerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_InstantiationErrorCode_create_handle_nullable'));
final _sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_InstantiationErrorCode_release_handle_nullable'));
final _sdkAnimationMapitemkeyframetrackInstantiationerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdkAnimationMapitemkeyframetrackInstantiationerrorcodeToFfiNullable(MapItemKeyFrameTrackInstantiationErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkAnimationMapitemkeyframetrackInstantiationerrorcodeToFfi(value);
  final result = _sdkAnimationMapitemkeyframetrackInstantiationerrorcodeCreateHandleNullable(_handle);
  sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

MapItemKeyFrameTrackInstantiationErrorCode? sdkAnimationMapitemkeyframetrackInstantiationerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkAnimationMapitemkeyframetrackInstantiationerrorcodeGetValueNullable(handle);
  final result = sdkAnimationMapitemkeyframetrackInstantiationerrorcodeFromFfi(_handle);
  sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseHandleNullable(handle);

// End of MapItemKeyFrameTrackInstantiationErrorCode "private" section.
/// Thrown when a problem occurs while trying to create [MapItemKeyFrameTrack].
class MapItemKeyFrameTrackInstantiationException implements Exception {
  final MapItemKeyFrameTrackInstantiationErrorCode error;
  MapItemKeyFrameTrackInstantiationException(this.error);
}

// MapItemKeyFrameTrack "private" section, not exported.

final _sdkAnimationMapitemkeyframetrackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_register_finalizer'));
final _sdkAnimationMapitemkeyframetrackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_copy_handle'));
final _sdkAnimationMapitemkeyframetrackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_release_handle'));


final _moveTosdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingfunctionKeyframeinterpolationmodeReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_moveTo__ListOf_sdk_animation_GeoCoordinatesKeyframe_EasingFunction_KeyframeInterpolationMode_return_release_handle'));
final _moveTosdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingfunctionKeyframeinterpolationmodeReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_moveTo__ListOf_sdk_animation_GeoCoordinatesKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_result'));
final _moveTosdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingfunctionKeyframeinterpolationmodeReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_moveTo__ListOf_sdk_animation_GeoCoordinatesKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_error'));
final _moveTosdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingfunctionKeyframeinterpolationmodeReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_moveTo__ListOf_sdk_animation_GeoCoordinatesKeyframe_EasingFunction_KeyframeInterpolationMode_return_has_error'));


final _moveToWithEasingsdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingKeyframeinterpolationmodeReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_moveTo__ListOf_sdk_animation_GeoCoordinatesKeyframe_Easing_KeyframeInterpolationMode_return_release_handle'));
final _moveToWithEasingsdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingKeyframeinterpolationmodeReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_moveTo__ListOf_sdk_animation_GeoCoordinatesKeyframe_Easing_KeyframeInterpolationMode_return_get_result'));
final _moveToWithEasingsdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingKeyframeinterpolationmodeReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_moveTo__ListOf_sdk_animation_GeoCoordinatesKeyframe_Easing_KeyframeInterpolationMode_return_get_error'));
final _moveToWithEasingsdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingKeyframeinterpolationmodeReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_moveTo__ListOf_sdk_animation_GeoCoordinatesKeyframe_Easing_KeyframeInterpolationMode_return_has_error'));


final _polylineProgresssdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingfunctionKeyframeinterpolationmodeReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_polylineProgress__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_release_handle'));
final _polylineProgresssdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingfunctionKeyframeinterpolationmodeReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_polylineProgress__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_result'));
final _polylineProgresssdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingfunctionKeyframeinterpolationmodeReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_polylineProgress__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_error'));
final _polylineProgresssdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingfunctionKeyframeinterpolationmodeReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_polylineProgress__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode_return_has_error'));


final _polylineProgressWithEasingsdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingKeyframeinterpolationmodeReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_polylineProgress__ListOf_sdk_animation_ScalarKeyframe_Easing_KeyframeInterpolationMode_return_release_handle'));
final _polylineProgressWithEasingsdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingKeyframeinterpolationmodeReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_polylineProgress__ListOf_sdk_animation_ScalarKeyframe_Easing_KeyframeInterpolationMode_return_get_result'));
final _polylineProgressWithEasingsdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingKeyframeinterpolationmodeReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_polylineProgress__ListOf_sdk_animation_ScalarKeyframe_Easing_KeyframeInterpolationMode_return_get_error'));
final _polylineProgressWithEasingsdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingKeyframeinterpolationmodeReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_polylineProgress__ListOf_sdk_animation_ScalarKeyframe_Easing_KeyframeInterpolationMode_return_has_error'));


/// @nodoc
@visibleForTesting
class MapItemKeyFrameTrack$Impl extends __lib.NativeBase implements MapItemKeyFrameTrack {

  MapItemKeyFrameTrack$Impl(Pointer<Void> handle) : super(handle);

  MapItemKeyFrameTrack moveTo(List<GeoCoordinatesKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) {
    final _moveToFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_animation_MapItemKeyFrameTrack_moveTo__ListOf_sdk_animation_GeoCoordinatesKeyframe_EasingFunction_KeyframeInterpolationMode'));
    final _keyframesHandle = harpSdkBindingslistofSdkAnimationGeocoordinateskeyframeToFfi(keyframes);
    final _easingFunctionHandle = sdkAnimationEasingfunctionToFfi(easingFunction);
    final _interpolationModeHandle = sdkAnimationKeyframeinterpolationmodeToFfi(interpolationMode);
    final __callResultHandle = _moveToFfi(__lib.LibraryContext.isolateId, _keyframesHandle, _easingFunctionHandle, _interpolationModeHandle);
    harpSdkBindingslistofSdkAnimationGeocoordinateskeyframeReleaseFfiHandle(_keyframesHandle);
    sdkAnimationEasingfunctionReleaseFfiHandle(_easingFunctionHandle);
    sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(_interpolationModeHandle);
    if (_moveTosdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingfunctionKeyframeinterpolationmodeReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _moveTosdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingfunctionKeyframeinterpolationmodeReturnGetError(__callResultHandle);
        _moveTosdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingfunctionKeyframeinterpolationmodeReturnReleaseHandle(__callResultHandle);
        try {
          throw MapItemKeyFrameTrackInstantiationException(sdkAnimationMapitemkeyframetrackInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _moveTosdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingfunctionKeyframeinterpolationmodeReturnGetResult(__callResultHandle);
    _moveTosdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingfunctionKeyframeinterpolationmodeReturnReleaseHandle(__callResultHandle);
    try {
      return sdkAnimationMapitemkeyframetrackFromFfi(__resultHandle);
    } finally {
      sdkAnimationMapitemkeyframetrackReleaseFfiHandle(__resultHandle);

    }

  }

  MapItemKeyFrameTrack moveToWithEasing(List<GeoCoordinatesKeyframe> keyframes, Easing easing, KeyframeInterpolationMode interpolationMode) {
    final _moveToWithEasingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Uint32), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, int)>('here_sdk_sdk_animation_MapItemKeyFrameTrack_moveTo__ListOf_sdk_animation_GeoCoordinatesKeyframe_Easing_KeyframeInterpolationMode'));
    final _keyframesHandle = harpSdkBindingslistofSdkAnimationGeocoordinateskeyframeToFfi(keyframes);
    final _easingHandle = sdkAnimationEasingToFfi(easing);
    final _interpolationModeHandle = sdkAnimationKeyframeinterpolationmodeToFfi(interpolationMode);
    final __callResultHandle = _moveToWithEasingFfi(__lib.LibraryContext.isolateId, _keyframesHandle, _easingHandle, _interpolationModeHandle);
    harpSdkBindingslistofSdkAnimationGeocoordinateskeyframeReleaseFfiHandle(_keyframesHandle);
    sdkAnimationEasingReleaseFfiHandle(_easingHandle);
    sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(_interpolationModeHandle);
    if (_moveToWithEasingsdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingKeyframeinterpolationmodeReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _moveToWithEasingsdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingKeyframeinterpolationmodeReturnGetError(__callResultHandle);
        _moveToWithEasingsdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingKeyframeinterpolationmodeReturnReleaseHandle(__callResultHandle);
        try {
          throw MapItemKeyFrameTrackInstantiationException(sdkAnimationMapitemkeyframetrackInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _moveToWithEasingsdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingKeyframeinterpolationmodeReturnGetResult(__callResultHandle);
    _moveToWithEasingsdkAnimationMapitemkeyframetrackMovetoListofSdkAnimationGeocoordinateskeyframeEasingKeyframeinterpolationmodeReturnReleaseHandle(__callResultHandle);
    try {
      return sdkAnimationMapitemkeyframetrackFromFfi(__resultHandle);
    } finally {
      sdkAnimationMapitemkeyframetrackReleaseFfiHandle(__resultHandle);

    }

  }

  MapItemKeyFrameTrack polylineProgress(List<ScalarKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) {
    final _polylineProgressFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_animation_MapItemKeyFrameTrack_polylineProgress__ListOf_sdk_animation_ScalarKeyframe_EasingFunction_KeyframeInterpolationMode'));
    final _keyframesHandle = harpSdkBindingslistofSdkAnimationScalarkeyframeToFfi(keyframes);
    final _easingFunctionHandle = sdkAnimationEasingfunctionToFfi(easingFunction);
    final _interpolationModeHandle = sdkAnimationKeyframeinterpolationmodeToFfi(interpolationMode);
    final __callResultHandle = _polylineProgressFfi(__lib.LibraryContext.isolateId, _keyframesHandle, _easingFunctionHandle, _interpolationModeHandle);
    harpSdkBindingslistofSdkAnimationScalarkeyframeReleaseFfiHandle(_keyframesHandle);
    sdkAnimationEasingfunctionReleaseFfiHandle(_easingFunctionHandle);
    sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(_interpolationModeHandle);
    if (_polylineProgresssdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingfunctionKeyframeinterpolationmodeReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _polylineProgresssdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingfunctionKeyframeinterpolationmodeReturnGetError(__callResultHandle);
        _polylineProgresssdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingfunctionKeyframeinterpolationmodeReturnReleaseHandle(__callResultHandle);
        try {
          throw MapItemKeyFrameTrackInstantiationException(sdkAnimationMapitemkeyframetrackInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _polylineProgresssdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingfunctionKeyframeinterpolationmodeReturnGetResult(__callResultHandle);
    _polylineProgresssdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingfunctionKeyframeinterpolationmodeReturnReleaseHandle(__callResultHandle);
    try {
      return sdkAnimationMapitemkeyframetrackFromFfi(__resultHandle);
    } finally {
      sdkAnimationMapitemkeyframetrackReleaseFfiHandle(__resultHandle);

    }

  }

  MapItemKeyFrameTrack polylineProgressWithEasing(List<ScalarKeyframe> keyframes, Easing easing, KeyframeInterpolationMode interpolationMode) {
    final _polylineProgressWithEasingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Uint32), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, int)>('here_sdk_sdk_animation_MapItemKeyFrameTrack_polylineProgress__ListOf_sdk_animation_ScalarKeyframe_Easing_KeyframeInterpolationMode'));
    final _keyframesHandle = harpSdkBindingslistofSdkAnimationScalarkeyframeToFfi(keyframes);
    final _easingHandle = sdkAnimationEasingToFfi(easing);
    final _interpolationModeHandle = sdkAnimationKeyframeinterpolationmodeToFfi(interpolationMode);
    final __callResultHandle = _polylineProgressWithEasingFfi(__lib.LibraryContext.isolateId, _keyframesHandle, _easingHandle, _interpolationModeHandle);
    harpSdkBindingslistofSdkAnimationScalarkeyframeReleaseFfiHandle(_keyframesHandle);
    sdkAnimationEasingReleaseFfiHandle(_easingHandle);
    sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(_interpolationModeHandle);
    if (_polylineProgressWithEasingsdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingKeyframeinterpolationmodeReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _polylineProgressWithEasingsdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingKeyframeinterpolationmodeReturnGetError(__callResultHandle);
        _polylineProgressWithEasingsdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingKeyframeinterpolationmodeReturnReleaseHandle(__callResultHandle);
        try {
          throw MapItemKeyFrameTrackInstantiationException(sdkAnimationMapitemkeyframetrackInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _polylineProgressWithEasingsdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingKeyframeinterpolationmodeReturnGetResult(__callResultHandle);
    _polylineProgressWithEasingsdkAnimationMapitemkeyframetrackPolylineprogressListofSdkAnimationScalarkeyframeEasingKeyframeinterpolationmodeReturnReleaseHandle(__callResultHandle);
    try {
      return sdkAnimationMapitemkeyframetrackFromFfi(__resultHandle);
    } finally {
      sdkAnimationMapitemkeyframetrackReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkAnimationMapitemkeyframetrackToFfi(MapItemKeyFrameTrack value) =>
  _sdkAnimationMapitemkeyframetrackCopyHandle((value as __lib.NativeBase).handle);

MapItemKeyFrameTrack sdkAnimationMapitemkeyframetrackFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapItemKeyFrameTrack) return instance;

  final _copiedHandle = _sdkAnimationMapitemkeyframetrackCopyHandle(handle);
  final result = MapItemKeyFrameTrack$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkAnimationMapitemkeyframetrackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkAnimationMapitemkeyframetrackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkAnimationMapitemkeyframetrackReleaseHandle(handle);

Pointer<Void> sdkAnimationMapitemkeyframetrackToFfiNullable(MapItemKeyFrameTrack? value) =>
  value != null ? sdkAnimationMapitemkeyframetrackToFfi(value) : Pointer<Void>.fromAddress(0);

MapItemKeyFrameTrack? sdkAnimationMapitemkeyframetrackFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkAnimationMapitemkeyframetrackFromFfi(handle) : null;

void sdkAnimationMapitemkeyframetrackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationMapitemkeyframetrackReleaseHandle(handle);

// End of MapItemKeyFrameTrack "private" section.


