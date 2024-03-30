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
import 'package:here_sdk/src/sdk/mapview/map_measure.dart';
import 'package:meta/meta.dart';


/// A map measure range.
@immutable
class MapMeasureRange {
  /// The kind of measure represented by value.
  final MapMeasureKind kind;

  /// The minimum measure value.
  final double minimumValue;

  /// The maximum measure value.
  final double maximumValue;

  const MapMeasureRange._(this.kind, this.minimumValue, this.maximumValue);
  /// Constructs a MapMeasureRange from the kind and range values.
  ///
  /// [kind] The measure kind.
  ///
  /// [minimumValue] The minimum measure value.
  ///
  /// [maximumValue] The maximum measure value.
  ///
  factory MapMeasureRange(MapMeasureKind kind, double minimumValue, double maximumValue) => $prototype.create(kind, minimumValue, maximumValue);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MapMeasureRange) return false;
    MapMeasureRange _other = other;
    return kind == _other.kind &&
        minimumValue == _other.minimumValue &&
        maximumValue == _other.maximumValue;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + kind.hashCode;
    result = 31 * result + minimumValue.hashCode;
    result = 31 * result + maximumValue.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapMeasureRange$Impl();
}


// MapMeasureRange "private" section, not exported.

final _sdkMapviewMapmeasurerangeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Double, Double),
    Pointer<Void> Function(int, double, double)
  >('here_sdk_sdk_mapview_MapMeasureRange_create_handle'));
final _sdkMapviewMapmeasurerangeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureRange_release_handle'));
final _sdkMapviewMapmeasurerangeGetFieldkind = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureRange_get_field_kind'));
final _sdkMapviewMapmeasurerangeGetFieldminimumValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureRange_get_field_minimumValue'));
final _sdkMapviewMapmeasurerangeGetFieldmaximumValue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureRange_get_field_maximumValue'));



/// @nodoc
@visibleForTesting
class MapMeasureRange$Impl {
  MapMeasureRange create(MapMeasureKind kind, double minimumValue, double maximumValue) {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Double, Double), Pointer<Void> Function(int, int, double, double)>('here_sdk_sdk_mapview_MapMeasureRange_create__Kind_Double_Double'));
    final _kindHandle = sdkMapviewMapmeasureKindToFfi(kind);
    final _minimumValueHandle = (minimumValue);
    final _maximumValueHandle = (maximumValue);
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId, _kindHandle, _minimumValueHandle, _maximumValueHandle);
    sdkMapviewMapmeasureKindReleaseFfiHandle(_kindHandle);


    try {
      return sdkMapviewMapmeasurerangeFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmeasurerangeReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkMapviewMapmeasurerangeToFfi(MapMeasureRange value) {
  final _kindHandle = sdkMapviewMapmeasureKindToFfi(value.kind);
  final _minimumValueHandle = (value.minimumValue);
  final _maximumValueHandle = (value.maximumValue);
  final _result = _sdkMapviewMapmeasurerangeCreateHandle(_kindHandle, _minimumValueHandle, _maximumValueHandle);
  sdkMapviewMapmeasureKindReleaseFfiHandle(_kindHandle);
  
  
  return _result;
}

MapMeasureRange sdkMapviewMapmeasurerangeFromFfi(Pointer<Void> handle) {
  final _kindHandle = _sdkMapviewMapmeasurerangeGetFieldkind(handle);
  final _minimumValueHandle = _sdkMapviewMapmeasurerangeGetFieldminimumValue(handle);
  final _maximumValueHandle = _sdkMapviewMapmeasurerangeGetFieldmaximumValue(handle);
  try {
    return MapMeasureRange._(
      sdkMapviewMapmeasureKindFromFfi(_kindHandle), 
      (_minimumValueHandle), 
      (_maximumValueHandle)
    );
  } finally {
    sdkMapviewMapmeasureKindReleaseFfiHandle(_kindHandle);
    
    
  }
}

void sdkMapviewMapmeasurerangeReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewMapmeasurerangeReleaseHandle(handle);

// Nullable MapMeasureRange

final _sdkMapviewMapmeasurerangeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureRange_create_handle_nullable'));
final _sdkMapviewMapmeasurerangeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureRange_release_handle_nullable'));
final _sdkMapviewMapmeasurerangeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasureRange_get_value_nullable'));

Pointer<Void> sdkMapviewMapmeasurerangeToFfiNullable(MapMeasureRange? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapmeasurerangeToFfi(value);
  final result = _sdkMapviewMapmeasurerangeCreateHandleNullable(_handle);
  sdkMapviewMapmeasurerangeReleaseFfiHandle(_handle);
  return result;
}

MapMeasureRange? sdkMapviewMapmeasurerangeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapmeasurerangeGetValueNullable(handle);
  final result = sdkMapviewMapmeasurerangeFromFfi(_handle);
  sdkMapviewMapmeasurerangeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapmeasurerangeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmeasurerangeReleaseHandleNullable(handle);

// End of MapMeasureRange "private" section.


