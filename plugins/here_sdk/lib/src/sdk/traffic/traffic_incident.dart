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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/localized_text.dart';
import 'package:here_sdk/src/sdk/traffic/junctions_traversability.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_base.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_impact.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_type.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_location.dart';

/// TrafficIncident provides details about a traffic incident.
abstract class TrafficIncident implements TrafficIncidentBase {

  /// Gets the unique current identifier for a traffic incident.
  /// Note, the identifier can be changed by the backend due to some events, e.g. changing of end_time.
  String get id;

  /// Gets the unique identifier of the first traffic incident.
  /// The original id remains the same whenever the traffic incident is updated and [TrafficIncident.id] is changed.
  /// Once an incident chain has been created, this value will never change.
  /// The traffic incident an be looked up by original id using [TrafficEngine.lookupIncident].
  String get originalId;

  /// Gets the identifier of another incident to which this incident is linked.
  /// The value is `null` if the incident doesn't have a parent.
  String? get parentId;

  /// Gets the traversability of junctions along the affected road.
  JunctionsTraversability get junctionsTraversability;

  /// Gets the flag indicating whether road is closed or not.
  bool get isRoadClosed;

  /// Gets the list of standardized codes as categorized in ISO 14819-2:2013 standard for this incident category.
  /// Codes are given in order of importance, so the first item in the list is considered the primary cause of the incident.
  List<int> get codes;

  /// Gets the human readable summary of the incident.
  /// The summary field provides a short version of the description containing no location information.
  /// The expected summary language can be managed
  /// via [TrafficIncidentsQueryOptions.languageCode] and [TrafficIncidentLookupOptions.languageCode].
  LocalizedText get summary;

  /// Gets the time the incident was entered into the system.
  /// The value is `null` if it hasn't been provided by the traffic incidents supplier.
  DateTime? get entryTime;

  /// Gets the location of the incident.
  TrafficLocation get location;

  /// Gets the map of restricted vehicle categories to restrictions.
  /// A vehicle is restricted if at least one restriction field is applicable for it.
  /// If the map is empty, there're no restricted vehicles for the incident.
  Map<TrafficIncidentRestrictedVehicleCategory, TrafficIncidentVehicleRestriction> get vehicleRestrictions;

}

/// The vehicle categories that can be restricted.
///
/// Note, a vehicle can belong to several categories (e.g. a passenger motor car
/// belongs to [TrafficIncidentRestrictedVehicleCategory.car], [TrafficIncidentRestrictedVehicleCategory.motorVehicle], and [TrafficIncidentRestrictedVehicleCategory.all]).
/// A vehicle is restricted if it belongs to the category presented in the map [TrafficIncident.vehicleRestrictions]
/// and at least one of the vehicle properties is under the matching [TrafficIncidentVehicleRestriction].
enum TrafficIncidentRestrictedVehicleCategory {
    /// Bus.
    bus,
    /// Car.
    car,
    /// Heavy goods vehicle (or large goods vehicle).
    /// In the European Union heavy goods vehicle is any truck with a gross combination mass (GCM) of over 3,500 kg.
    heavyGoodsVehicle,
    /// Truck.
    truck,
    /// Motorcycle.
    motorcycle,
    /// Motor vehicle. Definition: it is a self-propelled vehicle,
    /// that does not operate on rails and is used for the transportation of people or cargo.
    motorVehicle,
    /// Taxi.
    taxi,
    /// Train.
    train,
    /// Transporting an abnormal size load. See rules of the exact country that describe the exact parameters.
    transportingAbnormalSizeLoad,
    /// Transporting hazardous goods.
    transportingHazardousGoods,
    /// Vehicle with trailer.
    vehicleWithTrailer,
    /// Other vehicles.
    other,
    /// All the vehicles are applicable for this category.
    all
}

// TrafficIncidentRestrictedVehicleCategory "private" section, not exported.

int sdkTrafficTrafficincidentRestrictedvehiclecategoryToFfi(TrafficIncidentRestrictedVehicleCategory value) {
  switch (value) {
  case TrafficIncidentRestrictedVehicleCategory.bus:
    return 0;
  case TrafficIncidentRestrictedVehicleCategory.car:
    return 1;
  case TrafficIncidentRestrictedVehicleCategory.heavyGoodsVehicle:
    return 2;
  case TrafficIncidentRestrictedVehicleCategory.truck:
    return 3;
  case TrafficIncidentRestrictedVehicleCategory.motorcycle:
    return 4;
  case TrafficIncidentRestrictedVehicleCategory.motorVehicle:
    return 5;
  case TrafficIncidentRestrictedVehicleCategory.taxi:
    return 6;
  case TrafficIncidentRestrictedVehicleCategory.train:
    return 7;
  case TrafficIncidentRestrictedVehicleCategory.transportingAbnormalSizeLoad:
    return 8;
  case TrafficIncidentRestrictedVehicleCategory.transportingHazardousGoods:
    return 9;
  case TrafficIncidentRestrictedVehicleCategory.vehicleWithTrailer:
    return 10;
  case TrafficIncidentRestrictedVehicleCategory.other:
    return 11;
  case TrafficIncidentRestrictedVehicleCategory.all:
    return 12;
  default:
    throw StateError("Invalid enum value $value for TrafficIncidentRestrictedVehicleCategory enum.");
  }
}

TrafficIncidentRestrictedVehicleCategory sdkTrafficTrafficincidentRestrictedvehiclecategoryFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TrafficIncidentRestrictedVehicleCategory.bus;
  case 1:
    return TrafficIncidentRestrictedVehicleCategory.car;
  case 2:
    return TrafficIncidentRestrictedVehicleCategory.heavyGoodsVehicle;
  case 3:
    return TrafficIncidentRestrictedVehicleCategory.truck;
  case 4:
    return TrafficIncidentRestrictedVehicleCategory.motorcycle;
  case 5:
    return TrafficIncidentRestrictedVehicleCategory.motorVehicle;
  case 6:
    return TrafficIncidentRestrictedVehicleCategory.taxi;
  case 7:
    return TrafficIncidentRestrictedVehicleCategory.train;
  case 8:
    return TrafficIncidentRestrictedVehicleCategory.transportingAbnormalSizeLoad;
  case 9:
    return TrafficIncidentRestrictedVehicleCategory.transportingHazardousGoods;
  case 10:
    return TrafficIncidentRestrictedVehicleCategory.vehicleWithTrailer;
  case 11:
    return TrafficIncidentRestrictedVehicleCategory.other;
  case 12:
    return TrafficIncidentRestrictedVehicleCategory.all;
  default:
    throw StateError("Invalid numeric value $handle for TrafficIncidentRestrictedVehicleCategory enum.");
  }
}

void sdkTrafficTrafficincidentRestrictedvehiclecategoryReleaseFfiHandle(int handle) {}

final _sdkTrafficTrafficincidentRestrictedvehiclecategoryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_traffic_TrafficIncident_RestrictedVehicleCategory_create_handle_nullable'));
final _sdkTrafficTrafficincidentRestrictedvehiclecategoryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_RestrictedVehicleCategory_release_handle_nullable'));
final _sdkTrafficTrafficincidentRestrictedvehiclecategoryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_RestrictedVehicleCategory_get_value_nullable'));

Pointer<Void> sdkTrafficTrafficincidentRestrictedvehiclecategoryToFfiNullable(TrafficIncidentRestrictedVehicleCategory? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficTrafficincidentRestrictedvehiclecategoryToFfi(value);
  final result = _sdkTrafficTrafficincidentRestrictedvehiclecategoryCreateHandleNullable(_handle);
  sdkTrafficTrafficincidentRestrictedvehiclecategoryReleaseFfiHandle(_handle);
  return result;
}

TrafficIncidentRestrictedVehicleCategory? sdkTrafficTrafficincidentRestrictedvehiclecategoryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficTrafficincidentRestrictedvehiclecategoryGetValueNullable(handle);
  final result = sdkTrafficTrafficincidentRestrictedvehiclecategoryFromFfi(_handle);
  sdkTrafficTrafficincidentRestrictedvehiclecategoryReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficTrafficincidentRestrictedvehiclecategoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficincidentRestrictedvehiclecategoryReleaseHandleNullable(handle);

// End of TrafficIncidentRestrictedVehicleCategory "private" section.
/// The vehicle restriction representing a vehicle category and relevant restriction rules.

class TrafficIncidentVehicleRestriction {
  /// The flag indicating if vehicles of the matching category are restricted anyway (not depending on any vehicle parameter).
  bool isRestrictedAlways;

  /// The flag indicating if diesel fuel is restricted for vehicles of the matching category.
  bool isDieselFuelRestricted;

  /// The flag indicating if petrol fuel is restricted for vehicles of the matching category.
  bool isPetrolFuelRestricted;

  /// The flag indicating if LPG fuel is restricted for vehicles of the matching category.
  bool isLpgFuelRestricted;

  /// The flag indicating if a driving with a caravan is restricted for vehicles of the matching category.
  bool isCaravanRestricted;

  /// The flag indicating if a driving with a trailer is restricted for vehicles of the matching category.
  bool isTrailerRestricted;

  /// The flag indicating if a driving without snow chains is restricted for vehicles of the matching category.
  bool isDrivingWithoutSnowChainsRestricted;

  /// The flag indicating if a driving without winter tyres is restricted for vehicles of the matching category.
  bool isDrivingWithoutWinterTyresRestricted;

  /// The flag indicating if a plate with even number is restricted for vehicles of the matching category.
  bool isEvenNumberPlateRestricted;

  /// The flag indicating if a plate with odd number is restricted for vehicles of the matching category.
  bool isOddNumberPlateRestricted;

  /// The flag indicating if a through traffic is restricted for vehicles of the matching category.
  bool isThroughTrafficRestricted;

  /// The flag indicating if a residents traffic is restricted for vehicles of the matching category.
  bool isResidentsTrafficRestricted;

  /// The flag indicating if a traffic destination in the incident area is restricted for vehicles of the matching category.
  bool isDestinationInIncidentAreaRestricted;

  /// The flag indicating if euro3 and weaker emission standards are restricted for vehicles of the matching category.
  bool isEuro3EmissionStandardRestricted;

  /// The flag indicating if euro4 and weaker emission standards are restricted for vehicles of the matching category.
  bool isEuro4EmissionStandardRestricted;

  /// The flag indicating if euro5 and weaker emission standards are restricted for vehicles of the matching category.
  bool isEuro5EmissionStandardRestricted;

  /// Vehicles of the matching category are restricted if the vehicle gross weight is more than the weight in kilograms.
  /// If the value is `null` the upper gross weight bound is not specified.
  int? restrictedIfGrossWeightMoreThanInKilograms;

  /// Vehicles of the matching category are restricted if the vehicle gross weight is less than the weight in kilograms.
  /// If the value is `null` the lower gross weight bound is not specified.
  int? restrictedIfGrossWeightLessThanInKilograms;

  /// Vehicles of the matching category are restricted if the vehicle weight per axle is more than the weight in kilograms.
  /// If the value is `null` the upper weight per axle bound is not specified.
  int? restrictedIfAxleWeightMoreThanInKilograms;

  /// Vehicles of the matching category are restricted if the vehicle weight per axle is less than the weight in kilograms.
  /// If the value is `null` the lower weight per axle bound is not specified.
  int? restrictedIfAxleWeightLessThanInKilograms;

  /// Vehicles of the matching category are restricted if the vehicle is longer than the length in centimeters.
  /// If the value is `null` the upper length bound is not specified.
  int? restrictedIfLongerThanInCentimeters;

  /// Vehicles of the matching category are restricted if the vehicle is shorter than the length in centimeters.
  /// If the value is `null` the lower length bound is not specified.
  int? restrictedIfShorterThanInCentimeters;

  /// Vehicles of the matching category are restricted if the vehicle is higher than the height in centimeters.
  /// If the value is `null` the upper height bound is not specified.
  int? restrictedIfHigherThanInCentimeters;

  /// Vehicles of the matching category are restricted if the vehicle is lower than the height in centimeters.
  /// If the value is `null` the lower height bound is not specified.
  int? restrictedIfLowerThanInCentimeters;

  /// Vehicles of the matching category are restricted if the vehicle is wider than the width in centimeters.
  /// If the value is `null` the upper width bound is not specified.
  int? restrictedIfWiderThanInCentimeters;

  /// Vehicles of the matching category are restricted if the vehicle is narrower than the width in centimeters.
  /// If the value is `null` the lower width bound is not specified.
  int? restrictedIfNarrowerThanInCentimeters;

  /// Vehicles of the matching category are restricted if the occupants number is more than the value.
  /// If the value is `null` the upper occupants bound is not specified.
  int? restrictedIfOccupantsMoreThan;

  /// Vehicles of the matching category are restricted if the occupants number is fewer than the value.
  /// If the value is `null` the lower occupants bound is not specified.
  int? restrictedIfOccupantsFewerThan;

  /// Creates a new instance.

  /// [isRestrictedAlways] The flag indicating if vehicles of the matching category are restricted anyway (not depending on any vehicle parameter).

  /// [isDieselFuelRestricted] The flag indicating if diesel fuel is restricted for vehicles of the matching category.

  /// [isPetrolFuelRestricted] The flag indicating if petrol fuel is restricted for vehicles of the matching category.

  /// [isLpgFuelRestricted] The flag indicating if LPG fuel is restricted for vehicles of the matching category.

  /// [isCaravanRestricted] The flag indicating if a driving with a caravan is restricted for vehicles of the matching category.

  /// [isTrailerRestricted] The flag indicating if a driving with a trailer is restricted for vehicles of the matching category.

  /// [isDrivingWithoutSnowChainsRestricted] The flag indicating if a driving without snow chains is restricted for vehicles of the matching category.

  /// [isDrivingWithoutWinterTyresRestricted] The flag indicating if a driving without winter tyres is restricted for vehicles of the matching category.

  /// [isEvenNumberPlateRestricted] The flag indicating if a plate with even number is restricted for vehicles of the matching category.

  /// [isOddNumberPlateRestricted] The flag indicating if a plate with odd number is restricted for vehicles of the matching category.

  /// [isThroughTrafficRestricted] The flag indicating if a through traffic is restricted for vehicles of the matching category.

  /// [isResidentsTrafficRestricted] The flag indicating if a residents traffic is restricted for vehicles of the matching category.

  /// [isDestinationInIncidentAreaRestricted] The flag indicating if a traffic destination in the incident area is restricted for vehicles of the matching category.

  /// [isEuro3EmissionStandardRestricted] The flag indicating if euro3 and weaker emission standards are restricted for vehicles of the matching category.

  /// [isEuro4EmissionStandardRestricted] The flag indicating if euro4 and weaker emission standards are restricted for vehicles of the matching category.

  /// [isEuro5EmissionStandardRestricted] The flag indicating if euro5 and weaker emission standards are restricted for vehicles of the matching category.

  /// [restrictedIfGrossWeightMoreThanInKilograms] Vehicles of the matching category are restricted if the vehicle gross weight is more than the weight in kilograms.
  /// If the value is `null` the upper gross weight bound is not specified.

  /// [restrictedIfGrossWeightLessThanInKilograms] Vehicles of the matching category are restricted if the vehicle gross weight is less than the weight in kilograms.
  /// If the value is `null` the lower gross weight bound is not specified.

  /// [restrictedIfAxleWeightMoreThanInKilograms] Vehicles of the matching category are restricted if the vehicle weight per axle is more than the weight in kilograms.
  /// If the value is `null` the upper weight per axle bound is not specified.

  /// [restrictedIfAxleWeightLessThanInKilograms] Vehicles of the matching category are restricted if the vehicle weight per axle is less than the weight in kilograms.
  /// If the value is `null` the lower weight per axle bound is not specified.

  /// [restrictedIfLongerThanInCentimeters] Vehicles of the matching category are restricted if the vehicle is longer than the length in centimeters.
  /// If the value is `null` the upper length bound is not specified.

  /// [restrictedIfShorterThanInCentimeters] Vehicles of the matching category are restricted if the vehicle is shorter than the length in centimeters.
  /// If the value is `null` the lower length bound is not specified.

  /// [restrictedIfHigherThanInCentimeters] Vehicles of the matching category are restricted if the vehicle is higher than the height in centimeters.
  /// If the value is `null` the upper height bound is not specified.

  /// [restrictedIfLowerThanInCentimeters] Vehicles of the matching category are restricted if the vehicle is lower than the height in centimeters.
  /// If the value is `null` the lower height bound is not specified.

  /// [restrictedIfWiderThanInCentimeters] Vehicles of the matching category are restricted if the vehicle is wider than the width in centimeters.
  /// If the value is `null` the upper width bound is not specified.

  /// [restrictedIfNarrowerThanInCentimeters] Vehicles of the matching category are restricted if the vehicle is narrower than the width in centimeters.
  /// If the value is `null` the lower width bound is not specified.

  /// [restrictedIfOccupantsMoreThan] Vehicles of the matching category are restricted if the occupants number is more than the value.
  /// If the value is `null` the upper occupants bound is not specified.

  /// [restrictedIfOccupantsFewerThan] Vehicles of the matching category are restricted if the occupants number is fewer than the value.
  /// If the value is `null` the lower occupants bound is not specified.

  TrafficIncidentVehicleRestriction._(this.isRestrictedAlways, this.isDieselFuelRestricted, this.isPetrolFuelRestricted, this.isLpgFuelRestricted, this.isCaravanRestricted, this.isTrailerRestricted, this.isDrivingWithoutSnowChainsRestricted, this.isDrivingWithoutWinterTyresRestricted, this.isEvenNumberPlateRestricted, this.isOddNumberPlateRestricted, this.isThroughTrafficRestricted, this.isResidentsTrafficRestricted, this.isDestinationInIncidentAreaRestricted, this.isEuro3EmissionStandardRestricted, this.isEuro4EmissionStandardRestricted, this.isEuro5EmissionStandardRestricted, this.restrictedIfGrossWeightMoreThanInKilograms, this.restrictedIfGrossWeightLessThanInKilograms, this.restrictedIfAxleWeightMoreThanInKilograms, this.restrictedIfAxleWeightLessThanInKilograms, this.restrictedIfLongerThanInCentimeters, this.restrictedIfShorterThanInCentimeters, this.restrictedIfHigherThanInCentimeters, this.restrictedIfLowerThanInCentimeters, this.restrictedIfWiderThanInCentimeters, this.restrictedIfNarrowerThanInCentimeters, this.restrictedIfOccupantsMoreThan, this.restrictedIfOccupantsFewerThan);
  /// Creates a new instance with default values.
  TrafficIncidentVehicleRestriction()
      : isRestrictedAlways = false, isDieselFuelRestricted = false, isPetrolFuelRestricted = false, isLpgFuelRestricted = false, isCaravanRestricted = false, isTrailerRestricted = false, isDrivingWithoutSnowChainsRestricted = false, isDrivingWithoutWinterTyresRestricted = false, isEvenNumberPlateRestricted = false, isOddNumberPlateRestricted = false, isThroughTrafficRestricted = false, isResidentsTrafficRestricted = false, isDestinationInIncidentAreaRestricted = false, isEuro3EmissionStandardRestricted = false, isEuro4EmissionStandardRestricted = false, isEuro5EmissionStandardRestricted = false, restrictedIfGrossWeightMoreThanInKilograms = null, restrictedIfGrossWeightLessThanInKilograms = null, restrictedIfAxleWeightMoreThanInKilograms = null, restrictedIfAxleWeightLessThanInKilograms = null, restrictedIfLongerThanInCentimeters = null, restrictedIfShorterThanInCentimeters = null, restrictedIfHigherThanInCentimeters = null, restrictedIfLowerThanInCentimeters = null, restrictedIfWiderThanInCentimeters = null, restrictedIfNarrowerThanInCentimeters = null, restrictedIfOccupantsMoreThan = null, restrictedIfOccupantsFewerThan = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TrafficIncidentVehicleRestriction) return false;
    TrafficIncidentVehicleRestriction _other = other;
    return isRestrictedAlways == _other.isRestrictedAlways &&
        isDieselFuelRestricted == _other.isDieselFuelRestricted &&
        isPetrolFuelRestricted == _other.isPetrolFuelRestricted &&
        isLpgFuelRestricted == _other.isLpgFuelRestricted &&
        isCaravanRestricted == _other.isCaravanRestricted &&
        isTrailerRestricted == _other.isTrailerRestricted &&
        isDrivingWithoutSnowChainsRestricted == _other.isDrivingWithoutSnowChainsRestricted &&
        isDrivingWithoutWinterTyresRestricted == _other.isDrivingWithoutWinterTyresRestricted &&
        isEvenNumberPlateRestricted == _other.isEvenNumberPlateRestricted &&
        isOddNumberPlateRestricted == _other.isOddNumberPlateRestricted &&
        isThroughTrafficRestricted == _other.isThroughTrafficRestricted &&
        isResidentsTrafficRestricted == _other.isResidentsTrafficRestricted &&
        isDestinationInIncidentAreaRestricted == _other.isDestinationInIncidentAreaRestricted &&
        isEuro3EmissionStandardRestricted == _other.isEuro3EmissionStandardRestricted &&
        isEuro4EmissionStandardRestricted == _other.isEuro4EmissionStandardRestricted &&
        isEuro5EmissionStandardRestricted == _other.isEuro5EmissionStandardRestricted &&
        restrictedIfGrossWeightMoreThanInKilograms == _other.restrictedIfGrossWeightMoreThanInKilograms &&
        restrictedIfGrossWeightLessThanInKilograms == _other.restrictedIfGrossWeightLessThanInKilograms &&
        restrictedIfAxleWeightMoreThanInKilograms == _other.restrictedIfAxleWeightMoreThanInKilograms &&
        restrictedIfAxleWeightLessThanInKilograms == _other.restrictedIfAxleWeightLessThanInKilograms &&
        restrictedIfLongerThanInCentimeters == _other.restrictedIfLongerThanInCentimeters &&
        restrictedIfShorterThanInCentimeters == _other.restrictedIfShorterThanInCentimeters &&
        restrictedIfHigherThanInCentimeters == _other.restrictedIfHigherThanInCentimeters &&
        restrictedIfLowerThanInCentimeters == _other.restrictedIfLowerThanInCentimeters &&
        restrictedIfWiderThanInCentimeters == _other.restrictedIfWiderThanInCentimeters &&
        restrictedIfNarrowerThanInCentimeters == _other.restrictedIfNarrowerThanInCentimeters &&
        restrictedIfOccupantsMoreThan == _other.restrictedIfOccupantsMoreThan &&
        restrictedIfOccupantsFewerThan == _other.restrictedIfOccupantsFewerThan;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + isRestrictedAlways.hashCode;
    result = 31 * result + isDieselFuelRestricted.hashCode;
    result = 31 * result + isPetrolFuelRestricted.hashCode;
    result = 31 * result + isLpgFuelRestricted.hashCode;
    result = 31 * result + isCaravanRestricted.hashCode;
    result = 31 * result + isTrailerRestricted.hashCode;
    result = 31 * result + isDrivingWithoutSnowChainsRestricted.hashCode;
    result = 31 * result + isDrivingWithoutWinterTyresRestricted.hashCode;
    result = 31 * result + isEvenNumberPlateRestricted.hashCode;
    result = 31 * result + isOddNumberPlateRestricted.hashCode;
    result = 31 * result + isThroughTrafficRestricted.hashCode;
    result = 31 * result + isResidentsTrafficRestricted.hashCode;
    result = 31 * result + isDestinationInIncidentAreaRestricted.hashCode;
    result = 31 * result + isEuro3EmissionStandardRestricted.hashCode;
    result = 31 * result + isEuro4EmissionStandardRestricted.hashCode;
    result = 31 * result + isEuro5EmissionStandardRestricted.hashCode;
    result = 31 * result + restrictedIfGrossWeightMoreThanInKilograms.hashCode;
    result = 31 * result + restrictedIfGrossWeightLessThanInKilograms.hashCode;
    result = 31 * result + restrictedIfAxleWeightMoreThanInKilograms.hashCode;
    result = 31 * result + restrictedIfAxleWeightLessThanInKilograms.hashCode;
    result = 31 * result + restrictedIfLongerThanInCentimeters.hashCode;
    result = 31 * result + restrictedIfShorterThanInCentimeters.hashCode;
    result = 31 * result + restrictedIfHigherThanInCentimeters.hashCode;
    result = 31 * result + restrictedIfLowerThanInCentimeters.hashCode;
    result = 31 * result + restrictedIfWiderThanInCentimeters.hashCode;
    result = 31 * result + restrictedIfNarrowerThanInCentimeters.hashCode;
    result = 31 * result + restrictedIfOccupantsMoreThan.hashCode;
    result = 31 * result + restrictedIfOccupantsFewerThan.hashCode;
    return result;
  }
}


// TrafficIncidentVehicleRestriction "private" section, not exported.

final _sdkTrafficTrafficincidentVehiclerestrictionCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_create_handle'));
final _sdkTrafficTrafficincidentVehiclerestrictionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_release_handle'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisRestrictedAlways = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isRestrictedAlways'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisDieselFuelRestricted = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isDieselFuelRestricted'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisPetrolFuelRestricted = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isPetrolFuelRestricted'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisLpgFuelRestricted = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isLpgFuelRestricted'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisCaravanRestricted = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isCaravanRestricted'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisTrailerRestricted = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isTrailerRestricted'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisDrivingWithoutSnowChainsRestricted = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isDrivingWithoutSnowChainsRestricted'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisDrivingWithoutWinterTyresRestricted = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isDrivingWithoutWinterTyresRestricted'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisEvenNumberPlateRestricted = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isEvenNumberPlateRestricted'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisOddNumberPlateRestricted = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isOddNumberPlateRestricted'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisThroughTrafficRestricted = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isThroughTrafficRestricted'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisResidentsTrafficRestricted = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isResidentsTrafficRestricted'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisDestinationInIncidentAreaRestricted = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isDestinationInIncidentAreaRestricted'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisEuro3EmissionStandardRestricted = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isEuro3EmissionStandardRestricted'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisEuro4EmissionStandardRestricted = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isEuro4EmissionStandardRestricted'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisEuro5EmissionStandardRestricted = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_isEuro5EmissionStandardRestricted'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfGrossWeightMoreThanInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_restrictedIfGrossWeightMoreThanInKilograms'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfGrossWeightLessThanInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_restrictedIfGrossWeightLessThanInKilograms'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfAxleWeightMoreThanInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_restrictedIfAxleWeightMoreThanInKilograms'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfAxleWeightLessThanInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_restrictedIfAxleWeightLessThanInKilograms'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfLongerThanInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_restrictedIfLongerThanInCentimeters'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfShorterThanInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_restrictedIfShorterThanInCentimeters'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfHigherThanInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_restrictedIfHigherThanInCentimeters'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfLowerThanInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_restrictedIfLowerThanInCentimeters'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfWiderThanInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_restrictedIfWiderThanInCentimeters'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfNarrowerThanInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_restrictedIfNarrowerThanInCentimeters'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfOccupantsMoreThan = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_restrictedIfOccupantsMoreThan'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfOccupantsFewerThan = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_field_restrictedIfOccupantsFewerThan'));



Pointer<Void> sdkTrafficTrafficincidentVehiclerestrictionToFfi(TrafficIncidentVehicleRestriction value) {
  final _isRestrictedAlwaysHandle = booleanToFfi(value.isRestrictedAlways);
  final _isDieselFuelRestrictedHandle = booleanToFfi(value.isDieselFuelRestricted);
  final _isPetrolFuelRestrictedHandle = booleanToFfi(value.isPetrolFuelRestricted);
  final _isLpgFuelRestrictedHandle = booleanToFfi(value.isLpgFuelRestricted);
  final _isCaravanRestrictedHandle = booleanToFfi(value.isCaravanRestricted);
  final _isTrailerRestrictedHandle = booleanToFfi(value.isTrailerRestricted);
  final _isDrivingWithoutSnowChainsRestrictedHandle = booleanToFfi(value.isDrivingWithoutSnowChainsRestricted);
  final _isDrivingWithoutWinterTyresRestrictedHandle = booleanToFfi(value.isDrivingWithoutWinterTyresRestricted);
  final _isEvenNumberPlateRestrictedHandle = booleanToFfi(value.isEvenNumberPlateRestricted);
  final _isOddNumberPlateRestrictedHandle = booleanToFfi(value.isOddNumberPlateRestricted);
  final _isThroughTrafficRestrictedHandle = booleanToFfi(value.isThroughTrafficRestricted);
  final _isResidentsTrafficRestrictedHandle = booleanToFfi(value.isResidentsTrafficRestricted);
  final _isDestinationInIncidentAreaRestrictedHandle = booleanToFfi(value.isDestinationInIncidentAreaRestricted);
  final _isEuro3EmissionStandardRestrictedHandle = booleanToFfi(value.isEuro3EmissionStandardRestricted);
  final _isEuro4EmissionStandardRestrictedHandle = booleanToFfi(value.isEuro4EmissionStandardRestricted);
  final _isEuro5EmissionStandardRestrictedHandle = booleanToFfi(value.isEuro5EmissionStandardRestricted);
  final _restrictedIfGrossWeightMoreThanInKilogramsHandle = intToFfiNullable(value.restrictedIfGrossWeightMoreThanInKilograms);
  final _restrictedIfGrossWeightLessThanInKilogramsHandle = intToFfiNullable(value.restrictedIfGrossWeightLessThanInKilograms);
  final _restrictedIfAxleWeightMoreThanInKilogramsHandle = intToFfiNullable(value.restrictedIfAxleWeightMoreThanInKilograms);
  final _restrictedIfAxleWeightLessThanInKilogramsHandle = intToFfiNullable(value.restrictedIfAxleWeightLessThanInKilograms);
  final _restrictedIfLongerThanInCentimetersHandle = intToFfiNullable(value.restrictedIfLongerThanInCentimeters);
  final _restrictedIfShorterThanInCentimetersHandle = intToFfiNullable(value.restrictedIfShorterThanInCentimeters);
  final _restrictedIfHigherThanInCentimetersHandle = intToFfiNullable(value.restrictedIfHigherThanInCentimeters);
  final _restrictedIfLowerThanInCentimetersHandle = intToFfiNullable(value.restrictedIfLowerThanInCentimeters);
  final _restrictedIfWiderThanInCentimetersHandle = intToFfiNullable(value.restrictedIfWiderThanInCentimeters);
  final _restrictedIfNarrowerThanInCentimetersHandle = intToFfiNullable(value.restrictedIfNarrowerThanInCentimeters);
  final _restrictedIfOccupantsMoreThanHandle = intToFfiNullable(value.restrictedIfOccupantsMoreThan);
  final _restrictedIfOccupantsFewerThanHandle = intToFfiNullable(value.restrictedIfOccupantsFewerThan);
  final _result = _sdkTrafficTrafficincidentVehiclerestrictionCreateHandle(_isRestrictedAlwaysHandle, _isDieselFuelRestrictedHandle, _isPetrolFuelRestrictedHandle, _isLpgFuelRestrictedHandle, _isCaravanRestrictedHandle, _isTrailerRestrictedHandle, _isDrivingWithoutSnowChainsRestrictedHandle, _isDrivingWithoutWinterTyresRestrictedHandle, _isEvenNumberPlateRestrictedHandle, _isOddNumberPlateRestrictedHandle, _isThroughTrafficRestrictedHandle, _isResidentsTrafficRestrictedHandle, _isDestinationInIncidentAreaRestrictedHandle, _isEuro3EmissionStandardRestrictedHandle, _isEuro4EmissionStandardRestrictedHandle, _isEuro5EmissionStandardRestrictedHandle, _restrictedIfGrossWeightMoreThanInKilogramsHandle, _restrictedIfGrossWeightLessThanInKilogramsHandle, _restrictedIfAxleWeightMoreThanInKilogramsHandle, _restrictedIfAxleWeightLessThanInKilogramsHandle, _restrictedIfLongerThanInCentimetersHandle, _restrictedIfShorterThanInCentimetersHandle, _restrictedIfHigherThanInCentimetersHandle, _restrictedIfLowerThanInCentimetersHandle, _restrictedIfWiderThanInCentimetersHandle, _restrictedIfNarrowerThanInCentimetersHandle, _restrictedIfOccupantsMoreThanHandle, _restrictedIfOccupantsFewerThanHandle);
  booleanReleaseFfiHandle(_isRestrictedAlwaysHandle);
  booleanReleaseFfiHandle(_isDieselFuelRestrictedHandle);
  booleanReleaseFfiHandle(_isPetrolFuelRestrictedHandle);
  booleanReleaseFfiHandle(_isLpgFuelRestrictedHandle);
  booleanReleaseFfiHandle(_isCaravanRestrictedHandle);
  booleanReleaseFfiHandle(_isTrailerRestrictedHandle);
  booleanReleaseFfiHandle(_isDrivingWithoutSnowChainsRestrictedHandle);
  booleanReleaseFfiHandle(_isDrivingWithoutWinterTyresRestrictedHandle);
  booleanReleaseFfiHandle(_isEvenNumberPlateRestrictedHandle);
  booleanReleaseFfiHandle(_isOddNumberPlateRestrictedHandle);
  booleanReleaseFfiHandle(_isThroughTrafficRestrictedHandle);
  booleanReleaseFfiHandle(_isResidentsTrafficRestrictedHandle);
  booleanReleaseFfiHandle(_isDestinationInIncidentAreaRestrictedHandle);
  booleanReleaseFfiHandle(_isEuro3EmissionStandardRestrictedHandle);
  booleanReleaseFfiHandle(_isEuro4EmissionStandardRestrictedHandle);
  booleanReleaseFfiHandle(_isEuro5EmissionStandardRestrictedHandle);
  intReleaseFfiHandleNullable(_restrictedIfGrossWeightMoreThanInKilogramsHandle);
  intReleaseFfiHandleNullable(_restrictedIfGrossWeightLessThanInKilogramsHandle);
  intReleaseFfiHandleNullable(_restrictedIfAxleWeightMoreThanInKilogramsHandle);
  intReleaseFfiHandleNullable(_restrictedIfAxleWeightLessThanInKilogramsHandle);
  intReleaseFfiHandleNullable(_restrictedIfLongerThanInCentimetersHandle);
  intReleaseFfiHandleNullable(_restrictedIfShorterThanInCentimetersHandle);
  intReleaseFfiHandleNullable(_restrictedIfHigherThanInCentimetersHandle);
  intReleaseFfiHandleNullable(_restrictedIfLowerThanInCentimetersHandle);
  intReleaseFfiHandleNullable(_restrictedIfWiderThanInCentimetersHandle);
  intReleaseFfiHandleNullable(_restrictedIfNarrowerThanInCentimetersHandle);
  intReleaseFfiHandleNullable(_restrictedIfOccupantsMoreThanHandle);
  intReleaseFfiHandleNullable(_restrictedIfOccupantsFewerThanHandle);
  return _result;
}

TrafficIncidentVehicleRestriction sdkTrafficTrafficincidentVehiclerestrictionFromFfi(Pointer<Void> handle) {
  final _isRestrictedAlwaysHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisRestrictedAlways(handle);
  final _isDieselFuelRestrictedHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisDieselFuelRestricted(handle);
  final _isPetrolFuelRestrictedHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisPetrolFuelRestricted(handle);
  final _isLpgFuelRestrictedHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisLpgFuelRestricted(handle);
  final _isCaravanRestrictedHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisCaravanRestricted(handle);
  final _isTrailerRestrictedHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisTrailerRestricted(handle);
  final _isDrivingWithoutSnowChainsRestrictedHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisDrivingWithoutSnowChainsRestricted(handle);
  final _isDrivingWithoutWinterTyresRestrictedHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisDrivingWithoutWinterTyresRestricted(handle);
  final _isEvenNumberPlateRestrictedHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisEvenNumberPlateRestricted(handle);
  final _isOddNumberPlateRestrictedHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisOddNumberPlateRestricted(handle);
  final _isThroughTrafficRestrictedHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisThroughTrafficRestricted(handle);
  final _isResidentsTrafficRestrictedHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisResidentsTrafficRestricted(handle);
  final _isDestinationInIncidentAreaRestrictedHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisDestinationInIncidentAreaRestricted(handle);
  final _isEuro3EmissionStandardRestrictedHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisEuro3EmissionStandardRestricted(handle);
  final _isEuro4EmissionStandardRestrictedHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisEuro4EmissionStandardRestricted(handle);
  final _isEuro5EmissionStandardRestrictedHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldisEuro5EmissionStandardRestricted(handle);
  final _restrictedIfGrossWeightMoreThanInKilogramsHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfGrossWeightMoreThanInKilograms(handle);
  final _restrictedIfGrossWeightLessThanInKilogramsHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfGrossWeightLessThanInKilograms(handle);
  final _restrictedIfAxleWeightMoreThanInKilogramsHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfAxleWeightMoreThanInKilograms(handle);
  final _restrictedIfAxleWeightLessThanInKilogramsHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfAxleWeightLessThanInKilograms(handle);
  final _restrictedIfLongerThanInCentimetersHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfLongerThanInCentimeters(handle);
  final _restrictedIfShorterThanInCentimetersHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfShorterThanInCentimeters(handle);
  final _restrictedIfHigherThanInCentimetersHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfHigherThanInCentimeters(handle);
  final _restrictedIfLowerThanInCentimetersHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfLowerThanInCentimeters(handle);
  final _restrictedIfWiderThanInCentimetersHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfWiderThanInCentimeters(handle);
  final _restrictedIfNarrowerThanInCentimetersHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfNarrowerThanInCentimeters(handle);
  final _restrictedIfOccupantsMoreThanHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfOccupantsMoreThan(handle);
  final _restrictedIfOccupantsFewerThanHandle = _sdkTrafficTrafficincidentVehiclerestrictionGetFieldrestrictedIfOccupantsFewerThan(handle);
  try {
    return TrafficIncidentVehicleRestriction._(
      booleanFromFfi(_isRestrictedAlwaysHandle), 
      booleanFromFfi(_isDieselFuelRestrictedHandle), 
      booleanFromFfi(_isPetrolFuelRestrictedHandle), 
      booleanFromFfi(_isLpgFuelRestrictedHandle), 
      booleanFromFfi(_isCaravanRestrictedHandle), 
      booleanFromFfi(_isTrailerRestrictedHandle), 
      booleanFromFfi(_isDrivingWithoutSnowChainsRestrictedHandle), 
      booleanFromFfi(_isDrivingWithoutWinterTyresRestrictedHandle), 
      booleanFromFfi(_isEvenNumberPlateRestrictedHandle), 
      booleanFromFfi(_isOddNumberPlateRestrictedHandle), 
      booleanFromFfi(_isThroughTrafficRestrictedHandle), 
      booleanFromFfi(_isResidentsTrafficRestrictedHandle), 
      booleanFromFfi(_isDestinationInIncidentAreaRestrictedHandle), 
      booleanFromFfi(_isEuro3EmissionStandardRestrictedHandle), 
      booleanFromFfi(_isEuro4EmissionStandardRestrictedHandle), 
      booleanFromFfi(_isEuro5EmissionStandardRestrictedHandle), 
      intFromFfiNullable(_restrictedIfGrossWeightMoreThanInKilogramsHandle), 
      intFromFfiNullable(_restrictedIfGrossWeightLessThanInKilogramsHandle), 
      intFromFfiNullable(_restrictedIfAxleWeightMoreThanInKilogramsHandle), 
      intFromFfiNullable(_restrictedIfAxleWeightLessThanInKilogramsHandle), 
      intFromFfiNullable(_restrictedIfLongerThanInCentimetersHandle), 
      intFromFfiNullable(_restrictedIfShorterThanInCentimetersHandle), 
      intFromFfiNullable(_restrictedIfHigherThanInCentimetersHandle), 
      intFromFfiNullable(_restrictedIfLowerThanInCentimetersHandle), 
      intFromFfiNullable(_restrictedIfWiderThanInCentimetersHandle), 
      intFromFfiNullable(_restrictedIfNarrowerThanInCentimetersHandle), 
      intFromFfiNullable(_restrictedIfOccupantsMoreThanHandle), 
      intFromFfiNullable(_restrictedIfOccupantsFewerThanHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_isRestrictedAlwaysHandle);
    booleanReleaseFfiHandle(_isDieselFuelRestrictedHandle);
    booleanReleaseFfiHandle(_isPetrolFuelRestrictedHandle);
    booleanReleaseFfiHandle(_isLpgFuelRestrictedHandle);
    booleanReleaseFfiHandle(_isCaravanRestrictedHandle);
    booleanReleaseFfiHandle(_isTrailerRestrictedHandle);
    booleanReleaseFfiHandle(_isDrivingWithoutSnowChainsRestrictedHandle);
    booleanReleaseFfiHandle(_isDrivingWithoutWinterTyresRestrictedHandle);
    booleanReleaseFfiHandle(_isEvenNumberPlateRestrictedHandle);
    booleanReleaseFfiHandle(_isOddNumberPlateRestrictedHandle);
    booleanReleaseFfiHandle(_isThroughTrafficRestrictedHandle);
    booleanReleaseFfiHandle(_isResidentsTrafficRestrictedHandle);
    booleanReleaseFfiHandle(_isDestinationInIncidentAreaRestrictedHandle);
    booleanReleaseFfiHandle(_isEuro3EmissionStandardRestrictedHandle);
    booleanReleaseFfiHandle(_isEuro4EmissionStandardRestrictedHandle);
    booleanReleaseFfiHandle(_isEuro5EmissionStandardRestrictedHandle);
    intReleaseFfiHandleNullable(_restrictedIfGrossWeightMoreThanInKilogramsHandle);
    intReleaseFfiHandleNullable(_restrictedIfGrossWeightLessThanInKilogramsHandle);
    intReleaseFfiHandleNullable(_restrictedIfAxleWeightMoreThanInKilogramsHandle);
    intReleaseFfiHandleNullable(_restrictedIfAxleWeightLessThanInKilogramsHandle);
    intReleaseFfiHandleNullable(_restrictedIfLongerThanInCentimetersHandle);
    intReleaseFfiHandleNullable(_restrictedIfShorterThanInCentimetersHandle);
    intReleaseFfiHandleNullable(_restrictedIfHigherThanInCentimetersHandle);
    intReleaseFfiHandleNullable(_restrictedIfLowerThanInCentimetersHandle);
    intReleaseFfiHandleNullable(_restrictedIfWiderThanInCentimetersHandle);
    intReleaseFfiHandleNullable(_restrictedIfNarrowerThanInCentimetersHandle);
    intReleaseFfiHandleNullable(_restrictedIfOccupantsMoreThanHandle);
    intReleaseFfiHandleNullable(_restrictedIfOccupantsFewerThanHandle);
  }
}

void sdkTrafficTrafficincidentVehiclerestrictionReleaseFfiHandle(Pointer<Void> handle) => _sdkTrafficTrafficincidentVehiclerestrictionReleaseHandle(handle);

// Nullable TrafficIncidentVehicleRestriction

final _sdkTrafficTrafficincidentVehiclerestrictionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_create_handle_nullable'));
final _sdkTrafficTrafficincidentVehiclerestrictionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_release_handle_nullable'));
final _sdkTrafficTrafficincidentVehiclerestrictionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_VehicleRestriction_get_value_nullable'));

Pointer<Void> sdkTrafficTrafficincidentVehiclerestrictionToFfiNullable(TrafficIncidentVehicleRestriction? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficTrafficincidentVehiclerestrictionToFfi(value);
  final result = _sdkTrafficTrafficincidentVehiclerestrictionCreateHandleNullable(_handle);
  sdkTrafficTrafficincidentVehiclerestrictionReleaseFfiHandle(_handle);
  return result;
}

TrafficIncidentVehicleRestriction? sdkTrafficTrafficincidentVehiclerestrictionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficTrafficincidentVehiclerestrictionGetValueNullable(handle);
  final result = sdkTrafficTrafficincidentVehiclerestrictionFromFfi(_handle);
  sdkTrafficTrafficincidentVehiclerestrictionReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficTrafficincidentVehiclerestrictionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficincidentVehiclerestrictionReleaseHandleNullable(handle);

// End of TrafficIncidentVehicleRestriction "private" section.

// TrafficIncident "private" section, not exported.

final _sdkTrafficTrafficincidentRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_traffic_TrafficIncident_register_finalizer'));
final _sdkTrafficTrafficincidentCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_copy_handle'));
final _sdkTrafficTrafficincidentReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_release_handle'));
final _sdkTrafficTrafficincidentGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncident_get_type_id'));


class TrafficIncident$Impl extends __lib.NativeBase implements TrafficIncident {

  TrafficIncident$Impl(Pointer<Void> handle) : super(handle);

  @override
  String get id {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncident_id_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get originalId {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncident_originalId_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String? get parentId {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncident_parentId_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  JunctionsTraversability get junctionsTraversability {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncident_junctionsTraversability_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficJunctionstraversabilityFromFfi(__resultHandle);
    } finally {
      sdkTrafficJunctionstraversabilityReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  bool get isRoadClosed {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncident_isRoadClosed_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<int> get codes {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncident_codes_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkTrafficBindingslistofIntFromFfi(__resultHandle);
    } finally {
      heresdkTrafficBindingslistofIntReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  LocalizedText get summary {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncident_summary_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLocalizedtextFromFfi(__resultHandle);
    } finally {
      sdkCoreLocalizedtextReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  DateTime? get entryTime {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncident_entryTime_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return dateFromFfiNullable(__resultHandle);
    } finally {
      dateReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  TrafficLocation get location {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncident_location_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficTrafficlocationFromFfi(__resultHandle);
    } finally {
      sdkTrafficTrafficlocationReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Map<TrafficIncidentRestrictedVehicleCategory, TrafficIncidentVehicleRestriction> get vehicleRestrictions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncident_vehicleRestrictions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkTrafficBindingsmapofSdkTrafficTrafficincidentRestrictedvehiclecategoryToSdkTrafficTrafficincidentVehiclerestrictionFromFfi(__resultHandle);
    } finally {
      heresdkTrafficBindingsmapofSdkTrafficTrafficincidentRestrictedvehiclecategoryToSdkTrafficTrafficincidentVehiclerestrictionReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  TrafficIncidentImpact get impact {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncident_impact_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficTrafficincidentimpactFromFfi(__resultHandle);
    } finally {
      sdkTrafficTrafficincidentimpactReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  TrafficIncidentType get type {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncident_type_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficTrafficincidenttypeFromFfi(__resultHandle);
    } finally {
      sdkTrafficTrafficincidenttypeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  LocalizedText get description {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncident_description_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLocalizedtextFromFfi(__resultHandle);
    } finally {
      sdkCoreLocalizedtextReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  DateTime? get startTime {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncident_startTime_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return dateFromFfiNullable(__resultHandle);
    } finally {
      dateReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  DateTime? get endTime {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficIncident_endTime_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return dateFromFfiNullable(__resultHandle);
    } finally {
      dateReleaseFfiHandleNullable(__resultHandle);

    }

  }



}

Pointer<Void> sdkTrafficTrafficincidentToFfi(TrafficIncident value) =>
  _sdkTrafficTrafficincidentCopyHandle((value as __lib.NativeBase).handle);

TrafficIncident sdkTrafficTrafficincidentFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TrafficIncident) return instance;

  final _typeIdHandle = _sdkTrafficTrafficincidentGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkTrafficTrafficincidentCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TrafficIncident$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkTrafficTrafficincidentRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkTrafficTrafficincidentReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkTrafficTrafficincidentReleaseHandle(handle);

Pointer<Void> sdkTrafficTrafficincidentToFfiNullable(TrafficIncident? value) =>
  value != null ? sdkTrafficTrafficincidentToFfi(value) : Pointer<Void>.fromAddress(0);

TrafficIncident? sdkTrafficTrafficincidentFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkTrafficTrafficincidentFromFfi(handle) : null;

void sdkTrafficTrafficincidentReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficincidentReleaseHandle(handle);

// End of TrafficIncident "private" section.


