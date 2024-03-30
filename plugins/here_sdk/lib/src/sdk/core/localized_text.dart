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
import 'package:intl/locale.dart';

/// Used to represent text localized to specific language.

class LocalizedText {
  /// Text value.
  String text;

  /// Locale of text, in most cases contains only language code.
  /// If locale is not supported by the platform, `null` is returned.
  Locale? locale;

  /// Creates a new instance.
  /// [text] Text value.
  /// [locale] Locale of text, in most cases contains only language code.
  /// If locale is not supported by the platform, `null` is returned.
  LocalizedText(this.text, this.locale);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LocalizedText) return false;
    LocalizedText _other = other;
    return text == _other.text &&
        locale == _other.locale;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + text.hashCode;
    result = 31 * result + locale.hashCode;
    return result;
  }
}


// LocalizedText "private" section, not exported.

final _sdkCoreLocalizedtextCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedText_create_handle'));
final _sdkCoreLocalizedtextReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedText_release_handle'));
final _sdkCoreLocalizedtextGetFieldtext = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedText_get_field_text'));
final _sdkCoreLocalizedtextGetFieldlocale = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedText_get_field_locale'));



Pointer<Void> sdkCoreLocalizedtextToFfi(LocalizedText value) {
  final _textHandle = stringToFfi(value.text);
  final _localeHandle = localeToFfiNullable(value.locale);
  final _result = _sdkCoreLocalizedtextCreateHandle(_textHandle, _localeHandle);
  stringReleaseFfiHandle(_textHandle);
  localeReleaseFfiHandleNullable(_localeHandle);
  return _result;
}

LocalizedText sdkCoreLocalizedtextFromFfi(Pointer<Void> handle) {
  final _textHandle = _sdkCoreLocalizedtextGetFieldtext(handle);
  final _localeHandle = _sdkCoreLocalizedtextGetFieldlocale(handle);
  try {
    return LocalizedText(
      stringFromFfi(_textHandle), 
      localeFromFfiNullable(_localeHandle)
    );
  } finally {
    stringReleaseFfiHandle(_textHandle);
    localeReleaseFfiHandleNullable(_localeHandle);
  }
}

void sdkCoreLocalizedtextReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreLocalizedtextReleaseHandle(handle);

// Nullable LocalizedText

final _sdkCoreLocalizedtextCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedText_create_handle_nullable'));
final _sdkCoreLocalizedtextReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedText_release_handle_nullable'));
final _sdkCoreLocalizedtextGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocalizedText_get_value_nullable'));

Pointer<Void> sdkCoreLocalizedtextToFfiNullable(LocalizedText? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreLocalizedtextToFfi(value);
  final result = _sdkCoreLocalizedtextCreateHandleNullable(_handle);
  sdkCoreLocalizedtextReleaseFfiHandle(_handle);
  return result;
}

LocalizedText? sdkCoreLocalizedtextFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreLocalizedtextGetValueNullable(handle);
  final result = sdkCoreLocalizedtextFromFfi(_handle);
  sdkCoreLocalizedtextReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreLocalizedtextReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreLocalizedtextReleaseHandleNullable(handle);

// End of LocalizedText "private" section.


