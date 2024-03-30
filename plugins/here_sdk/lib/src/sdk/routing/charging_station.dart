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
import 'package:here_sdk/src/sdk/routing/charging_connector_attributes.dart';

/// Data for an electric vehicle charging station.

class ChargingStation {
  /// Identifier of this charging station. It can only be null when custom charging
  /// stations from non-HERE datasets have been injected on the HERE platform.
  /// By default, with HERE datasets it is guranteed to be not null.
  String? id;

  /// Human readable name of this charging station. It can be null when there is no
  /// name associated with the station.
  String? name;

  /// Details of the connector suggested to be used.
  ChargingConnectorAttributes? connectorAttributes;

  /// Creates a new instance.
  /// [id] Identifier of this charging station. It can only be null when custom charging
  /// stations from non-HERE datasets have been injected on the HERE platform.
  /// By default, with HERE datasets it is guranteed to be not null.
  /// [name] Human readable name of this charging station. It can be null when there is no
  /// name associated with the station.
  /// [connectorAttributes] Details of the connector suggested to be used.
  ChargingStation(this.id, this.name, this.connectorAttributes);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ChargingStation) return false;
    ChargingStation _other = other;
    return id == _other.id &&
        name == _other.name &&
        connectorAttributes == _other.connectorAttributes;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + id.hashCode;
    result = 31 * result + name.hashCode;
    result = 31 * result + connectorAttributes.hashCode;
    return result;
  }
}


// ChargingStation "private" section, not exported.

final _sdkRoutingChargingstationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_create_handle'));
final _sdkRoutingChargingstationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_release_handle'));
final _sdkRoutingChargingstationGetFieldid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_get_field_id'));
final _sdkRoutingChargingstationGetFieldname = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_get_field_name'));
final _sdkRoutingChargingstationGetFieldconnectorAttributes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_get_field_connectorAttributes'));



Pointer<Void> sdkRoutingChargingstationToFfi(ChargingStation value) {
  final _idHandle = stringToFfiNullable(value.id);
  final _nameHandle = stringToFfiNullable(value.name);
  final _connectorAttributesHandle = sdkRoutingChargingconnectorattributesToFfiNullable(value.connectorAttributes);
  final _result = _sdkRoutingChargingstationCreateHandle(_idHandle, _nameHandle, _connectorAttributesHandle);
  stringReleaseFfiHandleNullable(_idHandle);
  stringReleaseFfiHandleNullable(_nameHandle);
  sdkRoutingChargingconnectorattributesReleaseFfiHandleNullable(_connectorAttributesHandle);
  return _result;
}

ChargingStation sdkRoutingChargingstationFromFfi(Pointer<Void> handle) {
  final _idHandle = _sdkRoutingChargingstationGetFieldid(handle);
  final _nameHandle = _sdkRoutingChargingstationGetFieldname(handle);
  final _connectorAttributesHandle = _sdkRoutingChargingstationGetFieldconnectorAttributes(handle);
  try {
    return ChargingStation(
      stringFromFfiNullable(_idHandle), 
      stringFromFfiNullable(_nameHandle), 
      sdkRoutingChargingconnectorattributesFromFfiNullable(_connectorAttributesHandle)
    );
  } finally {
    stringReleaseFfiHandleNullable(_idHandle);
    stringReleaseFfiHandleNullable(_nameHandle);
    sdkRoutingChargingconnectorattributesReleaseFfiHandleNullable(_connectorAttributesHandle);
  }
}

void sdkRoutingChargingstationReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingChargingstationReleaseHandle(handle);

// Nullable ChargingStation

final _sdkRoutingChargingstationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_create_handle_nullable'));
final _sdkRoutingChargingstationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_release_handle_nullable'));
final _sdkRoutingChargingstationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ChargingStation_get_value_nullable'));

Pointer<Void> sdkRoutingChargingstationToFfiNullable(ChargingStation? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingChargingstationToFfi(value);
  final result = _sdkRoutingChargingstationCreateHandleNullable(_handle);
  sdkRoutingChargingstationReleaseFfiHandle(_handle);
  return result;
}

ChargingStation? sdkRoutingChargingstationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingChargingstationGetValueNullable(handle);
  final result = sdkRoutingChargingstationFromFfi(_handle);
  sdkRoutingChargingstationReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingChargingstationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingChargingstationReleaseHandleNullable(handle);

// End of ChargingStation "private" section.


