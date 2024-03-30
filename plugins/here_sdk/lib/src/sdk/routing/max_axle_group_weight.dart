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

/// `MaxAxleGroupWeight` contains all the restriction details violated by an axle group weight.

class MaxAxleGroupWeight {
  /// Limit of the axle weight in kilograms
  int maxWeightInKilograms;

  /// Type of the restriction's axle group
  String axleGroupType;

  /// Creates a new instance.
  /// [maxWeightInKilograms] Limit of the axle weight in kilograms
  /// [axleGroupType] Type of the restriction's axle group
  MaxAxleGroupWeight(this.maxWeightInKilograms, this.axleGroupType);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MaxAxleGroupWeight) return false;
    MaxAxleGroupWeight _other = other;
    return maxWeightInKilograms == _other.maxWeightInKilograms &&
        axleGroupType == _other.axleGroupType;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + maxWeightInKilograms.hashCode;
    result = 31 * result + axleGroupType.hashCode;
    return result;
  }
}


// MaxAxleGroupWeight "private" section, not exported.

final _sdkRoutingMaxaxlegroupweightCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('here_sdk_sdk_routing_MaxAxleGroupWeight_create_handle'));
final _sdkRoutingMaxaxlegroupweightReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MaxAxleGroupWeight_release_handle'));
final _sdkRoutingMaxaxlegroupweightGetFieldmaxWeightInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MaxAxleGroupWeight_get_field_maxWeightInKilograms'));
final _sdkRoutingMaxaxlegroupweightGetFieldaxleGroupType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MaxAxleGroupWeight_get_field_axleGroupType'));



Pointer<Void> sdkRoutingMaxaxlegroupweightToFfi(MaxAxleGroupWeight value) {
  final _maxWeightInKilogramsHandle = (value.maxWeightInKilograms);
  final _axleGroupTypeHandle = stringToFfi(value.axleGroupType);
  final _result = _sdkRoutingMaxaxlegroupweightCreateHandle(_maxWeightInKilogramsHandle, _axleGroupTypeHandle);
  
  stringReleaseFfiHandle(_axleGroupTypeHandle);
  return _result;
}

MaxAxleGroupWeight sdkRoutingMaxaxlegroupweightFromFfi(Pointer<Void> handle) {
  final _maxWeightInKilogramsHandle = _sdkRoutingMaxaxlegroupweightGetFieldmaxWeightInKilograms(handle);
  final _axleGroupTypeHandle = _sdkRoutingMaxaxlegroupweightGetFieldaxleGroupType(handle);
  try {
    return MaxAxleGroupWeight(
      (_maxWeightInKilogramsHandle), 
      stringFromFfi(_axleGroupTypeHandle)
    );
  } finally {
    
    stringReleaseFfiHandle(_axleGroupTypeHandle);
  }
}

void sdkRoutingMaxaxlegroupweightReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingMaxaxlegroupweightReleaseHandle(handle);

// Nullable MaxAxleGroupWeight

final _sdkRoutingMaxaxlegroupweightCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MaxAxleGroupWeight_create_handle_nullable'));
final _sdkRoutingMaxaxlegroupweightReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MaxAxleGroupWeight_release_handle_nullable'));
final _sdkRoutingMaxaxlegroupweightGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_MaxAxleGroupWeight_get_value_nullable'));

Pointer<Void> sdkRoutingMaxaxlegroupweightToFfiNullable(MaxAxleGroupWeight? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingMaxaxlegroupweightToFfi(value);
  final result = _sdkRoutingMaxaxlegroupweightCreateHandleNullable(_handle);
  sdkRoutingMaxaxlegroupweightReleaseFfiHandle(_handle);
  return result;
}

MaxAxleGroupWeight? sdkRoutingMaxaxlegroupweightFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingMaxaxlegroupweightGetValueNullable(handle);
  final result = sdkRoutingMaxaxlegroupweightFromFfi(_handle);
  sdkRoutingMaxaxlegroupweightReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingMaxaxlegroupweightReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingMaxaxlegroupweightReleaseHandleNullable(handle);

// End of MaxAxleGroupWeight "private" section.


