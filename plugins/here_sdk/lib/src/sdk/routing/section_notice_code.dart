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

/// Notice codes which point the issues encountered during processing of a [Section].
///
/// **Note:** The section notice codes are going to be extended for new error situations.
enum SectionNoticeCode {
    /// Route has violoated a non-detailed critical rule.
    /// Severity: [NoticeSeverity.critical].
    violatedCriticalRule,
    /// Route did not manage to avoid user preference.
    /// Severity: [NoticeSeverity.critical].
    violatedAvoidControlledAccessHighway,
    /// Route did not manage to avoid user preference.
    /// Severity: [NoticeSeverity.critical].
    violatedAvoidTollRoad,
    /// Route did not manage to avoid user preference.
    /// Severity: [NoticeSeverity.critical].
    violatedAvoidFerry,
    /// Route did not manage to avoid user preference.
    /// Severity: [NoticeSeverity.critical].
    violatedAvoidTunnel,
    /// Route did not manage to avoid user preference.
    /// Severity: [NoticeSeverity.critical].
    violatedAvoidDirtRoad,
    /// Route did not manage to avoid user preference.
    /// Severity: [NoticeSeverity.critical].
    violatedAvoidRailFerry,
    /// Route did not manage to avoid user preference.
    /// Severity: [NoticeSeverity.critical].
    violatedAvoidPark,
    /// Route uses roads blocked by traffic events or
    /// route did not manage to avoid the requested
    /// `avoidAreas` or `countries` or `segments`.
    /// Severity: [NoticeSeverity.critical].
    violatedBlockedRoad,
    /// Start direction of the route is not as requested.
    /// Severity: [NoticeSeverity.critical].
    violatedStartDirection,
    /// Route did not manage to avoid user preference.
    /// Severity: [NoticeSeverity.critical].
    violatedCarpool,
    /// Route uses a time-restricted turn.
    /// Severity: [NoticeSeverity.critical].
    violatedTurnRestriction,
    /// Route uses a road which is forbidden for the given vehicle profile.
    /// Severity: [NoticeSeverity.critical].
    violatedVehicleRestriction,
    /// Route uses a road which is part of restricted `zoneCategories`
    /// requested to be avoided by user.
    /// Severity: [NoticeSeverity.critical].
    violatedZoneRestriction,
    /// Route did not manage to avoid u turns.
    /// Severity: [NoticeSeverity.critical].
    violatedAvoidUTurns,
    /// Route goes through an emergency gate.
    /// Severity: [NoticeSeverity.critical].
    violatedEmergencyGate,
    /// Route did not manage to avoid seasonal closure.
    /// Severity: [NoticeSeverity.critical].
    violatedAvoidSeasonalClosure,
    /// Route did not manage to avoid restricted truck road types.
    violatedAvoidTruckRoadType,
    /// Route did not manage to avoid toll booth that requires transponder.
    /// Severity: [NoticeSeverity.critical].
    violatedAvoidTollTransponder,
    /// Charging at the charging station planned at the destination of this section falls outside of opening hours.
    /// Severity: [NoticeSeverity.critical].
    violatedChargingStationOpeningHours,
    /// Route did not manage to avoid difficult turns.
    /// Severity: [NoticeSeverity.critical].
    violatedAvoidDifficultTurns,
    /// Route goes through seasonal closure.
    /// Severity: [NoticeSeverity.info].
    seasonalClosure,
    /// Route goes through toll booth that requires transponder.
    /// Severity: [NoticeSeverity.info].
    tollTransponder,
    /// Tolls data was requested but could not be calculated for this section.
    /// Severity: [NoticeSeverity.info].
    tollsDataUnavailable,
    /// Tolls data was requested but is temporarily unavailable.
    /// Severity: [NoticeSeverity.info].
    tollsDataTemporarilyUnavailable,
    /// A charging stop was planned at the destination of this section, but it is no longer
    /// needed. It may be issued only when refreshing a route via [RouteHandle].
    /// Severity: [NoticeSeverity.info].
    chargingStopNotNeeded,
    /// No schedule information is available for a transit section. As a result, departure/arrival times are approximated.
    /// Severity: [NoticeSeverity.info].
    noSchedule,
    /// Information about intermediate stops is not available for a transit section.
    /// Severity: [NoticeSeverity.info].
    noIntermediate,
    /// This transit section contains a transport mode that was explictly disabled.
    /// Mode filtering is not available in this area.
    /// Severity: [NoticeSeverity.info].
    unwantedMode,
    /// This transit section returned times which are scheduled times, even though delay information is available.
    /// Severity: [NoticeSeverity.info].
    scheduledTimes,
    /// An accurate polyline is not available for this section. An accurate polyline is not available for this
    /// section. The returned polyline has been generated from departure and arrival places.
    /// Severity: [NoticeSeverity.info].
    simplePolyline,
    /// Route utilizes a designated carpool lane, potentially subject to restrictions beyond the scheduled travel hours.
    /// Severity: [NoticeSeverity.info].
    potentialCarpool,
    /// Route includes a turn that is potentially restricted and inaccessible beyond the scheduled travel hours.
    /// Severity: [NoticeSeverity.info].
    potentialTurnRestriction,
    /// Route utilizes roads that are potentially off-limits to the specified vehicle profile beyond the scheduled travel hours.
    /// Severity: [NoticeSeverity.info].
    potentialVehicleRestriction,
    /// Route incorporates roads within zones, which are potentially not accessible beyond the scheduled travel hours.
    /// Severity: [NoticeSeverity.info].
    potentialZoneRestriction
}

// SectionNoticeCode "private" section, not exported.

int sdkRoutingSectionnoticecodeToFfi(SectionNoticeCode value) {
  switch (value) {
  case SectionNoticeCode.violatedCriticalRule:
    return 0;
  case SectionNoticeCode.violatedAvoidControlledAccessHighway:
    return 1;
  case SectionNoticeCode.violatedAvoidTollRoad:
    return 2;
  case SectionNoticeCode.violatedAvoidFerry:
    return 3;
  case SectionNoticeCode.violatedAvoidTunnel:
    return 4;
  case SectionNoticeCode.violatedAvoidDirtRoad:
    return 5;
  case SectionNoticeCode.violatedAvoidRailFerry:
    return 6;
  case SectionNoticeCode.violatedAvoidPark:
    return 7;
  case SectionNoticeCode.violatedBlockedRoad:
    return 8;
  case SectionNoticeCode.violatedStartDirection:
    return 9;
  case SectionNoticeCode.violatedCarpool:
    return 10;
  case SectionNoticeCode.violatedTurnRestriction:
    return 11;
  case SectionNoticeCode.violatedVehicleRestriction:
    return 12;
  case SectionNoticeCode.violatedZoneRestriction:
    return 13;
  case SectionNoticeCode.violatedAvoidUTurns:
    return 14;
  case SectionNoticeCode.violatedEmergencyGate:
    return 15;
  case SectionNoticeCode.violatedAvoidSeasonalClosure:
    return 16;
  case SectionNoticeCode.violatedAvoidTruckRoadType:
    return 17;
  case SectionNoticeCode.violatedAvoidTollTransponder:
    return 18;
  case SectionNoticeCode.violatedChargingStationOpeningHours:
    return 19;
  case SectionNoticeCode.violatedAvoidDifficultTurns:
    return 20;
  case SectionNoticeCode.seasonalClosure:
    return 21;
  case SectionNoticeCode.tollTransponder:
    return 22;
  case SectionNoticeCode.tollsDataUnavailable:
    return 23;
  case SectionNoticeCode.tollsDataTemporarilyUnavailable:
    return 24;
  case SectionNoticeCode.chargingStopNotNeeded:
    return 25;
  case SectionNoticeCode.noSchedule:
    return 26;
  case SectionNoticeCode.noIntermediate:
    return 27;
  case SectionNoticeCode.unwantedMode:
    return 28;
  case SectionNoticeCode.scheduledTimes:
    return 29;
  case SectionNoticeCode.simplePolyline:
    return 30;
  case SectionNoticeCode.potentialCarpool:
    return 31;
  case SectionNoticeCode.potentialTurnRestriction:
    return 32;
  case SectionNoticeCode.potentialVehicleRestriction:
    return 33;
  case SectionNoticeCode.potentialZoneRestriction:
    return 34;
  default:
    throw StateError("Invalid enum value $value for SectionNoticeCode enum.");
  }
}

SectionNoticeCode sdkRoutingSectionnoticecodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return SectionNoticeCode.violatedCriticalRule;
  case 1:
    return SectionNoticeCode.violatedAvoidControlledAccessHighway;
  case 2:
    return SectionNoticeCode.violatedAvoidTollRoad;
  case 3:
    return SectionNoticeCode.violatedAvoidFerry;
  case 4:
    return SectionNoticeCode.violatedAvoidTunnel;
  case 5:
    return SectionNoticeCode.violatedAvoidDirtRoad;
  case 6:
    return SectionNoticeCode.violatedAvoidRailFerry;
  case 7:
    return SectionNoticeCode.violatedAvoidPark;
  case 8:
    return SectionNoticeCode.violatedBlockedRoad;
  case 9:
    return SectionNoticeCode.violatedStartDirection;
  case 10:
    return SectionNoticeCode.violatedCarpool;
  case 11:
    return SectionNoticeCode.violatedTurnRestriction;
  case 12:
    return SectionNoticeCode.violatedVehicleRestriction;
  case 13:
    return SectionNoticeCode.violatedZoneRestriction;
  case 14:
    return SectionNoticeCode.violatedAvoidUTurns;
  case 15:
    return SectionNoticeCode.violatedEmergencyGate;
  case 16:
    return SectionNoticeCode.violatedAvoidSeasonalClosure;
  case 17:
    return SectionNoticeCode.violatedAvoidTruckRoadType;
  case 18:
    return SectionNoticeCode.violatedAvoidTollTransponder;
  case 19:
    return SectionNoticeCode.violatedChargingStationOpeningHours;
  case 20:
    return SectionNoticeCode.violatedAvoidDifficultTurns;
  case 21:
    return SectionNoticeCode.seasonalClosure;
  case 22:
    return SectionNoticeCode.tollTransponder;
  case 23:
    return SectionNoticeCode.tollsDataUnavailable;
  case 24:
    return SectionNoticeCode.tollsDataTemporarilyUnavailable;
  case 25:
    return SectionNoticeCode.chargingStopNotNeeded;
  case 26:
    return SectionNoticeCode.noSchedule;
  case 27:
    return SectionNoticeCode.noIntermediate;
  case 28:
    return SectionNoticeCode.unwantedMode;
  case 29:
    return SectionNoticeCode.scheduledTimes;
  case 30:
    return SectionNoticeCode.simplePolyline;
  case 31:
    return SectionNoticeCode.potentialCarpool;
  case 32:
    return SectionNoticeCode.potentialTurnRestriction;
  case 33:
    return SectionNoticeCode.potentialVehicleRestriction;
  case 34:
    return SectionNoticeCode.potentialZoneRestriction;
  default:
    throw StateError("Invalid numeric value $handle for SectionNoticeCode enum.");
  }
}

void sdkRoutingSectionnoticecodeReleaseFfiHandle(int handle) {}

final _sdkRoutingSectionnoticecodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_SectionNoticeCode_create_handle_nullable'));
final _sdkRoutingSectionnoticecodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNoticeCode_release_handle_nullable'));
final _sdkRoutingSectionnoticecodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionNoticeCode_get_value_nullable'));

Pointer<Void> sdkRoutingSectionnoticecodeToFfiNullable(SectionNoticeCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingSectionnoticecodeToFfi(value);
  final result = _sdkRoutingSectionnoticecodeCreateHandleNullable(_handle);
  sdkRoutingSectionnoticecodeReleaseFfiHandle(_handle);
  return result;
}

SectionNoticeCode? sdkRoutingSectionnoticecodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingSectionnoticecodeGetValueNullable(handle);
  final result = sdkRoutingSectionnoticecodeFromFfi(_handle);
  sdkRoutingSectionnoticecodeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingSectionnoticecodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingSectionnoticecodeReleaseHandleNullable(handle);

// End of SectionNoticeCode "private" section.


