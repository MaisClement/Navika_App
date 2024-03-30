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

/// Abstract class for handling two finger tap gestures.
///
/// Two finger tap gesture occurs after tapping on the screen with two fingers.
abstract class TwoFingerTapListener {
  /// Abstract class for handling two finger tap gestures.
  ///
  /// Two finger tap gesture occurs after tapping on the screen with two fingers.

  factory TwoFingerTapListener(
    void Function(Point2D) onTwoFingerTapLambda,

  ) => TwoFingerTapListener$Lambdas(
    onTwoFingerTapLambda,

  );

  /// Called when the double-tap gesture occurs.
  ///
  /// [origin] Position halfway between two touch points relative to the MapView in pixels.
  ///
  void onTwoFingerTap(Point2D origin);
}


// TwoFingerTapListener "private" section, not exported.

final _sdkGesturesTwofingertaplistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_gestures_TwoFingerTapListener_register_finalizer'));
final _sdkGesturesTwofingertaplistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TwoFingerTapListener_copy_handle'));
final _sdkGesturesTwofingertaplistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TwoFingerTapListener_release_handle'));
final _sdkGesturesTwofingertaplistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_gestures_TwoFingerTapListener_create_proxy'));
final _sdkGesturesTwofingertaplistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TwoFingerTapListener_get_type_id'));


class TwoFingerTapListener$Lambdas implements TwoFingerTapListener {
  void Function(Point2D) onTwoFingerTapLambda;

  TwoFingerTapListener$Lambdas(
    this.onTwoFingerTapLambda,

  );

  @override
  void onTwoFingerTap(Point2D origin) =>
    onTwoFingerTapLambda(origin);
}

class TwoFingerTapListener$Impl extends __lib.NativeBase implements TwoFingerTapListener {

  TwoFingerTapListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onTwoFingerTap(Point2D origin) {
    final _onTwoFingerTapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_TwoFingerTapListener_onTwoFingerTap__Point2D'));
    final _originHandle = sdkCorePoint2dToFfi(origin);
    final _handle = this.handle;
    _onTwoFingerTapFfi(_handle, __lib.LibraryContext.isolateId, _originHandle);
    sdkCorePoint2dReleaseFfiHandle(_originHandle);

  }


}

int _sdkGesturesTwofingertaplisteneronTwoFingerTapStatic(Object _obj, Pointer<Void> origin) {

  try {
    (_obj as TwoFingerTapListener).onTwoFingerTap(sdkCorePoint2dFromFfi(origin));
  } finally {
    sdkCorePoint2dReleaseFfiHandle(origin);
  }
  return 0;
}


Pointer<Void> sdkGesturesTwofingertaplistenerToFfi(TwoFingerTapListener value) {
  if (value is __lib.NativeBase) return _sdkGesturesTwofingertaplistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkGesturesTwofingertaplistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkGesturesTwofingertaplisteneronTwoFingerTapStatic, __lib.unknownError)
  );

  return result;
}

TwoFingerTapListener sdkGesturesTwofingertaplistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TwoFingerTapListener) return instance;

  final _typeIdHandle = _sdkGesturesTwofingertaplistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkGesturesTwofingertaplistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TwoFingerTapListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkGesturesTwofingertaplistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkGesturesTwofingertaplistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkGesturesTwofingertaplistenerReleaseHandle(handle);

Pointer<Void> sdkGesturesTwofingertaplistenerToFfiNullable(TwoFingerTapListener? value) =>
  value != null ? sdkGesturesTwofingertaplistenerToFfi(value) : Pointer<Void>.fromAddress(0);

TwoFingerTapListener? sdkGesturesTwofingertaplistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkGesturesTwofingertaplistenerFromFfi(handle) : null;

void sdkGesturesTwofingertaplistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkGesturesTwofingertaplistenerReleaseHandle(handle);

// End of TwoFingerTapListener "private" section.


