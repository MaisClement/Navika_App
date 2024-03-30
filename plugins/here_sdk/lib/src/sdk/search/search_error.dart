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

/// Specifies possible errors that may result from a search query.
enum SearchError {
    /// Search operation is not authenticated. Check your credentials.
    authenticationFailed,
    /// Should be in the range \[1, 100\].
    maxItemsOutOfRange,
    /// The route polyline is too long or half-width of the corridor is too small.
    /// Try passing a shorter polyline or increasing the half-width.
    polylineTooLong,
    /// Error while parsing response data.
    parsingError,
    /// No results found.
    noResultsFound,
    /// Network request error.
    httpError,
    /// Server unreachable.
    serverUnreachable,
    /// At least one of the parameters has an invalid value.
    invalidParameter,
    /// The credentials given do not provide access to the resource requested.
    forbidden,
    /// Credentials exceeded the allowed requests limit.
    exceededUsageLimit,
    /// Operation failed due to an internal error.
    operationFailed,
    /// Operation cancelled.
    operationCancelled,
    /// The request timed out.
    timedOut,
    /// The device does not have an internet connection.
    offline,
    /// Query is too long, max. size is 300 characters.
    queryTooLong,
    /// Filter is too long, max. size is 300 characters.
    filterTooLong,
    /// Proxy is not authenticated. Check your proxy credentials.
    proxyAuthenticationFailed,
    /// Proxy server unreachable.
    proxyServerUnreachable
}

// SearchError "private" section, not exported.

int sdkSearchSearcherrorToFfi(SearchError value) {
  switch (value) {
  case SearchError.authenticationFailed:
    return 1;
  case SearchError.maxItemsOutOfRange:
    return 2;
  case SearchError.polylineTooLong:
    return 3;
  case SearchError.parsingError:
    return 4;
  case SearchError.noResultsFound:
    return 5;
  case SearchError.httpError:
    return 6;
  case SearchError.serverUnreachable:
    return 7;
  case SearchError.invalidParameter:
    return 8;
  case SearchError.forbidden:
    return 9;
  case SearchError.exceededUsageLimit:
    return 10;
  case SearchError.operationFailed:
    return 11;
  case SearchError.operationCancelled:
    return 12;
  case SearchError.timedOut:
    return 13;
  case SearchError.offline:
    return 14;
  case SearchError.queryTooLong:
    return 15;
  case SearchError.filterTooLong:
    return 16;
  case SearchError.proxyAuthenticationFailed:
    return 17;
  case SearchError.proxyServerUnreachable:
    return 18;
  default:
    throw StateError("Invalid enum value $value for SearchError enum.");
  }
}

SearchError sdkSearchSearcherrorFromFfi(int handle) {
  switch (handle) {
  case 1:
    return SearchError.authenticationFailed;
  case 2:
    return SearchError.maxItemsOutOfRange;
  case 3:
    return SearchError.polylineTooLong;
  case 4:
    return SearchError.parsingError;
  case 5:
    return SearchError.noResultsFound;
  case 6:
    return SearchError.httpError;
  case 7:
    return SearchError.serverUnreachable;
  case 8:
    return SearchError.invalidParameter;
  case 9:
    return SearchError.forbidden;
  case 10:
    return SearchError.exceededUsageLimit;
  case 11:
    return SearchError.operationFailed;
  case 12:
    return SearchError.operationCancelled;
  case 13:
    return SearchError.timedOut;
  case 14:
    return SearchError.offline;
  case 15:
    return SearchError.queryTooLong;
  case 16:
    return SearchError.filterTooLong;
  case 17:
    return SearchError.proxyAuthenticationFailed;
  case 18:
    return SearchError.proxyServerUnreachable;
  default:
    throw StateError("Invalid numeric value $handle for SearchError enum.");
  }
}

void sdkSearchSearcherrorReleaseFfiHandle(int handle) {}

final _sdkSearchSearcherrorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_search_SearchError_create_handle_nullable'));
final _sdkSearchSearcherrorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchError_release_handle_nullable'));
final _sdkSearchSearcherrorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_SearchError_get_value_nullable'));

Pointer<Void> sdkSearchSearcherrorToFfiNullable(SearchError? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkSearchSearcherrorToFfi(value);
  final result = _sdkSearchSearcherrorCreateHandleNullable(_handle);
  sdkSearchSearcherrorReleaseFfiHandle(_handle);
  return result;
}

SearchError? sdkSearchSearcherrorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkSearchSearcherrorGetValueNullable(handle);
  final result = sdkSearchSearcherrorFromFfi(_handle);
  sdkSearchSearcherrorReleaseFfiHandle(_handle);
  return result;
}

void sdkSearchSearcherrorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchSearcherrorReleaseHandleNullable(handle);

// End of SearchError "private" section.


