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
import 'package:here_sdk/src/sdk/routing/transit_departure.dart';

/// A transit stop between the departure and destination of a transit section.

class TransitStop {
  /// Departure.
  TransitDeparture departure;

  /// Stop duration. If not set, the vehicle departs as soon as people
  /// are on board.
  /// Defaults to `null`.
  Duration? duration;

  /// Creates a new instance.

  /// [departure] Departure.

  /// [duration] Stop duration. If not set, the vehicle departs as soon as people
  /// are on board.
  /// Defaults to `null`.

  TransitStop._(this.departure, this.duration);
  TransitStop(TransitDeparture departure)
    : departure = departure, duration = null;
}


// TransitStop "private" section, not exported.

final _sdkRoutingTransitstopCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TransitStop_create_handle'));
final _sdkRoutingTransitstopReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitStop_release_handle'));
final _sdkRoutingTransitstopGetFielddeparture = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitStop_get_field_departure'));
final _sdkRoutingTransitstopGetFieldduration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitStop_get_field_duration'));



Pointer<Void> sdkRoutingTransitstopToFfi(TransitStop value) {
  final _departureHandle = sdkRoutingTransitdepartureToFfi(value.departure);
  final _durationHandle = durationToFfiNullable(value.duration);
  final _result = _sdkRoutingTransitstopCreateHandle(_departureHandle, _durationHandle);
  sdkRoutingTransitdepartureReleaseFfiHandle(_departureHandle);
  durationReleaseFfiHandleNullable(_durationHandle);
  return _result;
}

TransitStop sdkRoutingTransitstopFromFfi(Pointer<Void> handle) {
  final _departureHandle = _sdkRoutingTransitstopGetFielddeparture(handle);
  final _durationHandle = _sdkRoutingTransitstopGetFieldduration(handle);
  try {
    return TransitStop._(
      sdkRoutingTransitdepartureFromFfi(_departureHandle), 
      durationFromFfiNullable(_durationHandle)
    );
  } finally {
    sdkRoutingTransitdepartureReleaseFfiHandle(_departureHandle);
    durationReleaseFfiHandleNullable(_durationHandle);
  }
}

void sdkRoutingTransitstopReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingTransitstopReleaseHandle(handle);

// Nullable TransitStop

final _sdkRoutingTransitstopCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitStop_create_handle_nullable'));
final _sdkRoutingTransitstopReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitStop_release_handle_nullable'));
final _sdkRoutingTransitstopGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitStop_get_value_nullable'));

Pointer<Void> sdkRoutingTransitstopToFfiNullable(TransitStop? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTransitstopToFfi(value);
  final result = _sdkRoutingTransitstopCreateHandleNullable(_handle);
  sdkRoutingTransitstopReleaseFfiHandle(_handle);
  return result;
}

TransitStop? sdkRoutingTransitstopFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTransitstopGetValueNullable(handle);
  final result = sdkRoutingTransitstopFromFfi(_handle);
  sdkRoutingTransitstopReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTransitstopReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTransitstopReleaseHandleNullable(handle);

// End of TransitStop "private" section.


