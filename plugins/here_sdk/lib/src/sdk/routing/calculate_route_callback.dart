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
import 'package:here_sdk/src/sdk/routing/route.dart';
import 'package:here_sdk/src/sdk/routing/routing_error.dart';

/// A function which is called by the RoutingEngine after route calculation has completed.
///
/// It is always called on the main thread.
/// The first argument is the error in case of a failure. It is `null` for an operation that succeeds.
/// The second argument is the calculated routes. It is `null` in case of an error.
///
/// [p0] The error in case of a failure. It is `null` for an operation that succeeds.
///
/// [p1] The calculated routes. It is `null` in case of an error.
typedef CalculateRouteCallback = void Function(RoutingError?, List<Route>?);

// CalculateRouteCallback "private" section, not exported.

final _sdkRoutingCalculateroutecallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_routing_CalculateRouteCallback_register_finalizer'));
final _sdkRoutingCalculateroutecallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CalculateRouteCallback_copy_handle'));
final _sdkRoutingCalculateroutecallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CalculateRouteCallback_release_handle'));
final _sdkRoutingCalculateroutecallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_routing_CalculateRouteCallback_create_proxy'));

class CalculateRouteCallback$Impl {
  final Pointer<Void> handle;
  CalculateRouteCallback$Impl(this.handle);

  void call(RoutingError? p0, List<Route>? p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_CalculateRouteCallback_call__RoutingError__ListOf_sdk_routing_Route_'));
    final _p0Handle = sdkRoutingRoutingerrorToFfiNullable(p0);
    final _p1Handle = heresdkRoutingCommonBindingslistofSdkRoutingRouteToFfiNullable(p1);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    sdkRoutingRoutingerrorReleaseFfiHandleNullable(_p0Handle);
    heresdkRoutingCommonBindingslistofSdkRoutingRouteReleaseFfiHandleNullable(_p1Handle);

  }

}

int _sdkRoutingCalculateroutecallbackcallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (_obj as CalculateRouteCallback)(sdkRoutingRoutingerrorFromFfiNullable(p0), heresdkRoutingCommonBindingslistofSdkRoutingRouteFromFfiNullable(p1));
  } finally {
    sdkRoutingRoutingerrorReleaseFfiHandleNullable(p0);
    heresdkRoutingCommonBindingslistofSdkRoutingRouteReleaseFfiHandleNullable(p1);
  }
  return 0;
}

Pointer<Void> sdkRoutingCalculateroutecallbackToFfi(CalculateRouteCallback value) =>
  _sdkRoutingCalculateroutecallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkRoutingCalculateroutecallbackcallStatic, __lib.unknownError)
  );

CalculateRouteCallback sdkRoutingCalculateroutecallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkRoutingCalculateroutecallbackCopyHandle(handle);
  final _impl = CalculateRouteCallback$Impl(_copiedHandle);
  final result = (RoutingError? p0, List<Route>? p1) => _impl.call(p0, p1);
  _sdkRoutingCalculateroutecallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkRoutingCalculateroutecallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingCalculateroutecallbackReleaseHandle(handle);

// Nullable CalculateRouteCallback

final _sdkRoutingCalculateroutecallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CalculateRouteCallback_create_handle_nullable'));
final _sdkRoutingCalculateroutecallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CalculateRouteCallback_release_handle_nullable'));
final _sdkRoutingCalculateroutecallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_CalculateRouteCallback_get_value_nullable'));

Pointer<Void> sdkRoutingCalculateroutecallbackToFfiNullable(CalculateRouteCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingCalculateroutecallbackToFfi(value);
  final result = _sdkRoutingCalculateroutecallbackCreateHandleNullable(_handle);
  sdkRoutingCalculateroutecallbackReleaseFfiHandle(_handle);
  return result;
}

CalculateRouteCallback? sdkRoutingCalculateroutecallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingCalculateroutecallbackGetValueNullable(handle);
  final result = sdkRoutingCalculateroutecallbackFromFfi(_handle);
  sdkRoutingCalculateroutecallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingCalculateroutecallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingCalculateroutecallbackReleaseHandleNullable(handle);

// End of CalculateRouteCallback "private" section.


