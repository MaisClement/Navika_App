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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/travel_direction.dart';
import 'package:meta/meta.dart';


/// Reference to a segment id with a travel direction.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class SegmentReference {
  /// Topology segment id representing a unique identifier within the HERE platform catalogs.
  String segmentId;

  /// Travel direction of the segment.
  TravelDirection travelDirection;

  /// The start offset is a non-negative number between 0 and 1, representing the start of the referenced range using a proportion of the length of the segment. 0 represents the start and 1 the end of the segment, relative to the indicated direction (or positive direction in case of undirected segments)
  double offsetStart;

  /// The end offset is a non-negative number between 0 and 1, representing the end of the referenced range using a proportion of the length of the segment. 0 represents the start and 1 the end of the segment, relative to the indicated direction (or positive direction in case of undirected segments)
  double offsetEnd;

  /// HERE tile partition id (Morton-encoding + level indicator) of the segment.
  /// As in HERE Map Content.
  int tilePartitionId;

  /// Local ID of the segment inside the OCM tile.
  int? localId;

  /// Creates a new instance.

  /// [segmentId] Topology segment id representing a unique identifier within the HERE platform catalogs.

  /// [travelDirection] Travel direction of the segment.

  /// [offsetStart] The start offset is a non-negative number between 0 and 1, representing the start of the referenced range using a proportion of the length of the segment. 0 represents the start and 1 the end of the segment, relative to the indicated direction (or positive direction in case of undirected segments)

  /// [offsetEnd] The end offset is a non-negative number between 0 and 1, representing the end of the referenced range using a proportion of the length of the segment. 0 represents the start and 1 the end of the segment, relative to the indicated direction (or positive direction in case of undirected segments)

  /// [tilePartitionId] HERE tile partition id (Morton-encoding + level indicator) of the segment.
  /// As in HERE Map Content.

  /// [localId] Local ID of the segment inside the OCM tile.

  SegmentReference([String segmentId = "", TravelDirection travelDirection = TravelDirection.bidirectional, double offsetStart = 0.0, double offsetEnd = 1.0, int tilePartitionId = 0, int? localId = 0])
    : segmentId = segmentId, travelDirection = travelDirection, offsetStart = offsetStart, offsetEnd = offsetEnd, tilePartitionId = tilePartitionId, localId = localId;
  /// Creates a new instance.
  SegmentReference.withDefaults()
      : segmentId = "", travelDirection = TravelDirection.bidirectional, offsetStart = 0.0, offsetEnd = 1.0, tilePartitionId = 0, localId = 0;
  /// Returns an instance of this struct from a string if it's well-formatted, `null` otherwise.
  ///
  /// [segmentRef] The string to parse
  ///
  /// Returns [SegmentReference?]. An instance of [SegmentReference] from a string if it's well-formatted, `null` otherwise.
  ///
  static SegmentReference? fromString(String segmentRef) => $prototype.fromString(segmentRef);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SegmentReference) return false;
    SegmentReference _other = other;
    return segmentId == _other.segmentId &&
        travelDirection == _other.travelDirection &&
        offsetStart == _other.offsetStart &&
        offsetEnd == _other.offsetEnd &&
        tilePartitionId == _other.tilePartitionId &&
        localId == _other.localId;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + segmentId.hashCode;
    result = 31 * result + travelDirection.hashCode;
    result = 31 * result + offsetStart.hashCode;
    result = 31 * result + offsetEnd.hashCode;
    result = 31 * result + tilePartitionId.hashCode;
    result = 31 * result + localId.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SegmentReference$Impl();
}


// SegmentReference "private" section, not exported.

final _sdkRoutingSegmentreferenceCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Uint32, Double, Double, Uint32, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, int, double, double, int, Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_create_handle'));
final _sdkRoutingSegmentreferenceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_release_handle'));
final _sdkRoutingSegmentreferenceGetFieldsegmentId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_get_field_segmentId'));
final _sdkRoutingSegmentreferenceGetFieldtravelDirection = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_get_field_travelDirection'));
final _sdkRoutingSegmentreferenceGetFieldoffsetStart = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_get_field_offsetStart'));
final _sdkRoutingSegmentreferenceGetFieldoffsetEnd = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_get_field_offsetEnd'));
final _sdkRoutingSegmentreferenceGetFieldtilePartitionId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_get_field_tilePartitionId'));
final _sdkRoutingSegmentreferenceGetFieldlocalId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_get_field_localId'));



/// @nodoc
@visibleForTesting
class SegmentReference$Impl {
  SegmentReference? fromString(String segmentRef) {
    final _fromStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_SegmentReference_fromString__String'));
    final _segmentRefHandle = stringToFfi(segmentRef);
    final __resultHandle = _fromStringFfi(__lib.LibraryContext.isolateId, _segmentRefHandle);
    stringReleaseFfiHandle(_segmentRefHandle);
    try {
      return sdkRoutingSegmentreferenceFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingSegmentreferenceReleaseFfiHandleNullable(__resultHandle);

    }

  }

}

Pointer<Void> sdkRoutingSegmentreferenceToFfi(SegmentReference value) {
  final _segmentIdHandle = stringToFfi(value.segmentId);
  final _travelDirectionHandle = sdkRoutingTraveldirectionToFfi(value.travelDirection);
  final _offsetStartHandle = (value.offsetStart);
  final _offsetEndHandle = (value.offsetEnd);
  final _tilePartitionIdHandle = (value.tilePartitionId);
  final _localIdHandle = uIntToFfiNullable(value.localId);
  final _result = _sdkRoutingSegmentreferenceCreateHandle(_segmentIdHandle, _travelDirectionHandle, _offsetStartHandle, _offsetEndHandle, _tilePartitionIdHandle, _localIdHandle);
  stringReleaseFfiHandle(_segmentIdHandle);
  sdkRoutingTraveldirectionReleaseFfiHandle(_travelDirectionHandle);
  
  
  
  uIntReleaseFfiHandleNullable(_localIdHandle);
  return _result;
}

SegmentReference sdkRoutingSegmentreferenceFromFfi(Pointer<Void> handle) {
  final _segmentIdHandle = _sdkRoutingSegmentreferenceGetFieldsegmentId(handle);
  final _travelDirectionHandle = _sdkRoutingSegmentreferenceGetFieldtravelDirection(handle);
  final _offsetStartHandle = _sdkRoutingSegmentreferenceGetFieldoffsetStart(handle);
  final _offsetEndHandle = _sdkRoutingSegmentreferenceGetFieldoffsetEnd(handle);
  final _tilePartitionIdHandle = _sdkRoutingSegmentreferenceGetFieldtilePartitionId(handle);
  final _localIdHandle = _sdkRoutingSegmentreferenceGetFieldlocalId(handle);
  try {
    return SegmentReference(
      stringFromFfi(_segmentIdHandle), 
      sdkRoutingTraveldirectionFromFfi(_travelDirectionHandle), 
      (_offsetStartHandle), 
      (_offsetEndHandle), 
      (_tilePartitionIdHandle), 
      uIntFromFfiNullable(_localIdHandle)
    );
  } finally {
    stringReleaseFfiHandle(_segmentIdHandle);
    sdkRoutingTraveldirectionReleaseFfiHandle(_travelDirectionHandle);
    
    
    
    uIntReleaseFfiHandleNullable(_localIdHandle);
  }
}

void sdkRoutingSegmentreferenceReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingSegmentreferenceReleaseHandle(handle);

// Nullable SegmentReference

final _sdkRoutingSegmentreferenceCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_create_handle_nullable'));
final _sdkRoutingSegmentreferenceReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_release_handle_nullable'));
final _sdkRoutingSegmentreferenceGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SegmentReference_get_value_nullable'));

Pointer<Void> sdkRoutingSegmentreferenceToFfiNullable(SegmentReference? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingSegmentreferenceToFfi(value);
  final result = _sdkRoutingSegmentreferenceCreateHandleNullable(_handle);
  sdkRoutingSegmentreferenceReleaseFfiHandle(_handle);
  return result;
}

SegmentReference? sdkRoutingSegmentreferenceFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingSegmentreferenceGetValueNullable(handle);
  final result = sdkRoutingSegmentreferenceFromFfi(_handle);
  sdkRoutingSegmentreferenceReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingSegmentreferenceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingSegmentreferenceReleaseHandleNullable(handle);

// End of SegmentReference "private" section.


