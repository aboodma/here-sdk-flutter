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
import 'package:here_sdk/src/sdk/maploader/map_updater.dart';

/// A method which is called on the main thread when [MapUpdater.fromSdkEngineAsync] has been completed.
///
/// Construction requires the online configuration to be fetched, which in case of sync API, would block the calling thread.
/// When configuration is cached, it is enough to read it from the disk, this operation still takes relatively big time.
typedef MapUpdaterConstructionCallback = void Function(MapUpdater);

// MapUpdaterConstructionCallback "private" section, not exported.

final _sdkMaploaderMapupdaterconstructioncallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_MapUpdaterConstructionCallback_register_finalizer'));
final _sdkMaploaderMapupdaterconstructioncallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdaterConstructionCallback_copy_handle'));
final _sdkMaploaderMapupdaterconstructioncallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdaterConstructionCallback_release_handle'));
final _sdkMaploaderMapupdaterconstructioncallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_maploader_MapUpdaterConstructionCallback_create_proxy'));

class MapUpdaterConstructionCallback$Impl {
  final Pointer<Void> handle;
  MapUpdaterConstructionCallback$Impl(this.handle);

  void call(MapUpdater p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapUpdaterConstructionCallback_call__MapUpdater'));
    final _p0Handle = sdkMaploaderMapupdaterToFfi(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    sdkMaploaderMapupdaterReleaseFfiHandle(_p0Handle);

  }

}

int _sdkMaploaderMapupdaterconstructioncallbackcallStatic(Object _obj, Pointer<Void> p0) {
  
  try {
    (_obj as MapUpdaterConstructionCallback)(sdkMaploaderMapupdaterFromFfi(p0));
  } finally {
    sdkMaploaderMapupdaterReleaseFfiHandle(p0);
  }
  return 0;
}

Pointer<Void> sdkMaploaderMapupdaterconstructioncallbackToFfi(MapUpdaterConstructionCallback value) =>
  _sdkMaploaderMapupdaterconstructioncallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_sdkMaploaderMapupdaterconstructioncallbackcallStatic, __lib.unknownError)
  );

MapUpdaterConstructionCallback sdkMaploaderMapupdaterconstructioncallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkMaploaderMapupdaterconstructioncallbackCopyHandle(handle);
  final _impl = MapUpdaterConstructionCallback$Impl(_copiedHandle);
  final result = (MapUpdater p0) => _impl.call(p0);
  _sdkMaploaderMapupdaterconstructioncallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderMapupdaterconstructioncallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderMapupdaterconstructioncallbackReleaseHandle(handle);

// Nullable MapUpdaterConstructionCallback

final _sdkMaploaderMapupdaterconstructioncallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdaterConstructionCallback_create_handle_nullable'));
final _sdkMaploaderMapupdaterconstructioncallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdaterConstructionCallback_release_handle_nullable'));
final _sdkMaploaderMapupdaterconstructioncallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdaterConstructionCallback_get_value_nullable'));

Pointer<Void> sdkMaploaderMapupdaterconstructioncallbackToFfiNullable(MapUpdaterConstructionCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderMapupdaterconstructioncallbackToFfi(value);
  final result = _sdkMaploaderMapupdaterconstructioncallbackCreateHandleNullable(_handle);
  sdkMaploaderMapupdaterconstructioncallbackReleaseFfiHandle(_handle);
  return result;
}

MapUpdaterConstructionCallback? sdkMaploaderMapupdaterconstructioncallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderMapupdaterconstructioncallbackGetValueNullable(handle);
  final result = sdkMaploaderMapupdaterconstructioncallbackFromFfi(_handle);
  sdkMaploaderMapupdaterconstructioncallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderMapupdaterconstructioncallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderMapupdaterconstructioncallbackReleaseHandleNullable(handle);

// End of MapUpdaterConstructionCallback "private" section.


