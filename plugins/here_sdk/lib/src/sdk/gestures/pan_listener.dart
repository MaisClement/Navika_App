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
import 'package:here_sdk/src/sdk/core/point2_d.dart';
import 'package:here_sdk/src/sdk/gestures/gesture_state.dart';

/// Abstract class for handling pan gestures.
///
/// Pan gesture occurs when a finger is moving on the screen.
abstract class PanListener {
  /// Abstract class for handling pan gestures.
  ///
  /// Pan gesture occurs when a finger is moving on the screen.

  factory PanListener(
    void Function(GestureState, Point2D, Point2D, double) onPanLambda,

  ) => PanListener$Lambdas(
    onPanLambda,

  );

  /// Called when the pan gesture occurs.
  ///
  /// [state] Determines in which state the gesture is.
  ///
  /// [origin] Position of the touch point relative to the MapView in pixels.
  ///
  /// [translation] Translation offset since the last position in pixels.
  ///
  /// [velocity] Velocity of panning in pixels per millisecond.
  ///
  void onPan(GestureState state, Point2D origin, Point2D translation, double velocity);
}


// PanListener "private" section, not exported.

final _sdkGesturesPanlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_gestures_PanListener_register_finalizer'));
final _sdkGesturesPanlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_PanListener_copy_handle'));
final _sdkGesturesPanlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_PanListener_release_handle'));
final _sdkGesturesPanlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_gestures_PanListener_create_proxy'));
final _sdkGesturesPanlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_PanListener_get_type_id'));


class PanListener$Lambdas implements PanListener {
  void Function(GestureState, Point2D, Point2D, double) onPanLambda;

  PanListener$Lambdas(
    this.onPanLambda,

  );

  @override
  void onPan(GestureState state, Point2D origin, Point2D translation, double velocity) =>
    onPanLambda(state, origin, translation, velocity);
}

class PanListener$Impl extends __lib.NativeBase implements PanListener {

  PanListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onPan(GestureState state, Point2D origin, Point2D translation, double velocity) {
    final _onPanFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Pointer<Void>, Pointer<Void>, Double), void Function(Pointer<Void>, int, int, Pointer<Void>, Pointer<Void>, double)>('here_sdk_sdk_gestures_PanListener_onPan__GestureState_Point2D_Point2D_Double'));
    final _stateHandle = sdkGesturesGesturestateToFfi(state);
    final _originHandle = sdkCorePoint2dToFfi(origin);
    final _translationHandle = sdkCorePoint2dToFfi(translation);
    final _velocityHandle = (velocity);
    final _handle = this.handle;
    _onPanFfi(_handle, __lib.LibraryContext.isolateId, _stateHandle, _originHandle, _translationHandle, _velocityHandle);
    sdkGesturesGesturestateReleaseFfiHandle(_stateHandle);
    sdkCorePoint2dReleaseFfiHandle(_originHandle);
    sdkCorePoint2dReleaseFfiHandle(_translationHandle);


  }


}

int _sdkGesturesPanlisteneronPanStatic(Object _obj, int state, Pointer<Void> origin, Pointer<Void> translation, double velocity) {

  try {
    (_obj as PanListener).onPan(sdkGesturesGesturestateFromFfi(state), sdkCorePoint2dFromFfi(origin), sdkCorePoint2dFromFfi(translation), (velocity));
  } finally {
    sdkGesturesGesturestateReleaseFfiHandle(state);
    sdkCorePoint2dReleaseFfiHandle(origin);
    sdkCorePoint2dReleaseFfiHandle(translation);
    
  }
  return 0;
}


Pointer<Void> sdkGesturesPanlistenerToFfi(PanListener value) {
  if (value is __lib.NativeBase) return _sdkGesturesPanlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkGesturesPanlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Uint32, Pointer<Void>, Pointer<Void>, Double)>(_sdkGesturesPanlisteneronPanStatic, __lib.unknownError)
  );

  return result;
}

PanListener sdkGesturesPanlistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PanListener) return instance;

  final _typeIdHandle = _sdkGesturesPanlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkGesturesPanlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : PanListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkGesturesPanlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkGesturesPanlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkGesturesPanlistenerReleaseHandle(handle);

Pointer<Void> sdkGesturesPanlistenerToFfiNullable(PanListener? value) =>
  value != null ? sdkGesturesPanlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

PanListener? sdkGesturesPanlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkGesturesPanlistenerFromFfi(handle) : null;

void sdkGesturesPanlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkGesturesPanlistenerReleaseHandle(handle);

// End of PanListener "private" section.


