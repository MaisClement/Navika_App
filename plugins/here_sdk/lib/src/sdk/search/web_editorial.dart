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
import 'package:here_sdk/src/sdk/search/web_source.dart';

/// Contains information about editorial article and a link to it.

class WebEditorial {
  /// Content of the editorial.
  String description;

  /// Information about language in which edtitorial was written.
  String language;

  /// Detailed information about editorial article.
  WebSource source;

  /// Creates a new instance.
  /// [description] Content of the editorial.
  /// [language] Information about language in which edtitorial was written.
  /// [source] Detailed information about editorial article.
  WebEditorial(this.description, this.language, this.source);
  /// Creates a new instance.
  WebEditorial.withDefaults()
      : description = "", language = "", source = WebSource.withDefaults();
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WebEditorial) return false;
    WebEditorial _other = other;
    return description == _other.description &&
        language == _other.language &&
        source == _other.source;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + description.hashCode;
    result = 31 * result + language.hashCode;
    result = 31 * result + source.hashCode;
    return result;
  }
}


// WebEditorial "private" section, not exported.

final _sdkSearchWebeditorialCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_create_handle'));
final _sdkSearchWebeditorialReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_release_handle'));
final _sdkSearchWebeditorialGetFielddescription = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_get_field_description'));
final _sdkSearchWebeditorialGetFieldlanguage = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_get_field_language'));
final _sdkSearchWebeditorialGetFieldsource = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_get_field_source'));



Pointer<Void> sdkSearchWebeditorialToFfi(WebEditorial value) {
  final _descriptionHandle = stringToFfi(value.description);
  final _languageHandle = stringToFfi(value.language);
  final _sourceHandle = sdkSearchWebsourceToFfi(value.source);
  final _result = _sdkSearchWebeditorialCreateHandle(_descriptionHandle, _languageHandle, _sourceHandle);
  stringReleaseFfiHandle(_descriptionHandle);
  stringReleaseFfiHandle(_languageHandle);
  sdkSearchWebsourceReleaseFfiHandle(_sourceHandle);
  return _result;
}

WebEditorial sdkSearchWebeditorialFromFfi(Pointer<Void> handle) {
  final _descriptionHandle = _sdkSearchWebeditorialGetFielddescription(handle);
  final _languageHandle = _sdkSearchWebeditorialGetFieldlanguage(handle);
  final _sourceHandle = _sdkSearchWebeditorialGetFieldsource(handle);
  try {
    return WebEditorial(
      stringFromFfi(_descriptionHandle), 
      stringFromFfi(_languageHandle), 
      sdkSearchWebsourceFromFfi(_sourceHandle)
    );
  } finally {
    stringReleaseFfiHandle(_descriptionHandle);
    stringReleaseFfiHandle(_languageHandle);
    sdkSearchWebsourceReleaseFfiHandle(_sourceHandle);
  }
}

void sdkSearchWebeditorialReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchWebeditorialReleaseHandle(handle);

// Nullable WebEditorial

final _sdkSearchWebeditorialCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_create_handle_nullable'));
final _sdkSearchWebeditorialReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_release_handle_nullable'));
final _sdkSearchWebeditorialGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_WebEditorial_get_value_nullable'));

Pointer<Void> sdkSearchWebeditorialToFfiNullable(WebEditorial? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchWebeditorialToFfi(value);
  final result = _sdkSearchWebeditorialCreateHandleNullable(_handle);
  sdkSearchWebeditorialReleaseFfiHandle(_handle);
  return result;
}

WebEditorial? sdkSearchWebeditorialFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchWebeditorialGetValueNullable(handle);
  final result = sdkSearchWebeditorialFromFfi(_handle);
  sdkSearchWebeditorialReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchWebeditorialReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchWebeditorialReleaseHandleNullable(handle);

// End of WebEditorial "private" section.


