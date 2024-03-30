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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/search/fuel_additive.dart';
import 'package:here_sdk/src/sdk/transport/fuel_type.dart';

/// Contains generic fuel type info of fuel station.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and
/// unexpected behaviors. Related APIs may change for new releases without a deprecation process.

class GenericFuel {
  /// The type of the fuel.
  FuelType type;

  /// The list of available fuel additives.
  /// The list can be empty when no fuel additives are available or when the information is unknown.
  List<FuelAdditive> additives;

  /// Creates a new instance.

  /// [type] The type of the fuel.

  /// [additives] The list of available fuel additives.
  /// The list can be empty when no fuel additives are available or when the information is unknown.

  GenericFuel._(this.type, this.additives);
  GenericFuel(FuelType type)
    : type = type, additives = [];
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GenericFuel) return false;
    GenericFuel _other = other;
    return type == _other.type &&
        DeepCollectionEquality().equals(additives, _other.additives);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + type.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(additives);
    return result;
  }
}


// GenericFuel "private" section, not exported.

final _sdkSearchGenericfuelCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('here_sdk_sdk_search_GenericFuel_create_handle'));
final _sdkSearchGenericfuelReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_GenericFuel_release_handle'));
final _sdkSearchGenericfuelGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_GenericFuel_get_field_type'));
final _sdkSearchGenericfuelGetFieldadditives = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_GenericFuel_get_field_additives'));



Pointer<Void> sdkSearchGenericfuelToFfi(GenericFuel value) {
  final _typeHandle = sdkTransportFueltypeToFfi(value.type);
  final _additivesHandle = heresdkSearchCommonBindingslistofSdkSearchFueladditiveToFfi(value.additives);
  final _result = _sdkSearchGenericfuelCreateHandle(_typeHandle, _additivesHandle);
  sdkTransportFueltypeReleaseFfiHandle(_typeHandle);
  heresdkSearchCommonBindingslistofSdkSearchFueladditiveReleaseFfiHandle(_additivesHandle);
  return _result;
}

GenericFuel sdkSearchGenericfuelFromFfi(Pointer<Void> handle) {
  final _typeHandle = _sdkSearchGenericfuelGetFieldtype(handle);
  final _additivesHandle = _sdkSearchGenericfuelGetFieldadditives(handle);
  try {
    return GenericFuel._(
      sdkTransportFueltypeFromFfi(_typeHandle), 
      heresdkSearchCommonBindingslistofSdkSearchFueladditiveFromFfi(_additivesHandle)
    );
  } finally {
    sdkTransportFueltypeReleaseFfiHandle(_typeHandle);
    heresdkSearchCommonBindingslistofSdkSearchFueladditiveReleaseFfiHandle(_additivesHandle);
  }
}

void sdkSearchGenericfuelReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchGenericfuelReleaseHandle(handle);

// Nullable GenericFuel

final _sdkSearchGenericfuelCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_GenericFuel_create_handle_nullable'));
final _sdkSearchGenericfuelReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_GenericFuel_release_handle_nullable'));
final _sdkSearchGenericfuelGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_GenericFuel_get_value_nullable'));

Pointer<Void> sdkSearchGenericfuelToFfiNullable(GenericFuel? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchGenericfuelToFfi(value);
  final result = _sdkSearchGenericfuelCreateHandleNullable(_handle);
  sdkSearchGenericfuelReleaseFfiHandle(_handle);
  return result;
}

GenericFuel? sdkSearchGenericfuelFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchGenericfuelGetValueNullable(handle);
  final result = sdkSearchGenericfuelFromFfi(_handle);
  sdkSearchGenericfuelReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchGenericfuelReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchGenericfuelReleaseHandleNullable(handle);

// End of GenericFuel "private" section.


