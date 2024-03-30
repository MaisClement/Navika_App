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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/anchor2_d.dart';
import 'package:here_sdk/src/sdk/core/color.dart';
import 'package:here_sdk/src/sdk/core/named_color.dart';
import 'package:here_sdk/src/sdk/mapview/map_image.dart';
import 'package:here_sdk/src/sdk/mapview/map_marker.dart';
import 'package:meta/meta.dart';

/// Groups map markers and enables their clustering to reduce visual clutter when there are many of
/// them in a small area.
///
/// The markers that are close to each other are replaced by a single cluster marker. Cluster groups
/// are generated based on geographical distance between objects, not based on screen space collision.
/// Hence it is possible, that cluster markers can overlap.
///
/// The markers can be added to a cluster or to a scene, but not to both. To display the cluster on the
/// map, add it to the scene using [MapScene.addMapMarkerCluster]. The display of a cluster is only
/// guaranteed in case its origin is within the viewport. At the moment, this is a known limitation
/// that mostly affects clusters which are visually large and cover a sizeable part of the viewport.
///
/// Markers part of the cluster with opacity set to zero are still on the map and are considered for picking and clustering.
abstract class MapMarkerCluster {
  /// Creates a new instance of a map marker cluster which is represented as an image.
  ///
  /// [imageStyle] The visual representation for the cluster.
  /// Any modification to object passed as `imageStyle` after creation of `MapMarkerCluster` does not have any effect.
  ///
  factory MapMarkerCluster(MapMarkerClusterImageStyle imageStyle) => $prototype.$init(imageStyle);
  /// Creates a new instance of a map marker cluster which is represented as an image along with a counter
  /// showing how many markers are actually grouped under particular cluster icon.
  ///
  /// [imageStyle] Describes the visual appearance of cluster icon.
  /// Any modification to `imageStyle` after creation of `MapMarkerCluster` does not have any effect.
  ///
  /// [counterStyle] Describes the appearance of marker count label.
  /// Any modification to object passed as `counterStyle` after creation of `MapMarkerCluster` does not have any effect.
  ///
  factory MapMarkerCluster.WithCounter(MapMarkerClusterImageStyle imageStyle, MapMarkerClusterCounterStyle counterStyle) => $prototype.WithCounter(imageStyle, counterStyle);

  /// Adds a map marker to this cluster.
  ///
  /// Adding a marker which is already part of the cluster or
  /// which was already added to the map scene has no effect.
  ///
  /// [marker] The marker.
  ///
  void addMapMarker(MapMarker marker);
  /// Adds a list of map markers to this cluster.
  ///
  /// Markers which are already part of the cluster or
  /// which were already added to the map scene will be ignored.
  ///
  /// [markers] The list of markers.
  ///
  void addMapMarkers(List<MapMarker> markers);
  /// Removes a map marker from this cluster.
  ///
  /// Removing a marker which is not part of this cluster has no effect.
  ///
  /// [marker] The marker.
  ///
  void removeMapMarker(MapMarker marker);
  /// Removes a list of map markers from this cluster.
  ///
  /// Removing markers which are not part of this cluster has no effect.
  ///
  /// [markers] The list of markers.
  ///
  void removeMapMarkers(List<MapMarker> markers);
  /// Removes all map markers from this cluster.
  ///
  void removeAllMapMarkers();
  List<MapMarker> get markers;

  /// Gets the current opacity of the marker cluster image.
  double get opacity;
  /// Sets the opacity of the marker cluster image.
  /// Provided value is clamped in range \[0.0, 1.0\]. Default value is 1.0 which means marker cluster is displayed with the default opacity of the image.
  /// Marker clusters with opacity value set to 0.0 are still on the map and are considered for picking.
  set opacity(double value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapMarkerCluster$Impl(Pointer<Void>.fromAddress(0));
}

/// Represents a group of map markers belonging to a cluster.
///
/// It contains a list of map markers grouped on map view under single icon of marker cluster or
/// single map marker entry for markers being part of cluster but spread enough not to be grouped.

class MapMarkerClusterGrouping {
  /// List of map markers grouped on map view under map marker cluster icon.
  List<MapMarker> markers;

  /// Map marker cluster that entries in [MapMarkerClusterGrouping.markers] belong to.
  MapMarkerCluster parent;

  /// Creates a new instance.

  /// [markers] List of map markers grouped on map view under map marker cluster icon.

  /// [parent] Map marker cluster that entries in [MapMarkerClusterGrouping.markers] belong to.

  MapMarkerClusterGrouping(this.markers, this.parent);
}


// MapMarkerClusterGrouping "private" section, not exported.

final _sdkMapviewMapmarkerclusterGroupingCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_Grouping_create_handle'));
final _sdkMapviewMapmarkerclusterGroupingReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_Grouping_release_handle'));
final _sdkMapviewMapmarkerclusterGroupingGetFieldmarkers = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_Grouping_get_field_markers'));
final _sdkMapviewMapmarkerclusterGroupingGetFieldparent = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_Grouping_get_field_parent'));



Pointer<Void> sdkMapviewMapmarkerclusterGroupingToFfi(MapMarkerClusterGrouping value) {
  final _markersHandle = harpSdkBindingslistofSdkMapviewMapmarkerToFfi(value.markers);
  final _parentHandle = sdkMapviewMapmarkerclusterToFfi(value.parent);
  final _result = _sdkMapviewMapmarkerclusterGroupingCreateHandle(_markersHandle, _parentHandle);
  harpSdkBindingslistofSdkMapviewMapmarkerReleaseFfiHandle(_markersHandle);
  sdkMapviewMapmarkerclusterReleaseFfiHandle(_parentHandle);
  return _result;
}

MapMarkerClusterGrouping sdkMapviewMapmarkerclusterGroupingFromFfi(Pointer<Void> handle) {
  final _markersHandle = _sdkMapviewMapmarkerclusterGroupingGetFieldmarkers(handle);
  final _parentHandle = _sdkMapviewMapmarkerclusterGroupingGetFieldparent(handle);
  try {
    return MapMarkerClusterGrouping(
      harpSdkBindingslistofSdkMapviewMapmarkerFromFfi(_markersHandle), 
      sdkMapviewMapmarkerclusterFromFfi(_parentHandle)
    );
  } finally {
    harpSdkBindingslistofSdkMapviewMapmarkerReleaseFfiHandle(_markersHandle);
    sdkMapviewMapmarkerclusterReleaseFfiHandle(_parentHandle);
  }
}

void sdkMapviewMapmarkerclusterGroupingReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewMapmarkerclusterGroupingReleaseHandle(handle);

// Nullable MapMarkerClusterGrouping

final _sdkMapviewMapmarkerclusterGroupingCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_Grouping_create_handle_nullable'));
final _sdkMapviewMapmarkerclusterGroupingReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_Grouping_release_handle_nullable'));
final _sdkMapviewMapmarkerclusterGroupingGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_Grouping_get_value_nullable'));

Pointer<Void> sdkMapviewMapmarkerclusterGroupingToFfiNullable(MapMarkerClusterGrouping? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapmarkerclusterGroupingToFfi(value);
  final result = _sdkMapviewMapmarkerclusterGroupingCreateHandleNullable(_handle);
  sdkMapviewMapmarkerclusterGroupingReleaseFfiHandle(_handle);
  return result;
}

MapMarkerClusterGrouping? sdkMapviewMapmarkerclusterGroupingFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapmarkerclusterGroupingGetValueNullable(handle);
  final result = sdkMapviewMapmarkerclusterGroupingFromFfi(_handle);
  sdkMapviewMapmarkerclusterGroupingReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapmarkerclusterGroupingReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmarkerclusterGroupingReleaseHandleNullable(handle);

// End of MapMarkerClusterGrouping "private" section.


/// This class specifies the visual appearance of a cluster marker.
@immutable
class MapMarkerClusterImageStyle {
  /// The map image for the cluster marker.
  final MapImage image;

  /// The anchor point for the marker image which specifies the position offset relative
  /// to the cluster's position.
  final Anchor2D anchor;

  const MapMarkerClusterImageStyle._(this.image, this.anchor);
  /// Creates a cluster marker image style using a map image with anchor.
  ///
  /// The anchor is a way of specifying position offset relative to image's dimensions on the
  /// screen. For example, (0, 0) places the top-left corner of the image at the cluster's
  /// position. (1, 1) would place the bottom-right corner of the image at the cluster's
  /// position.
  ///
  /// [image] The map image for the cluster marker.
  ///
  /// [anchor] The anchor point for the marker image which specifies the position offset relative
  /// to the cluster's position.
  ///
  factory MapMarkerClusterImageStyle.withAnchor(MapImage image, Anchor2D anchor) => $prototype.withAnchor(image, anchor);
  /// Creates a marker cluster image representation with default anchor.
  ///
  /// [image] The map image for the cluster marker.
  ///
  factory MapMarkerClusterImageStyle(MapImage image) => $prototype.$init(image);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapMarkerClusterImageStyle$Impl();
}


// MapMarkerClusterImageStyle "private" section, not exported.

final _sdkMapviewMapmarkerclusterImagestyleCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_ImageStyle_create_handle'));
final _sdkMapviewMapmarkerclusterImagestyleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_ImageStyle_release_handle'));
final _sdkMapviewMapmarkerclusterImagestyleGetFieldimage = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_ImageStyle_get_field_image'));
final _sdkMapviewMapmarkerclusterImagestyleGetFieldanchor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_ImageStyle_get_field_anchor'));



/// @nodoc
@visibleForTesting
class MapMarkerClusterImageStyle$Impl {
  MapMarkerClusterImageStyle withAnchor(MapImage image, Anchor2D anchor) {
    final _withAnchorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarkerCluster_ImageStyle_make__MapImage_Anchor2D'));
    final _imageHandle = sdkMapviewMapimageToFfi(image);
    final _anchorHandle = sdkCoreAnchor2dToFfi(anchor);
    final __resultHandle = _withAnchorFfi(__lib.LibraryContext.isolateId, _imageHandle, _anchorHandle);
    sdkMapviewMapimageReleaseFfiHandle(_imageHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_anchorHandle);
    try {
      return sdkMapviewMapmarkerclusterImagestyleFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmarkerclusterImagestyleReleaseFfiHandle(__resultHandle);

    }

  }

  MapMarkerClusterImageStyle $init(MapImage image) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarkerCluster_ImageStyle_make__MapImage'));
    final _imageHandle = sdkMapviewMapimageToFfi(image);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _imageHandle);
    sdkMapviewMapimageReleaseFfiHandle(_imageHandle);
    try {
      return sdkMapviewMapmarkerclusterImagestyleFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmarkerclusterImagestyleReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkMapviewMapmarkerclusterImagestyleToFfi(MapMarkerClusterImageStyle value) {
  final _imageHandle = sdkMapviewMapimageToFfi(value.image);
  final _anchorHandle = sdkCoreAnchor2dToFfi(value.anchor);
  final _result = _sdkMapviewMapmarkerclusterImagestyleCreateHandle(_imageHandle, _anchorHandle);
  sdkMapviewMapimageReleaseFfiHandle(_imageHandle);
  sdkCoreAnchor2dReleaseFfiHandle(_anchorHandle);
  return _result;
}

MapMarkerClusterImageStyle sdkMapviewMapmarkerclusterImagestyleFromFfi(Pointer<Void> handle) {
  final _imageHandle = _sdkMapviewMapmarkerclusterImagestyleGetFieldimage(handle);
  final _anchorHandle = _sdkMapviewMapmarkerclusterImagestyleGetFieldanchor(handle);
  try {
    return MapMarkerClusterImageStyle._(
      sdkMapviewMapimageFromFfi(_imageHandle), 
      sdkCoreAnchor2dFromFfi(_anchorHandle)
    );
  } finally {
    sdkMapviewMapimageReleaseFfiHandle(_imageHandle);
    sdkCoreAnchor2dReleaseFfiHandle(_anchorHandle);
  }
}

void sdkMapviewMapmarkerclusterImagestyleReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewMapmarkerclusterImagestyleReleaseHandle(handle);

// Nullable MapMarkerClusterImageStyle

final _sdkMapviewMapmarkerclusterImagestyleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_ImageStyle_create_handle_nullable'));
final _sdkMapviewMapmarkerclusterImagestyleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_ImageStyle_release_handle_nullable'));
final _sdkMapviewMapmarkerclusterImagestyleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_ImageStyle_get_value_nullable'));

Pointer<Void> sdkMapviewMapmarkerclusterImagestyleToFfiNullable(MapMarkerClusterImageStyle? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapmarkerclusterImagestyleToFfi(value);
  final result = _sdkMapviewMapmarkerclusterImagestyleCreateHandleNullable(_handle);
  sdkMapviewMapmarkerclusterImagestyleReleaseFfiHandle(_handle);
  return result;
}

MapMarkerClusterImageStyle? sdkMapviewMapmarkerclusterImagestyleFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapmarkerclusterImagestyleGetValueNullable(handle);
  final result = sdkMapviewMapmarkerclusterImagestyleFromFfi(_handle);
  sdkMapviewMapmarkerclusterImagestyleReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapmarkerclusterImagestyleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmarkerclusterImagestyleReleaseHandleNullable(handle);

// End of MapMarkerClusterImageStyle "private" section.
/// Styling options for a marker cluster which is represented by the marker count as a text.

class MapMarkerClusterCounterStyle {
  /// Font color of counter. Default value is white.
  ui.Color textColor;

  /// Font size of counter. Default value is 20.
  double fontSize;

  /// Anchor of counter in regards to marker cluster image. Default is at the center.
  Anchor2D textAnchor;

  /// Maximal number of markers represented as exact number. Values smaller than 2 will be clamped to 2.
  /// Default value is 99. When this value is changed, it is recommended to adapt [MapMarkerClusterCounterStyle.aboveMaxText] accordingly.
  int maxCountNumber;

  /// String to display if there are more markers clustered than [MapMarkerClusterCounterStyle.maxCountNumber]. Default value is "+99".
  String aboveMaxText;

  /// Creates a new instance.

  /// [textColor] Font color of counter. Default value is white.

  /// [fontSize] Font size of counter. Default value is 20.

  /// [textAnchor] Anchor of counter in regards to marker cluster image. Default is at the center.

  /// [maxCountNumber] Maximal number of markers represented as exact number. Values smaller than 2 will be clamped to 2.
  /// Default value is 99. When this value is changed, it is recommended to adapt [MapMarkerClusterCounterStyle.aboveMaxText] accordingly.

  /// [aboveMaxText] String to display if there are more markers clustered than [MapMarkerClusterCounterStyle.maxCountNumber]. Default value is "+99".

  MapMarkerClusterCounterStyle._(this.textColor, this.fontSize, this.textAnchor, this.maxCountNumber, this.aboveMaxText);
  MapMarkerClusterCounterStyle()
    : textColor = NamedColor.white, fontSize = 20, textAnchor = Anchor2D(), maxCountNumber = 99, aboveMaxText = "+99";
}


// MapMarkerClusterCounterStyle "private" section, not exported.

final _sdkMapviewMapmarkerclusterCounterstyleCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Double, Pointer<Void>, Int32, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, double, Pointer<Void>, int, Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_CounterStyle_create_handle'));
final _sdkMapviewMapmarkerclusterCounterstyleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_CounterStyle_release_handle'));
final _sdkMapviewMapmarkerclusterCounterstyleGetFieldtextColor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_CounterStyle_get_field_textColor'));
final _sdkMapviewMapmarkerclusterCounterstyleGetFieldfontSize = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_CounterStyle_get_field_fontSize'));
final _sdkMapviewMapmarkerclusterCounterstyleGetFieldtextAnchor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_CounterStyle_get_field_textAnchor'));
final _sdkMapviewMapmarkerclusterCounterstyleGetFieldmaxCountNumber = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_CounterStyle_get_field_maxCountNumber'));
final _sdkMapviewMapmarkerclusterCounterstyleGetFieldaboveMaxText = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_CounterStyle_get_field_aboveMaxText'));



Pointer<Void> sdkMapviewMapmarkerclusterCounterstyleToFfi(MapMarkerClusterCounterStyle value) {
  final _textColorHandle = sdkCoreColorToFfi(value.textColor);
  final _fontSizeHandle = (value.fontSize);
  final _textAnchorHandle = sdkCoreAnchor2dToFfi(value.textAnchor);
  final _maxCountNumberHandle = (value.maxCountNumber);
  final _aboveMaxTextHandle = stringToFfi(value.aboveMaxText);
  final _result = _sdkMapviewMapmarkerclusterCounterstyleCreateHandle(_textColorHandle, _fontSizeHandle, _textAnchorHandle, _maxCountNumberHandle, _aboveMaxTextHandle);
  sdkCoreColorReleaseFfiHandle(_textColorHandle);
  
  sdkCoreAnchor2dReleaseFfiHandle(_textAnchorHandle);
  
  stringReleaseFfiHandle(_aboveMaxTextHandle);
  return _result;
}

MapMarkerClusterCounterStyle sdkMapviewMapmarkerclusterCounterstyleFromFfi(Pointer<Void> handle) {
  final _textColorHandle = _sdkMapviewMapmarkerclusterCounterstyleGetFieldtextColor(handle);
  final _fontSizeHandle = _sdkMapviewMapmarkerclusterCounterstyleGetFieldfontSize(handle);
  final _textAnchorHandle = _sdkMapviewMapmarkerclusterCounterstyleGetFieldtextAnchor(handle);
  final _maxCountNumberHandle = _sdkMapviewMapmarkerclusterCounterstyleGetFieldmaxCountNumber(handle);
  final _aboveMaxTextHandle = _sdkMapviewMapmarkerclusterCounterstyleGetFieldaboveMaxText(handle);
  try {
    return MapMarkerClusterCounterStyle._(
      sdkCoreColorFromFfi(_textColorHandle), 
      (_fontSizeHandle), 
      sdkCoreAnchor2dFromFfi(_textAnchorHandle), 
      (_maxCountNumberHandle), 
      stringFromFfi(_aboveMaxTextHandle)
    );
  } finally {
    sdkCoreColorReleaseFfiHandle(_textColorHandle);
    
    sdkCoreAnchor2dReleaseFfiHandle(_textAnchorHandle);
    
    stringReleaseFfiHandle(_aboveMaxTextHandle);
  }
}

void sdkMapviewMapmarkerclusterCounterstyleReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewMapmarkerclusterCounterstyleReleaseHandle(handle);

// Nullable MapMarkerClusterCounterStyle

final _sdkMapviewMapmarkerclusterCounterstyleCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_CounterStyle_create_handle_nullable'));
final _sdkMapviewMapmarkerclusterCounterstyleReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_CounterStyle_release_handle_nullable'));
final _sdkMapviewMapmarkerclusterCounterstyleGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_CounterStyle_get_value_nullable'));

Pointer<Void> sdkMapviewMapmarkerclusterCounterstyleToFfiNullable(MapMarkerClusterCounterStyle? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapmarkerclusterCounterstyleToFfi(value);
  final result = _sdkMapviewMapmarkerclusterCounterstyleCreateHandleNullable(_handle);
  sdkMapviewMapmarkerclusterCounterstyleReleaseFfiHandle(_handle);
  return result;
}

MapMarkerClusterCounterStyle? sdkMapviewMapmarkerclusterCounterstyleFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapmarkerclusterCounterstyleGetValueNullable(handle);
  final result = sdkMapviewMapmarkerclusterCounterstyleFromFfi(_handle);
  sdkMapviewMapmarkerclusterCounterstyleReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapmarkerclusterCounterstyleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmarkerclusterCounterstyleReleaseHandleNullable(handle);

// End of MapMarkerClusterCounterStyle "private" section.

// MapMarkerCluster "private" section, not exported.

final _sdkMapviewMapmarkerclusterRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapMarkerCluster_register_finalizer'));
final _sdkMapviewMapmarkerclusterCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_copy_handle'));
final _sdkMapviewMapmarkerclusterReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMarkerCluster_release_handle'));









/// @nodoc
@visibleForTesting
class MapMarkerCluster$Impl extends __lib.NativeBase implements MapMarkerCluster {

  MapMarkerCluster$Impl(Pointer<Void> handle) : super(handle);


  MapMarkerCluster $init(MapMarkerClusterImageStyle imageStyle) {
    final _result_handle = _$init(imageStyle);
    final _result = MapMarkerCluster$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapmarkerclusterRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  MapMarkerCluster WithCounter(MapMarkerClusterImageStyle imageStyle, MapMarkerClusterCounterStyle counterStyle) {
    final _result_handle = _WithCounter(imageStyle, counterStyle);
    final _result = MapMarkerCluster$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMapmarkerclusterRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(MapMarkerClusterImageStyle imageStyle) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarkerCluster_make__ImageStyle'));
    final _imageStyleHandle = sdkMapviewMapmarkerclusterImagestyleToFfi(imageStyle);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _imageStyleHandle);
    sdkMapviewMapmarkerclusterImagestyleReleaseFfiHandle(_imageStyleHandle);
    return __resultHandle;
  }

  static Pointer<Void> _WithCounter(MapMarkerClusterImageStyle imageStyle, MapMarkerClusterCounterStyle counterStyle) {
    final _WithCounterFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarkerCluster_make__ImageStyle_CounterStyle'));
    final _imageStyleHandle = sdkMapviewMapmarkerclusterImagestyleToFfi(imageStyle);
    final _counterStyleHandle = sdkMapviewMapmarkerclusterCounterstyleToFfi(counterStyle);
    final __resultHandle = _WithCounterFfi(__lib.LibraryContext.isolateId, _imageStyleHandle, _counterStyleHandle);
    sdkMapviewMapmarkerclusterImagestyleReleaseFfiHandle(_imageStyleHandle);
    sdkMapviewMapmarkerclusterCounterstyleReleaseFfiHandle(_counterStyleHandle);
    return __resultHandle;
  }

  @override
  void addMapMarker(MapMarker marker) {
    final _addMapMarkerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarkerCluster_addMapMarker__MapMarker'));
    final _markerHandle = sdkMapviewMapmarkerToFfi(marker);
    final _handle = this.handle;
    _addMapMarkerFfi(_handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarkerReleaseFfiHandle(_markerHandle);

  }

  @override
  void addMapMarkers(List<MapMarker> markers) {
    final _addMapMarkersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarkerCluster_addMapMarkers__ListOf_sdk_mapview_MapMarker'));
    final _markersHandle = harpSdkBindingslistofSdkMapviewMapmarkerToFfi(markers);
    final _handle = this.handle;
    _addMapMarkersFfi(_handle, __lib.LibraryContext.isolateId, _markersHandle);
    harpSdkBindingslistofSdkMapviewMapmarkerReleaseFfiHandle(_markersHandle);

  }

  @override
  void removeMapMarker(MapMarker marker) {
    final _removeMapMarkerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarkerCluster_removeMapMarker__MapMarker'));
    final _markerHandle = sdkMapviewMapmarkerToFfi(marker);
    final _handle = this.handle;
    _removeMapMarkerFfi(_handle, __lib.LibraryContext.isolateId, _markerHandle);
    sdkMapviewMapmarkerReleaseFfiHandle(_markerHandle);

  }

  @override
  void removeMapMarkers(List<MapMarker> markers) {
    final _removeMapMarkersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMarkerCluster_removeMapMarkers__ListOf_sdk_mapview_MapMarker'));
    final _markersHandle = harpSdkBindingslistofSdkMapviewMapmarkerToFfi(markers);
    final _handle = this.handle;
    _removeMapMarkersFfi(_handle, __lib.LibraryContext.isolateId, _markersHandle);
    harpSdkBindingslistofSdkMapviewMapmarkerReleaseFfiHandle(_markersHandle);

  }

  @override
  void removeAllMapMarkers() {
    final _removeAllMapMarkersFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarkerCluster_removeAllMapMarkers'));
    final _handle = this.handle;
    _removeAllMapMarkersFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  List<MapMarker> get markers {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarkerCluster_markers_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return harpSdkBindingslistofSdkMapviewMapmarkerFromFfi(__resultHandle);
    } finally {
      harpSdkBindingslistofSdkMapviewMapmarkerReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  double get opacity {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapMarkerCluster_opacity_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set opacity(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Double), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapMarkerCluster_opacity_set__Double'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }



}

Pointer<Void> sdkMapviewMapmarkerclusterToFfi(MapMarkerCluster value) =>
  _sdkMapviewMapmarkerclusterCopyHandle((value as __lib.NativeBase).handle);

MapMarkerCluster sdkMapviewMapmarkerclusterFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapMarkerCluster) return instance;

  final _copiedHandle = _sdkMapviewMapmarkerclusterCopyHandle(handle);
  final result = MapMarkerCluster$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapmarkerclusterRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapmarkerclusterReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapmarkerclusterReleaseHandle(handle);

Pointer<Void> sdkMapviewMapmarkerclusterToFfiNullable(MapMarkerCluster? value) =>
  value != null ? sdkMapviewMapmarkerclusterToFfi(value) : Pointer<Void>.fromAddress(0);

MapMarkerCluster? sdkMapviewMapmarkerclusterFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapmarkerclusterFromFfi(handle) : null;

void sdkMapviewMapmarkerclusterReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmarkerclusterReleaseHandle(handle);

// End of MapMarkerCluster "private" section.


