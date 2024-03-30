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
import 'package:here_sdk/src/sdk/routing/segment_reference.dart';

/// New base speed for a segment.
///
/// Affects route calculation and the ETA. Cannot increase base speed on segment.
///
/// **Note:** This option can only be used with the `RoutingEngine`. The `OfflineRoutingEngine` is not supported and the option will be ignored. Note that the `OfflineRoutingEngine` is only available for editions such as the _Navigate Edition_.

class MaxSpeedOnSegment {
  /// A segment for which the new base speed is specified. Only the `segmendId` and `travelDirection`
  /// parameters are used, other parameters are ignored. Setting a `segmendId` is mandatory.
  ///
  /// **Note:** The `SegmentReference` is not directly accessible from the map via the HERE SDK.
  /// Although, after route calculation you can retrieve the related segments for each [Span].
  /// The segment IDs are the same that are also used by, for example, the [Routing REST API](https://developer.here.com/documentation/routing-api/dev_guide/topics/use-cases/avoid-segments.html).
  /// These IDs are mostly stable and only change when the underlying map data changes
  /// due to a new road or similar changes in the real world.
  SegmentReference segment;

  /// New maximum value in m/s of baseSpeed on segment.  The provided value must be in the range \[1.0, 70.0\].
  /// Cannot increase base speed on segment. If the value is greater than the default base speed, then such penalty will have no effect.
  double baseSpeedInMetersPerSecond;

  /// Creates a new instance.

  /// [segment] A segment for which the new base speed is specified. Only the `segmendId` and `travelDirection`
  /// parameters are used, other parameters are ignored. Setting a `segmendId` is mandatory.
  ///
  /// **Note:** The `SegmentReference` is not directly accessible from the map via the HERE SDK.
  /// Although, after route calculation you can retrieve the related segments for each [Span].
  /// The segment IDs are the same that are also used by, for example, the [Routing REST API](https://developer.here.com/documentation/routing-api/dev_guide/topics/use-cases/avoid-segments.html).
  /// These IDs are mostly stable and only change when the underlying map data changes
  /// due to a new road or similar changes in the real world.

  /// [baseSpeedInMetersPerSecond] New maximum value in m/s of baseSpeed on segment.  The provided value must be in the range \[1.0, 70.0\].
  /// Cannot increase base speed on segment. If the value is greater than the default base speed, then such penalty will have no effect.

  MaxSpeedOnSegment(this.segment, this.baseSpeedInMetersPerSecond);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MaxSpeedOnSegment) return false;
    MaxSpeedOnSegment _other = other;
    return segment == _other.segment &&
        baseSpeedInMetersPerSecond == _other.baseSpeedInMetersPerSecond;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + segment.hashCode;
    result = 31 * result + baseSpeedInMetersPerSecond.hashCode;
    return result;
  }
}


// MaxSpeedOnSegment "private" section, not exported.

final _sdkRoutingMaxspeedonsegmentCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Double),
    Pointer<Void> Function(Pointer<Void>, double)
  >('here_sdk_sdk_routing_MaxSpeedOnSegment_create_handle'));
final _sdkRoutingMaxspeedonsegmentReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MaxSpeedOnSegment_release_handle'));
final _sdkRoutingMaxspeedonsegmentGetFieldsegment = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MaxSpeedOnSegment_get_field_segment'));
final _sdkRoutingMaxspeedonsegmentGetFieldbaseSpeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MaxSpeedOnSegment_get_field_baseSpeedInMetersPerSecond'));



Pointer<Void> sdkRoutingMaxspeedonsegmentToFfi(MaxSpeedOnSegment value) {
  final _segmentHandle = sdkRoutingSegmentreferenceToFfi(value.segment);
  final _baseSpeedInMetersPerSecondHandle = (value.baseSpeedInMetersPerSecond);
  final _result = _sdkRoutingMaxspeedonsegmentCreateHandle(_segmentHandle, _baseSpeedInMetersPerSecondHandle);
  sdkRoutingSegmentreferenceReleaseFfiHandle(_segmentHandle);
  
  return _result;
}

MaxSpeedOnSegment sdkRoutingMaxspeedonsegmentFromFfi(Pointer<Void> handle) {
  final _segmentHandle = _sdkRoutingMaxspeedonsegmentGetFieldsegment(handle);
  final _baseSpeedInMetersPerSecondHandle = _sdkRoutingMaxspeedonsegmentGetFieldbaseSpeedInMetersPerSecond(handle);
  try {
    return MaxSpeedOnSegment(
      sdkRoutingSegmentreferenceFromFfi(_segmentHandle), 
      (_baseSpeedInMetersPerSecondHandle)
    );
  } finally {
    sdkRoutingSegmentreferenceReleaseFfiHandle(_segmentHandle);
    
  }
}

void sdkRoutingMaxspeedonsegmentReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingMaxspeedonsegmentReleaseHandle(handle);

// Nullable MaxSpeedOnSegment

final _sdkRoutingMaxspeedonsegmentCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MaxSpeedOnSegment_create_handle_nullable'));
final _sdkRoutingMaxspeedonsegmentReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MaxSpeedOnSegment_release_handle_nullable'));
final _sdkRoutingMaxspeedonsegmentGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MaxSpeedOnSegment_get_value_nullable'));

Pointer<Void> sdkRoutingMaxspeedonsegmentToFfiNullable(MaxSpeedOnSegment? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingMaxspeedonsegmentToFfi(value);
  final result = _sdkRoutingMaxspeedonsegmentCreateHandleNullable(_handle);
  sdkRoutingMaxspeedonsegmentReleaseFfiHandle(_handle);
  return result;
}

MaxSpeedOnSegment? sdkRoutingMaxspeedonsegmentFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingMaxspeedonsegmentGetValueNullable(handle);
  final result = sdkRoutingMaxspeedonsegmentFromFfi(_handle);
  sdkRoutingMaxspeedonsegmentReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingMaxspeedonsegmentReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingMaxspeedonsegmentReleaseHandleNullable(handle);

// End of MaxSpeedOnSegment "private" section.


