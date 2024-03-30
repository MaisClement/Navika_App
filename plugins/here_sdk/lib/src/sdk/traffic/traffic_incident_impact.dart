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

/// Impact of a traffic incident.
enum TrafficIncidentImpact {
    /// The incident that results in a roadway being closed or is the source of congestion across the area.
    critical,
    /// The incident with a significant impact on traffic flow.
    major,
    /// The incident with a moderate impact on traffic flow.
    minor,
    /// The incident in which traffic is only slightly impacted and can be routed relatively easily.
    low,
    /// The incident impact is not provided by the traffic incidents supplier.
    unknown
}

// TrafficIncidentImpact "private" section, not exported.

int sdkTrafficTrafficincidentimpactToFfi(TrafficIncidentImpact value) {
  switch (value) {
  case TrafficIncidentImpact.critical:
    return 0;
  case TrafficIncidentImpact.major:
    return 1;
  case TrafficIncidentImpact.minor:
    return 2;
  case TrafficIncidentImpact.low:
    return 3;
  case TrafficIncidentImpact.unknown:
    return 4;
  default:
    throw StateError("Invalid enum value $value for TrafficIncidentImpact enum.");
  }
}

TrafficIncidentImpact sdkTrafficTrafficincidentimpactFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TrafficIncidentImpact.critical;
  case 1:
    return TrafficIncidentImpact.major;
  case 2:
    return TrafficIncidentImpact.minor;
  case 3:
    return TrafficIncidentImpact.low;
  case 4:
    return TrafficIncidentImpact.unknown;
  default:
    throw StateError("Invalid numeric value $handle for TrafficIncidentImpact enum.");
  }
}

void sdkTrafficTrafficincidentimpactReleaseFfiHandle(int handle) {}

final _sdkTrafficTrafficincidentimpactCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_traffic_TrafficIncidentImpact_create_handle_nullable'));
final _sdkTrafficTrafficincidentimpactReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentImpact_release_handle_nullable'));
final _sdkTrafficTrafficincidentimpactGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentImpact_get_value_nullable'));

Pointer<Void> sdkTrafficTrafficincidentimpactToFfiNullable(TrafficIncidentImpact? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficTrafficincidentimpactToFfi(value);
  final result = _sdkTrafficTrafficincidentimpactCreateHandleNullable(_handle);
  sdkTrafficTrafficincidentimpactReleaseFfiHandle(_handle);
  return result;
}

TrafficIncidentImpact? sdkTrafficTrafficincidentimpactFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficTrafficincidentimpactGetValueNullable(handle);
  final result = sdkTrafficTrafficincidentimpactFromFfi(_handle);
  sdkTrafficTrafficincidentimpactReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficTrafficincidentimpactReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficincidentimpactReleaseHandleNullable(handle);

// End of TrafficIncidentImpact "private" section.


