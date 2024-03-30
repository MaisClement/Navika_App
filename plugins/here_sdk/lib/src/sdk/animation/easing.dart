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
import 'package:here_sdk/src/sdk/animation/easing_function.dart';
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:meta/meta.dart';

/// Animation easing representing an easing function to be used during animations.
abstract class Easing {
  /// Creates an instance of [Easing] using a predefined easing function.
  ///
  /// [easingFunction] Easing function.
  ///
  factory Easing(EasingFunction easingFunction) => $prototype.$init(easingFunction);
  /// Creates an instance of customized [Easing] using a specified number of points describing an
  /// easing function.
  ///
  /// [points] List of sampled data points that define an easing function.
  /// X describes normalized time values in the range \[0, 1\].
  /// Y describes normalized animated value changes. Values can fall outside of the range \[0, 1\]. During
  /// an animation run animated target value is multiplied with Y value. In case resulting animated target value
  /// falls outside of its own supported range it will be clamped to its range (e.g. when negative values used for
  /// color animation).
  /// X values must increase monotonically.
  /// There must be at least 2 data points specified. The first point's X value must be 0, the last point's
  /// X value must be 1.
  /// During an animation run for any given time value X' from the animation engine that
  /// satisfies the relation X(i) < X' < X(i+1) for the given X data points the corresponding
  /// Y' value will be calculated by linearly interpolating between Y(i) and Y(i+1) data points.
  /// The higher the sampling rate of the easing curve used for the data points the more precise the results.
  /// In order to achieve the same animation precision for animations with different durations
  /// (shorter vs longer) it is recommended to use a higher sampling rate for longer animation duration.
  ///
  /// Throws [EasingInstantiationException]. Instantiation error in case of invalid input parameters.
  ///
  factory Easing.withSampledPoints(List<Point2D> points) => $prototype.withSampledPoints(points);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Easing$Impl(Pointer<Void>.fromAddress(0));
}

/// Describes a reason for failing to create an [Easing].
enum EasingInstantiationErrorCode {
    /// Number of sampled data points in the list that defines an easing function is too small (i.e. less than 2).
    sampledDataPointCountTooSmall,
    /// Invalid first value of X in the list of sampled data points that define an easing function. First value of X must be 0.
    sampledDataPointsFirstXValueInvalid,
    /// Invalid last value of X in the list of sampled data points that define an easing function. Last value of X must be 1.
    sampledDataPointsLastXValueInvalid,
    /// Sampled data point X values that define an easing function are out of range \[0, 1\].
    sampledDataXValueOutOfRange,
    /// Sampled data point X values in the list that defines an easing function don't increase monotonically.
    sampledDataXValuesNonMonotonic
}

// EasingInstantiationErrorCode "private" section, not exported.

int sdkAnimationEasingInstantiationerrorcodeToFfi(EasingInstantiationErrorCode value) {
  switch (value) {
  case EasingInstantiationErrorCode.sampledDataPointCountTooSmall:
    return 1;
  case EasingInstantiationErrorCode.sampledDataPointsFirstXValueInvalid:
    return 2;
  case EasingInstantiationErrorCode.sampledDataPointsLastXValueInvalid:
    return 3;
  case EasingInstantiationErrorCode.sampledDataXValueOutOfRange:
    return 4;
  case EasingInstantiationErrorCode.sampledDataXValuesNonMonotonic:
    return 5;
  default:
    throw StateError("Invalid enum value $value for EasingInstantiationErrorCode enum.");
  }
}

EasingInstantiationErrorCode sdkAnimationEasingInstantiationerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return EasingInstantiationErrorCode.sampledDataPointCountTooSmall;
  case 2:
    return EasingInstantiationErrorCode.sampledDataPointsFirstXValueInvalid;
  case 3:
    return EasingInstantiationErrorCode.sampledDataPointsLastXValueInvalid;
  case 4:
    return EasingInstantiationErrorCode.sampledDataXValueOutOfRange;
  case 5:
    return EasingInstantiationErrorCode.sampledDataXValuesNonMonotonic;
  default:
    throw StateError("Invalid numeric value $handle for EasingInstantiationErrorCode enum.");
  }
}

void sdkAnimationEasingInstantiationerrorcodeReleaseFfiHandle(int handle) {}

final _sdkAnimationEasingInstantiationerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_animation_Easing_InstantiationErrorCode_create_handle_nullable'));
final _sdkAnimationEasingInstantiationerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Easing_InstantiationErrorCode_release_handle_nullable'));
final _sdkAnimationEasingInstantiationerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Easing_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdkAnimationEasingInstantiationerrorcodeToFfiNullable(EasingInstantiationErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkAnimationEasingInstantiationerrorcodeToFfi(value);
  final result = _sdkAnimationEasingInstantiationerrorcodeCreateHandleNullable(_handle);
  sdkAnimationEasingInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

EasingInstantiationErrorCode? sdkAnimationEasingInstantiationerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkAnimationEasingInstantiationerrorcodeGetValueNullable(handle);
  final result = sdkAnimationEasingInstantiationerrorcodeFromFfi(_handle);
  sdkAnimationEasingInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkAnimationEasingInstantiationerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationEasingInstantiationerrorcodeReleaseHandleNullable(handle);

// End of EasingInstantiationErrorCode "private" section.
/// Thrown when a problem occurs while trying to create an [Easing].
class EasingInstantiationException implements Exception {
  final EasingInstantiationErrorCode error;
  EasingInstantiationException(this.error);
}

// Easing "private" section, not exported.

final _sdkAnimationEasingRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_animation_Easing_register_finalizer'));
final _sdkAnimationEasingCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Easing_copy_handle'));
final _sdkAnimationEasingReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Easing_release_handle'));



final _withSampledPointssdkAnimationEasingMakeListofSdkCorePoint2dReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Easing_make__ListOf_sdk_core_Point2D_return_release_handle'));
final _withSampledPointssdkAnimationEasingMakeListofSdkCorePoint2dReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Easing_make__ListOf_sdk_core_Point2D_return_get_result'));
final _withSampledPointssdkAnimationEasingMakeListofSdkCorePoint2dReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Easing_make__ListOf_sdk_core_Point2D_return_get_error'));
final _withSampledPointssdkAnimationEasingMakeListofSdkCorePoint2dReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_Easing_make__ListOf_sdk_core_Point2D_return_has_error'));


/// @nodoc
@visibleForTesting
class Easing$Impl extends __lib.NativeBase implements Easing {

  Easing$Impl(Pointer<Void> handle) : super(handle);


  Easing $init(EasingFunction easingFunction) {
    final _result_handle = _$init(easingFunction);
    final _result = Easing$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkAnimationEasingRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  Easing withSampledPoints(List<Point2D> points) {
    final _result_handle = _withSampledPoints(points);
    final _result = Easing$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkAnimationEasingRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(EasingFunction easingFunction) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32), Pointer<Void> Function(int, int)>('here_sdk_sdk_animation_Easing_make__EasingFunction'));
    final _easingFunctionHandle = sdkAnimationEasingfunctionToFfi(easingFunction);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _easingFunctionHandle);
    sdkAnimationEasingfunctionReleaseFfiHandle(_easingFunctionHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withSampledPoints(List<Point2D> points) {
    final _withSampledPointsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_animation_Easing_make__ListOf_sdk_core_Point2D'));
    final _pointsHandle = harpSdkBindingslistofSdkCorePoint2dToFfi(points);
    final __callResultHandle = _withSampledPointsFfi(__lib.LibraryContext.isolateId, _pointsHandle);
    harpSdkBindingslistofSdkCorePoint2dReleaseFfiHandle(_pointsHandle);
    if (_withSampledPointssdkAnimationEasingMakeListofSdkCorePoint2dReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withSampledPointssdkAnimationEasingMakeListofSdkCorePoint2dReturnGetError(__callResultHandle);
        _withSampledPointssdkAnimationEasingMakeListofSdkCorePoint2dReturnReleaseHandle(__callResultHandle);
        try {
          throw EasingInstantiationException(sdkAnimationEasingInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkAnimationEasingInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withSampledPointssdkAnimationEasingMakeListofSdkCorePoint2dReturnGetResult(__callResultHandle);
    _withSampledPointssdkAnimationEasingMakeListofSdkCorePoint2dReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }


}

Pointer<Void> sdkAnimationEasingToFfi(Easing value) =>
  _sdkAnimationEasingCopyHandle((value as __lib.NativeBase).handle);

Easing sdkAnimationEasingFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Easing) return instance;

  final _copiedHandle = _sdkAnimationEasingCopyHandle(handle);
  final result = Easing$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkAnimationEasingRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkAnimationEasingReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkAnimationEasingReleaseHandle(handle);

Pointer<Void> sdkAnimationEasingToFfiNullable(Easing? value) =>
  value != null ? sdkAnimationEasingToFfi(value) : Pointer<Void>.fromAddress(0);

Easing? sdkAnimationEasingFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkAnimationEasingFromFfi(handle) : null;

void sdkAnimationEasingReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationEasingReleaseHandle(handle);

// End of Easing "private" section.


