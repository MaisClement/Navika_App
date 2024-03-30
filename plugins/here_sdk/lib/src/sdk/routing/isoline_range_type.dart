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

/// Specifies the type of one or more range values to be included in the isoline.
///
/// This value defines the restriction that is used to calculate the reachable area.
enum IsolineRangeType {
    /// Distance range in meters. The corresponding values must be 1000000 at the most.
    /// Otherwise, the request will fail.
    distanceInMeters,
    /// Time range in seconds. The corresponding values must be 32400 at the most.
    /// Otherwise, the request will fail.
    timeInSeconds,
    /// Consumption range in Wh. The corresponding values must be 300000 at the most.
    /// Otherwise, the request will fail.
    consumptionInWattHours
}

// IsolineRangeType "private" section, not exported.

int sdkRoutingIsolinerangetypeToFfi(IsolineRangeType value) {
  switch (value) {
  case IsolineRangeType.distanceInMeters:
    return 0;
  case IsolineRangeType.timeInSeconds:
    return 1;
  case IsolineRangeType.consumptionInWattHours:
    return 2;
  default:
    throw StateError("Invalid enum value $value for IsolineRangeType enum.");
  }
}

IsolineRangeType sdkRoutingIsolinerangetypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return IsolineRangeType.distanceInMeters;
  case 1:
    return IsolineRangeType.timeInSeconds;
  case 2:
    return IsolineRangeType.consumptionInWattHours;
  default:
    throw StateError("Invalid numeric value $handle for IsolineRangeType enum.");
  }
}

void sdkRoutingIsolinerangetypeReleaseFfiHandle(int handle) {}

final _sdkRoutingIsolinerangetypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_IsolineRangeType_create_handle_nullable'));
final _sdkRoutingIsolinerangetypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineRangeType_release_handle_nullable'));
final _sdkRoutingIsolinerangetypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineRangeType_get_value_nullable'));

Pointer<Void> sdkRoutingIsolinerangetypeToFfiNullable(IsolineRangeType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingIsolinerangetypeToFfi(value);
  final result = _sdkRoutingIsolinerangetypeCreateHandleNullable(_handle);
  sdkRoutingIsolinerangetypeReleaseFfiHandle(_handle);
  return result;
}

IsolineRangeType? sdkRoutingIsolinerangetypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingIsolinerangetypeGetValueNullable(handle);
  final result = sdkRoutingIsolinerangetypeFromFfi(_handle);
  sdkRoutingIsolinerangetypeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingIsolinerangetypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingIsolinerangetypeReleaseHandleNullable(handle);

// End of IsolineRangeType "private" section.


