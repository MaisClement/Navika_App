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

/// Specifies possible errors that may result from the calculation of a route.
enum RoutingError {
    /// Generic internal error.
    internalError,
    /// An invalid input parameter.
    invalidParameter,
    /// Routing server is unreachable.
    serverUnreachable,
    /// A general network request error.
    httpError,
    /// Routing operation is not authenticated. Check your credentials.
    authenticationFailed,
    /// The provided credentials don't give access to the requested resource.
    forbidden,
    /// Credentials exceeded the allowed requests limit.
    exceededUsageLimit,
    /// Error while parsing route data. This is not expected to happen. Try updating to the newest
    /// version of the SDK. If the problem persists, please report a bug in the SDK.
    parsingError,
    /// No route can be calculated for the given input.
    noRouteFound,
    /// The request timed out.
    timedOut,
    /// The device has no internet connection.
    offline,
    /// No isoline can be calculated for the given input.
    noIsolineFound,
    /// The route has no [Route.routeHandle], but it was used for a feature that requires one.
    /// Consider to recalculate the route with a route handle. See [RouteOptions.enableRouteHandle].
    noRouteHandle,
    /// Operation cancelled.
    operationCancelled,
    /// Destination waypoint could not be matched to a road network. Either this waypoint is far from road network or not enough data has been downloaded.
    /// When both, origin and destination, cannot be matched, then the origin waypoint error will take precedence.
    couldNotMatchDestination,
    /// Origin waypoint could not be matched to a road network. Either this waypoint is far from road network or not enough data has been downloaded.
    /// When both, origin and destination, cannot be matched, then the origin waypoint error will take precedence.
    couldNotMatchOrigin,
    /// No RouteHandle was created.
    failedRouteHandleCreation,
    /// No route section was found for imported waypoints.
    importFailed,
    /// Initial charge is not enough to reach any known charging stations.
    noReachableChargingStationFound,
    /// Calculation did not succeed.
    routeCalculationFailed,
    /// Distance between waypoints is too large for current options.
    routeLengthLimitExceeded,
    /// Route handle decoding failed due to forbidden segments for the specified transport mode.
    violatedTransportModeInRouteHandleDecoding,
    /// Proxy is not authenticated. Check your proxy credentials.
    proxyAuthenticationFailed,
    /// Proxy server unreachable.
    proxyServerUnreachable
}

// RoutingError "private" section, not exported.

int sdkRoutingRoutingerrorToFfi(RoutingError value) {
  switch (value) {
  case RoutingError.internalError:
    return 1;
  case RoutingError.invalidParameter:
    return 2;
  case RoutingError.serverUnreachable:
    return 3;
  case RoutingError.httpError:
    return 4;
  case RoutingError.authenticationFailed:
    return 5;
  case RoutingError.forbidden:
    return 6;
  case RoutingError.exceededUsageLimit:
    return 7;
  case RoutingError.parsingError:
    return 8;
  case RoutingError.noRouteFound:
    return 9;
  case RoutingError.timedOut:
    return 10;
  case RoutingError.offline:
    return 11;
  case RoutingError.noIsolineFound:
    return 12;
  case RoutingError.noRouteHandle:
    return 13;
  case RoutingError.operationCancelled:
    return 14;
  case RoutingError.couldNotMatchDestination:
    return 15;
  case RoutingError.couldNotMatchOrigin:
    return 16;
  case RoutingError.failedRouteHandleCreation:
    return 17;
  case RoutingError.importFailed:
    return 18;
  case RoutingError.noReachableChargingStationFound:
    return 19;
  case RoutingError.routeCalculationFailed:
    return 20;
  case RoutingError.routeLengthLimitExceeded:
    return 21;
  case RoutingError.violatedTransportModeInRouteHandleDecoding:
    return 22;
  case RoutingError.proxyAuthenticationFailed:
    return 23;
  case RoutingError.proxyServerUnreachable:
    return 24;
  default:
    throw StateError("Invalid enum value $value for RoutingError enum.");
  }
}

RoutingError sdkRoutingRoutingerrorFromFfi(int handle) {
  switch (handle) {
  case 1:
    return RoutingError.internalError;
  case 2:
    return RoutingError.invalidParameter;
  case 3:
    return RoutingError.serverUnreachable;
  case 4:
    return RoutingError.httpError;
  case 5:
    return RoutingError.authenticationFailed;
  case 6:
    return RoutingError.forbidden;
  case 7:
    return RoutingError.exceededUsageLimit;
  case 8:
    return RoutingError.parsingError;
  case 9:
    return RoutingError.noRouteFound;
  case 10:
    return RoutingError.timedOut;
  case 11:
    return RoutingError.offline;
  case 12:
    return RoutingError.noIsolineFound;
  case 13:
    return RoutingError.noRouteHandle;
  case 14:
    return RoutingError.operationCancelled;
  case 15:
    return RoutingError.couldNotMatchDestination;
  case 16:
    return RoutingError.couldNotMatchOrigin;
  case 17:
    return RoutingError.failedRouteHandleCreation;
  case 18:
    return RoutingError.importFailed;
  case 19:
    return RoutingError.noReachableChargingStationFound;
  case 20:
    return RoutingError.routeCalculationFailed;
  case 21:
    return RoutingError.routeLengthLimitExceeded;
  case 22:
    return RoutingError.violatedTransportModeInRouteHandleDecoding;
  case 23:
    return RoutingError.proxyAuthenticationFailed;
  case 24:
    return RoutingError.proxyServerUnreachable;
  default:
    throw StateError("Invalid numeric value $handle for RoutingError enum.");
  }
}

void sdkRoutingRoutingerrorReleaseFfiHandle(int handle) {}

final _sdkRoutingRoutingerrorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_RoutingError_create_handle_nullable'));
final _sdkRoutingRoutingerrorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingError_release_handle_nullable'));
final _sdkRoutingRoutingerrorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutingError_get_value_nullable'));

Pointer<Void> sdkRoutingRoutingerrorToFfiNullable(RoutingError? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingRoutingerrorToFfi(value);
  final result = _sdkRoutingRoutingerrorCreateHandleNullable(_handle);
  sdkRoutingRoutingerrorReleaseFfiHandle(_handle);
  return result;
}

RoutingError? sdkRoutingRoutingerrorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingRoutingerrorGetValueNullable(handle);
  final result = sdkRoutingRoutingerrorFromFfi(_handle);
  sdkRoutingRoutingerrorReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingRoutingerrorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRoutingerrorReleaseHandleNullable(handle);

// End of RoutingError "private" section.


