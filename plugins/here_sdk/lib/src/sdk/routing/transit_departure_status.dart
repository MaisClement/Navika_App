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

/// Status of a departure.
enum TransitDepartureStatus {
    /// A trip that is running as planned in the schedule.
    scheduled,
    /// A trip that existed in the schedule but was removed.
    cancelled,
    /// An extra trip that was added in addition to a running schedule,
    /// for example, to respond to sudden passenger load.
    additional,
    /// A trip that was in the schedule but is removed and replaced with
    /// additional trip, for example, to replace a broken vehicle or handle detour.
    replaced
}

// TransitDepartureStatus "private" section, not exported.

int sdkRoutingTransitdeparturestatusToFfi(TransitDepartureStatus value) {
  switch (value) {
  case TransitDepartureStatus.scheduled:
    return 0;
  case TransitDepartureStatus.cancelled:
    return 1;
  case TransitDepartureStatus.additional:
    return 2;
  case TransitDepartureStatus.replaced:
    return 3;
  default:
    throw StateError("Invalid enum value $value for TransitDepartureStatus enum.");
  }
}

TransitDepartureStatus sdkRoutingTransitdeparturestatusFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TransitDepartureStatus.scheduled;
  case 1:
    return TransitDepartureStatus.cancelled;
  case 2:
    return TransitDepartureStatus.additional;
  case 3:
    return TransitDepartureStatus.replaced;
  default:
    throw StateError("Invalid numeric value $handle for TransitDepartureStatus enum.");
  }
}

void sdkRoutingTransitdeparturestatusReleaseFfiHandle(int handle) {}

final _sdkRoutingTransitdeparturestatusCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_TransitDepartureStatus_create_handle_nullable'));
final _sdkRoutingTransitdeparturestatusReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDepartureStatus_release_handle_nullable'));
final _sdkRoutingTransitdeparturestatusGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDepartureStatus_get_value_nullable'));

Pointer<Void> sdkRoutingTransitdeparturestatusToFfiNullable(TransitDepartureStatus? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTransitdeparturestatusToFfi(value);
  final result = _sdkRoutingTransitdeparturestatusCreateHandleNullable(_handle);
  sdkRoutingTransitdeparturestatusReleaseFfiHandle(_handle);
  return result;
}

TransitDepartureStatus? sdkRoutingTransitdeparturestatusFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTransitdeparturestatusGetValueNullable(handle);
  final result = sdkRoutingTransitdeparturestatusFromFfi(_handle);
  sdkRoutingTransitdeparturestatusReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTransitdeparturestatusReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTransitdeparturestatusReleaseHandleNullable(handle);

// End of TransitDepartureStatus "private" section.


