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

/// Holds information to which part of the text, input query was matched.
///
/// The first character is denoted by a value of 0.
/// This API is not supported by offline search.
abstract class IndexRange {

  /// Gets the position of the first character that matches a query.
  int get start;

  /// Gets the position indicating the end of the highlighted part, exclusive.
  int get end;

}


// IndexRange "private" section, not exported.

final _sdkSearchIndexrangeRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_IndexRange_register_finalizer'));
final _sdkSearchIndexrangeCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_IndexRange_copy_handle'));
final _sdkSearchIndexrangeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_IndexRange_release_handle'));


class IndexRange$Impl extends __lib.NativeBase implements IndexRange {

  IndexRange$Impl(Pointer<Void> handle) : super(handle);

  @override
  int get start {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_search_IndexRange_start_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  int get end {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_search_IndexRange_end_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }



}

Pointer<Void> sdkSearchIndexrangeToFfi(IndexRange value) =>
  _sdkSearchIndexrangeCopyHandle((value as __lib.NativeBase).handle);

IndexRange sdkSearchIndexrangeFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is IndexRange) return instance;

  final _copiedHandle = _sdkSearchIndexrangeCopyHandle(handle);
  final result = IndexRange$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkSearchIndexrangeRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchIndexrangeReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchIndexrangeReleaseHandle(handle);

Pointer<Void> sdkSearchIndexrangeToFfiNullable(IndexRange? value) =>
  value != null ? sdkSearchIndexrangeToFfi(value) : Pointer<Void>.fromAddress(0);

IndexRange? sdkSearchIndexrangeFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkSearchIndexrangeFromFfi(handle) : null;

void sdkSearchIndexrangeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchIndexrangeReleaseHandle(handle);

// End of IndexRange "private" section.


