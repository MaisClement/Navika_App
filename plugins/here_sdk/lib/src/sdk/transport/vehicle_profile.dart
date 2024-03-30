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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/transport/emission_standard.dart';
import 'package:here_sdk/src/sdk/transport/fuel_type.dart';
import 'package:here_sdk/src/sdk/transport/hazardous_material.dart';
import 'package:here_sdk/src/sdk/transport/plate_number_type.dart';
import 'package:here_sdk/src/sdk/transport/truck_type.dart';
import 'package:here_sdk/src/sdk/transport/tunnel_category.dart';
import 'package:here_sdk/src/sdk/transport/vehicle_equipment.dart';
import 'package:here_sdk/src/sdk/transport/vehicle_type.dart';

/// A vehicle profile describes the vehicle being used with the HSDK.
///
/// The profile is planned to be used as single source of information describing the vehicle.
///
/// Current modules that use this profile:
/// - Navigation: Tracking mode for truck related vehicle restrictions.
///
/// **Note:** This is a beta release of this vehicle profile, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases or even become unsupported, without a
/// deprecation process.

class VehicleProfile {
  /// Defines the vehicle type.
  VehicleType vehicleType;

  /// @nodoc
  PlateNumberType? _plateNumberType;

  /// @nodoc
  FuelType? _fuelType;

  /// @nodoc
  VehicleEquipment _equipment;

  /// Defines the type of truck.
  /// Only used when the [VehicleProfile.vehicleType] is [VehicleType.truck]
  /// By default, it is not set.
  TruckType? truckType;

  /// Defines number of trailers attached to the vehicle. The provided value must be in the range
  /// \[0, 255\]. When not set, possible trailer count restrictions will not be taken into consideration
  /// for route calculation. By default, it is 0.
  int trailerCount;

  /// @nodoc
  bool _isTaxi;

  /// @nodoc
  int _occupantsCount;

  /// @nodoc
  EmissionStandard? _emissionStandard;

  /// Specifies a list of hazardous materials shipped in the vehicle.
  /// Refer to [HazardousMaterial] for the available options.
  List<HazardousMaterial> hazardousMaterials;

  /// Specifies the tunnel categories to restrict certain route links.
  /// The route will pass only through tunnels of a less strict category.
  /// Refer to [TunnelCategory] for the available options.
  TunnelCategory? tunnelCategory;

  /// Defines total number of axles in the vehicle. The provided value must be greater than or
  /// equal to 2. When not set, possible axle count restrictions will not be taken into
  /// consideration for route calculation. By default, it is not set.
  int? axleCount;

  /// Vehicle weight including trailers and shipped goods in kilograms.
  /// By default, it is not set.
  int? grossWeightInKilograms;

  /// Vehicle height in centimeters. The provided value must be in the range \[0, 5000\].
  /// By default, it is not set.
  int? heightInCentimeters;

  /// Vehicle length in centimeters. The provided value must be in the range \[0, 30000\].
  /// By default, it is not set.
  int? lengthInCentimeters;

  /// Vehicle width in centimeters. The provided value must be in the range \[0, 5000\].
  /// By default, it is not set.
  int? widthInCentimeters;

  /// Vehicle weight per axle in kilograms. The provided value must be greater or equal to 0.
  /// When not set, possible weight per axle restrictions will not be taken into
  /// consideration for route calculation. By default, it is not set.
  int? weightPerAxleInKilograms;

  /// Creates a new instance.

  /// [vehicleType] Defines the vehicle type.

  /// [plateNumberType] 

  /// [fuelType] 

  /// [equipment] 

  /// [truckType] Defines the type of truck.
  /// Only used when the [VehicleProfile.vehicleType] is [VehicleType.truck]
  /// By default, it is not set.

  /// [trailerCount] Defines number of trailers attached to the vehicle. The provided value must be in the range
  /// \[0, 255\]. When not set, possible trailer count restrictions will not be taken into consideration
  /// for route calculation. By default, it is 0.

  /// [isTaxi] 

  /// [occupantsCount] 

  /// [emissionStandard] 

  /// [hazardousMaterials] Specifies a list of hazardous materials shipped in the vehicle.
  /// Refer to [HazardousMaterial] for the available options.

  /// [tunnelCategory] Specifies the tunnel categories to restrict certain route links.
  /// The route will pass only through tunnels of a less strict category.
  /// Refer to [TunnelCategory] for the available options.

  /// [axleCount] Defines total number of axles in the vehicle. The provided value must be greater than or
  /// equal to 2. When not set, possible axle count restrictions will not be taken into
  /// consideration for route calculation. By default, it is not set.

  /// [grossWeightInKilograms] Vehicle weight including trailers and shipped goods in kilograms.
  /// By default, it is not set.

  /// [heightInCentimeters] Vehicle height in centimeters. The provided value must be in the range \[0, 5000\].
  /// By default, it is not set.

  /// [lengthInCentimeters] Vehicle length in centimeters. The provided value must be in the range \[0, 30000\].
  /// By default, it is not set.

  /// [widthInCentimeters] Vehicle width in centimeters. The provided value must be in the range \[0, 5000\].
  /// By default, it is not set.

  /// [weightPerAxleInKilograms] Vehicle weight per axle in kilograms. The provided value must be greater or equal to 0.
  /// When not set, possible weight per axle restrictions will not be taken into
  /// consideration for route calculation. By default, it is not set.

  VehicleProfile._(this.vehicleType, this._plateNumberType, this._fuelType, this._equipment, this.truckType, this.trailerCount, this._isTaxi, this._occupantsCount, this._emissionStandard, this.hazardousMaterials, this.tunnelCategory, this.axleCount, this.grossWeightInKilograms, this.heightInCentimeters, this.lengthInCentimeters, this.widthInCentimeters, this.weightPerAxleInKilograms);
  /// Creates a new instance.
  /// [vehicleType] Defines the vehicle type.
  VehicleProfile(this.vehicleType)
      : _plateNumberType = null, _fuelType = null, _equipment = VehicleEquipment(), truckType = null, trailerCount = 0, _isTaxi = false, _occupantsCount = 1, _emissionStandard = null, hazardousMaterials = [], tunnelCategory = null, axleCount = null, grossWeightInKilograms = null, heightInCentimeters = null, lengthInCentimeters = null, widthInCentimeters = null, weightPerAxleInKilograms = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VehicleProfile) return false;
    VehicleProfile _other = other;
    return vehicleType == _other.vehicleType &&
        _plateNumberType == _other._plateNumberType &&
        _fuelType == _other._fuelType &&
        _equipment == _other._equipment &&
        truckType == _other.truckType &&
        trailerCount == _other.trailerCount &&
        _isTaxi == _other._isTaxi &&
        _occupantsCount == _other._occupantsCount &&
        _emissionStandard == _other._emissionStandard &&
        DeepCollectionEquality().equals(hazardousMaterials, _other.hazardousMaterials) &&
        tunnelCategory == _other.tunnelCategory &&
        axleCount == _other.axleCount &&
        grossWeightInKilograms == _other.grossWeightInKilograms &&
        heightInCentimeters == _other.heightInCentimeters &&
        lengthInCentimeters == _other.lengthInCentimeters &&
        widthInCentimeters == _other.widthInCentimeters &&
        weightPerAxleInKilograms == _other.weightPerAxleInKilograms;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + vehicleType.hashCode;
    result = 31 * result + _plateNumberType.hashCode;
    result = 31 * result + _fuelType.hashCode;
    result = 31 * result + _equipment.hashCode;
    result = 31 * result + truckType.hashCode;
    result = 31 * result + trailerCount.hashCode;
    result = 31 * result + _isTaxi.hashCode;
    result = 31 * result + _occupantsCount.hashCode;
    result = 31 * result + _emissionStandard.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(hazardousMaterials);
    result = 31 * result + tunnelCategory.hashCode;
    result = 31 * result + axleCount.hashCode;
    result = 31 * result + grossWeightInKilograms.hashCode;
    result = 31 * result + heightInCentimeters.hashCode;
    result = 31 * result + lengthInCentimeters.hashCode;
    result = 31 * result + widthInCentimeters.hashCode;
    result = 31 * result + weightPerAxleInKilograms.hashCode;
    return result;
  }
}


// VehicleProfile "private" section, not exported.

final _sdkTransportVehicleprofileCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Int32, Uint8, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, int, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_create_handle'));
final _sdkTransportVehicleprofileReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_release_handle'));
final _sdkTransportVehicleprofileGetFieldvehicleType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_vehicleType'));
final _sdkTransportVehicleprofileGetFieldplateNumberType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_plateNumberType'));
final _sdkTransportVehicleprofileGetFieldfuelType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_fuelType'));
final _sdkTransportVehicleprofileGetFieldequipment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_equipment'));
final _sdkTransportVehicleprofileGetFieldtruckType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_truckType'));
final _sdkTransportVehicleprofileGetFieldtrailerCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_trailerCount'));
final _sdkTransportVehicleprofileGetFieldisTaxi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_isTaxi'));
final _sdkTransportVehicleprofileGetFieldoccupantsCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_occupantsCount'));
final _sdkTransportVehicleprofileGetFieldemissionStandard = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_emissionStandard'));
final _sdkTransportVehicleprofileGetFieldhazardousMaterials = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_hazardousMaterials'));
final _sdkTransportVehicleprofileGetFieldtunnelCategory = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_tunnelCategory'));
final _sdkTransportVehicleprofileGetFieldaxleCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_axleCount'));
final _sdkTransportVehicleprofileGetFieldgrossWeightInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_grossWeightInKilograms'));
final _sdkTransportVehicleprofileGetFieldheightInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_heightInCentimeters'));
final _sdkTransportVehicleprofileGetFieldlengthInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_lengthInCentimeters'));
final _sdkTransportVehicleprofileGetFieldwidthInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_widthInCentimeters'));
final _sdkTransportVehicleprofileGetFieldweightPerAxleInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_field_weightPerAxleInKilograms'));



Pointer<Void> sdkTransportVehicleprofileToFfi(VehicleProfile value) {
  final _vehicleTypeHandle = sdkTransportVehicletypeToFfi(value.vehicleType);
  final _plateNumberTypeHandle = sdkTransportPlatenumbertypeToFfiNullable(value._plateNumberType);
  final _fuelTypeHandle = sdkTransportFueltypeToFfiNullable(value._fuelType);
  final _equipmentHandle = sdkTransportVehicleequipmentToFfi(value._equipment);
  final _truckTypeHandle = sdkTransportTrucktypeToFfiNullable(value.truckType);
  final _trailerCountHandle = (value.trailerCount);
  final _isTaxiHandle = booleanToFfi(value._isTaxi);
  final _occupantsCountHandle = (value._occupantsCount);
  final _emissionStandardHandle = sdkTransportEmissionstandardToFfiNullable(value._emissionStandard);
  final _hazardousMaterialsHandle = heresdkCoreBindingslistofSdkTransportHazardousmaterialToFfi(value.hazardousMaterials);
  final _tunnelCategoryHandle = sdkTransportTunnelcategoryToFfiNullable(value.tunnelCategory);
  final _axleCountHandle = intToFfiNullable(value.axleCount);
  final _grossWeightInKilogramsHandle = intToFfiNullable(value.grossWeightInKilograms);
  final _heightInCentimetersHandle = intToFfiNullable(value.heightInCentimeters);
  final _lengthInCentimetersHandle = intToFfiNullable(value.lengthInCentimeters);
  final _widthInCentimetersHandle = intToFfiNullable(value.widthInCentimeters);
  final _weightPerAxleInKilogramsHandle = intToFfiNullable(value.weightPerAxleInKilograms);
  final _result = _sdkTransportVehicleprofileCreateHandle(_vehicleTypeHandle, _plateNumberTypeHandle, _fuelTypeHandle, _equipmentHandle, _truckTypeHandle, _trailerCountHandle, _isTaxiHandle, _occupantsCountHandle, _emissionStandardHandle, _hazardousMaterialsHandle, _tunnelCategoryHandle, _axleCountHandle, _grossWeightInKilogramsHandle, _heightInCentimetersHandle, _lengthInCentimetersHandle, _widthInCentimetersHandle, _weightPerAxleInKilogramsHandle);
  sdkTransportVehicletypeReleaseFfiHandle(_vehicleTypeHandle);
  sdkTransportPlatenumbertypeReleaseFfiHandleNullable(_plateNumberTypeHandle);
  sdkTransportFueltypeReleaseFfiHandleNullable(_fuelTypeHandle);
  sdkTransportVehicleequipmentReleaseFfiHandle(_equipmentHandle);
  sdkTransportTrucktypeReleaseFfiHandleNullable(_truckTypeHandle);
  
  booleanReleaseFfiHandle(_isTaxiHandle);
  
  sdkTransportEmissionstandardReleaseFfiHandleNullable(_emissionStandardHandle);
  heresdkCoreBindingslistofSdkTransportHazardousmaterialReleaseFfiHandle(_hazardousMaterialsHandle);
  sdkTransportTunnelcategoryReleaseFfiHandleNullable(_tunnelCategoryHandle);
  intReleaseFfiHandleNullable(_axleCountHandle);
  intReleaseFfiHandleNullable(_grossWeightInKilogramsHandle);
  intReleaseFfiHandleNullable(_heightInCentimetersHandle);
  intReleaseFfiHandleNullable(_lengthInCentimetersHandle);
  intReleaseFfiHandleNullable(_widthInCentimetersHandle);
  intReleaseFfiHandleNullable(_weightPerAxleInKilogramsHandle);
  return _result;
}

VehicleProfile sdkTransportVehicleprofileFromFfi(Pointer<Void> handle) {
  final _vehicleTypeHandle = _sdkTransportVehicleprofileGetFieldvehicleType(handle);
  final _plateNumberTypeHandle = _sdkTransportVehicleprofileGetFieldplateNumberType(handle);
  final _fuelTypeHandle = _sdkTransportVehicleprofileGetFieldfuelType(handle);
  final _equipmentHandle = _sdkTransportVehicleprofileGetFieldequipment(handle);
  final _truckTypeHandle = _sdkTransportVehicleprofileGetFieldtruckType(handle);
  final _trailerCountHandle = _sdkTransportVehicleprofileGetFieldtrailerCount(handle);
  final _isTaxiHandle = _sdkTransportVehicleprofileGetFieldisTaxi(handle);
  final _occupantsCountHandle = _sdkTransportVehicleprofileGetFieldoccupantsCount(handle);
  final _emissionStandardHandle = _sdkTransportVehicleprofileGetFieldemissionStandard(handle);
  final _hazardousMaterialsHandle = _sdkTransportVehicleprofileGetFieldhazardousMaterials(handle);
  final _tunnelCategoryHandle = _sdkTransportVehicleprofileGetFieldtunnelCategory(handle);
  final _axleCountHandle = _sdkTransportVehicleprofileGetFieldaxleCount(handle);
  final _grossWeightInKilogramsHandle = _sdkTransportVehicleprofileGetFieldgrossWeightInKilograms(handle);
  final _heightInCentimetersHandle = _sdkTransportVehicleprofileGetFieldheightInCentimeters(handle);
  final _lengthInCentimetersHandle = _sdkTransportVehicleprofileGetFieldlengthInCentimeters(handle);
  final _widthInCentimetersHandle = _sdkTransportVehicleprofileGetFieldwidthInCentimeters(handle);
  final _weightPerAxleInKilogramsHandle = _sdkTransportVehicleprofileGetFieldweightPerAxleInKilograms(handle);
  try {
    return VehicleProfile._(
      sdkTransportVehicletypeFromFfi(_vehicleTypeHandle), 
      sdkTransportPlatenumbertypeFromFfiNullable(_plateNumberTypeHandle), 
      sdkTransportFueltypeFromFfiNullable(_fuelTypeHandle), 
      sdkTransportVehicleequipmentFromFfi(_equipmentHandle), 
      sdkTransportTrucktypeFromFfiNullable(_truckTypeHandle), 
      (_trailerCountHandle), 
      booleanFromFfi(_isTaxiHandle), 
      (_occupantsCountHandle), 
      sdkTransportEmissionstandardFromFfiNullable(_emissionStandardHandle), 
      heresdkCoreBindingslistofSdkTransportHazardousmaterialFromFfi(_hazardousMaterialsHandle), 
      sdkTransportTunnelcategoryFromFfiNullable(_tunnelCategoryHandle), 
      intFromFfiNullable(_axleCountHandle), 
      intFromFfiNullable(_grossWeightInKilogramsHandle), 
      intFromFfiNullable(_heightInCentimetersHandle), 
      intFromFfiNullable(_lengthInCentimetersHandle), 
      intFromFfiNullable(_widthInCentimetersHandle), 
      intFromFfiNullable(_weightPerAxleInKilogramsHandle)
    );
  } finally {
    sdkTransportVehicletypeReleaseFfiHandle(_vehicleTypeHandle);
    sdkTransportPlatenumbertypeReleaseFfiHandleNullable(_plateNumberTypeHandle);
    sdkTransportFueltypeReleaseFfiHandleNullable(_fuelTypeHandle);
    sdkTransportVehicleequipmentReleaseFfiHandle(_equipmentHandle);
    sdkTransportTrucktypeReleaseFfiHandleNullable(_truckTypeHandle);
    
    booleanReleaseFfiHandle(_isTaxiHandle);
    
    sdkTransportEmissionstandardReleaseFfiHandleNullable(_emissionStandardHandle);
    heresdkCoreBindingslistofSdkTransportHazardousmaterialReleaseFfiHandle(_hazardousMaterialsHandle);
    sdkTransportTunnelcategoryReleaseFfiHandleNullable(_tunnelCategoryHandle);
    intReleaseFfiHandleNullable(_axleCountHandle);
    intReleaseFfiHandleNullable(_grossWeightInKilogramsHandle);
    intReleaseFfiHandleNullable(_heightInCentimetersHandle);
    intReleaseFfiHandleNullable(_lengthInCentimetersHandle);
    intReleaseFfiHandleNullable(_widthInCentimetersHandle);
    intReleaseFfiHandleNullable(_weightPerAxleInKilogramsHandle);
  }
}

void sdkTransportVehicleprofileReleaseFfiHandle(Pointer<Void> handle) => _sdkTransportVehicleprofileReleaseHandle(handle);

// Nullable VehicleProfile

final _sdkTransportVehicleprofileCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_create_handle_nullable'));
final _sdkTransportVehicleprofileReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_release_handle_nullable'));
final _sdkTransportVehicleprofileGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_VehicleProfile_get_value_nullable'));

Pointer<Void> sdkTransportVehicleprofileToFfiNullable(VehicleProfile? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportVehicleprofileToFfi(value);
  final result = _sdkTransportVehicleprofileCreateHandleNullable(_handle);
  sdkTransportVehicleprofileReleaseFfiHandle(_handle);
  return result;
}

VehicleProfile? sdkTransportVehicleprofileFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportVehicleprofileGetValueNullable(handle);
  final result = sdkTransportVehicleprofileFromFfi(_handle);
  sdkTransportVehicleprofileReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportVehicleprofileReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportVehicleprofileReleaseHandleNullable(handle);

// End of VehicleProfile "private" section.


