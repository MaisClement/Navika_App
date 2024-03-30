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

/// Category of a traffic incident.
enum TrafficIncidentType {
    /// Traffic accident.
    accident,
    /// Traffic congestion.
    congestion,
    /// Construction work.
    construction,
    /// Overturned or broken down vehicle(s) on the road.
    disabledVehicle,
    /// Incident involving mass transit such as rail or subway.
    massTransit,
    /// Incident involving activities such as sport events or festivals.
    plannedEvent,
    /// Dangerous obstruction on the road such as downed tree or traffic light out.
    roadHazard,
    /// Adverse weather conditions.
    weather,
    /// Road closure.
    roadClosure,
    /// Lane restriction.
    laneRestriction,
    /// The incident is known but it does't fit into any of the other categories.
    other,
    /// The incident type is not provided by the traffic incidents supplier or not recognized by HERE SDK.
    unknown
}

// TrafficIncidentType "private" section, not exported.

int sdkTrafficTrafficincidenttypeToFfi(TrafficIncidentType value) {
  switch (value) {
  case TrafficIncidentType.accident:
    return 0;
  case TrafficIncidentType.congestion:
    return 1;
  case TrafficIncidentType.construction:
    return 2;
  case TrafficIncidentType.disabledVehicle:
    return 3;
  case TrafficIncidentType.massTransit:
    return 4;
  case TrafficIncidentType.plannedEvent:
    return 5;
  case TrafficIncidentType.roadHazard:
    return 6;
  case TrafficIncidentType.weather:
    return 7;
  case TrafficIncidentType.roadClosure:
    return 8;
  case TrafficIncidentType.laneRestriction:
    return 9;
  case TrafficIncidentType.other:
    return 10;
  case TrafficIncidentType.unknown:
    return 11;
  default:
    throw StateError("Invalid enum value $value for TrafficIncidentType enum.");
  }
}

TrafficIncidentType sdkTrafficTrafficincidenttypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TrafficIncidentType.accident;
  case 1:
    return TrafficIncidentType.congestion;
  case 2:
    return TrafficIncidentType.construction;
  case 3:
    return TrafficIncidentType.disabledVehicle;
  case 4:
    return TrafficIncidentType.massTransit;
  case 5:
    return TrafficIncidentType.plannedEvent;
  case 6:
    return TrafficIncidentType.roadHazard;
  case 7:
    return TrafficIncidentType.weather;
  case 8:
    return TrafficIncidentType.roadClosure;
  case 9:
    return TrafficIncidentType.laneRestriction;
  case 10:
    return TrafficIncidentType.other;
  case 11:
    return TrafficIncidentType.unknown;
  default:
    throw StateError("Invalid numeric value $handle for TrafficIncidentType enum.");
  }
}

void sdkTrafficTrafficincidenttypeReleaseFfiHandle(int handle) {}

final _sdkTrafficTrafficincidenttypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_traffic_TrafficIncidentType_create_handle_nullable'));
final _sdkTrafficTrafficincidenttypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentType_release_handle_nullable'));
final _sdkTrafficTrafficincidenttypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentType_get_value_nullable'));

Pointer<Void> sdkTrafficTrafficincidenttypeToFfiNullable(TrafficIncidentType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficTrafficincidenttypeToFfi(value);
  final result = _sdkTrafficTrafficincidenttypeCreateHandleNullable(_handle);
  sdkTrafficTrafficincidenttypeReleaseFfiHandle(_handle);
  return result;
}

TrafficIncidentType? sdkTrafficTrafficincidenttypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficTrafficincidenttypeGetValueNullable(handle);
  final result = sdkTrafficTrafficincidenttypeFromFfi(_handle);
  sdkTrafficTrafficincidenttypeReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficTrafficincidenttypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficincidenttypeReleaseHandleNullable(handle);

// End of TrafficIncidentType "private" section.


