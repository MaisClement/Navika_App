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

/// Parameters related to HERE Places chain system.

class PlaceChain {
  /// Identifier number for an associated chain. For example, the chain ID "8778" corresponds to the chain name "ABC Shop".
  /// The complete list of supported chain IDs can be found [here](https://developer.here.com/documentation/geocoding-search-api/dev_guide/topics-places/places-chain-system-full.html).
  String id;

  /// Creates a new instance.

  /// [id] Identifier number for an associated chain. For example, the chain ID "8778" corresponds to the chain name "ABC Shop".
  /// The complete list of supported chain IDs can be found [here](https://developer.here.com/documentation/geocoding-search-api/dev_guide/topics-places/places-chain-system-full.html).

  PlaceChain(this.id);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PlaceChain) return false;
    PlaceChain _other = other;
    return id == _other.id;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + id.hashCode;
    return result;
  }
}


// PlaceChain "private" section, not exported.

final _sdkSearchPlacechainCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceChain_create_handle'));
final _sdkSearchPlacechainReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceChain_release_handle'));
final _sdkSearchPlacechainGetFieldid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceChain_get_field_id'));



Pointer<Void> sdkSearchPlacechainToFfi(PlaceChain value) {
  final _idHandle = stringToFfi(value.id);
  final _result = _sdkSearchPlacechainCreateHandle(_idHandle);
  stringReleaseFfiHandle(_idHandle);
  return _result;
}

PlaceChain sdkSearchPlacechainFromFfi(Pointer<Void> handle) {
  final _idHandle = _sdkSearchPlacechainGetFieldid(handle);
  try {
    return PlaceChain(
      stringFromFfi(_idHandle)
    );
  } finally {
    stringReleaseFfiHandle(_idHandle);
  }
}

void sdkSearchPlacechainReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchPlacechainReleaseHandle(handle);

// Nullable PlaceChain

final _sdkSearchPlacechainCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceChain_create_handle_nullable'));
final _sdkSearchPlacechainReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceChain_release_handle_nullable'));
final _sdkSearchPlacechainGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceChain_get_value_nullable'));

Pointer<Void> sdkSearchPlacechainToFfiNullable(PlaceChain? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchPlacechainToFfi(value);
  final result = _sdkSearchPlacechainCreateHandleNullable(_handle);
  sdkSearchPlacechainReleaseFfiHandle(_handle);
  return result;
}

PlaceChain? sdkSearchPlacechainFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchPlacechainGetValueNullable(handle);
  final result = sdkSearchPlacechainFromFfi(_handle);
  sdkSearchPlacechainReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchPlacechainReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchPlacechainReleaseHandleNullable(handle);

// End of PlaceChain "private" section.


