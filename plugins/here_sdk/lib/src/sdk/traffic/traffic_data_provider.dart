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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;

/// This abstract class provides traffic information from
/// radio signals to other HERE SDK modules.
///
/// For now, only the `OfflineRoutingEngine` is supported.
///
/// For more information, take a look at the `TrafficBroadcast` class, if available for your edition.
///
/// **Note:** This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.
abstract class TrafficDataProvider {

}


// TrafficDataProvider "private" section, not exported.

final _sdkTrafficTrafficdataproviderRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_traffic_TrafficDataProvider_register_finalizer'));
final _sdkTrafficTrafficdataproviderCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficDataProvider_copy_handle'));
final _sdkTrafficTrafficdataproviderReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficDataProvider_release_handle'));


class TrafficDataProvider$Impl extends __lib.NativeBase implements TrafficDataProvider {

  TrafficDataProvider$Impl(Pointer<Void> handle) : super(handle);


}

Pointer<Void> sdkTrafficTrafficdataproviderToFfi(TrafficDataProvider value) =>
  _sdkTrafficTrafficdataproviderCopyHandle((value as __lib.NativeBase).handle);

TrafficDataProvider sdkTrafficTrafficdataproviderFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TrafficDataProvider) return instance;

  final _copiedHandle = _sdkTrafficTrafficdataproviderCopyHandle(handle);
  final result = TrafficDataProvider$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkTrafficTrafficdataproviderRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkTrafficTrafficdataproviderReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkTrafficTrafficdataproviderReleaseHandle(handle);

Pointer<Void> sdkTrafficTrafficdataproviderToFfiNullable(TrafficDataProvider? value) =>
  value != null ? sdkTrafficTrafficdataproviderToFfi(value) : Pointer<Void>.fromAddress(0);

TrafficDataProvider? sdkTrafficTrafficdataproviderFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkTrafficTrafficdataproviderFromFfi(handle) : null;

void sdkTrafficTrafficdataproviderReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficdataproviderReleaseHandle(handle);

// End of TrafficDataProvider "private" section.


