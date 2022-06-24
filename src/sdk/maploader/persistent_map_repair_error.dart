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

/// Specifies possible errors that may result after a map repair operation has been completed.
enum PersistentMapRepairError {
    /// Persistent map is repaired, but some map data is lost. Lost regions marked with a PENDING status.
    partiallyRestored,
    /// Invalid persistent map path. The provided path to store the persistent map data doesn't own the required Read/Write (RW) permissions.
    /// Try to choose a different path with RW permissions.
    invalidPath,
    /// The persisted map data can't be recovered and all map data was fully deleted. It is recommended, to ask
    /// the user if they want to try to download the lost regions again.
    brokenDb,
    /// The map data version was not cached. The region list data will be cleared from the persisted storage.
    /// It is recommended to download the list of downloadable regions again.
    /// After this it is recommended to try to repair the corrupted map data again.
    noOfflineVersion,
    /// It is not possible to retrieve the list of downloaded regions. The region list data will be cleared from the persisted storage.
    /// It is recommended to download the list of downloadable regions again.
    /// After this it is recommended to try to repair the corrupted map data again.
    noJournal,
    /// An unknown error occured. Try to clear the persisted storage by calling [MapDownloader.clearPersistentMapStorage].
    /// It is recommended, to ask the user if they want to try to download the lost regions again.
    unknown
}

// PersistentMapRepairError "private" section, not exported.

int sdkMaploaderPersistentmaprepairerrorToFfi(PersistentMapRepairError value) {
  switch (value) {
  case PersistentMapRepairError.partiallyRestored:
    return 0;
  case PersistentMapRepairError.invalidPath:
    return 1;
  case PersistentMapRepairError.brokenDb:
    return 2;
  case PersistentMapRepairError.noOfflineVersion:
    return 3;
  case PersistentMapRepairError.noJournal:
    return 4;
  case PersistentMapRepairError.unknown:
    return 5;
  default:
    throw StateError("Invalid enum value $value for PersistentMapRepairError enum.");
  }
}

PersistentMapRepairError sdkMaploaderPersistentmaprepairerrorFromFfi(int handle) {
  switch (handle) {
  case 0:
    return PersistentMapRepairError.partiallyRestored;
  case 1:
    return PersistentMapRepairError.invalidPath;
  case 2:
    return PersistentMapRepairError.brokenDb;
  case 3:
    return PersistentMapRepairError.noOfflineVersion;
  case 4:
    return PersistentMapRepairError.noJournal;
  case 5:
    return PersistentMapRepairError.unknown;
  default:
    throw StateError("Invalid numeric value $handle for PersistentMapRepairError enum.");
  }
}

void sdkMaploaderPersistentmaprepairerrorReleaseFfiHandle(int handle) {}

final _sdkMaploaderPersistentmaprepairerrorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_maploader_PersistentMapRepairError_create_handle_nullable'));
final _sdkMaploaderPersistentmaprepairerrorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_PersistentMapRepairError_release_handle_nullable'));
final _sdkMaploaderPersistentmaprepairerrorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_PersistentMapRepairError_get_value_nullable'));

Pointer<Void> sdkMaploaderPersistentmaprepairerrorToFfiNullable(PersistentMapRepairError? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderPersistentmaprepairerrorToFfi(value);
  final result = _sdkMaploaderPersistentmaprepairerrorCreateHandleNullable(_handle);
  sdkMaploaderPersistentmaprepairerrorReleaseFfiHandle(_handle);
  return result;
}

PersistentMapRepairError? sdkMaploaderPersistentmaprepairerrorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderPersistentmaprepairerrorGetValueNullable(handle);
  final result = sdkMaploaderPersistentmaprepairerrorFromFfi(_handle);
  sdkMaploaderPersistentmaprepairerrorReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderPersistentmaprepairerrorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderPersistentmaprepairerrorReleaseHandleNullable(handle);

// End of PersistentMapRepairError "private" section.


