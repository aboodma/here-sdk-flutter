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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/maploader/map_loader_error.dart';
import 'package:here_sdk/src/sdk/maploader/region_id.dart';

/// Abstract class to get notified on
/// status updates when downloading map regions.
abstract class DownloadRegionsStatusListener {
  /// Abstract class to get notified on
  /// status updates when downloading map regions.

  factory DownloadRegionsStatusListener(
    void Function(MapLoaderError?, List<RegionId>?) onDownloadRegionsCompleteLambda,
    void Function(RegionId, int) onProgressLambda,
    void Function(MapLoaderError?) onPauseLambda,
    void Function() onResumeLambda,

  ) => DownloadRegionsStatusListener$Lambdas(
    onDownloadRegionsCompleteLambda,
    onProgressLambda,
    onPauseLambda,
    onResumeLambda,

  );

  /// Called after the download for all requested regions has been completed with success or
  /// failure.
  ///
  /// In this callback, failure represents non-retryable error (eg. authentication failure
  /// because of invalid credentails and similars). Temporary failures (eg. network errors) are
  /// notified through [DownloadRegionsStatusListener.onPause] and downloads will be
  /// in paused state so they can be resumed later.
  /// Invoked on the main thread.
  ///
  /// [error] Represents an error in case of a failure. It is `null` for an operation that
  /// succeeds.
  ///
  /// [regions] Represents a list of regions which has been downloaded. It is `null` in case
  /// of an error.
  ///
  void onDownloadRegionsComplete(MapLoaderError? error, List<RegionId>? regions);
  /// Called multiple times to indicate the download progress for each requested region
  /// individually.
  ///
  /// Invoked on the main thread.
  ///
  /// [region] Represents an id of region status update is related to.
  ///
  /// [percentage] Represents a percentage of data which has been downloaded for particular
  /// region.
  ///
  void onProgress(RegionId region, int percentage);
  /// Called when download is paused.
  ///
  /// [error] Populated when retryable error is a reason of a pause. It is 'null' when pause
  /// is called by the user.
  ///
  void onPause(MapLoaderError? error);
  /// Called when paused download is resumed.
  ///
  void onResume();
}


// DownloadRegionsStatusListener "private" section, not exported.

final _sdkMaploaderDownloadregionsstatuslistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_DownloadRegionsStatusListener_register_finalizer'));
final _sdkMaploaderDownloadregionsstatuslistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_DownloadRegionsStatusListener_copy_handle'));
final _sdkMaploaderDownloadregionsstatuslistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_DownloadRegionsStatusListener_release_handle'));
final _sdkMaploaderDownloadregionsstatuslistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_maploader_DownloadRegionsStatusListener_create_proxy'));
final _sdkMaploaderDownloadregionsstatuslistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_DownloadRegionsStatusListener_get_type_id'));





class DownloadRegionsStatusListener$Lambdas implements DownloadRegionsStatusListener {
  void Function(MapLoaderError?, List<RegionId>?) onDownloadRegionsCompleteLambda;
  void Function(RegionId, int) onProgressLambda;
  void Function(MapLoaderError?) onPauseLambda;
  void Function() onResumeLambda;

  DownloadRegionsStatusListener$Lambdas(
    this.onDownloadRegionsCompleteLambda,
    this.onProgressLambda,
    this.onPauseLambda,
    this.onResumeLambda,

  );

  @override
  void onDownloadRegionsComplete(MapLoaderError? error, List<RegionId>? regions) =>
    onDownloadRegionsCompleteLambda(error, regions);
  @override
  void onProgress(RegionId region, int percentage) =>
    onProgressLambda(region, percentage);
  @override
  void onPause(MapLoaderError? error) =>
    onPauseLambda(error);
  @override
  void onResume() =>
    onResumeLambda();
}

class DownloadRegionsStatusListener$Impl extends __lib.NativeBase implements DownloadRegionsStatusListener {

  DownloadRegionsStatusListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onDownloadRegionsComplete(MapLoaderError? error, List<RegionId>? regions) {
    final _onDownloadRegionsCompleteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_DownloadRegionsStatusListener_onDownloadRegionsComplete__MapLoaderError__ListOf_sdk_maploader_RegionId_'));
    final _errorHandle = sdkMaploaderMaploadererrorToFfiNullable(error);
    final _regionsHandle = heresdkMaploaderBindingslistofSdkMaploaderRegionidToFfiNullable(regions);
    final _handle = this.handle;
    _onDownloadRegionsCompleteFfi(_handle, __lib.LibraryContext.isolateId, _errorHandle, _regionsHandle);
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(_errorHandle);
    heresdkMaploaderBindingslistofSdkMaploaderRegionidReleaseFfiHandleNullable(_regionsHandle);

  }

  @override
  void onProgress(RegionId region, int percentage) {
    final _onProgressFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Int32), void Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_maploader_DownloadRegionsStatusListener_onProgress__RegionId_Int'));
    final _regionHandle = sdkMaploaderRegionidToFfi(region);
    final _percentageHandle = (percentage);
    final _handle = this.handle;
    _onProgressFfi(_handle, __lib.LibraryContext.isolateId, _regionHandle, _percentageHandle);
    sdkMaploaderRegionidReleaseFfiHandle(_regionHandle);


  }

  @override
  void onPause(MapLoaderError? error) {
    final _onPauseFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_DownloadRegionsStatusListener_onPause__MapLoaderError_'));
    final _errorHandle = sdkMaploaderMaploadererrorToFfiNullable(error);
    final _handle = this.handle;
    _onPauseFfi(_handle, __lib.LibraryContext.isolateId, _errorHandle);
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(_errorHandle);

  }

  @override
  void onResume() {
    final _onResumeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_maploader_DownloadRegionsStatusListener_onResume'));
    final _handle = this.handle;
    _onResumeFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

int _sdkMaploaderDownloadregionsstatuslisteneronDownloadRegionsCompleteStatic(Object _obj, Pointer<Void> error, Pointer<Void> regions) {

  try {
    (_obj as DownloadRegionsStatusListener).onDownloadRegionsComplete(sdkMaploaderMaploadererrorFromFfiNullable(error), heresdkMaploaderBindingslistofSdkMaploaderRegionidFromFfiNullable(regions));
  } finally {
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(error);
    heresdkMaploaderBindingslistofSdkMaploaderRegionidReleaseFfiHandleNullable(regions);
  }
  return 0;
}
int _sdkMaploaderDownloadregionsstatuslisteneronProgressStatic(Object _obj, Pointer<Void> region, int percentage) {

  try {
    (_obj as DownloadRegionsStatusListener).onProgress(sdkMaploaderRegionidFromFfi(region), (percentage));
  } finally {
    sdkMaploaderRegionidReleaseFfiHandle(region);
    
  }
  return 0;
}
int _sdkMaploaderDownloadregionsstatuslisteneronPauseStatic(Object _obj, Pointer<Void> error) {

  try {
    (_obj as DownloadRegionsStatusListener).onPause(sdkMaploaderMaploadererrorFromFfiNullable(error));
  } finally {
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(error);
  }
  return 0;
}
int _sdkMaploaderDownloadregionsstatuslisteneronResumeStatic(Object _obj) {

  try {
    (_obj as DownloadRegionsStatusListener).onResume();
  } finally {
  }
  return 0;
}


Pointer<Void> sdkMaploaderDownloadregionsstatuslistenerToFfi(DownloadRegionsStatusListener value) {
  if (value is __lib.NativeBase) return _sdkMaploaderDownloadregionsstatuslistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkMaploaderDownloadregionsstatuslistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkMaploaderDownloadregionsstatuslisteneronDownloadRegionsCompleteStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Int32)>(_sdkMaploaderDownloadregionsstatuslisteneronProgressStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkMaploaderDownloadregionsstatuslisteneronPauseStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkMaploaderDownloadregionsstatuslisteneronResumeStatic, __lib.unknownError)
  );

  return result;
}

DownloadRegionsStatusListener sdkMaploaderDownloadregionsstatuslistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DownloadRegionsStatusListener) return instance;

  final _typeIdHandle = _sdkMaploaderDownloadregionsstatuslistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMaploaderDownloadregionsstatuslistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : DownloadRegionsStatusListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMaploaderDownloadregionsstatuslistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderDownloadregionsstatuslistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderDownloadregionsstatuslistenerReleaseHandle(handle);

Pointer<Void> sdkMaploaderDownloadregionsstatuslistenerToFfiNullable(DownloadRegionsStatusListener? value) =>
  value != null ? sdkMaploaderDownloadregionsstatuslistenerToFfi(value) : Pointer<Void>.fromAddress(0);

DownloadRegionsStatusListener? sdkMaploaderDownloadregionsstatuslistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMaploaderDownloadregionsstatuslistenerFromFfi(handle) : null;

void sdkMaploaderDownloadregionsstatuslistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderDownloadregionsstatuslistenerReleaseHandle(handle);

// End of DownloadRegionsStatusListener "private" section.


