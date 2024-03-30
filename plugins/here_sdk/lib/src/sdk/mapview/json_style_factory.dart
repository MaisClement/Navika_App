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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/mapview/style.dart';
import 'package:meta/meta.dart';

/// A factory of [Style] objects from styles defined in JSON format.
///
/// For more details see Custom Layer Style Reference in the documentation.
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
/// behavior. Related APIs may change for new releases without a deprecation process.
abstract class JsonStyleFactory {

  /// Creates an instance of Style from a JSON string.
  ///
  /// [styleString] JSON style string.
  ///
  /// Returns [Style]. Style instance.
  ///
  /// Throws [JsonStyleFactoryInstantiationException]. Indicates failure to create [Style] from JSON string.
  ///
  static Style createFromString(String styleString) => $prototype.createFromString(styleString);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = JsonStyleFactory$Impl(Pointer<Void>.fromAddress(0));
}

/// Describes reasons for failing to create a [Style] from a JSON source.
enum JsonStyleFactoryInstantiationErrorCode {
    /// JSON parsing failed.
    malformedJsonContent,
    /// JSON style syntax validation failed.
    invalidJsonStyleSyntax
}

// JsonStyleFactoryInstantiationErrorCode "private" section, not exported.

int sdkMapviewJsonstylefactoryInstantiationerrorcodeToFfi(JsonStyleFactoryInstantiationErrorCode value) {
  switch (value) {
  case JsonStyleFactoryInstantiationErrorCode.malformedJsonContent:
    return 1;
  case JsonStyleFactoryInstantiationErrorCode.invalidJsonStyleSyntax:
    return 2;
  default:
    throw StateError("Invalid enum value $value for JsonStyleFactoryInstantiationErrorCode enum.");
  }
}

JsonStyleFactoryInstantiationErrorCode sdkMapviewJsonstylefactoryInstantiationerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return JsonStyleFactoryInstantiationErrorCode.malformedJsonContent;
  case 2:
    return JsonStyleFactoryInstantiationErrorCode.invalidJsonStyleSyntax;
  default:
    throw StateError("Invalid numeric value $handle for JsonStyleFactoryInstantiationErrorCode enum.");
  }
}

void sdkMapviewJsonstylefactoryInstantiationerrorcodeReleaseFfiHandle(int handle) {}

final _sdkMapviewJsonstylefactoryInstantiationerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_JsonStyleFactory_InstantiationErrorCode_create_handle_nullable'));
final _sdkMapviewJsonstylefactoryInstantiationerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_JsonStyleFactory_InstantiationErrorCode_release_handle_nullable'));
final _sdkMapviewJsonstylefactoryInstantiationerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_JsonStyleFactory_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdkMapviewJsonstylefactoryInstantiationerrorcodeToFfiNullable(JsonStyleFactoryInstantiationErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewJsonstylefactoryInstantiationerrorcodeToFfi(value);
  final result = _sdkMapviewJsonstylefactoryInstantiationerrorcodeCreateHandleNullable(_handle);
  sdkMapviewJsonstylefactoryInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

JsonStyleFactoryInstantiationErrorCode? sdkMapviewJsonstylefactoryInstantiationerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewJsonstylefactoryInstantiationerrorcodeGetValueNullable(handle);
  final result = sdkMapviewJsonstylefactoryInstantiationerrorcodeFromFfi(_handle);
  sdkMapviewJsonstylefactoryInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewJsonstylefactoryInstantiationerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewJsonstylefactoryInstantiationerrorcodeReleaseHandleNullable(handle);

// End of JsonStyleFactoryInstantiationErrorCode "private" section.
/// Thrown when failing to create a [Style] from a JSON source.
class JsonStyleFactoryInstantiationException implements Exception {
  final JsonStyleFactoryInstantiationErrorDetails error;
  JsonStyleFactoryInstantiationException(this.error);
}
/// Describes the reason for failing to create a [Style] from a JSON source.

class JsonStyleFactoryInstantiationErrorDetails {
  /// The error code.
  JsonStyleFactoryInstantiationErrorCode errorCode;

  /// A description of the error, if available.
  String? errorDescription;

  /// Creates a new instance.
  /// [errorCode] The error code.
  /// [errorDescription] A description of the error, if available.
  JsonStyleFactoryInstantiationErrorDetails(this.errorCode, this.errorDescription);
}


// JsonStyleFactoryInstantiationErrorDetails "private" section, not exported.

final _sdkMapviewJsonstylefactoryInstantiationerrordetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('here_sdk_sdk_mapview_JsonStyleFactory_InstantiationErrorDetails_create_handle'));
final _sdkMapviewJsonstylefactoryInstantiationerrordetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_JsonStyleFactory_InstantiationErrorDetails_release_handle'));
final _sdkMapviewJsonstylefactoryInstantiationerrordetailsGetFielderrorCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_JsonStyleFactory_InstantiationErrorDetails_get_field_errorCode'));
final _sdkMapviewJsonstylefactoryInstantiationerrordetailsGetFielderrorDescription = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_JsonStyleFactory_InstantiationErrorDetails_get_field_errorDescription'));



Pointer<Void> sdkMapviewJsonstylefactoryInstantiationerrordetailsToFfi(JsonStyleFactoryInstantiationErrorDetails value) {
  final _errorCodeHandle = sdkMapviewJsonstylefactoryInstantiationerrorcodeToFfi(value.errorCode);
  final _errorDescriptionHandle = stringToFfiNullable(value.errorDescription);
  final _result = _sdkMapviewJsonstylefactoryInstantiationerrordetailsCreateHandle(_errorCodeHandle, _errorDescriptionHandle);
  sdkMapviewJsonstylefactoryInstantiationerrorcodeReleaseFfiHandle(_errorCodeHandle);
  stringReleaseFfiHandleNullable(_errorDescriptionHandle);
  return _result;
}

JsonStyleFactoryInstantiationErrorDetails sdkMapviewJsonstylefactoryInstantiationerrordetailsFromFfi(Pointer<Void> handle) {
  final _errorCodeHandle = _sdkMapviewJsonstylefactoryInstantiationerrordetailsGetFielderrorCode(handle);
  final _errorDescriptionHandle = _sdkMapviewJsonstylefactoryInstantiationerrordetailsGetFielderrorDescription(handle);
  try {
    return JsonStyleFactoryInstantiationErrorDetails(
      sdkMapviewJsonstylefactoryInstantiationerrorcodeFromFfi(_errorCodeHandle), 
      stringFromFfiNullable(_errorDescriptionHandle)
    );
  } finally {
    sdkMapviewJsonstylefactoryInstantiationerrorcodeReleaseFfiHandle(_errorCodeHandle);
    stringReleaseFfiHandleNullable(_errorDescriptionHandle);
  }
}

void sdkMapviewJsonstylefactoryInstantiationerrordetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewJsonstylefactoryInstantiationerrordetailsReleaseHandle(handle);

// Nullable JsonStyleFactoryInstantiationErrorDetails

final _sdkMapviewJsonstylefactoryInstantiationerrordetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_JsonStyleFactory_InstantiationErrorDetails_create_handle_nullable'));
final _sdkMapviewJsonstylefactoryInstantiationerrordetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_JsonStyleFactory_InstantiationErrorDetails_release_handle_nullable'));
final _sdkMapviewJsonstylefactoryInstantiationerrordetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_JsonStyleFactory_InstantiationErrorDetails_get_value_nullable'));

Pointer<Void> sdkMapviewJsonstylefactoryInstantiationerrordetailsToFfiNullable(JsonStyleFactoryInstantiationErrorDetails? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewJsonstylefactoryInstantiationerrordetailsToFfi(value);
  final result = _sdkMapviewJsonstylefactoryInstantiationerrordetailsCreateHandleNullable(_handle);
  sdkMapviewJsonstylefactoryInstantiationerrordetailsReleaseFfiHandle(_handle);
  return result;
}

JsonStyleFactoryInstantiationErrorDetails? sdkMapviewJsonstylefactoryInstantiationerrordetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewJsonstylefactoryInstantiationerrordetailsGetValueNullable(handle);
  final result = sdkMapviewJsonstylefactoryInstantiationerrordetailsFromFfi(_handle);
  sdkMapviewJsonstylefactoryInstantiationerrordetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewJsonstylefactoryInstantiationerrordetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewJsonstylefactoryInstantiationerrordetailsReleaseHandleNullable(handle);

// End of JsonStyleFactoryInstantiationErrorDetails "private" section.

// JsonStyleFactory "private" section, not exported.

final _sdkMapviewJsonstylefactoryRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_JsonStyleFactory_register_finalizer'));
final _sdkMapviewJsonstylefactoryCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_JsonStyleFactory_copy_handle'));
final _sdkMapviewJsonstylefactoryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_JsonStyleFactory_release_handle'));


final _createFromStringsdkMapviewJsonstylefactoryCreatefromstringStringReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_JsonStyleFactory_createFromString__String_return_release_handle'));
final _createFromStringsdkMapviewJsonstylefactoryCreatefromstringStringReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_JsonStyleFactory_createFromString__String_return_get_result'));
final _createFromStringsdkMapviewJsonstylefactoryCreatefromstringStringReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_JsonStyleFactory_createFromString__String_return_get_error'));
final _createFromStringsdkMapviewJsonstylefactoryCreatefromstringStringReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_JsonStyleFactory_createFromString__String_return_has_error'));


/// @nodoc
@visibleForTesting
class JsonStyleFactory$Impl extends __lib.NativeBase implements JsonStyleFactory {

  JsonStyleFactory$Impl(Pointer<Void> handle) : super(handle);

  Style createFromString(String styleString) {
    final _createFromStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_JsonStyleFactory_createFromString__String'));
    final _styleStringHandle = stringToFfi(styleString);
    final __callResultHandle = _createFromStringFfi(__lib.LibraryContext.isolateId, _styleStringHandle);
    stringReleaseFfiHandle(_styleStringHandle);
    if (_createFromStringsdkMapviewJsonstylefactoryCreatefromstringStringReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _createFromStringsdkMapviewJsonstylefactoryCreatefromstringStringReturnGetError(__callResultHandle);
        _createFromStringsdkMapviewJsonstylefactoryCreatefromstringStringReturnReleaseHandle(__callResultHandle);
        try {
          throw JsonStyleFactoryInstantiationException(sdkMapviewJsonstylefactoryInstantiationerrordetailsFromFfi(__errorHandle));
        } finally {
          sdkMapviewJsonstylefactoryInstantiationerrordetailsReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _createFromStringsdkMapviewJsonstylefactoryCreatefromstringStringReturnGetResult(__callResultHandle);
    _createFromStringsdkMapviewJsonstylefactoryCreatefromstringStringReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMapviewStyleFromFfi(__resultHandle);
    } finally {
      sdkMapviewStyleReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkMapviewJsonstylefactoryToFfi(JsonStyleFactory value) =>
  _sdkMapviewJsonstylefactoryCopyHandle((value as __lib.NativeBase).handle);

JsonStyleFactory sdkMapviewJsonstylefactoryFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is JsonStyleFactory) return instance;

  final _copiedHandle = _sdkMapviewJsonstylefactoryCopyHandle(handle);
  final result = JsonStyleFactory$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewJsonstylefactoryRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewJsonstylefactoryReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewJsonstylefactoryReleaseHandle(handle);

Pointer<Void> sdkMapviewJsonstylefactoryToFfiNullable(JsonStyleFactory? value) =>
  value != null ? sdkMapviewJsonstylefactoryToFfi(value) : Pointer<Void>.fromAddress(0);

JsonStyleFactory? sdkMapviewJsonstylefactoryFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewJsonstylefactoryFromFfi(handle) : null;

void sdkMapviewJsonstylefactoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewJsonstylefactoryReleaseHandle(handle);

// End of JsonStyleFactory "private" section.


