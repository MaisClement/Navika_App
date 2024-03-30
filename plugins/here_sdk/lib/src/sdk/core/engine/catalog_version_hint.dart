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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:meta/meta.dart';

/// This is an interface for capturing user's intent for the
/// desired catalog version to use in [DesiredCatalog] class.
///
/// You can request a specific or latest version of a catalog by calling the
/// static functions [CatalogVersionHint.specific] and
/// [CatalogVersionHint.latestWithIgnoringCachedData] respectively. The HERE platform will make the
/// best effort to provide an appropriate version for the catalog based on this
/// version hint.
/// Please take note that for the API [CatalogVersionHint.specific] to function properly,
/// it is essential that the mutable and persistent storage should be cleaned.
abstract class CatalogVersionHint {

  /// This static method is used when you are interested in a
  /// specific version of a catalog, that you want to specify manually.
  ///
  /// To ensure proper functioning of this API, it is essential to clean the mutable and persistent storage.
  ///
  /// [version] An integer value indicating the version of catalog desired.
  /// If the desired version does not exist, the HERE platform will make the
  /// best effort to provide an appropriate version or result in error logs
  /// about invalid version.
  ///
  /// Returns [CatalogVersionHint]. Instance of [CatalogVersionHint] with specified version.
  ///
  static CatalogVersionHint specific(int version) => $prototype.specific(version);
  /// This static method can be called when you are interested in getting the most latest version of
  /// a catalog when initializing the HERE SDK with `SDKOptions` where you can specify the
  /// catalog(s) you want to use.
  ///
  /// In effect, this will auto-update the cached map data on each
  /// start, if possible. Use this only when you have no installed `Regions`. Since this affects
  /// only the map data cache, calling this at initialization time has no or only a very limited
  /// effect on the start-up time.
  ///
  /// In order to auto-update cached OCM-based map data, such as for the _Navigate Edition_, use the
  /// default HRN value: "hrn:here:data::olp-here:ocm" in your `DesiredCatalog`. Note that the
  /// _Explore Edition_ and the _Lite Edition_ cannot be used with such settings and the
  /// initialization of the HERE SDK may fail - since these editions are based on a different map
  /// format.
  ///
  /// [ignoreCachedData] A flag to specify handling of any cached data present on a device when
  /// trying to update the map version.
  /// If set to true, the HERE SDK will auto-update to the latest catalog version when no installed
  /// `Regions` are present. If present, this call will have no effect - use `updateCatalog()`
  /// via `MapUpdater` instead to update all map data to the latest version.
  /// Note that cached data present on a device - for example, data in the map cache or data cached
  /// by `PrefetchAroundLocation` or `PrefetchAroundRouteOnIntervals` - will be become obsolete if
  /// a newer map version is available. Such data will be evicted using a LRU strategy over time.
  /// If set to false, the HERE SDK will auto-update to use the latest version, only
  /// when there is no cached map data at all (for example, at first install or after
  /// clearing the cache) _and_ no installed map data. Otherwise, this call will have no effect.
  ///
  /// Returns [CatalogVersionHint]. Instance of [CatalogVersionHint].
  ///
  static CatalogVersionHint latestWithIgnoringCachedData(bool ignoreCachedData) => $prototype.latestWithIgnoringCachedData(ignoreCachedData);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = CatalogVersionHint$Impl(Pointer<Void>.fromAddress(0));
}


// CatalogVersionHint "private" section, not exported.

final _sdkCoreEngineCatalogversionhintRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_engine_CatalogVersionHint_register_finalizer'));
final _sdkCoreEngineCatalogversionhintCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogVersionHint_copy_handle'));
final _sdkCoreEngineCatalogversionhintReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogVersionHint_release_handle'));




/// @nodoc
@visibleForTesting
class CatalogVersionHint$Impl extends __lib.NativeBase implements CatalogVersionHint {

  CatalogVersionHint$Impl(Pointer<Void> handle) : super(handle);

  CatalogVersionHint specific(int version) {
    final _specificFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Int64), Pointer<Void> Function(int, int)>('here_sdk_sdk_core_engine_CatalogVersionHint_specific__Long'));
    final _versionHandle = (version);
    final __resultHandle = _specificFfi(__lib.LibraryContext.isolateId, _versionHandle);

    try {
      return sdkCoreEngineCatalogversionhintFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineCatalogversionhintReleaseFfiHandle(__resultHandle);

    }

  }

  CatalogVersionHint latestWithIgnoringCachedData(bool ignoreCachedData) {
    final _latestWithIgnoringCachedDataFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint8), Pointer<Void> Function(int, int)>('here_sdk_sdk_core_engine_CatalogVersionHint_latest__Boolean'));
    final _ignoreCachedDataHandle = booleanToFfi(ignoreCachedData);
    final __resultHandle = _latestWithIgnoringCachedDataFfi(__lib.LibraryContext.isolateId, _ignoreCachedDataHandle);
    booleanReleaseFfiHandle(_ignoreCachedDataHandle);
    try {
      return sdkCoreEngineCatalogversionhintFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineCatalogversionhintReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkCoreEngineCatalogversionhintToFfi(CatalogVersionHint value) =>
  _sdkCoreEngineCatalogversionhintCopyHandle((value as __lib.NativeBase).handle);

CatalogVersionHint sdkCoreEngineCatalogversionhintFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CatalogVersionHint) return instance;

  final _copiedHandle = _sdkCoreEngineCatalogversionhintCopyHandle(handle);
  final result = CatalogVersionHint$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkCoreEngineCatalogversionhintRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreEngineCatalogversionhintReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreEngineCatalogversionhintReleaseHandle(handle);

Pointer<Void> sdkCoreEngineCatalogversionhintToFfiNullable(CatalogVersionHint? value) =>
  value != null ? sdkCoreEngineCatalogversionhintToFfi(value) : Pointer<Void>.fromAddress(0);

CatalogVersionHint? sdkCoreEngineCatalogversionhintFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreEngineCatalogversionhintFromFfi(handle) : null;

void sdkCoreEngineCatalogversionhintReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineCatalogversionhintReleaseHandle(handle);

// End of CatalogVersionHint "private" section.


