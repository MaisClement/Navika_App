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
import 'package:here_sdk/src/sdk/core/localized_texts.dart';
import 'package:here_sdk/src/sdk/routing/localized_road_numbers.dart';

/// Textual attributes of road.

class RoadTexts {
  /// Road names in available languages.
  /// Empty for unnamed roads.
  LocalizedTexts names;

  /// Road numbers with cardinal direction in available languages.
  /// Empty if the road has no numbers assigned.
  LocalizedRoadNumbers numbersWithDirection;

  /// Creates a new instance.

  /// [names] Road names in available languages.
  /// Empty for unnamed roads.

  /// [numbersWithDirection] Road numbers with cardinal direction in available languages.
  /// Empty if the road has no numbers assigned.

  RoadTexts._(this.names, this.numbersWithDirection);
  /// Creates a new instance.
  RoadTexts.withDefaults()
      : names = LocalizedTexts(), numbersWithDirection = LocalizedRoadNumbers();
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RoadTexts) return false;
    RoadTexts _other = other;
    return names == _other.names &&
        numbersWithDirection == _other.numbersWithDirection;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + names.hashCode;
    result = 31 * result + numbersWithDirection.hashCode;
    return result;
  }
}


// RoadTexts "private" section, not exported.

final _sdkRoutingRoadtextsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_create_handle'));
final _sdkRoutingRoadtextsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_release_handle'));
final _sdkRoutingRoadtextsGetFieldnames = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_get_field_names'));
final _sdkRoutingRoadtextsGetFieldnumbersWithDirection = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_get_field_numbersWithDirection'));



Pointer<Void> sdkRoutingRoadtextsToFfi(RoadTexts value) {
  final _namesHandle = sdkCoreLocalizedtextsToFfi(value.names);
  final _numbersWithDirectionHandle = sdkRoutingLocalizedroadnumbersToFfi(value.numbersWithDirection);
  final _result = _sdkRoutingRoadtextsCreateHandle(_namesHandle, _numbersWithDirectionHandle);
  sdkCoreLocalizedtextsReleaseFfiHandle(_namesHandle);
  sdkRoutingLocalizedroadnumbersReleaseFfiHandle(_numbersWithDirectionHandle);
  return _result;
}

RoadTexts sdkRoutingRoadtextsFromFfi(Pointer<Void> handle) {
  final _namesHandle = _sdkRoutingRoadtextsGetFieldnames(handle);
  final _numbersWithDirectionHandle = _sdkRoutingRoadtextsGetFieldnumbersWithDirection(handle);
  try {
    return RoadTexts._(
      sdkCoreLocalizedtextsFromFfi(_namesHandle), 
      sdkRoutingLocalizedroadnumbersFromFfi(_numbersWithDirectionHandle)
    );
  } finally {
    sdkCoreLocalizedtextsReleaseFfiHandle(_namesHandle);
    sdkRoutingLocalizedroadnumbersReleaseFfiHandle(_numbersWithDirectionHandle);
  }
}

void sdkRoutingRoadtextsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingRoadtextsReleaseHandle(handle);

// Nullable RoadTexts

final _sdkRoutingRoadtextsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_create_handle_nullable'));
final _sdkRoutingRoadtextsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_release_handle_nullable'));
final _sdkRoutingRoadtextsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_get_value_nullable'));

Pointer<Void> sdkRoutingRoadtextsToFfiNullable(RoadTexts? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingRoadtextsToFfi(value);
  final result = _sdkRoutingRoadtextsCreateHandleNullable(_handle);
  sdkRoutingRoadtextsReleaseFfiHandle(_handle);
  return result;
}

RoadTexts? sdkRoutingRoadtextsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingRoadtextsGetValueNullable(handle);
  final result = sdkRoutingRoadtextsFromFfi(_handle);
  sdkRoutingRoadtextsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingRoadtextsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRoadtextsReleaseHandleNullable(handle);

// End of RoadTexts "private" section.


