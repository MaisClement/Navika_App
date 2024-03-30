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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/agency.dart';
import 'package:here_sdk/src/sdk/routing/attribution.dart';
import 'package:here_sdk/src/sdk/routing/fare.dart';
import 'package:here_sdk/src/sdk/routing/transit_incident.dart';
import 'package:here_sdk/src/sdk/routing/transit_stop.dart';
import 'package:here_sdk/src/sdk/routing/transit_transport.dart';

/// Gives the details of a transit section.

class TransitSectionDetails {
  /// Transit transport information.
  TransitTransport? transport;

  /// All the intermediate stops between departure and destination of this section.
  List<TransitStop> intermediateStops;

  /// Contains information about a particular agency.
  Agency agency;

  /// List of required attributions to display.
  List<Attribution> attributions;

  /// List of tickets to pay for this section of the route.
  ///
  /// **Note:** Currently, fare information is not supported and the list will be always empty.
  List<Fare> fares;

  /// A list of all incidents that apply to the section.
  List<TransitIncident> incidents;

  /// Creates a new instance.

  /// [transport] Transit transport information.

  /// [intermediateStops] All the intermediate stops between departure and destination of this section.

  /// [agency] Contains information about a particular agency.

  /// [attributions] List of required attributions to display.

  /// [fares] List of tickets to pay for this section of the route.
  ///
  /// **Note:** Currently, fare information is not supported and the list will be always empty.

  /// [incidents] A list of all incidents that apply to the section.

  TransitSectionDetails._(this.transport, this.intermediateStops, this.agency, this.attributions, this.fares, this.incidents);
  /// Creates a new instance.
  /// [agency] Contains information about a particular agency.
  TransitSectionDetails(this.agency)
      : transport = null, intermediateStops = [], attributions = [], fares = [], incidents = [];
}


// TransitSectionDetails "private" section, not exported.

final _sdkRoutingTransitsectiondetailsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_create_handle'));
final _sdkRoutingTransitsectiondetailsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_release_handle'));
final _sdkRoutingTransitsectiondetailsGetFieldtransport = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_get_field_transport'));
final _sdkRoutingTransitsectiondetailsGetFieldintermediateStops = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_get_field_intermediateStops'));
final _sdkRoutingTransitsectiondetailsGetFieldagency = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_get_field_agency'));
final _sdkRoutingTransitsectiondetailsGetFieldattributions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_get_field_attributions'));
final _sdkRoutingTransitsectiondetailsGetFieldfares = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_get_field_fares'));
final _sdkRoutingTransitsectiondetailsGetFieldincidents = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_get_field_incidents'));



Pointer<Void> sdkRoutingTransitsectiondetailsToFfi(TransitSectionDetails value) {
  final _transportHandle = sdkRoutingTransittransportToFfiNullable(value.transport);
  final _intermediateStopsHandle = heresdkRoutingCommonBindingslistofSdkRoutingTransitstopToFfi(value.intermediateStops);
  final _agencyHandle = sdkRoutingAgencyToFfi(value.agency);
  final _attributionsHandle = heresdkRoutingCommonBindingslistofSdkRoutingAttributionToFfi(value.attributions);
  final _faresHandle = heresdkRoutingCommonBindingslistofSdkRoutingFareToFfi(value.fares);
  final _incidentsHandle = heresdkRoutingCommonBindingslistofSdkRoutingTransitincidentToFfi(value.incidents);
  final _result = _sdkRoutingTransitsectiondetailsCreateHandle(_transportHandle, _intermediateStopsHandle, _agencyHandle, _attributionsHandle, _faresHandle, _incidentsHandle);
  sdkRoutingTransittransportReleaseFfiHandleNullable(_transportHandle);
  heresdkRoutingCommonBindingslistofSdkRoutingTransitstopReleaseFfiHandle(_intermediateStopsHandle);
  sdkRoutingAgencyReleaseFfiHandle(_agencyHandle);
  heresdkRoutingCommonBindingslistofSdkRoutingAttributionReleaseFfiHandle(_attributionsHandle);
  heresdkRoutingCommonBindingslistofSdkRoutingFareReleaseFfiHandle(_faresHandle);
  heresdkRoutingCommonBindingslistofSdkRoutingTransitincidentReleaseFfiHandle(_incidentsHandle);
  return _result;
}

TransitSectionDetails sdkRoutingTransitsectiondetailsFromFfi(Pointer<Void> handle) {
  final _transportHandle = _sdkRoutingTransitsectiondetailsGetFieldtransport(handle);
  final _intermediateStopsHandle = _sdkRoutingTransitsectiondetailsGetFieldintermediateStops(handle);
  final _agencyHandle = _sdkRoutingTransitsectiondetailsGetFieldagency(handle);
  final _attributionsHandle = _sdkRoutingTransitsectiondetailsGetFieldattributions(handle);
  final _faresHandle = _sdkRoutingTransitsectiondetailsGetFieldfares(handle);
  final _incidentsHandle = _sdkRoutingTransitsectiondetailsGetFieldincidents(handle);
  try {
    return TransitSectionDetails._(
      sdkRoutingTransittransportFromFfiNullable(_transportHandle), 
      heresdkRoutingCommonBindingslistofSdkRoutingTransitstopFromFfi(_intermediateStopsHandle), 
      sdkRoutingAgencyFromFfi(_agencyHandle), 
      heresdkRoutingCommonBindingslistofSdkRoutingAttributionFromFfi(_attributionsHandle), 
      heresdkRoutingCommonBindingslistofSdkRoutingFareFromFfi(_faresHandle), 
      heresdkRoutingCommonBindingslistofSdkRoutingTransitincidentFromFfi(_incidentsHandle)
    );
  } finally {
    sdkRoutingTransittransportReleaseFfiHandleNullable(_transportHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingTransitstopReleaseFfiHandle(_intermediateStopsHandle);
    sdkRoutingAgencyReleaseFfiHandle(_agencyHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingAttributionReleaseFfiHandle(_attributionsHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingFareReleaseFfiHandle(_faresHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingTransitincidentReleaseFfiHandle(_incidentsHandle);
  }
}

void sdkRoutingTransitsectiondetailsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingTransitsectiondetailsReleaseHandle(handle);

// Nullable TransitSectionDetails

final _sdkRoutingTransitsectiondetailsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_create_handle_nullable'));
final _sdkRoutingTransitsectiondetailsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_release_handle_nullable'));
final _sdkRoutingTransitsectiondetailsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_TransitSectionDetails_get_value_nullable'));

Pointer<Void> sdkRoutingTransitsectiondetailsToFfiNullable(TransitSectionDetails? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingTransitsectiondetailsToFfi(value);
  final result = _sdkRoutingTransitsectiondetailsCreateHandleNullable(_handle);
  sdkRoutingTransitsectiondetailsReleaseFfiHandle(_handle);
  return result;
}

TransitSectionDetails? sdkRoutingTransitsectiondetailsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingTransitsectiondetailsGetValueNullable(handle);
  final result = sdkRoutingTransitsectiondetailsFromFfi(_handle);
  sdkRoutingTransitsectiondetailsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingTransitsectiondetailsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingTransitsectiondetailsReleaseHandleNullable(handle);

// End of TransitSectionDetails "private" section.


