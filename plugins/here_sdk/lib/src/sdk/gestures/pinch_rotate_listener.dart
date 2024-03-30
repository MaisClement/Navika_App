// Copyright (c) 2018-2023 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/angle.dart';
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/gestures/gesture_state.dart';

/// Abstract class for handling pinch rotate gestures.
///
/// Pinch rotate gesture occurs when two fingers are on the screen
/// and at least one of them moves.
abstract class PinchRotateListener {
  /// Abstract class for handling pinch rotate gestures.
  ///
  /// Pinch rotate gesture occurs when two fingers are on the screen
  /// and at least one of them moves.

  factory PinchRotateListener(
    void Function(GestureState, Point2D, Point2D, double, Angle) onPinchRotateLambda,

  ) => PinchRotateListener$Lambdas(
    onPinchRotateLambda,

  );

  /// Called when the pinch rotate gesture occurs.
  ///
  /// [state] Determines in which state the gesture is.
  ///
  /// [pinchOrigin] Position where the pinch happened relative to the MapView in pixels.
  ///
  /// [rotationOrigin] Position where the rotation happened relative to the MapView in pixels.
  ///
  /// [twoFingerDistance] Distance between the two fingers in pixels.
  ///
  /// [rotation] Fingers rotation angle delta. Indicates how much the fingers rotation angle has changed
  /// since the previous gesture update. Clockwise finger rotation gives positive deltas,
  /// counter clockwise finger rotation gives negative deltas.
  ///
  void onPinchRotate(GestureState state, Point2D pinchOrigin, Point2D rotationOrigin, double twoFingerDistance, Angle rotation);
}


// PinchRotateListener "private" section, not exported.

final _sdkGesturesPinchrotatelistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_gestures_PinchRotateListener_register_finalizer'));
final _sdkGesturesPinchrotatelistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_PinchRotateListener_copy_handle'));
final _sdkGesturesPinchrotatelistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_PinchRotateListener_release_handle'));
final _sdkGesturesPinchrotatelistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_gestures_PinchRotateListener_create_proxy'));
final _sdkGesturesPinchrotatelistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_PinchRotateListener_get_type_id'));


class PinchRotateListener$Lambdas implements PinchRotateListener {
  void Function(GestureState, Point2D, Point2D, double, Angle) onPinchRotateLambda;

  PinchRotateListener$Lambdas(
    this.onPinchRotateLambda,

  );

  @override
  void onPinchRotate(GestureState state, Point2D pinchOrigin, Point2D rotationOrigin, double twoFingerDistance, Angle rotation) =>
    onPinchRotateLambda(state, pinchOrigin, rotationOrigin, twoFingerDistance, rotation);
}

class PinchRotateListener$Impl extends __lib.NativeBase implements PinchRotateListener {

  PinchRotateListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onPinchRotate(GestureState state, Point2D pinchOrigin, Point2D rotationOrigin, double twoFingerDistance, Angle rotation) {
    final _onPinchRotateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Pointer<Void>, Pointer<Void>, Double, Pointer<Void>), void Function(Pointer<Void>, int, int, Pointer<Void>, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_gestures_PinchRotateListener_onPinchRotate__GestureState_Point2D_Point2D_Double_Angle'));
    final _stateHandle = sdkGesturesGesturestateToFfi(state);
    final _pinchOriginHandle = sdkCorePoint2dToFfi(pinchOrigin);
    final _rotationOriginHandle = sdkCorePoint2dToFfi(rotationOrigin);
    final _twoFingerDistanceHandle = (twoFingerDistance);
    final _rotationHandle = sdkCoreAngleToFfi(rotation);
    final _handle = this.handle;
    _onPinchRotateFfi(_handle, __lib.LibraryContext.isolateId, _stateHandle, _pinchOriginHandle, _rotationOriginHandle, _twoFingerDistanceHandle, _rotationHandle);
    sdkGesturesGesturestateReleaseFfiHandle(_stateHandle);
    sdkCorePoint2dReleaseFfiHandle(_pinchOriginHandle);
    sdkCorePoint2dReleaseFfiHandle(_rotationOriginHandle);

    sdkCoreAngleReleaseFfiHandle(_rotationHandle);

  }


}

int _sdkGesturesPinchrotatelisteneronPinchRotateStatic(Object _obj, int state, Pointer<Void> pinchOrigin, Pointer<Void> rotationOrigin, double twoFingerDistance, Pointer<Void> rotation) {

  try {
    (_obj as PinchRotateListener).onPinchRotate(sdkGesturesGesturestateFromFfi(state), sdkCorePoint2dFromFfi(pinchOrigin), sdkCorePoint2dFromFfi(rotationOrigin), (twoFingerDistance), sdkCoreAngleFromFfi(rotation));
  } finally {
    sdkGesturesGesturestateReleaseFfiHandle(state);
    sdkCorePoint2dReleaseFfiHandle(pinchOrigin);
    sdkCorePoint2dReleaseFfiHandle(rotationOrigin);
    
    sdkCoreAngleReleaseFfiHandle(rotation);
  }
  return 0;
}


Pointer<Void> sdkGesturesPinchrotatelistenerToFfi(PinchRotateListener value) {
  if (value is __lib.NativeBase) return _sdkGesturesPinchrotatelistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkGesturesPinchrotatelistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Uint32, Pointer<Void>, Pointer<Void>, Double, Pointer<Void>)>(_sdkGesturesPinchrotatelisteneronPinchRotateStatic, __lib.unknownError)
  );

  return result;
}

PinchRotateListener sdkGesturesPinchrotatelistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PinchRotateListener) return instance;

  final _typeIdHandle = _sdkGesturesPinchrotatelistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkGesturesPinchrotatelistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : PinchRotateListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkGesturesPinchrotatelistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkGesturesPinchrotatelistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkGesturesPinchrotatelistenerReleaseHandle(handle);

Pointer<Void> sdkGesturesPinchrotatelistenerToFfiNullable(PinchRotateListener? value) =>
  value != null ? sdkGesturesPinchrotatelistenerToFfi(value) : Pointer<Void>.fromAddress(0);

PinchRotateListener? sdkGesturesPinchrotatelistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkGesturesPinchrotatelistenerFromFfi(handle) : null;

void sdkGesturesPinchrotatelistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkGesturesPinchrotatelistenerReleaseHandle(handle);

// End of PinchRotateListener "private" section.


