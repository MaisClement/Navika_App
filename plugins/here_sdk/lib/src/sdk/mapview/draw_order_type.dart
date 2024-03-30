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

/// Specifies the type of map item draw order.
///
/// Map item rendering behavior is chosen based on the draw order type.
/// Regardless of a draw order type map items with a higher draw order are drawn on top of map items with a lower draw order.
/// When having map items in a scene with the same draw order, but with different draw order types
/// [DrawOrderType.mapSceneAdditionOrderDependent] and [DrawOrderType.mapSceneAdditionOrderIndependent],
/// [DrawOrderType.mapSceneAdditionOrderDependent] items will be rendered on top of [DrawOrderType.mapSceneAdditionOrderIndependent]
/// ones.
enum DrawOrderType {
    /// Draw order depends on the order of map item addition to a map scene.
    /// Multiple map items of the same type with the same draw order are drawn in the order of addition to a map scene.
    /// With this behavior map items are rendered one by one.
    mapSceneAdditionOrderDependent,
    /// Draw order does not depend on the order of map item addition to a map scene.
    /// Multiple map items of the same type with the same draw order are drawn in an arbitrary order and map items with similar
    /// attributes (e.g. color) are grouped and drawn together all at once for performance reasons. This way
    /// map items added/re-added to a map scene lastly may appear below already existing map items with the
    /// same draw order.
    mapSceneAdditionOrderIndependent
}

// DrawOrderType "private" section, not exported.

int sdkMapviewDrawordertypeToFfi(DrawOrderType value) {
  switch (value) {
  case DrawOrderType.mapSceneAdditionOrderDependent:
    return 0;
  case DrawOrderType.mapSceneAdditionOrderIndependent:
    return 1;
  default:
    throw StateError("Invalid enum value $value for DrawOrderType enum.");
  }
}

DrawOrderType sdkMapviewDrawordertypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return DrawOrderType.mapSceneAdditionOrderDependent;
  case 1:
    return DrawOrderType.mapSceneAdditionOrderIndependent;
  default:
    throw StateError("Invalid numeric value $handle for DrawOrderType enum.");
  }
}

void sdkMapviewDrawordertypeReleaseFfiHandle(int handle) {}

final _sdkMapviewDrawordertypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_DrawOrderType_create_handle_nullable'));
final _sdkMapviewDrawordertypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_DrawOrderType_release_handle_nullable'));
final _sdkMapviewDrawordertypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_DrawOrderType_get_value_nullable'));

Pointer<Void> sdkMapviewDrawordertypeToFfiNullable(DrawOrderType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewDrawordertypeToFfi(value);
  final result = _sdkMapviewDrawordertypeCreateHandleNullable(_handle);
  sdkMapviewDrawordertypeReleaseFfiHandle(_handle);
  return result;
}

DrawOrderType? sdkMapviewDrawordertypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewDrawordertypeGetValueNullable(handle);
  final result = sdkMapviewDrawordertypeFromFfi(_handle);
  sdkMapviewDrawordertypeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewDrawordertypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewDrawordertypeReleaseHandleNullable(handle);

// End of DrawOrderType "private" section.


