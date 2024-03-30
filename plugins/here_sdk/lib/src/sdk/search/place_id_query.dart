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
import 'package:meta/meta.dart';


/// The options to specify a Place id query.
@immutable
class PlaceIdQuery {
  /// Desired Place id to search.
  final String id;

  const PlaceIdQuery._(this.id);
  /// Constructs a PlaceIdQuery from the provided Place id.
  ///
  /// [id] Desired Place id to search.
  ///
  factory PlaceIdQuery(String id) => $prototype.make(id);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PlaceIdQuery) return false;
    PlaceIdQuery _other = other;
    return id == _other.id;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + id.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = PlaceIdQuery$Impl();
}


// PlaceIdQuery "private" section, not exported.

final _sdkSearchPlaceidqueryCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdQuery_create_handle'));
final _sdkSearchPlaceidqueryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdQuery_release_handle'));
final _sdkSearchPlaceidqueryGetFieldid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdQuery_get_field_id'));



/// @nodoc
@visibleForTesting
class PlaceIdQuery$Impl {
  PlaceIdQuery make(String id) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_PlaceIdQuery_make__String'));
    final _idHandle = stringToFfi(id);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _idHandle);
    stringReleaseFfiHandle(_idHandle);
    try {
      return sdkSearchPlaceidqueryFromFfi(__resultHandle);
    } finally {
      sdkSearchPlaceidqueryReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkSearchPlaceidqueryToFfi(PlaceIdQuery value) {
  final _idHandle = stringToFfi(value.id);
  final _result = _sdkSearchPlaceidqueryCreateHandle(_idHandle);
  stringReleaseFfiHandle(_idHandle);
  return _result;
}

PlaceIdQuery sdkSearchPlaceidqueryFromFfi(Pointer<Void> handle) {
  final _idHandle = _sdkSearchPlaceidqueryGetFieldid(handle);
  try {
    return PlaceIdQuery._(
      stringFromFfi(_idHandle)
    );
  } finally {
    stringReleaseFfiHandle(_idHandle);
  }
}

void sdkSearchPlaceidqueryReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchPlaceidqueryReleaseHandle(handle);

// Nullable PlaceIdQuery

final _sdkSearchPlaceidqueryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdQuery_create_handle_nullable'));
final _sdkSearchPlaceidqueryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdQuery_release_handle_nullable'));
final _sdkSearchPlaceidqueryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_PlaceIdQuery_get_value_nullable'));

Pointer<Void> sdkSearchPlaceidqueryToFfiNullable(PlaceIdQuery? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchPlaceidqueryToFfi(value);
  final result = _sdkSearchPlaceidqueryCreateHandleNullable(_handle);
  sdkSearchPlaceidqueryReleaseFfiHandle(_handle);
  return result;
}

PlaceIdQuery? sdkSearchPlaceidqueryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchPlaceidqueryGetValueNullable(handle);
  final result = sdkSearchPlaceidqueryFromFfi(_handle);
  sdkSearchPlaceidqueryReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchPlaceidqueryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchPlaceidqueryReleaseHandleNullable(handle);

// End of PlaceIdQuery "private" section.


