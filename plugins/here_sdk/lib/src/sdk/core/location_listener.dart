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
import 'package:here_sdk/src/sdk/core/location.dart';
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;

/// This abstract class should be implemented in order to receive notifications
/// about location updates.
abstract class LocationListener {
  /// This abstract class should be implemented in order to receive notifications
  /// about location updates.

  factory LocationListener(
    void Function(location_impl.Location) onLocationUpdatedLambda,

  ) => LocationListener$Lambdas(
    onLocationUpdatedLambda,

  );

  /// Called each time a new location is available.
  ///
  /// Invoked on the main thread.
  ///
  /// [location] Current location.
  ///
  void onLocationUpdated(location_impl.Location location);
}


// LocationListener "private" section, not exported.

final _sdkCoreLocationlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_LocationListener_register_finalizer'));
final _sdkCoreLocationlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationListener_copy_handle'));
final _sdkCoreLocationlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationListener_release_handle'));
final _sdkCoreLocationlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_core_LocationListener_create_proxy'));
final _sdkCoreLocationlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationListener_get_type_id'));


class LocationListener$Lambdas implements LocationListener {
  void Function(location_impl.Location) onLocationUpdatedLambda;

  LocationListener$Lambdas(
    this.onLocationUpdatedLambda,

  );

  @override
  void onLocationUpdated(location_impl.Location location) =>
    onLocationUpdatedLambda(location);
}

class LocationListener$Impl extends __lib.NativeBase implements LocationListener {

  LocationListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onLocationUpdated(location_impl.Location location) {
    final _onLocationUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_LocationListener_onLocationUpdated__Location'));
    final _locationHandle = sdkCoreLocationToFfi(location);
    final _handle = this.handle;
    _onLocationUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _locationHandle);
    sdkCoreLocationReleaseFfiHandle(_locationHandle);

  }


}

int _sdkCoreLocationlisteneronLocationUpdatedStatic(Object _obj, Pointer<Void> location) {

  try {
    (_obj as LocationListener).onLocationUpdated(sdkCoreLocationFromFfi(location));
  } finally {
    sdkCoreLocationReleaseFfiHandle(location);
  }
  return 0;
}


Pointer<Void> sdkCoreLocationlistenerToFfi(LocationListener value) {
  if (value is __lib.NativeBase) return _sdkCoreLocationlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkCoreLocationlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkCoreLocationlisteneronLocationUpdatedStatic, __lib.unknownError)
  );

  return result;
}

LocationListener sdkCoreLocationlistenerFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LocationListener) return instance;

  final _typeIdHandle = _sdkCoreLocationlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkCoreLocationlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : LocationListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkCoreLocationlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreLocationlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreLocationlistenerReleaseHandle(handle);

Pointer<Void> sdkCoreLocationlistenerToFfiNullable(LocationListener? value) =>
  value != null ? sdkCoreLocationlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

LocationListener? sdkCoreLocationlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreLocationlistenerFromFfi(handle) : null;

void sdkCoreLocationlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreLocationlistenerReleaseHandle(handle);

// End of LocationListener "private" section.


