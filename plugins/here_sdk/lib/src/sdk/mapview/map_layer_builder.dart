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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/mapview/here_map_controller_core.dart';
import 'package:here_sdk/src/sdk/mapview/map_content_type.dart';
import 'package:here_sdk/src/sdk/mapview/map_layer.dart';
import 'package:here_sdk/src/sdk/mapview/map_layer_priority.dart';
import 'package:here_sdk/src/sdk/mapview/map_layer_visibility_range.dart';
import 'package:here_sdk/src/sdk/mapview/style.dart';
import 'package:meta/meta.dart';

/// MapLayerBuilder is used to add layers to a map to visualise a dataset in a
/// programmatic way without defining it upfront in the configuration files.
///
/// For example, after loading a scene configuration file, the renderer is setup to draw layers in the
/// following order:
///
/// * background
/// * water
/// * roads:outline
/// * roads
/// * labels
///
/// Rendering order of elements in
/// a single map layer can be controlled with categories. Layer names are unique, and category names have
/// to be unique within a layer. The layer's default, main category is unnamed.
///
/// The concept of 'category' is tightly linked to styling. The idea behind category is that
/// one should be able to style separately elements in a map layer. Take, for instance, roads.
/// If one wants to style separately the bridges it will create a category 'bridges' and style
/// it accordingly in the style file. If the user does not intend to or cannot style elements of
/// the layer differently then it should opt for a layer with only the default category (e.g.
/// for a raster layer, only the default category makes sense, since the layer has no other
/// stylable elements apart from the raster image).
///
/// A new layer called 'zone' and its category 'background' can be added dynamically so that the
/// rendering order gets modified in the following way:
///
/// * background
/// * water
/// * zone:background
/// * zone
/// * roads:outline
/// * roads
/// * labels
///
/// This could be achieved with the help of the MapLayerPriorityBuilder and the MapLayerBuilder as in the
/// following example:
///
/// ```
///  final layerPriority = MapLayerPriorityBuilder()
///      .renderedAfterLayer("water") // places main category after 'water'
///      .withCategory("background")
///      .renderedAfterLayer("water") // places 'background' category after 'water' and before the
///                                   // layer's main category.
///      .build();
///
///  var layer = MapLayerBuilder()
///      .withDataSource("DataSourceName", MapContentType.line)
///      .forMap(map)
///      .withName("zone")
///      .withPriority(layerPriority)
///      .build();
/// ```
///
/// In case no layer priority or an empty one is provided, or if a reference layer-category pair is not
/// present in the rendering order, the layer is going to be rendered last with respect to the rendering
/// order at the time of its creation.
///
/// Due to current limitations, the MapLayerPriority assignment is not implemented for point map layers.
/// All labels will be rendered within the "labels" layer, defined in the scene configuration file.
/// By default, all labels rendered by a point map layer are rendered last and no overlapping is allowed.
/// The following categories can be used to have a different behaviour:
/// - 'custom-labels' A label should be rendered first, is allowed to overlap with other labels of
///   the same category and block map labels.
/// - 'custom-labels-no-self-overlap' A label should be rendered after 'custom-labels', is not allowed
///   to overlap with other labels of the same categoty and block map labels.
/// - 'custom-labels-overlap-all' A label should be rendered last, is allowed to overlap all
///   predefined categories, also map labels.
///   These categories are configured accordingly in the basic map
///   scene configurations.
///   Category assignment to features can be done in the style based on data attributes. The category
///   assignment can be done for all types of content: point, line, polygon.}
abstract class MapLayerBuilder {
  /// Creates an instance of the layer builder interface.
  ///
  factory MapLayerBuilder() => $prototype.create();

  /// Configures builder to use the given name as a layer name.
  ///
  /// The name is a mandatory layer creation parameter.
  ///
  /// [name] Name of the layer. Must be unique.
  ///
  /// Returns [MapLayerBuilder]. This class instance.
  ///
  MapLayerBuilder withName(String name);
  /// Configures the builder to use a data source with the given name as the source
  /// of data for the layer.
  ///
  /// The datasource name and content type are mandatory layer creation parameters.
  ///
  /// [dataSourceName] Name of the data source.
  ///
  /// [contentType] The renderable content type supplied by the data source.
  ///
  /// Returns [MapLayerBuilder]. This class instance.
  ///
  MapLayerBuilder withDataSource(String dataSourceName, MapContentType contentType);
  /// Configures the builder to use a style.
  ///
  /// Providing a style is not mandatory. When not provided, a corresponding style is looked-up in the
  /// map scene configuration. The style can also be set/updated after the layer creation.
  /// For more details see Custom Layer Style Reference in the documentation.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behavior. Related APIs may change for new releases without a deprecation process.
  ///
  /// [style] Style for the layer.
  ///
  /// Returns [MapLayerBuilder]. This class instance.
  ///
  MapLayerBuilder withStyle(Style style);
  /// Configures the builder to display a layer in the given map.
  ///
  /// The map is a mandatory layer creation parameter.
  ///
  /// [targetMap] The map.
  ///
  /// Returns [MapLayerBuilder]. This class instance.
  ///
  MapLayerBuilder forMap(HereMapControllerCore targetMap);
  /// Configures the builder to set the MapLayerPriority to be used by the layer.
  ///
  /// [priority] MapLayerPriority which should be applied to the layer.
  ///
  /// Returns [MapLayerBuilder]. This class instance.
  ///
  MapLayerBuilder withPriority(MapLayerPriority priority);
  /// Configures the builder to set the layer visible in the given zoom levels range.
  ///
  /// Values outside the map zoom level range (0, 24) will be ignored.
  /// Providing the visibility range is optional. If not provided, the layer will be visible
  /// on all zoom levels.
  ///
  /// [visibilityRange] Visibility range which should be applied to the layer.
  ///
  /// Returns [MapLayerBuilder]. This class instance.
  ///
  MapLayerBuilder withVisibilityRange(MapLayerVisibilityRange visibilityRange);
  /// Configures the builder to set the layer load priority.
  ///
  /// Higher load priority values lead to layer being scheduled for loading before layers with lesser values.
  ///
  /// [loadPriority] Load priority for layer.
  ///
  /// Returns [MapLayerBuilder]. This class instance.
  ///
  MapLayerBuilder withLoadPriority(double loadPriority);
  /// Constructs, registers and configures a new map layer showing specified content type
  /// according to the configured parameters.
  ///
  /// After this call this instance is reset to the initial state. It could be used to build another
  /// map layer, but will not keep any previously configured properties.
  ///
  /// Returns [MapLayer]. A new MapLayer instance.
  ///
  /// Throws [MapLayerBuilderInstantiationException]. Indicates an instantiation issue.
  ///
  MapLayer build();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapLayerBuilder$Impl(Pointer<Void>.fromAddress(0));
}

/// Describes a reason for failing to build a [MapLayer].
enum MapLayerBuilderInstantiationErrorCode {
    /// Missing mandatory parameter.
    missingMandatoryParameter,
    /// Unsupported content type.
    unsupportedContentType
}

// MapLayerBuilderInstantiationErrorCode "private" section, not exported.

int sdkMapviewMaplayerbuilderInstantiationerrorcodeToFfi(MapLayerBuilderInstantiationErrorCode value) {
  switch (value) {
  case MapLayerBuilderInstantiationErrorCode.missingMandatoryParameter:
    return 1;
  case MapLayerBuilderInstantiationErrorCode.unsupportedContentType:
    return 2;
  default:
    throw StateError("Invalid enum value $value for MapLayerBuilderInstantiationErrorCode enum.");
  }
}

MapLayerBuilderInstantiationErrorCode sdkMapviewMaplayerbuilderInstantiationerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return MapLayerBuilderInstantiationErrorCode.missingMandatoryParameter;
  case 2:
    return MapLayerBuilderInstantiationErrorCode.unsupportedContentType;
  default:
    throw StateError("Invalid numeric value $handle for MapLayerBuilderInstantiationErrorCode enum.");
  }
}

void sdkMapviewMaplayerbuilderInstantiationerrorcodeReleaseFfiHandle(int handle) {}

final _sdkMapviewMaplayerbuilderInstantiationerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapLayerBuilder_InstantiationErrorCode_create_handle_nullable'));
final _sdkMapviewMaplayerbuilderInstantiationerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerBuilder_InstantiationErrorCode_release_handle_nullable'));
final _sdkMapviewMaplayerbuilderInstantiationerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerBuilder_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdkMapviewMaplayerbuilderInstantiationerrorcodeToFfiNullable(MapLayerBuilderInstantiationErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMaplayerbuilderInstantiationerrorcodeToFfi(value);
  final result = _sdkMapviewMaplayerbuilderInstantiationerrorcodeCreateHandleNullable(_handle);
  sdkMapviewMaplayerbuilderInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

MapLayerBuilderInstantiationErrorCode? sdkMapviewMaplayerbuilderInstantiationerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMaplayerbuilderInstantiationerrorcodeGetValueNullable(handle);
  final result = sdkMapviewMaplayerbuilderInstantiationerrorcodeFromFfi(_handle);
  sdkMapviewMaplayerbuilderInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMaplayerbuilderInstantiationerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMaplayerbuilderInstantiationerrorcodeReleaseHandleNullable(handle);

// End of MapLayerBuilderInstantiationErrorCode "private" section.
/// Thrown when failing to build a [MapLayer].
class MapLayerBuilderInstantiationException implements Exception {
  final MapLayerBuilderInstantiationErrorDetails error;
  MapLayerBuilderInstantiationException(this.error);
}
/// Describes the reason for failing to build a [MapLayer].

class MapLayerBuilderInstantiationErrorDetails {
  /// The error code.
  MapLayerBuilderInstantiationErrorCode errorCode;

  /// A description of the error, if available.
  String? errorDescription;

  /// Creates a new instance.
  /// [errorCode] The error code.
  /// [errorDescription] A description of the error, if available.
  MapLayerBuilderInstantiationErrorDetails(this.errorCode, this.errorDescription);
}


// MapLayerBuilderInstantiationErrorDetails "private" section, not exported.

final _sdkMapviewMaplayerbuilderInstantiationerrordetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerBuilder_InstantiationErrorDetails_create_handle'));
final _sdkMapviewMaplayerbuilderInstantiationerrordetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerBuilder_InstantiationErrorDetails_release_handle'));
final _sdkMapviewMaplayerbuilderInstantiationerrordetailsGetFielderrorCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerBuilder_InstantiationErrorDetails_get_field_errorCode'));
final _sdkMapviewMaplayerbuilderInstantiationerrordetailsGetFielderrorDescription = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerBuilder_InstantiationErrorDetails_get_field_errorDescription'));



Pointer<Void> sdkMapviewMaplayerbuilderInstantiationerrordetailsToFfi(MapLayerBuilderInstantiationErrorDetails value) {
  final _errorCodeHandle = sdkMapviewMaplayerbuilderInstantiationerrorcodeToFfi(value.errorCode);
  final _errorDescriptionHandle = stringToFfiNullable(value.errorDescription);
  final _result = _sdkMapviewMaplayerbuilderInstantiationerrordetailsCreateHandle(_errorCodeHandle, _errorDescriptionHandle);
  sdkMapviewMaplayerbuilderInstantiationerrorcodeReleaseFfiHandle(_errorCodeHandle);
  stringReleaseFfiHandleNullable(_errorDescriptionHandle);
  return _result;
}

MapLayerBuilderInstantiationErrorDetails sdkMapviewMaplayerbuilderInstantiationerrordetailsFromFfi(Pointer<Void> handle) {
  final _errorCodeHandle = _sdkMapviewMaplayerbuilderInstantiationerrordetailsGetFielderrorCode(handle);
  final _errorDescriptionHandle = _sdkMapviewMaplayerbuilderInstantiationerrordetailsGetFielderrorDescription(handle);
  try {
    return MapLayerBuilderInstantiationErrorDetails(
      sdkMapviewMaplayerbuilderInstantiationerrorcodeFromFfi(_errorCodeHandle), 
      stringFromFfiNullable(_errorDescriptionHandle)
    );
  } finally {
    sdkMapviewMaplayerbuilderInstantiationerrorcodeReleaseFfiHandle(_errorCodeHandle);
    stringReleaseFfiHandleNullable(_errorDescriptionHandle);
  }
}

void sdkMapviewMaplayerbuilderInstantiationerrordetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewMaplayerbuilderInstantiationerrordetailsReleaseHandle(handle);

// Nullable MapLayerBuilderInstantiationErrorDetails

final _sdkMapviewMaplayerbuilderInstantiationerrordetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerBuilder_InstantiationErrorDetails_create_handle_nullable'));
final _sdkMapviewMaplayerbuilderInstantiationerrordetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerBuilder_InstantiationErrorDetails_release_handle_nullable'));
final _sdkMapviewMaplayerbuilderInstantiationerrordetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerBuilder_InstantiationErrorDetails_get_value_nullable'));

Pointer<Void> sdkMapviewMaplayerbuilderInstantiationerrordetailsToFfiNullable(MapLayerBuilderInstantiationErrorDetails? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMaplayerbuilderInstantiationerrordetailsToFfi(value);
  final result = _sdkMapviewMaplayerbuilderInstantiationerrordetailsCreateHandleNullable(_handle);
  sdkMapviewMaplayerbuilderInstantiationerrordetailsReleaseFfiHandle(_handle);
  return result;
}

MapLayerBuilderInstantiationErrorDetails? sdkMapviewMaplayerbuilderInstantiationerrordetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMaplayerbuilderInstantiationerrordetailsGetValueNullable(handle);
  final result = sdkMapviewMaplayerbuilderInstantiationerrordetailsFromFfi(_handle);
  sdkMapviewMaplayerbuilderInstantiationerrordetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMaplayerbuilderInstantiationerrordetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMaplayerbuilderInstantiationerrordetailsReleaseHandleNullable(handle);

// End of MapLayerBuilderInstantiationErrorDetails "private" section.

// MapLayerBuilder "private" section, not exported.

final _sdkMapviewMaplayerbuilderRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapLayerBuilder_register_finalizer'));
final _sdkMapviewMaplayerbuilderCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerBuilder_copy_handle'));
final _sdkMapviewMaplayerbuilderReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerBuilder_release_handle'));










final _buildsdkMapviewMaplayerbuilderBuildReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerBuilder_build_return_release_handle'));
final _buildsdkMapviewMaplayerbuilderBuildReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerBuilder_build_return_get_result'));
final _buildsdkMapviewMaplayerbuilderBuildReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerBuilder_build_return_get_error'));
final _buildsdkMapviewMaplayerbuilderBuildReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerBuilder_build_return_has_error'));


/// @nodoc
@visibleForTesting
class MapLayerBuilder$Impl extends __lib.NativeBase implements MapLayerBuilder {

  MapLayerBuilder$Impl(Pointer<Void> handle) : super(handle);


  MapLayerBuilder create() {
    final _result_handle = _create();
    final _result = MapLayerBuilder$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMaplayerbuilderRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _create() {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_mapview_MapLayerBuilder_create'));
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  @override
  MapLayerBuilder withName(String name) {
    final _withNameFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapLayerBuilder_withName__String'));
    final _nameHandle = stringToFfi(name);
    final _handle = this.handle;
    final __resultHandle = _withNameFfi(_handle, __lib.LibraryContext.isolateId, _nameHandle);
    stringReleaseFfiHandle(_nameHandle);
    try {
      return sdkMapviewMaplayerbuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerbuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapLayerBuilder withDataSource(String dataSourceName, MapContentType contentType) {
    final _withDataSourceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Uint32), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapLayerBuilder_withDataSource__String_SDKMapContentType'));
    final _dataSourceNameHandle = stringToFfi(dataSourceName);
    final _contentTypeHandle = sdkMapviewSdkmapcontenttypeToFfi(contentType);
    final _handle = this.handle;
    final __resultHandle = _withDataSourceFfi(_handle, __lib.LibraryContext.isolateId, _dataSourceNameHandle, _contentTypeHandle);
    stringReleaseFfiHandle(_dataSourceNameHandle);
    sdkMapviewSdkmapcontenttypeReleaseFfiHandle(_contentTypeHandle);
    try {
      return sdkMapviewMaplayerbuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerbuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapLayerBuilder withStyle(Style style) {
    final _withStyleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapLayerBuilder_withStyle__Style'));
    final _styleHandle = sdkMapviewStyleToFfi(style);
    final _handle = this.handle;
    final __resultHandle = _withStyleFfi(_handle, __lib.LibraryContext.isolateId, _styleHandle);
    sdkMapviewStyleReleaseFfiHandle(_styleHandle);
    try {
      return sdkMapviewMaplayerbuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerbuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapLayerBuilder forMap(HereMapControllerCore targetMap) {
    final _forMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapLayerBuilder_forMap__HereMap'));
    final _targetMapHandle = sdkMapviewHeremapToFfi(targetMap);
    final _handle = this.handle;
    final __resultHandle = _forMapFfi(_handle, __lib.LibraryContext.isolateId, _targetMapHandle);
    sdkMapviewHeremapReleaseFfiHandle(_targetMapHandle);
    try {
      return sdkMapviewMaplayerbuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerbuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapLayerBuilder withPriority(MapLayerPriority priority) {
    final _withPriorityFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapLayerBuilder_withPriority__MapLayerPriority'));
    final _priorityHandle = sdkMapviewMaplayerpriorityToFfi(priority);
    final _handle = this.handle;
    final __resultHandle = _withPriorityFfi(_handle, __lib.LibraryContext.isolateId, _priorityHandle);
    sdkMapviewMaplayerpriorityReleaseFfiHandle(_priorityHandle);
    try {
      return sdkMapviewMaplayerbuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerbuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapLayerBuilder withVisibilityRange(MapLayerVisibilityRange visibilityRange) {
    final _withVisibilityRangeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapLayerBuilder_withVisibilityRange__MapLayerVisibilityRange'));
    final _visibilityRangeHandle = sdkMapviewMaplayervisibilityrangeToFfi(visibilityRange);
    final _handle = this.handle;
    final __resultHandle = _withVisibilityRangeFfi(_handle, __lib.LibraryContext.isolateId, _visibilityRangeHandle);
    sdkMapviewMaplayervisibilityrangeReleaseFfiHandle(_visibilityRangeHandle);
    try {
      return sdkMapviewMaplayerbuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerbuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapLayerBuilder withLoadPriority(double loadPriority) {
    final _withLoadPriorityFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double), Pointer<Void> Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapLayerBuilder_withLoadPriority__Double'));
    final _loadPriorityHandle = (loadPriority);
    final _handle = this.handle;
    final __resultHandle = _withLoadPriorityFfi(_handle, __lib.LibraryContext.isolateId, _loadPriorityHandle);

    try {
      return sdkMapviewMaplayerbuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerbuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapLayer build() {
    final _buildFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapLayerBuilder_build'));
    final _handle = this.handle;
    final __callResultHandle = _buildFfi(_handle, __lib.LibraryContext.isolateId);
    if (_buildsdkMapviewMaplayerbuilderBuildReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _buildsdkMapviewMaplayerbuilderBuildReturnGetError(__callResultHandle);
        _buildsdkMapviewMaplayerbuilderBuildReturnReleaseHandle(__callResultHandle);
        try {
          throw MapLayerBuilderInstantiationException(sdkMapviewMaplayerbuilderInstantiationerrordetailsFromFfi(__errorHandle));
        } finally {
          sdkMapviewMaplayerbuilderInstantiationerrordetailsReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _buildsdkMapviewMaplayerbuilderBuildReturnGetResult(__callResultHandle);
    _buildsdkMapviewMaplayerbuilderBuildReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMapviewMaplayerFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkMapviewMaplayerbuilderToFfi(MapLayerBuilder value) =>
  _sdkMapviewMaplayerbuilderCopyHandle((value as __lib.NativeBase).handle);

MapLayerBuilder sdkMapviewMaplayerbuilderFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapLayerBuilder) return instance;

  final _copiedHandle = _sdkMapviewMaplayerbuilderCopyHandle(handle);
  final result = MapLayerBuilder$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMaplayerbuilderRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMaplayerbuilderReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMaplayerbuilderReleaseHandle(handle);

Pointer<Void> sdkMapviewMaplayerbuilderToFfiNullable(MapLayerBuilder? value) =>
  value != null ? sdkMapviewMaplayerbuilderToFfi(value) : Pointer<Void>.fromAddress(0);

MapLayerBuilder? sdkMapviewMaplayerbuilderFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMaplayerbuilderFromFfi(handle) : null;

void sdkMapviewMaplayerbuilderReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMaplayerbuilderReleaseHandle(handle);

// End of MapLayerBuilder "private" section.


