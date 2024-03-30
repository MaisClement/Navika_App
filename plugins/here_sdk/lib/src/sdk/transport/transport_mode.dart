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

/// Specifies the mode of transport used for route calculalation
enum TransportMode {
    /// The calculated route is optimized for cars.
    car,
    /// The calculated route is optimized for trucks. This mode considers truck restrictions
    /// and uses truck specific speed assumptions when calculating the route.
    truck,
    /// The calculated route is optimized for pedestrians. As one effect, maneuvers will be
    /// optimized for walking, i.e. segments will consider actions relevant for pedestrians
    /// and maneuver instructions will contain texts suitable for a walking person. This mode
    /// disregards any traffic information.
    pedestrian,
    /// The calculated route is optimized for scooters.
    scooter,
    /// Route calculation for bicycles.
    bicycle,
    /// The calculated route is optimized for public transit. Note that this transport mode is
    /// available only for some versions of the HERE SDK. Check [SDKBuildInformation]
    /// and consult your HERE representative if necessary.
    publicTransit,
    /// The taxi transport mode takes into account tax restricted streets as well as streets reserved for
    /// exclusive taxi access. Note that roads that are restricted or reserved for taxis are avoided, unless
    /// a waypoint is set on such a road - as this may indicate to pick-up or to drop-off a passenger.
    ///
    /// **Note:** This is a beta release of this transport mode, so there could be a few bugs and unexpected
    /// behaviors. Related APIs may change for new releases or even become unsupported, without a
    /// deprecation process.
    taxi,
    /// Route calculation for buses.
    /// Denotes those vehicles operated by public transport provider.
    /// This transport mode has the access to the bus-only lane/road.
    bus,
    /// Route calculation for private buses.
    /// Denotes those vehicles operated by private transport company.
    /// This transport mode does not have the access to the bus-only lane/road.
    privateBus
}

// TransportMode "private" section, not exported.

int sdkTransportTransportmodeToFfi(TransportMode value) {
  switch (value) {
  case TransportMode.car:
    return 0;
  case TransportMode.truck:
    return 1;
  case TransportMode.pedestrian:
    return 2;
  case TransportMode.scooter:
    return 3;
  case TransportMode.bicycle:
    return 4;
  case TransportMode.publicTransit:
    return 5;
  case TransportMode.taxi:
    return 6;
  case TransportMode.bus:
    return 7;
  case TransportMode.privateBus:
    return 8;
  default:
    throw StateError("Invalid enum value $value for TransportMode enum.");
  }
}

TransportMode sdkTransportTransportmodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TransportMode.car;
  case 1:
    return TransportMode.truck;
  case 2:
    return TransportMode.pedestrian;
  case 3:
    return TransportMode.scooter;
  case 4:
    return TransportMode.bicycle;
  case 5:
    return TransportMode.publicTransit;
  case 6:
    return TransportMode.taxi;
  case 7:
    return TransportMode.bus;
  case 8:
    return TransportMode.privateBus;
  default:
    throw StateError("Invalid numeric value $handle for TransportMode enum.");
  }
}

void sdkTransportTransportmodeReleaseFfiHandle(int handle) {}

final _sdkTransportTransportmodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_TransportMode_create_handle_nullable'));
final _sdkTransportTransportmodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TransportMode_release_handle_nullable'));
final _sdkTransportTransportmodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TransportMode_get_value_nullable'));

Pointer<Void> sdkTransportTransportmodeToFfiNullable(TransportMode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportTransportmodeToFfi(value);
  final result = _sdkTransportTransportmodeCreateHandleNullable(_handle);
  sdkTransportTransportmodeReleaseFfiHandle(_handle);
  return result;
}

TransportMode? sdkTransportTransportmodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportTransportmodeGetValueNullable(handle);
  final result = sdkTransportTransportmodeFromFfi(_handle);
  sdkTransportTransportmodeReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportTransportmodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportTransportmodeReleaseHandleNullable(handle);

// End of TransportMode "private" section.


