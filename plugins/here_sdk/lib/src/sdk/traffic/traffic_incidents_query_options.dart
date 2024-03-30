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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/language_code.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_impact.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_type.dart';

/// The options to specify how incidents should be queried.

class TrafficIncidentsQueryOptions {
  /// The list of incident types to be queried. If the list is empty, all types will be queried.
  List<TrafficIncidentType> typeFilter;

  /// The list of incident impacts to be queried. If the list is empty, all incident impacts will be queried.
  List<TrafficIncidentImpact> impactFilter;

  /// The earliest start time of incidents to be queried.
  /// If the value is null filtering by the earliest start time is not applied.
  DateTime? earliestStartTime;

  /// The latest end time of incidents to be queried.
  /// If the value is null filtering by the latest end time is not applied.
  DateTime? latestEndTime;

  /// The language code of the query.
  /// It's the expected language of fields [TrafficIncidentBase.description] and [TrafficIncident.summary] in the relevant response.
  /// However, the language code doesn't impact on [TrafficLocation.description].
  /// If the language code is null the response fields are expected in the original language of the country that the incident belongs to.
  /// If the language code is not supported it will fallback to [LanguageCode.enUs].
  LanguageCode? languageCode;

  TrafficIncidentsQueryOptions._(this.typeFilter, this.impactFilter, this.earliestStartTime, this.latestEndTime, this.languageCode);
  /// Creates a new instance with default values.
  TrafficIncidentsQueryOptions()
      : typeFilter = [], impactFilter = [], earliestStartTime = null, latestEndTime = null, languageCode = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TrafficIncidentsQueryOptions) return false;
    TrafficIncidentsQueryOptions _other = other;
    return DeepCollectionEquality().equals(typeFilter, _other.typeFilter) &&
        DeepCollectionEquality().equals(impactFilter, _other.impactFilter) &&
        earliestStartTime == _other.earliestStartTime &&
        latestEndTime == _other.latestEndTime &&
        languageCode == _other.languageCode;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(typeFilter);
    result = 31 * result + DeepCollectionEquality().hash(impactFilter);
    result = 31 * result + earliestStartTime.hashCode;
    result = 31 * result + latestEndTime.hashCode;
    result = 31 * result + languageCode.hashCode;
    return result;
  }
}


// TrafficIncidentsQueryOptions "private" section, not exported.

final _sdkTrafficTrafficincidentsqueryoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryOptions_create_handle'));
final _sdkTrafficTrafficincidentsqueryoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryOptions_release_handle'));
final _sdkTrafficTrafficincidentsqueryoptionsGetFieldtypeFilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryOptions_get_field_typeFilter'));
final _sdkTrafficTrafficincidentsqueryoptionsGetFieldimpactFilter = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryOptions_get_field_impactFilter'));
final _sdkTrafficTrafficincidentsqueryoptionsGetFieldearliestStartTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryOptions_get_field_earliestStartTime'));
final _sdkTrafficTrafficincidentsqueryoptionsGetFieldlatestEndTime = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryOptions_get_field_latestEndTime'));
final _sdkTrafficTrafficincidentsqueryoptionsGetFieldlanguageCode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryOptions_get_field_languageCode'));



Pointer<Void> sdkTrafficTrafficincidentsqueryoptionsToFfi(TrafficIncidentsQueryOptions value) {
  final _typeFilterHandle = heresdkTrafficBindingslistofSdkTrafficTrafficincidenttypeToFfi(value.typeFilter);
  final _impactFilterHandle = heresdkTrafficBindingslistofSdkTrafficTrafficincidentimpactToFfi(value.impactFilter);
  final _earliestStartTimeHandle = dateToFfiNullable(value.earliestStartTime);
  final _latestEndTimeHandle = dateToFfiNullable(value.latestEndTime);
  final _languageCodeHandle = sdkCoreLanguagecodeToFfiNullable(value.languageCode);
  final _result = _sdkTrafficTrafficincidentsqueryoptionsCreateHandle(_typeFilterHandle, _impactFilterHandle, _earliestStartTimeHandle, _latestEndTimeHandle, _languageCodeHandle);
  heresdkTrafficBindingslistofSdkTrafficTrafficincidenttypeReleaseFfiHandle(_typeFilterHandle);
  heresdkTrafficBindingslistofSdkTrafficTrafficincidentimpactReleaseFfiHandle(_impactFilterHandle);
  dateReleaseFfiHandleNullable(_earliestStartTimeHandle);
  dateReleaseFfiHandleNullable(_latestEndTimeHandle);
  sdkCoreLanguagecodeReleaseFfiHandleNullable(_languageCodeHandle);
  return _result;
}

TrafficIncidentsQueryOptions sdkTrafficTrafficincidentsqueryoptionsFromFfi(Pointer<Void> handle) {
  final _typeFilterHandle = _sdkTrafficTrafficincidentsqueryoptionsGetFieldtypeFilter(handle);
  final _impactFilterHandle = _sdkTrafficTrafficincidentsqueryoptionsGetFieldimpactFilter(handle);
  final _earliestStartTimeHandle = _sdkTrafficTrafficincidentsqueryoptionsGetFieldearliestStartTime(handle);
  final _latestEndTimeHandle = _sdkTrafficTrafficincidentsqueryoptionsGetFieldlatestEndTime(handle);
  final _languageCodeHandle = _sdkTrafficTrafficincidentsqueryoptionsGetFieldlanguageCode(handle);
  try {
    return TrafficIncidentsQueryOptions._(
      heresdkTrafficBindingslistofSdkTrafficTrafficincidenttypeFromFfi(_typeFilterHandle), 
      heresdkTrafficBindingslistofSdkTrafficTrafficincidentimpactFromFfi(_impactFilterHandle), 
      dateFromFfiNullable(_earliestStartTimeHandle), 
      dateFromFfiNullable(_latestEndTimeHandle), 
      sdkCoreLanguagecodeFromFfiNullable(_languageCodeHandle)
    );
  } finally {
    heresdkTrafficBindingslistofSdkTrafficTrafficincidenttypeReleaseFfiHandle(_typeFilterHandle);
    heresdkTrafficBindingslistofSdkTrafficTrafficincidentimpactReleaseFfiHandle(_impactFilterHandle);
    dateReleaseFfiHandleNullable(_earliestStartTimeHandle);
    dateReleaseFfiHandleNullable(_latestEndTimeHandle);
    sdkCoreLanguagecodeReleaseFfiHandleNullable(_languageCodeHandle);
  }
}

void sdkTrafficTrafficincidentsqueryoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkTrafficTrafficincidentsqueryoptionsReleaseHandle(handle);

// Nullable TrafficIncidentsQueryOptions

final _sdkTrafficTrafficincidentsqueryoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryOptions_create_handle_nullable'));
final _sdkTrafficTrafficincidentsqueryoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryOptions_release_handle_nullable'));
final _sdkTrafficTrafficincidentsqueryoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficIncidentsQueryOptions_get_value_nullable'));

Pointer<Void> sdkTrafficTrafficincidentsqueryoptionsToFfiNullable(TrafficIncidentsQueryOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficTrafficincidentsqueryoptionsToFfi(value);
  final result = _sdkTrafficTrafficincidentsqueryoptionsCreateHandleNullable(_handle);
  sdkTrafficTrafficincidentsqueryoptionsReleaseFfiHandle(_handle);
  return result;
}

TrafficIncidentsQueryOptions? sdkTrafficTrafficincidentsqueryoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficTrafficincidentsqueryoptionsGetValueNullable(handle);
  final result = sdkTrafficTrafficincidentsqueryoptionsFromFfi(_handle);
  sdkTrafficTrafficincidentsqueryoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficTrafficincidentsqueryoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficincidentsqueryoptionsReleaseHandleNullable(handle);

// End of TrafficIncidentsQueryOptions "private" section.


