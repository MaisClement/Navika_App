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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;

/// A style that defines the visual appearance of map rendered features.
///
/// A [Style] can be created using a [JsonStyleFactory].
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
/// behavior. Related APIs may change for new releases without a deprecation process.
abstract class Style {

}


// Style "private" section, not exported.

final _sdkMapviewStyleRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_Style_register_finalizer'));
final _sdkMapviewStyleCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_Style_copy_handle'));
final _sdkMapviewStyleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_Style_release_handle'));


class Style$Impl extends __lib.NativeBase implements Style {

  Style$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkMapviewStyleToFfi(Style value) =>
  _sdkMapviewStyleCopyHandle((value as __lib.NativeBase).handle);

Style sdkMapviewStyleFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Style) return instance;

  final _copiedHandle = _sdkMapviewStyleCopyHandle(handle);
  final result = Style$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewStyleRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewStyleReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewStyleReleaseHandle(handle);

Pointer<Void> sdkMapviewStyleToFfiNullable(Style? value) =>
  value != null ? sdkMapviewStyleToFfi(value) : Pointer<Void>.fromAddress(0);

Style? sdkMapviewStyleFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewStyleFromFfi(handle) : null;

void sdkMapviewStyleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewStyleReleaseHandle(handle);

// End of Style "private" section.


