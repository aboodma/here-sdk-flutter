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
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/maploader/check_map_update_callback.dart';
import 'package:here_sdk/src/sdk/maploader/map_loader_error.dart';
import 'package:here_sdk/src/sdk/maploader/map_loader_exception_exception.dart';
import 'package:here_sdk/src/sdk/maploader/map_update_progress_listener.dart';
import 'package:here_sdk/src/sdk/maploader/map_update_task.dart';
import 'package:here_sdk/src/sdk/maploader/map_updater_construction_callback.dart';
import 'package:here_sdk/src/sdk/maploader/map_version_handle.dart';
import 'package:meta/meta.dart';

/// A class to update regions that have been previously downloaded by
/// [MapDownloader].
///
/// At the first, the updates for the regions are downloaded.
/// When the download has completed, the update process starts and the new content is installed.
/// It is recommended, to regularly call [MapUpdater.checkMapUpdate] to check if there is an update available
/// for any of the downloaded regions.
/// If so, those regions can be updated asynchronously by calling [MapUpdater.performMapUpdate].
/// The [MapUpdateProgressListener] informs on the update progress
/// for the individual regions.
/// In case of an error, previous map data is still ready for use. Previous map data
/// will only be replaced once the new map data has been downloaded successfully. This happens per
/// region. The regions that may have failed, need to be updated in a new call. Paused updates
/// can be resumed at a later time.
/// During the update process, the [MapUpdater] will internally retry failed downloads
/// until it is timed out. If this happens, it will be reported via
/// If the update process is cancelled by the user during the update phase then it is ignored -
/// the update phase starts when all content has been downloaded and the HERE SDK will install and
/// replace the existing regions. It's only possible to cancel the process during the download phase
/// and a successful cancellation is indicated via [MapUpdateProgressListener.onComplete].
/// [MapUpdateProgressListener.onPause], so that the user can resume at a later time.
///
/// Note that a [MapLoaderError.notReady] occurs when the [MapDownloader] is used in parallel.
/// In general, background updates are not supported explicitly, as the OS can abort background processes.
/// In addition, the OfflineSearchEngine and the OfflineRoutingEngine cannot be used while a map update is
/// in progress and it will be indicated by a [MapLoaderError].
abstract class MapUpdater {

  /// Gets a single instance of this class per provided [SDKNativeEngine].
  ///
  /// Constructor blocks the calling thread.
  ///
  /// [sdkEngine] Instance of an existing SDKEngine.
  ///
  /// Returns [MapUpdater]. A MapUpdater instance for this engine.
  ///
  @Deprecated("Will be removed in v4.13.0. Use [MapUpdater.fromSdkEngineAsync] instead")

  static MapUpdater fromSdkEngine(SDKNativeEngine sdkEngine) => $prototype.fromSdkEngine(sdkEngine);
  /// Gets a single instance of this class per provided [SDKNativeEngine].
  ///
  /// [sdkEngine] An instance of the SDKNativeEngine
  ///
  /// [mapUpdaterConstructionCallback] A callback that will receive the result of construction
  ///
  static void fromSdkEngineAsync(SDKNativeEngine sdkEngine, MapUpdaterConstructionCallback mapUpdaterConstructionCallback) => $prototype.fromSdkEngineAsync(sdkEngine, mapUpdaterConstructionCallback);
  /// Performs an asynchronous request to update all previously downloaded map data to their latests versions.
  ///
  /// If no updates are available, [MapUpdateProgressListener.onComplete]
  /// will be called immediately with a [MapLoaderError].
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [MapUpdateTask]. A handle that will be used to manipulate the execution of the task, for example, to cancel an ongoing request.
  ///
  MapUpdateTask performMapUpdate(MapUpdateProgressListener callback);
  /// Performs an asynchronous request to update the FeatureConfiguration changed via .
  ///
  /// If there is no map downloaded, [MapUpdateProgressListener.onComplete]
  /// will be called immediately with a [MapLoaderError.invalidArgument].
  /// Note that this is only once required after a feature configuration was changed by a developer (see MapDownloader) :
  /// After an update of an application is installed, this method should be called to activate the new configuration.
  /// As a result, affected offline maps will be refreshed. This may take a while, depending on how many offline maps are installed
  /// on a device. Note that calling this is not necessary when an application is installed for the very first time.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [MapUpdateTask]. A handle that will be used to manipulate the execution of the task, for example, to cancel an ongoing request.
  ///
  MapUpdateTask performFeatureUpdate(MapUpdateProgressListener callback);
  /// Returns a handle that contains the map version of the already downloaded and installed regions.
  ///
  /// This information is only needed for debugging purposes.
  ///
  /// Returns [MapVersionHandle]. A handle to get the map version.
  ///
  /// Throws [MapLoaderExceptionException]. Specifies reason, why current map version is not returned.
  ///
  MapVersionHandle getCurrentMapVersion();
  /// Performs asynchronous check for map update.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. A handle to cancel a pending operation.
  ///
  TaskHandle checkMapUpdate(CheckMapUpdateCallback callback);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapUpdater$Impl(Pointer<Void>.fromAddress(0));
}


// MapUpdater "private" section, not exported.

final _sdkMaploaderMapupdaterRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_MapUpdater_register_finalizer'));
final _sdkMaploaderMapupdaterCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdater_copy_handle'));
final _sdkMaploaderMapupdaterReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdater_release_handle'));






final _getCurrentMapVersionReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdater_getCurrentMapVersion_return_release_handle'));
final _getCurrentMapVersionReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdater_getCurrentMapVersion_return_get_result'));
final _getCurrentMapVersionReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdater_getCurrentMapVersion_return_get_error'));
final _getCurrentMapVersionReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdater_getCurrentMapVersion_return_has_error'));



/// @nodoc
@visibleForTesting
class MapUpdater$Impl extends __lib.NativeBase implements MapUpdater {

  MapUpdater$Impl(Pointer<Void> handle) : super(handle);

  MapUpdater fromSdkEngine(SDKNativeEngine sdkEngine) {
    final _fromSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_maploader_MapUpdater_fromEngine__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __resultHandle = _fromSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    try {
      return sdkMaploaderMapupdaterFromFfi(__resultHandle);
    } finally {
      sdkMaploaderMapupdaterReleaseFfiHandle(__resultHandle);

    }

  }

  void fromSdkEngineAsync(SDKNativeEngine sdkEngine, MapUpdaterConstructionCallback mapUpdaterConstructionCallback) {
    final _fromSdkEngineAsyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>, Pointer<Void>), void Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_MapUpdater_fromEngineAsync__SDKNativeEngine_MapUpdaterConstructionCallback'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final _mapUpdaterConstructionCallbackHandle = sdkMaploaderMapupdaterconstructioncallbackToFfi(mapUpdaterConstructionCallback);
    _fromSdkEngineAsyncFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle, _mapUpdaterConstructionCallbackHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    sdkMaploaderMapupdaterconstructioncallbackReleaseFfiHandle(_mapUpdaterConstructionCallbackHandle);

  }

  @override
  MapUpdateTask performMapUpdate(MapUpdateProgressListener callback) {
    final _performMapUpdateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapUpdater_performMapUpdate__MapUpdateProgressListener'));
    final _callbackHandle = sdkMaploaderMapupdateprogresslistenerToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _performMapUpdateFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkMaploaderMapupdateprogresslistenerReleaseFfiHandle(_callbackHandle);
    try {
      return sdkMaploaderMapupdatetaskFromFfi(__resultHandle);
    } finally {
      sdkMaploaderMapupdatetaskReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapUpdateTask performFeatureUpdate(MapUpdateProgressListener callback) {
    final _performFeatureUpdateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapUpdater_performFeatureUpdate__MapUpdateProgressListener'));
    final _callbackHandle = sdkMaploaderMapupdateprogresslistenerToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _performFeatureUpdateFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkMaploaderMapupdateprogresslistenerReleaseFfiHandle(_callbackHandle);
    try {
      return sdkMaploaderMapupdatetaskFromFfi(__resultHandle);
    } finally {
      sdkMaploaderMapupdatetaskReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  MapVersionHandle getCurrentMapVersion() {
    final _getCurrentMapVersionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapUpdater_getCurrentMapVersion'));
    final _handle = this.handle;
    final __callResultHandle = _getCurrentMapVersionFfi(_handle, __lib.LibraryContext.isolateId);
    if (_getCurrentMapVersionReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _getCurrentMapVersionReturnGetError(__callResultHandle);
        _getCurrentMapVersionReturnReleaseHandle(__callResultHandle);
        try {
          throw MapLoaderExceptionException(sdkMaploaderMaploadererrorFromFfi(__errorHandle));
        } finally {
          sdkMaploaderMaploadererrorReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _getCurrentMapVersionReturnGetResult(__callResultHandle);
    _getCurrentMapVersionReturnReleaseHandle(__callResultHandle);
    try {
      return sdkMaploaderMapversionhandleFromFfi(__resultHandle);
    } finally {
      sdkMaploaderMapversionhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle checkMapUpdate(CheckMapUpdateCallback callback) {
    final _checkMapUpdateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapUpdater_checkMapUpdate__CheckMapUpdateCallback'));
    final _callbackHandle = sdkMaploaderCheckmapupdatecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _checkMapUpdateFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkMaploaderCheckmapupdatecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkMaploaderMapupdaterToFfi(MapUpdater value) =>
  _sdkMaploaderMapupdaterCopyHandle((value as __lib.NativeBase).handle);

MapUpdater sdkMaploaderMapupdaterFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapUpdater) return instance;

  final _copiedHandle = _sdkMaploaderMapupdaterCopyHandle(handle);
  final result = MapUpdater$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMaploaderMapupdaterRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderMapupdaterReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderMapupdaterReleaseHandle(handle);

Pointer<Void> sdkMaploaderMapupdaterToFfiNullable(MapUpdater? value) =>
  value != null ? sdkMaploaderMapupdaterToFfi(value) : Pointer<Void>.fromAddress(0);

MapUpdater? sdkMaploaderMapupdaterFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMaploaderMapupdaterFromFfi(handle) : null;

void sdkMaploaderMapupdaterReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderMapupdaterReleaseHandle(handle);

// End of MapUpdater "private" section.


