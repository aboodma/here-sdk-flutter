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
import 'package:here_sdk/src/sdk/maploader/s_d_k_cache_callback.dart';
import 'package:meta/meta.dart';

/// A class to manage SDK Cache.
///
/// Path for SDKCache is specified via [SDKOptions.cachePath].
/// SDKCache manages temporary downloaded map data during map interaction and follows LRU (least recently used) strategy to delete
/// map data when cache size exceeds the specified [SDKOptions.cacheSizeInBytes].
abstract class SDKCache {

  /// Gets a single instance of this class per provided [SDKNativeEngine].
  ///
  /// [sdkEngine] Instance of an existing SDKEngine.
  ///
  /// Returns [SDKCache]. SDKCache instance for this engine.
  ///
  static SDKCache fromSdkEngine(SDKNativeEngine sdkEngine) => $prototype.fromSdkEngine(sdkEngine);
  /// Clears all data that is currently stored in the SDK cache.
  ///
  /// Path for cache is specified by [SDKOptions.cachePath].
  /// The operation can have unexepected behaviour when it is called during a map interaction, during turn-by-turn navigation (if available for your edition) or
  /// during ongoing requests initiated by the OfflineSearchEngine or the OfflineRouteEngine (if available for your edition).
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  void clearAppCache(SDKCacheCallback callback);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SDKCache$Impl(Pointer<Void>.fromAddress(0));
}


// SDKCache "private" section, not exported.

final _sdkMaploaderSdkcacheRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_SDKCache_register_finalizer'));
final _sdkMaploaderSdkcacheCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_SDKCache_copy_handle'));
final _sdkMaploaderSdkcacheReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_SDKCache_release_handle'));




/// @nodoc
@visibleForTesting
class SDKCache$Impl extends __lib.NativeBase implements SDKCache {

  SDKCache$Impl(Pointer<Void> handle) : super(handle);

  SDKCache fromSdkEngine(SDKNativeEngine sdkEngine) {
    final _fromSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_maploader_SDKCache_fromEngine__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __resultHandle = _fromSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    try {
      return sdkMaploaderSdkcacheFromFfi(__resultHandle);
    } finally {
      sdkMaploaderSdkcacheReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void clearAppCache(SDKCacheCallback callback) {
    final _clearAppCacheFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_SDKCache_clearCache__SDKCacheCallback'));
    final _callbackHandle = sdkMaploaderSdkcachecallbackToFfi(callback);
    final _handle = this.handle;
    _clearAppCacheFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkMaploaderSdkcachecallbackReleaseFfiHandle(_callbackHandle);

  }


}

Pointer<Void> sdkMaploaderSdkcacheToFfi(SDKCache value) =>
  _sdkMaploaderSdkcacheCopyHandle((value as __lib.NativeBase).handle);

SDKCache sdkMaploaderSdkcacheFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SDKCache) return instance;

  final _copiedHandle = _sdkMaploaderSdkcacheCopyHandle(handle);
  final result = SDKCache$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMaploaderSdkcacheRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderSdkcacheReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderSdkcacheReleaseHandle(handle);

Pointer<Void> sdkMaploaderSdkcacheToFfiNullable(SDKCache? value) =>
  value != null ? sdkMaploaderSdkcacheToFfi(value) : Pointer<Void>.fromAddress(0);

SDKCache? sdkMaploaderSdkcacheFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMaploaderSdkcacheFromFfi(handle) : null;

void sdkMaploaderSdkcacheReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderSdkcacheReleaseHandle(handle);

// End of SDKCache "private" section.


