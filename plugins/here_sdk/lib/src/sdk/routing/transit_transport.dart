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
import 'dart:ui' as ui;
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/color.dart';
import 'package:here_sdk/src/sdk/routing/transit_mode.dart';

/// Holds all the transit transport information.

class TransitTransport {
  /// Transit mode of transport in the route.
  TransitMode mode;

  /// Transit line name.
  String? name;

  /// Transit line headsign.
  String? headsign;

  /// Human readable transport category (such as Bus, Gondola, Tram, Train, ...)
  String? category;

  /// Color of the transport polyline and background for the transport name.
  ui.Color? color;

  /// Color of the transport name.
  ui.Color? textColor;

  /// Creates a new instance.
  /// [mode] Transit mode of transport in the route.
  /// [name] Transit line name.
  /// [headsign] Transit line headsign.
  /// [category] Human readable transport category (such as Bus, Gondola, Tram, Train, ...)
  /// [color] Color of the transport polyline and background for the transport name.
  /// [textColor] Color of the transport name.
  TransitTransport(this.mode, this.name, this.headsign, this.category, this.color, this.textColor);
}


// TransitTransport "private" section, not exported.

final _sdkRoutingTransittransportCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_create_handle'));
final _sdkRoutingTransittransportReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_release_handle'));
final _sdkRoutingTransittransportGetFieldmode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_get_field_mode'));
final _sdkRoutingTransittransportGetFieldname = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_get_field_name'));
final _sdkRoutingTransittransportGetFieldheadsign = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_get_field_headsign'));
final _sdkRoutingTransittransportGetFieldcategory = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_get_field_category'));
final _sdkRoutingTransittransportGetFieldcolor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_get_field_color'));
final _sdkRoutingTransittransportGetFieldtextColor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_get_field_textColor'));



Pointer<Void> sdkRoutingTransittransportToFfi(TransitTransport value) {
  final _modeHandle = sdkRoutingTransitmodeToFfi(value.mode);
  final _nameHandle = stringToFfiNullable(value.name);
  final _headsignHandle = stringToFfiNullable(value.headsign);
  final _categoryHandle = stringToFfiNullable(value.category);
  final _colorHandle = sdkCoreColorToFfiNullable(value.color);
  final _textColorHandle = sdkCoreColorToFfiNullable(value.textColor);
  final _result = _sdkRoutingTransittransportCreateHandle(_modeHandle, _nameHandle, _headsignHandle, _categoryHandle, _colorHandle, _textColorHandle);
  sdkRoutingTransitmodeReleaseFfiHandle(_modeHandle);
  stringReleaseFfiHandleNullable(_nameHandle);
  stringReleaseFfiHandleNullable(_headsignHandle);
  stringReleaseFfiHandleNullable(_categoryHandle);
  sdkCoreColorReleaseFfiHandleNullable(_colorHandle);
  sdkCoreColorReleaseFfiHandleNullable(_textColorHandle);
  return _result;
}

TransitTransport sdkRoutingTransittransportFromFfi(Pointer<Void> handle) {
  final _modeHandle = _sdkRoutingTransittransportGetFieldmode(handle);
  final _nameHandle = _sdkRoutingTransittransportGetFieldname(handle);
  final _headsignHandle = _sdkRoutingTransittransportGetFieldheadsign(handle);
  final _categoryHandle = _sdkRoutingTransittransportGetFieldcategory(handle);
  final _colorHandle = _sdkRoutingTransittransportGetFieldcolor(handle);
  final _textColorHandle = _sdkRoutingTransittransportGetFieldtextColor(handle);
  try {
    return TransitTransport(
      sdkRoutingTransitmodeFromFfi(_modeHandle), 
      stringFromFfiNullable(_nameHandle), 
      stringFromFfiNullable(_headsignHandle), 
      stringFromFfiNullable(_categoryHandle), 
      sdkCoreColorFromFfiNullable(_colorHandle), 
      sdkCoreColorFromFfiNullable(_textColorHandle)
    );
  } finally {
    sdkRoutingTransitmodeReleaseFfiHandle(_modeHandle);
    stringReleaseFfiHandleNullable(_nameHandle);
    stringReleaseFfiHandleNullable(_headsignHandle);
    stringReleaseFfiHandleNullable(_categoryHandle);
    sdkCoreColorReleaseFfiHandleNullable(_colorHandle);
    sdkCoreColorReleaseFfiHandleNullable(_textColorHandle);
  }
}

void sdkRoutingTransittransportReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingTransittransportReleaseHandle(handle);

// Nullable TransitTransport

final _sdkRoutingTransittransportCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_create_handle_nullable'));
final _sdkRoutingTransittransportReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_release_handle_nullable'));
final _sdkRoutingTransittransportGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitTransport_get_value_nullable'));

Pointer<Void> sdkRoutingTransittransportToFfiNullable(TransitTransport? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTransittransportToFfi(value);
  final result = _sdkRoutingTransittransportCreateHandleNullable(_handle);
  sdkRoutingTransittransportReleaseFfiHandle(_handle);
  return result;
}

TransitTransport? sdkRoutingTransittransportFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTransittransportGetValueNullable(handle);
  final result = sdkRoutingTransittransportFromFfi(_handle);
  sdkRoutingTransittransportReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTransittransportReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTransittransportReleaseHandleNullable(handle);

// End of TransitTransport "private" section.


