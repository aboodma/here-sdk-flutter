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
import 'package:here_sdk/src/sdk/maploader/installed_region_status.dart';
import 'package:here_sdk/src/sdk/maploader/region_id.dart';

/// Represents a region, from persistent map storage.

class InstalledRegion {
  /// Unique identifier specifying a region.
  RegionId regionId;

  /// Parent region identifier. Continents have a parent_id of 0.
  RegionId parentId;

  /// Region size on disk in bytes.
  int sizeOnDiskInBytes;

  /// Status of the region in the persistent map storage.
  InstalledRegionStatus status;

  InstalledRegion(this.regionId, this.parentId, this.sizeOnDiskInBytes, this.status);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! InstalledRegion) return false;
    InstalledRegion _other = other;
    return regionId == _other.regionId &&
        parentId == _other.parentId &&
        sizeOnDiskInBytes == _other.sizeOnDiskInBytes &&
        status == _other.status;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + regionId.hashCode;
    result = 31 * result + parentId.hashCode;
    result = 31 * result + sizeOnDiskInBytes.hashCode;
    result = 31 * result + status.hashCode;
    return result;
  }
}


// InstalledRegion "private" section, not exported.

final _sdkMaploaderInstalledregionCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Int64, Uint32),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, int, int)
  >('here_sdk_sdk_maploader_InstalledRegion_create_handle'));
final _sdkMaploaderInstalledregionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledRegion_release_handle'));
final _sdkMaploaderInstalledregionGetFieldregionId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledRegion_get_field_regionId'));
final _sdkMaploaderInstalledregionGetFieldparentId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledRegion_get_field_parentId'));
final _sdkMaploaderInstalledregionGetFieldsizeOnDiskInBytes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledRegion_get_field_sizeOnDiskInBytes'));
final _sdkMaploaderInstalledregionGetFieldstatus = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledRegion_get_field_status'));



Pointer<Void> sdkMaploaderInstalledregionToFfi(InstalledRegion value) {
  final _regionIdHandle = sdkMaploaderRegionidToFfi(value.regionId);
  final _parentIdHandle = sdkMaploaderRegionidToFfi(value.parentId);
  final _sizeOnDiskInBytesHandle = (value.sizeOnDiskInBytes);
  final _statusHandle = sdkMaploaderInstalledregionstatusToFfi(value.status);
  final _result = _sdkMaploaderInstalledregionCreateHandle(_regionIdHandle, _parentIdHandle, _sizeOnDiskInBytesHandle, _statusHandle);
  sdkMaploaderRegionidReleaseFfiHandle(_regionIdHandle);
  sdkMaploaderRegionidReleaseFfiHandle(_parentIdHandle);
  
  sdkMaploaderInstalledregionstatusReleaseFfiHandle(_statusHandle);
  return _result;
}

InstalledRegion sdkMaploaderInstalledregionFromFfi(Pointer<Void> handle) {
  final _regionIdHandle = _sdkMaploaderInstalledregionGetFieldregionId(handle);
  final _parentIdHandle = _sdkMaploaderInstalledregionGetFieldparentId(handle);
  final _sizeOnDiskInBytesHandle = _sdkMaploaderInstalledregionGetFieldsizeOnDiskInBytes(handle);
  final _statusHandle = _sdkMaploaderInstalledregionGetFieldstatus(handle);
  try {
    return InstalledRegion(
      sdkMaploaderRegionidFromFfi(_regionIdHandle), 
      sdkMaploaderRegionidFromFfi(_parentIdHandle), 
      (_sizeOnDiskInBytesHandle), 
      sdkMaploaderInstalledregionstatusFromFfi(_statusHandle)
    );
  } finally {
    sdkMaploaderRegionidReleaseFfiHandle(_regionIdHandle);
    sdkMaploaderRegionidReleaseFfiHandle(_parentIdHandle);
    
    sdkMaploaderInstalledregionstatusReleaseFfiHandle(_statusHandle);
  }
}

void sdkMaploaderInstalledregionReleaseFfiHandle(Pointer<Void> handle) => _sdkMaploaderInstalledregionReleaseHandle(handle);

// Nullable InstalledRegion

final _sdkMaploaderInstalledregionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledRegion_create_handle_nullable'));
final _sdkMaploaderInstalledregionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledRegion_release_handle_nullable'));
final _sdkMaploaderInstalledregionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_InstalledRegion_get_value_nullable'));

Pointer<Void> sdkMaploaderInstalledregionToFfiNullable(InstalledRegion? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderInstalledregionToFfi(value);
  final result = _sdkMaploaderInstalledregionCreateHandleNullable(_handle);
  sdkMaploaderInstalledregionReleaseFfiHandle(_handle);
  return result;
}

InstalledRegion? sdkMaploaderInstalledregionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderInstalledregionGetValueNullable(handle);
  final result = sdkMaploaderInstalledregionFromFfi(_handle);
  sdkMaploaderInstalledregionReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderInstalledregionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderInstalledregionReleaseHandleNullable(handle);

// End of InstalledRegion "private" section.


