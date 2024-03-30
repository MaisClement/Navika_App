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

/// An animation that can be applied to the [MapMarker] object.
abstract class MapMarkerAnimation {
  /// Creates an animation of [MapMarker] based on provided keyframe track.
  ///
  /// For starting the animation see [MapMarker.startAnimation].
  /// Supports tracks created with [MapItemKeyFrameTrack] 'moveTo*' methods.
  ///
  /// [track] The track holding the keyframes for the animation.
  ///
  /// Throws [MapMarkerAnimationInstantiationException]. If the specified keyframe track cannot be used to create animation of a [MapMarker].
  ///
  factory MapMarkerAnimation(MapItemKeyFrameTrack track) => $prototype.$init(track);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapMarkerAnimation$Impl(Pointer<Void>.fromAddress(0));
}

/// Describes a reason for failing to create a [MapMarkerAnimation].
enum MapMarkerAnimationInstantiationErrorCode {
    /// Incompatible type of track provided.
    incompatibleTrack
}

// MapMarkerAnimationInstantiationErrorCode "private" section, not exported.

int sdkAnimationMapmarkeranimationInstantiationerrorcodeToFfi(MapMarkerAnimationInstantiationErrorCode value) {
  switch (value) {
  case MapMarkerAnimationInstantiationErrorCode.incompatibleTrack:
    return 0;
  default:
    throw StateError("Invalid enum value $value for MapMarkerAnimationInstantiationErrorCode enum.");
  }
}

MapMarkerAnimationInstantiationErrorCode sdkAnimationMapmarkeranimationInstantiationerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MapMarkerAnimationInstantiationErrorCode.incompatibleTrack;
  default:
    throw StateError("Invalid numeric value $handle for MapMarkerAnimationInstantiationErrorCode enum.");
  }
}

void sdkAnimationMapmarkeranimationInstantiationerrorcodeReleaseFfiHandle(int handle) {}

final _sdkAnimationMapmarkeranimationInstantiationerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_animation_MapMarkerAnimation_InstantiationErrorCode_create_handle_nullable'));
final _sdkAnimationMapmarkeranimationInstantiationerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapMarkerAnimation_InstantiationErrorCode_release_handle_nullable'));
final _sdkAnimationMapmarkeranimationInstantiationerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapMarkerAnimation_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdkAnimationMapmarkeranimationInstantiationerrorcodeToFfiNullable(MapMarkerAnimationInstantiationErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkAnimationMapmarkeranimationInstantiationerrorcodeToFfi(value);
  final result = _sdkAnimationMapmarkeranimationInstantiationerrorcodeCreateHandleNullable(_handle);
  sdkAnimationMapmarkeranimationInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

MapMarkerAnimationInstantiationErrorCode? sdkAnimationMapmarkeranimationInstantiationerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkAnimationMapmarkeranimationInstantiationerrorcodeGetValueNullable(handle);
  final result = sdkAnimationMapmarkeranimationInstantiationerrorcodeFromFfi(_handle);
  sdkAnimationMapmarkeranimationInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkAnimationMapmarkeranimationInstantiationerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationMapmarkeranimationInstantiationerrorcodeReleaseHandleNullable(handle);

// End of MapMarkerAnimationInstantiationErrorCode "private" section.
/// Thrown when a problem occurs while trying to create a [MapMarkerAnimation].
class MapMarkerAnimationInstantiationException implements Exception {
  final MapMarkerAnimationInstantiationErrorCode error;
  MapMarkerAnimationInstantiationException(this.error);
}

// MapMarkerAnimation "private" section, not exported.

final _sdkAnimationMapmarkeranimationRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_animation_MapMarkerAnimation_register_finalizer'));
final _sdkAnimationMapmarkeranimationCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapMarkerAnimation_copy_handle'));
final _sdkAnimationMapmarkeranimationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapMarkerAnimation_release_handle'));


final _$initsdkAnimationMapmarkeranimationMakeMapitemkeyframetrackReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapMarkerAnimation_make__MapItemKeyFrameTrack_return_release_handle'));
final _$initsdkAnimationMapmarkeranimationMakeMapitemkeyframetrackReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapMarkerAnimation_make__MapItemKeyFrameTrack_return_get_result'));
final _$initsdkAnimationMapmarkeranimationMakeMapitemkeyframetrackReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapMarkerAnimation_make__MapItemKeyFrameTrack_return_get_error'));
final _$initsdkAnimationMapmarkeranimationMakeMapitemkeyframetrackReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapMarkerAnimation_make__MapItemKeyFrameTrack_return_has_error'));


/// @nodoc
@visibleForTesting
class MapMarkerAnimation$Impl extends __lib.NativeBase implements MapMarkerAnimation {

  MapMarkerAnimation$Impl(Pointer<Void> handle) : super(handle);


  MapMarkerAnimation $init(MapItemKeyFrameTrack track) {
    final _result_handle = _$init(track);
    final _result = MapMarkerAnimation$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkAnimationMapmarkeranimationRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(MapItemKeyFrameTrack track) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_animation_MapMarkerAnimation_make__MapItemKeyFrameTrack'));
    final _trackHandle = sdkAnimationMapitemkeyframetrackToFfi(track);
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId, _trackHandle);
    sdkAnimationMapitemkeyframetrackReleaseFfiHandle(_trackHandle);
    if (_$initsdkAnimationMapmarkeranimationMakeMapitemkeyframetrackReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsdkAnimationMapmarkeranimationMakeMapitemkeyframetrackReturnGetError(__callResultHandle);
        _$initsdkAnimationMapmarkeranimationMakeMapitemkeyframetrackReturnReleaseHandle(__callResultHandle);
        try {
          throw MapMarkerAnimationInstantiationException(sdkAnimationMapmarkeranimationInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkAnimationMapmarkeranimationInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsdkAnimationMapmarkeranimationMakeMapitemkeyframetrackReturnGetResult(__callResultHandle);
    _$initsdkAnimationMapmarkeranimationMakeMapitemkeyframetrackReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }


}

Pointer<Void> sdkAnimationMapmarkeranimationToFfi(MapMarkerAnimation value) =>
  _sdkAnimationMapmarkeranimationCopyHandle((value as __lib.NativeBase).handle);

MapMarkerAnimation sdkAnimationMapmarkeranimationFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapMarkerAnimation) return instance;

  final _copiedHandle = _sdkAnimationMapmarkeranimationCopyHandle(handle);
  final result = MapMarkerAnimation$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkAnimationMapmarkeranimationRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkAnimationMapmarkeranimationReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkAnimationMapmarkeranimationReleaseHandle(handle);

Pointer<Void> sdkAnimationMapmarkeranimationToFfiNullable(MapMarkerAnimation? value) =>
  value != null ? sdkAnimationMapmarkeranimationToFfi(value) : Pointer<Void>.fromAddress(0);

MapMarkerAnimation? sdkAnimationMapmarkeranimationFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkAnimationMapmarkeranimationFromFfi(handle) : null;

void sdkAnimationMapmarkeranimationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationMapmarkeranimationReleaseHandle(handle);

// End of MapMarkerAnimation "private" section.


