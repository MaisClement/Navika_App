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
import 'package:here_sdk/src/sdk/core/engine/catalog_type.dart';
import 'package:here_sdk/src/sdk/core/engine/desired_catalog.dart';
import 'package:meta/meta.dart';


/// Using this class you can configure in the [SDKOptions],
/// how the [SDKNativeEngine] should access, use and store the data for the desired catalog.
///
/// Using this class, you can access default catalogs on the HERE platform and also custom catalogs
/// such as for self-hosted or BYOD (bring your own data) use cases.
///
/// For information on how the user can identify a catalog on the HERE platform, see [DesiredCatalog]
/// For further information about catalogs and related concepts see [CatalogIdentifier].
///
/// **Note:**
/// This API is only applicable for enhanced editions such as the _Navigate Edition_.

class CatalogConfiguration {
  /// The identifier for the desired catalog to be accessed on the HERE platform.
  /// See [DesiredCatalog].
  DesiredCatalog catalog;

  /// Some catalogs may have additional modifications to their data
  /// contained in an entirely separate catalog, called the patch catalog.
  /// This field indicates the HERE Resource Name (HRN) for the patch catalog.
  /// When this field is present, the catalog's data as referenced by
  /// [CatalogConfiguration.catalog] is merged with data from the patch catalog.
  String? patchHrn;

  /// Expiration time in seconds for how long the catalog data is retained in the
  /// map cache before it is removed. Cache path is specified by [SDKOptions.cachePath].
  /// If not set, the cache will be deleted on a Least Recently Used (LRU) basis.
  Duration? cacheExpirationPeriod;

  /// A flag to indicate if the data for this catalog is allowed to be stored in persistent storage for use with offline maps.
  /// The storage path is specified in [SDKOptions.persistentMapStoragePath].
  /// If set to false, the data is not stored in persistent storage and is only retained in the cache for a limited time (see [CatalogConfiguration.cacheExpirationPeriod]).
  /// Defaults to true.
  bool allowDownload;

  /// Creates a new instance.

  /// [catalog] The identifier for the desired catalog to be accessed on the HERE platform.
  /// See [DesiredCatalog].

  /// [patchHrn] Some catalogs may have additional modifications to their data
  /// contained in an entirely separate catalog, called the patch catalog.
  /// This field indicates the HERE Resource Name (HRN) for the patch catalog.
  /// When this field is present, the catalog's data as referenced by
  /// [CatalogConfiguration.catalog] is merged with data from the patch catalog.

  /// [cacheExpirationPeriod] Expiration time in seconds for how long the catalog data is retained in the
  /// map cache before it is removed. Cache path is specified by [SDKOptions.cachePath].
  /// If not set, the cache will be deleted on a Least Recently Used (LRU) basis.

  /// [allowDownload] A flag to indicate if the data for this catalog is allowed to be stored in persistent storage for use with offline maps.
  /// The storage path is specified in [SDKOptions.persistentMapStoragePath].
  /// If set to false, the data is not stored in persistent storage and is only retained in the cache for a limited time (see [CatalogConfiguration.cacheExpirationPeriod]).
  /// Defaults to true.

  CatalogConfiguration._(this.catalog, this.patchHrn, this.cacheExpirationPeriod, this.allowDownload);
  CatalogConfiguration(DesiredCatalog catalog)
    : catalog = catalog, patchHrn = null, cacheExpirationPeriod = null, allowDownload = true;
  /// Gets the default catalog configuration for the specified catalog type.
  ///
  /// It uses the catalog version that was the latest at the time when the HERE SDK was built.
  ///
  /// [catalogType] Catalog type
  ///
  /// Returns [CatalogConfiguration]. Instance of [CatalogConfiguration].
  ///
  static CatalogConfiguration getDefault(CatalogType catalogType) => $prototype.getDefault(catalogType);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CatalogConfiguration) return false;
    CatalogConfiguration _other = other;
    return catalog == _other.catalog &&
        patchHrn == _other.patchHrn &&
        cacheExpirationPeriod == _other.cacheExpirationPeriod &&
        allowDownload == _other.allowDownload;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + catalog.hashCode;
    result = 31 * result + patchHrn.hashCode;
    result = 31 * result + cacheExpirationPeriod.hashCode;
    result = 31 * result + allowDownload.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = CatalogConfiguration$Impl();
}


// CatalogConfiguration "private" section, not exported.

final _sdkCoreEngineCatalogconfigurationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint8),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_core_engine_CatalogConfiguration_create_handle'));
final _sdkCoreEngineCatalogconfigurationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogConfiguration_release_handle'));
final _sdkCoreEngineCatalogconfigurationGetFieldcatalog = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogConfiguration_get_field_catalog'));
final _sdkCoreEngineCatalogconfigurationGetFieldpatchHrn = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogConfiguration_get_field_patchHrn'));
final _sdkCoreEngineCatalogconfigurationGetFieldcacheExpirationPeriod = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogConfiguration_get_field_cacheExpirationPeriod'));
final _sdkCoreEngineCatalogconfigurationGetFieldallowDownload = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogConfiguration_get_field_allowDownload'));



/// @nodoc
@visibleForTesting
class CatalogConfiguration$Impl {
  CatalogConfiguration getDefault(CatalogType catalogType) {
    final _getDefaultFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32), Pointer<Void> Function(int, int)>('here_sdk_sdk_core_engine_CatalogConfiguration_getDefault__CatalogType'));
    final _catalogTypeHandle = sdkCoreEngineCatalogtypeToFfi(catalogType);
    final __resultHandle = _getDefaultFfi(__lib.LibraryContext.isolateId, _catalogTypeHandle);
    sdkCoreEngineCatalogtypeReleaseFfiHandle(_catalogTypeHandle);
    try {
      return sdkCoreEngineCatalogconfigurationFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineCatalogconfigurationReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkCoreEngineCatalogconfigurationToFfi(CatalogConfiguration value) {
  final _catalogHandle = sdkCoreEngineDesiredcatalogToFfi(value.catalog);
  final _patchHrnHandle = stringToFfiNullable(value.patchHrn);
  final _cacheExpirationPeriodHandle = durationToFfiNullable(value.cacheExpirationPeriod);
  final _allowDownloadHandle = booleanToFfi(value.allowDownload);
  final _result = _sdkCoreEngineCatalogconfigurationCreateHandle(_catalogHandle, _patchHrnHandle, _cacheExpirationPeriodHandle, _allowDownloadHandle);
  sdkCoreEngineDesiredcatalogReleaseFfiHandle(_catalogHandle);
  stringReleaseFfiHandleNullable(_patchHrnHandle);
  durationReleaseFfiHandleNullable(_cacheExpirationPeriodHandle);
  booleanReleaseFfiHandle(_allowDownloadHandle);
  return _result;
}

CatalogConfiguration sdkCoreEngineCatalogconfigurationFromFfi(Pointer<Void> handle) {
  final _catalogHandle = _sdkCoreEngineCatalogconfigurationGetFieldcatalog(handle);
  final _patchHrnHandle = _sdkCoreEngineCatalogconfigurationGetFieldpatchHrn(handle);
  final _cacheExpirationPeriodHandle = _sdkCoreEngineCatalogconfigurationGetFieldcacheExpirationPeriod(handle);
  final _allowDownloadHandle = _sdkCoreEngineCatalogconfigurationGetFieldallowDownload(handle);
  try {
    return CatalogConfiguration._(
      sdkCoreEngineDesiredcatalogFromFfi(_catalogHandle), 
      stringFromFfiNullable(_patchHrnHandle), 
      durationFromFfiNullable(_cacheExpirationPeriodHandle), 
      booleanFromFfi(_allowDownloadHandle)
    );
  } finally {
    sdkCoreEngineDesiredcatalogReleaseFfiHandle(_catalogHandle);
    stringReleaseFfiHandleNullable(_patchHrnHandle);
    durationReleaseFfiHandleNullable(_cacheExpirationPeriodHandle);
    booleanReleaseFfiHandle(_allowDownloadHandle);
  }
}

void sdkCoreEngineCatalogconfigurationReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreEngineCatalogconfigurationReleaseHandle(handle);

// Nullable CatalogConfiguration

final _sdkCoreEngineCatalogconfigurationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogConfiguration_create_handle_nullable'));
final _sdkCoreEngineCatalogconfigurationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogConfiguration_release_handle_nullable'));
final _sdkCoreEngineCatalogconfigurationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogConfiguration_get_value_nullable'));

Pointer<Void> sdkCoreEngineCatalogconfigurationToFfiNullable(CatalogConfiguration? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineCatalogconfigurationToFfi(value);
  final result = _sdkCoreEngineCatalogconfigurationCreateHandleNullable(_handle);
  sdkCoreEngineCatalogconfigurationReleaseFfiHandle(_handle);
  return result;
}

CatalogConfiguration? sdkCoreEngineCatalogconfigurationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineCatalogconfigurationGetValueNullable(handle);
  final result = sdkCoreEngineCatalogconfigurationFromFfi(_handle);
  sdkCoreEngineCatalogconfigurationReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineCatalogconfigurationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineCatalogconfigurationReleaseHandleNullable(handle);

// End of CatalogConfiguration "private" section.


