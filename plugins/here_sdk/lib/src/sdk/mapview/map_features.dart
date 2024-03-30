// Copyright (c) 2019-2023 HERE Global B.V. and its affiliate(s).
// All rights reserved.
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

/// Holds constants for map features, to be used with
/// [MapScene.enableFeatures] and [MapScene.disableFeatures].
///
/// See [MapFeatureModes] for constants representing feature modes.

class MapFeatures {
  /// Simple 3D representation of buildings.
  ///
  /// Supports only one mode: [MapFeatureModes.extrudedBuildingsAll].
  ///
  /// Not supported for [MapScheme.satellite], [MapScheme.hybridDay]
  /// and [MapScheme.hybridNight].
  static final String extrudedBuildings = "building extruded";

  /// The 2D footprint of buildings.
  ///
  /// Supports only one mode: [MapFeatureModes.buildingFootprintsAll].
  ///
  /// Not supported for [MapScheme.satellite],
  /// [MapScheme.hybridDay] and [MapScheme.hybridNight].
  static final String buildingFootprints = "building footprints";

  /// Traffic flow speed. An online connection is required for the traffic
  /// flow to be shown.
  ///
  /// Supported modes: [MapFeatureModes.trafficFlowJapanWithoutFreeFlow],
  /// [MapFeatureModes.trafficFlowWithFreeFlow],
  /// [MapFeatureModes.trafficFlowWithoutFreeFlow].
  ///
  /// Default mode is [MapFeatureModes.trafficFlowWithFreeFlow].
  ///
  /// Not supported for [MapScheme.satellite].
  static final String trafficFlow = "traffic flow";

  /// Traffic incidents. An online connection is required for the traffic
  /// incidents to be shown.
  ///
  /// Supports only one mode: [MapFeatureModes.trafficIncidentsAll].
  ///
  /// Not supported for [MapScheme.satellite].
  static final String trafficIncidents = "traffic incidents";

  /// City areas designated as environmental zones, which empose limitations
  /// on the type of vehicles that are allowed to enter such areas.
  ///
  /// Supports only one mode: [MapFeatureModes.environmentalZonesAll].
  ///
  /// Not supported for [MapScheme.satellite].
  static final String environmentalZones = "environmental zones";

  /// City areas designated as congestion zones (or congestion charge zones),
  /// which impose fees on entering such areas.
  ///
  /// Supports only one mode: [MapFeatureModes.congestionZonesAll].
  ///
  /// Not supported for [MapScheme.satellite].
  static final String congestionZones = "congestion zones";

  /// Show or hide road exit labels, if available.
  ///
  /// Supported modes: [MapFeatureModes.roadExitLabelsNumbersOnly],
  /// [MapFeatureModes.roadExitLabelsAll]
  ///
  /// Default mode is [MapFeatureModes.roadExitLabelsNumbersOnly].
  ///
  /// Not supported for [MapScheme.satellite].
  static final String roadExitLabels = "road exit labels";

  /// Shadows for all building types (extruded buildings and landmarks).
  ///
  /// Supports only one mode: [MapFeatureModes.shadowsAll].
  ///
  /// A [ShadowQuality] must be set on the MapContext through a MapView or the feature has no
  /// effect.
  ///
  /// Shadows have a performance impact and should be considered only for devices with
  /// sufficient performance.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behavior. Related APIs may change for new releases without a deprecation process.
  static final String shadows = "shadows";

}


// MapFeatures "private" section, not exported.

final _sdkMapviewMapfeaturesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(),
    Pointer<Void> Function()
  >('here_sdk_sdk_mapview_MapFeatures_create_handle'));
final _sdkMapviewMapfeaturesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapFeatures_release_handle'));



Pointer<Void> sdkMapviewMapfeaturesToFfi(MapFeatures value) {
  final _result = _sdkMapviewMapfeaturesCreateHandle();
  return _result;
}

MapFeatures sdkMapviewMapfeaturesFromFfi(Pointer<Void> handle) {
  try {
    return MapFeatures(
    );
  } finally {
  }
}

void sdkMapviewMapfeaturesReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewMapfeaturesReleaseHandle(handle);

// Nullable MapFeatures

final _sdkMapviewMapfeaturesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapFeatures_create_handle_nullable'));
final _sdkMapviewMapfeaturesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapFeatures_release_handle_nullable'));
final _sdkMapviewMapfeaturesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapFeatures_get_value_nullable'));

Pointer<Void> sdkMapviewMapfeaturesToFfiNullable(MapFeatures? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapfeaturesToFfi(value);
  final result = _sdkMapviewMapfeaturesCreateHandleNullable(_handle);
  sdkMapviewMapfeaturesReleaseFfiHandle(_handle);
  return result;
}

MapFeatures? sdkMapviewMapfeaturesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapfeaturesGetValueNullable(handle);
  final result = sdkMapviewMapfeaturesFromFfi(_handle);
  sdkMapviewMapfeaturesReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapfeaturesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapfeaturesReleaseHandleNullable(handle);

// End of MapFeatures "private" section.


