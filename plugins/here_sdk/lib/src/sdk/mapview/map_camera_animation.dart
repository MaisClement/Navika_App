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

/// An animation that can be applied to a [MapCamera].
///
/// Creation is done via [MapCameraAnimationFactory].
abstract class MapCameraAnimation {

}

/// Describes a reason for failing to create a multi-track [MapCameraAnimation].
enum MapCameraAnimationInstantiationErrorCode {
    /// List of keyframe tracks is empty.
    emptyTrackList,
    /// List of keyframe tracks contains multiple camera position tracks.
    multipleCameraPositionTracks,
    /// Camera's position is already modified by an earlier track that modifies camera's look-at target.
    cameraPositionModifiedByCameraLookatTargetTrack,
    /// Camera's position is already modified by an earlier track that modifies camera's look-at orientation.
    cameraPositionModifiedByCameraLookatOrientationTrack,
    /// Camera's position is already modified by an earlier track that modifies camera's look-at distance.
    cameraPositionModifiedByCameraLookatDistanceTrack,
    /// List of keyframe tracks contains multiple camera orientation tracks.
    multipleCameraOrientationTracks,
    /// Camera's orientation is already modified by an earlier track that modifies camera's look-at orientation.
    cameraOrientationModifiedByCameraLookatOrientationTrack,
    /// Camera's orientation is already modified by an earlier track that modifies camera's look-at distance.
    cameraOrientationModifiedByCameraLookatDistanceTrack,
    /// List of keyframe tracks contains multiple camera look-at target tracks.
    multipleCameraLookatTargetTracks,
    /// Camera's look-at target is already modified by an earlier track that modifies camera's position.
    cameraLookatTargetModifiedByCameraPositionTrack,
    /// Camera's look-at target is already modified by an earlier track that modifies camera's orientation.
    cameraLookatTargetModifiedByCameraOrientationTrack,
    /// List of keyframe tracks contains multiple camera look-at orientation tracks.
    multipleCameraLookatOrientationTracks,
    /// Camera's look-at orientation is already modified by an earlier track that modifies camera's position.
    cameraLookatOrientationModifiedByCameraPositionTrack,
    /// Camera's look-at orientation is already modified by an earlier track that modifies camera's orientation.
    cameraLookatOrientationModifiedByCameraOrientationTrack,
    /// List of keyframe tracks contains multiple camera look-at distance tracks.
    multipleCameraLookatDistanceTracks,
    /// Camera's look-at distance is already modified by an earlier track that modifies camera's position.
    cameraLookatDistanceModifiedByCameraPositionTrack,
    /// Camera's look-at distance is already modified by an earlier track that modifies camera's orientation.
    cameraLookatDistanceModifiedByCameraOrientationTrack,
    /// List of keyframe tracks contains multiple camera field-of-view tracks.
    multipleCameraFieldOfViewTracks,
    /// List of keyframe tracks contains multiple camera focal length tracks.
    multipleCameraFocalLengthTracks,
    /// List of keyframe tracks contains multiple camera principal point tracks.
    multipleCameraPrincipalPointTracks
}

// MapCameraAnimationInstantiationErrorCode "private" section, not exported.

int sdkMapviewMapcameraanimationInstantiationerrorcodeToFfi(MapCameraAnimationInstantiationErrorCode value) {
  switch (value) {
  case MapCameraAnimationInstantiationErrorCode.emptyTrackList:
    return 1;
  case MapCameraAnimationInstantiationErrorCode.multipleCameraPositionTracks:
    return 2;
  case MapCameraAnimationInstantiationErrorCode.cameraPositionModifiedByCameraLookatTargetTrack:
    return 3;
  case MapCameraAnimationInstantiationErrorCode.cameraPositionModifiedByCameraLookatOrientationTrack:
    return 4;
  case MapCameraAnimationInstantiationErrorCode.cameraPositionModifiedByCameraLookatDistanceTrack:
    return 5;
  case MapCameraAnimationInstantiationErrorCode.multipleCameraOrientationTracks:
    return 6;
  case MapCameraAnimationInstantiationErrorCode.cameraOrientationModifiedByCameraLookatOrientationTrack:
    return 7;
  case MapCameraAnimationInstantiationErrorCode.cameraOrientationModifiedByCameraLookatDistanceTrack:
    return 8;
  case MapCameraAnimationInstantiationErrorCode.multipleCameraLookatTargetTracks:
    return 9;
  case MapCameraAnimationInstantiationErrorCode.cameraLookatTargetModifiedByCameraPositionTrack:
    return 10;
  case MapCameraAnimationInstantiationErrorCode.cameraLookatTargetModifiedByCameraOrientationTrack:
    return 11;
  case MapCameraAnimationInstantiationErrorCode.multipleCameraLookatOrientationTracks:
    return 12;
  case MapCameraAnimationInstantiationErrorCode.cameraLookatOrientationModifiedByCameraPositionTrack:
    return 13;
  case MapCameraAnimationInstantiationErrorCode.cameraLookatOrientationModifiedByCameraOrientationTrack:
    return 14;
  case MapCameraAnimationInstantiationErrorCode.multipleCameraLookatDistanceTracks:
    return 15;
  case MapCameraAnimationInstantiationErrorCode.cameraLookatDistanceModifiedByCameraPositionTrack:
    return 16;
  case MapCameraAnimationInstantiationErrorCode.cameraLookatDistanceModifiedByCameraOrientationTrack:
    return 17;
  case MapCameraAnimationInstantiationErrorCode.multipleCameraFieldOfViewTracks:
    return 18;
  case MapCameraAnimationInstantiationErrorCode.multipleCameraFocalLengthTracks:
    return 19;
  case MapCameraAnimationInstantiationErrorCode.multipleCameraPrincipalPointTracks:
    return 20;
  default:
    throw StateError("Invalid enum value $value for MapCameraAnimationInstantiationErrorCode enum.");
  }
}

MapCameraAnimationInstantiationErrorCode sdkMapviewMapcameraanimationInstantiationerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return MapCameraAnimationInstantiationErrorCode.emptyTrackList;
  case 2:
    return MapCameraAnimationInstantiationErrorCode.multipleCameraPositionTracks;
  case 3:
    return MapCameraAnimationInstantiationErrorCode.cameraPositionModifiedByCameraLookatTargetTrack;
  case 4:
    return MapCameraAnimationInstantiationErrorCode.cameraPositionModifiedByCameraLookatOrientationTrack;
  case 5:
    return MapCameraAnimationInstantiationErrorCode.cameraPositionModifiedByCameraLookatDistanceTrack;
  case 6:
    return MapCameraAnimationInstantiationErrorCode.multipleCameraOrientationTracks;
  case 7:
    return MapCameraAnimationInstantiationErrorCode.cameraOrientationModifiedByCameraLookatOrientationTrack;
  case 8:
    return MapCameraAnimationInstantiationErrorCode.cameraOrientationModifiedByCameraLookatDistanceTrack;
  case 9:
    return MapCameraAnimationInstantiationErrorCode.multipleCameraLookatTargetTracks;
  case 10:
    return MapCameraAnimationInstantiationErrorCode.cameraLookatTargetModifiedByCameraPositionTrack;
  case 11:
    return MapCameraAnimationInstantiationErrorCode.cameraLookatTargetModifiedByCameraOrientationTrack;
  case 12:
    return MapCameraAnimationInstantiationErrorCode.multipleCameraLookatOrientationTracks;
  case 13:
    return MapCameraAnimationInstantiationErrorCode.cameraLookatOrientationModifiedByCameraPositionTrack;
  case 14:
    return MapCameraAnimationInstantiationErrorCode.cameraLookatOrientationModifiedByCameraOrientationTrack;
  case 15:
    return MapCameraAnimationInstantiationErrorCode.multipleCameraLookatDistanceTracks;
  case 16:
    return MapCameraAnimationInstantiationErrorCode.cameraLookatDistanceModifiedByCameraPositionTrack;
  case 17:
    return MapCameraAnimationInstantiationErrorCode.cameraLookatDistanceModifiedByCameraOrientationTrack;
  case 18:
    return MapCameraAnimationInstantiationErrorCode.multipleCameraFieldOfViewTracks;
  case 19:
    return MapCameraAnimationInstantiationErrorCode.multipleCameraFocalLengthTracks;
  case 20:
    return MapCameraAnimationInstantiationErrorCode.multipleCameraPrincipalPointTracks;
  default:
    throw StateError("Invalid numeric value $handle for MapCameraAnimationInstantiationErrorCode enum.");
  }
}

void sdkMapviewMapcameraanimationInstantiationerrorcodeReleaseFfiHandle(int handle) {}

final _sdkMapviewMapcameraanimationInstantiationerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapCameraAnimation_InstantiationErrorCode_create_handle_nullable'));
final _sdkMapviewMapcameraanimationInstantiationerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimation_InstantiationErrorCode_release_handle_nullable'));
final _sdkMapviewMapcameraanimationInstantiationerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimation_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdkMapviewMapcameraanimationInstantiationerrorcodeToFfiNullable(MapCameraAnimationInstantiationErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapcameraanimationInstantiationerrorcodeToFfi(value);
  final result = _sdkMapviewMapcameraanimationInstantiationerrorcodeCreateHandleNullable(_handle);
  sdkMapviewMapcameraanimationInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

MapCameraAnimationInstantiationErrorCode? sdkMapviewMapcameraanimationInstantiationerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapcameraanimationInstantiationerrorcodeGetValueNullable(handle);
  final result = sdkMapviewMapcameraanimationInstantiationerrorcodeFromFfi(_handle);
  sdkMapviewMapcameraanimationInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapcameraanimationInstantiationerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcameraanimationInstantiationerrorcodeReleaseHandleNullable(handle);

// End of MapCameraAnimationInstantiationErrorCode "private" section.
/// Thrown when a problem occurs while trying to create a multi-track
/// [MapCameraAnimation].
class MapCameraAnimationInstantiationException implements Exception {
  final MapCameraAnimationInstantiationErrorCode error;
  MapCameraAnimationInstantiationException(this.error);
}

// MapCameraAnimation "private" section, not exported.

final _sdkMapviewMapcameraanimationRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapCameraAnimation_register_finalizer'));
final _sdkMapviewMapcameraanimationCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimation_copy_handle'));
final _sdkMapviewMapcameraanimationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimation_release_handle'));


class MapCameraAnimation$Impl extends __lib.NativeBase implements MapCameraAnimation {

  MapCameraAnimation$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkMapviewMapcameraanimationToFfi(MapCameraAnimation value) =>
  _sdkMapviewMapcameraanimationCopyHandle((value as __lib.NativeBase).handle);

MapCameraAnimation sdkMapviewMapcameraanimationFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapCameraAnimation) return instance;

  final _copiedHandle = _sdkMapviewMapcameraanimationCopyHandle(handle);
  final result = MapCameraAnimation$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapcameraanimationRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapcameraanimationReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcameraanimationReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcameraanimationToFfiNullable(MapCameraAnimation? value) =>
  value != null ? sdkMapviewMapcameraanimationToFfi(value) : Pointer<Void>.fromAddress(0);

MapCameraAnimation? sdkMapviewMapcameraanimationFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcameraanimationFromFfi(handle) : null;

void sdkMapviewMapcameraanimationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcameraanimationReleaseHandle(handle);

// End of MapCameraAnimation "private" section.


