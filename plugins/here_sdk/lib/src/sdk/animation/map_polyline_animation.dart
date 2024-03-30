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
import 'package:here_sdk/src/sdk/animation/map_item_key_frame_track.dart';
import 'package:meta/meta.dart';

/// An animation that can be applied to the [MapPolyline] object.
abstract class MapPolylineAnimation {
  /// Creates an animation of [MapPolyline] based on provided keyframe track.
  ///
  /// Supports tracks created with [MapItemKeyFrameTrack] 'polylineProgress*' methods.
  /// For starting the animation, see [MapPolyline.startAnimation].
  ///
  /// [track] The track holding the keyframes for the animation.
  ///
  /// Throws [MapPolylineAnimationInstantiationException]. If the specified keyframe track cannot be used to create animation of a [MapPolyline].
  ///
  factory MapPolylineAnimation(MapItemKeyFrameTrack track) => $prototype.$init(track);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapPolylineAnimation$Impl(Pointer<Void>.fromAddress(0));
}

/// Describes a reason for failing to create a [MapPolylineAnimation].
enum MapPolylineAnimationInstantiationErrorCode {
    /// Incompatible type of track provided.
    incompatibleTrack
}

// MapPolylineAnimationInstantiationErrorCode "private" section, not exported.

int sdkAnimationMappolylineanimationInstantiationerrorcodeToFfi(MapPolylineAnimationInstantiationErrorCode value) {
  switch (value) {
  case MapPolylineAnimationInstantiationErrorCode.incompatibleTrack:
    return 0;
  default:
    throw StateError("Invalid enum value $value for MapPolylineAnimationInstantiationErrorCode enum.");
  }
}

MapPolylineAnimationInstantiationErrorCode sdkAnimationMappolylineanimationInstantiationerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MapPolylineAnimationInstantiationErrorCode.incompatibleTrack;
  default:
    throw StateError("Invalid numeric value $handle for MapPolylineAnimationInstantiationErrorCode enum.");
  }
}

void sdkAnimationMappolylineanimationInstantiationerrorcodeReleaseFfiHandle(int handle) {}

final _sdkAnimationMappolylineanimationInstantiationerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_animation_MapPolylineAnimation_InstantiationErrorCode_create_handle_nullable'));
final _sdkAnimationMappolylineanimationInstantiationerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapPolylineAnimation_InstantiationErrorCode_release_handle_nullable'));
final _sdkAnimationMappolylineanimationInstantiationerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapPolylineAnimation_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdkAnimationMappolylineanimationInstantiationerrorcodeToFfiNullable(MapPolylineAnimationInstantiationErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkAnimationMappolylineanimationInstantiationerrorcodeToFfi(value);
  final result = _sdkAnimationMappolylineanimationInstantiationerrorcodeCreateHandleNullable(_handle);
  sdkAnimationMappolylineanimationInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

MapPolylineAnimationInstantiationErrorCode? sdkAnimationMappolylineanimationInstantiationerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkAnimationMappolylineanimationInstantiationerrorcodeGetValueNullable(handle);
  final result = sdkAnimationMappolylineanimationInstantiationerrorcodeFromFfi(_handle);
  sdkAnimationMappolylineanimationInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkAnimationMappolylineanimationInstantiationerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationMappolylineanimationInstantiationerrorcodeReleaseHandleNullable(handle);

// End of MapPolylineAnimationInstantiationErrorCode "private" section.
/// Thrown when a problem occurs while trying to create a [MapPolylineAnimation].
class MapPolylineAnimationInstantiationException implements Exception {
  final MapPolylineAnimationInstantiationErrorCode error;
  MapPolylineAnimationInstantiationException(this.error);
}

// MapPolylineAnimation "private" section, not exported.

final _sdkAnimationMappolylineanimationRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_animation_MapPolylineAnimation_register_finalizer'));
final _sdkAnimationMappolylineanimationCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapPolylineAnimation_copy_handle'));
final _sdkAnimationMappolylineanimationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapPolylineAnimation_release_handle'));


final _$initsdkAnimationMappolylineanimationMakeMapitemkeyframetrackReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapPolylineAnimation_make__MapItemKeyFrameTrack_return_release_handle'));
final _$initsdkAnimationMappolylineanimationMakeMapitemkeyframetrackReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapPolylineAnimation_make__MapItemKeyFrameTrack_return_get_result'));
final _$initsdkAnimationMappolylineanimationMakeMapitemkeyframetrackReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapPolylineAnimation_make__MapItemKeyFrameTrack_return_get_error'));
final _$initsdkAnimationMappolylineanimationMakeMapitemkeyframetrackReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapPolylineAnimation_make__MapItemKeyFrameTrack_return_has_error'));


/// @nodoc
@visibleForTesting
class MapPolylineAnimation$Impl extends __lib.NativeBase implements MapPolylineAnimation {

  MapPolylineAnimation$Impl(Pointer<Void> handle) : super(handle);


  MapPolylineAnimation $init(MapItemKeyFrameTrack track) {
    final _result_handle = _$init(track);
    final _result = MapPolylineAnimation$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkAnimationMappolylineanimationRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(MapItemKeyFrameTrack track) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_animation_MapPolylineAnimation_make__MapItemKeyFrameTrack'));
    final _trackHandle = sdkAnimationMapitemkeyframetrackToFfi(track);
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId, _trackHandle);
    sdkAnimationMapitemkeyframetrackReleaseFfiHandle(_trackHandle);
    if (_$initsdkAnimationMappolylineanimationMakeMapitemkeyframetrackReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsdkAnimationMappolylineanimationMakeMapitemkeyframetrackReturnGetError(__callResultHandle);
        _$initsdkAnimationMappolylineanimationMakeMapitemkeyframetrackReturnReleaseHandle(__callResultHandle);
        try {
          throw MapPolylineAnimationInstantiationException(sdkAnimationMappolylineanimationInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkAnimationMappolylineanimationInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsdkAnimationMappolylineanimationMakeMapitemkeyframetrackReturnGetResult(__callResultHandle);
    _$initsdkAnimationMappolylineanimationMakeMapitemkeyframetrackReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }


}

Pointer<Void> sdkAnimationMappolylineanimationToFfi(MapPolylineAnimation value) =>
  _sdkAnimationMappolylineanimationCopyHandle((value as __lib.NativeBase).handle);

MapPolylineAnimation sdkAnimationMappolylineanimationFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapPolylineAnimation) return instance;

  final _copiedHandle = _sdkAnimationMappolylineanimationCopyHandle(handle);
  final result = MapPolylineAnimation$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkAnimationMappolylineanimationRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkAnimationMappolylineanimationReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkAnimationMappolylineanimationReleaseHandle(handle);

Pointer<Void> sdkAnimationMappolylineanimationToFfiNullable(MapPolylineAnimation? value) =>
  value != null ? sdkAnimationMappolylineanimationToFfi(value) : Pointer<Void>.fromAddress(0);

MapPolylineAnimation? sdkAnimationMappolylineanimationFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkAnimationMappolylineanimationFromFfi(handle) : null;

void sdkAnimationMappolylineanimationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationMappolylineanimationReleaseHandle(handle);

// End of MapPolylineAnimation "private" section.


