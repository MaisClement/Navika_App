// Copyright (c) 2019-2023 HERE Global B.V. and its affiliate(s).
// All rights reserved.
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

/// List of available data tiling schemes.
///
/// X axis has the origin at -180 longitude and is increasing in east direction.
/// Y axis has the origin at max latitude and is increasing in south direction.
/// For half quad tree schemes, only the uppper half of the tree is used.
enum TilingScheme {
    /// A tiling scheme that splits 0-th level tile into 2 equal-sized subtiles and all other level tiles into 4 equal-sized subtiles.
    halfQuadTreeIdentity,
    /// A tiling scheme that splits 0-th level tile into 2 equal-sized subtiles and all other level tiles into 4 equal-sized subtiles.
    /// The coordinates of the tile's corners are transformed through the web-mercator projection.
    halfQuadTreeMercator,
    /// A tiling scheme that splits 0-th level tile into 2 equal-sized subtiles and all other level tiles into 4 equal-sized subtiles.
    /// The coordinates of the tile's corners are transformed through the equirectangular (plate carree) projection.
    halfQuadTreeEquirectangular,
    /// A tiling scheme that splits each level tile into 4 equal-sized subtiles.
    quadTreeIdentity,
    /// A tiling scheme that splits each level tile into 4 equal-sized subtiles.
    /// The coordinates of the tile's corners are transformed through the web-mercator projection.
    quadTreeMercator,
    /// A tiling scheme that splits each level tile into 4 equal-sized subtiles.
    /// The coordinates of the tile's corners are transformed through the equirectangular (plate carree) projection.
    quadTreeEquirectangular
}

// TilingScheme "private" section, not exported.

int sdkMapviewDatasourceTilingschemeToFfi(TilingScheme value) {
  switch (value) {
  case TilingScheme.halfQuadTreeIdentity:
    return 0;
  case TilingScheme.halfQuadTreeMercator:
    return 1;
  case TilingScheme.halfQuadTreeEquirectangular:
    return 2;
  case TilingScheme.quadTreeIdentity:
    return 3;
  case TilingScheme.quadTreeMercator:
    return 4;
  case TilingScheme.quadTreeEquirectangular:
    return 5;
  default:
    throw StateError("Invalid enum value $value for TilingScheme enum.");
  }
}

TilingScheme sdkMapviewDatasourceTilingschemeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return TilingScheme.halfQuadTreeIdentity;
  case 1:
    return TilingScheme.halfQuadTreeMercator;
  case 2:
    return TilingScheme.halfQuadTreeEquirectangular;
  case 3:
    return TilingScheme.quadTreeIdentity;
  case 4:
    return TilingScheme.quadTreeMercator;
  case 5:
    return TilingScheme.quadTreeEquirectangular;
  default:
    throw StateError("Invalid numeric value $handle for TilingScheme enum.");
  }
}

void sdkMapviewDatasourceTilingschemeReleaseFfiHandle(int handle) {}

final _sdkMapviewDatasourceTilingschemeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_datasource_TilingScheme_create_handle_nullable'));
final _sdkMapviewDatasourceTilingschemeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_TilingScheme_release_handle_nullable'));
final _sdkMapviewDatasourceTilingschemeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_datasource_TilingScheme_get_value_nullable'));

Pointer<Void> sdkMapviewDatasourceTilingschemeToFfiNullable(TilingScheme? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewDatasourceTilingschemeToFfi(value);
  final result = _sdkMapviewDatasourceTilingschemeCreateHandleNullable(_handle);
  sdkMapviewDatasourceTilingschemeReleaseFfiHandle(_handle);
  return result;
}

TilingScheme? sdkMapviewDatasourceTilingschemeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewDatasourceTilingschemeGetValueNullable(handle);
  final result = sdkMapviewDatasourceTilingschemeFromFfi(_handle);
  sdkMapviewDatasourceTilingschemeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewDatasourceTilingschemeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewDatasourceTilingschemeReleaseHandleNullable(handle);

// End of TilingScheme "private" section.


