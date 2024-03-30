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

/// Bus specifications contain vehicle related attributes.
///
/// Examples: height, weight, width.
/// Only the fields that are set are considered for restriction handling.

class BusSpecifications {
  /// Total vehicle weight in kilograms.
  /// By default, it is not set.
  int? grossWeightInKilograms;

  /// Bus height in centimeters.
  /// By default, it is not set.
  int? heightInCentimeters;

  /// Bus width in centimeters.
  /// By default, it is not set.
  int? widthInCentimeters;

  /// Bus length in centimeters.
  /// By default, it is not set.
  int? lengthInCentimeters;

  /// Last character of bus license plate in String format. This value can be used to
  /// evaluate restriction in environmental zones.
  /// By default, it is not set.
  String? lastCharacterOfLicensePlate;

  /// Creates a new instance.

  /// [grossWeightInKilograms] Total vehicle weight in kilograms.
  /// By default, it is not set.

  /// [heightInCentimeters] Bus height in centimeters.
  /// By default, it is not set.

  /// [widthInCentimeters] Bus width in centimeters.
  /// By default, it is not set.

  /// [lengthInCentimeters] Bus length in centimeters.
  /// By default, it is not set.

  /// [lastCharacterOfLicensePlate] Last character of bus license plate in String format. This value can be used to
  /// evaluate restriction in environmental zones.
  /// By default, it is not set.

  BusSpecifications([int? grossWeightInKilograms = null, int? heightInCentimeters = null, int? widthInCentimeters = null, int? lengthInCentimeters = null, String? lastCharacterOfLicensePlate = null])
    : grossWeightInKilograms = grossWeightInKilograms, heightInCentimeters = heightInCentimeters, widthInCentimeters = widthInCentimeters, lengthInCentimeters = lengthInCentimeters, lastCharacterOfLicensePlate = lastCharacterOfLicensePlate;
  /// Creates a new instance.
  BusSpecifications.withDefaults()
      : grossWeightInKilograms = null, heightInCentimeters = null, widthInCentimeters = null, lengthInCentimeters = null, lastCharacterOfLicensePlate = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BusSpecifications) return false;
    BusSpecifications _other = other;
    return grossWeightInKilograms == _other.grossWeightInKilograms &&
        heightInCentimeters == _other.heightInCentimeters &&
        widthInCentimeters == _other.widthInCentimeters &&
        lengthInCentimeters == _other.lengthInCentimeters &&
        lastCharacterOfLicensePlate == _other.lastCharacterOfLicensePlate;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + grossWeightInKilograms.hashCode;
    result = 31 * result + heightInCentimeters.hashCode;
    result = 31 * result + widthInCentimeters.hashCode;
    result = 31 * result + lengthInCentimeters.hashCode;
    result = 31 * result + lastCharacterOfLicensePlate.hashCode;
    return result;
  }
}


// BusSpecifications "private" section, not exported.

final _sdkTransportBusspecificationsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_transport_BusSpecifications_create_handle'));
final _sdkTransportBusspecificationsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_BusSpecifications_release_handle'));
final _sdkTransportBusspecificationsGetFieldgrossWeightInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_BusSpecifications_get_field_grossWeightInKilograms'));
final _sdkTransportBusspecificationsGetFieldheightInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_BusSpecifications_get_field_heightInCentimeters'));
final _sdkTransportBusspecificationsGetFieldwidthInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_BusSpecifications_get_field_widthInCentimeters'));
final _sdkTransportBusspecificationsGetFieldlengthInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_BusSpecifications_get_field_lengthInCentimeters'));
final _sdkTransportBusspecificationsGetFieldlastCharacterOfLicensePlate = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_BusSpecifications_get_field_lastCharacterOfLicensePlate'));



Pointer<Void> sdkTransportBusspecificationsToFfi(BusSpecifications value) {
  final _grossWeightInKilogramsHandle = intToFfiNullable(value.grossWeightInKilograms);
  final _heightInCentimetersHandle = intToFfiNullable(value.heightInCentimeters);
  final _widthInCentimetersHandle = intToFfiNullable(value.widthInCentimeters);
  final _lengthInCentimetersHandle = intToFfiNullable(value.lengthInCentimeters);
  final _lastCharacterOfLicensePlateHandle = stringToFfiNullable(value.lastCharacterOfLicensePlate);
  final _result = _sdkTransportBusspecificationsCreateHandle(_grossWeightInKilogramsHandle, _heightInCentimetersHandle, _widthInCentimetersHandle, _lengthInCentimetersHandle, _lastCharacterOfLicensePlateHandle);
  intReleaseFfiHandleNullable(_grossWeightInKilogramsHandle);
  intReleaseFfiHandleNullable(_heightInCentimetersHandle);
  intReleaseFfiHandleNullable(_widthInCentimetersHandle);
  intReleaseFfiHandleNullable(_lengthInCentimetersHandle);
  stringReleaseFfiHandleNullable(_lastCharacterOfLicensePlateHandle);
  return _result;
}

BusSpecifications sdkTransportBusspecificationsFromFfi(Pointer<Void> handle) {
  final _grossWeightInKilogramsHandle = _sdkTransportBusspecificationsGetFieldgrossWeightInKilograms(handle);
  final _heightInCentimetersHandle = _sdkTransportBusspecificationsGetFieldheightInCentimeters(handle);
  final _widthInCentimetersHandle = _sdkTransportBusspecificationsGetFieldwidthInCentimeters(handle);
  final _lengthInCentimetersHandle = _sdkTransportBusspecificationsGetFieldlengthInCentimeters(handle);
  final _lastCharacterOfLicensePlateHandle = _sdkTransportBusspecificationsGetFieldlastCharacterOfLicensePlate(handle);
  try {
    return BusSpecifications(
      intFromFfiNullable(_grossWeightInKilogramsHandle), 
      intFromFfiNullable(_heightInCentimetersHandle), 
      intFromFfiNullable(_widthInCentimetersHandle), 
      intFromFfiNullable(_lengthInCentimetersHandle), 
      stringFromFfiNullable(_lastCharacterOfLicensePlateHandle)
    );
  } finally {
    intReleaseFfiHandleNullable(_grossWeightInKilogramsHandle);
    intReleaseFfiHandleNullable(_heightInCentimetersHandle);
    intReleaseFfiHandleNullable(_widthInCentimetersHandle);
    intReleaseFfiHandleNullable(_lengthInCentimetersHandle);
    stringReleaseFfiHandleNullable(_lastCharacterOfLicensePlateHandle);
  }
}

void sdkTransportBusspecificationsReleaseFfiHandle(Pointer<Void> handle) => _sdkTransportBusspecificationsReleaseHandle(handle);

// Nullable BusSpecifications

final _sdkTransportBusspecificationsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_BusSpecifications_create_handle_nullable'));
final _sdkTransportBusspecificationsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_BusSpecifications_release_handle_nullable'));
final _sdkTransportBusspecificationsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_BusSpecifications_get_value_nullable'));

Pointer<Void> sdkTransportBusspecificationsToFfiNullable(BusSpecifications? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportBusspecificationsToFfi(value);
  final result = _sdkTransportBusspecificationsCreateHandleNullable(_handle);
  sdkTransportBusspecificationsReleaseFfiHandle(_handle);
  return result;
}

BusSpecifications? sdkTransportBusspecificationsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportBusspecificationsGetValueNullable(handle);
  final result = sdkTransportBusspecificationsFromFfi(_handle);
  sdkTransportBusspecificationsReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportBusspecificationsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportBusspecificationsReleaseHandleNullable(handle);

// End of BusSpecifications "private" section.


