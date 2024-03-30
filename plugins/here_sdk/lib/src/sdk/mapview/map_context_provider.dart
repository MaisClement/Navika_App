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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/language_code.dart';
import 'package:here_sdk/src/sdk/mapview/shadow_quality.dart';
import 'package:meta/meta.dart';

/// @nodoc
abstract class MapContextProvider {

  /// Sets file paths to SDK resources needed for initialisation.
  ///
  /// [paths] The list of file paths with SDK resources.
  ///
  static void setInitResourcePaths(List<String> paths) => $prototype.setInitResourcePaths(paths);
  /// Sets window render target to be used in creation of MapContext.
  ///
  /// [windowHandle] Native window handle.
  ///
  static void setInitWindowRenderTarget(int windowHandle) => $prototype.setInitWindowRenderTarget(windowHandle);
  /// Sets graphics context to be used in creation of MapContext.
  ///
  /// [context] Graphics context handle.
  ///
  static void setInitGraphicsContext(int context) => $prototype.setInitGraphicsContext(context);
  /// Platform specific handle to a graphics device.
  ///
  static void setInitRenderDeviceHandle(int deviceHandle) => $prototype.setInitRenderDeviceHandle(deviceHandle);

  static void setInitEnableUserControlledRenderLoop(bool userLoopEnabled) => $prototype.setInitEnableUserControlledRenderLoop(userLoopEnabled);
  /// Destroys the map context.
  ///
  /// The instance is not usable after this point, get a new one
  /// with get_instance() if needed.
  ///
  static void destroy() => $prototype.destroy();
  /// Shortcut for MapContextProvider.get_instance().pause()
  ///
  static void pause() => $prototype.pause();
  /// Shortcut for MapContextProvider.get_instance().resume()
  ///
  static void resume() => $prototype.resume();
  static MapContextProviderLanguageOptions get languageOptions => $prototype.languageOptions;
  static set languageOptions(MapContextProviderLanguageOptions value) { $prototype.languageOptions = value; }

  static ShadowQuality? get shadowQuality => $prototype.shadowQuality;
  static set shadowQuality(ShadowQuality? value) { $prototype.shadowQuality = value; }


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapContextProvider$Impl(Pointer<Void>.fromAddress(0));
}


class MapContextProviderLanguageOptions {
  LanguageCode? primary;

  LanguageCode? secondary;

  MapContextProviderLanguageOptions._(this.primary, this.secondary);
  MapContextProviderLanguageOptions()
    : primary = null, secondary = null;
}


// MapContextProviderLanguageOptions "private" section, not exported.

final _sdkMapviewMapcontextproviderLanguageoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContextProvider_LanguageOptions_create_handle'));
final _sdkMapviewMapcontextproviderLanguageoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContextProvider_LanguageOptions_release_handle'));
final _sdkMapviewMapcontextproviderLanguageoptionsGetFieldprimary = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContextProvider_LanguageOptions_get_field_primary'));
final _sdkMapviewMapcontextproviderLanguageoptionsGetFieldsecondary = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContextProvider_LanguageOptions_get_field_secondary'));



Pointer<Void> sdkMapviewMapcontextproviderLanguageoptionsToFfi(MapContextProviderLanguageOptions value) {
  final _primaryHandle = sdkCoreLanguagecodeToFfiNullable(value.primary);
  final _secondaryHandle = sdkCoreLanguagecodeToFfiNullable(value.secondary);
  final _result = _sdkMapviewMapcontextproviderLanguageoptionsCreateHandle(_primaryHandle, _secondaryHandle);
  sdkCoreLanguagecodeReleaseFfiHandleNullable(_primaryHandle);
  sdkCoreLanguagecodeReleaseFfiHandleNullable(_secondaryHandle);
  return _result;
}

MapContextProviderLanguageOptions sdkMapviewMapcontextproviderLanguageoptionsFromFfi(Pointer<Void> handle) {
  final _primaryHandle = _sdkMapviewMapcontextproviderLanguageoptionsGetFieldprimary(handle);
  final _secondaryHandle = _sdkMapviewMapcontextproviderLanguageoptionsGetFieldsecondary(handle);
  try {
    return MapContextProviderLanguageOptions._(
      sdkCoreLanguagecodeFromFfiNullable(_primaryHandle), 
      sdkCoreLanguagecodeFromFfiNullable(_secondaryHandle)
    );
  } finally {
    sdkCoreLanguagecodeReleaseFfiHandleNullable(_primaryHandle);
    sdkCoreLanguagecodeReleaseFfiHandleNullable(_secondaryHandle);
  }
}

void sdkMapviewMapcontextproviderLanguageoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewMapcontextproviderLanguageoptionsReleaseHandle(handle);

// Nullable MapContextProviderLanguageOptions

final _sdkMapviewMapcontextproviderLanguageoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContextProvider_LanguageOptions_create_handle_nullable'));
final _sdkMapviewMapcontextproviderLanguageoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContextProvider_LanguageOptions_release_handle_nullable'));
final _sdkMapviewMapcontextproviderLanguageoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContextProvider_LanguageOptions_get_value_nullable'));

Pointer<Void> sdkMapviewMapcontextproviderLanguageoptionsToFfiNullable(MapContextProviderLanguageOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapcontextproviderLanguageoptionsToFfi(value);
  final result = _sdkMapviewMapcontextproviderLanguageoptionsCreateHandleNullable(_handle);
  sdkMapviewMapcontextproviderLanguageoptionsReleaseFfiHandle(_handle);
  return result;
}

MapContextProviderLanguageOptions? sdkMapviewMapcontextproviderLanguageoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapcontextproviderLanguageoptionsGetValueNullable(handle);
  final result = sdkMapviewMapcontextproviderLanguageoptionsFromFfi(_handle);
  sdkMapviewMapcontextproviderLanguageoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapcontextproviderLanguageoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcontextproviderLanguageoptionsReleaseHandleNullable(handle);

// End of MapContextProviderLanguageOptions "private" section.

// MapContextProvider "private" section, not exported.

final _sdkMapviewMapcontextproviderRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapContextProvider_register_finalizer'));
final _sdkMapviewMapcontextproviderCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContextProvider_copy_handle'));
final _sdkMapviewMapcontextproviderReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapContextProvider_release_handle'));










/// @nodoc
@visibleForTesting
class MapContextProvider$Impl extends __lib.NativeBase implements MapContextProvider {

  MapContextProvider$Impl(Pointer<Void> handle) : super(handle);

  void setInitResourcePaths(List<String> paths) {
    final _setInitResourcePathsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapContextProvider_setInitResourcePaths__ListOf_String'));
    final _pathsHandle = heresdkMapviewCommonBindingslistofStringToFfi(paths);
    _setInitResourcePathsFfi(__lib.LibraryContext.isolateId, _pathsHandle);
    heresdkMapviewCommonBindingslistofStringReleaseFfiHandle(_pathsHandle);

  }

  void setInitWindowRenderTarget(int windowHandle) {
    final _setInitWindowRenderTargetFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Uint64), void Function(int, int)>('here_sdk_sdk_mapview_MapContextProvider_setInitWindowRenderTarget__ULong'));
    final _windowHandleHandle = (windowHandle);
    _setInitWindowRenderTargetFfi(__lib.LibraryContext.isolateId, _windowHandleHandle);


  }

  void setInitGraphicsContext(int context) {
    final _setInitGraphicsContextFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Uint64), void Function(int, int)>('here_sdk_sdk_mapview_MapContextProvider_setInitGraphicsContext__ULong'));
    final _contextHandle = (context);
    _setInitGraphicsContextFfi(__lib.LibraryContext.isolateId, _contextHandle);


  }

  void setInitRenderDeviceHandle(int deviceHandle) {
    final _setInitRenderDeviceHandleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Uint64), void Function(int, int)>('here_sdk_sdk_mapview_MapContextProvider_setInitRenderDeviceHandle__ULong'));
    final _deviceHandleHandle = (deviceHandle);
    _setInitRenderDeviceHandleFfi(__lib.LibraryContext.isolateId, _deviceHandleHandle);


  }

  void setInitEnableUserControlledRenderLoop(bool userLoopEnabled) {
    final _setInitEnableUserControlledRenderLoopFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Uint8), void Function(int, int)>('here_sdk_sdk_mapview_MapContextProvider_setInitEnableUserControlledRenderLoop__Boolean'));
    final _userLoopEnabledHandle = booleanToFfi(userLoopEnabled);
    _setInitEnableUserControlledRenderLoopFfi(__lib.LibraryContext.isolateId, _userLoopEnabledHandle);
    booleanReleaseFfiHandle(_userLoopEnabledHandle);

  }

  void destroy() {
    final _destroyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('here_sdk_sdk_mapview_MapContextProvider_destroy'));
    _destroyFfi(__lib.LibraryContext.isolateId);

  }

  void pause() {
    final _pauseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('here_sdk_sdk_mapview_MapContextProvider_pause'));
    _pauseFfi(__lib.LibraryContext.isolateId);

  }

  void resume() {
    final _resumeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32), void Function(int)>('here_sdk_sdk_mapview_MapContextProvider_resume'));
    _resumeFfi(__lib.LibraryContext.isolateId);

  }

  MapContextProviderLanguageOptions get languageOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_mapview_MapContextProvider_languageOptions_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapcontextproviderLanguageoptionsFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapcontextproviderLanguageoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  set languageOptions(MapContextProviderLanguageOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapContextProvider_languageOptions_set__LanguageOptions'));
    final _valueHandle = sdkMapviewMapcontextproviderLanguageoptionsToFfi(value);
    _setFfi(__lib.LibraryContext.isolateId, _valueHandle);
    sdkMapviewMapcontextproviderLanguageoptionsReleaseFfiHandle(_valueHandle);

  }


  ShadowQuality? get shadowQuality {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_mapview_MapContextProvider_shadowQuality_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkMapviewShadowqualityFromFfiNullable(__resultHandle);
    } finally {
      sdkMapviewShadowqualityReleaseFfiHandleNullable(__resultHandle);

    }

  }

  set shadowQuality(ShadowQuality? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('here_sdk_sdk_mapview_MapContextProvider_shadowQuality_set__ShadowQuality_'));
    final _valueHandle = sdkMapviewShadowqualityToFfiNullable(value);
    _setFfi(__lib.LibraryContext.isolateId, _valueHandle);
    sdkMapviewShadowqualityReleaseFfiHandleNullable(_valueHandle);

  }



}

Pointer<Void> sdkMapviewMapcontextproviderToFfi(MapContextProvider value) =>
  _sdkMapviewMapcontextproviderCopyHandle((value as __lib.NativeBase).handle);

MapContextProvider sdkMapviewMapcontextproviderFromFfi(Pointer<Void> handle) {
  if (handle.address == 0) throw StateError("Expected non-null value.");
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapContextProvider) return instance;

  final _copiedHandle = _sdkMapviewMapcontextproviderCopyHandle(handle);
  final result = MapContextProvider$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapcontextproviderRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapcontextproviderReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcontextproviderReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcontextproviderToFfiNullable(MapContextProvider? value) =>
  value != null ? sdkMapviewMapcontextproviderToFfi(value) : Pointer<Void>.fromAddress(0);

MapContextProvider? sdkMapviewMapcontextproviderFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcontextproviderFromFfi(handle) : null;

void sdkMapviewMapcontextproviderReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcontextproviderReleaseHandle(handle);

// End of MapContextProvider "private" section.


