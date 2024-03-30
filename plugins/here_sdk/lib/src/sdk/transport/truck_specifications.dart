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
import 'package:here_sdk/src/sdk/transport/truck_type.dart';
import 'package:here_sdk/src/sdk/transport/weight_per_axle_group.dart';

/// Truck specifications contain vehicle related attributes.
///
/// Examples: Dimensions, weight, axle count.
/// Only the fields that are set are considered for restriction handling.

class TruckSpecifications {
  /// Truck weight including trailers and shipped goods in kilograms. The provided value
  /// must be greater than or equal to 0. By default, it is not set.
  int? grossWeightInKilograms;

  /// Heaviest weight per axle, regardless of axle type or axle group.
  /// It is evaluated against all axle weight restrictions, including single axle and tandem axle weight restrictions.
  /// The provided value must be greater or equal to 0.
  /// By default, it is not set.
  /// **Note:** `weight_per_axle_in_kilograms` and `weight_per_axle_group` are incompatible.
  /// When available for your edition, if both attributes are set, during online RoutingEngine an [sdk.routing.RoutingError.INVALID_PARAMETER] error is generated.
  /// Otherwise, when offline RoutingEngine is in place, both parameters are evaluated and the maximum value between them will be used.
  int? weightPerAxleInKilograms;

  /// Allows specification of axle weights in a more fine-grained way than `weight_per_axle_in_kilograms`.
  /// This is relevant in countries with signs and regulations that specify different limits for different axle groups, like the USA and Sweden.
  /// By default is not set.
  /// **Note:** `weight_per_axle_in_kilograms` and `weight_per_axle_group` are incompatible.
  /// When available for your edition, if both attributes are set, during online RoutingEngine an [sdk.routing.RoutingError.INVALID_PARAMETER] error is generated.
  /// Otherwise, when offline RoutingEngine is in place, both parameters are evaluated and the maximum value between them will be used.
  WeightPerAxleGroup? weightPerAxleGroup;

  /// Truck height in centimeters. The provided value must be in the range \[0, 5000\].
  /// By default, it is not set.
  int? heightInCentimeters;

  /// Truck width in centimeters. The provided value must be in the range \[0, 5000\].
  /// By default, it is not set.
  int? widthInCentimeters;

  /// Truck length in centimeters. The provided value must be in the range \[0, 30000\].
  /// By default, it is not set.
  int? lengthInCentimeters;

  /// Defines total number of axles in the vehicle. The provided value must be greater than or
  /// equal to 2. By default, it is not set.
  /// Route calculation: When not set, possible axle count restrictions will not be
  /// taken into consideration.
  /// Rendering `sdk.mapview.TruckProfile`: When set, truck restriction icons for an axle count
  /// greater than [TruckSpecifications.axleCount] will not be displayed.
  int? axleCount;

  /// Defines number of trailers attached to the vehicle. The provided value must be in the range
  /// \[0, 255\]. By default, it is not set.
  int? trailerCount;

  /// Defines the type of truck. By default, it is [TruckType.straight].
  /// Rendering `sdk.mapview.TruckProfile`: [TruckSpecifications.truckType] is ignored and has no effect.
  TruckType truckType;

  /// A flag indicating whether the truck is light enough to be classified more as a car than a truck in Japan.
  /// The flag should not be set to true in other countries than Japan. The flag defaults to false.
  ///
  /// A light truck exempts from many legal restrictions for normal trucks in Japan, for example, which streets
  /// the vehicle can access, which access restrictions apply, and which speed limits are applicable.
  /// Restrictions related to the dimensions of the truck, or its cargo may still apply and setting this flag will
  /// not always overwrite these settings: Make sure to not exceed the specifications that classify a truck as light.
  ///
  /// In Japan, for light trucks the same restrictions apply as for cars. Therefore, when the flag is set to true,
  /// you will get, for example, the same speed limits as for cars. Make sure to set the flag only to true, when
  /// a vehicle matches the classification for light trucks according to the vehicle regulations in Japan.
  ///
  /// When `TruckSpecifications` are set as part of `MapContentSettings`, then this flag will be ignored and
  /// has no effect.
  ///
  /// **Note:**
  /// This flag and the concept of light trucks are supported only in Japan as beta and are considered to be
  /// experimental in other regions. Therefore, for now, it is recommended to use this flag only in Japan.
  /// Note that this is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases with a deprecation process.
  bool isTruckLight;

  /// Allowed payload capacity, including trailers, specified in kilograms. The provided value
  /// must be greater then or equal to 0. By default, it is not set.
  int? payloadCapacityInKilograms;

  /// Creates a new instance.

  /// [grossWeightInKilograms] Truck weight including trailers and shipped goods in kilograms. The provided value
  /// must be greater than or equal to 0. By default, it is not set.

  /// [weightPerAxleInKilograms] Heaviest weight per axle, regardless of axle type or axle group.
  /// It is evaluated against all axle weight restrictions, including single axle and tandem axle weight restrictions.
  /// The provided value must be greater or equal to 0.
  /// By default, it is not set.
  /// **Note:** `weight_per_axle_in_kilograms` and `weight_per_axle_group` are incompatible.
  /// When available for your edition, if both attributes are set, during online RoutingEngine an [sdk.routing.RoutingError.INVALID_PARAMETER] error is generated.
  /// Otherwise, when offline RoutingEngine is in place, both parameters are evaluated and the maximum value between them will be used.

  /// [weightPerAxleGroup] Allows specification of axle weights in a more fine-grained way than `weight_per_axle_in_kilograms`.
  /// This is relevant in countries with signs and regulations that specify different limits for different axle groups, like the USA and Sweden.
  /// By default is not set.
  /// **Note:** `weight_per_axle_in_kilograms` and `weight_per_axle_group` are incompatible.
  /// When available for your edition, if both attributes are set, during online RoutingEngine an [sdk.routing.RoutingError.INVALID_PARAMETER] error is generated.
  /// Otherwise, when offline RoutingEngine is in place, both parameters are evaluated and the maximum value between them will be used.

  /// [heightInCentimeters] Truck height in centimeters. The provided value must be in the range \[0, 5000\].
  /// By default, it is not set.

  /// [widthInCentimeters] Truck width in centimeters. The provided value must be in the range \[0, 5000\].
  /// By default, it is not set.

  /// [lengthInCentimeters] Truck length in centimeters. The provided value must be in the range \[0, 30000\].
  /// By default, it is not set.

  /// [axleCount] Defines total number of axles in the vehicle. The provided value must be greater than or
  /// equal to 2. By default, it is not set.
  /// Route calculation: When not set, possible axle count restrictions will not be
  /// taken into consideration.
  /// Rendering `sdk.mapview.TruckProfile`: When set, truck restriction icons for an axle count
  /// greater than [TruckSpecifications.axleCount] will not be displayed.

  /// [trailerCount] Defines number of trailers attached to the vehicle. The provided value must be in the range
  /// \[0, 255\]. By default, it is not set.

  /// [truckType] Defines the type of truck. By default, it is [TruckType.straight].
  /// Rendering `sdk.mapview.TruckProfile`: [TruckSpecifications.truckType] is ignored and has no effect.

  /// [isTruckLight] A flag indicating whether the truck is light enough to be classified more as a car than a truck in Japan.
  /// The flag should not be set to true in other countries than Japan. The flag defaults to false.
  ///
  /// A light truck exempts from many legal restrictions for normal trucks in Japan, for example, which streets
  /// the vehicle can access, which access restrictions apply, and which speed limits are applicable.
  /// Restrictions related to the dimensions of the truck, or its cargo may still apply and setting this flag will
  /// not always overwrite these settings: Make sure to not exceed the specifications that classify a truck as light.
  ///
  /// In Japan, for light trucks the same restrictions apply as for cars. Therefore, when the flag is set to true,
  /// you will get, for example, the same speed limits as for cars. Make sure to set the flag only to true, when
  /// a vehicle matches the classification for light trucks according to the vehicle regulations in Japan.
  ///
  /// When `TruckSpecifications` are set as part of `MapContentSettings`, then this flag will be ignored and
  /// has no effect.
  ///
  /// **Note:**
  /// This flag and the concept of light trucks are supported only in Japan as beta and are considered to be
  /// experimental in other regions. Therefore, for now, it is recommended to use this flag only in Japan.
  /// Note that this is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases with a deprecation process.

  /// [payloadCapacityInKilograms] Allowed payload capacity, including trailers, specified in kilograms. The provided value
  /// must be greater then or equal to 0. By default, it is not set.

  TruckSpecifications([int? grossWeightInKilograms = null, int? weightPerAxleInKilograms = null, WeightPerAxleGroup? weightPerAxleGroup = null, int? heightInCentimeters = null, int? widthInCentimeters = null, int? lengthInCentimeters = null, int? axleCount = null, int? trailerCount = null, TruckType truckType = TruckType.straight, bool isTruckLight = false, int? payloadCapacityInKilograms = null])
    : grossWeightInKilograms = grossWeightInKilograms, weightPerAxleInKilograms = weightPerAxleInKilograms, weightPerAxleGroup = weightPerAxleGroup, heightInCentimeters = heightInCentimeters, widthInCentimeters = widthInCentimeters, lengthInCentimeters = lengthInCentimeters, axleCount = axleCount, trailerCount = trailerCount, truckType = truckType, isTruckLight = isTruckLight, payloadCapacityInKilograms = payloadCapacityInKilograms;
  /// Creates a new instance.
  TruckSpecifications.withDefaults()
      : grossWeightInKilograms = null, weightPerAxleInKilograms = null, weightPerAxleGroup = null, heightInCentimeters = null, widthInCentimeters = null, lengthInCentimeters = null, axleCount = null, trailerCount = null, truckType = TruckType.straight, isTruckLight = false, payloadCapacityInKilograms = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TruckSpecifications) return false;
    TruckSpecifications _other = other;
    return grossWeightInKilograms == _other.grossWeightInKilograms &&
        weightPerAxleInKilograms == _other.weightPerAxleInKilograms &&
        weightPerAxleGroup == _other.weightPerAxleGroup &&
        heightInCentimeters == _other.heightInCentimeters &&
        widthInCentimeters == _other.widthInCentimeters &&
        lengthInCentimeters == _other.lengthInCentimeters &&
        axleCount == _other.axleCount &&
        trailerCount == _other.trailerCount &&
        truckType == _other.truckType &&
        isTruckLight == _other.isTruckLight &&
        payloadCapacityInKilograms == _other.payloadCapacityInKilograms;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + grossWeightInKilograms.hashCode;
    result = 31 * result + weightPerAxleInKilograms.hashCode;
    result = 31 * result + weightPerAxleGroup.hashCode;
    result = 31 * result + heightInCentimeters.hashCode;
    result = 31 * result + widthInCentimeters.hashCode;
    result = 31 * result + lengthInCentimeters.hashCode;
    result = 31 * result + axleCount.hashCode;
    result = 31 * result + trailerCount.hashCode;
    result = 31 * result + truckType.hashCode;
    result = 31 * result + isTruckLight.hashCode;
    result = 31 * result + payloadCapacityInKilograms.hashCode;
    return result;
  }
}


// TruckSpecifications "private" section, not exported.

final _sdkTransportTruckspecificationsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint32, Uint8, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, int, Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_create_handle'));
final _sdkTransportTruckspecificationsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_release_handle'));
final _sdkTransportTruckspecificationsGetFieldgrossWeightInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_grossWeightInKilograms'));
final _sdkTransportTruckspecificationsGetFieldweightPerAxleInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_weightPerAxleInKilograms'));
final _sdkTransportTruckspecificationsGetFieldweightPerAxleGroup = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_weightPerAxleGroup'));
final _sdkTransportTruckspecificationsGetFieldheightInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_heightInCentimeters'));
final _sdkTransportTruckspecificationsGetFieldwidthInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_widthInCentimeters'));
final _sdkTransportTruckspecificationsGetFieldlengthInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_lengthInCentimeters'));
final _sdkTransportTruckspecificationsGetFieldaxleCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_axleCount'));
final _sdkTransportTruckspecificationsGetFieldtrailerCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_trailerCount'));
final _sdkTransportTruckspecificationsGetFieldtruckType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_truckType'));
final _sdkTransportTruckspecificationsGetFieldisTruckLight = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_isTruckLight'));
final _sdkTransportTruckspecificationsGetFieldpayloadCapacityInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_payloadCapacityInKilograms'));



Pointer<Void> sdkTransportTruckspecificationsToFfi(TruckSpecifications value) {
  final _grossWeightInKilogramsHandle = intToFfiNullable(value.grossWeightInKilograms);
  final _weightPerAxleInKilogramsHandle = intToFfiNullable(value.weightPerAxleInKilograms);
  final _weightPerAxleGroupHandle = sdkTransportWeightperaxlegroupToFfiNullable(value.weightPerAxleGroup);
  final _heightInCentimetersHandle = intToFfiNullable(value.heightInCentimeters);
  final _widthInCentimetersHandle = intToFfiNullable(value.widthInCentimeters);
  final _lengthInCentimetersHandle = intToFfiNullable(value.lengthInCentimeters);
  final _axleCountHandle = intToFfiNullable(value.axleCount);
  final _trailerCountHandle = intToFfiNullable(value.trailerCount);
  final _truckTypeHandle = sdkTransportTrucktypeToFfi(value.truckType);
  final _isTruckLightHandle = booleanToFfi(value.isTruckLight);
  final _payloadCapacityInKilogramsHandle = intToFfiNullable(value.payloadCapacityInKilograms);
  final _result = _sdkTransportTruckspecificationsCreateHandle(_grossWeightInKilogramsHandle, _weightPerAxleInKilogramsHandle, _weightPerAxleGroupHandle, _heightInCentimetersHandle, _widthInCentimetersHandle, _lengthInCentimetersHandle, _axleCountHandle, _trailerCountHandle, _truckTypeHandle, _isTruckLightHandle, _payloadCapacityInKilogramsHandle);
  intReleaseFfiHandleNullable(_grossWeightInKilogramsHandle);
  intReleaseFfiHandleNullable(_weightPerAxleInKilogramsHandle);
  sdkTransportWeightperaxlegroupReleaseFfiHandleNullable(_weightPerAxleGroupHandle);
  intReleaseFfiHandleNullable(_heightInCentimetersHandle);
  intReleaseFfiHandleNullable(_widthInCentimetersHandle);
  intReleaseFfiHandleNullable(_lengthInCentimetersHandle);
  intReleaseFfiHandleNullable(_axleCountHandle);
  intReleaseFfiHandleNullable(_trailerCountHandle);
  sdkTransportTrucktypeReleaseFfiHandle(_truckTypeHandle);
  booleanReleaseFfiHandle(_isTruckLightHandle);
  intReleaseFfiHandleNullable(_payloadCapacityInKilogramsHandle);
  return _result;
}

TruckSpecifications sdkTransportTruckspecificationsFromFfi(Pointer<Void> handle) {
  final _grossWeightInKilogramsHandle = _sdkTransportTruckspecificationsGetFieldgrossWeightInKilograms(handle);
  final _weightPerAxleInKilogramsHandle = _sdkTransportTruckspecificationsGetFieldweightPerAxleInKilograms(handle);
  final _weightPerAxleGroupHandle = _sdkTransportTruckspecificationsGetFieldweightPerAxleGroup(handle);
  final _heightInCentimetersHandle = _sdkTransportTruckspecificationsGetFieldheightInCentimeters(handle);
  final _widthInCentimetersHandle = _sdkTransportTruckspecificationsGetFieldwidthInCentimeters(handle);
  final _lengthInCentimetersHandle = _sdkTransportTruckspecificationsGetFieldlengthInCentimeters(handle);
  final _axleCountHandle = _sdkTransportTruckspecificationsGetFieldaxleCount(handle);
  final _trailerCountHandle = _sdkTransportTruckspecificationsGetFieldtrailerCount(handle);
  final _truckTypeHandle = _sdkTransportTruckspecificationsGetFieldtruckType(handle);
  final _isTruckLightHandle = _sdkTransportTruckspecificationsGetFieldisTruckLight(handle);
  final _payloadCapacityInKilogramsHandle = _sdkTransportTruckspecificationsGetFieldpayloadCapacityInKilograms(handle);
  try {
    return TruckSpecifications(
      intFromFfiNullable(_grossWeightInKilogramsHandle), 
      intFromFfiNullable(_weightPerAxleInKilogramsHandle), 
      sdkTransportWeightperaxlegroupFromFfiNullable(_weightPerAxleGroupHandle), 
      intFromFfiNullable(_heightInCentimetersHandle), 
      intFromFfiNullable(_widthInCentimetersHandle), 
      intFromFfiNullable(_lengthInCentimetersHandle), 
      intFromFfiNullable(_axleCountHandle), 
      intFromFfiNullable(_trailerCountHandle), 
      sdkTransportTrucktypeFromFfi(_truckTypeHandle), 
      booleanFromFfi(_isTruckLightHandle), 
      intFromFfiNullable(_payloadCapacityInKilogramsHandle)
    );
  } finally {
    intReleaseFfiHandleNullable(_grossWeightInKilogramsHandle);
    intReleaseFfiHandleNullable(_weightPerAxleInKilogramsHandle);
    sdkTransportWeightperaxlegroupReleaseFfiHandleNullable(_weightPerAxleGroupHandle);
    intReleaseFfiHandleNullable(_heightInCentimetersHandle);
    intReleaseFfiHandleNullable(_widthInCentimetersHandle);
    intReleaseFfiHandleNullable(_lengthInCentimetersHandle);
    intReleaseFfiHandleNullable(_axleCountHandle);
    intReleaseFfiHandleNullable(_trailerCountHandle);
    sdkTransportTrucktypeReleaseFfiHandle(_truckTypeHandle);
    booleanReleaseFfiHandle(_isTruckLightHandle);
    intReleaseFfiHandleNullable(_payloadCapacityInKilogramsHandle);
  }
}

void sdkTransportTruckspecificationsReleaseFfiHandle(Pointer<Void> handle) => _sdkTransportTruckspecificationsReleaseHandle(handle);

// Nullable TruckSpecifications

final _sdkTransportTruckspecificationsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_create_handle_nullable'));
final _sdkTransportTruckspecificationsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_release_handle_nullable'));
final _sdkTransportTruckspecificationsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_value_nullable'));

Pointer<Void> sdkTransportTruckspecificationsToFfiNullable(TruckSpecifications? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportTruckspecificationsToFfi(value);
  final result = _sdkTransportTruckspecificationsCreateHandleNullable(_handle);
  sdkTransportTruckspecificationsReleaseFfiHandle(_handle);
  return result;
}

TruckSpecifications? sdkTransportTruckspecificationsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportTruckspecificationsGetValueNullable(handle);
  final result = sdkTransportTruckspecificationsFromFfi(_handle);
  sdkTransportTruckspecificationsReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportTruckspecificationsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportTruckspecificationsReleaseHandleNullable(handle);

// End of TruckSpecifications "private" section.


