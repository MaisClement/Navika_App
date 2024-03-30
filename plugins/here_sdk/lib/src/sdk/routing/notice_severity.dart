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

/// Describes the impact a notice has on the resource to which the notice is attached.
enum NoticeSeverity {
    /// The notice must not be ignored, even if the type of notice is not known to the user.
    /// Any associated resource (e.g., route section) must not be used without further evaluation.
    critical,
    /// The notice is for informative purposes, but does not affect usability of the route.
    info
}

// NoticeSeverity "private" section, not exported.

int sdkRoutingNoticeseverityToFfi(NoticeSeverity value) {
  switch (value) {
  case NoticeSeverity.critical:
    return 0;
  case NoticeSeverity.info:
    return 1;
  default:
    throw StateError("Invalid enum value $value for NoticeSeverity enum.");
  }
}

NoticeSeverity sdkRoutingNoticeseverityFromFfi(int handle) {
  switch (handle) {
  case 0:
    return NoticeSeverity.critical;
  case 1:
    return NoticeSeverity.info;
  default:
    throw StateError("Invalid numeric value $handle for NoticeSeverity enum.");
  }
}

void sdkRoutingNoticeseverityReleaseFfiHandle(int handle) {}

final _sdkRoutingNoticeseverityCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_NoticeSeverity_create_handle_nullable'));
final _sdkRoutingNoticeseverityReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_NoticeSeverity_release_handle_nullable'));
final _sdkRoutingNoticeseverityGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_NoticeSeverity_get_value_nullable'));

Pointer<Void> sdkRoutingNoticeseverityToFfiNullable(NoticeSeverity? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingNoticeseverityToFfi(value);
  final result = _sdkRoutingNoticeseverityCreateHandleNullable(_handle);
  sdkRoutingNoticeseverityReleaseFfiHandle(_handle);
  return result;
}

NoticeSeverity? sdkRoutingNoticeseverityFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingNoticeseverityGetValueNullable(handle);
  final result = sdkRoutingNoticeseverityFromFfi(_handle);
  sdkRoutingNoticeseverityReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingNoticeseverityReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingNoticeseverityReleaseHandleNullable(handle);

// End of NoticeSeverity "private" section.


