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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/certificate_settings.dart';
import 'package:here_sdk/src/sdk/core/engine/proxy_settings.dart';
import 'package:here_sdk/src/sdk/core/network_endpoint.dart';

/// Network configuration to be used by [SDKNativeEngine] during the initialization.

class NetworkSettings {
  /// Proxy settings. It can be later accessed or changed with [SDKNativeEngine.proxySettings].
  ProxySettings? proxySettings;

  /// Domain Name Server list. This list fully replaces embedded mechanism to detect DNS.
  /// The order is important. To reduce response time make sure that most probably servers
  /// are at the beginning.
  /// Currently only IPv4 is supported.
  List<NetworkEndpoint> domainNameSystemServers;

  /// Certificate settings to use on Android
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  CertificateSettings? certificates;

  /// Creates a new instance.

  /// [proxySettings] Proxy settings. It can be later accessed or changed with [SDKNativeEngine.proxySettings].

  /// [domainNameSystemServers] Domain Name Server list. This list fully replaces embedded mechanism to detect DNS.
  /// The order is important. To reduce response time make sure that most probably servers
  /// are at the beginning.
  /// Currently only IPv4 is supported.

  /// [certificates] Certificate settings to use on Android
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.

  NetworkSettings._(this.proxySettings, this.domainNameSystemServers, this.certificates);
  NetworkSettings()
    : proxySettings = null, domainNameSystemServers = [], certificates = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NetworkSettings) return false;
    NetworkSettings _other = other;
    return proxySettings == _other.proxySettings &&
        DeepCollectionEquality().equals(domainNameSystemServers, _other.domainNameSystemServers) &&
        certificates == _other.certificates;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + proxySettings.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(domainNameSystemServers);
    result = 31 * result + certificates.hashCode;
    return result;
  }
}


// NetworkSettings "private" section, not exported.

final _sdkCoreEngineNetworksettingsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_engine_NetworkSettings_create_handle'));
final _sdkCoreEngineNetworksettingsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_NetworkSettings_release_handle'));
final _sdkCoreEngineNetworksettingsGetFieldproxySettings = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_NetworkSettings_get_field_proxySettings'));
final _sdkCoreEngineNetworksettingsGetFielddomainNameSystemServers = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_NetworkSettings_get_field_domainNameSystemServers'));
final _sdkCoreEngineNetworksettingsGetFieldcertificates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_NetworkSettings_get_field_certificates'));



Pointer<Void> sdkCoreEngineNetworksettingsToFfi(NetworkSettings value) {
  final _proxySettingsHandle = sdkCoreEngineProxysettingsToFfiNullable(value.proxySettings);
  final _domainNameSystemServersHandle = heresdkCoreBindingslistofSdkCoreNetworkendpointToFfi(value.domainNameSystemServers);
  final _certificatesHandle = sdkCoreEngineCertificatesettingsToFfiNullable(value.certificates);
  final _result = _sdkCoreEngineNetworksettingsCreateHandle(_proxySettingsHandle, _domainNameSystemServersHandle, _certificatesHandle);
  sdkCoreEngineProxysettingsReleaseFfiHandleNullable(_proxySettingsHandle);
  heresdkCoreBindingslistofSdkCoreNetworkendpointReleaseFfiHandle(_domainNameSystemServersHandle);
  sdkCoreEngineCertificatesettingsReleaseFfiHandleNullable(_certificatesHandle);
  return _result;
}

NetworkSettings sdkCoreEngineNetworksettingsFromFfi(Pointer<Void> handle) {
  final _proxySettingsHandle = _sdkCoreEngineNetworksettingsGetFieldproxySettings(handle);
  final _domainNameSystemServersHandle = _sdkCoreEngineNetworksettingsGetFielddomainNameSystemServers(handle);
  final _certificatesHandle = _sdkCoreEngineNetworksettingsGetFieldcertificates(handle);
  try {
    return NetworkSettings._(
      sdkCoreEngineProxysettingsFromFfiNullable(_proxySettingsHandle), 
      heresdkCoreBindingslistofSdkCoreNetworkendpointFromFfi(_domainNameSystemServersHandle), 
      sdkCoreEngineCertificatesettingsFromFfiNullable(_certificatesHandle)
    );
  } finally {
    sdkCoreEngineProxysettingsReleaseFfiHandleNullable(_proxySettingsHandle);
    heresdkCoreBindingslistofSdkCoreNetworkendpointReleaseFfiHandle(_domainNameSystemServersHandle);
    sdkCoreEngineCertificatesettingsReleaseFfiHandleNullable(_certificatesHandle);
  }
}

void sdkCoreEngineNetworksettingsReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreEngineNetworksettingsReleaseHandle(handle);

// Nullable NetworkSettings

final _sdkCoreEngineNetworksettingsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_NetworkSettings_create_handle_nullable'));
final _sdkCoreEngineNetworksettingsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_NetworkSettings_release_handle_nullable'));
final _sdkCoreEngineNetworksettingsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_NetworkSettings_get_value_nullable'));

Pointer<Void> sdkCoreEngineNetworksettingsToFfiNullable(NetworkSettings? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineNetworksettingsToFfi(value);
  final result = _sdkCoreEngineNetworksettingsCreateHandleNullable(_handle);
  sdkCoreEngineNetworksettingsReleaseFfiHandle(_handle);
  return result;
}

NetworkSettings? sdkCoreEngineNetworksettingsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineNetworksettingsGetValueNullable(handle);
  final result = sdkCoreEngineNetworksettingsFromFfi(_handle);
  sdkCoreEngineNetworksettingsReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineNetworksettingsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineNetworksettingsReleaseHandleNullable(handle);

// End of NetworkSettings "private" section.


