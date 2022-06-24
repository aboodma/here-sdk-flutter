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

/// Represents download status of region in the persistent map storage.
enum InstalledRegionStatus {
    /// Region is ready to be used.
    installed,
    /// Download is not finished yet. Either try to download this region again and, eventually,
    /// the progress will continue where it was left off - or you can cancel this download
    /// or delete this region.
    /// The following reasons can lead to this status: An ongoing or paused download or an
    /// abrupt end, for example, when the app was closed. Ongoing or paused downloads can be
    /// resumed with the [MapDownloaderTask].
    pending
}

// InstalledRegionStatus "private" section, not exported.

int sdkMaploaderInstalledregionstatusToFfi(InstalledRegionStatus value) {
  switch (value) {
  case InstalledRegionStatus.installed:
    return 1;
  case InstalledRegionStatus.pending:
    return 2;
  default:
    throw StateError("Invalid enum value $value for InstalledRegionStatus enum.");
  }
}

InstalledRegionStatus sdkMaploaderInstalledregionstatusFromFfi(int handle) {
  switch (handle) {
  case 1:
    return InstalledRegionStatus.installed;
  case 2:
    return InstalledRegionStatus.pending;
  default:
    throw StateError("Invalid numeric value $handle for InstalledRegionStatus enum.");
  }
}

void sdkMaploaderInstalledregionstatusReleaseFfiHandle(int handle) {}

final _sdkMaploaderInstalledregionstatusCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_maploader_InstalledRegionStatus_create_handle_nullable'));
final _sdkMaploaderInstalledregionstatusReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledRegionStatus_release_handle_nullable'));
final _sdkMaploaderInstalledregionstatusGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledRegionStatus_get_value_nullable'));

Pointer<Void> sdkMaploaderInstalledregionstatusToFfiNullable(InstalledRegionStatus? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderInstalledregionstatusToFfi(value);
  final result = _sdkMaploaderInstalledregionstatusCreateHandleNullable(_handle);
  sdkMaploaderInstalledregionstatusReleaseFfiHandle(_handle);
  return result;
}

InstalledRegionStatus? sdkMaploaderInstalledregionstatusFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderInstalledregionstatusGetValueNullable(handle);
  final result = sdkMaploaderInstalledregionstatusFromFfi(_handle);
  sdkMaploaderInstalledregionstatusReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderInstalledregionstatusReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderInstalledregionstatusReleaseHandleNullable(handle);

// End of InstalledRegionStatus "private" section.


