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
import 'package:here_sdk/src/sdk/routing/avoidance_options.dart';
import 'package:here_sdk/src/sdk/routing/route_options.dart';
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';

/// All the options to specify how a bicycle route should be calculated.

class BicycleOptions {
  /// Specifies the common route calculation options.
  RouteOptions routeOptions;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  RouteTextOptions textOptions;

  /// Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.
  AvoidanceOptions avoidanceOptions;

  /// Creates a new instance.

  /// [routeOptions] Specifies the common route calculation options.

  /// [textOptions] Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.

  /// [avoidanceOptions] Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.

  BicycleOptions._(this.routeOptions, this.textOptions, this.avoidanceOptions);
  BicycleOptions()
    : routeOptions = RouteOptions.withDefaults(), textOptions = RouteTextOptions(), avoidanceOptions = AvoidanceOptions();
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BicycleOptions) return false;
    BicycleOptions _other = other;
    return routeOptions == _other.routeOptions &&
        textOptions == _other.textOptions &&
        avoidanceOptions == _other.avoidanceOptions;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + routeOptions.hashCode;
    result = 31 * result + textOptions.hashCode;
    result = 31 * result + avoidanceOptions.hashCode;
    return result;
  }
}


// BicycleOptions "private" section, not exported.

final _sdkRoutingBicycleoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_BicycleOptions_create_handle'));
final _sdkRoutingBicycleoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BicycleOptions_release_handle'));
final _sdkRoutingBicycleoptionsGetFieldrouteOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BicycleOptions_get_field_routeOptions'));
final _sdkRoutingBicycleoptionsGetFieldtextOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BicycleOptions_get_field_textOptions'));
final _sdkRoutingBicycleoptionsGetFieldavoidanceOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BicycleOptions_get_field_avoidanceOptions'));



Pointer<Void> sdkRoutingBicycleoptionsToFfi(BicycleOptions value) {
  final _routeOptionsHandle = sdkRoutingRouteoptionsToFfi(value.routeOptions);
  final _textOptionsHandle = sdkRoutingRoutetextoptionsToFfi(value.textOptions);
  final _avoidanceOptionsHandle = sdkRoutingAvoidanceoptionsToFfi(value.avoidanceOptions);
  final _result = _sdkRoutingBicycleoptionsCreateHandle(_routeOptionsHandle, _textOptionsHandle, _avoidanceOptionsHandle);
  sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
  sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
  sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
  return _result;
}

BicycleOptions sdkRoutingBicycleoptionsFromFfi(Pointer<Void> handle) {
  final _routeOptionsHandle = _sdkRoutingBicycleoptionsGetFieldrouteOptions(handle);
  final _textOptionsHandle = _sdkRoutingBicycleoptionsGetFieldtextOptions(handle);
  final _avoidanceOptionsHandle = _sdkRoutingBicycleoptionsGetFieldavoidanceOptions(handle);
  try {
    return BicycleOptions._(
      sdkRoutingRouteoptionsFromFfi(_routeOptionsHandle), 
      sdkRoutingRoutetextoptionsFromFfi(_textOptionsHandle), 
      sdkRoutingAvoidanceoptionsFromFfi(_avoidanceOptionsHandle)
    );
  } finally {
    sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
    sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
    sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
  }
}

void sdkRoutingBicycleoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingBicycleoptionsReleaseHandle(handle);

// Nullable BicycleOptions

final _sdkRoutingBicycleoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BicycleOptions_create_handle_nullable'));
final _sdkRoutingBicycleoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BicycleOptions_release_handle_nullable'));
final _sdkRoutingBicycleoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_BicycleOptions_get_value_nullable'));

Pointer<Void> sdkRoutingBicycleoptionsToFfiNullable(BicycleOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingBicycleoptionsToFfi(value);
  final result = _sdkRoutingBicycleoptionsCreateHandleNullable(_handle);
  sdkRoutingBicycleoptionsReleaseFfiHandle(_handle);
  return result;
}

BicycleOptions? sdkRoutingBicycleoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingBicycleoptionsGetValueNullable(handle);
  final result = sdkRoutingBicycleoptionsFromFfi(_handle);
  sdkRoutingBicycleoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingBicycleoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingBicycleoptionsReleaseHandleNullable(handle);

// End of BicycleOptions "private" section.


