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
import 'dart:ui' as ui;
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'color_converter.dart';

/// Type representing a color in RGBA space.
///
/// Color components are in float range \[0, 1\].

class ColorInternal {
  /// The red component of the color in the range \[0, 1\].
  double r;

  /// The green component of the color in the range \[0, 1\].
  double g;

  /// The blue component of the color in the range \[0, 1\].
  double b;

  /// The alpha component of the color in the range \[0, 1\].
  double a;

  ColorInternal(this.r, this.g, this.b, this.a);
}


// Color "private" section, not exported.

final _sdkCoreColorCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Float, Float, Float, Float),
    Pointer<Void> Function(double, double, double, double)
  >('here_sdk_sdk_core_Color_create_handle'));
final _sdkCoreColorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_release_handle'));
final _sdkCoreColorGetFieldr = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_get_field_r'));
final _sdkCoreColorGetFieldg = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_get_field_g'));
final _sdkCoreColorGetFieldb = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_get_field_b'));
final _sdkCoreColorGetFielda = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Float Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_get_field_a'));



Pointer<Void> sdkCoreColorToFfi(ui.Color valueExternal) {
  final value = ColorConverter.convertToInternal(valueExternal);
  final _rHandle = (value.r);
  final _gHandle = (value.g);
  final _bHandle = (value.b);
  final _aHandle = (value.a);
  final _result = _sdkCoreColorCreateHandle(_rHandle, _gHandle, _bHandle, _aHandle);
  
  
  
  
  return _result;
}

ui.Color sdkCoreColorFromFfi(Pointer<Void> handle) {
  final _rHandle = _sdkCoreColorGetFieldr(handle);
  final _gHandle = _sdkCoreColorGetFieldg(handle);
  final _bHandle = _sdkCoreColorGetFieldb(handle);
  final _aHandle = _sdkCoreColorGetFielda(handle);
  try {
    final resultInternal = ColorInternal(
      (_rHandle), 
      (_gHandle), 
      (_bHandle), 
      (_aHandle)
    );
    return ColorConverter.convertFromInternal(resultInternal);
  } finally {
    
    
    
    
  }
}

void sdkCoreColorReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreColorReleaseHandle(handle);

// Nullable Color

final _sdkCoreColorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_create_handle_nullable'));
final _sdkCoreColorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_release_handle_nullable'));
final _sdkCoreColorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Color_get_value_nullable'));

Pointer<Void> sdkCoreColorToFfiNullable(ui.Color? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreColorToFfi(value);
  final result = _sdkCoreColorCreateHandleNullable(_handle);
  sdkCoreColorReleaseFfiHandle(_handle);
  return result;
}

ui.Color? sdkCoreColorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreColorGetValueNullable(handle);
  final result = sdkCoreColorFromFfi(_handle);
  sdkCoreColorReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreColorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreColorReleaseHandleNullable(handle);

// End of Color "private" section.


