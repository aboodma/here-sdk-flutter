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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/venue/data/property.dart';
import 'package:meta/meta.dart';

/// Specifies the entity's information.
/// @nodoc
@internal
abstract class EntityInfo {

  /// Gets the id.
  /// @nodoc
  @internal
  int get internalid;

  /// Gets the properties.
  /// @nodoc
  @internal
  Map<String, Property> get internalproperties;

  /// Gets the linked space id.
  /// @nodoc
  @internal
  List<int> get internalspaces;

}


// EntityInfo "private" section, not exported.

final _sdkVenueDataEntityinfoRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_data_EntityInfo_register_finalizer'));
final _sdkVenueDataEntityinfoCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_EntityInfo_copy_handle'));
final _sdkVenueDataEntityinfoReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_EntityInfo_release_handle'));


class EntityInfo$Impl extends __lib.NativeBase implements EntityInfo {

  EntityInfo$Impl(Pointer<Void> handle) : super(handle);

  @internal
  @override
  int get internalid {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_EntityInfo_id_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @internal
  @override
  Map<String, Property> get internalproperties {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_EntityInfo_properties_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingsmapofStringToSdkVenueDataPropertyFromFfi(__resultHandle);
    } finally {
      venuecoreBindingsmapofStringToSdkVenueDataPropertyReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  List<int> get internalspaces {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_EntityInfo_spaces_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofIntFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofIntReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueDataEntityinfoToFfi(EntityInfo value) =>
  _sdkVenueDataEntityinfoCopyHandle((value as __lib.NativeBase).handle);

EntityInfo sdkVenueDataEntityinfoFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is EntityInfo) return instance;

  final _copiedHandle = _sdkVenueDataEntityinfoCopyHandle(handle);
  final result = EntityInfo$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueDataEntityinfoRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueDataEntityinfoReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueDataEntityinfoReleaseHandle(handle);

Pointer<Void> sdkVenueDataEntityinfoToFfiNullable(EntityInfo? value) =>
  value != null ? sdkVenueDataEntityinfoToFfi(value) : Pointer<Void>.fromAddress(0);

EntityInfo? sdkVenueDataEntityinfoFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueDataEntityinfoFromFfi(handle) : null;

void sdkVenueDataEntityinfoReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataEntityinfoReleaseHandle(handle);

// End of EntityInfo "private" section.


