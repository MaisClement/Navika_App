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

/// Lists the available HERE SDK endpoints that can be customized with a custom backend base URL.
enum EngineBaseURL {
    /// Indicates a `SearchEngine` endpoint.
    /// Note that the provided string value will replace the base URL.
    /// The endpoint names for this engine are "v1/discover", "v1/geocode", "v1/revgeocode",
    /// "v1/autosuggest", "v1/lookup" and "v1/browse". A valid base string value
    /// could look like "www.my-company.com". An example of the resulting URL for the first
    /// endpoint looks like this: "https://www.my-company.com/v1/discover" appended with
    /// query data. You need to ensure that the provided base URL supports all required endpoints.
    searchEngine,
    /// Indicates a `RoutingEngine` endpoint.
    /// Note that the provided string value will replace the base URL.
    /// The endpoint names for this engine are "v8/routes", "v8/import". A valid base string value
    /// could look like "www.my-company.com". An example of the resulting URL for the first
    /// endpoint looks like this: "https://www.my-company.com/v8/routes" appended with
    /// query data. You need to ensure that the provided base URL supports all required endpoints.
    routingEngine,
    /// Indicates base url for `Authentication`.
    /// Note that the provided string value will replace the base URL.
    /// The endpoint name for this base url is "oauth2/token". A valid base string value
    /// could look like "www.my-company.com". An example of the resulting URL for the
    /// endpoint looks like this: "https://www.my-company.com/oauth2/token" appended with
    /// query data. You need to ensure that the provided base URL supports required endpoint.
    authentication,
    /// Specifies the endpoint URL for a map catalog. This is only relevant for editions that use
    /// OCM based map data such as the_ Navigate Edition_ when a custom catalog configuration
    /// should be loaded.
    /// By default, the data Service proxy, in short [DS_PROXY], is set to "https://direct.data.api.platform.here.com/direct/v1".
    /// When a custom catalog should be used, then the HERE SDK will internally do a lookup request
    /// to find out which URL to use to access catalog. In order to bypass this extra request, we
    /// recommend to set the URL upfront when initializing the HERE SDK.
    /// For example, a valid [DS_PROXY] for a custom catalog may look like this:
    /// "https://data.api.platform.yourcompany.com/direct/v1".
    /// Note that this is not a network proxy setting.
    /// If you do not load a custom catalog configuration, you can ignore this setting.
    dsProxy,
    /// Indicates a `Traffic Data` endpoint.
    /// Note that the provided string value will replace the base URL.
    /// This is only relevant for TrafficEngine. For traffic incident and flow presented in the map view,
    /// please use [EngineBaseURL.trafficVectorTileService].
    trafficData,
    /// Indicates a `Traffic Vector Tile API` endpoint.
    /// Note that the provided string value will replace the base URL.
    /// This is only relevant for traffic presented in the map view. For the TrafficEngine, please use [EngineBaseURL.trafficData].
    ///
    /// The service needs to comply with https://www.here.com/docs/bundle/traffic-vector-tile-api-v2-api-reference/page/index.html
    /// The endpoint name for this engine is "v2/traffictiles". A valid base string value
    /// could look like "www.my-company.com". The resulting URL looks like this:
    /// "https://www.my-company.com/v2/traffictiles/{layer}/mc/{z}/{x}/{y}/omv", with concrete tile
    /// IDs in {x}, {y}, {z} and {layers} in (flow, incidents).
    /// You need to ensure that the provided base URL supports all required endpoints.
    trafficVectorTileService
}

// EngineBaseURL "private" section, not exported.

int sdkCoreEngineEnginebaseurlToFfi(EngineBaseURL value) {
  switch (value) {
  case EngineBaseURL.searchEngine:
    return 0;
  case EngineBaseURL.routingEngine:
    return 1;
  case EngineBaseURL.authentication:
    return 2;
  case EngineBaseURL.dsProxy:
    return 3;
  case EngineBaseURL.trafficData:
    return 4;
  case EngineBaseURL.trafficVectorTileService:
    return 5;
  default:
    throw StateError("Invalid enum value $value for EngineBaseURL enum.");
  }
}

EngineBaseURL sdkCoreEngineEnginebaseurlFromFfi(int handle) {
  switch (handle) {
  case 0:
    return EngineBaseURL.searchEngine;
  case 1:
    return EngineBaseURL.routingEngine;
  case 2:
    return EngineBaseURL.authentication;
  case 3:
    return EngineBaseURL.dsProxy;
  case 4:
    return EngineBaseURL.trafficData;
  case 5:
    return EngineBaseURL.trafficVectorTileService;
  default:
    throw StateError("Invalid numeric value $handle for EngineBaseURL enum.");
  }
}

void sdkCoreEngineEnginebaseurlReleaseFfiHandle(int handle) {}

final _sdkCoreEngineEnginebaseurlCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_engine_EngineBaseURL_create_handle_nullable'));
final _sdkCoreEngineEnginebaseurlReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_EngineBaseURL_release_handle_nullable'));
final _sdkCoreEngineEnginebaseurlGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_EngineBaseURL_get_value_nullable'));

Pointer<Void> sdkCoreEngineEnginebaseurlToFfiNullable(EngineBaseURL? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineEnginebaseurlToFfi(value);
  final result = _sdkCoreEngineEnginebaseurlCreateHandleNullable(_handle);
  sdkCoreEngineEnginebaseurlReleaseFfiHandle(_handle);
  return result;
}

EngineBaseURL? sdkCoreEngineEnginebaseurlFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineEnginebaseurlGetValueNullable(handle);
  final result = sdkCoreEngineEnginebaseurlFromFfi(_handle);
  sdkCoreEngineEnginebaseurlReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineEnginebaseurlReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineEnginebaseurlReleaseHandleNullable(handle);

// End of EngineBaseURL "private" section.


