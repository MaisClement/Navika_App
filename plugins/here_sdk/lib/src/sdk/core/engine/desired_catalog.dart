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
import 'package:here_sdk/src/sdk/core/engine/catalog_identifier.dart';
import 'package:here_sdk/src/sdk/core/engine/catalog_version_hint.dart';
import 'package:meta/meta.dart';


/// This class provides an interface to the user, to identify a catalog on the HERE platform, whose data he wants to access.
///
/// The user can specify the HERE Resource Name (HRN) for the catalog along with a hint for the desired version.
/// If the desired version is not available, the HERE platform will determine the best version to use for a specific catalog or result in error logs.
/// For information on how to specify the catalog version, see [CatalogVersionHint].
/// For information about catalogs and related concepts see [CatalogIdentifier].

class DesiredCatalog {
  /// The identifier for the catalog to be accessed on the HERE platform.
  /// See [CatalogIdentifier].
  CatalogIdentifier id;

  DesiredCatalog._(this.id);
  /// Creates a new instance.
  ///
  /// [hrn] A HERE Resource Name (HRN) for this catalog. This is a unique string returned by the HERE platform when you add a new
  /// catalog to your project. For more information, see [CatalogIdentifier.hrn]
  ///
  /// [version] The version to use for this Catalog's data.
  /// You should use either [CatalogVersionHint.specific] to specify a specific version of the catalog or
  /// [CatalogVersionHint.latestWithIgnoringCachedData] to access the latest version of the catalog available on the HERE platform.
  /// Based on the value in this field, the HERE platform will determine the best version to use for this catalog
  /// or result in error logs if the desired version is not available.
  ///
  factory DesiredCatalog(String hrn, CatalogVersionHint version) => $prototype.make(hrn, version);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DesiredCatalog) return false;
    DesiredCatalog _other = other;
    return id == _other.id;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + id.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = DesiredCatalog$Impl();
}


// DesiredCatalog "private" section, not exported.

final _sdkCoreEngineDesiredcatalogCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_DesiredCatalog_create_handle'));
final _sdkCoreEngineDesiredcatalogReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_DesiredCatalog_release_handle'));
final _sdkCoreEngineDesiredcatalogGetFieldid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_DesiredCatalog_get_field_id'));



/// @nodoc
@visibleForTesting
class DesiredCatalog$Impl {
  DesiredCatalog make(String hrn, CatalogVersionHint version) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_engine_DesiredCatalog_make__String_CatalogVersionHint'));
    final _hrnHandle = stringToFfi(hrn);
    final _versionHandle = sdkCoreEngineCatalogversionhintToFfi(version);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _hrnHandle, _versionHandle);
    stringReleaseFfiHandle(_hrnHandle);
    sdkCoreEngineCatalogversionhintReleaseFfiHandle(_versionHandle);
    try {
      return sdkCoreEngineDesiredcatalogFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineDesiredcatalogReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkCoreEngineDesiredcatalogToFfi(DesiredCatalog value) {
  final _idHandle = sdkCoreEngineCatalogidentifierToFfi(value.id);
  final _result = _sdkCoreEngineDesiredcatalogCreateHandle(_idHandle);
  sdkCoreEngineCatalogidentifierReleaseFfiHandle(_idHandle);
  return _result;
}

DesiredCatalog sdkCoreEngineDesiredcatalogFromFfi(Pointer<Void> handle) {
  final _idHandle = _sdkCoreEngineDesiredcatalogGetFieldid(handle);
  try {
    return DesiredCatalog._(
      sdkCoreEngineCatalogidentifierFromFfi(_idHandle)
    );
  } finally {
    sdkCoreEngineCatalogidentifierReleaseFfiHandle(_idHandle);
  }
}

void sdkCoreEngineDesiredcatalogReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreEngineDesiredcatalogReleaseHandle(handle);

// Nullable DesiredCatalog

final _sdkCoreEngineDesiredcatalogCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_DesiredCatalog_create_handle_nullable'));
final _sdkCoreEngineDesiredcatalogReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_DesiredCatalog_release_handle_nullable'));
final _sdkCoreEngineDesiredcatalogGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_DesiredCatalog_get_value_nullable'));

Pointer<Void> sdkCoreEngineDesiredcatalogToFfiNullable(DesiredCatalog? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineDesiredcatalogToFfi(value);
  final result = _sdkCoreEngineDesiredcatalogCreateHandleNullable(_handle);
  sdkCoreEngineDesiredcatalogReleaseFfiHandle(_handle);
  return result;
}

DesiredCatalog? sdkCoreEngineDesiredcatalogFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineDesiredcatalogGetValueNullable(handle);
  final result = sdkCoreEngineDesiredcatalogFromFfi(_handle);
  sdkCoreEngineDesiredcatalogReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineDesiredcatalogReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineDesiredcatalogReleaseHandleNullable(handle);

// End of DesiredCatalog "private" section.


