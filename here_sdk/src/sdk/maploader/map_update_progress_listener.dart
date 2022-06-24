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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/maploader/map_loader_error.dart';
import 'package:here_sdk/src/sdk/maploader/region_id.dart';

/// Abstract class to get notified on status updates
/// when updating map data, previously downloaded by [MapDownloader].
abstract class MapUpdateProgressListener {
  /// Abstract class to get notified on status updates
  /// when updating map data, previously downloaded by [MapDownloader].

  factory MapUpdateProgressListener(
    void Function(RegionId, int) onProgressLambda,
    void Function(MapLoaderError?) onPauseLambda,
    void Function(MapLoaderError?) onCompleteLambda,
    void Function() onResumeLambda,

  ) => MapUpdateProgressListener$Lambdas(
    onProgressLambda,
    onPauseLambda,
    onCompleteLambda,
    onResumeLambda,

  );

  /// Called multiple times to indicate the update progress.
  ///
  /// Invoked on the main thread.
  ///
  /// [region] Represents an id of region status update is related to.
  ///
  /// [percentage] Represents a percentage of map data which has been updated.
  ///
  void onProgress(RegionId region, int percentage);
  /// Called when update is paused.
  ///
  /// Invoked on the main thread.
  ///
  /// [error] Populated when a retryable error is the reason for a pause. A retryable error can happen,
  /// when, for example, the HERE SDK tries too often to resume a download that was paused due to a lost connection.
  /// In general, the HERE SDK will try a few times, before the update is paused.
  /// This error value gives a hint on the reason for the necessary retry operation.
  /// A paused download can be resumed by the user at a later time.
  /// It is 'null' when [MapUpdateTask.pauseWithCompaction] was called by the user.
  ///
  void onPause(MapLoaderError? error);
  /// Called after the update process for all regions has been completed.
  ///
  /// Invoked on the main thread.
  ///
  /// [error] Represents an error in case of a failure.
  /// If an error occurs, the operation cannot be resumed later.
  /// It is `null` for an operation that succeeds.
  ///
  void onComplete(MapLoaderError? error);
  /// Called when a paused map update is resumed.
  ///
  void onResume();
}


// MapUpdateProgressListener "private" section, not exported.

final _sdkMaploaderMapupdateprogresslistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_MapUpdateProgressListener_register_finalizer'));
final _sdkMaploaderMapupdateprogresslistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdateProgressListener_copy_handle'));
final _sdkMaploaderMapupdateprogresslistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdateProgressListener_release_handle'));
final _sdkMaploaderMapupdateprogresslistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_maploader_MapUpdateProgressListener_create_proxy'));
final _sdkMaploaderMapupdateprogresslistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdateProgressListener_get_type_id'));





class MapUpdateProgressListener$Lambdas implements MapUpdateProgressListener {
  void Function(RegionId, int) onProgressLambda;
  void Function(MapLoaderError?) onPauseLambda;
  void Function(MapLoaderError?) onCompleteLambda;
  void Function() onResumeLambda;

  MapUpdateProgressListener$Lambdas(
    this.onProgressLambda,
    this.onPauseLambda,
    this.onCompleteLambda,
    this.onResumeLambda,

  );

  @override
  void onProgress(RegionId region, int percentage) =>
    onProgressLambda(region, percentage);
  @override
  void onPause(MapLoaderError? error) =>
    onPauseLambda(error);
  @override
  void onComplete(MapLoaderError? error) =>
    onCompleteLambda(error);
  @override
  void onResume() =>
    onResumeLambda();
}

class MapUpdateProgressListener$Impl extends __lib.NativeBase implements MapUpdateProgressListener {

  MapUpdateProgressListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onProgress(RegionId region, int percentage) {
    final _onProgressFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Int32), void Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_maploader_MapUpdateProgressListener_onProgress__RegionId_Int'));
    final _regionHandle = sdkMaploaderRegionidToFfi(region);
    final _percentageHandle = (percentage);
    final _handle = this.handle;
    _onProgressFfi(_handle, __lib.LibraryContext.isolateId, _regionHandle, _percentageHandle);
    sdkMaploaderRegionidReleaseFfiHandle(_regionHandle);


  }

  @override
  void onPause(MapLoaderError? error) {
    final _onPauseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapUpdateProgressListener_onPause__MapLoaderError_'));
    final _errorHandle = sdkMaploaderMaploadererrorToFfiNullable(error);
    final _handle = this.handle;
    _onPauseFfi(_handle, __lib.LibraryContext.isolateId, _errorHandle);
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(_errorHandle);

  }

  @override
  void onComplete(MapLoaderError? error) {
    final _onCompleteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapUpdateProgressListener_onComplete__MapLoaderError_'));
    final _errorHandle = sdkMaploaderMaploadererrorToFfiNullable(error);
    final _handle = this.handle;
    _onCompleteFfi(_handle, __lib.LibraryContext.isolateId, _errorHandle);
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(_errorHandle);

  }

  @override
  void onResume() {
    final _onResumeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_MapUpdateProgressListener_onResume'));
    final _handle = this.handle;
    _onResumeFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

int _sdkMaploaderMapupdateprogresslisteneronProgressStatic(Object _obj, Pointer<Void> region, int percentage) {

  try {
    (_obj as MapUpdateProgressListener).onProgress(sdkMaploaderRegionidFromFfi(region), (percentage));
  } finally {
    sdkMaploaderRegionidReleaseFfiHandle(region);
    
  }
  return 0;
}
int _sdkMaploaderMapupdateprogresslisteneronPauseStatic(Object _obj, Pointer<Void> error) {

  try {
    (_obj as MapUpdateProgressListener).onPause(sdkMaploaderMaploadererrorFromFfiNullable(error));
  } finally {
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(error);
  }
  return 0;
}
int _sdkMaploaderMapupdateprogresslisteneronCompleteStatic(Object _obj, Pointer<Void> error) {

  try {
    (_obj as MapUpdateProgressListener).onComplete(sdkMaploaderMaploadererrorFromFfiNullable(error));
  } finally {
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(error);
  }
  return 0;
}
int _sdkMaploaderMapupdateprogresslisteneronResumeStatic(Object _obj) {

  try {
    (_obj as MapUpdateProgressListener).onResume();
  } finally {
  }
  return 0;
}


Pointer<Void> sdkMaploaderMapupdateprogresslistenerToFfi(MapUpdateProgressListener value) {
  if (value is __lib.NativeBase) return _sdkMaploaderMapupdateprogresslistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkMaploaderMapupdateprogresslistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Int32)>(_sdkMaploaderMapupdateprogresslisteneronProgressStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkMaploaderMapupdateprogresslisteneronPauseStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkMaploaderMapupdateprogresslisteneronCompleteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkMaploaderMapupdateprogresslisteneronResumeStatic, __lib.unknownError)
  );

  return result;
}

MapUpdateProgressListener sdkMaploaderMapupdateprogresslistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapUpdateProgressListener) return instance;

  final _typeIdHandle = _sdkMaploaderMapupdateprogresslistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMaploaderMapupdateprogresslistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MapUpdateProgressListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMaploaderMapupdateprogresslistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderMapupdateprogresslistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderMapupdateprogresslistenerReleaseHandle(handle);

Pointer<Void> sdkMaploaderMapupdateprogresslistenerToFfiNullable(MapUpdateProgressListener? value) =>
  value != null ? sdkMaploaderMapupdateprogresslistenerToFfi(value) : Pointer<Void>.fromAddress(0);

MapUpdateProgressListener? sdkMaploaderMapupdateprogresslistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMaploaderMapupdateprogresslistenerFromFfi(handle) : null;

void sdkMaploaderMapupdateprogresslistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderMapupdateprogresslistenerReleaseHandle(handle);

// End of MapUpdateProgressListener "private" section.


