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

/// Proxy configuration for the HERE SDK network that is applied per request.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.

class ProxySettings {
  /// Represents the type of the proxy server.
  ProxySettingsProxyType type;

  /// Represents the IP Address of the proxy server.
  io.InternetAddress ipAddress;

  /// Network interface. It's taken into account on Android platform when IPv6 is used.
  /// Default value is "wlan0". If not set then no interface is used.
  String? networkInterface;

  /// Represents the port number of the proxy server.
  int port;

  /// Optional field to define credentials to authenticate a user to the proxy server.
  ProxySettingsCredentials? credentials;

  /// Creates a new instance.

  /// [type] Represents the type of the proxy server.

  /// [ipAddress] Represents the IP Address of the proxy server.

  /// [networkInterface] Network interface. It's taken into account on Android platform when IPv6 is used.
  /// Default value is "wlan0". If not set then no interface is used.

  /// [port] Represents the port number of the proxy server.

  /// [credentials] Optional field to define credentials to authenticate a user to the proxy server.

  ProxySettings._(this.type, this.ipAddress, this.networkInterface, this.port, this.credentials);
  ProxySettings(ProxySettingsProxyType type, io.InternetAddress ipAddress, int port)
    : type = type, ipAddress = ipAddress, networkInterface = "wlan0", port = port, credentials = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProxySettings) return false;
    ProxySettings _other = other;
    return type == _other.type &&
        ipAddress == _other.ipAddress &&
        networkInterface == _other.networkInterface &&
        port == _other.port &&
        credentials == _other.credentials;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + type.hashCode;
    result = 31 * result + ipAddress.hashCode;
    result = 31 * result + networkInterface.hashCode;
    result = 31 * result + port.hashCode;
    result = 31 * result + credentials.hashCode;
    return result;
  }
}

/// Supported types of proxy connection.
enum ProxySettingsProxyType {
    /// Http
    http,
    /// Https
    https,
    /// Socks 5
    socks5
}

// ProxySettingsProxyType "private" section, not exported.

int sdkCoreEngineProxysettingsProxytypeToFfi(ProxySettingsProxyType value) {
  switch (value) {
  case ProxySettingsProxyType.http:
    return 0;
  case ProxySettingsProxyType.https:
    return 1;
  case ProxySettingsProxyType.socks5:
    return 2;
  default:
    throw StateError("Invalid enum value $value for ProxySettingsProxyType enum.");
  }
}

ProxySettingsProxyType sdkCoreEngineProxysettingsProxytypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ProxySettingsProxyType.http;
  case 1:
    return ProxySettingsProxyType.https;
  case 2:
    return ProxySettingsProxyType.socks5;
  default:
    throw StateError("Invalid numeric value $handle for ProxySettingsProxyType enum.");
  }
}

void sdkCoreEngineProxysettingsProxytypeReleaseFfiHandle(int handle) {}

final _sdkCoreEngineProxysettingsProxytypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_engine_ProxySettings_ProxyType_create_handle_nullable'));
final _sdkCoreEngineProxysettingsProxytypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_ProxyType_release_handle_nullable'));
final _sdkCoreEngineProxysettingsProxytypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_ProxyType_get_value_nullable'));

Pointer<Void> sdkCoreEngineProxysettingsProxytypeToFfiNullable(ProxySettingsProxyType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineProxysettingsProxytypeToFfi(value);
  final result = _sdkCoreEngineProxysettingsProxytypeCreateHandleNullable(_handle);
  sdkCoreEngineProxysettingsProxytypeReleaseFfiHandle(_handle);
  return result;
}

ProxySettingsProxyType? sdkCoreEngineProxysettingsProxytypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineProxysettingsProxytypeGetValueNullable(handle);
  final result = sdkCoreEngineProxysettingsProxytypeFromFfi(_handle);
  sdkCoreEngineProxysettingsProxytypeReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineProxysettingsProxytypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineProxysettingsProxytypeReleaseHandleNullable(handle);

// End of ProxySettingsProxyType "private" section.
/// Authentication data

class ProxySettingsCredentials {
  /// Username to use to connect to proxy.
  String userName;

  /// Password for specified username
  String password;

  /// Creates a new instance.

  /// [userName] Username to use to connect to proxy.

  /// [password] Password for specified username

  ProxySettingsCredentials(this.userName, this.password);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProxySettingsCredentials) return false;
    ProxySettingsCredentials _other = other;
    return userName == _other.userName &&
        password == _other.password;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + userName.hashCode;
    result = 31 * result + password.hashCode;
    return result;
  }
}


// ProxySettingsCredentials "private" section, not exported.

final _sdkCoreEngineProxysettingsCredentialsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_Credentials_create_handle'));
final _sdkCoreEngineProxysettingsCredentialsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_Credentials_release_handle'));
final _sdkCoreEngineProxysettingsCredentialsGetFielduserName = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_Credentials_get_field_userName'));
final _sdkCoreEngineProxysettingsCredentialsGetFieldpassword = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_Credentials_get_field_password'));



Pointer<Void> sdkCoreEngineProxysettingsCredentialsToFfi(ProxySettingsCredentials value) {
  final _userNameHandle = stringToFfi(value.userName);
  final _passwordHandle = stringToFfi(value.password);
  final _result = _sdkCoreEngineProxysettingsCredentialsCreateHandle(_userNameHandle, _passwordHandle);
  stringReleaseFfiHandle(_userNameHandle);
  stringReleaseFfiHandle(_passwordHandle);
  return _result;
}

ProxySettingsCredentials sdkCoreEngineProxysettingsCredentialsFromFfi(Pointer<Void> handle) {
  final _userNameHandle = _sdkCoreEngineProxysettingsCredentialsGetFielduserName(handle);
  final _passwordHandle = _sdkCoreEngineProxysettingsCredentialsGetFieldpassword(handle);
  try {
    return ProxySettingsCredentials(
      stringFromFfi(_userNameHandle), 
      stringFromFfi(_passwordHandle)
    );
  } finally {
    stringReleaseFfiHandle(_userNameHandle);
    stringReleaseFfiHandle(_passwordHandle);
  }
}

void sdkCoreEngineProxysettingsCredentialsReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreEngineProxysettingsCredentialsReleaseHandle(handle);

// Nullable ProxySettingsCredentials

final _sdkCoreEngineProxysettingsCredentialsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_Credentials_create_handle_nullable'));
final _sdkCoreEngineProxysettingsCredentialsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_Credentials_release_handle_nullable'));
final _sdkCoreEngineProxysettingsCredentialsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_Credentials_get_value_nullable'));

Pointer<Void> sdkCoreEngineProxysettingsCredentialsToFfiNullable(ProxySettingsCredentials? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineProxysettingsCredentialsToFfi(value);
  final result = _sdkCoreEngineProxysettingsCredentialsCreateHandleNullable(_handle);
  sdkCoreEngineProxysettingsCredentialsReleaseFfiHandle(_handle);
  return result;
}

ProxySettingsCredentials? sdkCoreEngineProxysettingsCredentialsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineProxysettingsCredentialsGetValueNullable(handle);
  final result = sdkCoreEngineProxysettingsCredentialsFromFfi(_handle);
  sdkCoreEngineProxysettingsCredentialsReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineProxysettingsCredentialsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineProxysettingsCredentialsReleaseHandleNullable(handle);

// End of ProxySettingsCredentials "private" section.

// ProxySettings "private" section, not exported.

final _sdkCoreEngineProxysettingsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>, Pointer<Void>, Uint16, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, int, Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_create_handle'));
final _sdkCoreEngineProxysettingsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_release_handle'));
final _sdkCoreEngineProxysettingsGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_get_field_type'));
final _sdkCoreEngineProxysettingsGetFieldipAddress = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_get_field_ipAddress'));
final _sdkCoreEngineProxysettingsGetFieldnetworkInterface = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_get_field_networkInterface'));
final _sdkCoreEngineProxysettingsGetFieldport = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint16 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_get_field_port'));
final _sdkCoreEngineProxysettingsGetFieldcredentials = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_get_field_credentials'));



Pointer<Void> sdkCoreEngineProxysettingsToFfi(ProxySettings value) {
  final _typeHandle = sdkCoreEngineProxysettingsProxytypeToFfi(value.type);
  final _ipAddressHandle = sdkCoreInternetaddressToFfi(value.ipAddress);
  final _networkInterfaceHandle = stringToFfiNullable(value.networkInterface);
  final _portHandle = (value.port);
  final _credentialsHandle = sdkCoreEngineProxysettingsCredentialsToFfiNullable(value.credentials);
  final _result = _sdkCoreEngineProxysettingsCreateHandle(_typeHandle, _ipAddressHandle, _networkInterfaceHandle, _portHandle, _credentialsHandle);
  sdkCoreEngineProxysettingsProxytypeReleaseFfiHandle(_typeHandle);
  sdkCoreInternetaddressReleaseFfiHandle(_ipAddressHandle);
  stringReleaseFfiHandleNullable(_networkInterfaceHandle);
  
  sdkCoreEngineProxysettingsCredentialsReleaseFfiHandleNullable(_credentialsHandle);
  return _result;
}

ProxySettings sdkCoreEngineProxysettingsFromFfi(Pointer<Void> handle) {
  final _typeHandle = _sdkCoreEngineProxysettingsGetFieldtype(handle);
  final _ipAddressHandle = _sdkCoreEngineProxysettingsGetFieldipAddress(handle);
  final _networkInterfaceHandle = _sdkCoreEngineProxysettingsGetFieldnetworkInterface(handle);
  final _portHandle = _sdkCoreEngineProxysettingsGetFieldport(handle);
  final _credentialsHandle = _sdkCoreEngineProxysettingsGetFieldcredentials(handle);
  try {
    return ProxySettings._(
      sdkCoreEngineProxysettingsProxytypeFromFfi(_typeHandle), 
      sdkCoreInternetaddressFromFfi(_ipAddressHandle), 
      stringFromFfiNullable(_networkInterfaceHandle), 
      (_portHandle), 
      sdkCoreEngineProxysettingsCredentialsFromFfiNullable(_credentialsHandle)
    );
  } finally {
    sdkCoreEngineProxysettingsProxytypeReleaseFfiHandle(_typeHandle);
    sdkCoreInternetaddressReleaseFfiHandle(_ipAddressHandle);
    stringReleaseFfiHandleNullable(_networkInterfaceHandle);
    
    sdkCoreEngineProxysettingsCredentialsReleaseFfiHandleNullable(_credentialsHandle);
  }
}

void sdkCoreEngineProxysettingsReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreEngineProxysettingsReleaseHandle(handle);

// Nullable ProxySettings

final _sdkCoreEngineProxysettingsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_create_handle_nullable'));
final _sdkCoreEngineProxysettingsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_release_handle_nullable'));
final _sdkCoreEngineProxysettingsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_ProxySettings_get_value_nullable'));

Pointer<Void> sdkCoreEngineProxysettingsToFfiNullable(ProxySettings? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineProxysettingsToFfi(value);
  final result = _sdkCoreEngineProxysettingsCreateHandleNullable(_handle);
  sdkCoreEngineProxysettingsReleaseFfiHandle(_handle);
  return result;
}

ProxySettings? sdkCoreEngineProxysettingsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineProxysettingsGetValueNullable(handle);
  final result = sdkCoreEngineProxysettingsFromFfi(_handle);
  sdkCoreEngineProxysettingsReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineProxysettingsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineProxysettingsReleaseHandleNullable(handle);

// End of ProxySettings "private" section.


