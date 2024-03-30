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
import 'package:here_sdk/src/generic_types__conversion.dart';

/// A class to configure the list of features which needs to be enable/disable for offline use.
///
/// Disabling a feature for offline use, allows user to reduce the amount of data which needs to be
/// downloaded/prefetched from internet.

class LayerConfiguration {
  /// Specifies feature configuration for enabling list of features.
  List<LayerConfigurationFeature> enabledFeatures;

  /// Creates a new instance.
  LayerConfiguration.withDefaults()
      : enabledFeatures = [];
  /// Creates a new instance.
  /// [enabledFeatures] Specifies feature configuration for enabling list of features.
  LayerConfiguration(this.enabledFeatures);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LayerConfiguration) return false;
    LayerConfiguration _other = other;
    return DeepCollectionEquality().equals(enabledFeatures, _other.enabledFeatures);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(enabledFeatures);
    return result;
  }
}

/// Defines a list of possible map data features that can be enabled / disabled.
///
/// See [SDKOptions.layerConfiguration]
///
/// **Note**: The [LayerConfigurationFeature.rendering] layer is a base layer.
/// It is enabled by default and cannot be disabled. Therefore, it is not necessary to explicitly
/// add [LayerConfigurationFeature.rendering] layer to a feature configuration.
///
/// Following features are enabled by default:
/// - [LayerConfigurationFeature.detailRendering]
/// - [LayerConfigurationFeature.navigation]
/// - [LayerConfigurationFeature.offlineSearch]
/// - [LayerConfigurationFeature.offlineRouting]
/// - [LayerConfigurationFeature.rendering]
/// - [LayerConfigurationFeature.truck]
/// - [LayerConfigurationFeature.traffic]
///
/// All other features are disabled, by default.
///
/// Each feature enables a set of OCM layer groups to be downloaded by `sdk.maploader.MapDownloader` and prefetched by `sdk.prefetcher.RoutePrefetcher`.
/// Detailed description of each layer group available in [Developer Portal](https://developer.here.com/documentation/optimized-client-map/latest/dev_guide/index.html)
///
/// Feature might have more than one layer group predefined to enable full experience. For example,
/// [LayerConfigurationFeature.navigation] requires routing attributes, visual-friendly
/// street names, maneuvers data and ability to interconnect those data sets.
///
/// The same map data is useful for different features, for example [LayerConfigurationFeature.rendering]
/// uses Places data to present it on the MapView, while [LayerConfigurationFeature.offlineSearch] uses
/// the same data to enable discoverability by name or category. Hence, features might have overlapping sets of enabled layer groups.
enum LayerConfigurationFeature {
    /// Additional rendering details like buildings. Only used for the MapView.
    ///
    /// Feature enables following OCM layer groups:
    /// - "detailed_rendering"
    detailRendering,
    /// Map data that is used for map matching during navigation. When not set,
    /// navigation may not work properly when being used offline.
    ///
    /// Feature enables following OCM layer groups:
    /// - "interop"
    /// - "rendering"
    /// - "navigation"
    /// - "routing"
    navigation,
    /// Map data that is used to search. When not set, the OfflineSearchEngine may not
    /// work properly when being used offline.
    ///
    /// Feature enables following OCM layer groups:
    /// - "rendering"
    /// - "navigation"
    /// - "routing"
    /// - "interop"
    /// - "search"
    offlineSearch,
    /// Map data that is used to calculate routes. When not set, the OfflineRoutingEngine
    /// may not work properly when being used offline.
    ///
    /// Feature enables following OCM layer groups:
    /// - "rendering"
    /// - "navigation"
    /// - "routing"
    /// - "interop"
    /// - "car_offline_routing"
    offlineRouting,
    /// A basic set of rendering features such as carto POIs.
    /// It cannot be disabled.
    ///
    /// Feature enables following OCM layer groups:
    /// - "rendering"
    rendering,
    /// Map data that is used to calculate truck routes. When not set,
    /// the OfflineRoutingEngine may not work properly when being used offline to calculate truck routes.
    /// It is also used for map matching during truck navigation.
    /// When not set, truck navigation may not work properly when being used offline.
    ///
    /// Feature enables following OCM layer groups:
    /// - "truck"
    /// - "long_truck_offline_routing"
    /// - "truck_offline_routing"
    truck,
    /// 3d landmarks
    ///
    /// Feature enables following OCM layer groups:
    /// - "landmarks"
    landmarks3d,
    /// Map data that provides traffic broadcast functionality using RDS-TMC format.
    /// It should be used when there is no internet connection, so that the routing module can utilize
    /// traffic data coming over the radio channel to build a route in the offline mode.
    /// Feature enables following OCM layer groups:
    /// - "rendering"
    /// - "navigation"
    /// - "routing"
    /// - "interop"
    traffic,
    /// EV charging stations
    ///
    /// Feature enables following OCM layer groups:
    /// - "ev_charging_station_rendering_premium"
    /// - "ev_charging_station_search_premium"
    ev,
    /// Enables truck related attributes to be returned by Offline Search engine.
    /// Feature enables following OCM layer groups:
    /// - "truck_service_premium"
    truckServiceAttributes,
    /// Enables fuel attributes to be returned by Offline Search engine.
    ///
    /// Feature enables following OCM layer groups:
    /// - "fueling_station_premium"
    fuelStationAttributes,
    /// Map data that is used to calculate bus routes.
    /// When not set, the `OfflineRoutingEngine` may not be able to calculate routes with `BusOptions`.
    ///
    /// Feature enables following OCM layer groups:
    /// - "bus_offline_routing"
    offlineBusRouting,
    /// Map data that provides junction view images and assets with aspect ratio 3x4.
    /// This will also provide common assets that do not depend on specific aspect ratio.
    /// By default this feature is disabled.
    ///
    /// Feature enables following OCM layer groups:
    /// - "junction_view_file_3x4"
    /// - "junction_view_asset_3x4"
    /// - "junction_view_asset_common"
    junctionView3x4,
    /// Map data that provides junction view images and assets with aspect ratio 16x9.
    /// This will also provide common assets that do not depend on specific aspect ratio.
    /// By default this feature is disabled.
    ///
    /// Feature enables following OCM layer groups:
    /// - "junction_view_file_16x9"
    /// - "junction_view_asset_16x9"
    /// - "junction_view_asset_common"
    junctionView16x9,
    /// Map data that provides junction sign images with aspect ratio 3x4.
    /// By default this feature is disabled.
    ///
    /// Feature enables following OCM layer groups:
    /// - "junction_sign_file_3x4"
    junctionSign3x4,
    /// Map data that provides junction sign images with aspect ratio 3x5.
    /// By default this feature is disabled.
    ///
    /// Feature enables following OCM layer groups:
    /// - "junction_sign_file_3x5"
    junctionSign3x5,
    /// Map data that provides junction sign images with aspect ratio 4x3.
    /// By default this feature is disabled.
    ///
    /// Feature enables following OCM layer groups:
    /// - "junction_sign_file_4x3"
    junctionSign4x3,
    /// Map data that provides junction sign images with aspect ratio 5x3.
    /// By default this feature is disabled.
    /// Feature enables following OCM layer groups:
    /// - "junction_sign_file_5x3"
    junctionSign5x3,
    /// Map data that provides junction sign images with aspect ratio 16x9.
    /// By default this feature is disabled.
    ///
    /// Feature enables following OCM layer groups:
    /// - "junction_sign_file_16x9"
    junctionSign16x9,
    /// Map data that provides topography information.
    /// By default this feature is disabled.
    /// Feature enables following OCM layer groups:
    /// - "terrain"
    terrain,
    /// Map data which provides ADAS information which includes slope,
    /// elevation and curvature information.
    /// By default this feature is disabled.
    /// Feature enables following OCM layer groups:
    /// - "adas"
    adas,
    /// Map data which provides information about the parts of foreign segments in a tile,
    /// where a foreign segment is a segment that is stored in another tile but intersects the current tile.
    /// By default this feature is disabled.
    /// Feature enables following OCM layer groups:
    /// - "ehorizon"
    ehorizon
}

// LayerConfigurationFeature "private" section, not exported.

int sdkCoreEngineLayerconfigurationFeatureToFfi(LayerConfigurationFeature value) {
  switch (value) {
  case LayerConfigurationFeature.detailRendering:
    return 0;
  case LayerConfigurationFeature.navigation:
    return 1;
  case LayerConfigurationFeature.offlineSearch:
    return 2;
  case LayerConfigurationFeature.offlineRouting:
    return 3;
  case LayerConfigurationFeature.rendering:
    return 4;
  case LayerConfigurationFeature.truck:
    return 5;
  case LayerConfigurationFeature.landmarks3d:
    return 6;
  case LayerConfigurationFeature.traffic:
    return 7;
  case LayerConfigurationFeature.ev:
    return 8;
  case LayerConfigurationFeature.truckServiceAttributes:
    return 9;
  case LayerConfigurationFeature.fuelStationAttributes:
    return 10;
  case LayerConfigurationFeature.offlineBusRouting:
    return 11;
  case LayerConfigurationFeature.junctionView3x4:
    return 12;
  case LayerConfigurationFeature.junctionView16x9:
    return 13;
  case LayerConfigurationFeature.junctionSign3x4:
    return 14;
  case LayerConfigurationFeature.junctionSign3x5:
    return 15;
  case LayerConfigurationFeature.junctionSign4x3:
    return 16;
  case LayerConfigurationFeature.junctionSign5x3:
    return 17;
  case LayerConfigurationFeature.junctionSign16x9:
    return 18;
  case LayerConfigurationFeature.terrain:
    return 19;
  case LayerConfigurationFeature.adas:
    return 20;
  case LayerConfigurationFeature.ehorizon:
    return 21;
  default:
    throw StateError("Invalid enum value $value for LayerConfigurationFeature enum.");
  }
}

LayerConfigurationFeature sdkCoreEngineLayerconfigurationFeatureFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LayerConfigurationFeature.detailRendering;
  case 1:
    return LayerConfigurationFeature.navigation;
  case 2:
    return LayerConfigurationFeature.offlineSearch;
  case 3:
    return LayerConfigurationFeature.offlineRouting;
  case 4:
    return LayerConfigurationFeature.rendering;
  case 5:
    return LayerConfigurationFeature.truck;
  case 6:
    return LayerConfigurationFeature.landmarks3d;
  case 7:
    return LayerConfigurationFeature.traffic;
  case 8:
    return LayerConfigurationFeature.ev;
  case 9:
    return LayerConfigurationFeature.truckServiceAttributes;
  case 10:
    return LayerConfigurationFeature.fuelStationAttributes;
  case 11:
    return LayerConfigurationFeature.offlineBusRouting;
  case 12:
    return LayerConfigurationFeature.junctionView3x4;
  case 13:
    return LayerConfigurationFeature.junctionView16x9;
  case 14:
    return LayerConfigurationFeature.junctionSign3x4;
  case 15:
    return LayerConfigurationFeature.junctionSign3x5;
  case 16:
    return LayerConfigurationFeature.junctionSign4x3;
  case 17:
    return LayerConfigurationFeature.junctionSign5x3;
  case 18:
    return LayerConfigurationFeature.junctionSign16x9;
  case 19:
    return LayerConfigurationFeature.terrain;
  case 20:
    return LayerConfigurationFeature.adas;
  case 21:
    return LayerConfigurationFeature.ehorizon;
  default:
    throw StateError("Invalid numeric value $handle for LayerConfigurationFeature enum.");
  }
}

void sdkCoreEngineLayerconfigurationFeatureReleaseFfiHandle(int handle) {}

final _sdkCoreEngineLayerconfigurationFeatureCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_engine_LayerConfiguration_Feature_create_handle_nullable'));
final _sdkCoreEngineLayerconfigurationFeatureReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_Feature_release_handle_nullable'));
final _sdkCoreEngineLayerconfigurationFeatureGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_Feature_get_value_nullable'));

Pointer<Void> sdkCoreEngineLayerconfigurationFeatureToFfiNullable(LayerConfigurationFeature? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineLayerconfigurationFeatureToFfi(value);
  final result = _sdkCoreEngineLayerconfigurationFeatureCreateHandleNullable(_handle);
  sdkCoreEngineLayerconfigurationFeatureReleaseFfiHandle(_handle);
  return result;
}

LayerConfigurationFeature? sdkCoreEngineLayerconfigurationFeatureFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineLayerconfigurationFeatureGetValueNullable(handle);
  final result = sdkCoreEngineLayerconfigurationFeatureFromFfi(_handle);
  sdkCoreEngineLayerconfigurationFeatureReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineLayerconfigurationFeatureReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineLayerconfigurationFeatureReleaseHandleNullable(handle);

// End of LayerConfigurationFeature "private" section.

// LayerConfiguration "private" section, not exported.

final _sdkCoreEngineLayerconfigurationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_create_handle'));
final _sdkCoreEngineLayerconfigurationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_release_handle'));
final _sdkCoreEngineLayerconfigurationGetFieldenabledFeatures = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_get_field_enabledFeatures'));



Pointer<Void> sdkCoreEngineLayerconfigurationToFfi(LayerConfiguration value) {
  final _enabledFeaturesHandle = heresdkCoreBindingslistofSdkCoreEngineLayerconfigurationFeatureToFfi(value.enabledFeatures);
  final _result = _sdkCoreEngineLayerconfigurationCreateHandle(_enabledFeaturesHandle);
  heresdkCoreBindingslistofSdkCoreEngineLayerconfigurationFeatureReleaseFfiHandle(_enabledFeaturesHandle);
  return _result;
}

LayerConfiguration sdkCoreEngineLayerconfigurationFromFfi(Pointer<Void> handle) {
  final _enabledFeaturesHandle = _sdkCoreEngineLayerconfigurationGetFieldenabledFeatures(handle);
  try {
    return LayerConfiguration(
      heresdkCoreBindingslistofSdkCoreEngineLayerconfigurationFeatureFromFfi(_enabledFeaturesHandle)
    );
  } finally {
    heresdkCoreBindingslistofSdkCoreEngineLayerconfigurationFeatureReleaseFfiHandle(_enabledFeaturesHandle);
  }
}

void sdkCoreEngineLayerconfigurationReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreEngineLayerconfigurationReleaseHandle(handle);

// Nullable LayerConfiguration

final _sdkCoreEngineLayerconfigurationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_create_handle_nullable'));
final _sdkCoreEngineLayerconfigurationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_release_handle_nullable'));
final _sdkCoreEngineLayerconfigurationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_LayerConfiguration_get_value_nullable'));

Pointer<Void> sdkCoreEngineLayerconfigurationToFfiNullable(LayerConfiguration? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineLayerconfigurationToFfi(value);
  final result = _sdkCoreEngineLayerconfigurationCreateHandleNullable(_handle);
  sdkCoreEngineLayerconfigurationReleaseFfiHandle(_handle);
  return result;
}

LayerConfiguration? sdkCoreEngineLayerconfigurationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineLayerconfigurationGetValueNullable(handle);
  final result = sdkCoreEngineLayerconfigurationFromFfi(_handle);
  sdkCoreEngineLayerconfigurationReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineLayerconfigurationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineLayerconfigurationReleaseHandleNullable(handle);

// End of LayerConfiguration "private" section.


