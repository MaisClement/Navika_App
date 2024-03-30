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

/// @nodoc

class IndoorLocationDataInternal {
  String venueId;

  int levelZIndex;

  IndoorLocationDataInternal(this.venueId, this.levelZIndex);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! IndoorLocationDataInternal) return false;
    IndoorLocationDataInternal _other = other;
    return venueId == _other.venueId &&
        levelZIndex == _other.levelZIndex;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + venueId.hashCode;
    result = 31 * result + levelZIndex.hashCode;
    return result;
  }
}


// IndoorLocationDataInternal "private" section, not exported.

final _sdkRoutingIndoorlocationdatainternalCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Int32),
    Pointer<Void> Function(Pointer<Void>, int)
  >('here_sdk_sdk_routing_IndoorLocationDataInternal_create_handle'));
final _sdkRoutingIndoorlocationdatainternalReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLocationDataInternal_release_handle'));
final _sdkRoutingIndoorlocationdatainternalGetFieldvenueId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLocationDataInternal_get_field_venueId'));
final _sdkRoutingIndoorlocationdatainternalGetFieldlevelZIndex = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLocationDataInternal_get_field_levelZIndex'));



Pointer<Void> sdkRoutingIndoorlocationdatainternalToFfi(IndoorLocationDataInternal value) {
  final _venueIdHandle = stringToFfi(value.venueId);
  final _levelZIndexHandle = (value.levelZIndex);
  final _result = _sdkRoutingIndoorlocationdatainternalCreateHandle(_venueIdHandle, _levelZIndexHandle);
  stringReleaseFfiHandle(_venueIdHandle);
  
  return _result;
}

IndoorLocationDataInternal sdkRoutingIndoorlocationdatainternalFromFfi(Pointer<Void> handle) {
  final _venueIdHandle = _sdkRoutingIndoorlocationdatainternalGetFieldvenueId(handle);
  final _levelZIndexHandle = _sdkRoutingIndoorlocationdatainternalGetFieldlevelZIndex(handle);
  try {
    return IndoorLocationDataInternal(
      stringFromFfi(_venueIdHandle), 
      (_levelZIndexHandle)
    );
  } finally {
    stringReleaseFfiHandle(_venueIdHandle);
    
  }
}

void sdkRoutingIndoorlocationdatainternalReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingIndoorlocationdatainternalReleaseHandle(handle);

// Nullable IndoorLocationDataInternal

final _sdkRoutingIndoorlocationdatainternalCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLocationDataInternal_create_handle_nullable'));
final _sdkRoutingIndoorlocationdatainternalReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLocationDataInternal_release_handle_nullable'));
final _sdkRoutingIndoorlocationdatainternalGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IndoorLocationDataInternal_get_value_nullable'));

Pointer<Void> sdkRoutingIndoorlocationdatainternalToFfiNullable(IndoorLocationDataInternal? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingIndoorlocationdatainternalToFfi(value);
  final result = _sdkRoutingIndoorlocationdatainternalCreateHandleNullable(_handle);
  sdkRoutingIndoorlocationdatainternalReleaseFfiHandle(_handle);
  return result;
}

IndoorLocationDataInternal? sdkRoutingIndoorlocationdatainternalFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingIndoorlocationdatainternalGetValueNullable(handle);
  final result = sdkRoutingIndoorlocationdatainternalFromFfi(_handle);
  sdkRoutingIndoorlocationdatainternalReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingIndoorlocationdatainternalReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingIndoorlocationdatainternalReleaseHandleNullable(handle);

// End of IndoorLocationDataInternal "private" section.


