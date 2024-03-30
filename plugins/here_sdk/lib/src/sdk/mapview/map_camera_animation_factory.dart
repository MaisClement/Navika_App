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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/animation/easing.dart';
import 'package:here_sdk/src/sdk/animation/easing_function.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates_update.dart';
import 'package:here_sdk/src/sdk/core/geo_orientation_update.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera_animation.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera_keyframe_track.dart';
import 'package:here_sdk/src/sdk/mapview/map_camera_update.dart';
import 'package:here_sdk/src/sdk/mapview/map_measure.dart';
import 'package:meta/meta.dart';

/// Factory for creating MapCameraAnimation objects to change map's camera over time.
abstract class MapCameraAnimationFactory {

  /// Creates a [MapCameraAnimation] to gradually update the camera properties within a specified
  /// duration from its current values to the ones defined in the [MapCameraAnimationFactory.createAnimationFromUpdate.cameraUpdate].
  ///
  /// `MapCameraAnimation`
  /// instances created from [MapCameraUpdateFactory.compositeUpdate] instances are not supported. An
  /// [AnimationListener] will receive an [AnimationState.cancelled] signal
  /// when trying to apply such animations.
  ///
  /// [cameraUpdate] Update which should be applied to the map camera.
  ///
  /// [duration] Duration of the animation. Negative duration results in no camera change when applied.
  ///
  /// [easingFunction] Easing function to apply.
  ///
  /// Returns [MapCameraAnimation]. MapCameraAnimation instance
  ///
  @Deprecated("Will be removed in v4.19.0. Please use the method with [Easing] parameter instead.")

  static MapCameraAnimation createAnimationFromUpdate(MapCameraUpdate cameraUpdate, Duration duration, EasingFunction easingFunction) => $prototype.createAnimationFromUpdate(cameraUpdate, duration, easingFunction);
  /// Creates a [MapCameraAnimation] to gradually update the camera properties within a specified
  /// duration from its current values to the ones defined in the [MapCameraAnimationFactory.createAnimationFromUpdateWithEasing.cameraUpdate].
  ///
  /// `MapCameraAnimation`
  /// instances created from [MapCameraUpdateFactory.compositeUpdate] instances are not supported. An
  /// [AnimationListener] will receive an [AnimationState.cancelled] signal
  /// when trying to apply such animations.
  ///
  /// [cameraUpdate] Update which should be applied to the map camera.
  ///
  /// [duration] Duration of the animation. Negative duration results in no camera change when applied.
  ///
  /// [easing] Easing to apply.
  ///
  /// Returns [MapCameraAnimation]. MapCameraAnimation instance
  ///
  static MapCameraAnimation createAnimationFromUpdateWithEasing(MapCameraUpdate cameraUpdate, Duration duration, Easing easing) => $prototype.createAnimationFromUpdateWithEasing(cameraUpdate, duration, easing);
  /// Creates a MapCameraAnimation for a movement defined by the supplied [MapCameraAnimationFactory.createAnimationFromKeyframeTrack.track].
  ///
  /// [track] The track
  ///
  /// Returns [MapCameraAnimation]. MapCameraAnimation instance
  ///
  static MapCameraAnimation createAnimationFromKeyframeTrack(MapCameraKeyframeTrack track) => $prototype.createAnimationFromKeyframeTrack(track);
  /// Creates a MapCameraAnimation for a movement defined by the supplied list of [MapCameraAnimationFactory.createAnimationFromKeyframeTracks.tracks].
  ///
  /// Keyframe tracks specify how the map camera properties change during the animation.
  /// For the animation to be possible, no two different tracks can
  /// affect the same map camera property. The input tracks are validated with that in mind.
  ///
  /// However, the following cases can only be detected at the time when animation is started:
  /// - Changing altitude of camera position also changes camera look-at distance
  ///   and at high altitudes, also camera look-at orientation.
  /// - Changing tilt of camera orientation also changes camera look-at distance
  ///   and camera look-at target.
  /// - Changing bearing of camera orientation also changes
  ///   camera look-at target if current tilt is not 0.
  /// - Changing tilt or bearing of camera look-at orientation also changes
  ///   camera position.
  /// - Changing camera look-at orientation also changes camera look-at distance
  ///   if tilt is not 0.
  ///
  /// [tracks] The list of tracks
  ///
  /// Returns [MapCameraAnimation]. MapCameraAnimation instance
  ///
  /// Throws [MapCameraAnimationInstantiationException]. Indicates an instantiation issue.
  ///
  static MapCameraAnimation createAnimationFromKeyframeTracks(List<MapCameraKeyframeTrack> tracks) => $prototype.createAnimationFromKeyframeTracks(tracks);
  /// Creates a MapCameraAnimation to move the current map camera look-at coordinates to the new position along an adaptive ballistic curve.<br>
  /// The beginning and end of the animation will use the current zoom.
  ///
  /// Note: The altitude of the target point is ignored. Any subsequent camera updates and animations
  /// will consider the target point as being located on the ground.
  ///
  /// [target] The coordinates of the camera destination point.
  /// Any target sub-element value that is not finite will be set to the current camera target sub-element value.
  /// Note: The altitude of the target point is ignored. Any subsequent camera updates and animations
  /// will consider the target point as being located on the ground.
  ///
  /// [bowFactor] A bow factor that specifies how high (bowFactor > 0) or low (bowFactor < 0) the camera will fly.
  ///
  /// The highest (bowFactor = 1) or lowest point (bowFactor = -1) of the ballistic animation
  /// curve is relative to the travel distance between current camera target and destination target.
  ///
  /// A bow factor of 0 does not change the camera's zoom over time.
  ///
  /// Values greater 0 result in a convex bow animation, values below 0 in a concave bowl animation.
  ///
  /// The bow factor is clamped to \[-1, +1\].
  ///
  /// Note that the lowest possible camera distance to earth is 0 meters and that the animation
  /// curve will not go below this value.
  ///
  /// Note that currently, bow factor is ignored and assumed to be 1 if either start or end
  /// of animation has a non zero tilt.
  ///
  /// [duration] Duration of the flight. Negative duration results in no camera change when applied.
  ///
  /// Returns [MapCameraAnimation]. MapCameraAnimation instance
  ///
  static MapCameraAnimation flyTo(GeoCoordinatesUpdate target, double bowFactor, Duration duration) => $prototype.flyTo(target, bowFactor, duration);
  /// Creates a MapCameraAnimation to move the current map camera look-at coordinates to the new position and orientation along an adaptive ballistic curve.<br>
  /// The beginning and end of the animation will use the current zoom.
  ///
  /// Note: The altitude of the target point is ignored. Any subsequent camera updates and animations
  /// will consider the target point as being located on the ground.
  ///
  /// [target] The coordinates of the camera destination point.
  /// Any target sub-element value that is not finite will be set to the current camera target sub-element value.
  /// Note: The altitude of the target point is ignored. Any subsequent camera updates and animations
  /// will consider the target point as being located on the ground.
  ///
  /// [orientation] The orientation at destination.
  ///
  /// [bowFactor] A bow factor that specifies how high (bowFactor > 0) or low (bowFactor < 0) the camera will fly.
  ///
  /// The highest (bowFactor = 1) or lowest point (bowFactor = -1) of the ballistic animation
  /// curve is relative to the travel distance between current camera target and destination target.
  ///
  /// A bow factor of 0 does not change the camera's zoom over time.
  ///
  /// Values greater 0 result in a convex bow animation, values below 0 in a concave bowl animation.
  ///
  /// The bow factor is clamped to \[-1, +1\].
  ///
  /// Note that the lowest possible camera distance to earth is 0 meters and that the animation
  /// curve will not go below this value.
  ///
  /// Note that currently, bow factor is ignored and assumed to be 1 if either start or end
  /// of animation has a non zero tilt.
  ///
  /// [duration] Duration of the flight. Negative duration results in no camera change when applied.
  ///
  /// Returns [MapCameraAnimation]. MapCameraAnimation instance
  ///
  static MapCameraAnimation flyToWithOrientation(GeoCoordinatesUpdate target, GeoOrientationUpdate orientation, double bowFactor, Duration duration) => $prototype.flyToWithOrientation(target, orientation, bowFactor, duration);
  /// Creates a MapCameraAnimation to move the current map camera look-at coordinates to the new position along an adaptive ballistic curve.<br>
  /// The beginning of the animation will use the current zoom and the end of the animation will use the provided zoom.
  ///
  /// Note: The altitude of the target point is ignored. Any subsequent camera updates and animations
  /// will consider the target point as being located on the ground.
  ///
  /// [target] The coordinates of the camera destination point.
  /// Any target sub-element value that is not finite will be set to the current camera target sub-element value.
  /// Note: The altitude of the target point is ignored. Any subsequent camera updates and animations
  /// will consider the target point as being located on the ground.
  ///
  /// [zoom] The zoom at the end of the animation.
  ///
  /// [bowFactor] A bow factor that specifies how high (bowFactor > 0) or low (bowFactor < 0) the camera will fly.
  ///
  /// The highest (bowFactor = 1) or lowest point (bowFactor = -1) of the ballistic animation
  /// curve is relative to the travel distance between current camera target and destination target.
  ///
  /// A bow factor of 0 does not affect the camera's zoom over time.
  ///
  /// Values greater 0 result in a convex bow animation, values below 0 in a concave bowl animation.
  ///
  /// The bow factor is clamped to \[-1, +1\].
  ///
  /// Note that the lowest possible camera distance to earth is 0 meters and that the animation
  /// curve will not go below this value.
  ///
  /// Note that currently, bow factor is ignored and assumed to be 1 if either start or end
  /// of animation has a non zero tilt.
  ///
  /// [duration] Duration of the flight. Negative duration results in no camera change when applied.
  ///
  /// Returns [MapCameraAnimation]. MapCameraAnimation instance
  ///
  static MapCameraAnimation flyToWithZoom(GeoCoordinatesUpdate target, MapMeasure zoom, double bowFactor, Duration duration) => $prototype.flyToWithZoom(target, zoom, bowFactor, duration);
  /// Creates a MapCameraAnimation to move the current map camera look-at coordinates to the new position and orientation along an adaptive ballistic curve.<br>
  /// The beginning of the animation will use the current zoom and the end of the animation will use the provided zoom.
  ///
  /// Note: The altitude of the target point is ignored. Any subsequent camera updates and animations
  /// will consider the target point as being located on the ground.
  ///
  /// [target] The coordinates of the camera destination point.
  /// Any target sub-element value that is not finite will be set to the current camera target sub-element value.
  /// Note: The altitude of the target point is ignored. Any subsequent camera updates and animations
  /// will consider the target point as being located on the ground.
  ///
  /// [orientation] The orientation at destination.
  ///
  /// [zoom] The zoom at the end of the animation.
  ///
  /// [bowFactor] A bow factor that specifies how high (bowFactor > 0) or low (bowFactor < 0) the camera will fly.
  ///
  /// The highest (bowFactor = 1) or lowest point (bowFactor = -1) of the ballistic animation
  /// curve is relative to the travel distance between current camera target and destination target.
  ///
  /// A bow factor of 0 does not affect the camera's zoom over time.
  ///
  /// Values greater 0 result in a convex bow animation, values below 0 in a concave bowl animation.
  ///
  /// The bow factor is clamped to \[-1, +1\].
  ///
  /// Note that the lowest possible camera distance to earth is 0 meters and that the animation
  /// curve will not go below this value.
  ///
  /// Note that currently, bow factor is ignored and assumed to be 1 if either start or end
  /// of animation has a non zero tilt.
  ///
  /// [duration] Duration of the flight. Negative duration results in no camera change when applied.
  ///
  /// Returns [MapCameraAnimation]. MapCameraAnimation instance
  ///
  static MapCameraAnimation flyToWithOrientationAndZoom(GeoCoordinatesUpdate target, GeoOrientationUpdate orientation, MapMeasure zoom, double bowFactor, Duration duration) => $prototype.flyToWithOrientationAndZoom(target, orientation, zoom, bowFactor, duration);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapCameraAnimationFactory$Impl(Pointer<Void>.fromAddress(0));
}


// MapCameraAnimationFactory "private" section, not exported.

final _sdkMapviewMapcameraanimationfactoryRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapCameraAnimationFactory_register_finalizer'));
final _sdkMapviewMapcameraanimationfactoryCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimationFactory_copy_handle'));
final _sdkMapviewMapcameraanimationfactoryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimationFactory_release_handle'));





final _createAnimationFromKeyframeTrackssdkMapviewMapcameraanimationfactoryCreateanimationListofSdkMapviewMapcamerakeyframetrackReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimationFactory_createAnimation__ListOf_sdk_mapview_MapCameraKeyframeTrack_return_release_handle'));
final _createAnimationFromKeyframeTrackssdkMapviewMapcameraanimationfactoryCreateanimationListofSdkMapviewMapcamerakeyframetrackReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimationFactory_createAnimation__ListOf_sdk_mapview_MapCameraKeyframeTrack_return_get_result'));
final _createAnimationFromKeyframeTrackssdkMapviewMapcameraanimationfactoryCreateanimationListofSdkMapviewMapcamerakeyframetrackReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimationFactory_createAnimation__ListOf_sdk_mapview_MapCameraKeyframeTrack_return_get_error'));
final _createAnimationFromKeyframeTrackssdkMapviewMapcameraanimationfactoryCreateanimationListofSdkMapviewMapcamerakeyframetrackReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraAnimationFactory_createAnimation__ListOf_sdk_mapview_MapCameraKeyframeTrack_return_has_error'));






/// @nodoc
@visibleForTesting
class MapCameraAnimationFactory$Impl extends __lib.NativeBase implements MapCameraAnimationFactory {

  MapCameraAnimationFactory$Impl(Pointer<Void> handle) : super(handle);

  MapCameraAnimation createAnimationFromUpdate(MapCameraUpdate cameraUpdate, Duration duration, EasingFunction easingFunction) {
    final _createAnimationFromUpdateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint64, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapCameraAnimationFactory_createAnimation__MapCameraUpdate_Duration_EasingFunction'));
    final _cameraUpdateHandle = sdkMapviewMapcameraupdateToFfi(cameraUpdate);
    final _durationHandle = durationToFfi(duration);
    final _easingFunctionHandle = sdkAnimationEasingfunctionToFfi(easingFunction);
    final __resultHandle = _createAnimationFromUpdateFfi(__lib.LibraryContext.isolateId, _cameraUpdateHandle, _durationHandle, _easingFunctionHandle);
    sdkMapviewMapcameraupdateReleaseFfiHandle(_cameraUpdateHandle);
    durationReleaseFfiHandle(_durationHandle);
    sdkAnimationEasingfunctionReleaseFfiHandle(_easingFunctionHandle);
    try {
      return sdkMapviewMapcameraanimationFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraanimationReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraAnimation createAnimationFromUpdateWithEasing(MapCameraUpdate cameraUpdate, Duration duration, Easing easing) {
    final _createAnimationFromUpdateWithEasingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint64, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraAnimationFactory_createAnimation__MapCameraUpdate_Duration_Easing'));
    final _cameraUpdateHandle = sdkMapviewMapcameraupdateToFfi(cameraUpdate);
    final _durationHandle = durationToFfi(duration);
    final _easingHandle = sdkAnimationEasingToFfi(easing);
    final __resultHandle = _createAnimationFromUpdateWithEasingFfi(__lib.LibraryContext.isolateId, _cameraUpdateHandle, _durationHandle, _easingHandle);
    sdkMapviewMapcameraupdateReleaseFfiHandle(_cameraUpdateHandle);
    durationReleaseFfiHandle(_durationHandle);
    sdkAnimationEasingReleaseFfiHandle(_easingHandle);
    try {
      return sdkMapviewMapcameraanimationFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraanimationReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraAnimation createAnimationFromKeyframeTrack(MapCameraKeyframeTrack track) {
    final _createAnimationFromKeyframeTrackFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraAnimationFactory_createAnimation__MapCameraKeyframeTrack'));
    final _trackHandle = sdkMapviewMapcamerakeyframetrackToFfi(track);
    final __resultHandle = _createAnimationFromKeyframeTrackFfi(__lib.LibraryContext.isolateId, _trackHandle);
    sdkMapviewMapcamerakeyframetrackReleaseFfiHandle(_trackHandle);
    try {
      return sdkMapviewMapcameraanimationFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraanimationReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraAnimation createAnimationFromKeyframeTracks(List<MapCameraKeyframeTrack> tracks) {
    final _createAnimationFromKeyframeTracksFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraAnimationFactory_createAnimation__ListOf_sdk_mapview_MapCameraKeyframeTrack'));
    final _tracksHandle = harpSdkBindingslistofSdkMapviewMapcamerakeyframetrackToFfi(tracks);
    final __callResultHandle = _createAnimationFromKeyframeTracksFfi(__lib.LibraryContext.isolateId, _tracksHandle);
    harpSdkBindingslistofSdkMapviewMapcamerakeyframetrackReleaseFfiHandle(_tracksHandle);
    if (_createAnimationFromKeyframeTrackssdkMapviewMapcameraanimationfactoryCreateanimationListofSdkMapviewMapcamerakeyframetrackReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _createAnimationFromKeyframeTrackssdkMapviewMapcameraanimationfactoryCreateanimationListofSdkMapviewMapcamerakeyframetrackReturnGetError(__callResultHandle);
        _createAnimationFromKeyframeTrackssdkMapviewMapcameraanimationfactoryCreateanimationListofSdkMapviewMapcamerakeyframetrackReturnReleaseHandle(__callResultHandle);
        try {
          throw MapCameraAnimationInstantiationException(sdkMapviewMapcameraanimationInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapcameraanimationInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _createAnimationFromKeyframeTrackssdkMapviewMapcameraanimationfactoryCreateanimationListofSdkMapviewMapcamerakeyframetrackReturnGetResult(__callResultHandle);
    _createAnimationFromKeyframeTrackssdkMapviewMapcameraanimationfactoryCreateanimationListofSdkMapviewMapcamerakeyframetrackReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMapviewMapcameraanimationFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraanimationReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraAnimation flyTo(GeoCoordinatesUpdate target, double bowFactor, Duration duration) {
    final _flyToFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Double, Uint64), Pointer<Void> Function(int, Pointer<Void>, double, int)>('here_sdk_sdk_mapview_MapCameraAnimationFactory_flyTo__GeoCoordinatesUpdate_Double_Duration'));
    final _targetHandle = sdkCoreGeocoordinatesupdateToFfi(target);
    final _bowFactorHandle = (bowFactor);
    final _durationHandle = durationToFfi(duration);
    final __resultHandle = _flyToFfi(__lib.LibraryContext.isolateId, _targetHandle, _bowFactorHandle, _durationHandle);
    sdkCoreGeocoordinatesupdateReleaseFfiHandle(_targetHandle);

    durationReleaseFfiHandle(_durationHandle);
    try {
      return sdkMapviewMapcameraanimationFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraanimationReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraAnimation flyToWithOrientation(GeoCoordinatesUpdate target, GeoOrientationUpdate orientation, double bowFactor, Duration duration) {
    final _flyToWithOrientationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Double, Uint64), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, double, int)>('here_sdk_sdk_mapview_MapCameraAnimationFactory_flyTo__GeoCoordinatesUpdate_GeoOrientationUpdate_Double_Duration'));
    final _targetHandle = sdkCoreGeocoordinatesupdateToFfi(target);
    final _orientationHandle = sdkCoreGeoorientationupdateToFfi(orientation);
    final _bowFactorHandle = (bowFactor);
    final _durationHandle = durationToFfi(duration);
    final __resultHandle = _flyToWithOrientationFfi(__lib.LibraryContext.isolateId, _targetHandle, _orientationHandle, _bowFactorHandle, _durationHandle);
    sdkCoreGeocoordinatesupdateReleaseFfiHandle(_targetHandle);
    sdkCoreGeoorientationupdateReleaseFfiHandle(_orientationHandle);

    durationReleaseFfiHandle(_durationHandle);
    try {
      return sdkMapviewMapcameraanimationFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraanimationReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraAnimation flyToWithZoom(GeoCoordinatesUpdate target, MapMeasure zoom, double bowFactor, Duration duration) {
    final _flyToWithZoomFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Double, Uint64), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, double, int)>('here_sdk_sdk_mapview_MapCameraAnimationFactory_flyTo__GeoCoordinatesUpdate_MapMeasure_Double_Duration'));
    final _targetHandle = sdkCoreGeocoordinatesupdateToFfi(target);
    final _zoomHandle = sdkMapviewMapmeasureToFfi(zoom);
    final _bowFactorHandle = (bowFactor);
    final _durationHandle = durationToFfi(duration);
    final __resultHandle = _flyToWithZoomFfi(__lib.LibraryContext.isolateId, _targetHandle, _zoomHandle, _bowFactorHandle, _durationHandle);
    sdkCoreGeocoordinatesupdateReleaseFfiHandle(_targetHandle);
    sdkMapviewMapmeasureReleaseFfiHandle(_zoomHandle);

    durationReleaseFfiHandle(_durationHandle);
    try {
      return sdkMapviewMapcameraanimationFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraanimationReleaseFfiHandle(__resultHandle);

    }

  }

  MapCameraAnimation flyToWithOrientationAndZoom(GeoCoordinatesUpdate target, GeoOrientationUpdate orientation, MapMeasure zoom, double bowFactor, Duration duration) {
    final _flyToWithOrientationAndZoomFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Double, Uint64), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, double, int)>('here_sdk_sdk_mapview_MapCameraAnimationFactory_flyTo__GeoCoordinatesUpdate_GeoOrientationUpdate_MapMeasure_Double_Duration'));
    final _targetHandle = sdkCoreGeocoordinatesupdateToFfi(target);
    final _orientationHandle = sdkCoreGeoorientationupdateToFfi(orientation);
    final _zoomHandle = sdkMapviewMapmeasureToFfi(zoom);
    final _bowFactorHandle = (bowFactor);
    final _durationHandle = durationToFfi(duration);
    final __resultHandle = _flyToWithOrientationAndZoomFfi(__lib.LibraryContext.isolateId, _targetHandle, _orientationHandle, _zoomHandle, _bowFactorHandle, _durationHandle);
    sdkCoreGeocoordinatesupdateReleaseFfiHandle(_targetHandle);
    sdkCoreGeoorientationupdateReleaseFfiHandle(_orientationHandle);
    sdkMapviewMapmeasureReleaseFfiHandle(_zoomHandle);

    durationReleaseFfiHandle(_durationHandle);
    try {
      return sdkMapviewMapcameraanimationFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcameraanimationReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkMapviewMapcameraanimationfactoryToFfi(MapCameraAnimationFactory value) =>
  _sdkMapviewMapcameraanimationfactoryCopyHandle((value as __lib.NativeBase).handle);

MapCameraAnimationFactory sdkMapviewMapcameraanimationfactoryFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapCameraAnimationFactory) return instance;

  final _copiedHandle = _sdkMapviewMapcameraanimationfactoryCopyHandle(handle);
  final result = MapCameraAnimationFactory$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapcameraanimationfactoryRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapcameraanimationfactoryReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcameraanimationfactoryReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcameraanimationfactoryToFfiNullable(MapCameraAnimationFactory? value) =>
  value != null ? sdkMapviewMapcameraanimationfactoryToFfi(value) : Pointer<Void>.fromAddress(0);

MapCameraAnimationFactory? sdkMapviewMapcameraanimationfactoryFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcameraanimationfactoryFromFfi(handle) : null;

void sdkMapviewMapcameraanimationfactoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcameraanimationfactoryReleaseHandle(handle);

// End of MapCameraAnimationFactory "private" section.


