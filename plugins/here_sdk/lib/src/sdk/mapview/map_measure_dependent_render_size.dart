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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/mapview/map_measure.dart';
import 'package:here_sdk/src/sdk/mapview/render_size.dart';
import 'package:meta/meta.dart';

final _$initsdkMapviewMapmeasuredependentrendersizeMakeKindUnitMapofDoubleToDoubleReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_make__Kind_Unit_MapOf_Double_to_Double_return_release_handle'));
final _$initsdkMapviewMapmeasuredependentrendersizeMakeKindUnitMapofDoubleToDoubleReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_make__Kind_Unit_MapOf_Double_to_Double_return_get_result'));
final _$initsdkMapviewMapmeasuredependentrendersizeMakeKindUnitMapofDoubleToDoubleReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_make__Kind_Unit_MapOf_Double_to_Double_return_get_error'));
final _$initsdkMapviewMapmeasuredependentrendersizeMakeKindUnitMapofDoubleToDoubleReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_make__Kind_Unit_MapOf_Double_to_Double_return_has_error'));


final _withSingleSizesdkMapviewMapmeasuredependentrendersizeMakeUnitDoubleReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_make__Unit_Double_return_release_handle'));
final _withSingleSizesdkMapviewMapmeasuredependentrendersizeMakeUnitDoubleReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_make__Unit_Double_return_get_result'));
final _withSingleSizesdkMapviewMapmeasuredependentrendersizeMakeUnitDoubleReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_make__Unit_Double_return_get_error'));
final _withSingleSizesdkMapviewMapmeasuredependentrendersizeMakeUnitDoubleReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_make__Unit_Double_return_has_error'));


/// Represents a render size, described as map measure dependent values.
///
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
/// behavior. Related APIs may change for new releases without a deprecation process.
@immutable
class MapMeasureDependentRenderSize {
  /// The unit used for the key in [MapMeasureDependentRenderSize.sizes].
  final MapMeasureKind measureKind;

  /// The unit used for the value in [MapMeasureDependentRenderSize.sizes].
  final RenderSizeUnit sizeUnit;

  /// The dictionary describing the size (value) per map measure (key).
  /// Units of keys and values are defined in [MapMeasureDependentRenderSize.measureKind] and [MapMeasureDependentRenderSize.sizeUnit]
  /// `sizes` with a single entry indicates using a fixed size value across all map measures.
  final Map<double, double> sizes;

  const MapMeasureDependentRenderSize._(this.measureKind, this.sizeUnit, this.sizes);
  /// Constructs a MapMeasureDependentRenderSize from given parameters.
  ///
  /// [measureKind] The unit used for the key in `sizes`.
  ///
  /// [sizeUnit] The unit used for the value in `sizes`.
  ///
  /// [sizes] The dictionary describing the size (value) per map measure (key).
  /// Units of keys and values are defined in `measureKind` and `sizeUnit`.
  /// Map measure (key) and size (value) must not be negative.
  /// `sizes` with a single entry indicates using a fixed size value across all map measures.
  ///
  /// Throws [MapMeasureDependentRenderSizeInstantiationException]. Instantiation error if `sizes` map is empty or contains negative keys or values.
  ///
  factory MapMeasureDependentRenderSize(MapMeasureKind measureKind, RenderSizeUnit sizeUnit, Map<double, double> sizes) => $prototype.$init(measureKind, sizeUnit, sizes);
  /// Constructs a MapMeasureDependentRenderSize from single size value which is constant across all map measures.
  ///
  /// Uses key 0 in the [MapMeasureDependentRenderSize.sizes] dictionary for the size value and [MapMeasureKind.zoomLevel] as measureKind.
  ///
  /// [sizeUnit] The unit used for the value in `size`.
  ///
  /// [size] The size independent of map measure.
  /// The given value is stored in [MapMeasureDependentRenderSize.sizes] property at key 0 regardless of [MapMeasureDependentRenderSize.measureKind].
  /// Must not be negative.
  ///
  /// Throws [MapMeasureDependentRenderSizeInstantiationException]. Instantiation error if `size` is negative.
  ///
  factory MapMeasureDependentRenderSize.withSingleSize(RenderSizeUnit sizeUnit, double size) => $prototype.withSingleSize(sizeUnit, size);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MapMeasureDependentRenderSize) return false;
    MapMeasureDependentRenderSize _other = other;
    return measureKind == _other.measureKind &&
        sizeUnit == _other.sizeUnit &&
        DeepCollectionEquality().equals(sizes, _other.sizes);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + measureKind.hashCode;
    result = 31 * result + sizeUnit.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(sizes);
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapMeasureDependentRenderSize$Impl();
}

/// Describes a reason for failing to create a [MapMeasureDependentRenderSize].
enum MapMeasureDependentRenderSizeInstantiationErrorCode {
    /// `sizes` dictionary is empty
    emptySizes,
    /// Negative map measure in `sizes` dictionary
    negativeMapMeasure,
    /// Negative size in in `sizes` dictionary
    negativeSize
}

// MapMeasureDependentRenderSizeInstantiationErrorCode "private" section, not exported.

int sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeToFfi(MapMeasureDependentRenderSizeInstantiationErrorCode value) {
  switch (value) {
  case MapMeasureDependentRenderSizeInstantiationErrorCode.emptySizes:
    return 1;
  case MapMeasureDependentRenderSizeInstantiationErrorCode.negativeMapMeasure:
    return 2;
  case MapMeasureDependentRenderSizeInstantiationErrorCode.negativeSize:
    return 3;
  default:
    throw StateError("Invalid enum value $value for MapMeasureDependentRenderSizeInstantiationErrorCode enum.");
  }
}

MapMeasureDependentRenderSizeInstantiationErrorCode sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return MapMeasureDependentRenderSizeInstantiationErrorCode.emptySizes;
  case 2:
    return MapMeasureDependentRenderSizeInstantiationErrorCode.negativeMapMeasure;
  case 3:
    return MapMeasureDependentRenderSizeInstantiationErrorCode.negativeSize;
  default:
    throw StateError("Invalid numeric value $handle for MapMeasureDependentRenderSizeInstantiationErrorCode enum.");
  }
}

void sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeReleaseFfiHandle(int handle) {}

final _sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_InstantiationErrorCode_create_handle_nullable'));
final _sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_InstantiationErrorCode_release_handle_nullable'));
final _sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeToFfiNullable(MapMeasureDependentRenderSizeInstantiationErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeToFfi(value);
  final result = _sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeCreateHandleNullable(_handle);
  sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

MapMeasureDependentRenderSizeInstantiationErrorCode? sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeGetValueNullable(handle);
  final result = sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeFromFfi(_handle);
  sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeReleaseHandleNullable(handle);

// End of MapMeasureDependentRenderSizeInstantiationErrorCode "private" section.
/// Thrown when a problem occurs while trying to create [MapMeasureDependentRenderSize].
class MapMeasureDependentRenderSizeInstantiationException implements Exception {
  final MapMeasureDependentRenderSizeInstantiationErrorCode error;
  MapMeasureDependentRenderSizeInstantiationException(this.error);
}

// MapMeasureDependentRenderSize "private" section, not exported.

final _sdkMapviewMapmeasuredependentrendersizeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Uint32, Pointer<Void>),
    Pointer<Void> Function(int, int, Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_create_handle'));
final _sdkMapviewMapmeasuredependentrendersizeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_release_handle'));
final _sdkMapviewMapmeasuredependentrendersizeGetFieldmeasureKind = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_get_field_measureKind'));
final _sdkMapviewMapmeasuredependentrendersizeGetFieldsizeUnit = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_get_field_sizeUnit'));
final _sdkMapviewMapmeasuredependentrendersizeGetFieldsizes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_get_field_sizes'));



/// @nodoc
@visibleForTesting
class MapMeasureDependentRenderSize$Impl {
  MapMeasureDependentRenderSize $init(MapMeasureKind measureKind, RenderSizeUnit sizeUnit, Map<double, double> sizes) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Uint32, Pointer<Void>), Pointer<Void> Function(int, int, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_make__Kind_Unit_MapOf_Double_to_Double'));
    final _measureKindHandle = sdkMapviewMapmeasureKindToFfi(measureKind);
    final _sizeUnitHandle = sdkMapviewRendersizeUnitToFfi(sizeUnit);
    final _sizesHandle = harpSdkBindingsmapofDoubleToDoubleToFfi(sizes);
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId, _measureKindHandle, _sizeUnitHandle, _sizesHandle);
    sdkMapviewMapmeasureKindReleaseFfiHandle(_measureKindHandle);
    sdkMapviewRendersizeUnitReleaseFfiHandle(_sizeUnitHandle);
    harpSdkBindingsmapofDoubleToDoubleReleaseFfiHandle(_sizesHandle);
    if (_$initsdkMapviewMapmeasuredependentrendersizeMakeKindUnitMapofDoubleToDoubleReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initsdkMapviewMapmeasuredependentrendersizeMakeKindUnitMapofDoubleToDoubleReturnGetError(__callResultHandle);
        _$initsdkMapviewMapmeasuredependentrendersizeMakeKindUnitMapofDoubleToDoubleReturnReleaseHandle(__callResultHandle);
        try {
          throw MapMeasureDependentRenderSizeInstantiationException(sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initsdkMapviewMapmeasuredependentrendersizeMakeKindUnitMapofDoubleToDoubleReturnGetResult(__callResultHandle);
    _$initsdkMapviewMapmeasuredependentrendersizeMakeKindUnitMapofDoubleToDoubleReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMapviewMapmeasuredependentrendersizeFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(__resultHandle);

    }

  }

  MapMeasureDependentRenderSize withSingleSize(RenderSizeUnit sizeUnit, double size) {
    final _withSingleSizeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Double), Pointer<Void> Function(int, int, double)>('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_make__Unit_Double'));
    final _sizeUnitHandle = sdkMapviewRendersizeUnitToFfi(sizeUnit);
    final _sizeHandle = (size);
    final __callResultHandle = _withSingleSizeFfi(__lib.LibraryContext.isolateId, _sizeUnitHandle, _sizeHandle);
    sdkMapviewRendersizeUnitReleaseFfiHandle(_sizeUnitHandle);

    if (_withSingleSizesdkMapviewMapmeasuredependentrendersizeMakeUnitDoubleReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withSingleSizesdkMapviewMapmeasuredependentrendersizeMakeUnitDoubleReturnGetError(__callResultHandle);
        _withSingleSizesdkMapviewMapmeasuredependentrendersizeMakeUnitDoubleReturnReleaseHandle(__callResultHandle);
        try {
          throw MapMeasureDependentRenderSizeInstantiationException(sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapmeasuredependentrendersizeInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withSingleSizesdkMapviewMapmeasuredependentrendersizeMakeUnitDoubleReturnGetResult(__callResultHandle);
    _withSingleSizesdkMapviewMapmeasuredependentrendersizeMakeUnitDoubleReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMapviewMapmeasuredependentrendersizeFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkMapviewMapmeasuredependentrendersizeToFfi(MapMeasureDependentRenderSize value) {
  final _measureKindHandle = sdkMapviewMapmeasureKindToFfi(value.measureKind);
  final _sizeUnitHandle = sdkMapviewRendersizeUnitToFfi(value.sizeUnit);
  final _sizesHandle = harpSdkBindingsmapofDoubleToDoubleToFfi(value.sizes);
  final _result = _sdkMapviewMapmeasuredependentrendersizeCreateHandle(_measureKindHandle, _sizeUnitHandle, _sizesHandle);
  sdkMapviewMapmeasureKindReleaseFfiHandle(_measureKindHandle);
  sdkMapviewRendersizeUnitReleaseFfiHandle(_sizeUnitHandle);
  harpSdkBindingsmapofDoubleToDoubleReleaseFfiHandle(_sizesHandle);
  return _result;
}

MapMeasureDependentRenderSize sdkMapviewMapmeasuredependentrendersizeFromFfi(Pointer<Void> handle) {
  final _measureKindHandle = _sdkMapviewMapmeasuredependentrendersizeGetFieldmeasureKind(handle);
  final _sizeUnitHandle = _sdkMapviewMapmeasuredependentrendersizeGetFieldsizeUnit(handle);
  final _sizesHandle = _sdkMapviewMapmeasuredependentrendersizeGetFieldsizes(handle);
  try {
    return MapMeasureDependentRenderSize._(
      sdkMapviewMapmeasureKindFromFfi(_measureKindHandle), 
      sdkMapviewRendersizeUnitFromFfi(_sizeUnitHandle), 
      harpSdkBindingsmapofDoubleToDoubleFromFfi(_sizesHandle)
    );
  } finally {
    sdkMapviewMapmeasureKindReleaseFfiHandle(_measureKindHandle);
    sdkMapviewRendersizeUnitReleaseFfiHandle(_sizeUnitHandle);
    harpSdkBindingsmapofDoubleToDoubleReleaseFfiHandle(_sizesHandle);
  }
}

void sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewMapmeasuredependentrendersizeReleaseHandle(handle);

// Nullable MapMeasureDependentRenderSize

final _sdkMapviewMapmeasuredependentrendersizeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_create_handle_nullable'));
final _sdkMapviewMapmeasuredependentrendersizeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_release_handle_nullable'));
final _sdkMapviewMapmeasuredependentrendersizeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureDependentRenderSize_get_value_nullable'));

Pointer<Void> sdkMapviewMapmeasuredependentrendersizeToFfiNullable(MapMeasureDependentRenderSize? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapmeasuredependentrendersizeToFfi(value);
  final result = _sdkMapviewMapmeasuredependentrendersizeCreateHandleNullable(_handle);
  sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_handle);
  return result;
}

MapMeasureDependentRenderSize? sdkMapviewMapmeasuredependentrendersizeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapmeasuredependentrendersizeGetValueNullable(handle);
  final result = sdkMapviewMapmeasuredependentrendersizeFromFfi(_handle);
  sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapmeasuredependentrendersizeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmeasuredependentrendersizeReleaseHandleNullable(handle);

// End of MapMeasureDependentRenderSize "private" section.


