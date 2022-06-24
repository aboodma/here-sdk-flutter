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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/maploader/region_id.dart';
import 'package:meta/meta.dart';

/// Defines an area, especially part of a country or the world that can be downloaded.

class Region {
  /// Unique identifier specifying a region.
  RegionId regionId;

  /// Parent region identifier, not expose to platforms.
  /// @nodoc
  @internal
  RegionId internalparentId;

  /// Name of region. Language is determined by the requested [LanguageCode]. By default,
  /// it is in [LanguageCode.enUs].
  String name;

  /// Region size on disk in bytes.
  int sizeOnDiskInBytes;

  /// Region size, for downloading/during network operations, in bytes. Regions are downloaded in
  /// compressed form and hence they have reduced size on network.
  int sizeOnNetworkInBytes;

  /// All child regions for current region.
  /// Note that each child can again contain multiple children.
  /// A downloadable region will contain the content of all children.
  List<Region>? childRegions;

  Region.withAllDefaults(this.regionId)
      : internalparentId = RegionId(0), name = "", sizeOnDiskInBytes = 0, sizeOnNetworkInBytes = 0, childRegions = null;
  @Deprecated("Will be removed in v4.13.0. Please use Region.withAllDefaults() instead.")
  Region.withDefaults(this.regionId, this.internalparentId, this.name, this.sizeOnDiskInBytes, this.sizeOnNetworkInBytes)
      : childRegions = null;
  @Deprecated("Will be removed in v4.13.0. Please use Region.withAllDefaults() instead.")
  Region(this.regionId, this.internalparentId, this.name, this.sizeOnDiskInBytes, this.sizeOnNetworkInBytes, this.childRegions);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Region) return false;
    Region _other = other;
    return regionId == _other.regionId &&
        internalparentId == _other.internalparentId &&
        name == _other.name &&
        sizeOnDiskInBytes == _other.sizeOnDiskInBytes &&
        sizeOnNetworkInBytes == _other.sizeOnNetworkInBytes &&
        DeepCollectionEquality().equals(childRegions, _other.childRegions);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + regionId.hashCode;
    result = 31 * result + internalparentId.hashCode;
    result = 31 * result + name.hashCode;
    result = 31 * result + sizeOnDiskInBytes.hashCode;
    result = 31 * result + sizeOnNetworkInBytes.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(childRegions);
    return result;
  }
}


// Region "private" section, not exported.

final _sdkMaploaderRegionCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Int64, Int64, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int, int, Pointer<Void>)
  >('here_sdk_sdk_maploader_Region_create_handle'));
final _sdkMaploaderRegionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_Region_release_handle'));
final _sdkMaploaderRegionGetFieldregionId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_Region_get_field_regionId'));
final _sdkMaploaderRegionGetFieldparentId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_Region_get_field_parentId'));
final _sdkMaploaderRegionGetFieldname = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_Region_get_field_name'));
final _sdkMaploaderRegionGetFieldsizeOnDiskInBytes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_Region_get_field_sizeOnDiskInBytes'));
final _sdkMaploaderRegionGetFieldsizeOnNetworkInBytes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_Region_get_field_sizeOnNetworkInBytes'));
final _sdkMaploaderRegionGetFieldchildRegions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_Region_get_field_childRegions'));



Pointer<Void> sdkMaploaderRegionToFfi(Region value) {
  final _regionIdHandle = sdkMaploaderRegionidToFfi(value.regionId);
  final _parentIdHandle = sdkMaploaderRegionidToFfi(value.internalparentId);
  final _nameHandle = stringToFfi(value.name);
  final _sizeOnDiskInBytesHandle = (value.sizeOnDiskInBytes);
  final _sizeOnNetworkInBytesHandle = (value.sizeOnNetworkInBytes);
  final _childRegionsHandle = heresdkMaploaderBindingslistofSdkMaploaderRegionToFfiNullable(value.childRegions);
  final _result = _sdkMaploaderRegionCreateHandle(_regionIdHandle, _parentIdHandle, _nameHandle, _sizeOnDiskInBytesHandle, _sizeOnNetworkInBytesHandle, _childRegionsHandle);
  sdkMaploaderRegionidReleaseFfiHandle(_regionIdHandle);
  sdkMaploaderRegionidReleaseFfiHandle(_parentIdHandle);
  stringReleaseFfiHandle(_nameHandle);
  
  
  heresdkMaploaderBindingslistofSdkMaploaderRegionReleaseFfiHandleNullable(_childRegionsHandle);
  return _result;
}

Region sdkMaploaderRegionFromFfi(Pointer<Void> handle) {
  final _regionIdHandle = _sdkMaploaderRegionGetFieldregionId(handle);
  final _parentIdHandle = _sdkMaploaderRegionGetFieldparentId(handle);
  final _nameHandle = _sdkMaploaderRegionGetFieldname(handle);
  final _sizeOnDiskInBytesHandle = _sdkMaploaderRegionGetFieldsizeOnDiskInBytes(handle);
  final _sizeOnNetworkInBytesHandle = _sdkMaploaderRegionGetFieldsizeOnNetworkInBytes(handle);
  final _childRegionsHandle = _sdkMaploaderRegionGetFieldchildRegions(handle);
  try {
    return Region(
      sdkMaploaderRegionidFromFfi(_regionIdHandle), 
      sdkMaploaderRegionidFromFfi(_parentIdHandle), 
      stringFromFfi(_nameHandle), 
      (_sizeOnDiskInBytesHandle), 
      (_sizeOnNetworkInBytesHandle), 
      heresdkMaploaderBindingslistofSdkMaploaderRegionFromFfiNullable(_childRegionsHandle)
    );
  } finally {
    sdkMaploaderRegionidReleaseFfiHandle(_regionIdHandle);
    sdkMaploaderRegionidReleaseFfiHandle(_parentIdHandle);
    stringReleaseFfiHandle(_nameHandle);
    
    
    heresdkMaploaderBindingslistofSdkMaploaderRegionReleaseFfiHandleNullable(_childRegionsHandle);
  }
}

void sdkMaploaderRegionReleaseFfiHandle(Pointer<Void> handle) => _sdkMaploaderRegionReleaseHandle(handle);

// Nullable Region

final _sdkMaploaderRegionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_Region_create_handle_nullable'));
final _sdkMaploaderRegionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_Region_release_handle_nullable'));
final _sdkMaploaderRegionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_Region_get_value_nullable'));

Pointer<Void> sdkMaploaderRegionToFfiNullable(Region? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderRegionToFfi(value);
  final result = _sdkMaploaderRegionCreateHandleNullable(_handle);
  sdkMaploaderRegionReleaseFfiHandle(_handle);
  return result;
}

Region? sdkMaploaderRegionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderRegionGetValueNullable(handle);
  final result = sdkMaploaderRegionFromFfi(_handle);
  sdkMaploaderRegionReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderRegionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderRegionReleaseHandleNullable(handle);

// End of Region "private" section.


