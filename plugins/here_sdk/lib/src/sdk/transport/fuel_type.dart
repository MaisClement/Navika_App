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

/// Defines possible fuel types provided by a fuel station.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and
/// unexpected behaviors. Related APIs may change for new releases without a deprecation process.
enum FuelType {
    /// Diesel fuel type.
    diesel,
    /// Liquified petroleum gas fuel type.
    lpg,
    /// Bio-Diesel fuel type.
    bioDiesel,
    /// Compressed natural gas fuel type.
    cng,
    /// Diesel with additives fuel type.
    dieselWithAdditives,
    /// 10% Ethanol and 90% Gasoline fuel type.
    e10,
    /// 20% Ethanol and 80% Gasoline fuel type.
    e20,
    /// 85% Ethanol and 15% Gasoline fuel type.
    e85,
    /// Ethanol fuel type.
    ethanol,
    /// Ethanol with additives fuel type.
    ethanolWithAdditives,
    /// Gasoline fuel type.
    gasoline,
    /// Gasohol 91 fuel type.
    gasohol91,
    /// Gasohol 95 fuel type.
    gasohol95,
    /// Hydrotreated vegetable oil fuel type.
    hvo,
    /// Hydrogen fuel type.
    hydrogen,
    /// Liquefied natural gas fuel type.
    lng,
    /// Midgrade fuel type.
    midgrade,
    /// Premium fuel type.
    premium,
    /// Premium with additives fuel type.
    premiumWithAdditives,
    /// Regular fuel type.
    regular,
    /// Regular with additives fuel type.
    regularWithAdditives,
    /// Octane 87 fuel type.
    octane87,
    /// Octane 89 fuel type.
    octane89,
    /// Octane 90 fuel type.
    octane90,
    /// Octane 91 fuel type.
    octane91,
    /// Octane 92 fuel type.
    octane92,
    /// Octane 93 fuel type.
    octane93,
    /// Octane 95 fuel type.
    octane95,
    /// Octane 98 fuel type.
    octane98,
    /// Octane 100 fuel type.
    octane100
}

// FuelType "private" section, not exported.

int sdkTransportFueltypeToFfi(FuelType value) {
  switch (value) {
  case FuelType.diesel:
    return 1;
  case FuelType.lpg:
    return 2;
  case FuelType.bioDiesel:
    return 3;
  case FuelType.cng:
    return 4;
  case FuelType.dieselWithAdditives:
    return 5;
  case FuelType.e10:
    return 6;
  case FuelType.e20:
    return 7;
  case FuelType.e85:
    return 8;
  case FuelType.ethanol:
    return 9;
  case FuelType.ethanolWithAdditives:
    return 10;
  case FuelType.gasoline:
    return 11;
  case FuelType.gasohol91:
    return 12;
  case FuelType.gasohol95:
    return 13;
  case FuelType.hvo:
    return 14;
  case FuelType.hydrogen:
    return 15;
  case FuelType.lng:
    return 16;
  case FuelType.midgrade:
    return 17;
  case FuelType.premium:
    return 18;
  case FuelType.premiumWithAdditives:
    return 19;
  case FuelType.regular:
    return 20;
  case FuelType.regularWithAdditives:
    return 21;
  case FuelType.octane87:
    return 22;
  case FuelType.octane89:
    return 23;
  case FuelType.octane90:
    return 24;
  case FuelType.octane91:
    return 25;
  case FuelType.octane92:
    return 26;
  case FuelType.octane93:
    return 27;
  case FuelType.octane95:
    return 28;
  case FuelType.octane98:
    return 29;
  case FuelType.octane100:
    return 30;
  default:
    throw StateError("Invalid enum value $value for FuelType enum.");
  }
}

FuelType sdkTransportFueltypeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return FuelType.diesel;
  case 2:
    return FuelType.lpg;
  case 3:
    return FuelType.bioDiesel;
  case 4:
    return FuelType.cng;
  case 5:
    return FuelType.dieselWithAdditives;
  case 6:
    return FuelType.e10;
  case 7:
    return FuelType.e20;
  case 8:
    return FuelType.e85;
  case 9:
    return FuelType.ethanol;
  case 10:
    return FuelType.ethanolWithAdditives;
  case 11:
    return FuelType.gasoline;
  case 12:
    return FuelType.gasohol91;
  case 13:
    return FuelType.gasohol95;
  case 14:
    return FuelType.hvo;
  case 15:
    return FuelType.hydrogen;
  case 16:
    return FuelType.lng;
  case 17:
    return FuelType.midgrade;
  case 18:
    return FuelType.premium;
  case 19:
    return FuelType.premiumWithAdditives;
  case 20:
    return FuelType.regular;
  case 21:
    return FuelType.regularWithAdditives;
  case 22:
    return FuelType.octane87;
  case 23:
    return FuelType.octane89;
  case 24:
    return FuelType.octane90;
  case 25:
    return FuelType.octane91;
  case 26:
    return FuelType.octane92;
  case 27:
    return FuelType.octane93;
  case 28:
    return FuelType.octane95;
  case 29:
    return FuelType.octane98;
  case 30:
    return FuelType.octane100;
  default:
    throw StateError("Invalid numeric value $handle for FuelType enum.");
  }
}

void sdkTransportFueltypeReleaseFfiHandle(int handle) {}

final _sdkTransportFueltypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_FuelType_create_handle_nullable'));
final _sdkTransportFueltypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_FuelType_release_handle_nullable'));
final _sdkTransportFueltypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_FuelType_get_value_nullable'));

Pointer<Void> sdkTransportFueltypeToFfiNullable(FuelType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportFueltypeToFfi(value);
  final result = _sdkTransportFueltypeCreateHandleNullable(_handle);
  sdkTransportFueltypeReleaseFfiHandle(_handle);
  return result;
}

FuelType? sdkTransportFueltypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportFueltypeGetValueNullable(handle);
  final result = sdkTransportFueltypeFromFfi(_handle);
  sdkTransportFueltypeReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportFueltypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportFueltypeReleaseHandleNullable(handle);

// End of FuelType "private" section.


