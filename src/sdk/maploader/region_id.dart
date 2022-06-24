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
import 'package:meta/meta.dart';

/// Specify a unique identifier for Region.
@immutable
class RegionId {
  /// A unique region ID to identify a region.
  final int id;

  const RegionId(this.id);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RegionId) return false;
    RegionId _other = other;
    return id == _other.id;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + id.hashCode;
    return result;
  }
}


// RegionId "private" section, not exported.

final _sdkMaploaderRegionidCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int64),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_maploader_RegionId_create_handle'));
final _sdkMaploaderRegionidReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_RegionId_release_handle'));
final _sdkMaploaderRegionidGetFieldid = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_RegionId_get_field_id'));



Pointer<Void> sdkMaploaderRegionidToFfi(RegionId value) {
  final _idHandle = (value.id);
  final _result = _sdkMaploaderRegionidCreateHandle(_idHandle);
  
  return _result;
}

RegionId sdkMaploaderRegionidFromFfi(Pointer<Void> handle) {
  final _idHandle = _sdkMaploaderRegionidGetFieldid(handle);
  try {
    return RegionId(
      (_idHandle)
    );
  } finally {
    
  }
}

void sdkMaploaderRegionidReleaseFfiHandle(Pointer<Void> handle) => _sdkMaploaderRegionidReleaseHandle(handle);

// Nullable RegionId

final _sdkMaploaderRegionidCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_RegionId_create_handle_nullable'));
final _sdkMaploaderRegionidReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_RegionId_release_handle_nullable'));
final _sdkMaploaderRegionidGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_RegionId_get_value_nullable'));

Pointer<Void> sdkMaploaderRegionidToFfiNullable(RegionId? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderRegionidToFfi(value);
  final result = _sdkMaploaderRegionidCreateHandleNullable(_handle);
  sdkMaploaderRegionidReleaseFfiHandle(_handle);
  return result;
}

RegionId? sdkMaploaderRegionidFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderRegionidGetValueNullable(handle);
  final result = sdkMaploaderRegionidFromFfi(_handle);
  sdkMaploaderRegionidReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderRegionidReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderRegionidReleaseHandleNullable(handle);

// End of RegionId "private" section.


