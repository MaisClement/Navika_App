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
import 'dart:io' as io;
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/internet_address.dart';

/// Network endpoint.

class NetworkEndpoint {
  /// The IP Address of the network endpoint.
  io.InternetAddress address;

  /// Optioanl port number of the network endpoint.
  int? port;

  /// Creates a new instance.
  /// [address] The IP Address of the network endpoint.
  /// [port] Optioanl port number of the network endpoint.
  NetworkEndpoint.withPort(this.address, this.port);
  /// Creates a new instance.
  /// [address] The IP Address of the network endpoint.
  NetworkEndpoint(this.address)
      : port = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NetworkEndpoint) return false;
    NetworkEndpoint _other = other;
    return address == _other.address &&
        port == _other.port;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + address.hashCode;
    result = 31 * result + port.hashCode;
    return result;
  }
}


// NetworkEndpoint "private" section, not exported.

final _sdkCoreNetworkendpointCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_NetworkEndpoint_create_handle'));
final _sdkCoreNetworkendpointReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_NetworkEndpoint_release_handle'));
final _sdkCoreNetworkendpointGetFieldaddress = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_NetworkEndpoint_get_field_address'));
final _sdkCoreNetworkendpointGetFieldport = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_NetworkEndpoint_get_field_port'));



Pointer<Void> sdkCoreNetworkendpointToFfi(NetworkEndpoint value) {
  final _addressHandle = sdkCoreInternetaddressToFfi(value.address);
  final _portHandle = uShortToFfiNullable(value.port);
  final _result = _sdkCoreNetworkendpointCreateHandle(_addressHandle, _portHandle);
  sdkCoreInternetaddressReleaseFfiHandle(_addressHandle);
  uShortReleaseFfiHandleNullable(_portHandle);
  return _result;
}

NetworkEndpoint sdkCoreNetworkendpointFromFfi(Pointer<Void> handle) {
  final _addressHandle = _sdkCoreNetworkendpointGetFieldaddress(handle);
  final _portHandle = _sdkCoreNetworkendpointGetFieldport(handle);
  try {
    return NetworkEndpoint.withPort(
      sdkCoreInternetaddressFromFfi(_addressHandle), 
      uShortFromFfiNullable(_portHandle)
    );
  } finally {
    sdkCoreInternetaddressReleaseFfiHandle(_addressHandle);
    uShortReleaseFfiHandleNullable(_portHandle);
  }
}

void sdkCoreNetworkendpointReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreNetworkendpointReleaseHandle(handle);

// Nullable NetworkEndpoint

final _sdkCoreNetworkendpointCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_NetworkEndpoint_create_handle_nullable'));
final _sdkCoreNetworkendpointReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_NetworkEndpoint_release_handle_nullable'));
final _sdkCoreNetworkendpointGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_NetworkEndpoint_get_value_nullable'));

Pointer<Void> sdkCoreNetworkendpointToFfiNullable(NetworkEndpoint? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreNetworkendpointToFfi(value);
  final result = _sdkCoreNetworkendpointCreateHandleNullable(_handle);
  sdkCoreNetworkendpointReleaseFfiHandle(_handle);
  return result;
}

NetworkEndpoint? sdkCoreNetworkendpointFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreNetworkendpointGetValueNullable(handle);
  final result = sdkCoreNetworkendpointFromFfi(_handle);
  sdkCoreNetworkendpointReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreNetworkendpointReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreNetworkendpointReleaseHandleNullable(handle);

// End of NetworkEndpoint "private" section.


