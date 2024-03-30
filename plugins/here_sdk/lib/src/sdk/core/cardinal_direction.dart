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

/// Indicates the official directional identifier assigned to this road.
///
/// The direction indicates the same information as on the signpost shield text: For example, if it is "101 West", the direction contains WEST.
enum CardinalDirection {
    /// North.
    north,
    /// South.
    south,
    /// East.
    east,
    /// West.
    west
}

// CardinalDirection "private" section, not exported.

int sdkCoreCardinaldirectionToFfi(CardinalDirection value) {
  switch (value) {
  case CardinalDirection.north:
    return 0;
  case CardinalDirection.south:
    return 1;
  case CardinalDirection.east:
    return 2;
  case CardinalDirection.west:
    return 3;
  default:
    throw StateError("Invalid enum value $value for CardinalDirection enum.");
  }
}

CardinalDirection sdkCoreCardinaldirectionFromFfi(int handle) {
  switch (handle) {
  case 0:
    return CardinalDirection.north;
  case 1:
    return CardinalDirection.south;
  case 2:
    return CardinalDirection.east;
  case 3:
    return CardinalDirection.west;
  default:
    throw StateError("Invalid numeric value $handle for CardinalDirection enum.");
  }
}

void sdkCoreCardinaldirectionReleaseFfiHandle(int handle) {}

final _sdkCoreCardinaldirectionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_CardinalDirection_create_handle_nullable'));
final _sdkCoreCardinaldirectionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_CardinalDirection_release_handle_nullable'));
final _sdkCoreCardinaldirectionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_CardinalDirection_get_value_nullable'));

Pointer<Void> sdkCoreCardinaldirectionToFfiNullable(CardinalDirection? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreCardinaldirectionToFfi(value);
  final result = _sdkCoreCardinaldirectionCreateHandleNullable(_handle);
  sdkCoreCardinaldirectionReleaseFfiHandle(_handle);
  return result;
}

CardinalDirection? sdkCoreCardinaldirectionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreCardinaldirectionGetValueNullable(handle);
  final result = sdkCoreCardinaldirectionFromFfi(_handle);
  sdkCoreCardinaldirectionReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreCardinaldirectionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreCardinaldirectionReleaseHandleNullable(handle);

// End of CardinalDirection "private" section.


