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

/// A class to control the map update process.
abstract class MapUpdateTask {

  /// Cancels the ongoing map update operation.
  ///
  /// Operation cannot be resumed afterwards.
  /// It will do nothing if the task was already cancelled or has been completed.
  /// Status of the call will be reported via [MapUpdateProgressListener.onComplete].
  /// [MapLoaderError.operationCancelled] will be reported for a successful cancel operation.
  ///
  void cancel();
  /// Pauses the ongoing map update operation.
  ///
  /// Operation can be resumed afterwards.
  /// It will do nothing if the operation is not in a running state.
  /// Status of the call will be reported via [MapUpdateProgressListener.onPause].
  ///
  void pause();
  /// Pauses the ongoing map update operation.
  ///
  /// Operation can be resumed afterwards.
  /// It will do nothing if operation is not in running state.
  /// Status of the call will be reported via [MapUpdateProgressListener.onPause].
  ///
  /// [compact] A flag which indicates whether the cache should be optimized during the pause or not. A
  /// listener method [MapUpdateProgressListener.onPause] will be called upon
  /// cache optimization completion. This operation may take some time.
  ///
  /// @nodoc
  void internalpauseWithCompaction(bool compact);
  /// Resumes paused map update operation.
  ///
  /// It will do nothing if operation is not in
  /// paused state.
  ///
  void resume();
}


// MapUpdateTask "private" section, not exported.

final _sdkMaploaderMapupdatetaskRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_MapUpdateTask_register_finalizer'));
final _sdkMaploaderMapupdatetaskCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdateTask_copy_handle'));
final _sdkMaploaderMapupdatetaskReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdateTask_release_handle'));






class MapUpdateTask$Impl extends __lib.NativeBase implements MapUpdateTask {

  MapUpdateTask$Impl(Pointer<Void> handle) : super(handle);

  @override
  void cancel() {
    final _cancelFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapUpdateTask_cancel'));
    final _handle = this.handle;
    _cancelFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void pause() {
    final _pauseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapUpdateTask_pause'));
    final _handle = this.handle;
    _pauseFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void internalpauseWithCompaction(bool compact) {
    final _pauseWithCompactionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_maploader_MapUpdateTask_pause__Boolean'));
    final _compactHandle = booleanToFfi(compact);
    final _handle = this.handle;
    _pauseWithCompactionFfi(_handle, __lib.LibraryContext.isolateId, _compactHandle);
    booleanReleaseFfiHandle(_compactHandle);

  }

  @override
  void resume() {
    final _resumeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapUpdateTask_resume'));
    final _handle = this.handle;
    _resumeFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

Pointer<Void> sdkMaploaderMapupdatetaskToFfi(MapUpdateTask value) =>
  _sdkMaploaderMapupdatetaskCopyHandle((value as __lib.NativeBase).handle);

MapUpdateTask sdkMaploaderMapupdatetaskFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapUpdateTask) return instance;

  final _copiedHandle = _sdkMaploaderMapupdatetaskCopyHandle(handle);
  final result = MapUpdateTask$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMaploaderMapupdatetaskRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderMapupdatetaskReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderMapupdatetaskReleaseHandle(handle);

Pointer<Void> sdkMaploaderMapupdatetaskToFfiNullable(MapUpdateTask? value) =>
  value != null ? sdkMaploaderMapupdatetaskToFfi(value) : Pointer<Void>.fromAddress(0);

MapUpdateTask? sdkMaploaderMapupdatetaskFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMaploaderMapupdatetaskFromFfi(handle) : null;

void sdkMaploaderMapupdatetaskReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderMapupdatetaskReleaseHandle(handle);

// End of MapUpdateTask "private" section.


