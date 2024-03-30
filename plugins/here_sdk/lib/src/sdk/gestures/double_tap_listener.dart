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

/// Abstract class for handling double tap gestures.
///
/// Double-tap gesture occurs after double-tapping on the screen.
abstract class DoubleTapListener {
  /// Abstract class for handling double tap gestures.
  ///
  /// Double-tap gesture occurs after double-tapping on the screen.

  factory DoubleTapListener(
    void Function(Point2D) onDoubleTapLambda,

  ) => DoubleTapListener$Lambdas(
    onDoubleTapLambda,

  );

  /// Called when the double-tap gesture occurs.
  ///
  /// [origin] Position of the touch point relative to the MapView in pixels.
  ///
  void onDoubleTap(Point2D origin);
}


// DoubleTapListener "private" section, not exported.

final _sdkGesturesDoubletaplistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_gestures_DoubleTapListener_register_finalizer'));
final _sdkGesturesDoubletaplistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_DoubleTapListener_copy_handle'));
final _sdkGesturesDoubletaplistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_DoubleTapListener_release_handle'));
final _sdkGesturesDoubletaplistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_gestures_DoubleTapListener_create_proxy'));
final _sdkGesturesDoubletaplistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_gestures_DoubleTapListener_get_type_id'));


class DoubleTapListener$Lambdas implements DoubleTapListener {
  void Function(Point2D) onDoubleTapLambda;

  DoubleTapListener$Lambdas(
    this.onDoubleTapLambda,

  );

  @override
  void onDoubleTap(Point2D origin) =>
    onDoubleTapLambda(origin);
}

class DoubleTapListener$Impl extends __lib.NativeBase implements DoubleTapListener {

  DoubleTapListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onDoubleTap(Point2D origin) {
    final _onDoubleTapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_gestures_DoubleTapListener_onDoubleTap__Point2D'));
    final _originHandle = sdkCorePoint2dToFfi(origin);
    final _handle = this.handle;
    _onDoubleTapFfi(_handle, __lib.LibraryContext.isolateId, _originHandle);
    sdkCorePoint2dReleaseFfiHandle(_originHandle);

  }


}

int _sdkGesturesDoubletaplisteneronDoubleTapStatic(Object _obj, Pointer<Void> origin) {

  try {
    (_obj as DoubleTapListener).onDoubleTap(sdkCorePoint2dFromFfi(origin));
  } finally {
    sdkCorePoint2dReleaseFfiHandle(origin);
  }
  return 0;
}


Pointer<Void> sdkGesturesDoubletaplistenerToFfi(DoubleTapListener value) {
  if (value is __lib.NativeBase) return _sdkGesturesDoubletaplistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkGesturesDoubletaplistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkGesturesDoubletaplisteneronDoubleTapStatic, __lib.unknownError)
  );

  return result;
}

DoubleTapListener sdkGesturesDoubletaplistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DoubleTapListener) return instance;

  final _typeIdHandle = _sdkGesturesDoubletaplistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkGesturesDoubletaplistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : DoubleTapListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkGesturesDoubletaplistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkGesturesDoubletaplistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkGesturesDoubletaplistenerReleaseHandle(handle);

Pointer<Void> sdkGesturesDoubletaplistenerToFfiNullable(DoubleTapListener? value) =>
  value != null ? sdkGesturesDoubletaplistenerToFfi(value) : Pointer<Void>.fromAddress(0);

DoubleTapListener? sdkGesturesDoubletaplistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkGesturesDoubletaplistenerFromFfi(handle) : null;

void sdkGesturesDoubletaplistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkGesturesDoubletaplistenerReleaseHandle(handle);

// End of DoubleTapListener "private" section.


