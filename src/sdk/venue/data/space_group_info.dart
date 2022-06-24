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
import 'package:meta/meta.dart';

/// Specifies the Space Groups' information.
/// @nodoc
@internal
abstract class SpaceGroupInfo {

  /// The linked space id list by main space.
  ///
  /// [geometryId] The id of the main space.
  ///
  /// Returns [Set<int>]. list of linked space id.
  ///
  /// @nodoc
  Set<int> internalgetRelatedSpaces(int geometryId);
}


// SpaceGroupInfo "private" section, not exported.

final _sdkVenueDataSpacegroupinfoRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_data_SpaceGroupInfo_register_finalizer'));
final _sdkVenueDataSpacegroupinfoCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_SpaceGroupInfo_copy_handle'));
final _sdkVenueDataSpacegroupinfoReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_SpaceGroupInfo_release_handle'));



class SpaceGroupInfo$Impl extends __lib.NativeBase implements SpaceGroupInfo {

  SpaceGroupInfo$Impl(Pointer<Void> handle) : super(handle);

  @override
  Set<int> internalgetRelatedSpaces(int geometryId) {
    final _getRelatedSpacesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Int32), Pointer<Void> Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_data_SpaceGroupInfo_getRelatedSpaces__Int'));
    final _geometryIdHandle = (geometryId);
    final _handle = this.handle;
    final __resultHandle = _getRelatedSpacesFfi(_handle, __lib.LibraryContext.isolateId, _geometryIdHandle);

    try {
      return venuecoreBindingssetofIntFromFfi(__resultHandle);
    } finally {
      venuecoreBindingssetofIntReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkVenueDataSpacegroupinfoToFfi(SpaceGroupInfo value) =>
  _sdkVenueDataSpacegroupinfoCopyHandle((value as __lib.NativeBase).handle);

SpaceGroupInfo sdkVenueDataSpacegroupinfoFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SpaceGroupInfo) return instance;

  final _copiedHandle = _sdkVenueDataSpacegroupinfoCopyHandle(handle);
  final result = SpaceGroupInfo$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueDataSpacegroupinfoRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueDataSpacegroupinfoReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueDataSpacegroupinfoReleaseHandle(handle);

Pointer<Void> sdkVenueDataSpacegroupinfoToFfiNullable(SpaceGroupInfo? value) =>
  value != null ? sdkVenueDataSpacegroupinfoToFfi(value) : Pointer<Void>.fromAddress(0);

SpaceGroupInfo? sdkVenueDataSpacegroupinfoFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueDataSpacegroupinfoFromFfi(handle) : null;

void sdkVenueDataSpacegroupinfoReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataSpacegroupinfoReleaseHandle(handle);

// End of SpaceGroupInfo "private" section.


