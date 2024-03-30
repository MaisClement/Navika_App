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

/// This struct presents all the time data tied to a location, like an arrival or departure time.
///
/// The time data is originally specified in RFC 3339, section 5.6 format. For example,
/// "2022-03-23T16:07:31+01:00" in Cracow, Poland, i.e. a Central European Time (CET) location.
/// Note that this struct doesn't give any data on the tied location. The location should be derived
/// from the context.
@immutable
class LocationTime {
  /// The time as observed in the tied location. For example, if a route is requested in Cracow,
  /// Poland, the local time is "2022-03-23T16:07:31" in CET, i.e. one hour ahead of the UTC time.
  final DateTime localTime;

  /// The time as Coordinated Universal Time (UTC). For example, if a route is requested in Poland,
  /// the UTC time is "2022-03-23T15:07:31", i.e. one hour behind the local time.
  final DateTime utcTime;

  /// The UTC offset is the difference between the local time and the Coordinated Universal Time (UTC)
  /// in seconds. For example, if the local time is UTC+01:00, it is +3600 and if the local time is
  /// UTC-05:00, it is -18000.
  final Duration utcOffset;

  /// Creates a new instance.
  /// [localTime] The time as observed in the tied location. For example, if a route is requested in Cracow,
  /// Poland, the local time is "2022-03-23T16:07:31" in CET, i.e. one hour ahead of the UTC time.
  /// [utcTime] The time as Coordinated Universal Time (UTC). For example, if a route is requested in Poland,
  /// the UTC time is "2022-03-23T15:07:31", i.e. one hour behind the local time.
  /// [utcOffset] The UTC offset is the difference between the local time and the Coordinated Universal Time (UTC)
  /// in seconds. For example, if the local time is UTC+01:00, it is +3600 and if the local time is
  /// UTC-05:00, it is -18000.
  const LocationTime(this.localTime, this.utcTime, this.utcOffset);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LocationTime) return false;
    LocationTime _other = other;
    return localTime == _other.localTime &&
        utcTime == _other.utcTime &&
        utcOffset == _other.utcOffset;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + localTime.hashCode;
    result = 31 * result + utcTime.hashCode;
    result = 31 * result + utcOffset.hashCode;
    return result;
  }
}


// LocationTime "private" section, not exported.

final _sdkCoreLocationtimeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Uint64, Uint64),
    Pointer<Void> Function(int, int, int)
  >('here_sdk_sdk_core_LocationTime_create_handle'));
final _sdkCoreLocationtimeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationTime_release_handle'));
final _sdkCoreLocationtimeGetFieldlocalTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationTime_get_field_localTime'));
final _sdkCoreLocationtimeGetFieldutcTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationTime_get_field_utcTime'));
final _sdkCoreLocationtimeGetFieldutcOffset = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationTime_get_field_utcOffset'));



Pointer<Void> sdkCoreLocationtimeToFfi(LocationTime value) {
  final _localTimeHandle = dateToFfi(value.localTime);
  final _utcTimeHandle = dateToFfi(value.utcTime);
  final _utcOffsetHandle = durationToFfi(value.utcOffset);
  final _result = _sdkCoreLocationtimeCreateHandle(_localTimeHandle, _utcTimeHandle, _utcOffsetHandle);
  dateReleaseFfiHandle(_localTimeHandle);
  dateReleaseFfiHandle(_utcTimeHandle);
  durationReleaseFfiHandle(_utcOffsetHandle);
  return _result;
}

LocationTime sdkCoreLocationtimeFromFfi(Pointer<Void> handle) {
  final _localTimeHandle = _sdkCoreLocationtimeGetFieldlocalTime(handle);
  final _utcTimeHandle = _sdkCoreLocationtimeGetFieldutcTime(handle);
  final _utcOffsetHandle = _sdkCoreLocationtimeGetFieldutcOffset(handle);
  try {
    return LocationTime(
      dateFromFfi(_localTimeHandle), 
      dateFromFfi(_utcTimeHandle), 
      durationFromFfi(_utcOffsetHandle)
    );
  } finally {
    dateReleaseFfiHandle(_localTimeHandle);
    dateReleaseFfiHandle(_utcTimeHandle);
    durationReleaseFfiHandle(_utcOffsetHandle);
  }
}

void sdkCoreLocationtimeReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreLocationtimeReleaseHandle(handle);

// Nullable LocationTime

final _sdkCoreLocationtimeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationTime_create_handle_nullable'));
final _sdkCoreLocationtimeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationTime_release_handle_nullable'));
final _sdkCoreLocationtimeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_LocationTime_get_value_nullable'));

Pointer<Void> sdkCoreLocationtimeToFfiNullable(LocationTime? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreLocationtimeToFfi(value);
  final result = _sdkCoreLocationtimeCreateHandleNullable(_handle);
  sdkCoreLocationtimeReleaseFfiHandle(_handle);
  return result;
}

LocationTime? sdkCoreLocationtimeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreLocationtimeGetValueNullable(handle);
  final result = sdkCoreLocationtimeFromFfi(_handle);
  sdkCoreLocationtimeReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreLocationtimeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreLocationtimeReleaseHandleNullable(handle);

// End of LocationTime "private" section.


