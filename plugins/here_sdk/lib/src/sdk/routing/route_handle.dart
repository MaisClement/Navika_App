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
import 'package:here_sdk/src/builtin_types__conversion.dart';

/// Provides an opaque handle to the calculated [Route].
///
/// A handle encodes the calculated route. The route can be decoded from a handle at a
/// later point in time as long as the service uses the same map data which was used during encoding.
/// Note that the [Route.routeHandle] is provided only
/// if [RouteOptions.enableRouteHandle] is set before route calculation.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class RouteHandle {
  /// Handle value as it is provided by routing server.
  String handle;

  /// Creates a new instance.

  /// [handle] Handle value as it is provided by routing server.

  RouteHandle(this.handle);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RouteHandle) return false;
    RouteHandle _other = other;
    return handle == _other.handle;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + handle.hashCode;
    return result;
  }
}


// RouteHandle "private" section, not exported.

final _sdkRoutingRoutehandleCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteHandle_create_handle'));
final _sdkRoutingRoutehandleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteHandle_release_handle'));
final _sdkRoutingRoutehandleGetFieldhandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteHandle_get_field_handle'));



Pointer<Void> sdkRoutingRoutehandleToFfi(RouteHandle value) {
  final _handleHandle = stringToFfi(value.handle);
  final _result = _sdkRoutingRoutehandleCreateHandle(_handleHandle);
  stringReleaseFfiHandle(_handleHandle);
  return _result;
}

RouteHandle sdkRoutingRoutehandleFromFfi(Pointer<Void> handle) {
  final _handleHandle = _sdkRoutingRoutehandleGetFieldhandle(handle);
  try {
    return RouteHandle(
      stringFromFfi(_handleHandle)
    );
  } finally {
    stringReleaseFfiHandle(_handleHandle);
  }
}

void sdkRoutingRoutehandleReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingRoutehandleReleaseHandle(handle);

// Nullable RouteHandle

final _sdkRoutingRoutehandleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteHandle_create_handle_nullable'));
final _sdkRoutingRoutehandleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteHandle_release_handle_nullable'));
final _sdkRoutingRoutehandleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteHandle_get_value_nullable'));

Pointer<Void> sdkRoutingRoutehandleToFfiNullable(RouteHandle? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingRoutehandleToFfi(value);
  final result = _sdkRoutingRoutehandleCreateHandleNullable(_handle);
  sdkRoutingRoutehandleReleaseFfiHandle(_handle);
  return result;
}

RouteHandle? sdkRoutingRoutehandleFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingRoutehandleGetValueNullable(handle);
  final result = sdkRoutingRoutehandleFromFfi(_handle);
  sdkRoutingRoutehandleReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingRoutehandleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRoutehandleReleaseHandleNullable(handle);

// End of RouteHandle "private" section.


