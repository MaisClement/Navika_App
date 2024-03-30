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

/// Specifies how isoline calculation is optimized.
enum IsolineCalculationMode {
    /// Calculation of isoline focuses on quality, that is, the graph used for
    /// isoline calculation has higher granularity generating an isoline that is
    /// more precise.
    quality,
    /// Calculation of isoline is performance-centric, quality of isoline is
    /// reduced to provide better performance.
    performance,
    /// Calculation of isoline takes a balanced approach averaging between
    /// quality and performance.
    balanced
}

// IsolineCalculationMode "private" section, not exported.

int sdkRoutingIsolinecalculationmodeToFfi(IsolineCalculationMode value) {
  switch (value) {
  case IsolineCalculationMode.quality:
    return 0;
  case IsolineCalculationMode.performance:
    return 1;
  case IsolineCalculationMode.balanced:
    return 2;
  default:
    throw StateError("Invalid enum value $value for IsolineCalculationMode enum.");
  }
}

IsolineCalculationMode sdkRoutingIsolinecalculationmodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return IsolineCalculationMode.quality;
  case 1:
    return IsolineCalculationMode.performance;
  case 2:
    return IsolineCalculationMode.balanced;
  default:
    throw StateError("Invalid numeric value $handle for IsolineCalculationMode enum.");
  }
}

void sdkRoutingIsolinecalculationmodeReleaseFfiHandle(int handle) {}

final _sdkRoutingIsolinecalculationmodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_IsolineCalculationMode_create_handle_nullable'));
final _sdkRoutingIsolinecalculationmodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineCalculationMode_release_handle_nullable'));
final _sdkRoutingIsolinecalculationmodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineCalculationMode_get_value_nullable'));

Pointer<Void> sdkRoutingIsolinecalculationmodeToFfiNullable(IsolineCalculationMode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingIsolinecalculationmodeToFfi(value);
  final result = _sdkRoutingIsolinecalculationmodeCreateHandleNullable(_handle);
  sdkRoutingIsolinecalculationmodeReleaseFfiHandle(_handle);
  return result;
}

IsolineCalculationMode? sdkRoutingIsolinecalculationmodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingIsolinecalculationmodeGetValueNullable(handle);
  final result = sdkRoutingIsolinecalculationmodeFromFfi(_handle);
  sdkRoutingIsolinecalculationmodeReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingIsolinecalculationmodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingIsolinecalculationmodeReleaseHandleNullable(handle);

// End of IsolineCalculationMode "private" section.


