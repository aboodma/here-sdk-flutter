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
import 'package:here_sdk/src/builtin_types__conversion.dart';

/// A class to control map download process.
abstract class MapDownloaderTask {

  /// Cancels the ongoing map download operation.
  ///
  /// Operation cannot be resumed afterwards.
  /// It will do nothing if the task was already cancelled or has been completed.
  /// Status of the call will be reported via [DownloadRegionsStatusListener.onDownloadRegionsComplete].
  /// [MapLoaderError.operationCancelled] will be reported for successful cancel.
  ///
  void cancel();
  /// Pauses the ongoing map download operation.
  ///
  /// Operation can be resumed afterwards.
  /// It will do nothing if operation is not in running state.
  /// Status of the call will be reported via [DownloadRegionsStatusListener.onPause].
  ///
  void pause();
  /// Pauses the ongoing map download operation.
  ///
  /// Operation can be resumed afterwards.
  /// It will do nothing if operation is not in running state.
  /// Status of the call will be reported via [DownloadRegionsStatusListener.onPause].
  ///
  /// [compact] A flag which indicates whether the cache should be optimized during the pause or not. A
  /// listener method [DownloadRegionsStatusListener.onPause] will be called upon
  /// cache optimization completion. This operation may take some time.
  ///
  /// @nodoc
  void internalpauseWithCompaction(bool compact);
  /// Resumes paused map download operation.
  ///
  /// It will do nothing if operation is not in
  /// paused state.
  /// Status of the call will be reported via [DownloadRegionsStatusListener.onResume].
  ///
  void resume();
}


// MapDownloaderTask "private" section, not exported.

final _sdkMaploaderMapdownloadertaskRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_MapDownloaderTask_register_finalizer'));
final _sdkMaploaderMapdownloadertaskCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloaderTask_copy_handle'));
final _sdkMaploaderMapdownloadertaskReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloaderTask_release_handle'));






class MapDownloaderTask$Impl extends __lib.NativeBase implements MapDownloaderTask {

  MapDownloaderTask$Impl(Pointer<Void> handle) : super(handle);

  @override
  void cancel() {
    final _cancelFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapDownloaderTask_cancel'));
    final _handle = this.handle;
    _cancelFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void pause() {
    final _pauseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapDownloaderTask_pause'));
    final _handle = this.handle;
    _pauseFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void internalpauseWithCompaction(bool compact) {
    final _pauseWithCompactionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_maploader_MapDownloaderTask_pause__Boolean'));
    final _compactHandle = booleanToFfi(compact);
    final _handle = this.handle;
    _pauseWithCompactionFfi(_handle, __lib.LibraryContext.isolateId, _compactHandle);
    booleanReleaseFfiHandle(_compactHandle);

  }

  @override
  void resume() {
    final _resumeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapDownloaderTask_resume'));
    final _handle = this.handle;
    _resumeFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

Pointer<Void> sdkMaploaderMapdownloadertaskToFfi(MapDownloaderTask value) =>
  _sdkMaploaderMapdownloadertaskCopyHandle((value as __lib.NativeBase).handle);

MapDownloaderTask sdkMaploaderMapdownloadertaskFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapDownloaderTask) return instance;

  final _copiedHandle = _sdkMaploaderMapdownloadertaskCopyHandle(handle);
  final result = MapDownloaderTask$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMaploaderMapdownloadertaskRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderMapdownloadertaskReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderMapdownloadertaskReleaseHandle(handle);

Pointer<Void> sdkMaploaderMapdownloadertaskToFfiNullable(MapDownloaderTask? value) =>
  value != null ? sdkMaploaderMapdownloadertaskToFfi(value) : Pointer<Void>.fromAddress(0);

MapDownloaderTask? sdkMaploaderMapdownloadertaskFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMaploaderMapdownloadertaskFromFfi(handle) : null;

void sdkMaploaderMapdownloadertaskReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderMapdownloadertaskReleaseHandle(handle);

// End of MapDownloaderTask "private" section.


