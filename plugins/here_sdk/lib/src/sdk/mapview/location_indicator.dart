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
import 'package:here_sdk/src/sdk/core/location.dart';
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;
import 'package:here_sdk/src/sdk/mapview/map_camera_update.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker3_d_model.dart';
import 'package:here_sdk/src/sdk/mapview/map_view_base.dart';
import 'package:here_sdk/src/sdk/mapview/map_view_lifecycle_listener.dart';
import 'package:meta/meta.dart';

/// Graphical object to represent the location of the user on the map.
///
/// It is either a green dot for pedestrian style or a triangular arrow for vehicle navigation style.
/// This style can be changed by [LocationIndicator.locationIndicatorStyle]
///
/// The location is made available to an instance of this class by calling [LocationIndicator.updateLocationAndCamera].
///
/// Use [LocationIndicator.enable] to add this object to the map and [LocationIndicator.disable] to remove it.
///
/// Note: The LocationIndicator is always rendered at a fixed altitude near 0. Changing the MapCamera
/// to look at geographic coordinates with an altitude that is higher can cause a problem: If the
/// MapCamera angle is tilted and altitude is too high, the LocationIndicator can unexpectedly
/// disappear from the viewport due to the new perspective.
/// The use of [LocationIndicator] as [MapViewLifecycleListener] is deprecated.
/// Starting with v. 4.18.0 [LocationIndicator] will no longer implement [MapViewLifecycleListener]
/// so the object cannot be added/removed to/from the [MapViewBase] via
/// `addLifecycleListener`/`removeLifecycleListener` anymore.
/// Use [LocationIndicator.enable]/[LocationIndicator.disable] to add/remove a [LocationIndicator] to/from a [MapViewBase].
abstract class LocationIndicator implements MapViewLifecycleListener {
  /// Creates an instance of LocationIndicator.
  ///
  factory LocationIndicator() => $prototype.$init();
  /// Creates an instance of LocationIndicator and adds it to provided [MapViewBase].
  ///
  /// [mapView] The [MapViewBase] instance.
  ///
  factory LocationIndicator.withMapView(MapViewBase mapView) => $prototype.withMapView(mapView);

  /// Enables [LocationIndicator] for provided [MapViewBase].
  ///
  /// If [LocationIndicator] is already enabled (added to map view) for passed map view, this function does nothing.
  /// If [LocationIndicator] is added to different [MapViewBase], this function removes first [LocationIndicator]
  /// from previous map view before adding to new one.
  ///
  /// [mapView] The [MapViewBase] instance.
  ///
  void enable(MapViewBase mapView);
  /// This function removes [LocationIndicator] from map view.
  ///
  /// If [LocationIndicator] was not added to any map view yet, this function does nothing.
  ///
  void disable();
  /// Updates the indicator to a new location.
  ///
  /// If accuracy visualized is set to true the field [Location.horizontalAccuracyInMeters]
  /// controls the size of the accuracy indicator halo.
  ///
  /// [location] The updated location of the user.
  ///
  void updateLocation(location_impl.Location location);
  /// Updates the indicator to a new location and applies a camera update at the same time.
  ///
  /// Does nothing if the indicator instance is not enabled.
  /// If accuracy visualized is set to true the field [Location.horizontalAccuracyInMeters]
  /// controls the size of the accuracy indicator halo.
  ///
  /// [location] The updated location of the user.
  ///
  /// [cameraUpdate] The update to apply to the camera.
  ///
  void updateLocationAndCamera(location_impl.Location location, MapCameraUpdate cameraUpdate);
  /// Sets the MapMarker3DModel asset to be displayed as location indicator for a specified type.
  ///
  /// The 3D model should be oriented with y axis up and thus standing on the x/z plane where the
  /// z axis is the depth. The direction in which the location indicator is pointing is the
  /// positive z axis. Please note that only MapMarker3DModel created from *.obj files are
  /// supported. Models created from Mesh will be ignored.
  ///
  /// [model] The MapMarker3DModel object to be displayed for the specified type. Only models
  /// created from obj files are supported. Those created from mesh will be ignored.
  ///
  /// [scale] The scaling which will be applied to the marker model. As the size of the
  /// location marker should be aligned on devices with different resolutions the
  /// scale factor is applied relative to the ppi value and thus differs from the
  /// scale which is passed to [MapMarker3D] objects. For the default
  /// marker models a value of 5.0 was used.
  ///
  /// [type] The type of location marker for which the marker 3d model should be replaced.
  ///
  void setMarker3dModel(MapMarker3DModel model, double scale, LocationIndicatorMarkerType type);
  /// Returns `true` if the horizontal accuracy passed to [LocationIndicator.updateLocationAndCamera] is visualized by
  /// scaling the accuracy indicator halo accordingly. It is `false` by default, in which case
  /// the halo has a fixed and zoom level independent size.
  bool get isAccuracyVisualized;
  /// Sets whether the horizontal accuracy passed to [LocationIndicator.updateLocationAndCamera] is visualized
  /// by scaling the accuracy indicator halo accordingly. It is `false` by default, in which case
  /// the halo has a fixed and zoom level independent size.
  ///
  /// When set to `true`, the radius of the radius of the halo corresponds to the value of
  /// [Location.horizontalAccuracyInMeters] passed to [LocationIndicator.updateLocationAndCamera]
  /// and scales in world coordinates.
  ///
  /// For values smaller than 20 meters the halo is hidden.
  /// The radius of the halo is limited to 500 meters and values higher than that or `null`
  /// will keep the halo at that size.
  ///
  /// If the location indicator is set to inactive (which can be checked via [LocationIndicator.isActive]),
  /// then the halo is always hidden.
  set isAccuracyVisualized(bool value);

  /// Returns visual style of location indicator. By default, it is [LocationIndicatorIndicatorStyle.pedestrian].
  LocationIndicatorIndicatorStyle get locationIndicatorStyle;
  /// Sets the visual style of location indicator. By default, the style is [LocationIndicatorIndicatorStyle.pedestrian].
  set locationIndicatorStyle(LocationIndicatorIndicatorStyle value);

  /// Returns `true` if active version of the location indicator is shown or `false`
  /// when inactive version is shown. By default, it is `true`.
  bool get isActive;
  /// Sets whether the active or inactive version of location indicator is to be shown.
  /// the indicator to active state if true is passed and to inactive state when false
  /// is passed. By default, it is `true`.
  set isActive(bool value);

  /// Gets the current opacity of the location indicator. Default value is 1.0.
  double get opacity;
  /// Sets the opacity of the location indicator.
  /// Provided value is clamped in range \[0.0, 1.0\]. Default value is 1.0, which means location
  /// indicator is displayed with the default alpha channel of the texture.
  set opacity(double value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = LocationIndicator$Impl(Pointer<Void>.fromAddress(0));
}

/// The predefined styles for the location indicator which are pedestrian and navigation mode.
enum LocationIndicatorIndicatorStyle {
    /// The location is indicated using a green dot with a small arrow indicating the north-up
    /// direction of the device. If the position is outdated it is shown in grey.
    /// This should be preferred for pedestrian use cases.
    pedestrian,
    /// The location is indicated using a triangular green arrow which indicates the direction
    /// into which the user is moving. This should be preferred for vehicle navigation use cases.
    navigation
}

// LocationIndicatorIndicatorStyle "private" section, not exported.

int sdkMapviewLocationindicatorIndicatorstyleToFfi(LocationIndicatorIndicatorStyle value) {
  switch (value) {
  case LocationIndicatorIndicatorStyle.pedestrian:
    return 0;
  case LocationIndicatorIndicatorStyle.navigation:
    return 1;
  default:
    throw StateError("Invalid enum value $value for LocationIndicatorIndicatorStyle enum.");
  }
}

LocationIndicatorIndicatorStyle sdkMapviewLocationindicatorIndicatorstyleFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LocationIndicatorIndicatorStyle.pedestrian;
  case 1:
    return LocationIndicatorIndicatorStyle.navigation;
  default:
    throw StateError("Invalid numeric value $handle for LocationIndicatorIndicatorStyle enum.");
  }
}

void sdkMapviewLocationindicatorIndicatorstyleReleaseFfiHandle(int handle) {}

final _sdkMapviewLocationindicatorIndicatorstyleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_LocationIndicator_IndicatorStyle_create_handle_nullable'));
final _sdkMapviewLocationindicatorIndicatorstyleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LocationIndicator_IndicatorStyle_release_handle_nullable'));
final _sdkMapviewLocationindicatorIndicatorstyleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LocationIndicator_IndicatorStyle_get_value_nullable'));

Pointer<Void> sdkMapviewLocationindicatorIndicatorstyleToFfiNullable(LocationIndicatorIndicatorStyle? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewLocationindicatorIndicatorstyleToFfi(value);
  final result = _sdkMapviewLocationindicatorIndicatorstyleCreateHandleNullable(_handle);
  sdkMapviewLocationindicatorIndicatorstyleReleaseFfiHandle(_handle);
  return result;
}

LocationIndicatorIndicatorStyle? sdkMapviewLocationindicatorIndicatorstyleFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewLocationindicatorIndicatorstyleGetValueNullable(handle);
  final result = sdkMapviewLocationindicatorIndicatorstyleFromFfi(_handle);
  sdkMapviewLocationindicatorIndicatorstyleReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewLocationindicatorIndicatorstyleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewLocationindicatorIndicatorstyleReleaseHandleNullable(handle);

// End of LocationIndicatorIndicatorStyle "private" section.
/// Enum to identify different types of markers of the location indicator.
enum LocationIndicatorMarkerType {
    /// Pedestrian navigation represented by a green dot by default.
    pedestrian,
    /// Pedestrian navigation in inactive state, represented by a gray dot by default.
    /// It is used when the indicator was set to inactive using [LocationIndicator.isActive]
    /// in pedestrian mode.
    pedestrianInactive,
    /// Vehicle navigation represented by a green triangular arrow by default.
    navigation,
    /// Vehicle navigation in inactive state, represented by a gray triangular arrow by default.
    /// It is used when the indicator was set to inactive using [LocationIndicator.isActive]
    /// in navigation mode.
    navigationInactive
}

// LocationIndicatorMarkerType "private" section, not exported.

int sdkMapviewLocationindicatorMarkertypeToFfi(LocationIndicatorMarkerType value) {
  switch (value) {
  case LocationIndicatorMarkerType.pedestrian:
    return 0;
  case LocationIndicatorMarkerType.pedestrianInactive:
    return 1;
  case LocationIndicatorMarkerType.navigation:
    return 2;
  case LocationIndicatorMarkerType.navigationInactive:
    return 3;
  default:
    throw StateError("Invalid enum value $value for LocationIndicatorMarkerType enum.");
  }
}

LocationIndicatorMarkerType sdkMapviewLocationindicatorMarkertypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LocationIndicatorMarkerType.pedestrian;
  case 1:
    return LocationIndicatorMarkerType.pedestrianInactive;
  case 2:
    return LocationIndicatorMarkerType.navigation;
  case 3:
    return LocationIndicatorMarkerType.navigationInactive;
  default:
    throw StateError("Invalid numeric value $handle for LocationIndicatorMarkerType enum.");
  }
}

void sdkMapviewLocationindicatorMarkertypeReleaseFfiHandle(int handle) {}

final _sdkMapviewLocationindicatorMarkertypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_LocationIndicator_MarkerType_create_handle_nullable'));
final _sdkMapviewLocationindicatorMarkertypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LocationIndicator_MarkerType_release_handle_nullable'));
final _sdkMapviewLocationindicatorMarkertypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LocationIndicator_MarkerType_get_value_nullable'));

Pointer<Void> sdkMapviewLocationindicatorMarkertypeToFfiNullable(LocationIndicatorMarkerType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewLocationindicatorMarkertypeToFfi(value);
  final result = _sdkMapviewLocationindicatorMarkertypeCreateHandleNullable(_handle);
  sdkMapviewLocationindicatorMarkertypeReleaseFfiHandle(_handle);
  return result;
}

LocationIndicatorMarkerType? sdkMapviewLocationindicatorMarkertypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewLocationindicatorMarkertypeGetValueNullable(handle);
  final result = sdkMapviewLocationindicatorMarkertypeFromFfi(_handle);
  sdkMapviewLocationindicatorMarkertypeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewLocationindicatorMarkertypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewLocationindicatorMarkertypeReleaseHandleNullable(handle);

// End of LocationIndicatorMarkerType "private" section.

// LocationIndicator "private" section, not exported.

final _sdkMapviewLocationindicatorRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_LocationIndicator_register_finalizer'));
final _sdkMapviewLocationindicatorCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LocationIndicator_copy_handle'));
final _sdkMapviewLocationindicatorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LocationIndicator_release_handle'));
final _sdkMapviewLocationindicatorGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_LocationIndicator_get_type_id'));









/// @nodoc
@visibleForTesting
class LocationIndicator$Impl extends __lib.NativeBase implements LocationIndicator {

  LocationIndicator$Impl(Pointer<Void> handle) : super(handle);


  LocationIndicator $init() {
    final _result_handle = _$init();
    final _result = LocationIndicator$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewLocationindicatorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  LocationIndicator withMapView(MapViewBase mapView) {
    final _result_handle = _withMapView(mapView);
    final _result = LocationIndicator$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewLocationindicatorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_mapview_LocationIndicator_make'));
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  static Pointer<Void> _withMapView(MapViewBase mapView) {
    final _withMapViewFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_LocationIndicator_make__MapViewBase'));
    final _mapViewHandle = sdkMapviewMapviewbaseToFfi(mapView);
    final __resultHandle = _withMapViewFfi(__lib.LibraryContext.isolateId, _mapViewHandle);
    sdkMapviewMapviewbaseReleaseFfiHandle(_mapViewHandle);
    return __resultHandle;
  }

  @override
  void enable(MapViewBase mapView) {
    final _enableFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_LocationIndicator_enable__MapViewBase'));
    final _mapViewHandle = sdkMapviewMapviewbaseToFfi(mapView);
    final _handle = this.handle;
    _enableFfi(_handle, __lib.LibraryContext.isolateId, _mapViewHandle);
    sdkMapviewMapviewbaseReleaseFfiHandle(_mapViewHandle);

  }

  @override
  void disable() {
    final _disableFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_LocationIndicator_disable'));
    final _handle = this.handle;
    _disableFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void updateLocation(location_impl.Location location) {
    final _updateLocationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_LocationIndicator_updateLocation__Location'));
    final _locationHandle = sdkCoreLocationToFfi(location);
    final _handle = this.handle;
    _updateLocationFfi(_handle, __lib.LibraryContext.isolateId, _locationHandle);
    sdkCoreLocationReleaseFfiHandle(_locationHandle);

  }

  @override
  void updateLocationAndCamera(location_impl.Location location, MapCameraUpdate cameraUpdate) {
    final _updateLocationAndCameraFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_LocationIndicator_updateLocation__Location_MapCameraUpdate'));
    final _locationHandle = sdkCoreLocationToFfi(location);
    final _cameraUpdateHandle = sdkMapviewMapcameraupdateToFfi(cameraUpdate);
    final _handle = this.handle;
    _updateLocationAndCameraFfi(_handle, __lib.LibraryContext.isolateId, _locationHandle, _cameraUpdateHandle);
    sdkCoreLocationReleaseFfiHandle(_locationHandle);
    sdkMapviewMapcameraupdateReleaseFfiHandle(_cameraUpdateHandle);

  }

  @override
  void setMarker3dModel(MapMarker3DModel model, double scale, LocationIndicatorMarkerType type) {
    final _setMarker3dModelFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Double, Uint32), void Function(Pointer<Void>, int, Pointer<Void>, double, int)>('here_sdk_sdk_mapview_LocationIndicator_setMarker3dModel__MapMarker3DModel_Double_MarkerType'));
    final _modelHandle = sdkMapviewMapmarker3dmodelToFfi(model);
    final _scaleHandle = (scale);
    final _typeHandle = sdkMapviewLocationindicatorMarkertypeToFfi(type);
    final _handle = this.handle;
    _setMarker3dModelFfi(_handle, __lib.LibraryContext.isolateId, _modelHandle, _scaleHandle, _typeHandle);
    sdkMapviewMapmarker3dmodelReleaseFfiHandle(_modelHandle);

    sdkMapviewLocationindicatorMarkertypeReleaseFfiHandle(_typeHandle);

  }

  @override
  void onAttach(MapViewBase mapView) {
    final _onAttachFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_LocationIndicator_onAttach__MapViewBase'));
    final _mapViewHandle = sdkMapviewMapviewbaseToFfi(mapView);
    final _handle = this.handle;
    _onAttachFfi(_handle, __lib.LibraryContext.isolateId, _mapViewHandle);
    sdkMapviewMapviewbaseReleaseFfiHandle(_mapViewHandle);

  }

  @override
  void onDetach(MapViewBase mapView) {
    final _onDetachFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_LocationIndicator_onDetach__MapViewBase'));
    final _mapViewHandle = sdkMapviewMapviewbaseToFfi(mapView);
    final _handle = this.handle;
    _onDetachFfi(_handle, __lib.LibraryContext.isolateId, _mapViewHandle);
    sdkMapviewMapviewbaseReleaseFfiHandle(_mapViewHandle);

  }

  @override
  void onPause() {
    final _onPauseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_LocationIndicator_onPause'));
    final _handle = this.handle;
    _onPauseFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void onResume() {
    final _onResumeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_LocationIndicator_onResume'));
    final _handle = this.handle;
    _onResumeFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void onDestroy() {
    final _onDestroyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_LocationIndicator_onDestroy'));
    final _handle = this.handle;
    _onDestroyFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  bool get isAccuracyVisualized {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_LocationIndicator_isAccuracyVisualized_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isAccuracyVisualized(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_LocationIndicator_isAccuracyVisualized_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  @override
  LocationIndicatorIndicatorStyle get locationIndicatorStyle {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_LocationIndicator_locationIndicatorStyle_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewLocationindicatorIndicatorstyleFromFfi(__resultHandle);
    } finally {
      sdkMapviewLocationindicatorIndicatorstyleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set locationIndicatorStyle(LocationIndicatorIndicatorStyle value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_LocationIndicator_locationIndicatorStyle_set__IndicatorStyle'));
    final _valueHandle = sdkMapviewLocationindicatorIndicatorstyleToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkMapviewLocationindicatorIndicatorstyleReleaseFfiHandle(_valueHandle);

  }


  @override
  bool get isActive {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_LocationIndicator_isActive_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isActive(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_LocationIndicator_isActive_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  @override
  double get opacity {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_LocationIndicator_opacity_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set opacity(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_LocationIndicator_opacity_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }



}

Pointer<Void> sdkMapviewLocationindicatorToFfi(LocationIndicator value) =>
  _sdkMapviewLocationindicatorCopyHandle((value as __lib.NativeBase).handle);

LocationIndicator sdkMapviewLocationindicatorFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LocationIndicator) return instance;

  final _typeIdHandle = _sdkMapviewLocationindicatorGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewLocationindicatorCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : LocationIndicator$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewLocationindicatorRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewLocationindicatorReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewLocationindicatorReleaseHandle(handle);

Pointer<Void> sdkMapviewLocationindicatorToFfiNullable(LocationIndicator? value) =>
  value != null ? sdkMapviewLocationindicatorToFfi(value) : Pointer<Void>.fromAddress(0);

LocationIndicator? sdkMapviewLocationindicatorFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewLocationindicatorFromFfi(handle) : null;

void sdkMapviewLocationindicatorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewLocationindicatorReleaseHandle(handle);

// End of LocationIndicator "private" section.


