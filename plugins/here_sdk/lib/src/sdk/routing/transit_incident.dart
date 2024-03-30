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
import 'package:here_sdk/src/sdk/routing/transit_incident_effect.dart';
import 'package:here_sdk/src/sdk/routing/transit_incident_type.dart';

/// A transit incident describes disruptions on the transit network.
///
/// Disruptions scale from delays to service cancellations.

class TransitIncident {
  /// A human readable summary of the incident.
  String? summary;

  /// A human readable description of the incident
  String? description;

  /// Type of the incident.
  TransitIncidentType? type;

  /// Effect of the incident.
  TransitIncidentEffect? effect;

  /// Valid from.
  DateTime? validFrom;

  /// Valid until.
  DateTime? validUntil;

  /// Link to the original incident published at the agency website.
  String? url;

  /// Creates a new instance.
  /// [summary] A human readable summary of the incident.
  /// [description] A human readable description of the incident
  /// [type] Type of the incident.
  /// [effect] Effect of the incident.
  /// [validFrom] Valid from.
  /// [validUntil] Valid until.
  /// [url] Link to the original incident published at the agency website.
  TransitIncident(this.summary, this.description, this.type, this.effect, this.validFrom, this.validUntil, this.url);
}


// TransitIncident "private" section, not exported.

final _sdkRoutingTransitincidentCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_create_handle'));
final _sdkRoutingTransitincidentReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_release_handle'));
final _sdkRoutingTransitincidentGetFieldsummary = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_field_summary'));
final _sdkRoutingTransitincidentGetFielddescription = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_field_description'));
final _sdkRoutingTransitincidentGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_field_type'));
final _sdkRoutingTransitincidentGetFieldeffect = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_field_effect'));
final _sdkRoutingTransitincidentGetFieldvalidFrom = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_field_validFrom'));
final _sdkRoutingTransitincidentGetFieldvalidUntil = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_field_validUntil'));
final _sdkRoutingTransitincidentGetFieldurl = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_field_url'));



Pointer<Void> sdkRoutingTransitincidentToFfi(TransitIncident value) {
  final _summaryHandle = stringToFfiNullable(value.summary);
  final _descriptionHandle = stringToFfiNullable(value.description);
  final _typeHandle = sdkRoutingTransitincidenttypeToFfiNullable(value.type);
  final _effectHandle = sdkRoutingTransitincidenteffectToFfiNullable(value.effect);
  final _validFromHandle = dateToFfiNullable(value.validFrom);
  final _validUntilHandle = dateToFfiNullable(value.validUntil);
  final _urlHandle = stringToFfiNullable(value.url);
  final _result = _sdkRoutingTransitincidentCreateHandle(_summaryHandle, _descriptionHandle, _typeHandle, _effectHandle, _validFromHandle, _validUntilHandle, _urlHandle);
  stringReleaseFfiHandleNullable(_summaryHandle);
  stringReleaseFfiHandleNullable(_descriptionHandle);
  sdkRoutingTransitincidenttypeReleaseFfiHandleNullable(_typeHandle);
  sdkRoutingTransitincidenteffectReleaseFfiHandleNullable(_effectHandle);
  dateReleaseFfiHandleNullable(_validFromHandle);
  dateReleaseFfiHandleNullable(_validUntilHandle);
  stringReleaseFfiHandleNullable(_urlHandle);
  return _result;
}

TransitIncident sdkRoutingTransitincidentFromFfi(Pointer<Void> handle) {
  final _summaryHandle = _sdkRoutingTransitincidentGetFieldsummary(handle);
  final _descriptionHandle = _sdkRoutingTransitincidentGetFielddescription(handle);
  final _typeHandle = _sdkRoutingTransitincidentGetFieldtype(handle);
  final _effectHandle = _sdkRoutingTransitincidentGetFieldeffect(handle);
  final _validFromHandle = _sdkRoutingTransitincidentGetFieldvalidFrom(handle);
  final _validUntilHandle = _sdkRoutingTransitincidentGetFieldvalidUntil(handle);
  final _urlHandle = _sdkRoutingTransitincidentGetFieldurl(handle);
  try {
    return TransitIncident(
      stringFromFfiNullable(_summaryHandle), 
      stringFromFfiNullable(_descriptionHandle), 
      sdkRoutingTransitincidenttypeFromFfiNullable(_typeHandle), 
      sdkRoutingTransitincidenteffectFromFfiNullable(_effectHandle), 
      dateFromFfiNullable(_validFromHandle), 
      dateFromFfiNullable(_validUntilHandle), 
      stringFromFfiNullable(_urlHandle)
    );
  } finally {
    stringReleaseFfiHandleNullable(_summaryHandle);
    stringReleaseFfiHandleNullable(_descriptionHandle);
    sdkRoutingTransitincidenttypeReleaseFfiHandleNullable(_typeHandle);
    sdkRoutingTransitincidenteffectReleaseFfiHandleNullable(_effectHandle);
    dateReleaseFfiHandleNullable(_validFromHandle);
    dateReleaseFfiHandleNullable(_validUntilHandle);
    stringReleaseFfiHandleNullable(_urlHandle);
  }
}

void sdkRoutingTransitincidentReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingTransitincidentReleaseHandle(handle);

// Nullable TransitIncident

final _sdkRoutingTransitincidentCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_create_handle_nullable'));
final _sdkRoutingTransitincidentReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_release_handle_nullable'));
final _sdkRoutingTransitincidentGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitIncident_get_value_nullable'));

Pointer<Void> sdkRoutingTransitincidentToFfiNullable(TransitIncident? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTransitincidentToFfi(value);
  final result = _sdkRoutingTransitincidentCreateHandleNullable(_handle);
  sdkRoutingTransitincidentReleaseFfiHandle(_handle);
  return result;
}

TransitIncident? sdkRoutingTransitincidentFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTransitincidentGetValueNullable(handle);
  final result = sdkRoutingTransitincidentFromFfi(_handle);
  sdkRoutingTransitincidentReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTransitincidentReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTransitincidentReleaseHandleNullable(handle);

// End of TransitIncident "private" section.


