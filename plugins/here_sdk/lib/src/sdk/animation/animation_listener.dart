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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/animation/animation_state.dart';

/// A listener for animation events.
abstract class AnimationListener {
  /// A listener for animation events.

  factory AnimationListener(
    void Function(AnimationState) onAnimationStateChangedLambda,

  ) => AnimationListener$Lambdas(
    onAnimationStateChangedLambda,

  );

  /// Called after the state of an animation changes.
  ///
  /// [state] The animation changed to this state.
  ///
  void onAnimationStateChanged(AnimationState state);
}


// AnimationListener "private" section, not exported.

final _sdkAnimationAnimationlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_animation_AnimationListener_register_finalizer'));
final _sdkAnimationAnimationlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_AnimationListener_copy_handle'));
final _sdkAnimationAnimationlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_AnimationListener_release_handle'));
final _sdkAnimationAnimationlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_animation_AnimationListener_create_proxy'));
final _sdkAnimationAnimationlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_AnimationListener_get_type_id'));


class AnimationListener$Lambdas implements AnimationListener {
  void Function(AnimationState) onAnimationStateChangedLambda;

  AnimationListener$Lambdas(
    this.onAnimationStateChangedLambda,

  );

  @override
  void onAnimationStateChanged(AnimationState state) =>
    onAnimationStateChangedLambda(state);
}

class AnimationListener$Impl extends __lib.NativeBase implements AnimationListener {

  AnimationListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onAnimationStateChanged(AnimationState state) {
    final _onAnimationStateChangedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_animation_AnimationListener_onAnimationStateChanged__AnimationState'));
    final _stateHandle = sdkAnimationAnimationstateToFfi(state);
    final _handle = this.handle;
    _onAnimationStateChangedFfi(_handle, __lib.LibraryContext.isolateId, _stateHandle);
    sdkAnimationAnimationstateReleaseFfiHandle(_stateHandle);

  }


}

int _sdkAnimationAnimationlisteneronAnimationStateChangedStatic(Object _obj, int state) {

  try {
    (_obj as AnimationListener).onAnimationStateChanged(sdkAnimationAnimationstateFromFfi(state));
  } finally {
    sdkAnimationAnimationstateReleaseFfiHandle(state);
  }
  return 0;
}


Pointer<Void> sdkAnimationAnimationlistenerToFfi(AnimationListener value) {
  if (value is __lib.NativeBase) return _sdkAnimationAnimationlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkAnimationAnimationlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Uint32)>(_sdkAnimationAnimationlisteneronAnimationStateChangedStatic, __lib.unknownError)
  );

  return result;
}

AnimationListener sdkAnimationAnimationlistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is AnimationListener) return instance;

  final _typeIdHandle = _sdkAnimationAnimationlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkAnimationAnimationlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : AnimationListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkAnimationAnimationlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkAnimationAnimationlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkAnimationAnimationlistenerReleaseHandle(handle);

Pointer<Void> sdkAnimationAnimationlistenerToFfiNullable(AnimationListener? value) =>
  value != null ? sdkAnimationAnimationlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

AnimationListener? sdkAnimationAnimationlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkAnimationAnimationlistenerFromFfi(handle) : null;

void sdkAnimationAnimationlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationAnimationlistenerReleaseHandle(handle);

// End of AnimationListener "private" section.


