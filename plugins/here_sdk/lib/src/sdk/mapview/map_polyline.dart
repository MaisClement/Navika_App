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
import 'dart:ui' as ui;
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/animation/animation_listener.dart';
import 'package:here_sdk/src/sdk/animation/map_polyline_animation.dart';
import 'package:here_sdk/src/sdk/core/color.dart';
import 'package:here_sdk/src/sdk/core/geo_polyline.dart';
import 'package:here_sdk/src/sdk/core/metadata.dart';
import 'package:here_sdk/src/sdk/mapview/dash_pattern.dart';
import 'package:here_sdk/src/sdk/mapview/draw_order_type.dart';
import 'package:here_sdk/src/sdk/mapview/line_cap.dart';
import 'package:here_sdk/src/sdk/mapview/map_content_category.dart';
import 'package:here_sdk/src/sdk/mapview/map_image.dart';
import 'package:here_sdk/src/sdk/mapview/map_item_representation.dart';
import 'package:here_sdk/src/sdk/mapview/map_measure.dart';
import 'package:here_sdk/src/sdk/mapview/map_measure_dependent_render_size.dart';
import 'package:here_sdk/src/sdk/mapview/map_measure_range.dart';
import 'package:meta/meta.dart';

/// A visual representation of a line on the map.
///
/// The geometry to be visualized is represented
/// by an instance of [GeoPolyline].
abstract class MapPolyline {
  /// Creates a new MapPolyline instance.
  ///
  /// [geometry] The list of vertices representing the polyline.
  ///
  /// [widthInPixels] The width of the polyline (in pixels). The chosen value should be greater than or equal
  /// to 0. Negative values are clamped to 0.
  ///
  /// [color] The color of the polyline.
  ///
  @Deprecated("Will be removed in v4.18.0. Please use constructor with [MapPolylineRepresentation] instead.")

  factory MapPolyline(GeoPolyline geometry, double widthInPixels, ui.Color color) => $prototype.$init(geometry, widthInPixels, color);
  /// Creates a new [MapPolyline] instance with an outline.
  ///
  /// The width of the outline comes on top of the polyline width, meaning that a line of width 10
  /// and outline width of 2 will have a total width of 14 pixels.
  ///
  /// [geometry] The list of vertices representing the polyline.
  ///
  /// [widthInPixels] The width of the polyline (in pixels). The chosen value should be greater than or equal
  /// to 0. Negative values are clamped to 0.
  ///
  /// [color] The color of the polyline.
  ///
  /// [outlineWidthInPixels] The width of the outline (in pixels) on one side of the polyline. The total width of the
  /// polyline will thus be widthInPixels + 2 * outlineWidthInPixels. The chosen value should
  /// be greater than or equal to 0. Negative values are clamped to 0.
  ///
  /// [outlineColor] The outline color of the polyline.
  ///
  @Deprecated("Will be removed in v4.18.0. Please use constructor with [MapPolylineRepresentation] instead.")

  factory MapPolyline.withOutlineWidthInPixelsAndOutlineColor(GeoPolyline geometry, double widthInPixels, ui.Color color, double outlineWidthInPixels, ui.Color outlineColor) => $prototype.withOutlineWidthInPixelsAndOutlineColor(geometry, widthInPixels, color, outlineWidthInPixels, outlineColor);
  /// Creates a new [MapPolyline] instance with particular visual representation.
  ///
  /// Note: After creating [MapPolyline] with this representation, the deprecated [MapPolyline] properties,
  /// do not work and any change to them will be ignored. Any modifications to polyline appearance must be done with [MapPolyline.setRepresentation].
  ///
  /// [geometry] The list of vertices representing the polyline.
  ///
  /// [representation] The styling properties of the polyline.
  ///
  factory MapPolyline.withRepresentation(GeoPolyline geometry, MapPolylineRepresentation representation) => $prototype.withRepresentation(geometry, representation);

  /// Function to change appearance of [MapPolyline] instance.
  ///
  /// Note: After setting new representation on existing instance of [MapPolyline],
  /// none of [MapPolyline] properties, except `geometry`, `metadata`, `visibilityRanges` and `mapContentCategoriesToBlock`, works
  /// and any change to them will be ignored.
  /// Further modifications to polyline appearance must be done with subsequent calls to `setRepresentation`.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  ///
  /// [representation] The representation
  ///
  void setRepresentation(MapPolylineRepresentation representation);
  /// Starts an animation of this map polyline.
  ///
  /// Any ongoing animation of this map polyline will get cancelled.
  ///
  /// [animation] The animation to start. This object may be shared between multiple instances of map polyline.
  /// Starting animation on one polyline does not influence any ongoing animations on other polylines.
  ///
  /// [listener] The listener to receive notifications
  /// about animation start, completion or cancellation.
  ///
  void startAnimation(MapPolylineAnimation animation, AnimationListener listener);
  /// Cancels single ongoing animation of this map polyline.
  ///
  /// Does nothing if the specified animation is not currently in progress for this polyline.
  /// Does not affect other polylines that might be running this animation.
  ///
  /// [animation] The animation to cancel
  ///
  void cancelAnimation(MapPolylineAnimation animation);
  /// Gets the geometry of the polyline.
  GeoPolyline get geometry;
  /// Sets the geometry of the polyline.
  set geometry(GeoPolyline value);

  /// Gets the Metadata instance attached to this polyline.
  /// This will be  if nothing has been
  /// attached before.
  Metadata? get metadata;
  /// Sets the Metadata instance attached to this polyline.
  set metadata(Metadata? value);

  /// Returns the cap shape of the polyline and its outline.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  LineCap get lineCap;
  /// Sets the cap shape of the polyline and its outline. The default shape is
  /// {LineCap.ROUND}.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  set lineCap(LineCap value);

  /// Gets the color of the polyline.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  ui.Color get lineColor;
  /// Sets the color of the polyline.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  set lineColor(ui.Color value);

  /// Gets the width of the polyline in pixels.
  /// If line width was configured as [MapMeasure] dependent,
  /// then `lineWidth` equals to the value of the [MapPolyline.measureDependentLineWidth] entry
  /// with smallest [MapMeasure].
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  double get lineWidth;
  /// Sets the width of the polyline in pixels. The value should be positive. Values
  /// less than or equal to 0 are ignored and the existing width is maintained.
  /// Overrides the [MapPolyline.measureDependentLineWidth] property.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  set lineWidth(double value);

  /// Gets the [MapMeasure] dependent polyline width in  pixels.
  /// If line width was configured without [MapMeasure] dependency, then `measureDependentLineWidth`
  /// contains single entry with measure 0 of type [MapMeasureKind.zoomLevel] and width value
  /// equal to [MapPolyline.lineWidth].
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behavior. Related APIs may change for new releases without a deprecation process.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  Map<MapMeasure, double> get measureDependentLineWidth;
  /// Sets the [MapMeasure] dependent polyline width in pixels.
  /// Only [MapMeasure](s) of [MapMeasureKind.zoomLevel] type are supported.
  /// [MapMeasure](s) of other unsupported types will be ignored.
  /// `measureDependentLineWidth` with a single entry is equivalent to use of the [MapPolyline.lineWidth] equal
  /// to the width value of this single entry and [MapMeasure] of this single entry is ignored.
  /// Empty `measureDependentLineWidth` is equivalent to use of the [MapPolyline.lineWidth] with value less than or
  /// equal to 0 - it is ignored and existing width is maintained.
  /// The width values should be positive. Dictionary entries with width values less than or equal to 0 are ignored.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behavior. Related APIs may change for new releases without a deprecation process.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  set measureDependentLineWidth(Map<MapMeasure, double> value);

  /// Gets the outline color of the polyline.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  ui.Color get outlineColor;
  /// Sets the outline color of the polyline. The default outline color is opaque white.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  set outlineColor(ui.Color value);

  /// Gets the outline width of the polyline in pixels.
  /// If outline width was configured as [MapMeasure]
  /// dependent, then [MapPolyline.outlineWidth] equals to the value of the [MapPolyline.measureDependentOutlineWidth] entry
  /// with smallest [MapMeasure].
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  double get outlineWidth;
  /// Sets the outline width of the polyline in pixels. The value should be greater than or
  /// equal to 0. Negative values are ignored and the existing outline width is maintained.
  /// The default outline width is 0.
  /// Overrides the [MapPolyline.measureDependentOutlineWidth] property.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  set outlineWidth(double value);

  /// Gets the [MapMeasure] dependent polyline outline width in pixels.
  /// If outline width was configured without [MapMeasure] dependency, then
  /// `measureDependentOutlineWidth` contains single entry with measure 0 of type
  /// [MapMeasureKind.zoomLevel] and width value equal to [MapPolyline.outlineWidth].
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behavior. Related APIs may change for new releases without a deprecation process.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  Map<MapMeasure, double> get measureDependentOutlineWidth;
  /// Sets the [MapMeasure] dependent polyline outline width in pixels.
  /// Only [MapMeasure](s) of [MapMeasureKind.zoomLevel] type are supported.
  /// [MapMeasure](s) of other unsupported types will be ignored.
  /// `measureDependentOutlineWidth` with a single entry is equivalent to use of the [MapPolyline.outlineWidth] equal
  /// to the width value of this single entry and [MapMeasure] of this single entry is ignored.
  /// Empty `measureDependentOutlineWidth` is equivalent to use of the [MapPolyline.outlineWidth] with negative value - it
  /// is ignored and existing outline width is maintained.
  /// The outline width values should be greater than or equal to 0. Dictionary entries with negative width values
  /// are ignored.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behavior. Related APIs may change for new releases without a deprecation process.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  set measureDependentOutlineWidth(Map<MapMeasure, double> value);

  /// Gets the dash pattern of the polyline. Returns `null` if no pattern is used.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  DashPattern? get dashPattern;
  /// Sets the dash pattern of the polyline or `null` if no pattern is to be used. The pattern
  /// has two parts; the dash and the gap between successive dashes. The dashes use the line
  /// color, whereas the gaps separating them use the dash fill color. The pattern does not
  /// appear on the progress part of the polyline. By default, no dash pattern is used.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  set dashPattern(DashPattern? value);

  /// Gets the fill color for the gaps of the polyline's dash pattern. Returns `null` if no
  /// color is used.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  ui.Color? get dashFillColor;
  /// Sets the fill color for the gaps of the polyline's dash pattern or 'null' if no color is
  /// to be used. By default, no dash fill color is used.
  @Deprecated("Will be removed in v4.18.0. Please use [MapPolyline.setRepresentation] instead to control the appearance of the polyline.")
  set dashFillColor(ui.Color? value);

  /// Gets the draw order of the polyline. Polylines with a higher draw order are drawn on top of
  /// polylines with a lower draw order. In case multiple polylines have the same draw order, they
  /// can be rendered in different ways depending on the [MapPolyline.drawOrderType] set.
  /// Chosen values are clamped to the range \[0; 1023\].
  /// The default draw order is 0.
  int get drawOrder;
  /// Sets the draw order of the polyline. Polylines with a higher draw order are drawn on top of
  /// polylines with a lower draw order. In case multiple polylines have the same draw order, they
  /// can be rendered in different ways depending on the [MapPolyline.drawOrderType] set.
  /// Chosen values are clamped to the range \[0; 1023\].
  /// The default draw order is 0.
  set drawOrder(int value);

  /// Gets the draw order type of the polyline.
  /// The default value is [DrawOrderType.mapSceneAdditionOrderDependent].
  /// For [DrawOrderType.mapSceneAdditionOrderDependent] map polylines with outlines
  /// with the same draw order are drawn as a whole in the order of addition
  /// to a map scene. There is no posibility that parts of another polyline, regardless of
  /// its draw order value, are drawn between outline and mainline of another polyline.
  /// With [DrawOrderType.mapSceneAdditionOrderDependent] polylines are rendered one by one.
  /// For [DrawOrderType.mapSceneAdditionOrderIndependent] for multiple polylines with outlines with the same draw order all
  /// outlines are rendered first in an arbitrary order and then all mainlines are drawn on top of those
  /// polylines in an arbitrary order.
  /// [DrawOrderType.mapSceneAdditionOrderIndependent] allows speeding up the rendering process and keeping high frame rates
  /// when many similar polylines (with same styling attributes and [MapPolylineRepresentation]) are present in a map scene.
  DrawOrderType get drawOrderType;
  /// Sets the draw order type of the polyline.
  /// The default value is [DrawOrderType.mapSceneAdditionOrderDependent].
  /// For [DrawOrderType.mapSceneAdditionOrderDependent] map polylines with outlines
  /// with the same draw order are drawn as a whole in the order of addition
  /// to a map scene. There is no posibility that parts of another polyline, regardless of
  /// its draw order value, are drawn between outline and mainline of another polyline.
  /// With [DrawOrderType.mapSceneAdditionOrderDependent] polylines are rendered one by one.
  /// For [DrawOrderType.mapSceneAdditionOrderIndependent] for multiple polylines with outlines with the same draw order all
  /// outlines are rendered first in an arbitrary order and then all mainlines are drawn on top of those
  /// polylines in an arbitrary order.
  /// [DrawOrderType.mapSceneAdditionOrderIndependent] allows speeding up the rendering process and keeping high frame rates
  /// when many similar polylines (with same styling attributes and [MapPolylineRepresentation]) are present in a map scene.
  set drawOrderType(DrawOrderType value);

  /// Gets the list of visibility ranges. The map polyline is visible only inside these map measure
  /// ranges. When empty (the default), the map polyline is visible without map measure restrictions.
  List<MapMeasureRange> get visibilityRanges;
  /// Sets visibility ranges for this map polyline. A range is half open -
  /// \[minimumZoomLevel, maximumZoomLevel), the given maximum value is not contained in the range.
  /// The map polyline is visible only inside these map measure ranges.
  ///
  /// When empty (the default), the map polyline is visible without map measure restrictions.
  /// Only `MapMeasureRange`(s) of [MapMeasureKind.zoomLevel] type are supported.
  /// `MapMeasureRange`(s) of other unsupported types will be ignored.
  set visibilityRanges(List<MapMeasureRange> value);

  /// Gets the progress of the polyline.
  double get progress;
  /// Sets the progress of the polyline from its starting point as a ratio of its total length
  /// clamped in the range \[0; 1\]. As the progress varies, the equivalent part of the
  /// polyline gets covered by the progress color and progress outline color. The rest of the
  /// polyline until its end point retains the line color and outline color along with an
  /// optional dash pattern. The default progress is 0.
  set progress(double value);

  /// Gets the progress color of the polyline.
  ui.Color get progressColor;
  /// Sets the progress color of the polyline. The default progress color is opaque white.
  /// Note that this does not affect [DashPattern] styles.
  set progressColor(ui.Color value);

  /// Gets the progress outline color of the polyline.
  ui.Color get progressOutlineColor;
  /// Sets the progress outline color of the polyline. The default progress outline color is
  /// opaque white.
  set progressOutlineColor(ui.Color value);

  List<MapContentCategory> get mapContentCategoriesToBlock;
  set mapContentCategoriesToBlock(List<MapContentCategory> value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapPolyline$Impl(Pointer<Void>.fromAddress(0));
}

/// Base class to represent visual appearance of [MapPolyline]
abstract class MapPolylineRepresentation implements MapItemRepresentation {

}

/// Describes a reason for failing to create a [MapPolylineRepresentation].
enum MapPolylineRepresentationInstantiationErrorCode {
    /// Instantiation parameters contain unsupported values.
    illegalArguments
}

// MapPolylineRepresentationInstantiationErrorCode "private" section, not exported.

int sdkMapviewMappolylineRepresentationInstantiationerrorcodeToFfi(MapPolylineRepresentationInstantiationErrorCode value) {
  switch (value) {
  case MapPolylineRepresentationInstantiationErrorCode.illegalArguments:
    return 1;
  default:
    throw StateError("Invalid enum value $value for MapPolylineRepresentationInstantiationErrorCode enum.");
  }
}

MapPolylineRepresentationInstantiationErrorCode sdkMapviewMappolylineRepresentationInstantiationerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return MapPolylineRepresentationInstantiationErrorCode.illegalArguments;
  default:
    throw StateError("Invalid numeric value $handle for MapPolylineRepresentationInstantiationErrorCode enum.");
  }
}

void sdkMapviewMappolylineRepresentationInstantiationerrorcodeReleaseFfiHandle(int handle) {}

final _sdkMapviewMappolylineRepresentationInstantiationerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapPolyline_Representation_InstantiationErrorCode_create_handle_nullable'));
final _sdkMapviewMappolylineRepresentationInstantiationerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_Representation_InstantiationErrorCode_release_handle_nullable'));
final _sdkMapviewMappolylineRepresentationInstantiationerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_Representation_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdkMapviewMappolylineRepresentationInstantiationerrorcodeToFfiNullable(MapPolylineRepresentationInstantiationErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMappolylineRepresentationInstantiationerrorcodeToFfi(value);
  final result = _sdkMapviewMappolylineRepresentationInstantiationerrorcodeCreateHandleNullable(_handle);
  sdkMapviewMappolylineRepresentationInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

MapPolylineRepresentationInstantiationErrorCode? sdkMapviewMappolylineRepresentationInstantiationerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMappolylineRepresentationInstantiationerrorcodeGetValueNullable(handle);
  final result = sdkMapviewMappolylineRepresentationInstantiationerrorcodeFromFfi(_handle);
  sdkMapviewMappolylineRepresentationInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMappolylineRepresentationInstantiationerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMappolylineRepresentationInstantiationerrorcodeReleaseHandleNullable(handle);

// End of MapPolylineRepresentationInstantiationErrorCode "private" section.
/// Thrown when a problem occurs while trying to create [MapPolylineRepresentation].
class MapPolylineRepresentationInstantiationException implements Exception {
  final MapPolylineRepresentationInstantiationErrorCode error;
  MapPolylineRepresentationInstantiationException(this.error);
}

// MapPolylineRepresentation "private" section, not exported.

final _sdkMapviewMappolylineRepresentationRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapPolyline_Representation_register_finalizer'));
final _sdkMapviewMappolylineRepresentationCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_Representation_copy_handle'));
final _sdkMapviewMappolylineRepresentationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_Representation_release_handle'));
final _sdkMapviewMappolylineRepresentationGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_Representation_get_type_id'));


class MapPolylineRepresentation$Impl extends MapItemRepresentation$Impl implements MapPolylineRepresentation {

  MapPolylineRepresentation$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkMapviewMappolylineRepresentationToFfi(MapPolylineRepresentation value) =>
  _sdkMapviewMappolylineRepresentationCopyHandle((value as __lib.NativeBase).handle);

MapPolylineRepresentation sdkMapviewMappolylineRepresentationFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapPolylineRepresentation) return instance;

  final _typeIdHandle = _sdkMapviewMappolylineRepresentationGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMappolylineRepresentationCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapPolylineRepresentation$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMappolylineRepresentationRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMappolylineRepresentationReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMappolylineRepresentationReleaseHandle(handle);

Pointer<Void> sdkMapviewMappolylineRepresentationToFfiNullable(MapPolylineRepresentation? value) =>
  value != null ? sdkMapviewMappolylineRepresentationToFfi(value) : Pointer<Void>.fromAddress(0);

MapPolylineRepresentation? sdkMapviewMappolylineRepresentationFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMappolylineRepresentationFromFfi(handle) : null;

void sdkMapviewMappolylineRepresentationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMappolylineRepresentationReleaseHandle(handle);

// End of MapPolylineRepresentation "private" section.
/// Represents a dash pattern for map polyline consisting of images rendered with certain gaps from each other.
///
/// This dash pattern representation consists only of images rendered at certain points along polyline.
/// For rendering them without any distortions, polyline gets sliced into series of straight segments that are multiple
/// of sum of dash and gap lengths. For this reason, the new polyline geometry might not align fully with original geometry.
///
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.
abstract class MapPolylineDashImageRepresentation implements MapPolylineRepresentation {
  /// Creates a uniform dash pattern in which the length of a gap is the same as the length of a dash.
  ///
  /// Dashes are rendered as image.
  /// This allows for patterns like ' — — — —' or '  ——  ——  ——'.
  ///
  /// [dashLength] The map measure dependent length of a dash.
  /// The value of the key is truncated to integer values, hence one value
  /// can be provided representing the same integer map measure.
  /// Only map measure values in range \[0-[MapCameraLimits.maxZoomLevel]\] are supported.
  /// Length values itself must be positive.
  /// For intermediate values between provided map measures, linear interpolation will be used.
  /// Provided length mapping will be applied to dash gaps as well.
  /// For `measureKind` property only [MapMeasureKind.zoomLevel] is supported.
  /// For `sizeUnit``property` only [RenderSizeUnit.meters] is supported.
  ///
  /// [dashWidth] The map measure dependent width of a dash.
  /// The value of the key is truncated to integer values, hence one value
  /// can be provided representing the same integer map measure.
  /// Only map measure values in range \[0-[MapCameraLimits.maxZoomLevel]\] are supported.
  /// Width values itself must be positive.
  /// For intermediate values between provided map measures, linear interpolation will be used.
  /// For `measureKind` property only [MapMeasureKind.zoomLevel] is supported.
  /// For `sizeUnit``property` only [RenderSizeUnit.meters] is supported.
  ///
  /// [image] Image to be rendered in place of dash space. It is stretched to fill whole
  /// polyline width and length of each dash.
  ///
  /// Throws [MapPolylineRepresentationInstantiationException]. In case of invalid input parameters.
  ///
  factory MapPolylineDashImageRepresentation.uniform(MapMeasureDependentRenderSize dashLength, MapMeasureDependentRenderSize dashWidth, MapImage image) => $prototype.uniform(dashLength, dashWidth, image);
  /// Creates a simple dash pattern in which the lengths of a dash and gap can be different.
  ///
  /// Dashes are rendered as image.
  /// This allows for patterns like '  —  —  —  —' or ' ——— ——— ———'.
  ///
  /// [dashLength] The map measure dependent length of a dash.
  /// The value of the key is truncated to integer values, hence one value
  /// can be provided representing the same integer map measure.
  /// Only map measure values in range \[0-[MapCameraLimits.maxZoomLevel]\] are supported.
  /// Length values itself must be positive.
  /// For intermediate values between provided map measures, linear interpolation will be used.
  /// For `measureKind` property only [MapMeasureKind.zoomLevel] is supported.
  /// For `sizeUnit``property` only [RenderSizeUnit.meters] is supported.
  ///
  /// [gapLength] The map measure dependent length of a gap.
  /// The value of the key is truncated to integer values, hence one value
  /// can be provided representing the same integer map measure.
  /// Only map measure values in range \[0-[MapCameraLimits.maxZoomLevel]\] are supported.
  /// Length values itself must not be negative.
  /// For intermediate values between provided map measures, linear interpolation will be used.
  /// For `measureKind` property only [MapMeasureKind.zoomLevel] is supported.
  /// For `sizeUnit``property` only [RenderSizeUnit.meters] is supported.
  ///
  /// [dashWidth] The map measure dependent width of a dash.
  /// The value of the key is truncated to integer values, hence one value
  /// can be provided representing the same integer map measure.
  /// Only map measure values in range \[0-[MapCameraLimits.maxZoomLevel]\] are supported.
  /// Width values itself must be positive.
  /// For intermediate values between provided map measures, linear interpolation will be used.
  /// For `measureKind` property only [MapMeasureKind.zoomLevel] is supported.
  /// For `sizeUnit``property` only [RenderSizeUnit.meters] is supported.
  ///
  /// [image] Image to be rendered in place of dash space. It is stretched to fill whole
  /// polyline width and length of each dash.
  ///
  /// Throws [MapPolylineRepresentationInstantiationException]. In case of invalid input parameters.
  ///
  factory MapPolylineDashImageRepresentation(MapMeasureDependentRenderSize dashLength, MapMeasureDependentRenderSize gapLength, MapMeasureDependentRenderSize dashWidth, MapImage image) => $prototype.$init(dashLength, gapLength, dashWidth, image);

  /// Gets the image that is rendered in place of dash space.
  /// It is stretched to fill whole polyline width and length of each dash.
  MapImage get dashImage;

  /// Gets the map measure dependent length of a dash.
  MapMeasureDependentRenderSize get dashLength;

  /// Gets the map measure dependent length of a gap.
  MapMeasureDependentRenderSize get gapLength;

  /// Gets the map measure dependent width of a dash.
  MapMeasureDependentRenderSize get dashWidth;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapPolylineDashImageRepresentation$Impl(Pointer<Void>.fromAddress(0));
}


// MapPolylineDashImageRepresentation "private" section, not exported.

final _sdkMapviewMappolylineDashimagerepresentationRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_register_finalizer'));
final _sdkMapviewMappolylineDashimagerepresentationCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_copy_handle'));
final _sdkMapviewMappolylineDashimagerepresentationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_release_handle'));
final _sdkMapviewMappolylineDashimagerepresentationGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_get_type_id'));


final _uniformsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapImage_return_release_handle'));
final _uniformsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapImage_return_get_result'));
final _uniformsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapImage_return_get_error'));
final _uniformsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapImage_return_has_error'));


final _$initsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapImage_return_release_handle'));
final _$initsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapImage_return_get_result'));
final _$initsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapImage_return_get_error'));
final _$initsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapImage_return_has_error'));


/// @nodoc
@visibleForTesting
class MapPolylineDashImageRepresentation$Impl extends MapPolylineRepresentation$Impl implements MapPolylineDashImageRepresentation {

  MapPolylineDashImageRepresentation$Impl(Pointer<Void> handle) : super(handle);


  MapPolylineDashImageRepresentation uniform(MapMeasureDependentRenderSize dashLength, MapMeasureDependentRenderSize dashWidth, MapImage image) {
    final _result_handle = _uniform(dashLength, dashWidth, image);
    final _result = MapPolylineDashImageRepresentation$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMappolylineDashimagerepresentationRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapPolylineDashImageRepresentation $init(MapMeasureDependentRenderSize dashLength, MapMeasureDependentRenderSize gapLength, MapMeasureDependentRenderSize dashWidth, MapImage image) {
    final _result_handle = _$init(dashLength, gapLength, dashWidth, image);
    final _result = MapPolylineDashImageRepresentation$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMappolylineDashimagerepresentationRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _uniform(MapMeasureDependentRenderSize dashLength, MapMeasureDependentRenderSize dashWidth, MapImage image) {
    final _uniformFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapImage'));
    final _dashLengthHandle = sdkMapviewMapmeasuredependentrendersizeToFfi(dashLength);
    final _dashWidthHandle = sdkMapviewMapmeasuredependentrendersizeToFfi(dashWidth);
    final _imageHandle = sdkMapviewMapimageToFfi(image);
    final __callResultHandle = _uniformFfi(__lib.LibraryContext.isolateId, _dashLengthHandle, _dashWidthHandle, _imageHandle);
    sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_dashLengthHandle);
    sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_dashWidthHandle);
    sdkMapviewMapimageReleaseFfiHandle(_imageHandle);
    if (_uniformsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _uniformsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnGetError(__callResultHandle);
        _uniformsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnReleaseHandle(__callResultHandle);
        try {
          throw MapPolylineRepresentationInstantiationException(sdkMapviewMappolylineRepresentationInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMappolylineRepresentationInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _uniformsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnGetResult(__callResultHandle);
    _uniformsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _$init(MapMeasureDependentRenderSize dashLength, MapMeasureDependentRenderSize gapLength, MapMeasureDependentRenderSize dashWidth, MapImage image) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapImage'));
    final _dashLengthHandle = sdkMapviewMapmeasuredependentrendersizeToFfi(dashLength);
    final _gapLengthHandle = sdkMapviewMapmeasuredependentrendersizeToFfi(gapLength);
    final _dashWidthHandle = sdkMapviewMapmeasuredependentrendersizeToFfi(dashWidth);
    final _imageHandle = sdkMapviewMapimageToFfi(image);
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId, _dashLengthHandle, _gapLengthHandle, _dashWidthHandle, _imageHandle);
    sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_dashLengthHandle);
    sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_gapLengthHandle);
    sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_dashWidthHandle);
    sdkMapviewMapimageReleaseFfiHandle(_imageHandle);
    if (_$initsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnGetError(__callResultHandle);
        _$initsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnReleaseHandle(__callResultHandle);
        try {
          throw MapPolylineRepresentationInstantiationException(sdkMapviewMappolylineRepresentationInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMappolylineRepresentationInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnGetResult(__callResultHandle);
    _$initsdkMapviewMappolylineDashimagerepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapimageReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  MapImage get dashImage {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_dashImage_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapimageFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapimageReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  MapMeasureDependentRenderSize get dashLength {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_dashLength_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapmeasuredependentrendersizeFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  MapMeasureDependentRenderSize get gapLength {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_gapLength_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapmeasuredependentrendersizeFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  MapMeasureDependentRenderSize get dashWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_DashImageRepresentation_dashWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapmeasuredependentrendersizeFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkMapviewMappolylineDashimagerepresentationToFfi(MapPolylineDashImageRepresentation value) =>
  _sdkMapviewMappolylineDashimagerepresentationCopyHandle((value as __lib.NativeBase).handle);

MapPolylineDashImageRepresentation sdkMapviewMappolylineDashimagerepresentationFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapPolylineDashImageRepresentation) return instance;

  final _typeIdHandle = _sdkMapviewMappolylineDashimagerepresentationGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMappolylineDashimagerepresentationCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapPolylineDashImageRepresentation$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMappolylineDashimagerepresentationRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMappolylineDashimagerepresentationReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMappolylineDashimagerepresentationReleaseHandle(handle);

Pointer<Void> sdkMapviewMappolylineDashimagerepresentationToFfiNullable(MapPolylineDashImageRepresentation? value) =>
  value != null ? sdkMapviewMappolylineDashimagerepresentationToFfi(value) : Pointer<Void>.fromAddress(0);

MapPolylineDashImageRepresentation? sdkMapviewMappolylineDashimagerepresentationFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMappolylineDashimagerepresentationFromFfi(handle) : null;

void sdkMapviewMappolylineDashimagerepresentationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMappolylineDashimagerepresentationReleaseHandle(handle);

// End of MapPolylineDashImageRepresentation "private" section.
/// Solid line without outline representation.
abstract class MapPolylineSolidRepresentation implements MapPolylineRepresentation {
  /// Creates a representation for a solid line without outline.
  ///
  /// [lineWidth] The width of the polyline depending on the map measure.
  /// At map measures smaller than smallest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the smallest
  /// map measure in the `lineWidth`.
  /// At map measures bigger than biggest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the biggest
  /// map measure in the `lineWidth`.
  /// At map measures between two nearest given map measures line width is
  /// linearly interpolated between width values given for these map measures.
  /// For [MapMeasureKind] only [MapMeasureKind.zoomLevel] is supported.
  /// For [RenderSizeUnit] only [RenderSizeUnit.pixels] is supported.
  /// `lineWidth` must not be 0 (`lineWidth.sizes` with all values set to 0.0).
  ///
  /// [color] The color of the polyline.
  ///
  /// [capShape] The cap shape applied to both ends of the polyline.
  ///
  /// Throws [MapPolylineRepresentationInstantiationException]. In case of invalid input parameters.
  ///
  factory MapPolylineSolidRepresentation(MapMeasureDependentRenderSize lineWidth, ui.Color color, LineCap capShape) => $prototype.$init(lineWidth, color, capShape);
  /// Creates a representation for a solid line with outline.
  ///
  /// [lineWidth] The width of the polyline depending on the map measure.
  /// At map measures smaller than smallest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the smallest
  /// map measure in the `lineWidth`.
  /// At map measures bigger than biggest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the biggest
  /// map measure in the `lineWidth`.
  /// At map measures between two nearest given map measures line width is
  /// linearly interpolated between width values given for these map measures.
  /// For [MapMeasureKind] only [MapMeasureKind.zoomLevel] is supported.
  /// For [RenderSizeUnit] only [RenderSizeUnit.pixels] is supported.
  /// `lineWidth` must not be 0 (`lineWidth.sizes` with all values set to 0.0).
  ///
  /// [color] The color of the polyline.
  ///
  /// [outlineWidth] The width of the outline on one side of the polyline depending on
  /// the map measure.
  /// The total width of the polyline line is line width + 2 * outline width.
  /// At map measures smaller than smallest map measure in the `outlineWidth`
  /// outline width is constant and equal to the width given for the
  /// smallest map measure in the `outlineWidth`.
  /// At map measures bigger than biggest map measure in the `outlineWidth`
  /// outline width is constant and equal to the width given for the
  /// biggest map measure in the `outlineWidth`.
  /// At map measures between two nearest given map measures outline width
  /// is linearly interpolated between width values given for these map measures.
  /// For [MapMeasureKind] only [MapMeasure.Kind.ZOOM_LEVEL] is supported.
  /// For [RenderSizeUnit] only [RenderSizeUnit.pixels] is supported.
  ///
  /// [outlineColor] The outline color of the polyline.
  ///
  /// [capShape] The cap shape applied to both ends of the polyline.
  ///
  /// Throws [MapPolylineRepresentationInstantiationException]. In case of invalid input parameters.
  ///
  factory MapPolylineSolidRepresentation.withOutline(MapMeasureDependentRenderSize lineWidth, ui.Color color, MapMeasureDependentRenderSize outlineWidth, ui.Color outlineColor, LineCap capShape) => $prototype.withOutline(lineWidth, color, outlineWidth, outlineColor, capShape);

  /// Gets the map measure dependent polyline width.
  MapMeasureDependentRenderSize get lineWidth;

  /// Gets the color of the polyline.
  ui.Color get lineColor;

  /// Gets the map measure dependent polyline outline width.
  MapMeasureDependentRenderSize get outlineWidth;

  /// Gets the color of outline of the polyline.
  ui.Color get outlineColor;

  /// Returns the cap shape of the polyline and its outline.
  LineCap get capShape;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapPolylineSolidRepresentation$Impl(Pointer<Void>.fromAddress(0));
}


// MapPolylineSolidRepresentation "private" section, not exported.

final _sdkMapviewMappolylineSolidrepresentationRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_register_finalizer'));
final _sdkMapviewMappolylineSolidrepresentationCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_copy_handle'));
final _sdkMapviewMappolylineSolidrepresentationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_release_handle'));
final _sdkMapviewMappolylineSolidrepresentationGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_get_type_id'));


final _$initsdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorLinecapReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_make__MapMeasureDependentRenderSize_Color_LineCap_return_release_handle'));
final _$initsdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorLinecapReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_make__MapMeasureDependentRenderSize_Color_LineCap_return_get_result'));
final _$initsdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorLinecapReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_make__MapMeasureDependentRenderSize_Color_LineCap_return_get_error'));
final _$initsdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorLinecapReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_make__MapMeasureDependentRenderSize_Color_LineCap_return_has_error'));


final _withOutlinesdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorMapmeasuredependentrendersizeColorLinecapReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_make__MapMeasureDependentRenderSize_Color_MapMeasureDependentRenderSize_Color_LineCap_return_release_handle'));
final _withOutlinesdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorMapmeasuredependentrendersizeColorLinecapReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_make__MapMeasureDependentRenderSize_Color_MapMeasureDependentRenderSize_Color_LineCap_return_get_result'));
final _withOutlinesdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorMapmeasuredependentrendersizeColorLinecapReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_make__MapMeasureDependentRenderSize_Color_MapMeasureDependentRenderSize_Color_LineCap_return_get_error'));
final _withOutlinesdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorMapmeasuredependentrendersizeColorLinecapReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_make__MapMeasureDependentRenderSize_Color_MapMeasureDependentRenderSize_Color_LineCap_return_has_error'));


/// @nodoc
@visibleForTesting
class MapPolylineSolidRepresentation$Impl extends MapPolylineRepresentation$Impl implements MapPolylineSolidRepresentation {

  MapPolylineSolidRepresentation$Impl(Pointer<Void> handle) : super(handle);


  MapPolylineSolidRepresentation $init(MapMeasureDependentRenderSize lineWidth, ui.Color color, LineCap capShape) {
    final _result_handle = _$init(lineWidth, color, capShape);
    final _result = MapPolylineSolidRepresentation$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMappolylineSolidrepresentationRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapPolylineSolidRepresentation withOutline(MapMeasureDependentRenderSize lineWidth, ui.Color color, MapMeasureDependentRenderSize outlineWidth, ui.Color outlineColor, LineCap capShape) {
    final _result_handle = _withOutline(lineWidth, color, outlineWidth, outlineColor, capShape);
    final _result = MapPolylineSolidRepresentation$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMappolylineSolidrepresentationRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(MapMeasureDependentRenderSize lineWidth, ui.Color color, LineCap capShape) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Uint32), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_make__MapMeasureDependentRenderSize_Color_LineCap'));
    final _lineWidthHandle = sdkMapviewMapmeasuredependentrendersizeToFfi(lineWidth);
    final _colorHandle = sdkCoreColorToFfi(color);
    final _capShapeHandle = sdkMapviewLinecapToFfi(capShape);
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId, _lineWidthHandle, _colorHandle, _capShapeHandle);
    sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_lineWidthHandle);
    sdkCoreColorReleaseFfiHandle(_colorHandle);
    sdkMapviewLinecapReleaseFfiHandle(_capShapeHandle);
    if (_$initsdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorLinecapReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorLinecapReturnGetError(__callResultHandle);
        _$initsdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorLinecapReturnReleaseHandle(__callResultHandle);
        try {
          throw MapPolylineRepresentationInstantiationException(sdkMapviewMappolylineRepresentationInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMappolylineRepresentationInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorLinecapReturnGetResult(__callResultHandle);
    _$initsdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorLinecapReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withOutline(MapMeasureDependentRenderSize lineWidth, ui.Color color, MapMeasureDependentRenderSize outlineWidth, ui.Color outlineColor, LineCap capShape) {
    final _withOutlineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint32), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_make__MapMeasureDependentRenderSize_Color_MapMeasureDependentRenderSize_Color_LineCap'));
    final _lineWidthHandle = sdkMapviewMapmeasuredependentrendersizeToFfi(lineWidth);
    final _colorHandle = sdkCoreColorToFfi(color);
    final _outlineWidthHandle = sdkMapviewMapmeasuredependentrendersizeToFfi(outlineWidth);
    final _outlineColorHandle = sdkCoreColorToFfi(outlineColor);
    final _capShapeHandle = sdkMapviewLinecapToFfi(capShape);
    final __callResultHandle = _withOutlineFfi(__lib.LibraryContext.isolateId, _lineWidthHandle, _colorHandle, _outlineWidthHandle, _outlineColorHandle, _capShapeHandle);
    sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_lineWidthHandle);
    sdkCoreColorReleaseFfiHandle(_colorHandle);
    sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_outlineWidthHandle);
    sdkCoreColorReleaseFfiHandle(_outlineColorHandle);
    sdkMapviewLinecapReleaseFfiHandle(_capShapeHandle);
    if (_withOutlinesdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorMapmeasuredependentrendersizeColorLinecapReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withOutlinesdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorMapmeasuredependentrendersizeColorLinecapReturnGetError(__callResultHandle);
        _withOutlinesdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorMapmeasuredependentrendersizeColorLinecapReturnReleaseHandle(__callResultHandle);
        try {
          throw MapPolylineRepresentationInstantiationException(sdkMapviewMappolylineRepresentationInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMappolylineRepresentationInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withOutlinesdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorMapmeasuredependentrendersizeColorLinecapReturnGetResult(__callResultHandle);
    _withOutlinesdkMapviewMappolylineSolidrepresentationMakeMapmeasuredependentrendersizeColorMapmeasuredependentrendersizeColorLinecapReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  MapMeasureDependentRenderSize get lineWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_lineWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapmeasuredependentrendersizeFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  ui.Color get lineColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_lineColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfi(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  MapMeasureDependentRenderSize get outlineWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_outlineWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapmeasuredependentrendersizeFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  ui.Color get outlineColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_outlineColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfi(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  LineCap get capShape {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_SolidRepresentation_capShape_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewLinecapFromFfi(__resultHandle);
    } finally {
      sdkMapviewLinecapReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkMapviewMappolylineSolidrepresentationToFfi(MapPolylineSolidRepresentation value) =>
  _sdkMapviewMappolylineSolidrepresentationCopyHandle((value as __lib.NativeBase).handle);

MapPolylineSolidRepresentation sdkMapviewMappolylineSolidrepresentationFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapPolylineSolidRepresentation) return instance;

  final _typeIdHandle = _sdkMapviewMappolylineSolidrepresentationGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMappolylineSolidrepresentationCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapPolylineSolidRepresentation$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMappolylineSolidrepresentationRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMappolylineSolidrepresentationReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMappolylineSolidrepresentationReleaseHandle(handle);

Pointer<Void> sdkMapviewMappolylineSolidrepresentationToFfiNullable(MapPolylineSolidRepresentation? value) =>
  value != null ? sdkMapviewMappolylineSolidrepresentationToFfi(value) : Pointer<Void>.fromAddress(0);

MapPolylineSolidRepresentation? sdkMapviewMappolylineSolidrepresentationFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMappolylineSolidrepresentationFromFfi(handle) : null;

void sdkMapviewMappolylineSolidrepresentationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMappolylineSolidrepresentationReleaseHandle(handle);

// End of MapPolylineSolidRepresentation "private" section.
/// Represents a dash pattern for map polyline where the dash can be rendered as a colored
/// line and the gap can be either empty or colored.
///
/// The length of the dash and gap are set
/// independently, allowing for patterns like '  —  —  —  —' (dash length = gap length)
/// or ' ——— ——— ———' (dash length != gap length).
abstract class MapPolylineDashRepresentation implements MapPolylineRepresentation {
  /// Creates a representation for a dashed line.
  ///
  /// Gaps are not dislayed.
  ///
  /// [lineWidth] The width of the polyline depending on the map measure.
  /// At map measures smaller than smallest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the smallest
  /// map measure in the `lineWidth`.
  /// At map measures bigger than biggest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the biggest
  /// map measure in the `lineWidth`.
  /// At map measures between two nearest given map measures line width is
  /// linearly interpolated between width values given for these map measures.
  /// For [MapMeasureKind] only [MapMeasureKind.zoomLevel] is supported.
  /// For [RenderSizeUnit] only [RenderSizeUnit.pixels] is supported.
  /// Width must not be 0 (`lineWidth.sizes` with all values set to 0.0).
  ///
  /// [dashLength] The dash length of the polyline depending on the map measure.
  /// At map measures smaller than smallest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the smallest
  /// map measure in the `lineWidth`.
  /// At map measures bigger than biggest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the biggest
  /// map measure in the `lineWidth`.
  /// At map measures between two nearest given map measures line width is
  /// linearly interpolated between width values given for these map measures.
  /// For [MapMeasureKind] only [MapMeasureKind.zoomLevel] is supported.
  /// For [RenderSizeUnit] only [RenderSizeUnit.pixels] is supported.
  /// Length must not be 0 (`dashLength.sizes` with all values set to 0.0).
  ///
  /// [gapLength] The gap length of the polyline depending on the map measure.
  /// At map measures smaller than smallest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the smallest
  /// map measure in the `lineWidth`.
  /// At map measures bigger than biggest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the biggest
  /// map measure in the `lineWidth`.
  /// At map measures between two nearest given map measures line width is
  /// linearly interpolated between width values given for these map measures.
  /// For [MapMeasureKind] only [MapMeasureKind.zoomLevel] is supported.
  /// For [RenderSizeUnit] only [RenderSizeUnit.pixels] is supported.
  /// Length must not be 0 (`gapLength.sizes` with all values set to 0.0).
  ///
  /// [dashColor] The dash color of the polyline.
  ///
  /// Throws [MapPolylineRepresentationInstantiationException]. In case of invalid input parameters.
  ///
  factory MapPolylineDashRepresentation(MapMeasureDependentRenderSize lineWidth, MapMeasureDependentRenderSize dashLength, MapMeasureDependentRenderSize gapLength, ui.Color dashColor) => $prototype.$init(lineWidth, dashLength, gapLength, dashColor);
  /// Creates a representation for a dashed line.
  ///
  /// [lineWidth] The width of the polyline depending on the map measure.
  /// At map measures smaller than smallest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the smallest
  /// map measure in the `lineWidth`.
  /// At map measures bigger than biggest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the biggest
  /// map measure in the `lineWidth`.
  /// At map measures between two nearest given map measures line width is
  /// linearly interpolated between width values given for these map measures.
  /// For [MapMeasureKind] only [MapMeasureKind.zoomLevel] is supported.
  /// For [RenderSizeUnit] only [RenderSizeUnit.pixels] is supported.
  /// Width must not be 0 (`lineWidth.sizes` with all values set to 0.0).
  ///
  /// [dashLength] The dash length of the polyline depending on the map measure.
  /// At map measures smaller than smallest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the smallest
  /// map measure in the `lineWidth`.
  /// At map measures bigger than biggest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the biggest
  /// map measure in the `lineWidth`.
  /// At map measures between two nearest given map measures line width is
  /// linearly interpolated between width values given for these map measures.
  /// For [MapMeasureKind] only [MapMeasureKind.zoomLevel] is supported.
  /// For [RenderSizeUnit] only [RenderSizeUnit.pixels] is supported.
  /// Length must not be 0 (`dashLength.sizes` with all values set to 0.0).
  ///
  /// [gapLength] The gap length of the polyline depending on the map measure.
  /// At map measures smaller than smallest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the smallest
  /// map measure in the `lineWidth`.
  /// At map measures bigger than biggest map measure in the `lineWidth`
  /// line width is constant and equal to the width given for the biggest
  /// map measure in the `lineWidth`.
  /// At map measures between two nearest given map measures line width is
  /// linearly interpolated between width values given for these map measures.
  /// For [MapMeasureKind] only [MapMeasureKind.zoomLevel] is supported.
  /// For [RenderSizeUnit] only [RenderSizeUnit.pixels] is supported.
  /// Length must not be 0 (`gapLength.sizes` with all values set to 0.0).
  ///
  /// [dashColor] The color of the dashes.
  ///
  /// [gapColor] The color of the gaps.
  ///
  /// Throws [MapPolylineRepresentationInstantiationException]. In case of invalid input parameters.
  ///
  factory MapPolylineDashRepresentation.withGapColor(MapMeasureDependentRenderSize lineWidth, MapMeasureDependentRenderSize dashLength, MapMeasureDependentRenderSize gapLength, ui.Color dashColor, ui.Color gapColor) => $prototype.withGapColor(lineWidth, dashLength, gapLength, dashColor, gapColor);

  /// Gets the map measure dependent polyline width.
  MapMeasureDependentRenderSize get lineWidth;

  /// Gets the map measure dependent polyline dash length.
  MapMeasureDependentRenderSize get dashLength;

  /// Gets the map measure dependent polyline gap length.
  MapMeasureDependentRenderSize get gapLength;

  /// Gets the color of the dashes of the polyline.
  ui.Color get dashColor;

  /// Gets the color for the gaps of the polyline. Returns `null` if no
  /// color is used.
  ui.Color? get gapColor;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapPolylineDashRepresentation$Impl(Pointer<Void>.fromAddress(0));
}


// MapPolylineDashRepresentation "private" section, not exported.

final _sdkMapviewMappolylineDashrepresentationRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_register_finalizer'));
final _sdkMapviewMappolylineDashrepresentationCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_copy_handle'));
final _sdkMapviewMappolylineDashrepresentationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_release_handle'));
final _sdkMapviewMappolylineDashrepresentationGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_get_type_id'));


final _$initsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_Color_return_release_handle'));
final _$initsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_Color_return_get_result'));
final _$initsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_Color_return_get_error'));
final _$initsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_Color_return_has_error'));


final _withGapColorsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorColorReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_Color_Color_return_release_handle'));
final _withGapColorsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorColorReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_Color_Color_return_get_result'));
final _withGapColorsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorColorReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_Color_Color_return_get_error'));
final _withGapColorsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorColorReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_Color_Color_return_has_error'));


/// @nodoc
@visibleForTesting
class MapPolylineDashRepresentation$Impl extends MapPolylineRepresentation$Impl implements MapPolylineDashRepresentation {

  MapPolylineDashRepresentation$Impl(Pointer<Void> handle) : super(handle);


  MapPolylineDashRepresentation $init(MapMeasureDependentRenderSize lineWidth, MapMeasureDependentRenderSize dashLength, MapMeasureDependentRenderSize gapLength, ui.Color dashColor) {
    final _result_handle = _$init(lineWidth, dashLength, gapLength, dashColor);
    final _result = MapPolylineDashRepresentation$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMappolylineDashrepresentationRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapPolylineDashRepresentation withGapColor(MapMeasureDependentRenderSize lineWidth, MapMeasureDependentRenderSize dashLength, MapMeasureDependentRenderSize gapLength, ui.Color dashColor, ui.Color gapColor) {
    final _result_handle = _withGapColor(lineWidth, dashLength, gapLength, dashColor, gapColor);
    final _result = MapPolylineDashRepresentation$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMappolylineDashrepresentationRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(MapMeasureDependentRenderSize lineWidth, MapMeasureDependentRenderSize dashLength, MapMeasureDependentRenderSize gapLength, ui.Color dashColor) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_Color'));
    final _lineWidthHandle = sdkMapviewMapmeasuredependentrendersizeToFfi(lineWidth);
    final _dashLengthHandle = sdkMapviewMapmeasuredependentrendersizeToFfi(dashLength);
    final _gapLengthHandle = sdkMapviewMapmeasuredependentrendersizeToFfi(gapLength);
    final _dashColorHandle = sdkCoreColorToFfi(dashColor);
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId, _lineWidthHandle, _dashLengthHandle, _gapLengthHandle, _dashColorHandle);
    sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_lineWidthHandle);
    sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_dashLengthHandle);
    sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_gapLengthHandle);
    sdkCoreColorReleaseFfiHandle(_dashColorHandle);
    if (_$initsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorReturnGetError(__callResultHandle);
        _$initsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorReturnReleaseHandle(__callResultHandle);
        try {
          throw MapPolylineRepresentationInstantiationException(sdkMapviewMappolylineRepresentationInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMappolylineRepresentationInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorReturnGetResult(__callResultHandle);
    _$initsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withGapColor(MapMeasureDependentRenderSize lineWidth, MapMeasureDependentRenderSize dashLength, MapMeasureDependentRenderSize gapLength, ui.Color dashColor, ui.Color gapColor) {
    final _withGapColorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_make__MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_MapMeasureDependentRenderSize_Color_Color'));
    final _lineWidthHandle = sdkMapviewMapmeasuredependentrendersizeToFfi(lineWidth);
    final _dashLengthHandle = sdkMapviewMapmeasuredependentrendersizeToFfi(dashLength);
    final _gapLengthHandle = sdkMapviewMapmeasuredependentrendersizeToFfi(gapLength);
    final _dashColorHandle = sdkCoreColorToFfi(dashColor);
    final _gapColorHandle = sdkCoreColorToFfi(gapColor);
    final __callResultHandle = _withGapColorFfi(__lib.LibraryContext.isolateId, _lineWidthHandle, _dashLengthHandle, _gapLengthHandle, _dashColorHandle, _gapColorHandle);
    sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_lineWidthHandle);
    sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_dashLengthHandle);
    sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_gapLengthHandle);
    sdkCoreColorReleaseFfiHandle(_dashColorHandle);
    sdkCoreColorReleaseFfiHandle(_gapColorHandle);
    if (_withGapColorsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorColorReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withGapColorsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorColorReturnGetError(__callResultHandle);
        _withGapColorsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorColorReturnReleaseHandle(__callResultHandle);
        try {
          throw MapPolylineRepresentationInstantiationException(sdkMapviewMappolylineRepresentationInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMappolylineRepresentationInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withGapColorsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorColorReturnGetResult(__callResultHandle);
    _withGapColorsdkMapviewMappolylineDashrepresentationMakeMapmeasuredependentrendersizeMapmeasuredependentrendersizeMapmeasuredependentrendersizeColorColorReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  MapMeasureDependentRenderSize get lineWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_lineWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapmeasuredependentrendersizeFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  MapMeasureDependentRenderSize get dashLength {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_dashLength_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapmeasuredependentrendersizeFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  MapMeasureDependentRenderSize get gapLength {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_gapLength_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapmeasuredependentrendersizeFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  ui.Color get dashColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_dashColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfi(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  ui.Color? get gapColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_DashRepresentation_gapColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandleNullable(__resultHandle);

    }

  }



}

Pointer<Void> sdkMapviewMappolylineDashrepresentationToFfi(MapPolylineDashRepresentation value) =>
  _sdkMapviewMappolylineDashrepresentationCopyHandle((value as __lib.NativeBase).handle);

MapPolylineDashRepresentation sdkMapviewMappolylineDashrepresentationFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapPolylineDashRepresentation) return instance;

  final _typeIdHandle = _sdkMapviewMappolylineDashrepresentationGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMappolylineDashrepresentationCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapPolylineDashRepresentation$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMappolylineDashrepresentationRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMappolylineDashrepresentationReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMappolylineDashrepresentationReleaseHandle(handle);

Pointer<Void> sdkMapviewMappolylineDashrepresentationToFfiNullable(MapPolylineDashRepresentation? value) =>
  value != null ? sdkMapviewMappolylineDashrepresentationToFfi(value) : Pointer<Void>.fromAddress(0);

MapPolylineDashRepresentation? sdkMapviewMappolylineDashrepresentationFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMappolylineDashrepresentationFromFfi(handle) : null;

void sdkMapviewMappolylineDashrepresentationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMappolylineDashrepresentationReleaseHandle(handle);

// End of MapPolylineDashRepresentation "private" section.

// MapPolyline "private" section, not exported.

final _sdkMapviewMappolylineRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapPolyline_register_finalizer'));
final _sdkMapviewMappolylineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_copy_handle'));
final _sdkMapviewMappolylineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapPolyline_release_handle'));








/// @nodoc
@visibleForTesting
class MapPolyline$Impl extends __lib.NativeBase implements MapPolyline {

  MapPolyline$Impl(Pointer<Void> handle) : super(handle);


  MapPolyline $init(GeoPolyline geometry, double widthInPixels, ui.Color color) {
    final _result_handle = _$init(geometry, widthInPixels, color);
    final _result = MapPolyline$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMappolylineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapPolyline withOutlineWidthInPixelsAndOutlineColor(GeoPolyline geometry, double widthInPixels, ui.Color color, double outlineWidthInPixels, ui.Color outlineColor) {
    final _result_handle = _withOutlineWidthInPixelsAndOutlineColor(geometry, widthInPixels, color, outlineWidthInPixels, outlineColor);
    final _result = MapPolyline$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMappolylineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapPolyline withRepresentation(GeoPolyline geometry, MapPolylineRepresentation representation) {
    final _result_handle = _withRepresentation(geometry, representation);
    final _result = MapPolyline$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMappolylineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(GeoPolyline geometry, double widthInPixels, ui.Color color) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Double, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_make__GeoPolyline_Double_Color'));
    final _geometryHandle = sdkCoreGeopolylineToFfi(geometry);
    final _widthInPixelsHandle = (widthInPixels);
    final _colorHandle = sdkCoreColorToFfi(color);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _geometryHandle, _widthInPixelsHandle, _colorHandle);
    sdkCoreGeopolylineReleaseFfiHandle(_geometryHandle);

    sdkCoreColorReleaseFfiHandle(_colorHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withOutlineWidthInPixelsAndOutlineColor(GeoPolyline geometry, double widthInPixels, ui.Color color, double outlineWidthInPixels, ui.Color outlineColor) {
    final _withOutlineWidthInPixelsAndOutlineColorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Double, Pointer<Void>, Double, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, double, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_make__GeoPolyline_Double_Color_Double_Color'));
    final _geometryHandle = sdkCoreGeopolylineToFfi(geometry);
    final _widthInPixelsHandle = (widthInPixels);
    final _colorHandle = sdkCoreColorToFfi(color);
    final _outlineWidthInPixelsHandle = (outlineWidthInPixels);
    final _outlineColorHandle = sdkCoreColorToFfi(outlineColor);
    final __resultHandle = _withOutlineWidthInPixelsAndOutlineColorFfi(__lib.LibraryContext.isolateId, _geometryHandle, _widthInPixelsHandle, _colorHandle, _outlineWidthInPixelsHandle, _outlineColorHandle);
    sdkCoreGeopolylineReleaseFfiHandle(_geometryHandle);

    sdkCoreColorReleaseFfiHandle(_colorHandle);

    sdkCoreColorReleaseFfiHandle(_outlineColorHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withRepresentation(GeoPolyline geometry, MapPolylineRepresentation representation) {
    final _withRepresentationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_make__GeoPolyline_Representation'));
    final _geometryHandle = sdkCoreGeopolylineToFfi(geometry);
    final _representationHandle = sdkMapviewMappolylineRepresentationToFfi(representation);
    final __resultHandle = _withRepresentationFfi(__lib.LibraryContext.isolateId, _geometryHandle, _representationHandle);
    sdkCoreGeopolylineReleaseFfiHandle(_geometryHandle);
    sdkMapviewMappolylineRepresentationReleaseFfiHandle(_representationHandle);
    return __resultHandle;
  }

  @override
  void setRepresentation(MapPolylineRepresentation representation) {
    final _setRepresentationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_setRepresentation__Representation'));
    final _representationHandle = sdkMapviewMappolylineRepresentationToFfi(representation);
    final _handle = this.handle;
    _setRepresentationFfi(_handle, __lib.LibraryContext.isolateId, _representationHandle);
    sdkMapviewMappolylineRepresentationReleaseFfiHandle(_representationHandle);

  }

  @override
  void startAnimation(MapPolylineAnimation animation, AnimationListener listener) {
    final _startAnimationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_startAnimation__MapPolylineAnimation_AnimationListener'));
    final _animationHandle = sdkAnimationMappolylineanimationToFfi(animation);
    final _listenerHandle = sdkAnimationAnimationlistenerToFfi(listener);
    final _handle = this.handle;
    _startAnimationFfi(_handle, __lib.LibraryContext.isolateId, _animationHandle, _listenerHandle);
    sdkAnimationMappolylineanimationReleaseFfiHandle(_animationHandle);
    sdkAnimationAnimationlistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void cancelAnimation(MapPolylineAnimation animation) {
    final _cancelAnimationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_cancelAnimation__MapPolylineAnimation'));
    final _animationHandle = sdkAnimationMappolylineanimationToFfi(animation);
    final _handle = this.handle;
    _cancelAnimationFfi(_handle, __lib.LibraryContext.isolateId, _animationHandle);
    sdkAnimationMappolylineanimationReleaseFfiHandle(_animationHandle);

  }

  @override
  GeoPolyline get geometry {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_geometry_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeopolylineFromFfi(__resultHandle);
    } finally {
      sdkCoreGeopolylineReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set geometry(GeoPolyline value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_geometry_set__GeoPolyline'));
    final _valueHandle = sdkCoreGeopolylineToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreGeopolylineReleaseFfiHandle(_valueHandle);

  }


  @override
  Metadata? get metadata {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_metadata_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreMetadataFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreMetadataReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set metadata(Metadata? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_metadata_set__Metadata_'));
    final _valueHandle = sdkCoreMetadataToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreMetadataReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  LineCap get lineCap {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_lineCap_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewLinecapFromFfi(__resultHandle);
    } finally {
      sdkMapviewLinecapReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set lineCap(LineCap value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapPolyline_lineCap_set__LineCap'));
    final _valueHandle = sdkMapviewLinecapToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkMapviewLinecapReleaseFfiHandle(_valueHandle);

  }


  @override
  ui.Color get lineColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_lineColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfi(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set lineColor(ui.Color value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_lineColor_set__Color'));
    final _valueHandle = sdkCoreColorToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreColorReleaseFfiHandle(_valueHandle);

  }


  @override
  double get lineWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_lineWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set lineWidth(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapPolyline_lineWidth_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  Map<MapMeasure, double> get measureDependentLineWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_measureDependentLineWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingsmapofSdkMapviewMapmeasureToDoubleFromFfi(__resultHandle);
    } finally {
      harpSdkBindingsmapofSdkMapviewMapmeasureToDoubleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set measureDependentLineWidth(Map<MapMeasure, double> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_measureDependentLineWidth_set__MapOf_sdk_mapview_MapMeasure_to_Double'));
    final _valueHandle = harpSdkBindingsmapofSdkMapviewMapmeasureToDoubleToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    harpSdkBindingsmapofSdkMapviewMapmeasureToDoubleReleaseFfiHandle(_valueHandle);

  }


  @override
  ui.Color get outlineColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_outlineColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfi(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set outlineColor(ui.Color value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_outlineColor_set__Color'));
    final _valueHandle = sdkCoreColorToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreColorReleaseFfiHandle(_valueHandle);

  }


  @override
  double get outlineWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_outlineWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set outlineWidth(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapPolyline_outlineWidth_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  Map<MapMeasure, double> get measureDependentOutlineWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_measureDependentOutlineWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingsmapofSdkMapviewMapmeasureToDoubleFromFfi(__resultHandle);
    } finally {
      harpSdkBindingsmapofSdkMapviewMapmeasureToDoubleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set measureDependentOutlineWidth(Map<MapMeasure, double> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_measureDependentOutlineWidth_set__MapOf_sdk_mapview_MapMeasure_to_Double'));
    final _valueHandle = harpSdkBindingsmapofSdkMapviewMapmeasureToDoubleToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    harpSdkBindingsmapofSdkMapviewMapmeasureToDoubleReleaseFfiHandle(_valueHandle);

  }


  @override
  DashPattern? get dashPattern {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_dashPattern_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewDashpatternFromFfiNullable(__resultHandle);
    } finally {
      sdkMapviewDashpatternReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set dashPattern(DashPattern? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_dashPattern_set__DashPattern_'));
    final _valueHandle = sdkMapviewDashpatternToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkMapviewDashpatternReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  ui.Color? get dashFillColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_dashFillColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set dashFillColor(ui.Color? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_dashFillColor_set__Color_'));
    final _valueHandle = sdkCoreColorToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreColorReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  int get drawOrder {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_drawOrder_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set drawOrder(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapPolyline_drawOrder_set__Int'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  DrawOrderType get drawOrderType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_drawOrderType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewDrawordertypeFromFfi(__resultHandle);
    } finally {
      sdkMapviewDrawordertypeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set drawOrderType(DrawOrderType value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_mapview_MapPolyline_drawOrderType_set__DrawOrderType'));
    final _valueHandle = sdkMapviewDrawordertypeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkMapviewDrawordertypeReleaseFfiHandle(_valueHandle);

  }


  @override
  List<MapMeasureRange> get visibilityRanges {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_visibilityRanges_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingslistofSdkMapviewMapmeasurerangeFromFfi(__resultHandle);
    } finally {
      harpSdkBindingslistofSdkMapviewMapmeasurerangeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set visibilityRanges(List<MapMeasureRange> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_visibilityRanges_set__ListOf_sdk_mapview_MapMeasureRange'));
    final _valueHandle = harpSdkBindingslistofSdkMapviewMapmeasurerangeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    harpSdkBindingslistofSdkMapviewMapmeasurerangeReleaseFfiHandle(_valueHandle);

  }


  @override
  double get progress {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_progress_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set progress(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapPolyline_progress_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  ui.Color get progressColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_progressColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfi(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set progressColor(ui.Color value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_progressColor_set__Color'));
    final _valueHandle = sdkCoreColorToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreColorReleaseFfiHandle(_valueHandle);

  }


  @override
  ui.Color get progressOutlineColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_progressOutlineColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfi(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set progressOutlineColor(ui.Color value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_progressOutlineColor_set__Color'));
    final _valueHandle = sdkCoreColorToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreColorReleaseFfiHandle(_valueHandle);

  }


  @override
  List<MapContentCategory> get mapContentCategoriesToBlock {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapPolyline_mapContentCategoriesToBlock_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingslistofSdkMapviewMapcontentcategoryFromFfi(__resultHandle);
    } finally {
      harpSdkBindingslistofSdkMapviewMapcontentcategoryReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set mapContentCategoriesToBlock(List<MapContentCategory> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapPolyline_mapContentCategoriesToBlock_set__ListOf_sdk_mapview_MapContentCategory'));
    final _valueHandle = harpSdkBindingslistofSdkMapviewMapcontentcategoryToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    harpSdkBindingslistofSdkMapviewMapcontentcategoryReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkMapviewMappolylineToFfi(MapPolyline value) =>
  _sdkMapviewMappolylineCopyHandle((value as __lib.NativeBase).handle);

MapPolyline sdkMapviewMappolylineFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapPolyline) return instance;

  final _copiedHandle = _sdkMapviewMappolylineCopyHandle(handle);
  final result = MapPolyline$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMappolylineRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMappolylineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMappolylineReleaseHandle(handle);

Pointer<Void> sdkMapviewMappolylineToFfiNullable(MapPolyline? value) =>
  value != null ? sdkMapviewMappolylineToFfi(value) : Pointer<Void>.fromAddress(0);

MapPolyline? sdkMapviewMappolylineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMappolylineFromFfi(handle) : null;

void sdkMapviewMappolylineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMappolylineReleaseHandle(handle);

// End of MapPolyline "private" section.


