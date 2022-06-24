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
import 'package:here_sdk/src/sdk/maploader/map_downloader.dart';

/// A method which is called on the main thread when [MapDownloader.fromSdkEngineAsync] has been completed.
///
/// The `MapDownloader` instance is created on a background thread to not block the calling
/// thread.
///
/// During construction an online connection is established to fetch configuration data for
/// internal use. If no online connection is available, cached or default values will be used.
/// This is only for internal reasons and has no effect on the operability of the resulting
/// instance. When configuration data is available from the cache, construction can still take
/// a reasonable amount of time. Applications should consider to show a loading indicator.
typedef MapDownloaderConstructionCallback = void Function(MapDownloader);

// MapDownloaderConstructionCallback "private" section, not exported.

final _sdkMaploaderMapdownloaderconstructioncallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_MapDownloaderConstructionCallback_register_finalizer'));
final _sdkMaploaderMapdownloaderconstructioncallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloaderConstructionCallback_copy_handle'));
final _sdkMaploaderMapdownloaderconstructioncallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloaderConstructionCallback_release_handle'));
final _sdkMaploaderMapdownloaderconstructioncallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_maploader_MapDownloaderConstructionCallback_create_proxy'));

class MapDownloaderConstructionCallback$Impl {
  final Pointer<Void> handle;
  MapDownloaderConstructionCallback$Impl(this.handle);

  void call(MapDownloader p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapDownloaderConstructionCallback_call__MapDownloader'));
    final _p0Handle = sdkMaploaderMapdownloaderToFfi(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    sdkMaploaderMapdownloaderReleaseFfiHandle(_p0Handle);

  }

}

int _sdkMaploaderMapdownloaderconstructioncallbackcallStatic(Object _obj, Pointer<Void> p0) {
  
  try {
    (_obj as MapDownloaderConstructionCallback)(sdkMaploaderMapdownloaderFromFfi(p0));
  } finally {
    sdkMaploaderMapdownloaderReleaseFfiHandle(p0);
  }
  return 0;
}

Pointer<Void> sdkMaploaderMapdownloaderconstructioncallbackToFfi(MapDownloaderConstructionCallback value) =>
  _sdkMaploaderMapdownloaderconstructioncallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_sdkMaploaderMapdownloaderconstructioncallbackcallStatic, __lib.unknownError)
  );

MapDownloaderConstructionCallback sdkMaploaderMapdownloaderconstructioncallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkMaploaderMapdownloaderconstructioncallbackCopyHandle(handle);
  final _impl = MapDownloaderConstructionCallback$Impl(_copiedHandle);
  final result = (MapDownloader p0) => _impl.call(p0);
  _sdkMaploaderMapdownloaderconstructioncallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderMapdownloaderconstructioncallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderMapdownloaderconstructioncallbackReleaseHandle(handle);

// Nullable MapDownloaderConstructionCallback

final _sdkMaploaderMapdownloaderconstructioncallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloaderConstructionCallback_create_handle_nullable'));
final _sdkMaploaderMapdownloaderconstructioncallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloaderConstructionCallback_release_handle_nullable'));
final _sdkMaploaderMapdownloaderconstructioncallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapDownloaderConstructionCallback_get_value_nullable'));

Pointer<Void> sdkMaploaderMapdownloaderconstructioncallbackToFfiNullable(MapDownloaderConstructionCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderMapdownloaderconstructioncallbackToFfi(value);
  final result = _sdkMaploaderMapdownloaderconstructioncallbackCreateHandleNullable(_handle);
  sdkMaploaderMapdownloaderconstructioncallbackReleaseFfiHandle(_handle);
  return result;
}

MapDownloaderConstructionCallback? sdkMaploaderMapdownloaderconstructioncallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderMapdownloaderconstructioncallbackGetValueNullable(handle);
  final result = sdkMaploaderMapdownloaderconstructioncallbackFromFfi(_handle);
  sdkMaploaderMapdownloaderconstructioncallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderMapdownloaderconstructioncallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderMapdownloaderconstructioncallbackReleaseHandleNullable(handle);

// End of MapDownloaderConstructionCallback "private" section.


