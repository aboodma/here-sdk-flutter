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

/// Specifies possible statuses of the already downloaded map regions as a whole.
///
/// Note: This can be valid only for a single region in case of a [PersistentMapStatus.corrupted] state.
enum PersistentMapStatus {
    /// All downloaded regions are in a workable state, no issues found.
    ok,
    /// One or more downloaded regions failed to open and a repair action should be performed to mitigate this
    /// issue. All map download and map update operations (except for
    /// [MapDownloader.repairPersistentMap]) will return [MapLoaderError.notReady].
    corrupted,
    /// Indicates that the downloaded regions need to be migrated to a new internal format by calling
    /// [MapDownloader.repairPersistentMap]. This error is not a result of a data loss,
    /// nor any data will be lost when performing the repair operation and the map version will stay
    /// unchanged afterwards.
    migrationNeeded,
    /// A map update operation initiated by a user has been interrupted.
    /// Calls to [MapDownloader.downloadRegions] and
    /// [MapDownloader.deleteRegions] will fail with [MapLoaderError.internalError].
    /// Map Update process can be continued with [MapUpdater.performMapUpdate].
    pendingUpdate,
    /// Unreachable [SDKOptions.cachePath] or [SDKOptions.persistentMapStoragePath].
    /// Make sure that [SDKOptions] has accessible [SDKOptions.cachePath]
    /// and [SDKOptions.persistentMapStoragePath]
    invalidPath,
    /// Unrecoverable error during construction of internal map access object.
    /// The healing procedure is to clean persistent map with [MapDownloader.clearPersistentMapStorage].
    invalidState
}

// PersistentMapStatus "private" section, not exported.

int sdkMaploaderPersistentmapstatusToFfi(PersistentMapStatus value) {
  switch (value) {
  case PersistentMapStatus.ok:
    return 0;
  case PersistentMapStatus.corrupted:
    return 1;
  case PersistentMapStatus.migrationNeeded:
    return 2;
  case PersistentMapStatus.pendingUpdate:
    return 3;
  case PersistentMapStatus.invalidPath:
    return 4;
  case PersistentMapStatus.invalidState:
    return 5;
  default:
    throw StateError("Invalid enum value $value for PersistentMapStatus enum.");
  }
}

PersistentMapStatus sdkMaploaderPersistentmapstatusFromFfi(int handle) {
  switch (handle) {
  case 0:
    return PersistentMapStatus.ok;
  case 1:
    return PersistentMapStatus.corrupted;
  case 2:
    return PersistentMapStatus.migrationNeeded;
  case 3:
    return PersistentMapStatus.pendingUpdate;
  case 4:
    return PersistentMapStatus.invalidPath;
  case 5:
    return PersistentMapStatus.invalidState;
  default:
    throw StateError("Invalid numeric value $handle for PersistentMapStatus enum.");
  }
}

void sdkMaploaderPersistentmapstatusReleaseFfiHandle(int handle) {}

final _sdkMaploaderPersistentmapstatusCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_maploader_PersistentMapStatus_create_handle_nullable'));
final _sdkMaploaderPersistentmapstatusReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_PersistentMapStatus_release_handle_nullable'));
final _sdkMaploaderPersistentmapstatusGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_PersistentMapStatus_get_value_nullable'));

Pointer<Void> sdkMaploaderPersistentmapstatusToFfiNullable(PersistentMapStatus? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderPersistentmapstatusToFfi(value);
  final result = _sdkMaploaderPersistentmapstatusCreateHandleNullable(_handle);
  sdkMaploaderPersistentmapstatusReleaseFfiHandle(_handle);
  return result;
}

PersistentMapStatus? sdkMaploaderPersistentmapstatusFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderPersistentmapstatusGetValueNullable(handle);
  final result = sdkMaploaderPersistentmapstatusFromFfi(_handle);
  sdkMaploaderPersistentmapstatusReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderPersistentmapstatusReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderPersistentmapstatusReleaseHandleNullable(handle);

// End of PersistentMapStatus "private" section.


