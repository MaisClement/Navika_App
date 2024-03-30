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

final _ffiGetCachedDartHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Handle Function(Pointer<Void>, Handle),
      Object? Function(Pointer<Void>, Object?)
    >('here_sdk_get_cached_dart_handle'));
final _ffiCacheDartHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
      Void Function(Pointer<Void>, Int32, Handle),
      void Function(Pointer<Void>, int, Object)
    >('here_sdk_cache_dart_handle'));

const unknownError = -1;

int _instanceCounter = 1024;
final Expando<int> tokenCache = Expando<int>();

// "Token" here is a unique-id stand-in for a Dart object on FFI side, to be used as a cache key where necessary.
// Dart_Handle cannot be used as a cache key in FFI due to lack of meaningful FFI-side hash function.
// Currently these tokens are only used for caching "proxy" objects and nothing else.
int getObjectToken(Object obj) {
  int? token = tokenCache[obj];
  if (token == null) {
    token = _instanceCounter++;
    tokenCache[obj] = token;
  }
  return token;
}

Object? getCachedInstance(Pointer<Void> handle) => _ffiGetCachedDartHandle(handle, null);

void cacheInstance(Pointer<Void> handle, Object obj) => _ffiCacheDartHandle(handle, __lib.LibraryContext.isolateId, obj);
