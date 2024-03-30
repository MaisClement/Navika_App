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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';

/// This interface provides details about a traffic flow.<br/>
/// For additional information about fields, refer to [Traffic API v7 API Reference: Traffic API v7](https://www.here.com/docs/bundle/traffic-api-v7-api-reference/page/index.html#tag/Real-Time-Traffic).
///
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
abstract class TrafficFlowBase {
  /// This interface provides details about a traffic flow.<br/>
  /// For additional information about fields, refer to [Traffic API v7 API Reference: Traffic API v7](https://www.here.com/docs/bundle/traffic-api-v7-api-reference/page/index.html#tag/Real-Time-Traffic).
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.

  factory TrafficFlowBase(
    double Function() freeFlowSpeedInMetersPerSecondGetLambda,
    double Function() jamFactorGetLambda
  ) => TrafficFlowBase$Lambdas(
    freeFlowSpeedInMetersPerSecondGetLambda,
    jamFactorGetLambda
  );

  /// Gets the reference speed in meters per second along the roadway when no traffic is present.
  double get freeFlowSpeedInMetersPerSecond;

  /// Gets a value for the amount of traffic on the roadway.<br/>
  /// The value, between 0.0 and 10.0, indicate the expected quality of travel.<br/>
  /// A value of 0.0 indicates that there is no congestion on the roadway.<br/>
  /// As the value approaches 10.0, it indicates increasing congestion.<br/>
  /// A value of 10.0 is reserved to represent a blocked roadway (closure).
  double get jamFactor;

}


// TrafficFlowBase "private" section, not exported.

final _sdkTrafficTrafficflowbaseRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_traffic_TrafficFlowBase_register_finalizer'));
final _sdkTrafficTrafficflowbaseCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlowBase_copy_handle'));
final _sdkTrafficTrafficflowbaseReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlowBase_release_handle'));
final _sdkTrafficTrafficflowbaseCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('here_sdk_sdk_traffic_TrafficFlowBase_create_proxy'));
final _sdkTrafficTrafficflowbaseGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficFlowBase_get_type_id'));

class TrafficFlowBase$Lambdas implements TrafficFlowBase {
  double Function() freeFlowSpeedInMetersPerSecondGetLambda;
  double Function() jamFactorGetLambda;

  TrafficFlowBase$Lambdas(
    this.freeFlowSpeedInMetersPerSecondGetLambda,
    this.jamFactorGetLambda
  );

  @override
  double get freeFlowSpeedInMetersPerSecond => freeFlowSpeedInMetersPerSecondGetLambda();
  @override
  double get jamFactor => jamFactorGetLambda();
}

class TrafficFlowBase$Impl extends __lib.NativeBase implements TrafficFlowBase {

  TrafficFlowBase$Impl(Pointer<Void> handle) : super(handle);

  /// Gets the reference speed in meters per second along the roadway when no traffic is present.
  double get freeFlowSpeedInMetersPerSecond {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficFlowBase_freeFlowSpeedInMetersPerSecond_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  /// Gets a value for the amount of traffic on the roadway.<br/>
  /// The value, between 0.0 and 10.0, indicate the expected quality of travel.<br/>
  /// A value of 0.0 indicates that there is no congestion on the roadway.<br/>
  /// As the value approaches 10.0, it indicates increasing congestion.<br/>
  /// A value of 10.0 is reserved to represent a blocked roadway (closure).
  double get jamFactor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_traffic_TrafficFlowBase_jamFactor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }



}


int _sdkTrafficTrafficflowbasefreeFlowSpeedInMetersPerSecondGetStatic(Object _obj, Pointer<Double> _result) {
  _result.value = ((_obj as TrafficFlowBase).freeFlowSpeedInMetersPerSecond);
  return 0;
}
int _sdkTrafficTrafficflowbasejamFactorGetStatic(Object _obj, Pointer<Double> _result) {
  _result.value = ((_obj as TrafficFlowBase).jamFactor);
  return 0;
}

Pointer<Void> sdkTrafficTrafficflowbaseToFfi(TrafficFlowBase value) {
  if (value is __lib.NativeBase) return _sdkTrafficTrafficflowbaseCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkTrafficTrafficflowbaseCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Double>)>(_sdkTrafficTrafficflowbasefreeFlowSpeedInMetersPerSecondGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Double>)>(_sdkTrafficTrafficflowbasejamFactorGetStatic, __lib.unknownError)
  );

  return result;
}

TrafficFlowBase sdkTrafficTrafficflowbaseFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TrafficFlowBase) return instance;

  final _typeIdHandle = _sdkTrafficTrafficflowbaseGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkTrafficTrafficflowbaseCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TrafficFlowBase$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkTrafficTrafficflowbaseRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkTrafficTrafficflowbaseReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkTrafficTrafficflowbaseReleaseHandle(handle);

Pointer<Void> sdkTrafficTrafficflowbaseToFfiNullable(TrafficFlowBase? value) =>
  value != null ? sdkTrafficTrafficflowbaseToFfi(value) : Pointer<Void>.fromAddress(0);

TrafficFlowBase? sdkTrafficTrafficflowbaseFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkTrafficTrafficflowbaseFromFfi(handle) : null;

void sdkTrafficTrafficflowbaseReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficflowbaseReleaseHandle(handle);

// End of TrafficFlowBase "private" section.


