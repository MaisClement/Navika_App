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
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/isoline.dart';
import 'package:here_sdk/src/sdk/routing/routing_error.dart';

/// A function which is called by the RoutingEngine after isoline calculation has completed.
///
/// It is always called on the main thread.
/// The first argument is the error in case of a failure. It is `null` for an operation that succeeds.
/// The second argument holds a list of calculated isolines. The list is `null` in case of an error.
/// The size of the list matches the size of the provided sdk.routing.IsolineOptions.range_values:
/// For each range limit, one isoline is calculated.
///
/// [p0] The error in case of a failure. It is `null` for an operation that succeeds.
///
/// [p1] Holds a list of calculated isolines. The list is `null` in case of an error.
typedef CalculateIsolineCallback = void Function(RoutingError?, List<Isoline>?);

// CalculateIsolineCallback "private" section, not exported.

final _sdkRoutingCalculateisolinecallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_routing_CalculateIsolineCallback_register_finalizer'));
final _sdkRoutingCalculateisolinecallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CalculateIsolineCallback_copy_handle'));
final _sdkRoutingCalculateisolinecallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CalculateIsolineCallback_release_handle'));
final _sdkRoutingCalculateisolinecallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_routing_CalculateIsolineCallback_create_proxy'));

class CalculateIsolineCallback$Impl {
  final Pointer<Void> handle;
  CalculateIsolineCallback$Impl(this.handle);

  void call(RoutingError? p0, List<Isoline>? p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_CalculateIsolineCallback_call__RoutingError__ListOf_sdk_routing_Isoline_'));
    final _p0Handle = sdkRoutingRoutingerrorToFfiNullable(p0);
    final _p1Handle = heresdkRoutingIsolineBindingslistofSdkRoutingIsolineToFfiNullable(p1);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    sdkRoutingRoutingerrorReleaseFfiHandleNullable(_p0Handle);
    heresdkRoutingIsolineBindingslistofSdkRoutingIsolineReleaseFfiHandleNullable(_p1Handle);

  }

}

int _sdkRoutingCalculateisolinecallbackcallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (_obj as CalculateIsolineCallback)(sdkRoutingRoutingerrorFromFfiNullable(p0), heresdkRoutingIsolineBindingslistofSdkRoutingIsolineFromFfiNullable(p1));
  } finally {
    sdkRoutingRoutingerrorReleaseFfiHandleNullable(p0);
    heresdkRoutingIsolineBindingslistofSdkRoutingIsolineReleaseFfiHandleNullable(p1);
  }
  return 0;
}

Pointer<Void> sdkRoutingCalculateisolinecallbackToFfi(CalculateIsolineCallback value) =>
  _sdkRoutingCalculateisolinecallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkRoutingCalculateisolinecallbackcallStatic, __lib.unknownError)
  );

CalculateIsolineCallback sdkRoutingCalculateisolinecallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkRoutingCalculateisolinecallbackCopyHandle(handle);
  final _impl = CalculateIsolineCallback$Impl(_copiedHandle);
  final result = (RoutingError? p0, List<Isoline>? p1) => _impl.call(p0, p1);
  _sdkRoutingCalculateisolinecallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkRoutingCalculateisolinecallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingCalculateisolinecallbackReleaseHandle(handle);

// Nullable CalculateIsolineCallback

final _sdkRoutingCalculateisolinecallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CalculateIsolineCallback_create_handle_nullable'));
final _sdkRoutingCalculateisolinecallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CalculateIsolineCallback_release_handle_nullable'));
final _sdkRoutingCalculateisolinecallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CalculateIsolineCallback_get_value_nullable'));

Pointer<Void> sdkRoutingCalculateisolinecallbackToFfiNullable(CalculateIsolineCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingCalculateisolinecallbackToFfi(value);
  final result = _sdkRoutingCalculateisolinecallbackCreateHandleNullable(_handle);
  sdkRoutingCalculateisolinecallbackReleaseFfiHandle(_handle);
  return result;
}

CalculateIsolineCallback? sdkRoutingCalculateisolinecallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingCalculateisolinecallbackGetValueNullable(handle);
  final result = sdkRoutingCalculateisolinecallbackFromFfi(_handle);
  sdkRoutingCalculateisolinecallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingCalculateisolinecallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingCalculateisolinecallbackReleaseHandleNullable(handle);

// End of CalculateIsolineCallback "private" section.


