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

/// Animation easing functions.
enum EasingFunction {
    /// Linear
    linear,
    /// In quad
    inQuad,
    /// Out quad
    outQuad,
    /// In out quad
    inOutQuad,
    /// Out in quad
    outInQuad,
    /// In qubic
    inCubic,
    /// Out cubic
    outCubic,
    /// In out cubic
    inOutCubic,
    /// Out in cubic
    outInCubic,
    /// In quart
    inQuart,
    /// Out quart
    outQuart,
    /// In out quart
    inOutQuart,
    /// Out in quart
    outInQuart,
    /// In quint
    inQuint,
    /// Out quint
    outQuint,
    /// In out quint
    inOutQuint,
    /// Out in quint
    outInQuint,
    /// In sine
    inSine,
    /// Out sine
    outSine,
    /// In out sine
    inOutSine,
    /// Out in sine
    outInSine,
    /// In exp
    inExp,
    /// Out exp
    outExp,
    /// In out exp
    inOutExp,
    /// Out in exp
    outInExp,
    /// In circ
    inCirc,
    /// Out circ
    outCirc,
    /// In out circ
    inOutCirc,
    /// Out in circ
    outInCirc,
    /// In black
    inBack,
    /// Out black
    outBack,
    /// In out black
    inOutBack,
    /// Out in black
    outInBack,
    /// In bounce
    inBounce,
    /// Out bounce
    outBounce,
    /// In out bounce
    inOutBounce,
    /// Out in bounce
    outInBounce,
    /// In elastic
    inElastic,
    /// Out elastic
    outElastic,
    /// In out elastic
    inOutElastic,
    /// Out in elastic
    outInElastic
}

// EasingFunction "private" section, not exported.

int sdkAnimationEasingfunctionToFfi(EasingFunction value) {
  switch (value) {
  case EasingFunction.linear:
    return 0;
  case EasingFunction.inQuad:
    return 1;
  case EasingFunction.outQuad:
    return 2;
  case EasingFunction.inOutQuad:
    return 3;
  case EasingFunction.outInQuad:
    return 4;
  case EasingFunction.inCubic:
    return 5;
  case EasingFunction.outCubic:
    return 6;
  case EasingFunction.inOutCubic:
    return 7;
  case EasingFunction.outInCubic:
    return 8;
  case EasingFunction.inQuart:
    return 9;
  case EasingFunction.outQuart:
    return 10;
  case EasingFunction.inOutQuart:
    return 11;
  case EasingFunction.outInQuart:
    return 12;
  case EasingFunction.inQuint:
    return 13;
  case EasingFunction.outQuint:
    return 14;
  case EasingFunction.inOutQuint:
    return 15;
  case EasingFunction.outInQuint:
    return 16;
  case EasingFunction.inSine:
    return 17;
  case EasingFunction.outSine:
    return 18;
  case EasingFunction.inOutSine:
    return 19;
  case EasingFunction.outInSine:
    return 20;
  case EasingFunction.inExp:
    return 21;
  case EasingFunction.outExp:
    return 22;
  case EasingFunction.inOutExp:
    return 23;
  case EasingFunction.outInExp:
    return 24;
  case EasingFunction.inCirc:
    return 25;
  case EasingFunction.outCirc:
    return 26;
  case EasingFunction.inOutCirc:
    return 27;
  case EasingFunction.outInCirc:
    return 28;
  case EasingFunction.inBack:
    return 29;
  case EasingFunction.outBack:
    return 30;
  case EasingFunction.inOutBack:
    return 31;
  case EasingFunction.outInBack:
    return 32;
  case EasingFunction.inBounce:
    return 33;
  case EasingFunction.outBounce:
    return 34;
  case EasingFunction.inOutBounce:
    return 35;
  case EasingFunction.outInBounce:
    return 36;
  case EasingFunction.inElastic:
    return 37;
  case EasingFunction.outElastic:
    return 38;
  case EasingFunction.inOutElastic:
    return 39;
  case EasingFunction.outInElastic:
    return 40;
  default:
    throw StateError("Invalid enum value $value for EasingFunction enum.");
  }
}

EasingFunction sdkAnimationEasingfunctionFromFfi(int handle) {
  switch (handle) {
  case 0:
    return EasingFunction.linear;
  case 1:
    return EasingFunction.inQuad;
  case 2:
    return EasingFunction.outQuad;
  case 3:
    return EasingFunction.inOutQuad;
  case 4:
    return EasingFunction.outInQuad;
  case 5:
    return EasingFunction.inCubic;
  case 6:
    return EasingFunction.outCubic;
  case 7:
    return EasingFunction.inOutCubic;
  case 8:
    return EasingFunction.outInCubic;
  case 9:
    return EasingFunction.inQuart;
  case 10:
    return EasingFunction.outQuart;
  case 11:
    return EasingFunction.inOutQuart;
  case 12:
    return EasingFunction.outInQuart;
  case 13:
    return EasingFunction.inQuint;
  case 14:
    return EasingFunction.outQuint;
  case 15:
    return EasingFunction.inOutQuint;
  case 16:
    return EasingFunction.outInQuint;
  case 17:
    return EasingFunction.inSine;
  case 18:
    return EasingFunction.outSine;
  case 19:
    return EasingFunction.inOutSine;
  case 20:
    return EasingFunction.outInSine;
  case 21:
    return EasingFunction.inExp;
  case 22:
    return EasingFunction.outExp;
  case 23:
    return EasingFunction.inOutExp;
  case 24:
    return EasingFunction.outInExp;
  case 25:
    return EasingFunction.inCirc;
  case 26:
    return EasingFunction.outCirc;
  case 27:
    return EasingFunction.inOutCirc;
  case 28:
    return EasingFunction.outInCirc;
  case 29:
    return EasingFunction.inBack;
  case 30:
    return EasingFunction.outBack;
  case 31:
    return EasingFunction.inOutBack;
  case 32:
    return EasingFunction.outInBack;
  case 33:
    return EasingFunction.inBounce;
  case 34:
    return EasingFunction.outBounce;
  case 35:
    return EasingFunction.inOutBounce;
  case 36:
    return EasingFunction.outInBounce;
  case 37:
    return EasingFunction.inElastic;
  case 38:
    return EasingFunction.outElastic;
  case 39:
    return EasingFunction.inOutElastic;
  case 40:
    return EasingFunction.outInElastic;
  default:
    throw StateError("Invalid numeric value $handle for EasingFunction enum.");
  }
}

void sdkAnimationEasingfunctionReleaseFfiHandle(int handle) {}

final _sdkAnimationEasingfunctionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_animation_EasingFunction_create_handle_nullable'));
final _sdkAnimationEasingfunctionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_EasingFunction_release_handle_nullable'));
final _sdkAnimationEasingfunctionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_EasingFunction_get_value_nullable'));

Pointer<Void> sdkAnimationEasingfunctionToFfiNullable(EasingFunction? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkAnimationEasingfunctionToFfi(value);
  final result = _sdkAnimationEasingfunctionCreateHandleNullable(_handle);
  sdkAnimationEasingfunctionReleaseFfiHandle(_handle);
  return result;
}

EasingFunction? sdkAnimationEasingfunctionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkAnimationEasingfunctionGetValueNullable(handle);
  final result = sdkAnimationEasingfunctionFromFfi(_handle);
  sdkAnimationEasingfunctionReleaseFfiHandle(_handle);
  return result;
}

void sdkAnimationEasingfunctionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationEasingfunctionReleaseHandleNullable(handle);

// End of EasingFunction "private" section.


