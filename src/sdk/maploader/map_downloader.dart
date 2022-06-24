// Copyright (c) 2018-2022 HERE Global B.V. and its affiliate(s).
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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/language_code.dart';
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/maploader/deleted_regions_callback.dart';
import 'package:here_sdk/src/sdk/maploader/download_regions_status_listener.dart';
import 'package:here_sdk/src/sdk/maploader/downloadable_regions_callback.dart';
import 'package:here_sdk/src/sdk/maploader/installed_region.dart';
import 'package:here_sdk/src/sdk/maploader/map_downloader_construction_callback.dart';
import 'package:here_sdk/src/sdk/maploader/map_downloader_task.dart';
import 'package:here_sdk/src/sdk/maploader/map_loader_error.dart';
import 'package:here_sdk/src/sdk/maploader/map_loader_exception_exception.dart';
import 'package:here_sdk/src/sdk/maploader/persistent_map_status.dart';
import 'package:here_sdk/src/sdk/maploader/region_id.dart';
import 'package:here_sdk/src/sdk/maploader/repair_persistent_map_callback.dart';
import 'package:here_sdk/src/sdk/maploader/s_d_k_cache_callback.dart';
import 'package:meta/meta.dart';

/// A class to download and manage map data for various regions of the world.
///
/// Downloaded map data will be permanently
/// stored to disk and enables the use of maps on all zoom levels, search, routing, and other features without an active
/// data connection. Satellite based map schemes are not part of the downloaded map data. User can query downloadable
/// regions, download them to disk or delete them.
/// Storage Path for downloaded map can be specified via [SDKOptions.persistentMapStoragePath].
/// An instance of this class can be created with [MapDownloader.fromSdkEngine].
///
/// In addition, the content and or data features of the downloaded regions and the map cache can be
/// controlled before starting an application via
/// plist and/or AndroidManifest file when specifying a "FeatureConfiguration".
/// An example plist file is shown in the documentation for the [SDKOptions] class.
/// The "FeatureConfiguration" defines a list of data features that can be enabled / disabled.
/// Once set via
/// plist and/or AndroidManifest file then it will affect the map cache and offline maps.
///
/// When disabling certain features, less data will be prefetched when the map is rendered. Map
/// data that was already cached will not be removed until the least recently used strategy (LRU)
/// applies. That means you cannot remove any content from the map cache by updating the
/// "FeatureConfiguration". However, for new map data, it will be applied.
/// For offline maps, this "FeatureConfiguration" can reduce the download size of all regions.
/// Note that the "FeatureConfiguration" is applied globally to all regions that will be downloaded
/// in the future. It will not affect already downloaded regions. Updating a region will also
/// not update the "FeatureConfiguration". Only the "FeatureConfiguration" will be used that was set
/// globally when a region was downloaded for the first time. If you want to update the
/// "FeatureConfiguration" for an already downloaded region, please delete the region and download it again.
///
/// The following features can be enabled / disabled:
///
/// - "DETAIL_RENDERING": Additional rendering details like buildings. Only used for the `MapView`.
///   When not set, the data will be excluded when downloading offline regions or prefetching areas
///   that contain such data. However, during online usage such data may still be downloaded into the
///   cache and shown.
/// - "NAVIGATION": Map data that is used for map matching during navigation. When not set,
///   navigation may not work properly when being used online or offline.
/// - "OFFLINE_SEARCH": Map data that is used to search. When not set, the `OfflineSearchEngine` may not
///   work properly when being used.
/// - "OFFLINE_ROUTING": Map data that is used to calculate routes. When not set, the `OfflineRoutingEngine`
///   may not work properly when being used.
/// - "TRUCK": Map data that is used to calculate truck routes. When not set,
///   the `OfflineRoutingEngine` may not work properly when being used to calculate truck routes.
///   It is also used for map matching during truck navigation.
///   When not set, truck navigation may not work properly when being used offline. Online truck navigation will still work when the device has an online connection.
/// - "LANDMARKS_3D": Map data that is used to render textured 3D landmarks. When not set, the data
///   will be excluded when downloading offline regions or prefetching areas that contain such data.
///   When the `landmarks` layer is set to be visible for a `MapScene`, 3D landmarks will still be
///   visible during online usage.
///
/// **Notes**
/// - The "FeatureConfiguration" is only applicable for HERE SDK editions that contain the offline maps
///   feature such as the _Navigate Edition_. It has no affect on other editions.
/// - The "FeatureConfiguration" cannot be set separately for a region, it will be applied globally
///   for all regions that will be downloaded in the future.
/// - It is not possible to specify a separate "FeatureConfiguration" for the map cache and offline maps.
///   The "FeatureConfiguration" will be always applied to both.
/// - The "FeatureConfiguration" does affect the map cache when a device has connectivity. Even
///   when a device has connectivity it will only download the specified layers.
/// - By default, all features are enabled. However, if a "FeatureConfiguration" is present in the config
///   file, then only the listed features will be enabled, all others will be disabled. If you want to
///   disable only one feature, then all other features need to be present, or they will be also disabled.
///
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected
/// behaviors. Related APIs may change for new releases without a deprecation process.
abstract class MapDownloader {

  /// Gets a single instance of this class per provided [SDKNativeEngine].
  ///
  /// Constructor blocks the calling thread.
  ///
  /// [sdkEngine] Instance of an existing SDKEngine.
  ///
  /// Returns [MapDownloader]. MapDownloader instance for this engine.
  ///
  @Deprecated("Will be removed in v4.13.0. Use [MapDownloader.fromSdkEngineAsync] instead")

  static MapDownloader fromSdkEngine(SDKNativeEngine sdkEngine) => $prototype.fromSdkEngine(sdkEngine);
  /// Gets a single instance of this class per provided [SDKNativeEngine].
  ///
  /// [sdkEngine] An instance of the SDKNativeEngine
  ///
  /// [mapDownloaderConstructionCallback] A callback that will receive the result of construction
  ///
  static void fromSdkEngineAsync(SDKNativeEngine sdkEngine, MapDownloaderConstructionCallback mapDownloaderConstructionCallback) => $prototype.fromSdkEngineAsync(sdkEngine, mapDownloaderConstructionCallback);
  /// Performs an asynchronous request to fetch a list of [Region] objects that can be used to download
  /// the actual map data in a separate request.
  ///
  /// The default language for [Region.name] will be [LanguageCode.enUs].
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task, for example, to cancel on ongoing request.
  ///
  TaskHandle getDownloadableRegions(DownloadableRegionsCallback callback);
  /// Performs an asynchronous request to fetch a list of [Region] objects with [Region.name]
  /// in given [MapDownloader.getDownloadableRegionsWithLanguageCode.languageCode], that can be used to download the actual map data in a separate request.
  ///
  /// [languageCode] The language code determines the language of [Region.name].
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task, for example, to cancel on ongoing request.
  ///
  TaskHandle getDownloadableRegionsWithLanguageCode(LanguageCode languageCode, DownloadableRegionsCallback callback);
  /// Performs an asynchronous request to download map data for regions specified by a list of [RegionId] instances.
  ///
  /// [MapDownloader.downloadRegions.statusListener] is receiving notifications until [DownloadRegionsStatusListener.onDownloadRegionsComplete] is called.
  /// Request can be cancelled by calling [MapDownloaderTask.cancel] on returned [MapDownloaderTask] object, afterwards
  /// [DownloadRegionsStatusListener.onDownloadRegionsComplete] is called with error [MapLoaderError.operationCancelled].
  /// <br>
  /// Note: If an application is forcefully closed or crashes during a map download operation, then this
  /// method can be called again to resume the download. For example, if a download was interrupted at 60%,
  /// then the next call to download the same region will load the remaining 40%.
  /// <br>
  /// Note: If a download fails during runtime, then the HERE SDK will automatically retry to download the affected
  /// region three times before giving up. A connection will be timed out after one minute.
  ///
  /// [regions] List of regions to download.
  ///
  /// [statusListener] Notifies on the download progress.
  ///
  /// Returns [MapDownloaderTask]. Handle that will be used to manipulate the execution of the task, for example, to cancel on ongoing request.
  ///
  MapDownloaderTask downloadRegions(List<RegionId> regions, DownloadRegionsStatusListener statusListener);
  /// Performs an asynchronous operation to delete map data for regions specified by a list of [RegionId].
  ///
  /// [regions] List of regions to be deleted.
  ///
  /// [callback] Callback which receives the result of deletion on the main thread.
  ///
  void deleteRegions(List<RegionId> regions, DeletedRegionsCallback callback);
  /// Performs an asynchronous operation to clear the persistent map storage from all data.
  ///
  /// All downloaded regions will be removed.
  /// Note: Must be called only when no other region operation is ongoing. Returns an error if there is any active operation.
  ///
  /// [callback] Callback which receives the result of clearing on the main thread.
  ///
  void clearPersistentMapStorage(SDKCacheCallback callback);
  /// Method to get a list of map regions that are currently installed on the device.
  ///
  /// Throws if it's not possible to return list of installed regions.
  ///
  /// Returns [List<InstalledRegion>]. List of IDs of regions that are installed on the device
  ///
  /// Throws [MapLoaderExceptionException]. Specifies reason, why list of installed regions is not returned.
  ///
  List<InstalledRegion> getInstalledRegions();
  /// Gets the initial status of the already downloaded regions at start-up time of the app.
  ///
  /// It is not recommended to download or to upload map data while an app is running in
  /// background. However, it can happen, that an app gets shut down during an ongoing
  /// operation, for example, due to a crash. In such a case, some or all of the downloaded map data
  /// may be in a corrupted state. In such a case it may be possible to repair some or all of the
  /// affected map data via [MapDownloader.repairPersistentMap].
  /// Note: This value will not change during the lieftime of an app.
  ///
  /// Returns [PersistentMapStatus]. Initial status of the persistent map.
  ///
  PersistentMapStatus getInitialPersistentMapStatus();
  /// Tries to repair already downloaded regions that are in a corrupted state (see [MapDownloader.getInitialPersistentMapStatus]).
  ///
  /// [callback] A callback which receives the result of the repair operation on the main thread.
  ///
  void repairPersistentMap(RepairPersistentMapCallback callback);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapDownloader$Impl(Pointer<Void>.fromAddress(0));
}


// MapDownloader "private" section, not exported.

final _sdkMaploaderMapdownloaderRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_MapDownloader_register_finalizer'));
final _sdkMaploaderMapdownloaderCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_copy_handle'));
final _sdkMaploaderMapdownloaderReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_release_handle'));









final _getInstalledRegionsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_getInstalledRegions_return_release_handle'));
final _getInstalledRegionsReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_getInstalledRegions_return_get_result'));
final _getInstalledRegionsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_getInstalledRegions_return_get_error'));
final _getInstalledRegionsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloader_getInstalledRegions_return_has_error'));




/// @nodoc
@visibleForTesting
class MapDownloader$Impl extends __lib.NativeBase implements MapDownloader {

  MapDownloader$Impl(Pointer<Void> handle) : super(handle);

  MapDownloader fromSdkEngine(SDKNativeEngine sdkEngine) {
    final _fromSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_fromEngine__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __resultHandle = _fromSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    try {
      return sdkMaploaderMapdownloaderFromFfi(__resultHandle);
    } finally {
      sdkMaploaderMapdownloaderReleaseFfiHandle(__resultHandle);

    }

  }

  void fromSdkEngineAsync(SDKNativeEngine sdkEngine, MapDownloaderConstructionCallback mapDownloaderConstructionCallback) {
    final _fromSdkEngineAsyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Pointer<Void>), void Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_fromEngineAsync__SDKNativeEngine_MapDownloaderConstructionCallback'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final _mapDownloaderConstructionCallbackHandle = sdkMaploaderMapdownloaderconstructioncallbackToFfi(mapDownloaderConstructionCallback);
    _fromSdkEngineAsyncFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle, _mapDownloaderConstructionCallbackHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    sdkMaploaderMapdownloaderconstructioncallbackReleaseFfiHandle(_mapDownloaderConstructionCallbackHandle);

  }

  @override
  TaskHandle getDownloadableRegions(DownloadableRegionsCallback callback) {
    final _getDownloadableRegionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_getDownloadableRegions__DownloadableRegionsCallback'));
    final _callbackHandle = sdkMaploaderDownloadableregionscallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _getDownloadableRegionsFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkMaploaderDownloadableregionscallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle getDownloadableRegionsWithLanguageCode(LanguageCode languageCode, DownloadableRegionsCallback callback) {
    final _getDownloadableRegionsWithLanguageCodeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Uint32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_getDownloadableRegions__LanguageCode_DownloadableRegionsCallback'));
    final _languageCodeHandle = sdkCoreLanguagecodeToFfi(languageCode);
    final _callbackHandle = sdkMaploaderDownloadableregionscallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _getDownloadableRegionsWithLanguageCodeFfi(_handle, __lib.LibraryContext.isolateId, _languageCodeHandle, _callbackHandle);
    sdkCoreLanguagecodeReleaseFfiHandle(_languageCodeHandle);
    sdkMaploaderDownloadableregionscallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapDownloaderTask downloadRegions(List<RegionId> regions, DownloadRegionsStatusListener statusListener) {
    final _downloadRegionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_downloadRegions__ListOf_sdk_maploader_RegionId_DownloadRegionsStatusListener'));
    final _regionsHandle = heresdkMaploaderBindingslistofSdkMaploaderRegionidToFfi(regions);
    final _statusListenerHandle = sdkMaploaderDownloadregionsstatuslistenerToFfi(statusListener);
    final _handle = this.handle;
    final __resultHandle = _downloadRegionsFfi(_handle, __lib.LibraryContext.isolateId, _regionsHandle, _statusListenerHandle);
    heresdkMaploaderBindingslistofSdkMaploaderRegionidReleaseFfiHandle(_regionsHandle);
    sdkMaploaderDownloadregionsstatuslistenerReleaseFfiHandle(_statusListenerHandle);
    try {
      return sdkMaploaderMapdownloadertaskFromFfi(__resultHandle);
    } finally {
      sdkMaploaderMapdownloadertaskReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void deleteRegions(List<RegionId> regions, DeletedRegionsCallback callback) {
    final _deleteRegionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_deleteRegions__ListOf_sdk_maploader_RegionId_DeletedRegionsCallback'));
    final _regionsHandle = heresdkMaploaderBindingslistofSdkMaploaderRegionidToFfi(regions);
    final _callbackHandle = sdkMaploaderDeletedregionscallbackToFfi(callback);
    final _handle = this.handle;
    _deleteRegionsFfi(_handle, __lib.LibraryContext.isolateId, _regionsHandle, _callbackHandle);
    heresdkMaploaderBindingslistofSdkMaploaderRegionidReleaseFfiHandle(_regionsHandle);
    sdkMaploaderDeletedregionscallbackReleaseFfiHandle(_callbackHandle);

  }

  @override
  void clearPersistentMapStorage(SDKCacheCallback callback) {
    final _clearPersistentMapStorageFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_clearPersistentMapStorage__SDKCacheCallback'));
    final _callbackHandle = sdkMaploaderSdkcachecallbackToFfi(callback);
    final _handle = this.handle;
    _clearPersistentMapStorageFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkMaploaderSdkcachecallbackReleaseFfiHandle(_callbackHandle);

  }

  @override
  List<InstalledRegion> getInstalledRegions() {
    final _getInstalledRegionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapDownloader_getInstalledRegions'));
    final _handle = this.handle;
    final __callResultHandle = _getInstalledRegionsFfi(_handle, __lib.LibraryContext.isolateId);
    if (_getInstalledRegionsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _getInstalledRegionsReturnGetError(__callResultHandle);
        _getInstalledRegionsReturnReleaseHandle(__callResultHandle);
        try {
          throw MapLoaderExceptionException(sdkMaploaderMaploadererrorFromFfi(__errorHandle));
        } finally {
          sdkMaploaderMaploadererrorReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _getInstalledRegionsReturnGetResult(__callResultHandle);
    _getInstalledRegionsReturnReleaseHandle(__callResultHandle);
    try {
      return heresdkMaploaderBindingslistofSdkMaploaderInstalledregionFromFfi(__resultHandle);
    } finally {
      heresdkMaploaderBindingslistofSdkMaploaderInstalledregionReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  PersistentMapStatus getInitialPersistentMapStatus() {
    final _getInitialPersistentMapStatusFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapDownloader_getInitialPersistentMapStatus'));
    final _handle = this.handle;
    final __resultHandle = _getInitialPersistentMapStatusFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMaploaderPersistentmapstatusFromFfi(__resultHandle);
    } finally {
      sdkMaploaderPersistentmapstatusReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void repairPersistentMap(RepairPersistentMapCallback callback) {
    final _repairPersistentMapFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloader_repairPersistentMap__RepairPersistentMapCallback'));
    final _callbackHandle = sdkMaploaderRepairpersistentmapcallbackToFfi(callback);
    final _handle = this.handle;
    _repairPersistentMapFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkMaploaderRepairpersistentmapcallbackReleaseFfiHandle(_callbackHandle);

  }


}

Pointer<Void> sdkMaploaderMapdownloaderToFfi(MapDownloader value) =>
  _sdkMaploaderMapdownloaderCopyHandle((value as __lib.NativeBase).handle);

MapDownloader sdkMaploaderMapdownloaderFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapDownloader) return instance;

  final _copiedHandle = _sdkMaploaderMapdownloaderCopyHandle(handle);
  final result = MapDownloader$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMaploaderMapdownloaderRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderMapdownloaderReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderMapdownloaderReleaseHandle(handle);

Pointer<Void> sdkMaploaderMapdownloaderToFfiNullable(MapDownloader? value) =>
  value != null ? sdkMaploaderMapdownloaderToFfi(value) : Pointer<Void>.fromAddress(0);

MapDownloader? sdkMaploaderMapdownloaderFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMaploaderMapdownloaderFromFfi(handle) : null;

void sdkMaploaderMapdownloaderReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderMapdownloaderReleaseHandle(handle);

// End of MapDownloader "private" section.


