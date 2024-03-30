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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';

/// Base class to represent visual style of particular map items.
abstract class MapItemRepresentation {

}

/// @nodoc
abstract class MapItemRepresentationImpl {

}


// MapItemRepresentationImpl "private" section, not exported.

final _sdkMapviewMapitemrepresentationImplRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapItemRepresentation_Impl_register_finalizer'));
final _sdkMapviewMapitemrepresentationImplCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapItemRepresentation_Impl_copy_handle'));
final _sdkMapviewMapitemrepresentationImplReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapItemRepresentation_Impl_release_handle'));


class MapItemRepresentationImpl$Impl extends __lib.NativeBase implements MapItemRepresentationImpl {

  MapItemRepresentationImpl$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkMapviewMapitemrepresentationImplToFfi(MapItemRepresentationImpl value) =>
  _sdkMapviewMapitemrepresentationImplCopyHandle((value as __lib.NativeBase).handle);

MapItemRepresentationImpl sdkMapviewMapitemrepresentationImplFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapItemRepresentationImpl) return instance;

  final _copiedHandle = _sdkMapviewMapitemrepresentationImplCopyHandle(handle);
  final result = MapItemRepresentationImpl$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapitemrepresentationImplRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapitemrepresentationImplReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapitemrepresentationImplReleaseHandle(handle);

Pointer<Void> sdkMapviewMapitemrepresentationImplToFfiNullable(MapItemRepresentationImpl? value) =>
  value != null ? sdkMapviewMapitemrepresentationImplToFfi(value) : Pointer<Void>.fromAddress(0);

MapItemRepresentationImpl? sdkMapviewMapitemrepresentationImplFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapitemrepresentationImplFromFfi(handle) : null;

void sdkMapviewMapitemrepresentationImplReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapitemrepresentationImplReleaseHandle(handle);

// End of MapItemRepresentationImpl "private" section.

// MapItemRepresentation "private" section, not exported.

final _sdkMapviewMapitemrepresentationRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapItemRepresentation_register_finalizer'));
final _sdkMapviewMapitemrepresentationCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapItemRepresentation_copy_handle'));
final _sdkMapviewMapitemrepresentationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapItemRepresentation_release_handle'));
final _sdkMapviewMapitemrepresentationGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapItemRepresentation_get_type_id'));


class MapItemRepresentation$Impl extends __lib.NativeBase implements MapItemRepresentation {

  MapItemRepresentation$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkMapviewMapitemrepresentationToFfi(MapItemRepresentation value) =>
  _sdkMapviewMapitemrepresentationCopyHandle((value as __lib.NativeBase).handle);

MapItemRepresentation sdkMapviewMapitemrepresentationFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapItemRepresentation) return instance;

  final _typeIdHandle = _sdkMapviewMapitemrepresentationGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewMapitemrepresentationCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapItemRepresentation$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapitemrepresentationRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapitemrepresentationReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapitemrepresentationReleaseHandle(handle);

Pointer<Void> sdkMapviewMapitemrepresentationToFfiNullable(MapItemRepresentation? value) =>
  value != null ? sdkMapviewMapitemrepresentationToFfi(value) : Pointer<Void>.fromAddress(0);

MapItemRepresentation? sdkMapviewMapitemrepresentationFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapitemrepresentationFromFfi(handle) : null;

void sdkMapviewMapitemrepresentationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapitemrepresentationReleaseHandle(handle);

// End of MapItemRepresentation "private" section.


