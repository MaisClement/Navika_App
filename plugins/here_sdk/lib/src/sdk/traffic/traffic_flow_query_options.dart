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

/// The options to specify how traffic flow data should be queried.

class TrafficFlowQueryOptions {
  /// Min jam factor value.
  /// The jam factor is a value for the amount of traffic on the roadway. The value is between 0.0 and 10.0 (inclusive).
  /// This will be used with [TrafficFlowQueryOptions.maxJamFactor] to filter queried flow.
  /// If the value is `null`, then filtering by the min jam factor is not applied.
  double? minJamFactor;

  /// Max jam factor value.
  /// The jam factor is a value for the amount of traffic on the roadway. The value is between 0.0 and 10.0 (inclusive).
  /// This will be used with [TrafficFlowQueryOptions.minJamFactor] to filter queried flow.
  /// If the value is null filtering by the max jam factor is not applied.
  double? maxJamFactor;

  /// Creates a new instance.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.

  /// [minJamFactor] Min jam factor value.
  /// The jam factor is a value for the amount of traffic on the roadway. The value is between 0.0 and 10.0 (inclusive).
  /// This will be used with [TrafficFlowQueryOptions.maxJamFactor] to filter queried flow.
  /// If the value is `null`, then filtering by the min jam factor is not applied.

  /// [maxJamFactor] Max jam factor value.
  /// The jam factor is a value for the amount of traffic on the roadway. The value is between 0.0 and 10.0 (inclusive).
  /// This will be used with [TrafficFlowQueryOptions.minJamFactor] to filter queried flow.
  /// If the value is null filtering by the max jam factor is not applied.

  TrafficFlowQueryOptions._(this.minJamFactor, this.maxJamFactor);
  /// Creates a new instance.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  TrafficFlowQueryOptions()
      : minJamFactor = null, maxJamFactor = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TrafficFlowQueryOptions) return false;
    TrafficFlowQueryOptions _other = other;
    return minJamFactor == _other.minJamFactor &&
        maxJamFactor == _other.maxJamFactor;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + minJamFactor.hashCode;
    result = 31 * result + maxJamFactor.hashCode;
    return result;
  }
}


// TrafficFlowQueryOptions "private" section, not exported.

final _sdkTrafficTrafficflowqueryoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlowQueryOptions_create_handle'));
final _sdkTrafficTrafficflowqueryoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlowQueryOptions_release_handle'));
final _sdkTrafficTrafficflowqueryoptionsGetFieldminJamFactor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlowQueryOptions_get_field_minJamFactor'));
final _sdkTrafficTrafficflowqueryoptionsGetFieldmaxJamFactor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlowQueryOptions_get_field_maxJamFactor'));



Pointer<Void> sdkTrafficTrafficflowqueryoptionsToFfi(TrafficFlowQueryOptions value) {
  final _minJamFactorHandle = doubleToFfiNullable(value.minJamFactor);
  final _maxJamFactorHandle = doubleToFfiNullable(value.maxJamFactor);
  final _result = _sdkTrafficTrafficflowqueryoptionsCreateHandle(_minJamFactorHandle, _maxJamFactorHandle);
  doubleReleaseFfiHandleNullable(_minJamFactorHandle);
  doubleReleaseFfiHandleNullable(_maxJamFactorHandle);
  return _result;
}

TrafficFlowQueryOptions sdkTrafficTrafficflowqueryoptionsFromFfi(Pointer<Void> handle) {
  final _minJamFactorHandle = _sdkTrafficTrafficflowqueryoptionsGetFieldminJamFactor(handle);
  final _maxJamFactorHandle = _sdkTrafficTrafficflowqueryoptionsGetFieldmaxJamFactor(handle);
  try {
    return TrafficFlowQueryOptions._(
      doubleFromFfiNullable(_minJamFactorHandle), 
      doubleFromFfiNullable(_maxJamFactorHandle)
    );
  } finally {
    doubleReleaseFfiHandleNullable(_minJamFactorHandle);
    doubleReleaseFfiHandleNullable(_maxJamFactorHandle);
  }
}

void sdkTrafficTrafficflowqueryoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkTrafficTrafficflowqueryoptionsReleaseHandle(handle);

// Nullable TrafficFlowQueryOptions

final _sdkTrafficTrafficflowqueryoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlowQueryOptions_create_handle_nullable'));
final _sdkTrafficTrafficflowqueryoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlowQueryOptions_release_handle_nullable'));
final _sdkTrafficTrafficflowqueryoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlowQueryOptions_get_value_nullable'));

Pointer<Void> sdkTrafficTrafficflowqueryoptionsToFfiNullable(TrafficFlowQueryOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficTrafficflowqueryoptionsToFfi(value);
  final result = _sdkTrafficTrafficflowqueryoptionsCreateHandleNullable(_handle);
  sdkTrafficTrafficflowqueryoptionsReleaseFfiHandle(_handle);
  return result;
}

TrafficFlowQueryOptions? sdkTrafficTrafficflowqueryoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficTrafficflowqueryoptionsGetValueNullable(handle);
  final result = sdkTrafficTrafficflowqueryoptionsFromFfi(_handle);
  sdkTrafficTrafficflowqueryoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficTrafficflowqueryoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficflowqueryoptionsReleaseHandleNullable(handle);

// End of TrafficFlowQueryOptions "private" section.


