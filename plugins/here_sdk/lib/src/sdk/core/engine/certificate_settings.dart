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

/// Certificate settings to be used by Curl+OpenSSL for authority.

class CertificateSettings {
  /// The client certificate file as blob
  /// (https://curl.se/libcurl/c/CURLOPT_SSLCERT_BLOB.html)
  /// The format must be "P12" or "PEM" on OpenSSL.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  String clientCertFileBlob;

  /// The client key certificate file as blob
  /// (https://curl.se/libcurl/c/CURLOPT_SSLKEY_BLOB.html)
  /// Compatible with OpenSSL.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  String clientKeyFileBlob;

  /// The CA file as blob
  /// (https://curl.se/libcurl/c/CURLOPT_CAINFO_BLOB.html)
  /// Binary data of PEM encoded content holding one or more certificates to verify the HTTPS server with.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  String certFileBlob;

  /// Creates a new instance.

  /// [clientCertFileBlob] The client certificate file as blob
  /// (https://curl.se/libcurl/c/CURLOPT_SSLCERT_BLOB.html)
  /// The format must be "P12" or "PEM" on OpenSSL.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.

  /// [clientKeyFileBlob] The client key certificate file as blob
  /// (https://curl.se/libcurl/c/CURLOPT_SSLKEY_BLOB.html)
  /// Compatible with OpenSSL.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.

  /// [certFileBlob] The CA file as blob
  /// (https://curl.se/libcurl/c/CURLOPT_CAINFO_BLOB.html)
  /// Binary data of PEM encoded content holding one or more certificates to verify the HTTPS server with.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.

  CertificateSettings(this.clientCertFileBlob, this.clientKeyFileBlob, this.certFileBlob);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CertificateSettings) return false;
    CertificateSettings _other = other;
    return clientCertFileBlob == _other.clientCertFileBlob &&
        clientKeyFileBlob == _other.clientKeyFileBlob &&
        certFileBlob == _other.certFileBlob;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + clientCertFileBlob.hashCode;
    result = 31 * result + clientKeyFileBlob.hashCode;
    result = 31 * result + certFileBlob.hashCode;
    return result;
  }
}


// CertificateSettings "private" section, not exported.

final _sdkCoreEngineCertificatesettingsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_engine_CertificateSettings_create_handle'));
final _sdkCoreEngineCertificatesettingsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CertificateSettings_release_handle'));
final _sdkCoreEngineCertificatesettingsGetFieldclientCertFileBlob = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CertificateSettings_get_field_clientCertFileBlob'));
final _sdkCoreEngineCertificatesettingsGetFieldclientKeyFileBlob = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CertificateSettings_get_field_clientKeyFileBlob'));
final _sdkCoreEngineCertificatesettingsGetFieldcertFileBlob = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CertificateSettings_get_field_certFileBlob'));



Pointer<Void> sdkCoreEngineCertificatesettingsToFfi(CertificateSettings value) {
  final _clientCertFileBlobHandle = stringToFfi(value.clientCertFileBlob);
  final _clientKeyFileBlobHandle = stringToFfi(value.clientKeyFileBlob);
  final _certFileBlobHandle = stringToFfi(value.certFileBlob);
  final _result = _sdkCoreEngineCertificatesettingsCreateHandle(_clientCertFileBlobHandle, _clientKeyFileBlobHandle, _certFileBlobHandle);
  stringReleaseFfiHandle(_clientCertFileBlobHandle);
  stringReleaseFfiHandle(_clientKeyFileBlobHandle);
  stringReleaseFfiHandle(_certFileBlobHandle);
  return _result;
}

CertificateSettings sdkCoreEngineCertificatesettingsFromFfi(Pointer<Void> handle) {
  final _clientCertFileBlobHandle = _sdkCoreEngineCertificatesettingsGetFieldclientCertFileBlob(handle);
  final _clientKeyFileBlobHandle = _sdkCoreEngineCertificatesettingsGetFieldclientKeyFileBlob(handle);
  final _certFileBlobHandle = _sdkCoreEngineCertificatesettingsGetFieldcertFileBlob(handle);
  try {
    return CertificateSettings(
      stringFromFfi(_clientCertFileBlobHandle), 
      stringFromFfi(_clientKeyFileBlobHandle), 
      stringFromFfi(_certFileBlobHandle)
    );
  } finally {
    stringReleaseFfiHandle(_clientCertFileBlobHandle);
    stringReleaseFfiHandle(_clientKeyFileBlobHandle);
    stringReleaseFfiHandle(_certFileBlobHandle);
  }
}

void sdkCoreEngineCertificatesettingsReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreEngineCertificatesettingsReleaseHandle(handle);

// Nullable CertificateSettings

final _sdkCoreEngineCertificatesettingsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CertificateSettings_create_handle_nullable'));
final _sdkCoreEngineCertificatesettingsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CertificateSettings_release_handle_nullable'));
final _sdkCoreEngineCertificatesettingsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CertificateSettings_get_value_nullable'));

Pointer<Void> sdkCoreEngineCertificatesettingsToFfiNullable(CertificateSettings? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineCertificatesettingsToFfi(value);
  final result = _sdkCoreEngineCertificatesettingsCreateHandleNullable(_handle);
  sdkCoreEngineCertificatesettingsReleaseFfiHandle(_handle);
  return result;
}

CertificateSettings? sdkCoreEngineCertificatesettingsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineCertificatesettingsGetValueNullable(handle);
  final result = sdkCoreEngineCertificatesettingsFromFfi(_handle);
  sdkCoreEngineCertificatesettingsReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineCertificatesettingsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineCertificatesettingsReleaseHandleNullable(handle);

// End of CertificateSettings "private" section.


