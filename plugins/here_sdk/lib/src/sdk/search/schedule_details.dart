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

/// Encapsulates schedule details complying with the iCalendar specification: https://tools.ietf.org/html/rfc5545.

class ScheduleDetails {
  /// Specifies when the iCalendar component begins, for example "T000000" (starts at midnight).
  String start;

  /// Specifies a positive duration of time for the iCalendar component, for example "PT24H00M" (lasts 24h).
  String duration;

  /// The recurrence information for a iCalendar component, for example "FREQ:DAILY;BYDAY:MO,TU,WE,TH,FR,SA".
  String recurrence;

  /// Creates a new instance.

  /// [start] Specifies when the iCalendar component begins, for example "T000000" (starts at midnight).

  /// [duration] Specifies a positive duration of time for the iCalendar component, for example "PT24H00M" (lasts 24h).

  /// [recurrence] The recurrence information for a iCalendar component, for example "FREQ:DAILY;BYDAY:MO,TU,WE,TH,FR,SA".

  ScheduleDetails(this.start, this.duration, this.recurrence);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ScheduleDetails) return false;
    ScheduleDetails _other = other;
    return start == _other.start &&
        duration == _other.duration &&
        recurrence == _other.recurrence;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + start.hashCode;
    result = 31 * result + duration.hashCode;
    result = 31 * result + recurrence.hashCode;
    return result;
  }
}


// ScheduleDetails "private" section, not exported.

final _sdkSearchScheduledetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_create_handle'));
final _sdkSearchScheduledetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_release_handle'));
final _sdkSearchScheduledetailsGetFieldstart = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_get_field_start'));
final _sdkSearchScheduledetailsGetFieldduration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_get_field_duration'));
final _sdkSearchScheduledetailsGetFieldrecurrence = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_get_field_recurrence'));



Pointer<Void> sdkSearchScheduledetailsToFfi(ScheduleDetails value) {
  final _startHandle = stringToFfi(value.start);
  final _durationHandle = stringToFfi(value.duration);
  final _recurrenceHandle = stringToFfi(value.recurrence);
  final _result = _sdkSearchScheduledetailsCreateHandle(_startHandle, _durationHandle, _recurrenceHandle);
  stringReleaseFfiHandle(_startHandle);
  stringReleaseFfiHandle(_durationHandle);
  stringReleaseFfiHandle(_recurrenceHandle);
  return _result;
}

ScheduleDetails sdkSearchScheduledetailsFromFfi(Pointer<Void> handle) {
  final _startHandle = _sdkSearchScheduledetailsGetFieldstart(handle);
  final _durationHandle = _sdkSearchScheduledetailsGetFieldduration(handle);
  final _recurrenceHandle = _sdkSearchScheduledetailsGetFieldrecurrence(handle);
  try {
    return ScheduleDetails(
      stringFromFfi(_startHandle), 
      stringFromFfi(_durationHandle), 
      stringFromFfi(_recurrenceHandle)
    );
  } finally {
    stringReleaseFfiHandle(_startHandle);
    stringReleaseFfiHandle(_durationHandle);
    stringReleaseFfiHandle(_recurrenceHandle);
  }
}

void sdkSearchScheduledetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkSearchScheduledetailsReleaseHandle(handle);

// Nullable ScheduleDetails

final _sdkSearchScheduledetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_create_handle_nullable'));
final _sdkSearchScheduledetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_release_handle_nullable'));
final _sdkSearchScheduledetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_ScheduleDetails_get_value_nullable'));

Pointer<Void> sdkSearchScheduledetailsToFfiNullable(ScheduleDetails? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchScheduledetailsToFfi(value);
  final result = _sdkSearchScheduledetailsCreateHandleNullable(_handle);
  sdkSearchScheduledetailsReleaseFfiHandle(_handle);
  return result;
}

ScheduleDetails? sdkSearchScheduledetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchScheduledetailsGetValueNullable(handle);
  final result = sdkSearchScheduledetailsFromFfi(_handle);
  sdkSearchScheduledetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchScheduledetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchScheduledetailsReleaseHandleNullable(handle);

// End of ScheduleDetails "private" section.


