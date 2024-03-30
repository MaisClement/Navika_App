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
import 'package:here_sdk/src/sdk/routing/route_place.dart';
import 'package:here_sdk/src/sdk/routing/transit_departure_status.dart';

/// This struct holds the transit departure or arrival information.

class TransitDeparture {
  /// The departure or arrival place.
  RoutePlace place;

  /// Expected departure or arrival time of the event.
  DateTime? time;

  /// The accumulated delay in seconds from the scheduled time of the event.
  int? delay;

  /// Status of the departure.
  TransitDepartureStatus? status;

  /// Creates a new instance.
  /// [place] The departure or arrival place.
  /// [time] Expected departure or arrival time of the event.
  /// [delay] The accumulated delay in seconds from the scheduled time of the event.
  /// [status] Status of the departure.
  TransitDeparture(this.place, this.time, this.delay, this.status);
}


// TransitDeparture "private" section, not exported.

final _sdkRoutingTransitdepartureCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_create_handle'));
final _sdkRoutingTransitdepartureReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_release_handle'));
final _sdkRoutingTransitdepartureGetFieldplace = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_get_field_place'));
final _sdkRoutingTransitdepartureGetFieldtime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_get_field_time'));
final _sdkRoutingTransitdepartureGetFielddelay = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_get_field_delay'));
final _sdkRoutingTransitdepartureGetFieldstatus = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_get_field_status'));



Pointer<Void> sdkRoutingTransitdepartureToFfi(TransitDeparture value) {
  final _placeHandle = sdkRoutingRouteplaceToFfi(value.place);
  final _timeHandle = dateToFfiNullable(value.time);
  final _delayHandle = intToFfiNullable(value.delay);
  final _statusHandle = sdkRoutingTransitdeparturestatusToFfiNullable(value.status);
  final _result = _sdkRoutingTransitdepartureCreateHandle(_placeHandle, _timeHandle, _delayHandle, _statusHandle);
  sdkRoutingRouteplaceReleaseFfiHandle(_placeHandle);
  dateReleaseFfiHandleNullable(_timeHandle);
  intReleaseFfiHandleNullable(_delayHandle);
  sdkRoutingTransitdeparturestatusReleaseFfiHandleNullable(_statusHandle);
  return _result;
}

TransitDeparture sdkRoutingTransitdepartureFromFfi(Pointer<Void> handle) {
  final _placeHandle = _sdkRoutingTransitdepartureGetFieldplace(handle);
  final _timeHandle = _sdkRoutingTransitdepartureGetFieldtime(handle);
  final _delayHandle = _sdkRoutingTransitdepartureGetFielddelay(handle);
  final _statusHandle = _sdkRoutingTransitdepartureGetFieldstatus(handle);
  try {
    return TransitDeparture(
      sdkRoutingRouteplaceFromFfi(_placeHandle), 
      dateFromFfiNullable(_timeHandle), 
      intFromFfiNullable(_delayHandle), 
      sdkRoutingTransitdeparturestatusFromFfiNullable(_statusHandle)
    );
  } finally {
    sdkRoutingRouteplaceReleaseFfiHandle(_placeHandle);
    dateReleaseFfiHandleNullable(_timeHandle);
    intReleaseFfiHandleNullable(_delayHandle);
    sdkRoutingTransitdeparturestatusReleaseFfiHandleNullable(_statusHandle);
  }
}

void sdkRoutingTransitdepartureReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingTransitdepartureReleaseHandle(handle);

// Nullable TransitDeparture

final _sdkRoutingTransitdepartureCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_create_handle_nullable'));
final _sdkRoutingTransitdepartureReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_release_handle_nullable'));
final _sdkRoutingTransitdepartureGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitDeparture_get_value_nullable'));

Pointer<Void> sdkRoutingTransitdepartureToFfiNullable(TransitDeparture? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTransitdepartureToFfi(value);
  final result = _sdkRoutingTransitdepartureCreateHandleNullable(_handle);
  sdkRoutingTransitdepartureReleaseFfiHandle(_handle);
  return result;
}

TransitDeparture? sdkRoutingTransitdepartureFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTransitdepartureGetValueNullable(handle);
  final result = sdkRoutingTransitdepartureFromFfi(_handle);
  sdkRoutingTransitdepartureReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTransitdepartureReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTransitdepartureReleaseHandleNullable(handle);

// End of TransitDeparture "private" section.


