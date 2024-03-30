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
import 'package:here_sdk/src/sdk/gestures/double_tap_listener.dart';
import 'package:here_sdk/src/sdk/gestures/gesture_type.dart';
import 'package:here_sdk/src/sdk/gestures/long_press_listener.dart';
import 'package:here_sdk/src/sdk/gestures/pan_listener.dart';
import 'package:here_sdk/src/sdk/gestures/pinch_rotate_listener.dart';
import 'package:here_sdk/src/sdk/gestures/tap_listener.dart';
import 'package:here_sdk/src/sdk/gestures/two_finger_pan_listener.dart';
import 'package:here_sdk/src/sdk/gestures/two_finger_tap_listener.dart';

/// Use this class to process touch events from the platform and detect gesture induced actions on the map view.
///
/// Please note that this class holds strong references to the gesture listeners.
abstract class Gestures {

  /// Enables default action to be performed for a specified
  /// gesture.
  ///
  /// [gestureType] The gesture type.
  ///
  void enableDefaultAction(GestureType gestureType);
  /// Disables default action for a specified gesture.
  ///
  /// [gestureType] The gesture type.
  ///
  void disableDefaultAction(GestureType gestureType);
  /// Gets a [TapListener] that notifies when a tap gesture occurs. [Gestures] holds a strong reference to the listener.
  TapListener? get tapListener;
  /// Sets a [TapListener] that notifies when a tap gesture occurs.
  set tapListener(TapListener? value);

  /// Gets a [DoubleTapListener] that notifies when a double-tap gesture occurs. [Gestures] holds a strong reference to the listener.
  DoubleTapListener? get doubleTapListener;
  /// Sets a [DoubleTapListener] that notifies when a double-tap gesture occurs.
  set doubleTapListener(DoubleTapListener? value);

  /// Gets a [PinchRotateListener] that notifies when a pinch-rotate gesture occurs. [Gestures] holds a strong reference to the listener.
  PinchRotateListener? get pinchRotateListener;
  /// Sets a [PinchRotateListener] that notifies when a pinch-rotate gesture occurs.
  set pinchRotateListener(PinchRotateListener? value);

  /// Gets a [LongPressListener] that notifies when a long-press gesture occurs. [Gestures] holds a strong reference to the listener.
  LongPressListener? get longPressListener;
  /// Sets a [LongPressListener] that notifies when a long-press gesture occurs.
  set longPressListener(LongPressListener? value);

  /// Gets a [PanListener] that notifies when a pan gesture occurs. [Gestures] holds a strong reference to the listener.
  PanListener? get panListener;
  /// Sets a [PanListener] that notifies when a pan gesture occurs.
  set panListener(PanListener? value);

  /// Gets a [TwoFingerTapListener] that notifies when a two-finger tap gesture occurs. [Gestures] holds a strong reference to the listener.
  TwoFingerTapListener? get twoFingerTapListener;
  /// Sets a [TwoFingerTapListener] that notifies when a two-finger tap gesture occurs.
  set twoFingerTapListener(TwoFingerTapListener? value);

  /// Gets a [TwoFingerPanListener] that notifies when a two-finger pan gesture occurs. [Gestures] holds a strong reference to the listener.
  TwoFingerPanListener? get twoFingerPanListener;
  /// Sets a [TwoFingerPanListener] that notifies when a two-finger pan gesture occurs.
  set twoFingerPanListener(TwoFingerPanListener? value);

}


// Gestures "private" section, not exported.

final _sdkGesturesGesturesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_gestures_Gestures_register_finalizer'));
final _sdkGesturesGesturesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_Gestures_copy_handle'));
final _sdkGesturesGesturesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_Gestures_release_handle'));




class Gestures$Impl extends __lib.NativeBase implements Gestures {

  Gestures$Impl(Pointer<Void> handle) : super(handle);

  @override
  void enableDefaultAction(GestureType gestureType) {
    final _enableDefaultActionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_gestures_Gestures_enableDefaultAction__GestureType'));
    final _gestureTypeHandle = sdkGesturesGesturetypeToFfi(gestureType);
    final _handle = this.handle;
    _enableDefaultActionFfi(_handle, __lib.LibraryContext.isolateId, _gestureTypeHandle);
    sdkGesturesGesturetypeReleaseFfiHandle(_gestureTypeHandle);

  }

  @override
  void disableDefaultAction(GestureType gestureType) {
    final _disableDefaultActionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_gestures_Gestures_disableDefaultAction__GestureType'));
    final _gestureTypeHandle = sdkGesturesGesturetypeToFfi(gestureType);
    final _handle = this.handle;
    _disableDefaultActionFfi(_handle, __lib.LibraryContext.isolateId, _gestureTypeHandle);
    sdkGesturesGesturetypeReleaseFfiHandle(_gestureTypeHandle);

  }

  @override
  TapListener? get tapListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_gestures_Gestures_tapListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkGesturesTaplistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkGesturesTaplistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set tapListener(TapListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_Gestures_tapListener_set__TapListener_'));
    final _valueHandle = sdkGesturesTaplistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkGesturesTaplistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  DoubleTapListener? get doubleTapListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_gestures_Gestures_doubleTapListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkGesturesDoubletaplistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkGesturesDoubletaplistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set doubleTapListener(DoubleTapListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_Gestures_doubleTapListener_set__DoubleTapListener_'));
    final _valueHandle = sdkGesturesDoubletaplistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkGesturesDoubletaplistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  PinchRotateListener? get pinchRotateListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_gestures_Gestures_pinchRotateListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkGesturesPinchrotatelistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkGesturesPinchrotatelistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set pinchRotateListener(PinchRotateListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_Gestures_pinchRotateListener_set__PinchRotateListener_'));
    final _valueHandle = sdkGesturesPinchrotatelistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkGesturesPinchrotatelistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  LongPressListener? get longPressListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_gestures_Gestures_longPressListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkGesturesLongpresslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkGesturesLongpresslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set longPressListener(LongPressListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_Gestures_longPressListener_set__LongPressListener_'));
    final _valueHandle = sdkGesturesLongpresslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkGesturesLongpresslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  PanListener? get panListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_gestures_Gestures_panListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkGesturesPanlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkGesturesPanlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set panListener(PanListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_Gestures_panListener_set__PanListener_'));
    final _valueHandle = sdkGesturesPanlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkGesturesPanlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  TwoFingerTapListener? get twoFingerTapListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_gestures_Gestures_twoFingerTapListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkGesturesTwofingertaplistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkGesturesTwofingertaplistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set twoFingerTapListener(TwoFingerTapListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_Gestures_twoFingerTapListener_set__TwoFingerTapListener_'));
    final _valueHandle = sdkGesturesTwofingertaplistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkGesturesTwofingertaplistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  TwoFingerPanListener? get twoFingerPanListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_gestures_Gestures_twoFingerPanListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkGesturesTwofingerpanlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkGesturesTwofingerpanlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set twoFingerPanListener(TwoFingerPanListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_Gestures_twoFingerPanListener_set__TwoFingerPanListener_'));
    final _valueHandle = sdkGesturesTwofingerpanlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkGesturesTwofingerpanlistenerReleaseFfiHandleNullable(_valueHandle);

  }



}

Pointer<Void> sdkGesturesGesturesToFfi(Gestures value) =>
  _sdkGesturesGesturesCopyHandle((value as __lib.NativeBase).handle);

Gestures sdkGesturesGesturesFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Gestures) return instance;

  final _copiedHandle = _sdkGesturesGesturesCopyHandle(handle);
  final result = Gestures$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkGesturesGesturesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkGesturesGesturesReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkGesturesGesturesReleaseHandle(handle);

Pointer<Void> sdkGesturesGesturesToFfiNullable(Gestures? value) =>
  value != null ? sdkGesturesGesturesToFfi(value) : Pointer<Void>.fromAddress(0);

Gestures? sdkGesturesGesturesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkGesturesGesturesFromFfi(handle) : null;

void sdkGesturesGesturesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkGesturesGesturesReleaseHandle(handle);

// End of Gestures "private" section.


