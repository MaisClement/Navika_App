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
import 'package:meta/meta.dart';


/// A map measure.
@immutable
class MapMeasure {
  /// The kind of measure represented by value.
  final MapMeasureKind kind;

  /// The measure value.
  final double value;

  const MapMeasure._(this.kind, this.value);
  /// Constructs a MapMeasure from the kind and value.
  ///
  /// [kind] The measure kind.
  ///
  /// [value] The measure value.
  ///
  factory MapMeasure(MapMeasureKind kind, double value) => $prototype.create(kind, value);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MapMeasure) return false;
    MapMeasure _other = other;
    return kind == _other.kind &&
        value == _other.value;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + kind.hashCode;
    result = 31 * result + value.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapMeasure$Impl();
}

/// Kinds of measures.
enum MapMeasureKind {
    /// The measure kind distance, in meters.
    distance,
    /// The measure kind zoom level.
    zoomLevel,
    /// The measure kind scale, in meters on screen per meters in geo space.
    scale
}

// MapMeasureKind "private" section, not exported.

int sdkMapviewMapmeasureKindToFfi(MapMeasureKind value) {
  switch (value) {
  case MapMeasureKind.distance:
    return 0;
  case MapMeasureKind.zoomLevel:
    return 1;
  case MapMeasureKind.scale:
    return 2;
  default:
    throw StateError("Invalid enum value $value for MapMeasureKind enum.");
  }
}

MapMeasureKind sdkMapviewMapmeasureKindFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MapMeasureKind.distance;
  case 1:
    return MapMeasureKind.zoomLevel;
  case 2:
    return MapMeasureKind.scale;
  default:
    throw StateError("Invalid numeric value $handle for MapMeasureKind enum.");
  }
}

void sdkMapviewMapmeasureKindReleaseFfiHandle(int handle) {}

final _sdkMapviewMapmeasureKindCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapMeasure_Kind_create_handle_nullable'));
final _sdkMapviewMapmeasureKindReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasure_Kind_release_handle_nullable'));
final _sdkMapviewMapmeasureKindGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasure_Kind_get_value_nullable'));

Pointer<Void> sdkMapviewMapmeasureKindToFfiNullable(MapMeasureKind? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapmeasureKindToFfi(value);
  final result = _sdkMapviewMapmeasureKindCreateHandleNullable(_handle);
  sdkMapviewMapmeasureKindReleaseFfiHandle(_handle);
  return result;
}

MapMeasureKind? sdkMapviewMapmeasureKindFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapmeasureKindGetValueNullable(handle);
  final result = sdkMapviewMapmeasureKindFromFfi(_handle);
  sdkMapviewMapmeasureKindReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapmeasureKindReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmeasureKindReleaseHandleNullable(handle);

// End of MapMeasureKind "private" section.

// MapMeasure "private" section, not exported.

final _sdkMapviewMapmeasureCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Double),
    Pointer<Void> Function(int, double)
  >('here_sdk_sdk_mapview_MapMeasure_create_handle'));
final _sdkMapviewMapmeasureReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasure_release_handle'));
final _sdkMapviewMapmeasureGetFieldkind = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasure_get_field_kind'));
final _sdkMapviewMapmeasureGetFieldvalue = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasure_get_field_value'));



/// @nodoc
@visibleForTesting
class MapMeasure$Impl {
  MapMeasure create(MapMeasureKind kind, double value) {
    final _createFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Double), Pointer<Void> Function(int, int, double)>('here_sdk_sdk_mapview_MapMeasure_create__Kind_Double'));
    final _kindHandle = sdkMapviewMapmeasureKindToFfi(kind);
    final _valueHandle = (value);
    final __resultHandle = _createFfi(__lib.LibraryContext.isolateId, _kindHandle, _valueHandle);
    sdkMapviewMapmeasureKindReleaseFfiHandle(_kindHandle);

    try {
      return sdkMapviewMapmeasureFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmeasureReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkMapviewMapmeasureToFfi(MapMeasure value) {
  final _kindHandle = sdkMapviewMapmeasureKindToFfi(value.kind);
  final _valueHandle = (value.value);
  final _result = _sdkMapviewMapmeasureCreateHandle(_kindHandle, _valueHandle);
  sdkMapviewMapmeasureKindReleaseFfiHandle(_kindHandle);
  
  return _result;
}

MapMeasure sdkMapviewMapmeasureFromFfi(Pointer<Void> handle) {
  final _kindHandle = _sdkMapviewMapmeasureGetFieldkind(handle);
  final _valueHandle = _sdkMapviewMapmeasureGetFieldvalue(handle);
  try {
    return MapMeasure._(
      sdkMapviewMapmeasureKindFromFfi(_kindHandle), 
      (_valueHandle)
    );
  } finally {
    sdkMapviewMapmeasureKindReleaseFfiHandle(_kindHandle);
    
  }
}

void sdkMapviewMapmeasureReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewMapmeasureReleaseHandle(handle);

// Nullable MapMeasure

final _sdkMapviewMapmeasureCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasure_create_handle_nullable'));
final _sdkMapviewMapmeasureReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasure_release_handle_nullable'));
final _sdkMapviewMapmeasureGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapMeasure_get_value_nullable'));

Pointer<Void> sdkMapviewMapmeasureToFfiNullable(MapMeasure? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapmeasureToFfi(value);
  final result = _sdkMapviewMapmeasureCreateHandleNullable(_handle);
  sdkMapviewMapmeasureReleaseFfiHandle(_handle);
  return result;
}

MapMeasure? sdkMapviewMapmeasureFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapmeasureGetValueNullable(handle);
  final result = sdkMapviewMapmeasureFromFfi(_handle);
  sdkMapviewMapmeasureReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapmeasureReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapmeasureReleaseHandleNullable(handle);

// End of MapMeasure "private" section.


