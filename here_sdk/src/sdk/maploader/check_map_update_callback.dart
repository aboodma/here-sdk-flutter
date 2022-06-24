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
import 'package:here_sdk/src/sdk/maploader/map_update_availability.dart';

/// A method which is called on the main thread when [MapUpdater.checkMapUpdate] has been completed.
///
/// The first argument indicates an error in case of a failure. The second argument contains the results.
/// Both arguments cannot be `null` at the same time - or not `null` at the same time.
typedef CheckMapUpdateCallback = void Function(MapLoaderError?, MapUpdateAvailability?);

// CheckMapUpdateCallback "private" section, not exported.

final _sdkMaploaderCheckmapupdatecallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_CheckMapUpdateCallback_register_finalizer'));
final _sdkMaploaderCheckmapupdatecallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CheckMapUpdateCallback_copy_handle'));
final _sdkMaploaderCheckmapupdatecallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CheckMapUpdateCallback_release_handle'));
final _sdkMaploaderCheckmapupdatecallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_maploader_CheckMapUpdateCallback_create_proxy'));

class CheckMapUpdateCallback$Impl {
  final Pointer<Void> handle;
  CheckMapUpdateCallback$Impl(this.handle);

  void call(MapLoaderError? p0, MapUpdateAvailability? p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_CheckMapUpdateCallback_call__MapLoaderError__MapUpdateAvailability_'));
    final _p0Handle = sdkMaploaderMaploadererrorToFfiNullable(p0);
    final _p1Handle = sdkMaploaderMapupdateavailabilityToFfiNullable(p1);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(_p0Handle);
    sdkMaploaderMapupdateavailabilityReleaseFfiHandleNullable(_p1Handle);

  }

}

int _sdkMaploaderCheckmapupdatecallbackcallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (_obj as CheckMapUpdateCallback)(sdkMaploaderMaploadererrorFromFfiNullable(p0), sdkMaploaderMapupdateavailabilityFromFfiNullable(p1));
  } finally {
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(p0);
    sdkMaploaderMapupdateavailabilityReleaseFfiHandleNullable(p1);
  }
  return 0;
}

Pointer<Void> sdkMaploaderCheckmapupdatecallbackToFfi(CheckMapUpdateCallback value) =>
  _sdkMaploaderCheckmapupdatecallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkMaploaderCheckmapupdatecallbackcallStatic, __lib.unknownError)
  );

CheckMapUpdateCallback sdkMaploaderCheckmapupdatecallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkMaploaderCheckmapupdatecallbackCopyHandle(handle);
  final _impl = CheckMapUpdateCallback$Impl(_copiedHandle);
  final result = (MapLoaderError? p0, MapUpdateAvailability? p1) => _impl.call(p0, p1);
  _sdkMaploaderCheckmapupdatecallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderCheckmapupdatecallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderCheckmapupdatecallbackReleaseHandle(handle);

// Nullable CheckMapUpdateCallback

final _sdkMaploaderCheckmapupdatecallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CheckMapUpdateCallback_create_handle_nullable'));
final _sdkMaploaderCheckmapupdatecallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CheckMapUpdateCallback_release_handle_nullable'));
final _sdkMaploaderCheckmapupdatecallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_CheckMapUpdateCallback_get_value_nullable'));

Pointer<Void> sdkMaploaderCheckmapupdatecallbackToFfiNullable(CheckMapUpdateCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderCheckmapupdatecallbackToFfi(value);
  final result = _sdkMaploaderCheckmapupdatecallbackCreateHandleNullable(_handle);
  sdkMaploaderCheckmapupdatecallbackReleaseFfiHandle(_handle);
  return result;
}

CheckMapUpdateCallback? sdkMaploaderCheckmapupdatecallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderCheckmapupdatecallbackGetValueNullable(handle);
  final result = sdkMaploaderCheckmapupdatecallbackFromFfi(_handle);
  sdkMaploaderCheckmapupdatecallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderCheckmapupdatecallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderCheckmapupdatecallbackReleaseHandleNullable(handle);

// End of CheckMapUpdateCallback "private" section.


