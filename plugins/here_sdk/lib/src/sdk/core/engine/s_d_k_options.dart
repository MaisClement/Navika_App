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
import 'package:here_sdk/src/sdk/core/engine/authentication_mode.dart';
import 'package:here_sdk/src/sdk/core/engine/catalog_configuration.dart';
import 'package:here_sdk/src/sdk/core/engine/engine_base_u_r_l.dart';
import 'package:here_sdk/src/sdk/core/engine/layer_configuration.dart';
import 'package:here_sdk/src/sdk/core/engine/network_settings.dart';
import 'package:meta/meta.dart';








/// SDKOptions provide an alternative way to set or update the HERE SDK credentials and other
/// parameters at runtime to initialize the [SDKNativeEngine].

class SDKOptions {
  /// Key used for authentication.
  String accessKeyId;

  /// Secret used for authentication.
  String accessKeySecret;

  /// Optional project ID to set the project scope of the login session. Not used if empty.
  /// see also [Manage Projects](https://developer.here.com/documentation/identity-access-management/dev_guide/topics/manage-projects.html)
  /// and [IAM Concepts](https://developer.here.com/documentation/identity-access-management/dev_guide/topics/concepts.html)
  String scope;

  /// Path to be used for caching purposes. It should be a path to the desired location where the application has read/write permissions.
  /// The path can be on internal or external storage.
  /// By default, this returns an empty string. Setting a new string, will overwrite the internally used default paths:
  ///
  /// `<Application_Home>/Library/Caches` for iOS and `Context.getCacheDir().getPath()` for Android.
  /// If an absolute path is set, it will be used instead.
  /// If a relative path is set then directory
  /// `<Application_Home>/Library/Caches` for iOS and `Context.getCacheDir().getPath()` for Android is used as parent path.
  String cachePath;

  /// Desired upper bound of application size in bytes. When cached data exceeds cache_size, least recently used data will be removed.
  /// Default value 256MB
  int cacheSizeInBytes;

  /// Path to store persistent map data. This should be the a path to the desired location for which the application has read/write permissions.
  /// The path can be on internal or external storage.
  /// By default, this returns an empty string. Setting a new string, will overwrite the internally used default paths:
  ///
  /// `Application Library directory` for iOS and `Context.getFilesDir().getPath()` for Android.
  /// If an absolute path is set, it will be used instead.
  /// If a relative path is set then directory
  /// `Application Library directory` for iOS and `Context.getFilesDir().getPath()` for Android is used as parent path.
  /// **Note**: Offline maps stored at `<persistent_map_storage_path>/v1/<access_key_id>/ocm-map/`, where `<access_key_id>` is
  /// taken either from `SDKOptions.accessKeyId` or `SDKOptions.authenticationMode` (`SDKOptions.accessKeyId` has higher priority).
  /// When `SDKOptions` initialized with `AuthenticationMode.withToken` or `AuthenticationMode.withExternal`, then `<access_key_id>` left empty.
  String persistentMapStoragePath;

  /// Geopolitical view of a country, defined as a three letter country code by ISO 3166-1 alpha-3. Each disputed territory has
  /// an international and an alternative geopolitical view.
  /// When set, the map view will show all country boundaries according to the geopolitical view of the country that has been set.
  ///
  /// Note: Defaults to an empty string which enables the international view.
  ///
  /// This is a beta feature and thus there can be bugs and unexpected behavior.
  String politicalView;

  /// Sets offline mode for the HERE SDK. Defaults to false. When enabled, this prevents the
  /// HERE SDK from initiating any online connection from starting.
  /// The mode can be disabled or enabled again at any time via [SDKNativeEngine.isOfflineMode].
  bool offlineMode;

  /// Defines a list of data features that can be enabled / disabled. Once set to [SDKOptions] when
  /// a new HERE SDK is constructed, it will affect the map cache and offline maps.
  /// When disabling certain features, less data will be prefetched when the map is rendered. Map
  /// data that was already cached will not be removed until the least recently used strategy (LRU)
  /// applies. That means you cannot remove any content from the map cache by updating the
  /// [LayerConfiguration]. However, for new map data, it will be applied.
  /// For offline maps, this [LayerConfiguration] can reduce the download size of all regions.
  /// Note that the [LayerConfiguration] is applied globally to all regions that will be downloaded
  /// in the future. It will not affect already downloaded regions. Updating a region will also
  /// not update the [LayerConfiguration]. Only the [LayerConfiguration] will be used that was set
  /// globally when a region was downloaded for the first time. If you want to update the
  /// [LayerConfiguration] for an already downloaded region, please delete the region and download it again.
  ///
  /// Please also note
  ///
  /// - The [LayerConfiguration] is only applicable for HERE SDK editions that contain the offline maps
  ///   feature such as the _Navigate Edition_. It has no effect on other editions.
  /// - The [LayerConfiguration] cannot be set separately for a region, it will be applied globally
  ///   for all regions that will be downloaded in the future.
  /// - It is not possible to specify a separate [LayerConfiguration] for the map cache and offline maps.
  ///   The [LayerConfiguration] will be always applied to both.
  /// - The [LayerConfiguration] does affect the map cache when a device has connectivity. Even
  ///   when a device has connectivity it will only download the specified layers.
  /// - This is a beta feature and thus there can be bugs and unexpected behavior.
  LayerConfiguration layerConfiguration;

  /// This field specifies how the [SDKNativeEngine] should access, use and store
  /// data for different catalogs. You can access default catalogs on the HERE platform and
  /// also custom catalogs such as for self-hosted or BYOD (bring your own data) use cases.
  /// For further information about catalogs and related concepts see
  /// [CatalogConfiguration]
  ///
  /// **Note:**
  /// This API is only applicable for enhanced editions such as the _Navigate Edition_. It has no affect on other editions.
  List<CatalogConfiguration> catalogConfigurations;

  /// Parameter to enable automatic cache updates.
  ///
  /// When it is false, the cache will always use the same map version as
  /// offline maps. If offline maps are updated, the cache will be also updated.
  /// The cache version will never be older than the offline maps version.
  ///
  /// When it is true, the cache will be automatically updated to use the latest map data
  /// that is available. In that case, the cache may contain map data that is newer than
  /// the offline maps data. Note that auto updates may also lead to increased network traffic, as
  /// the cached data will be evicted tile-by-tile before it is filled with newer map data. This
  /// process continues everytime the user views a new map view area until the data is replaced.
  /// Once also the offline map data is updated by the user, both map versions will
  /// be the same again.
  ///
  /// If the value is also specified via the manifest (Android) or plist (iOS), than the
  /// value set via `SDKOptions` will overrule the value that was set in manifest/plist - until
  /// the current session ends and the value is read/set again.
  ///
  /// Note that offline maps are only available for enhanced editions such as the _Navigate Edition_.
  ///
  /// Defaults to false.
  ///
  /// **Note:** Do not use this yet, the behavior of this feature may be inconsistent.
  /// Once it will be usable, it will be announced in the regular HERE SDK release notes.
  bool autoUpdateOfOnlineCache;

  /// Set custom backend base URLs to use the HERE SDK with alternative services.
  /// By default, the available endpoints use HERE backend endpoints. Alternatively, you can
  /// specify this also via a manifest (Android) or plist (iOS) entry. The available name/key/value pairs
  /// are shown in the example above.
  /// If unsupported base urls are specified, the related features will become non-functional.
  /// Please talk to your HERE representative to learn about possible custom base urls usage options.
  ///
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
  /// Related APIs may change for new releases without a deprecation process.
  Map<EngineBaseURL, String> customEngineBaseUrls;

  /// Specifies action to perform when cache folder is locked by another process. Default value is [SDKOptionsActionOnCacheLock.waitLockingAppFinish].
  SDKOptionsActionOnCacheLock actionOnCacheLock;

  /// Encapsulates Authentication method and parameters.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  AuthenticationMode authenticationMode;

  /// Network settings to use at the start. Some of those settings can be changed later.
  NetworkSettings networkSettings;

  /// A parameter to set a billing tag to track your HERE platform usage across the various HERE services your application may contact.
  /// For more information on the billing tag, see our [cost management guide](https://developer.here.com/documentation/cost-management/dev_guide/topics/tutorials-billing-tags.html).
  /// The tag needs to follow the format as described in the guide or it will be ignored. The parameter defaults to `null`, which also means that the tag is ignored for all requests.
  ///
  /// **Note:** The billing tag is optional, but when set, it can help you to understand how often your app uses certain services, for example,
  /// the number of hits to our HERE backend routing services. For more details on tracking such details, please consult the _cost management guide_ or get in touch with the HERE billing team.
  String? billingTag;

  SDKOptions._(this.accessKeyId, this.accessKeySecret, this.scope, this.cachePath, this.cacheSizeInBytes, this.persistentMapStoragePath, this.politicalView, this.offlineMode, this.layerConfiguration, this.catalogConfigurations, this.autoUpdateOfOnlineCache, this.customEngineBaseUrls, this.actionOnCacheLock, this.authenticationMode, this.networkSettings, this.billingTag);
  /// Constructs a SDKOptions from authentication mode.
  ///
  /// Other fields are filled with default values.
  ///
  /// [authenticationMode] Authentication Mode used for obtaining an access token.
  /// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
  /// behaviors. Related APIs may change for new releases without a deprecation process.
  ///
  factory SDKOptions.withAuthenticationMode(AuthenticationMode authenticationMode) => $prototype.withAuthenticationMode(authenticationMode);
  /// Constructs a SDKOptions from access key id.
  ///
  /// Other fields are filled with default values.
  ///
  /// [accessKeyId] Key used for authentication.
  ///
  factory SDKOptions.make(String accessKeyId) => $prototype.make(accessKeyId);
  /// Constructs a SDKOptions from access key id and secret.
  ///
  /// Other fields are filled with default values.
  ///
  /// [accessKeyId] Key used for authentication.
  ///
  /// [accessKeySecret] Secret used for authentication.
  ///
  factory SDKOptions.withAccessKeySecret(String accessKeyId, String accessKeySecret) => $prototype.withAccessKeySecret(accessKeyId, accessKeySecret);
  /// Constructs a SDKOptions from access key id, access key secret and cache_path.
  ///
  /// [accessKeyId] Key used for authentication.
  ///
  /// [accessKeySecret] Secret used for authentication.
  ///
  /// [cachePath] Path to be used for caching purposes. Refer to [SDKOptions.cachePath] for default value.
  ///
  factory SDKOptions.withAccessKeySecretAndCachePath(String accessKeyId, String accessKeySecret, String cachePath) => $prototype.withAccessKeySecretAndCachePath(accessKeyId, accessKeySecret, cachePath);
  /// Constructs a SDKOptions from access key id, access key secret, cache_path and cache_size.
  ///
  /// [accessKeyId] Key used for authentication.
  ///
  /// [accessKeySecret] Secret used for authentication.
  ///
  /// [cachePath] Path to be used for caching purposes. If it is not set,
  ///
  /// is set by default.
  ///
  /// [cacheSizeInBytes] Desired upper bound of application size in bytes.
  /// When cached data exceeds cache_size, least recently used data will be removed. Default value 256MB.
  ///
  factory SDKOptions.withAccessKeySecretAndCachePathCacheSize(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes) => $prototype.withAccessKeySecretAndCachePathCacheSize(accessKeyId, accessKeySecret, cachePath, cacheSizeInBytes);
  /// Constructs a SDKOptions from access key id, access key secret, cache_path, cache_size and persistent_map_storage_path.
  ///
  /// [accessKeyId] Key used for authentication.
  ///
  /// [accessKeySecret] Secret used for authentication.
  ///
  /// [cachePath] Refer to [SDKOptions.cachePath] for default value.
  ///
  /// [cacheSizeInBytes] Desired upper bound of application size in bytes.
  /// When cached data exceeds cache_size, least recently used data will be removed. Default value 256MB
  ///
  /// [persistentMapStoragePath] Path to store persistent map downloaded by MapDownloader. Refer to [SDKOptions.persistentMapStoragePath] for default value.
  /// Note: The `MapDownloader` is not available for the Lite and Explore Edition. For these two editions, this property has no effect and can be ignored.
  ///
  factory SDKOptions.withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPath(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes, String persistentMapStoragePath) => $prototype.withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPath(accessKeyId, accessKeySecret, cachePath, cacheSizeInBytes, persistentMapStoragePath);
  /// Constructs a SDKOptions from access key id, access key secret, cache_path, cache_size and persistent_map_storage_path.
  ///
  /// [accessKeyId] Key used for authentication.
  ///
  /// [accessKeySecret] Secret used for authentication.
  ///
  /// [cachePath] Path to be used for caching purposes. Refer to [SDKOptions.cachePath] for default value.
  ///
  /// [cacheSizeInBytes] Desired upper bound of application size in bytes.
  /// When cached data exceeds cache_size, least recently used data will be removed. Default value 256MB
  ///
  /// [persistentMapStoragePath] Path to store persistent map downloaded by MapDownloader. Refer to [SDKOptions.persistentMapStoragePath] for default value.
  /// Note: The `MapDownloader` is not available for the Lite and Explore Edition. For these two editions, this property has no effect and can be ignored.
  ///
  /// [politicalView] // Geopolitical view for country, defined by ISO 3166-1 alpha-3 code.
  /// This is a BETA feature and thus there can be bugs and unexpected behavior.
  ///
  factory SDKOptions.withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPathAndPoliticalView(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes, String persistentMapStoragePath, String politicalView) => $prototype.withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPathAndPoliticalView(accessKeyId, accessKeySecret, cachePath, cacheSizeInBytes, persistentMapStoragePath, politicalView);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SDKOptions) return false;
    SDKOptions _other = other;
    return accessKeyId == _other.accessKeyId &&
        accessKeySecret == _other.accessKeySecret &&
        scope == _other.scope &&
        cachePath == _other.cachePath &&
        cacheSizeInBytes == _other.cacheSizeInBytes &&
        persistentMapStoragePath == _other.persistentMapStoragePath &&
        politicalView == _other.politicalView &&
        offlineMode == _other.offlineMode &&
        layerConfiguration == _other.layerConfiguration &&
        DeepCollectionEquality().equals(catalogConfigurations, _other.catalogConfigurations) &&
        autoUpdateOfOnlineCache == _other.autoUpdateOfOnlineCache &&
        DeepCollectionEquality().equals(customEngineBaseUrls, _other.customEngineBaseUrls) &&
        actionOnCacheLock == _other.actionOnCacheLock &&
        authenticationMode == _other.authenticationMode &&
        networkSettings == _other.networkSettings &&
        billingTag == _other.billingTag;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + accessKeyId.hashCode;
    result = 31 * result + accessKeySecret.hashCode;
    result = 31 * result + scope.hashCode;
    result = 31 * result + cachePath.hashCode;
    result = 31 * result + cacheSizeInBytes.hashCode;
    result = 31 * result + persistentMapStoragePath.hashCode;
    result = 31 * result + politicalView.hashCode;
    result = 31 * result + offlineMode.hashCode;
    result = 31 * result + layerConfiguration.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(catalogConfigurations);
    result = 31 * result + autoUpdateOfOnlineCache.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(customEngineBaseUrls);
    result = 31 * result + actionOnCacheLock.hashCode;
    result = 31 * result + authenticationMode.hashCode;
    result = 31 * result + networkSettings.hashCode;
    result = 31 * result + billingTag.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SDKOptions$Impl();
}

/// Action on cache lock
enum SDKOptionsActionOnCacheLock {
    /// No action is performed.
    noAction,
    /// Current process waits 500 milliseconds for the cache to be unlocked.
    waitLockingAppFinish,
    /// The HERE SDK will make several attempts to kill the locking process for a maximum period of 500 milliseconds.
    killLockingApp
}

// SDKOptionsActionOnCacheLock "private" section, not exported.

int sdkCoreEngineSdkoptionsActiononcachelockToFfi(SDKOptionsActionOnCacheLock value) {
  switch (value) {
  case SDKOptionsActionOnCacheLock.noAction:
    return 0;
  case SDKOptionsActionOnCacheLock.waitLockingAppFinish:
    return 1;
  case SDKOptionsActionOnCacheLock.killLockingApp:
    return 2;
  default:
    throw StateError("Invalid enum value $value for SDKOptionsActionOnCacheLock enum.");
  }
}

SDKOptionsActionOnCacheLock sdkCoreEngineSdkoptionsActiononcachelockFromFfi(int handle) {
  switch (handle) {
  case 0:
    return SDKOptionsActionOnCacheLock.noAction;
  case 1:
    return SDKOptionsActionOnCacheLock.waitLockingAppFinish;
  case 2:
    return SDKOptionsActionOnCacheLock.killLockingApp;
  default:
    throw StateError("Invalid numeric value $handle for SDKOptionsActionOnCacheLock enum.");
  }
}

void sdkCoreEngineSdkoptionsActiononcachelockReleaseFfiHandle(int handle) {}

final _sdkCoreEngineSdkoptionsActiononcachelockCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_engine_SDKOptions_ActionOnCacheLock_create_handle_nullable'));
final _sdkCoreEngineSdkoptionsActiononcachelockReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_ActionOnCacheLock_release_handle_nullable'));
final _sdkCoreEngineSdkoptionsActiononcachelockGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_ActionOnCacheLock_get_value_nullable'));

Pointer<Void> sdkCoreEngineSdkoptionsActiononcachelockToFfiNullable(SDKOptionsActionOnCacheLock? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineSdkoptionsActiononcachelockToFfi(value);
  final result = _sdkCoreEngineSdkoptionsActiononcachelockCreateHandleNullable(_handle);
  sdkCoreEngineSdkoptionsActiononcachelockReleaseFfiHandle(_handle);
  return result;
}

SDKOptionsActionOnCacheLock? sdkCoreEngineSdkoptionsActiononcachelockFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineSdkoptionsActiononcachelockGetValueNullable(handle);
  final result = sdkCoreEngineSdkoptionsActiononcachelockFromFfi(_handle);
  sdkCoreEngineSdkoptionsActiononcachelockReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineSdkoptionsActiononcachelockReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineSdkoptionsActiononcachelockReleaseHandleNullable(handle);

// End of SDKOptionsActionOnCacheLock "private" section.

// SDKOptions "private" section, not exported.

final _sdkCoreEngineSdkoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Int64, Pointer<Void>, Pointer<Void>, Uint8, Pointer<Void>, Pointer<Void>, Uint8, Pointer<Void>, Uint32, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, Pointer<Void>, Pointer<Void>, int, Pointer<Void>, Pointer<Void>, int, Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_create_handle'));
final _sdkCoreEngineSdkoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_release_handle'));
final _sdkCoreEngineSdkoptionsGetFieldaccessKeyId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_accessKeyId'));
final _sdkCoreEngineSdkoptionsGetFieldaccessKeySecret = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_accessKeySecret'));
final _sdkCoreEngineSdkoptionsGetFieldscope = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_scope'));
final _sdkCoreEngineSdkoptionsGetFieldcachePath = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_cachePath'));
final _sdkCoreEngineSdkoptionsGetFieldcacheSizeInBytes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_cacheSizeInBytes'));
final _sdkCoreEngineSdkoptionsGetFieldpersistentMapStoragePath = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_persistentMapStoragePath'));
final _sdkCoreEngineSdkoptionsGetFieldpoliticalView = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_politicalView'));
final _sdkCoreEngineSdkoptionsGetFieldofflineMode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_offlineMode'));
final _sdkCoreEngineSdkoptionsGetFieldlayerConfiguration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_layerConfiguration'));
final _sdkCoreEngineSdkoptionsGetFieldcatalogConfigurations = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_catalogConfigurations'));
final _sdkCoreEngineSdkoptionsGetFieldautoUpdateOfOnlineCache = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_autoUpdateOfOnlineCache'));
final _sdkCoreEngineSdkoptionsGetFieldcustomEngineBaseUrls = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_customEngineBaseUrls'));
final _sdkCoreEngineSdkoptionsGetFieldactionOnCacheLock = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_actionOnCacheLock'));
final _sdkCoreEngineSdkoptionsGetFieldauthenticationMode = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_authenticationMode'));
final _sdkCoreEngineSdkoptionsGetFieldnetworkSettings = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_networkSettings'));
final _sdkCoreEngineSdkoptionsGetFieldbillingTag = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_billingTag'));



/// @nodoc
@visibleForTesting
class SDKOptions$Impl {
  SDKOptions withAuthenticationMode(AuthenticationMode authenticationMode) {
    final _withAuthenticationModeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKOptions_make__AuthenticationMode'));
    final _authenticationModeHandle = sdkCoreEngineAuthenticationmodeToFfi(authenticationMode);
    final __resultHandle = _withAuthenticationModeFfi(__lib.LibraryContext.isolateId, _authenticationModeHandle);
    sdkCoreEngineAuthenticationmodeReleaseFfiHandle(_authenticationModeHandle);
    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  SDKOptions make(String accessKeyId) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKOptions_make__String'));
    final _accessKeyIdHandle = stringToFfi(accessKeyId);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _accessKeyIdHandle);
    stringReleaseFfiHandle(_accessKeyIdHandle);
    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  SDKOptions withAccessKeySecret(String accessKeyId, String accessKeySecret) {
    final _withAccessKeySecretFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKOptions_make__String_String'));
    final _accessKeyIdHandle = stringToFfi(accessKeyId);
    final _accessKeySecretHandle = stringToFfi(accessKeySecret);
    final __resultHandle = _withAccessKeySecretFfi(__lib.LibraryContext.isolateId, _accessKeyIdHandle, _accessKeySecretHandle);
    stringReleaseFfiHandle(_accessKeyIdHandle);
    stringReleaseFfiHandle(_accessKeySecretHandle);
    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  SDKOptions withAccessKeySecretAndCachePath(String accessKeyId, String accessKeySecret, String cachePath) {
    final _withAccessKeySecretAndCachePathFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKOptions_make__String_String_String'));
    final _accessKeyIdHandle = stringToFfi(accessKeyId);
    final _accessKeySecretHandle = stringToFfi(accessKeySecret);
    final _cachePathHandle = stringToFfi(cachePath);
    final __resultHandle = _withAccessKeySecretAndCachePathFfi(__lib.LibraryContext.isolateId, _accessKeyIdHandle, _accessKeySecretHandle, _cachePathHandle);
    stringReleaseFfiHandle(_accessKeyIdHandle);
    stringReleaseFfiHandle(_accessKeySecretHandle);
    stringReleaseFfiHandle(_cachePathHandle);
    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  SDKOptions withAccessKeySecretAndCachePathCacheSize(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes) {
    final _withAccessKeySecretAndCachePathCacheSizeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Int64), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, int)>('here_sdk_sdk_core_engine_SDKOptions_make__String_String_String_Long'));
    final _accessKeyIdHandle = stringToFfi(accessKeyId);
    final _accessKeySecretHandle = stringToFfi(accessKeySecret);
    final _cachePathHandle = stringToFfi(cachePath);
    final _cacheSizeInBytesHandle = (cacheSizeInBytes);
    final __resultHandle = _withAccessKeySecretAndCachePathCacheSizeFfi(__lib.LibraryContext.isolateId, _accessKeyIdHandle, _accessKeySecretHandle, _cachePathHandle, _cacheSizeInBytesHandle);
    stringReleaseFfiHandle(_accessKeyIdHandle);
    stringReleaseFfiHandle(_accessKeySecretHandle);
    stringReleaseFfiHandle(_cachePathHandle);

    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  SDKOptions withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPath(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes, String persistentMapStoragePath) {
    final _withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPathFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Int64, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKOptions_make__String_String_String_Long_String'));
    final _accessKeyIdHandle = stringToFfi(accessKeyId);
    final _accessKeySecretHandle = stringToFfi(accessKeySecret);
    final _cachePathHandle = stringToFfi(cachePath);
    final _cacheSizeInBytesHandle = (cacheSizeInBytes);
    final _persistentMapStoragePathHandle = stringToFfi(persistentMapStoragePath);
    final __resultHandle = _withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPathFfi(__lib.LibraryContext.isolateId, _accessKeyIdHandle, _accessKeySecretHandle, _cachePathHandle, _cacheSizeInBytesHandle, _persistentMapStoragePathHandle);
    stringReleaseFfiHandle(_accessKeyIdHandle);
    stringReleaseFfiHandle(_accessKeySecretHandle);
    stringReleaseFfiHandle(_cachePathHandle);

    stringReleaseFfiHandle(_persistentMapStoragePathHandle);
    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  SDKOptions withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPathAndPoliticalView(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes, String persistentMapStoragePath, String politicalView) {
    final _withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPathAndPoliticalViewFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Int64, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKOptions_make__String_String_String_Long_String_String'));
    final _accessKeyIdHandle = stringToFfi(accessKeyId);
    final _accessKeySecretHandle = stringToFfi(accessKeySecret);
    final _cachePathHandle = stringToFfi(cachePath);
    final _cacheSizeInBytesHandle = (cacheSizeInBytes);
    final _persistentMapStoragePathHandle = stringToFfi(persistentMapStoragePath);
    final _politicalViewHandle = stringToFfi(politicalView);
    final __resultHandle = _withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPathAndPoliticalViewFfi(__lib.LibraryContext.isolateId, _accessKeyIdHandle, _accessKeySecretHandle, _cachePathHandle, _cacheSizeInBytesHandle, _persistentMapStoragePathHandle, _politicalViewHandle);
    stringReleaseFfiHandle(_accessKeyIdHandle);
    stringReleaseFfiHandle(_accessKeySecretHandle);
    stringReleaseFfiHandle(_cachePathHandle);

    stringReleaseFfiHandle(_persistentMapStoragePathHandle);
    stringReleaseFfiHandle(_politicalViewHandle);
    try {
      return sdkCoreEngineSdkoptionsFromFfi(__resultHandle);
    } finally {
      sdkCoreEngineSdkoptionsReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkCoreEngineSdkoptionsToFfi(SDKOptions value) {
  final _accessKeyIdHandle = stringToFfi(value.accessKeyId);
  final _accessKeySecretHandle = stringToFfi(value.accessKeySecret);
  final _scopeHandle = stringToFfi(value.scope);
  final _cachePathHandle = stringToFfi(value.cachePath);
  final _cacheSizeInBytesHandle = (value.cacheSizeInBytes);
  final _persistentMapStoragePathHandle = stringToFfi(value.persistentMapStoragePath);
  final _politicalViewHandle = stringToFfi(value.politicalView);
  final _offlineModeHandle = booleanToFfi(value.offlineMode);
  final _layerConfigurationHandle = sdkCoreEngineLayerconfigurationToFfi(value.layerConfiguration);
  final _catalogConfigurationsHandle = heresdkCoreBindingslistofSdkCoreEngineCatalogconfigurationToFfi(value.catalogConfigurations);
  final _autoUpdateOfOnlineCacheHandle = booleanToFfi(value.autoUpdateOfOnlineCache);
  final _customEngineBaseUrlsHandle = heresdkCoreBindingsmapofSdkCoreEngineEnginebaseurlToStringToFfi(value.customEngineBaseUrls);
  final _actionOnCacheLockHandle = sdkCoreEngineSdkoptionsActiononcachelockToFfi(value.actionOnCacheLock);
  final _authenticationModeHandle = sdkCoreEngineAuthenticationmodeToFfi(value.authenticationMode);
  final _networkSettingsHandle = sdkCoreEngineNetworksettingsToFfi(value.networkSettings);
  final _billingTagHandle = stringToFfiNullable(value.billingTag);
  final _result = _sdkCoreEngineSdkoptionsCreateHandle(_accessKeyIdHandle, _accessKeySecretHandle, _scopeHandle, _cachePathHandle, _cacheSizeInBytesHandle, _persistentMapStoragePathHandle, _politicalViewHandle, _offlineModeHandle, _layerConfigurationHandle, _catalogConfigurationsHandle, _autoUpdateOfOnlineCacheHandle, _customEngineBaseUrlsHandle, _actionOnCacheLockHandle, _authenticationModeHandle, _networkSettingsHandle, _billingTagHandle);
  stringReleaseFfiHandle(_accessKeyIdHandle);
  stringReleaseFfiHandle(_accessKeySecretHandle);
  stringReleaseFfiHandle(_scopeHandle);
  stringReleaseFfiHandle(_cachePathHandle);
  
  stringReleaseFfiHandle(_persistentMapStoragePathHandle);
  stringReleaseFfiHandle(_politicalViewHandle);
  booleanReleaseFfiHandle(_offlineModeHandle);
  sdkCoreEngineLayerconfigurationReleaseFfiHandle(_layerConfigurationHandle);
  heresdkCoreBindingslistofSdkCoreEngineCatalogconfigurationReleaseFfiHandle(_catalogConfigurationsHandle);
  booleanReleaseFfiHandle(_autoUpdateOfOnlineCacheHandle);
  heresdkCoreBindingsmapofSdkCoreEngineEnginebaseurlToStringReleaseFfiHandle(_customEngineBaseUrlsHandle);
  sdkCoreEngineSdkoptionsActiononcachelockReleaseFfiHandle(_actionOnCacheLockHandle);
  sdkCoreEngineAuthenticationmodeReleaseFfiHandle(_authenticationModeHandle);
  sdkCoreEngineNetworksettingsReleaseFfiHandle(_networkSettingsHandle);
  stringReleaseFfiHandleNullable(_billingTagHandle);
  return _result;
}

SDKOptions sdkCoreEngineSdkoptionsFromFfi(Pointer<Void> handle) {
  final _accessKeyIdHandle = _sdkCoreEngineSdkoptionsGetFieldaccessKeyId(handle);
  final _accessKeySecretHandle = _sdkCoreEngineSdkoptionsGetFieldaccessKeySecret(handle);
  final _scopeHandle = _sdkCoreEngineSdkoptionsGetFieldscope(handle);
  final _cachePathHandle = _sdkCoreEngineSdkoptionsGetFieldcachePath(handle);
  final _cacheSizeInBytesHandle = _sdkCoreEngineSdkoptionsGetFieldcacheSizeInBytes(handle);
  final _persistentMapStoragePathHandle = _sdkCoreEngineSdkoptionsGetFieldpersistentMapStoragePath(handle);
  final _politicalViewHandle = _sdkCoreEngineSdkoptionsGetFieldpoliticalView(handle);
  final _offlineModeHandle = _sdkCoreEngineSdkoptionsGetFieldofflineMode(handle);
  final _layerConfigurationHandle = _sdkCoreEngineSdkoptionsGetFieldlayerConfiguration(handle);
  final _catalogConfigurationsHandle = _sdkCoreEngineSdkoptionsGetFieldcatalogConfigurations(handle);
  final _autoUpdateOfOnlineCacheHandle = _sdkCoreEngineSdkoptionsGetFieldautoUpdateOfOnlineCache(handle);
  final _customEngineBaseUrlsHandle = _sdkCoreEngineSdkoptionsGetFieldcustomEngineBaseUrls(handle);
  final _actionOnCacheLockHandle = _sdkCoreEngineSdkoptionsGetFieldactionOnCacheLock(handle);
  final _authenticationModeHandle = _sdkCoreEngineSdkoptionsGetFieldauthenticationMode(handle);
  final _networkSettingsHandle = _sdkCoreEngineSdkoptionsGetFieldnetworkSettings(handle);
  final _billingTagHandle = _sdkCoreEngineSdkoptionsGetFieldbillingTag(handle);
  try {
    return SDKOptions._(
      stringFromFfi(_accessKeyIdHandle), 
      stringFromFfi(_accessKeySecretHandle), 
      stringFromFfi(_scopeHandle), 
      stringFromFfi(_cachePathHandle), 
      (_cacheSizeInBytesHandle), 
      stringFromFfi(_persistentMapStoragePathHandle), 
      stringFromFfi(_politicalViewHandle), 
      booleanFromFfi(_offlineModeHandle), 
      sdkCoreEngineLayerconfigurationFromFfi(_layerConfigurationHandle), 
      heresdkCoreBindingslistofSdkCoreEngineCatalogconfigurationFromFfi(_catalogConfigurationsHandle), 
      booleanFromFfi(_autoUpdateOfOnlineCacheHandle), 
      heresdkCoreBindingsmapofSdkCoreEngineEnginebaseurlToStringFromFfi(_customEngineBaseUrlsHandle), 
      sdkCoreEngineSdkoptionsActiononcachelockFromFfi(_actionOnCacheLockHandle), 
      sdkCoreEngineAuthenticationmodeFromFfi(_authenticationModeHandle), 
      sdkCoreEngineNetworksettingsFromFfi(_networkSettingsHandle), 
      stringFromFfiNullable(_billingTagHandle)
    );
  } finally {
    stringReleaseFfiHandle(_accessKeyIdHandle);
    stringReleaseFfiHandle(_accessKeySecretHandle);
    stringReleaseFfiHandle(_scopeHandle);
    stringReleaseFfiHandle(_cachePathHandle);
    
    stringReleaseFfiHandle(_persistentMapStoragePathHandle);
    stringReleaseFfiHandle(_politicalViewHandle);
    booleanReleaseFfiHandle(_offlineModeHandle);
    sdkCoreEngineLayerconfigurationReleaseFfiHandle(_layerConfigurationHandle);
    heresdkCoreBindingslistofSdkCoreEngineCatalogconfigurationReleaseFfiHandle(_catalogConfigurationsHandle);
    booleanReleaseFfiHandle(_autoUpdateOfOnlineCacheHandle);
    heresdkCoreBindingsmapofSdkCoreEngineEnginebaseurlToStringReleaseFfiHandle(_customEngineBaseUrlsHandle);
    sdkCoreEngineSdkoptionsActiononcachelockReleaseFfiHandle(_actionOnCacheLockHandle);
    sdkCoreEngineAuthenticationmodeReleaseFfiHandle(_authenticationModeHandle);
    sdkCoreEngineNetworksettingsReleaseFfiHandle(_networkSettingsHandle);
    stringReleaseFfiHandleNullable(_billingTagHandle);
  }
}

void sdkCoreEngineSdkoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreEngineSdkoptionsReleaseHandle(handle);

// Nullable SDKOptions

final _sdkCoreEngineSdkoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_create_handle_nullable'));
final _sdkCoreEngineSdkoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_release_handle_nullable'));
final _sdkCoreEngineSdkoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_value_nullable'));

Pointer<Void> sdkCoreEngineSdkoptionsToFfiNullable(SDKOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineSdkoptionsToFfi(value);
  final result = _sdkCoreEngineSdkoptionsCreateHandleNullable(_handle);
  sdkCoreEngineSdkoptionsReleaseFfiHandle(_handle);
  return result;
}

SDKOptions? sdkCoreEngineSdkoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineSdkoptionsGetValueNullable(handle);
  final result = sdkCoreEngineSdkoptionsFromFfi(_handle);
  sdkCoreEngineSdkoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineSdkoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineSdkoptionsReleaseHandleNullable(handle);

// End of SDKOptions "private" section.


