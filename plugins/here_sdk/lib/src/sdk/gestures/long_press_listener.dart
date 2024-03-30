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

/// Abstract class for handling long-press gestures.
///
/// Long-press gesture occurs after tapping and holding the finger for a long time on the screen.
abstract class LongPressListener {
  /// Abstract class for handling long-press gestures.
  ///
  /// Long-press gesture occurs after tapping and holding the finger for a long time on the screen.

  factory LongPressListener(
    void Function(GestureState, Point2D) onLongPressLambda,

  ) => LongPressListener$Lambdas(
    onLongPressLambda,

  );

  /// Called when the double long press gesture occurs.
  ///
  /// [state] Determines in which state the gesture is.
  ///
  /// [origin] Position of the touch point relative to the MapView in pixels.
  ///
  void onLongPress(GestureState state, Point2D origin);
}


// LongPressListener "private" section, not exported.

final _sdkGesturesLongpresslistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_gestures_LongPressListener_register_finalizer'));
final _sdkGesturesLongpresslistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_LongPressListener_copy_handle'));
final _sdkGesturesLongpresslistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_LongPressListener_release_handle'));
final _sdkGesturesLongpresslistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_gestures_LongPressListener_create_proxy'));
final _sdkGesturesLongpresslistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_LongPressListener_get_type_id'));


class LongPressListener$Lambdas implements LongPressListener {
  void Function(GestureState, Point2D) onLongPressLambda;

  LongPressListener$Lambdas(
    this.onLongPressLambda,

  );

  @override
  void onLongPress(GestureState state, Point2D origin) =>
    onLongPressLambda(state, origin);
}

class LongPressListener$Impl extends __lib.NativeBase implements LongPressListener {

  LongPressListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onLongPress(GestureState state, Point2D origin) {
    final _onLongPressFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Pointer<Void>), void Function(Pointer<Void>, int, int, Pointer<Void>)>('here_sdk_sdk_gestures_LongPressListener_onLongPress__GestureState_Point2D'));
    final _stateHandle = sdkGesturesGesturestateToFfi(state);
    final _originHandle = sdkCorePoint2dToFfi(origin);
    final _handle = this.handle;
    _onLongPressFfi(_handle, __lib.LibraryContext.isolateId, _stateHandle, _originHandle);
    sdkGesturesGesturestateReleaseFfiHandle(_stateHandle);
    sdkCorePoint2dReleaseFfiHandle(_originHandle);

  }


}

int _sdkGesturesLongpresslisteneronLongPressStatic(Object _obj, int state, Pointer<Void> origin) {

  try {
    (_obj as LongPressListener).onLongPress(sdkGesturesGesturestateFromFfi(state), sdkCorePoint2dFromFfi(origin));
  } finally {
    sdkGesturesGesturestateReleaseFfiHandle(state);
    sdkCorePoint2dReleaseFfiHandle(origin);
  }
  return 0;
}


Pointer<Void> sdkGesturesLongpresslistenerToFfi(LongPressListener value) {
  if (value is __lib.NativeBase) return _sdkGesturesLongpresslistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkGesturesLongpresslistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Uint32, Pointer<Void>)>(_sdkGesturesLongpresslisteneronLongPressStatic, __lib.unknownError)
  );

  return result;
}

LongPressListener sdkGesturesLongpresslistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LongPressListener) return instance;

  final _typeIdHandle = _sdkGesturesLongpresslistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkGesturesLongpresslistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : LongPressListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkGesturesLongpresslistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkGesturesLongpresslistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkGesturesLongpresslistenerReleaseHandle(handle);

Pointer<Void> sdkGesturesLongpresslistenerToFfiNullable(LongPressListener? value) =>
  value != null ? sdkGesturesLongpresslistenerToFfi(value) : Pointer<Void>.fromAddress(0);

LongPressListener? sdkGesturesLongpresslistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkGesturesLongpresslistenerFromFfi(handle) : null;

void sdkGesturesLongpresslistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkGesturesLongpresslistenerReleaseHandle(handle);

// End of LongPressListener "private" section.


