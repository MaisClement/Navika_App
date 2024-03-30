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

/// This class is used to identify any catalog in the HERE platform.
///
/// A catalog is a storage-representation to store map data on the HERE platform.
/// The data inside a catalog is divided into layers, where each layer consists
/// of datasets with similar functional attributes in the physical world.
/// For example, there can be a layer for road-topology, a layer for
/// road-attributes (such as speed limits) and a layer for places and business
/// addresses. All these layers, in different geographic regions, can be grouped together into a
/// catalog to create a representation of the world we live in, called HERE map.
/// It can be also used to render a `MapView`. Each geographic region is cut into geospatial
/// tiles for efficient search, map display, routing, map matching, and driver warnings.
/// Each tile partitions the map data (in one or more layers, depending on the product)
/// in the geolocation of that specific tile.
/// The data inside a catalog is logically managed and access controlled
/// as a single set. If you have any data that you want to bring to the HERE
/// platform, you need a catalog to contain it.
/// For additional information about catalogs, and related concepts of data representation
/// on the HERE platform, refer to
/// [the Data API](https://developer.here.com/documentation/data-api/data_dev_guide/rest/catalogs.html)
/// and [Introduction to Mapping Concepts](https://st.developer.here.com/documentation/mapping-concepts/white_paper/topics/maps-layers-tiles.html)

class CatalogIdentifier {
  /// A HERE Resource Name (HRN) for this catalog. This is a unique string returned by the HERE platform when you add a new
  /// catalog to your project. For information about catalog creation process refer to
  /// [the Data API](https://developer.here.com/documentation/data-api/data_dev_guide/rest/creating-a-catalog.html)
  /// By default, this field points to a default catalog on HERE platform, which contains data for the whole world excluding the region of Japan.
  /// Use [CatalogConfiguration.getDefault] to get the default HRN value for use with the HERE platform.
  String hrn;

  /// A version number for a catalog. When accessing a catalog, this version must be specified.
  /// Set `null` to automatically get the latest version for a catalog.
  /// The field defaults to `null`.
  /// Since the data inside a catalog can be updated, each published modification needs to correlate
  /// to a specific version number.
  int? version;

  /// Creates a new instance.

  /// [hrn] A HERE Resource Name (HRN) for this catalog. This is a unique string returned by the HERE platform when you add a new
  /// catalog to your project. For information about catalog creation process refer to
  /// [the Data API](https://developer.here.com/documentation/data-api/data_dev_guide/rest/creating-a-catalog.html)
  /// By default, this field points to a default catalog on HERE platform, which contains data for the whole world excluding the region of Japan.
  /// Use [CatalogConfiguration.getDefault] to get the default HRN value for use with the HERE platform.

  /// [version] A version number for a catalog. When accessing a catalog, this version must be specified.
  /// Set `null` to automatically get the latest version for a catalog.
  /// The field defaults to `null`.
  /// Since the data inside a catalog can be updated, each published modification needs to correlate
  /// to a specific version number.

  CatalogIdentifier._(this.hrn, this.version);
  CatalogIdentifier()
    : hrn = "hrn:here:data::olp-here:ocm", version = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CatalogIdentifier) return false;
    CatalogIdentifier _other = other;
    return hrn == _other.hrn &&
        version == _other.version;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + hrn.hashCode;
    result = 31 * result + version.hashCode;
    return result;
  }
}


// CatalogIdentifier "private" section, not exported.

final _sdkCoreEngineCatalogidentifierCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogIdentifier_create_handle'));
final _sdkCoreEngineCatalogidentifierReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogIdentifier_release_handle'));
final _sdkCoreEngineCatalogidentifierGetFieldhrn = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogIdentifier_get_field_hrn'));
final _sdkCoreEngineCatalogidentifierGetFieldversion = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogIdentifier_get_field_version'));



Pointer<Void> sdkCoreEngineCatalogidentifierToFfi(CatalogIdentifier value) {
  final _hrnHandle = stringToFfi(value.hrn);
  final _versionHandle = longToFfiNullable(value.version);
  final _result = _sdkCoreEngineCatalogidentifierCreateHandle(_hrnHandle, _versionHandle);
  stringReleaseFfiHandle(_hrnHandle);
  longReleaseFfiHandleNullable(_versionHandle);
  return _result;
}

CatalogIdentifier sdkCoreEngineCatalogidentifierFromFfi(Pointer<Void> handle) {
  final _hrnHandle = _sdkCoreEngineCatalogidentifierGetFieldhrn(handle);
  final _versionHandle = _sdkCoreEngineCatalogidentifierGetFieldversion(handle);
  try {
    return CatalogIdentifier._(
      stringFromFfi(_hrnHandle), 
      longFromFfiNullable(_versionHandle)
    );
  } finally {
    stringReleaseFfiHandle(_hrnHandle);
    longReleaseFfiHandleNullable(_versionHandle);
  }
}

void sdkCoreEngineCatalogidentifierReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreEngineCatalogidentifierReleaseHandle(handle);

// Nullable CatalogIdentifier

final _sdkCoreEngineCatalogidentifierCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogIdentifier_create_handle_nullable'));
final _sdkCoreEngineCatalogidentifierReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogIdentifier_release_handle_nullable'));
final _sdkCoreEngineCatalogidentifierGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_CatalogIdentifier_get_value_nullable'));

Pointer<Void> sdkCoreEngineCatalogidentifierToFfiNullable(CatalogIdentifier? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineCatalogidentifierToFfi(value);
  final result = _sdkCoreEngineCatalogidentifierCreateHandleNullable(_handle);
  sdkCoreEngineCatalogidentifierReleaseFfiHandle(_handle);
  return result;
}

CatalogIdentifier? sdkCoreEngineCatalogidentifierFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineCatalogidentifierGetValueNullable(handle);
  final result = sdkCoreEngineCatalogidentifierFromFfi(_handle);
  sdkCoreEngineCatalogidentifierReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineCatalogidentifierReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineCatalogidentifierReleaseHandleNullable(handle);

// End of CatalogIdentifier "private" section.


