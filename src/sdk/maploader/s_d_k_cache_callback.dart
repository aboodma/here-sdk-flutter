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
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/sdk/maploader/map_loader_error.dart';

/// A method which is called on the main thread when [SDKCache.clearAppCache] has been completed.
typedef SDKCacheCallback = void Function(MapLoaderError?);

// SDKCacheCallback "private" section, not exported.

final _sdkMaploaderSdkcachecallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_SDKCacheCallback_register_finalizer'));
final _sdkMaploaderSdkcachecallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_SDKCacheCallback_copy_handle'));
final _sdkMaploaderSdkcachecallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_SDKCacheCallback_release_handle'));
final _sdkMaploaderSdkcachecallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_maploader_SDKCacheCallback_create_proxy'));

class SDKCacheCallback$Impl {
  final Pointer<Void> handle;
  SDKCacheCallback$Impl(this.handle);

  void call(MapLoaderError? p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_SDKCacheCallback_call__MapLoaderError_'));
    final _p0Handle = sdkMaploaderMaploadererrorToFfiNullable(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(_p0Handle);

  }

}

int _sdkMaploaderSdkcachecallbackcallStatic(Object _obj, Pointer<Void> p0) {
  
  try {
    (_obj as SDKCacheCallback)(sdkMaploaderMaploadererrorFromFfiNullable(p0));
  } finally {
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(p0);
  }
  return 0;
}

Pointer<Void> sdkMaploaderSdkcachecallbackToFfi(SDKCacheCallback value) =>
  _sdkMaploaderSdkcachecallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_sdkMaploaderSdkcachecallbackcallStatic, __lib.unknownError)
  );

SDKCacheCallback sdkMaploaderSdkcachecallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkMaploaderSdkcachecallbackCopyHandle(handle);
  final _impl = SDKCacheCallback$Impl(_copiedHandle);
  final result = (MapLoaderError? p0) => _impl.call(p0);
  _sdkMaploaderSdkcachecallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderSdkcachecallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderSdkcachecallbackReleaseHandle(handle);

// Nullable SDKCacheCallback

final _sdkMaploaderSdkcachecallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_SDKCacheCallback_create_handle_nullable'));
final _sdkMaploaderSdkcachecallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_SDKCacheCallback_release_handle_nullable'));
final _sdkMaploaderSdkcachecallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_SDKCacheCallback_get_value_nullable'));

Pointer<Void> sdkMaploaderSdkcachecallbackToFfiNullable(SDKCacheCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderSdkcachecallbackToFfi(value);
  final result = _sdkMaploaderSdkcachecallbackCreateHandleNullable(_handle);
  sdkMaploaderSdkcachecallbackReleaseFfiHandle(_handle);
  return result;
}

SDKCacheCallback? sdkMaploaderSdkcachecallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderSdkcachecallbackGetValueNullable(handle);
  final result = sdkMaploaderSdkcachecallbackFromFfi(_handle);
  sdkMaploaderSdkcachecallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderSdkcachecallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderSdkcachecallbackReleaseHandleNullable(handle);

// End of SDKCacheCallback "private" section.


