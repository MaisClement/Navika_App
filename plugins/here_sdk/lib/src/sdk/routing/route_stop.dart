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

/// Route stop that should be used together with import route functionality.
///
/// It specifies location index whithin provided route locations track.
/// Route stop can have additional stop delay, which will be included in
/// expected time to arrival. During navigation the stop will be treated as
/// stopover and will be reported as milestone when passing-by. Note that
/// navigation requires the _Navigate Edition_.

class RouteStop {
  /// Index of location, used for route stop. Index should be >= 1, which
  /// prevents user from using origin location as route stop.
  int locationIndex;

  /// Time that will be spent on route stop.
  Duration stopDuration;

  /// Creates a new instance.

  /// [locationIndex] Index of location, used for route stop. Index should be >= 1, which
  /// prevents user from using origin location as route stop.

  /// [stopDuration] Time that will be spent on route stop.

  RouteStop._(this.locationIndex, this.stopDuration);
  RouteStop(int locationIndex)
    : locationIndex = locationIndex, stopDuration = const Duration(seconds: 0);
}


// RouteStop "private" section, not exported.

final _sdkRoutingRoutestopCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint64),
    Pointer<Void> Function(int, int)
  >('here_sdk_sdk_routing_RouteStop_create_handle'));
final _sdkRoutingRoutestopReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteStop_release_handle'));
final _sdkRoutingRoutestopGetFieldlocationIndex = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteStop_get_field_locationIndex'));
final _sdkRoutingRoutestopGetFieldstopDuration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteStop_get_field_stopDuration'));



Pointer<Void> sdkRoutingRoutestopToFfi(RouteStop value) {
  final _locationIndexHandle = (value.locationIndex);
  final _stopDurationHandle = durationToFfi(value.stopDuration);
  final _result = _sdkRoutingRoutestopCreateHandle(_locationIndexHandle, _stopDurationHandle);
  
  durationReleaseFfiHandle(_stopDurationHandle);
  return _result;
}

RouteStop sdkRoutingRoutestopFromFfi(Pointer<Void> handle) {
  final _locationIndexHandle = _sdkRoutingRoutestopGetFieldlocationIndex(handle);
  final _stopDurationHandle = _sdkRoutingRoutestopGetFieldstopDuration(handle);
  try {
    return RouteStop._(
      (_locationIndexHandle), 
      durationFromFfi(_stopDurationHandle)
    );
  } finally {
    
    durationReleaseFfiHandle(_stopDurationHandle);
  }
}

void sdkRoutingRoutestopReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingRoutestopReleaseHandle(handle);

// Nullable RouteStop

final _sdkRoutingRoutestopCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteStop_create_handle_nullable'));
final _sdkRoutingRoutestopReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteStop_release_handle_nullable'));
final _sdkRoutingRoutestopGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RouteStop_get_value_nullable'));

Pointer<Void> sdkRoutingRoutestopToFfiNullable(RouteStop? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingRoutestopToFfi(value);
  final result = _sdkRoutingRoutestopCreateHandleNullable(_handle);
  sdkRoutingRoutestopReleaseFfiHandle(_handle);
  return result;
}

RouteStop? sdkRoutingRoutestopFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingRoutestopGetValueNullable(handle);
  final result = sdkRoutingRoutestopFromFfi(_handle);
  sdkRoutingRoutestopReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingRoutestopReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingRoutestopReleaseHandleNullable(handle);

// End of RouteStop "private" section.


