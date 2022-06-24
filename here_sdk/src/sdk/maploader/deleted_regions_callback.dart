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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/maploader/map_loader_error.dart';
import 'package:here_sdk/src/sdk/maploader/region_id.dart';

/// A method which is called on the main thread when [MapDownloader.deleteRegions] has been completed.
typedef DeletedRegionsCallback = void Function(MapLoaderError?, List<RegionId>?);

// DeletedRegionsCallback "private" section, not exported.

final _sdkMaploaderDeletedregionscallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_DeletedRegionsCallback_register_finalizer'));
final _sdkMaploaderDeletedregionscallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_DeletedRegionsCallback_copy_handle'));
final _sdkMaploaderDeletedregionscallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_DeletedRegionsCallback_release_handle'));
final _sdkMaploaderDeletedregionscallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_maploader_DeletedRegionsCallback_create_proxy'));

class DeletedRegionsCallback$Impl {
  final Pointer<Void> handle;
  DeletedRegionsCallback$Impl(this.handle);

  void call(MapLoaderError? p0, List<RegionId>? p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_DeletedRegionsCallback_call__MapLoaderError__ListOf_sdk_maploader_RegionId_'));
    final _p0Handle = sdkMaploaderMaploadererrorToFfiNullable(p0);
    final _p1Handle = heresdkMaploaderBindingslistofSdkMaploaderRegionidToFfiNullable(p1);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(_p0Handle);
    heresdkMaploaderBindingslistofSdkMaploaderRegionidReleaseFfiHandleNullable(_p1Handle);

  }

}

int _sdkMaploaderDeletedregionscallbackcallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (_obj as DeletedRegionsCallback)(sdkMaploaderMaploadererrorFromFfiNullable(p0), heresdkMaploaderBindingslistofSdkMaploaderRegionidFromFfiNullable(p1));
  } finally {
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(p0);
    heresdkMaploaderBindingslistofSdkMaploaderRegionidReleaseFfiHandleNullable(p1);
  }
  return 0;
}

Pointer<Void> sdkMaploaderDeletedregionscallbackToFfi(DeletedRegionsCallback value) =>
  _sdkMaploaderDeletedregionscallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkMaploaderDeletedregionscallbackcallStatic, __lib.unknownError)
  );

DeletedRegionsCallback sdkMaploaderDeletedregionscallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkMaploaderDeletedregionscallbackCopyHandle(handle);
  final _impl = DeletedRegionsCallback$Impl(_copiedHandle);
  final result = (MapLoaderError? p0, List<RegionId>? p1) => _impl.call(p0, p1);
  _sdkMaploaderDeletedregionscallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderDeletedregionscallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderDeletedregionscallbackReleaseHandle(handle);

// Nullable DeletedRegionsCallback

final _sdkMaploaderDeletedregionscallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_DeletedRegionsCallback_create_handle_nullable'));
final _sdkMaploaderDeletedregionscallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_DeletedRegionsCallback_release_handle_nullable'));
final _sdkMaploaderDeletedregionscallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_DeletedRegionsCallback_get_value_nullable'));

Pointer<Void> sdkMaploaderDeletedregionscallbackToFfiNullable(DeletedRegionsCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderDeletedregionscallbackToFfi(value);
  final result = _sdkMaploaderDeletedregionscallbackCreateHandleNullable(_handle);
  sdkMaploaderDeletedregionscallbackReleaseFfiHandle(_handle);
  return result;
}

DeletedRegionsCallback? sdkMaploaderDeletedregionscallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderDeletedregionscallbackGetValueNullable(handle);
  final result = sdkMaploaderDeletedregionscallbackFromFfi(_handle);
  sdkMaploaderDeletedregionscallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderDeletedregionscallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderDeletedregionscallbackReleaseHandleNullable(handle);

// End of DeletedRegionsCallback "private" section.


