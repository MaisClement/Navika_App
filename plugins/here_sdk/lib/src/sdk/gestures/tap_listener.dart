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

/// Abstract class for handling tap gestures.
///
/// Tap gesture occurs after tapping on the screen.
abstract class TapListener {
  /// Abstract class for handling tap gestures.
  ///
  /// Tap gesture occurs after tapping on the screen.

  factory TapListener(
    void Function(Point2D) onTapLambda,

  ) => TapListener$Lambdas(
    onTapLambda,

  );

  /// Called when the tap gesture occurs.
  ///
  /// [origin] Position of the touch point relative to the MapView in pixels.
  ///
  void onTap(Point2D origin);
}


// TapListener "private" section, not exported.

final _sdkGesturesTaplistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_gestures_TapListener_register_finalizer'));
final _sdkGesturesTaplistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TapListener_copy_handle'));
final _sdkGesturesTaplistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TapListener_release_handle'));
final _sdkGesturesTaplistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_gestures_TapListener_create_proxy'));
final _sdkGesturesTaplistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_TapListener_get_type_id'));


class TapListener$Lambdas implements TapListener {
  void Function(Point2D) onTapLambda;

  TapListener$Lambdas(
    this.onTapLambda,

  );

  @override
  void onTap(Point2D origin) =>
    onTapLambda(origin);
}

class TapListener$Impl extends __lib.NativeBase implements TapListener {

  TapListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onTap(Point2D origin) {
    final _onTapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_TapListener_onTap__Point2D'));
    final _originHandle = sdkCorePoint2dToFfi(origin);
    final _handle = this.handle;
    _onTapFfi(_handle, __lib.LibraryContext.isolateId, _originHandle);
    sdkCorePoint2dReleaseFfiHandle(_originHandle);

  }


}

int _sdkGesturesTaplisteneronTapStatic(Object _obj, Pointer<Void> origin) {

  try {
    (_obj as TapListener).onTap(sdkCorePoint2dFromFfi(origin));
  } finally {
    sdkCorePoint2dReleaseFfiHandle(origin);
  }
  return 0;
}


Pointer<Void> sdkGesturesTaplistenerToFfi(TapListener value) {
  if (value is __lib.NativeBase) return _sdkGesturesTaplistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkGesturesTaplistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkGesturesTaplisteneronTapStatic, __lib.unknownError)
  );

  return result;
}

TapListener sdkGesturesTaplistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TapListener) return instance;

  final _typeIdHandle = _sdkGesturesTaplistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkGesturesTaplistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TapListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkGesturesTaplistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkGesturesTaplistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkGesturesTaplistenerReleaseHandle(handle);

Pointer<Void> sdkGesturesTaplistenerToFfiNullable(TapListener? value) =>
  value != null ? sdkGesturesTaplistenerToFfi(value) : Pointer<Void>.fromAddress(0);

TapListener? sdkGesturesTaplistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkGesturesTaplistenerFromFfi(handle) : null;

void sdkGesturesTaplistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkGesturesTaplistenerReleaseHandle(handle);

// End of TapListener "private" section.


