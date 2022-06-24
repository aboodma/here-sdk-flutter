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
import 'package:here_sdk/src/sdk/maploader/persistent_map_repair_error.dart';

/// A method which is called on the main thread when [MapDownloader.repairPersistentMap] has been completed.
///
/// The first argument indicates an error in case of a failure. The second argument contains the results.
/// Both arguments cannot be `null` at the same time - or not `null` at the same time.
typedef RepairPersistentMapCallback = void Function(PersistentMapRepairError?);

// RepairPersistentMapCallback "private" section, not exported.

final _sdkMaploaderRepairpersistentmapcallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_RepairPersistentMapCallback_register_finalizer'));
final _sdkMaploaderRepairpersistentmapcallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_RepairPersistentMapCallback_copy_handle'));
final _sdkMaploaderRepairpersistentmapcallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_RepairPersistentMapCallback_release_handle'));
final _sdkMaploaderRepairpersistentmapcallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_maploader_RepairPersistentMapCallback_create_proxy'));

class RepairPersistentMapCallback$Impl {
  final Pointer<Void> handle;
  RepairPersistentMapCallback$Impl(this.handle);

  void call(PersistentMapRepairError? p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_RepairPersistentMapCallback_call__PersistentMapRepairError_'));
    final _p0Handle = sdkMaploaderPersistentmaprepairerrorToFfiNullable(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    sdkMaploaderPersistentmaprepairerrorReleaseFfiHandleNullable(_p0Handle);

  }

}

int _sdkMaploaderRepairpersistentmapcallbackcallStatic(Object _obj, Pointer<Void> p0) {
  
  try {
    (_obj as RepairPersistentMapCallback)(sdkMaploaderPersistentmaprepairerrorFromFfiNullable(p0));
  } finally {
    sdkMaploaderPersistentmaprepairerrorReleaseFfiHandleNullable(p0);
  }
  return 0;
}

Pointer<Void> sdkMaploaderRepairpersistentmapcallbackToFfi(RepairPersistentMapCallback value) =>
  _sdkMaploaderRepairpersistentmapcallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_sdkMaploaderRepairpersistentmapcallbackcallStatic, __lib.unknownError)
  );

RepairPersistentMapCallback sdkMaploaderRepairpersistentmapcallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkMaploaderRepairpersistentmapcallbackCopyHandle(handle);
  final _impl = RepairPersistentMapCallback$Impl(_copiedHandle);
  final result = (PersistentMapRepairError? p0) => _impl.call(p0);
  _sdkMaploaderRepairpersistentmapcallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderRepairpersistentmapcallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderRepairpersistentmapcallbackReleaseHandle(handle);

// Nullable RepairPersistentMapCallback

final _sdkMaploaderRepairpersistentmapcallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_RepairPersistentMapCallback_create_handle_nullable'));
final _sdkMaploaderRepairpersistentmapcallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_RepairPersistentMapCallback_release_handle_nullable'));
final _sdkMaploaderRepairpersistentmapcallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_RepairPersistentMapCallback_get_value_nullable'));

Pointer<Void> sdkMaploaderRepairpersistentmapcallbackToFfiNullable(RepairPersistentMapCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderRepairpersistentmapcallbackToFfi(value);
  final result = _sdkMaploaderRepairpersistentmapcallbackCreateHandleNullable(_handle);
  sdkMaploaderRepairpersistentmapcallbackReleaseFfiHandle(_handle);
  return result;
}

RepairPersistentMapCallback? sdkMaploaderRepairpersistentmapcallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderRepairpersistentmapcallbackGetValueNullable(handle);
  final result = sdkMaploaderRepairpersistentmapcallbackFromFfi(_handle);
  sdkMaploaderRepairpersistentmapcallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderRepairpersistentmapcallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderRepairpersistentmapcallbackReleaseHandleNullable(handle);

// End of RepairPersistentMapCallback "private" section.


