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
import 'package:here_sdk/src/sdk/routing/attribution_type.dart';

/// Holds all the data on a URL address to an external resource.

class Attribution {
  /// Unique identifier for the web link.
  /// It is used to deduplicate links defined in multiple sections.
  /// @nodoc
  String _id;

  /// An URL address that links to a particular resource.
  String? href;

  /// Text describing the url address (e.g. The example website).
  String text;

  /// The interactive (or clickable) portion of the text. If not present (default),
  /// the entire content of the text attribute will be considered.
  String? hrefText;

  /// Attribution link type.
  AttributionType type;

  /// Creates a new instance.

  /// [id] Unique identifier for the web link.
  /// It is used to deduplicate links defined in multiple sections.

  /// [href] An URL address that links to a particular resource.

  /// [text] Text describing the url address (e.g. The example website).

  /// [hrefText] The interactive (or clickable) portion of the text. If not present (default),
  /// the entire content of the text attribute will be considered.

  /// [type] Attribution link type.

  Attribution._(this._id, this.href, this.text, this.hrefText, this.type);
  Attribution(String id, String text, AttributionType type)
    : _id = id, href = null, text = text, hrefText = null, type = type;
}


// Attribution "private" section, not exported.

final _sdkRoutingAttributionCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint32),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_routing_Attribution_create_handle'));
final _sdkRoutingAttributionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_release_handle'));
final _sdkRoutingAttributionGetFieldid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_get_field_id'));
final _sdkRoutingAttributionGetFieldhref = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_get_field_href'));
final _sdkRoutingAttributionGetFieldtext = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_get_field_text'));
final _sdkRoutingAttributionGetFieldhrefText = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_get_field_hrefText'));
final _sdkRoutingAttributionGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_get_field_type'));



Pointer<Void> sdkRoutingAttributionToFfi(Attribution value) {
  final _idHandle = stringToFfi(value._id);
  final _hrefHandle = stringToFfiNullable(value.href);
  final _textHandle = stringToFfi(value.text);
  final _hrefTextHandle = stringToFfiNullable(value.hrefText);
  final _typeHandle = sdkRoutingAttributiontypeToFfi(value.type);
  final _result = _sdkRoutingAttributionCreateHandle(_idHandle, _hrefHandle, _textHandle, _hrefTextHandle, _typeHandle);
  stringReleaseFfiHandle(_idHandle);
  stringReleaseFfiHandleNullable(_hrefHandle);
  stringReleaseFfiHandle(_textHandle);
  stringReleaseFfiHandleNullable(_hrefTextHandle);
  sdkRoutingAttributiontypeReleaseFfiHandle(_typeHandle);
  return _result;
}

Attribution sdkRoutingAttributionFromFfi(Pointer<Void> handle) {
  final _idHandle = _sdkRoutingAttributionGetFieldid(handle);
  final _hrefHandle = _sdkRoutingAttributionGetFieldhref(handle);
  final _textHandle = _sdkRoutingAttributionGetFieldtext(handle);
  final _hrefTextHandle = _sdkRoutingAttributionGetFieldhrefText(handle);
  final _typeHandle = _sdkRoutingAttributionGetFieldtype(handle);
  try {
    return Attribution._(
      stringFromFfi(_idHandle), 
      stringFromFfiNullable(_hrefHandle), 
      stringFromFfi(_textHandle), 
      stringFromFfiNullable(_hrefTextHandle), 
      sdkRoutingAttributiontypeFromFfi(_typeHandle)
    );
  } finally {
    stringReleaseFfiHandle(_idHandle);
    stringReleaseFfiHandleNullable(_hrefHandle);
    stringReleaseFfiHandle(_textHandle);
    stringReleaseFfiHandleNullable(_hrefTextHandle);
    sdkRoutingAttributiontypeReleaseFfiHandle(_typeHandle);
  }
}

void sdkRoutingAttributionReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingAttributionReleaseHandle(handle);

// Nullable Attribution

final _sdkRoutingAttributionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_create_handle_nullable'));
final _sdkRoutingAttributionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_release_handle_nullable'));
final _sdkRoutingAttributionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Attribution_get_value_nullable'));

Pointer<Void> sdkRoutingAttributionToFfiNullable(Attribution? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingAttributionToFfi(value);
  final result = _sdkRoutingAttributionCreateHandleNullable(_handle);
  sdkRoutingAttributionReleaseFfiHandle(_handle);
  return result;
}

Attribution? sdkRoutingAttributionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingAttributionGetValueNullable(handle);
  final result = sdkRoutingAttributionFromFfi(_handle);
  sdkRoutingAttributionReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingAttributionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingAttributionReleaseHandleNullable(handle);

// End of Attribution "private" section.


