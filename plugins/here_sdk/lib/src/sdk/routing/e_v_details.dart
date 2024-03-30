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

/// The additional information that is available for electric vehicles.

class EVDetails {
  /// Estimated net energy consumption (in kWh). Note that it can be negative due to
  /// energy recuperation.
  double consumptionInKilowattHour;

  /// Creates a new instance.

  /// [consumptionInKilowattHour] Estimated net energy consumption (in kWh). Note that it can be negative due to
  /// energy recuperation.

  EVDetails(this.consumptionInKilowattHour);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EVDetails) return false;
    EVDetails _other = other;
    return consumptionInKilowattHour == _other.consumptionInKilowattHour;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + consumptionInKilowattHour.hashCode;
    return result;
  }
}


// EVDetails "private" section, not exported.

final _sdkRoutingEvdetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('here_sdk_sdk_routing_EVDetails_create_handle'));
final _sdkRoutingEvdetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVDetails_release_handle'));
final _sdkRoutingEvdetailsGetFieldconsumptionInKilowattHour = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVDetails_get_field_consumptionInKilowattHour'));



Pointer<Void> sdkRoutingEvdetailsToFfi(EVDetails value) {
  final _consumptionInKilowattHourHandle = (value.consumptionInKilowattHour);
  final _result = _sdkRoutingEvdetailsCreateHandle(_consumptionInKilowattHourHandle);
  
  return _result;
}

EVDetails sdkRoutingEvdetailsFromFfi(Pointer<Void> handle) {
  final _consumptionInKilowattHourHandle = _sdkRoutingEvdetailsGetFieldconsumptionInKilowattHour(handle);
  try {
    return EVDetails(
      (_consumptionInKilowattHourHandle)
    );
  } finally {
    
  }
}

void sdkRoutingEvdetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingEvdetailsReleaseHandle(handle);

// Nullable EVDetails

final _sdkRoutingEvdetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVDetails_create_handle_nullable'));
final _sdkRoutingEvdetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVDetails_release_handle_nullable'));
final _sdkRoutingEvdetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVDetails_get_value_nullable'));

Pointer<Void> sdkRoutingEvdetailsToFfiNullable(EVDetails? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingEvdetailsToFfi(value);
  final result = _sdkRoutingEvdetailsCreateHandleNullable(_handle);
  sdkRoutingEvdetailsReleaseFfiHandle(_handle);
  return result;
}

EVDetails? sdkRoutingEvdetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingEvdetailsGetValueNullable(handle);
  final result = sdkRoutingEvdetailsFromFfi(_handle);
  sdkRoutingEvdetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingEvdetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingEvdetailsReleaseHandleNullable(handle);

// End of EVDetails "private" section.


