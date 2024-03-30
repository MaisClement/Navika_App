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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';

/// Abstract class for storing arbitrary metadata types.
///
/// By implementing this abstract class, multiple object types can be stored as
/// desired, simply by adding fields to the implementation that refer to those
/// objects and then assigning an instance of the CustomMetadataValue derived class
/// to a map item.
abstract class CustomMetadataValue {
  /// Abstract class for storing arbitrary metadata types.
  ///
  /// By implementing this abstract class, multiple object types can be stored as
  /// desired, simply by adding fields to the implementation that refer to those
  /// objects and then assigning an instance of the CustomMetadataValue derived class
  /// to a map item.

  factory CustomMetadataValue(
    String Function() getTagLambda,

  ) => CustomMetadataValue$Lambdas(
    getTagLambda,

  );

  /// Obtains a tag that describes the instance of the abstract class.
  ///
  /// The tag is specific to the concrete implementation of the abstract class.
  ///
  /// Returns [String]. A tag describing the implementation of the abstract class.
  ///
  String getTag();
}


// CustomMetadataValue "private" section, not exported.

final _sdkCoreCustommetadatavalueRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_core_CustomMetadataValue_register_finalizer'));
final _sdkCoreCustommetadatavalueCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_CustomMetadataValue_copy_handle'));
final _sdkCoreCustommetadatavalueReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_CustomMetadataValue_release_handle'));
final _sdkCoreCustommetadatavalueCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_core_CustomMetadataValue_create_proxy'));
final _sdkCoreCustommetadatavalueGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_CustomMetadataValue_get_type_id'));


class CustomMetadataValue$Lambdas implements CustomMetadataValue {
  String Function() getTagLambda;

  CustomMetadataValue$Lambdas(
    this.getTagLambda,

  );

  @override
  String getTag() =>
    getTagLambda();
}

class CustomMetadataValue$Impl extends __lib.NativeBase implements CustomMetadataValue {

  CustomMetadataValue$Impl(Pointer<Void> handle) : super(handle);

  @override
  String getTag() {
    final _getTagFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_core_CustomMetadataValue_getTag'));
    final _handle = this.handle;
    final __resultHandle = _getTagFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


}

int _sdkCoreCustommetadatavaluegetTagStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  String? _resultObject;
  try {
    _resultObject = (_obj as CustomMetadataValue).getTag();
    _result.value = stringToFfi(_resultObject);
  } finally {
  }
  return 0;
}


Pointer<Void> sdkCoreCustommetadatavalueToFfi(CustomMetadataValue value) {
  if (value is __lib.NativeBase) return _sdkCoreCustommetadatavalueCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkCoreCustommetadatavalueCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkCoreCustommetadatavaluegetTagStatic, __lib.unknownError)
  );

  return result;
}

CustomMetadataValue sdkCoreCustommetadatavalueFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is CustomMetadataValue) return instance;

  final _typeIdHandle = _sdkCoreCustommetadatavalueGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkCoreCustommetadatavalueCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : CustomMetadataValue$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkCoreCustommetadatavalueRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkCoreCustommetadatavalueReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkCoreCustommetadatavalueReleaseHandle(handle);

Pointer<Void> sdkCoreCustommetadatavalueToFfiNullable(CustomMetadataValue? value) =>
  value != null ? sdkCoreCustommetadatavalueToFfi(value) : Pointer<Void>.fromAddress(0);

CustomMetadataValue? sdkCoreCustommetadatavalueFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkCoreCustommetadatavalueFromFfi(handle) : null;

void sdkCoreCustommetadatavalueReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreCustommetadatavalueReleaseHandle(handle);

// End of CustomMetadataValue "private" section.


