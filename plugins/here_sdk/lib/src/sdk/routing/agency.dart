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

/// Holds all the agency information.

class Agency {
  /// Unique code of the agency.
  /// Specifies if the same agency is used on different sections of the same route.
  /// @nodoc
  String _id;

  /// Human readable name of the owner of the transport service.
  String name;

  /// Link to the agency's website.
  String? website;

  /// Creates a new instance.

  /// [id] Unique code of the agency.
  /// Specifies if the same agency is used on different sections of the same route.

  /// [name] Human readable name of the owner of the transport service.

  /// [website] Link to the agency's website.

  Agency._(this._id, this.name, this.website);
  Agency(String id, String name)
    : _id = id, name = name, website = null;
}


// Agency "private" section, not exported.

final _sdkRoutingAgencyCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_create_handle'));
final _sdkRoutingAgencyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_release_handle'));
final _sdkRoutingAgencyGetFieldid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_get_field_id'));
final _sdkRoutingAgencyGetFieldname = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_get_field_name'));
final _sdkRoutingAgencyGetFieldwebsite = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_get_field_website'));



Pointer<Void> sdkRoutingAgencyToFfi(Agency value) {
  final _idHandle = stringToFfi(value._id);
  final _nameHandle = stringToFfi(value.name);
  final _websiteHandle = stringToFfiNullable(value.website);
  final _result = _sdkRoutingAgencyCreateHandle(_idHandle, _nameHandle, _websiteHandle);
  stringReleaseFfiHandle(_idHandle);
  stringReleaseFfiHandle(_nameHandle);
  stringReleaseFfiHandleNullable(_websiteHandle);
  return _result;
}

Agency sdkRoutingAgencyFromFfi(Pointer<Void> handle) {
  final _idHandle = _sdkRoutingAgencyGetFieldid(handle);
  final _nameHandle = _sdkRoutingAgencyGetFieldname(handle);
  final _websiteHandle = _sdkRoutingAgencyGetFieldwebsite(handle);
  try {
    return Agency._(
      stringFromFfi(_idHandle), 
      stringFromFfi(_nameHandle), 
      stringFromFfiNullable(_websiteHandle)
    );
  } finally {
    stringReleaseFfiHandle(_idHandle);
    stringReleaseFfiHandle(_nameHandle);
    stringReleaseFfiHandleNullable(_websiteHandle);
  }
}

void sdkRoutingAgencyReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingAgencyReleaseHandle(handle);

// Nullable Agency

final _sdkRoutingAgencyCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_create_handle_nullable'));
final _sdkRoutingAgencyReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_release_handle_nullable'));
final _sdkRoutingAgencyGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Agency_get_value_nullable'));

Pointer<Void> sdkRoutingAgencyToFfiNullable(Agency? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingAgencyToFfi(value);
  final result = _sdkRoutingAgencyCreateHandleNullable(_handle);
  sdkRoutingAgencyReleaseFfiHandle(_handle);
  return result;
}

Agency? sdkRoutingAgencyFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingAgencyGetValueNullable(handle);
  final result = sdkRoutingAgencyFromFfi(_handle);
  sdkRoutingAgencyReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingAgencyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingAgencyReleaseHandleNullable(handle);

// End of Agency "private" section.


