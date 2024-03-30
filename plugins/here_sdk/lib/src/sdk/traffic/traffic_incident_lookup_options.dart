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
import 'package:here_sdk/src/sdk/core/language_code.dart';

/// All the options to specify how a single incident should be queried.

class TrafficIncidentLookupOptions {
  /// The language code of the query.
  /// If the code is null the incident is provided in the original language of the country that it belongs to.
  LanguageCode? languageCode;

  TrafficIncidentLookupOptions._(this.languageCode);
  /// Creates a new instance with default value.
  TrafficIncidentLookupOptions()
      : languageCode = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TrafficIncidentLookupOptions) return false;
    TrafficIncidentLookupOptions _other = other;
    return languageCode == _other.languageCode;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + languageCode.hashCode;
    return result;
  }
}


// TrafficIncidentLookupOptions "private" section, not exported.

final _sdkTrafficTrafficincidentlookupoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentLookupOptions_create_handle'));
final _sdkTrafficTrafficincidentlookupoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentLookupOptions_release_handle'));
final _sdkTrafficTrafficincidentlookupoptionsGetFieldlanguageCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentLookupOptions_get_field_languageCode'));



Pointer<Void> sdkTrafficTrafficincidentlookupoptionsToFfi(TrafficIncidentLookupOptions value) {
  final _languageCodeHandle = sdkCoreLanguagecodeToFfiNullable(value.languageCode);
  final _result = _sdkTrafficTrafficincidentlookupoptionsCreateHandle(_languageCodeHandle);
  sdkCoreLanguagecodeReleaseFfiHandleNullable(_languageCodeHandle);
  return _result;
}

TrafficIncidentLookupOptions sdkTrafficTrafficincidentlookupoptionsFromFfi(Pointer<Void> handle) {
  final _languageCodeHandle = _sdkTrafficTrafficincidentlookupoptionsGetFieldlanguageCode(handle);
  try {
    return TrafficIncidentLookupOptions._(
      sdkCoreLanguagecodeFromFfiNullable(_languageCodeHandle)
    );
  } finally {
    sdkCoreLanguagecodeReleaseFfiHandleNullable(_languageCodeHandle);
  }
}

void sdkTrafficTrafficincidentlookupoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkTrafficTrafficincidentlookupoptionsReleaseHandle(handle);

// Nullable TrafficIncidentLookupOptions

final _sdkTrafficTrafficincidentlookupoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentLookupOptions_create_handle_nullable'));
final _sdkTrafficTrafficincidentlookupoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentLookupOptions_release_handle_nullable'));
final _sdkTrafficTrafficincidentlookupoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentLookupOptions_get_value_nullable'));

Pointer<Void> sdkTrafficTrafficincidentlookupoptionsToFfiNullable(TrafficIncidentLookupOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficTrafficincidentlookupoptionsToFfi(value);
  final result = _sdkTrafficTrafficincidentlookupoptionsCreateHandleNullable(_handle);
  sdkTrafficTrafficincidentlookupoptionsReleaseFfiHandle(_handle);
  return result;
}

TrafficIncidentLookupOptions? sdkTrafficTrafficincidentlookupoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficTrafficincidentlookupoptionsGetValueNullable(handle);
  final result = sdkTrafficTrafficincidentlookupoptionsFromFfi(_handle);
  sdkTrafficTrafficincidentlookupoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficTrafficincidentlookupoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficincidentlookupoptionsReleaseHandleNullable(handle);

// End of TrafficIncidentLookupOptions "private" section.


