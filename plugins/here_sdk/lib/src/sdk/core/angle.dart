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
import 'package:meta/meta.dart';

/// Represents an angle independent of the unit of measurement.
abstract class Angle {

  /// Creates a new angle object based on the supplied angle value in degrees.
  ///
  /// [angle] Angle value in degrees.
  ///
  /// Returns [Angle]. The angle as specified by input in degrees.
  ///
  static Angle fromDegrees(double angle) => $prototype.fromDegrees(angle);
  /// Creates a new angle object based on the supplied angle value in radians.
  ///
  /// [angle] Angle value in radians.
  ///
  /// Returns [Angle]. The angle as specified by input in radians.
  ///
  static Angle fromRadians(double angle) => $prototype.fromRadians(angle);
  /// Gets the value of this angle in degrees.
  double get degrees;

  /// Gets the value of this angle in radians.
  double get radians;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Angle$Impl(Pointer<Void>.fromAddress(0));
}


// Angle "private" section, not exported.

final _sdkCoreAngleRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_Angle_register_finalizer'));
final _sdkCoreAngleCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_Angle_copy_handle'));
final _sdkCoreAngleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_Angle_release_handle'));




/// @nodoc
@visibleForTesting
class Angle$Impl extends __lib.NativeBase implements Angle {

  Angle$Impl(Pointer<Void> handle) : super(handle);

  Angle fromDegrees(double angle) {
    final _fromDegreesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double), Pointer<Void> Function(int, double)>('here_sdk_sdk_core_Angle_fromDegrees__Double'));
    final _angleHandle = (angle);
    final __resultHandle = _fromDegreesFfi(__lib.LibraryContext.isolateId, _angleHandle);

    try {
      return sdkCoreAngleFromFfi(__resultHandle);
    } finally {
      sdkCoreAngleReleaseFfiHandle(__resultHandle);

    }

  }

  Angle fromRadians(double angle) {
    final _fromRadiansFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double), Pointer<Void> Function(int, double)>('here_sdk_sdk_core_Angle_fromRadians__Double'));
    final _angleHandle = (angle);
    final __resultHandle = _fromRadiansFfi(__lib.LibraryContext.isolateId, _angleHandle);

    try {
      return sdkCoreAngleFromFfi(__resultHandle);
    } finally {
      sdkCoreAngleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  double get degrees {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_core_Angle_degrees_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  double get radians {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_core_Angle_radians_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }



}

Pointer<Void> sdkCoreAngleToFfi(Angle value) =>
  _sdkCoreAngleCopyHandle((value as __lib.NativeBase).handle);

Angle sdkCoreAngleFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Angle) return instance;

  final _copiedHandle = _sdkCoreAngleCopyHandle(handle);
  final result = Angle$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkCoreAngleRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreAngleReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreAngleReleaseHandle(handle);

Pointer<Void> sdkCoreAngleToFfiNullable(Angle? value) =>
  value != null ? sdkCoreAngleToFfi(value) : Pointer<Void>.fromAddress(0);

Angle? sdkCoreAngleFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreAngleFromFfi(handle) : null;

void sdkCoreAngleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreAngleReleaseHandle(handle);

// End of Angle "private" section.


