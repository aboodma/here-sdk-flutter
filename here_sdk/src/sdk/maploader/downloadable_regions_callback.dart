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
import 'package:here_sdk/src/sdk/maploader/region.dart';

/// A method which is called on the main thread when [MapDownloader.getDownloadableRegionsWithLanguageCode] has been completed.
///
/// The first argument indicates an error in case of a failure. The second argument contains the results.
/// Both arguments cannot be `null` at the same time - or not `null` at the same time.
typedef DownloadableRegionsCallback = void Function(MapLoaderError?, List<Region>?);

// DownloadableRegionsCallback "private" section, not exported.

final _sdkMaploaderDownloadableregionscallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_DownloadableRegionsCallback_register_finalizer'));
final _sdkMaploaderDownloadableregionscallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_DownloadableRegionsCallback_copy_handle'));
final _sdkMaploaderDownloadableregionscallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_DownloadableRegionsCallback_release_handle'));
final _sdkMaploaderDownloadableregionscallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_maploader_DownloadableRegionsCallback_create_proxy'));

class DownloadableRegionsCallback$Impl {
  final Pointer<Void> handle;
  DownloadableRegionsCallback$Impl(this.handle);

  void call(MapLoaderError? p0, List<Region>? p1) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_maploader_DownloadableRegionsCallback_call__MapLoaderError__ListOf_sdk_maploader_Region_'));
    final _p0Handle = sdkMaploaderMaploadererrorToFfiNullable(p0);
    final _p1Handle = heresdkMaploaderBindingslistofSdkMaploaderRegionToFfiNullable(p1);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle, _p1Handle);
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(_p0Handle);
    heresdkMaploaderBindingslistofSdkMaploaderRegionReleaseFfiHandleNullable(_p1Handle);

  }

}

int _sdkMaploaderDownloadableregionscallbackcallStatic(Object _obj, Pointer<Void> p0, Pointer<Void> p1) {
  
  try {
    (_obj as DownloadableRegionsCallback)(sdkMaploaderMaploadererrorFromFfiNullable(p0), heresdkMaploaderBindingslistofSdkMaploaderRegionFromFfiNullable(p1));
  } finally {
    sdkMaploaderMaploadererrorReleaseFfiHandleNullable(p0);
    heresdkMaploaderBindingslistofSdkMaploaderRegionReleaseFfiHandleNullable(p1);
  }
  return 0;
}

Pointer<Void> sdkMaploaderDownloadableregionscallbackToFfi(DownloadableRegionsCallback value) =>
  _sdkMaploaderDownloadableregionscallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkMaploaderDownloadableregionscallbackcallStatic, __lib.unknownError)
  );

DownloadableRegionsCallback sdkMaploaderDownloadableregionscallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkMaploaderDownloadableregionscallbackCopyHandle(handle);
  final _impl = DownloadableRegionsCallback$Impl(_copiedHandle);
  final result = (MapLoaderError? p0, List<Region>? p1) => _impl.call(p0, p1);
  _sdkMaploaderDownloadableregionscallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderDownloadableregionscallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderDownloadableregionscallbackReleaseHandle(handle);

// Nullable DownloadableRegionsCallback

final _sdkMaploaderDownloadableregionscallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_DownloadableRegionsCallback_create_handle_nullable'));
final _sdkMaploaderDownloadableregionscallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_DownloadableRegionsCallback_release_handle_nullable'));
final _sdkMaploaderDownloadableregionscallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_DownloadableRegionsCallback_get_value_nullable'));

Pointer<Void> sdkMaploaderDownloadableregionscallbackToFfiNullable(DownloadableRegionsCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderDownloadableregionscallbackToFfi(value);
  final result = _sdkMaploaderDownloadableregionscallbackCreateHandleNullable(_handle);
  sdkMaploaderDownloadableregionscallbackReleaseFfiHandle(_handle);
  return result;
}

DownloadableRegionsCallback? sdkMaploaderDownloadableregionscallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderDownloadableregionscallbackGetValueNullable(handle);
  final result = sdkMaploaderDownloadableregionscallbackFromFfi(_handle);
  sdkMaploaderDownloadableregionscallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderDownloadableregionscallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderDownloadableregionscallbackReleaseHandleNullable(handle);

// End of DownloadableRegionsCallback "private" section.


