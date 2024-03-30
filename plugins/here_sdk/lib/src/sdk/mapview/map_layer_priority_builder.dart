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
import 'package:here_sdk/src/sdk/mapview/map_layer_priority.dart';
import 'package:meta/meta.dart';

/// MapLayerPriorityBuilder is an interface used to define the rendering priority of a layer
/// and its categories, relative to other layers or layer-category pairs.
///
/// Map layers are rendered in an order according to specified priorities. Rendering order of elements in
/// a single map layer can be controlled with categories. Layer names are unique, and category names have
/// to be unique within a layer. The layer's default, main category is unnamed.
///
/// The concept of 'category' is tightly linked to styling. The idea behind category is that
/// one should be able to style separately elements in a map layer. Take, for instance, roads.
/// If one wants to style separately the bridges it will create a category 'bridges' and style
/// it accordingly in the style file. If the user does not intend to or cannot style elements
/// of the layer diffenrently then it should opt for a layer with only the default category (e.g.
/// raster layer).
///
/// One way to define layers' priorities is by using a layer priority list in the scene configuration.
///
/// For example, a priority list in a scene configuration could define:
///
/// * background
/// * water
/// * roads:outline
/// * roads
/// * labels
///
/// This means layer "background" is rendered first. Next up is layer "water". Then category "outline" of
/// layer "roads", followed by the main category of layer "roads". Layer "labels" is then rendered last.
///
/// <p>
/// Now let's consider a newly created layer 'zone' and its categories:
///
/// * zone
/// * zone:background
/// * zone:lines-outline
/// * zone:lines
///
/// The user wants to alter the rendering order so that it looks like:
///
/// * background
/// * water
/// * zone:background
/// * zone
/// * road:outline
/// * road
/// * zone:lines-outline
/// * zone:lines
/// * labels
///
/// This could be achieved with the help of the MapLayerPriorityBuilder and a sequence of calls to its
/// `renderedBeforeLayer()` and `renderedAfterLayer()` member functions.
///
/// Note that the order of calls matters and one can use a previously defined layer or category
/// as a reference:
///
/// ```
///   final zoneLayerPriority = MapLayerPriorityBuilder()
///        .renderedAfterLayer("water")          // places "zone" after "water"
///                                              // in the rendering order
///        .withCategory("background")
///        .renderedAfterLayer("water")          // places "zone:background" after "water"
///                                              // in the rendering order and thus shifts
///                                              // "zone" to be rendered later
///        .withCategory("lines-outline")
///        .renderedAfterLayer("road")           // places "zone:lines-outline" after "road"
///                                              // in the rendering order
///        .withCategory("lines")
///        .renderedAfterLayer("zone", "lines-outline") // places "zone:lines" after
///                                                     // "zone:lines-outline" in the rendering order
///        .build();
///
///   zoneLayer.setPriority(zoneLayerPriority);  // applies the priority to the zone layer
///                                              // and its categories in one single operation.
/// ```
///
/// In case an empty MapLayerPriority without any ordering commands is built, it is assumed that the target layer
/// is going to be rendered last.
///
/// Due to a current limitation for point map layers, the mentioned APIs to control the rendering
/// order are not implemented. All labels will be rendered within the "labels" layer, defined in
/// the scene configuration file.
/// By default, all labels rendered by a point map layer are rendered last and no overlapping is
/// allowed. The following categories can be used to have a different behaviour:
/// - 'custom-labels' A label should be rendered first, is allowed to overlap with other labels of
///   the same category and block map labels.
/// - 'custom-labels-no-self-overlap' A label should be rendered after 'custom-labels', is not allowed
///   to overlap with other labels of the same categoty and block map labels.
/// - 'custom-labels-overlap-all' A label should be rendered last, is allowed to overlap all
///   predefined categories, also map labels.
///   These categories are configured accordingly in the basic map
///   scene configurations.
///   Category assignment to features can be done in the style based on data attributes. The category
///   assignment can be done for all types of data: points, lines, polygons.}
abstract class MapLayerPriorityBuilder {
  /// Creates an instance of the layer priority builder interface.
  ///
  factory MapLayerPriorityBuilder() => $prototype.create();

  /// Sets the layer category for which we can define a priority followed by a call to the functions
  /// renderedFirst|Last|BeforeLayer|AfterLayer.
  ///
  /// After a priority is defined by calling one of the aforementioned functions, the current category
  /// is cleared and the builder refers again to the layer itself.
  ///
  /// [category] The name of the layer category.
  ///
  /// Returns [MapLayerPriorityBuilder]. This class instance.
  ///
  MapLayerPriorityBuilder withCategory(String category);
  /// Sets the priority as rendered before all layers and categories.
  ///
  /// Applies to the layer itself or the
  /// category pointed to by the preceding call to
  /// .
  /// Notice that the order of calls to the functions
  /// renderedFirst|Last|Before|After
  /// matters, and that after such a call the builder clears the current category and refers again to
  /// the layer itself. The previously defined and prioritised categories can be used as reference.
  ///
  /// Returns [MapLayerPriorityBuilder]. This class instance.
  ///
  MapLayerPriorityBuilder renderedFirst();
  /// Sets the priority as rendered after all layers and categories.
  ///
  /// Applies to the layer itself or the
  /// category pointed to by the preceding call to
  /// .
  /// Notice that the order of calls to the functions
  /// renderedFirst|Last|Before|After
  /// matters, and that after such a call the builder clears the current category and refers again to
  /// the layer itself. The previously defined and prioritised categories can be used as reference.
  ///
  /// Returns [MapLayerPriorityBuilder]. This class instance.
  ///
  MapLayerPriorityBuilder renderedLast();
  /// Sets the priority as rendered before the first one from the referenceLayer and its categories.
  ///
  /// Applies to the layer itself or the category pointed to by the preceding call to
  /// .
  /// Notice that the order of calls to the functions
  /// renderedFirst|Last|Before|After
  /// matters, and that after such a call the builder clears the current category and refers again to
  /// the layer itself. The previously defined and prioritised categories can be used as reference.
  /// If the referenceLayer does not exist, then the function will set the priority as rendered
  /// before all layers and categories.
  ///
  /// [referenceLayer] The beforehand defined layer name which renders directly after the current layer.
  ///
  /// Returns [MapLayerPriorityBuilder]. This class instance.
  ///
  MapLayerPriorityBuilder renderedBeforeLayer(String referenceLayer);
  /// Sets the priority as rendered before the referenceCategory of the referenceLayer.
  ///
  /// Applies to the
  /// layer itself or the category pointed to by the preceding call to
  /// .
  /// Notice that the order of calls to the functions
  /// renderedFirst|Last|Before|After
  /// matters, and that after such a call the builder clears the current category and refers again to
  /// the layer itself. The previously defined and prioritised categories can be used as reference.
  /// If the referenceLayer and/or the referenceCategory do not exist, then the function will set
  /// the priority as rendered before all layers and categories.
  ///
  /// [referenceLayer] The beforehand defined layer name which renders directly after the current layer.
  ///
  /// [referenceCategory] The beforehand defined category name which renders directly after the current layer.
  ///
  /// Returns [MapLayerPriorityBuilder]. This class instance.
  ///
  MapLayerPriorityBuilder renderedBeforeLayerWithCategory(String referenceLayer, String referenceCategory);
  /// Sets the priority as rendered after the last one from the referenceLayer and its categories.
  ///
  /// Applies to the layer itself or the category pointed to by the preceding call to
  /// .
  /// Notice that the order of calls to the functions
  /// renderedFirst|Last|Before|After
  /// matters, and that after such a call the builder clears the current category and refers again to
  /// the layer itself. The previously defined and prioritised categories can be used as reference.
  /// If the referenceLayer does not exist, then the function will set the priority as rendered
  /// after all layers and categories.
  ///
  /// [referenceLayer] The beforehand defined layer name which renders directly before the current layer.
  ///
  /// Returns [MapLayerPriorityBuilder]. This class instance.
  ///
  MapLayerPriorityBuilder renderedAfterLayer(String referenceLayer);
  /// Sets the priority as rendered after the referenceCategory of the referenceLayer.
  ///
  /// Applies to the
  /// layer itself or the category pointed to by the preceding call to
  /// .
  /// Notice that the order of calls to the functions
  /// renderedFirst|Last|Before|After
  /// matters, and that after such a call the builder clears the current category and refers again to
  /// the layer itself. The previously defined and prioritised categories can be used as reference.
  /// If the referenceLayer and/or the referenceCategory do not exist, then the function will set
  /// the priority as rendered after all layers and categories.
  ///
  /// [referenceLayer] The beforehand defined layer name which renders directly before the current layer.
  ///
  /// [referenceCategory] The beforehand defined category name which renders directly before the current layer.
  ///
  /// Returns [MapLayerPriorityBuilder]. This class instance.
  ///
  MapLayerPriorityBuilder renderedAfterLayerWithCategory(String referenceLayer, String referenceCategory);
  /// Constructs a MapLayerPriority.
  ///
  /// The builder is then empty and can be re-used to generate a new
  /// MapLayerPriority.
  ///
  /// Returns [MapLayerPriority]. A new MapLayerPriority instance.
  ///
  MapLayerPriority build();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapLayerPriorityBuilder$Impl(Pointer<Void>.fromAddress(0));
}


// MapLayerPriorityBuilder "private" section, not exported.

final _sdkMapviewMaplayerprioritybuilderRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapLayerPriorityBuilder_register_finalizer'));
final _sdkMapviewMaplayerprioritybuilderCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerPriorityBuilder_copy_handle'));
final _sdkMapviewMaplayerprioritybuilderReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapLayerPriorityBuilder_release_handle'));











/// @nodoc
@visibleForTesting
class MapLayerPriorityBuilder$Impl extends __lib.NativeBase implements MapLayerPriorityBuilder {

  MapLayerPriorityBuilder$Impl(Pointer<Void> handle) : super(handle);


  MapLayerPriorityBuilder create() {
    final _result_handle = _create();
    final _result = MapLayerPriorityBuilder$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkMapviewMaplayerprioritybuilderRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _create() {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_mapview_MapLayerPriorityBuilder_create'));
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  @override
  MapLayerPriorityBuilder withCategory(String category) {
    final _withCategoryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapLayerPriorityBuilder_withCategory__String'));
    final _categoryHandle = stringToFfi(category);
    final _handle = this.handle;
    final __resultHandle = _withCategoryFfi(_handle, __lib.LibraryContext.isolateId, _categoryHandle);
    stringReleaseFfiHandle(_categoryHandle);
    try {
      return sdkMapviewMaplayerprioritybuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerprioritybuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapLayerPriorityBuilder renderedFirst() {
    final _renderedFirstFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapLayerPriorityBuilder_renderedFirst'));
    final _handle = this.handle;
    final __resultHandle = _renderedFirstFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMaplayerprioritybuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerprioritybuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapLayerPriorityBuilder renderedLast() {
    final _renderedLastFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapLayerPriorityBuilder_renderedLast'));
    final _handle = this.handle;
    final __resultHandle = _renderedLastFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMaplayerprioritybuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerprioritybuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapLayerPriorityBuilder renderedBeforeLayer(String referenceLayer) {
    final _renderedBeforeLayerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapLayerPriorityBuilder_renderedBeforeLayer__String'));
    final _referenceLayerHandle = stringToFfi(referenceLayer);
    final _handle = this.handle;
    final __resultHandle = _renderedBeforeLayerFfi(_handle, __lib.LibraryContext.isolateId, _referenceLayerHandle);
    stringReleaseFfiHandle(_referenceLayerHandle);
    try {
      return sdkMapviewMaplayerprioritybuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerprioritybuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapLayerPriorityBuilder renderedBeforeLayerWithCategory(String referenceLayer, String referenceCategory) {
    final _renderedBeforeLayerWithCategoryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapLayerPriorityBuilder_renderedBeforeLayer__String_String'));
    final _referenceLayerHandle = stringToFfi(referenceLayer);
    final _referenceCategoryHandle = stringToFfi(referenceCategory);
    final _handle = this.handle;
    final __resultHandle = _renderedBeforeLayerWithCategoryFfi(_handle, __lib.LibraryContext.isolateId, _referenceLayerHandle, _referenceCategoryHandle);
    stringReleaseFfiHandle(_referenceLayerHandle);
    stringReleaseFfiHandle(_referenceCategoryHandle);
    try {
      return sdkMapviewMaplayerprioritybuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerprioritybuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapLayerPriorityBuilder renderedAfterLayer(String referenceLayer) {
    final _renderedAfterLayerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapLayerPriorityBuilder_renderedAfterLayer__String'));
    final _referenceLayerHandle = stringToFfi(referenceLayer);
    final _handle = this.handle;
    final __resultHandle = _renderedAfterLayerFfi(_handle, __lib.LibraryContext.isolateId, _referenceLayerHandle);
    stringReleaseFfiHandle(_referenceLayerHandle);
    try {
      return sdkMapviewMaplayerprioritybuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerprioritybuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapLayerPriorityBuilder renderedAfterLayerWithCategory(String referenceLayer, String referenceCategory) {
    final _renderedAfterLayerWithCategoryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapLayerPriorityBuilder_renderedAfterLayer__String_String'));
    final _referenceLayerHandle = stringToFfi(referenceLayer);
    final _referenceCategoryHandle = stringToFfi(referenceCategory);
    final _handle = this.handle;
    final __resultHandle = _renderedAfterLayerWithCategoryFfi(_handle, __lib.LibraryContext.isolateId, _referenceLayerHandle, _referenceCategoryHandle);
    stringReleaseFfiHandle(_referenceLayerHandle);
    stringReleaseFfiHandle(_referenceCategoryHandle);
    try {
      return sdkMapviewMaplayerprioritybuilderFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerprioritybuilderReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapLayerPriority build() {
    final _buildFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapLayerPriorityBuilder_build'));
    final _handle = this.handle;
    final __resultHandle = _buildFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMaplayerpriorityFromFfi(__resultHandle);
    } finally {
      sdkMapviewMaplayerpriorityReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkMapviewMaplayerprioritybuilderToFfi(MapLayerPriorityBuilder value) =>
  _sdkMapviewMaplayerprioritybuilderCopyHandle((value as __lib.NativeBase).handle);

MapLayerPriorityBuilder sdkMapviewMaplayerprioritybuilderFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapLayerPriorityBuilder) return instance;

  final _copiedHandle = _sdkMapviewMaplayerprioritybuilderCopyHandle(handle);
  final result = MapLayerPriorityBuilder$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMaplayerprioritybuilderRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMaplayerprioritybuilderReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMaplayerprioritybuilderReleaseHandle(handle);

Pointer<Void> sdkMapviewMaplayerprioritybuilderToFfiNullable(MapLayerPriorityBuilder? value) =>
  value != null ? sdkMapviewMaplayerprioritybuilderToFfi(value) : Pointer<Void>.fromAddress(0);

MapLayerPriorityBuilder? sdkMapviewMaplayerprioritybuilderFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMaplayerprioritybuilderFromFfi(handle) : null;

void sdkMapviewMaplayerprioritybuilderReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMaplayerprioritybuilderReleaseHandle(handle);

// End of MapLayerPriorityBuilder "private" section.


