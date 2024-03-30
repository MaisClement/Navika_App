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

/// Types of function road class.
enum FunctionalRoadClass {
    /// A road with high volume and maximum speed traffic.
    functionalRoadClass1,
    /// A road with high volume and high speed traffic.
    functionalRoadClass2,
    /// A road with high volume traffic.
    functionalRoadClass3,
    /// A road with high volume traffic at moderate speeds between neighborhoods.
    functionalRoadClass4,
    /// A road whose volume and traffic flow are below the level of any other functional class.
    functionalRoadClass5
}

// FunctionalRoadClass "private" section, not exported.

int sdkRoutingFunctionalroadclassToFfi(FunctionalRoadClass value) {
  switch (value) {
  case FunctionalRoadClass.functionalRoadClass1:
    return 0;
  case FunctionalRoadClass.functionalRoadClass2:
    return 1;
  case FunctionalRoadClass.functionalRoadClass3:
    return 2;
  case FunctionalRoadClass.functionalRoadClass4:
    return 3;
  case FunctionalRoadClass.functionalRoadClass5:
    return 4;
  default:
    throw StateError("Invalid enum value $value for FunctionalRoadClass enum.");
  }
}

FunctionalRoadClass sdkRoutingFunctionalroadclassFromFfi(int handle) {
  switch (handle) {
  case 0:
    return FunctionalRoadClass.functionalRoadClass1;
  case 1:
    return FunctionalRoadClass.functionalRoadClass2;
  case 2:
    return FunctionalRoadClass.functionalRoadClass3;
  case 3:
    return FunctionalRoadClass.functionalRoadClass4;
  case 4:
    return FunctionalRoadClass.functionalRoadClass5;
  default:
    throw StateError("Invalid numeric value $handle for FunctionalRoadClass enum.");
  }
}

void sdkRoutingFunctionalroadclassReleaseFfiHandle(int handle) {}

final _sdkRoutingFunctionalroadclassCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_FunctionalRoadClass_create_handle_nullable'));
final _sdkRoutingFunctionalroadclassReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FunctionalRoadClass_release_handle_nullable'));
final _sdkRoutingFunctionalroadclassGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_FunctionalRoadClass_get_value_nullable'));

Pointer<Void> sdkRoutingFunctionalroadclassToFfiNullable(FunctionalRoadClass? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingFunctionalroadclassToFfi(value);
  final result = _sdkRoutingFunctionalroadclassCreateHandleNullable(_handle);
  sdkRoutingFunctionalroadclassReleaseFfiHandle(_handle);
  return result;
}

FunctionalRoadClass? sdkRoutingFunctionalroadclassFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingFunctionalroadclassGetValueNullable(handle);
  final result = sdkRoutingFunctionalroadclassFromFfi(_handle);
  sdkRoutingFunctionalroadclassReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingFunctionalroadclassReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingFunctionalroadclassReleaseHandleNullable(handle);

// End of FunctionalRoadClass "private" section.


