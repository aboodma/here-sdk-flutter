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
import 'package:meta/meta.dart';

/// The class describes the navigation cost.
///
/// The final navigation cost for the link is calculated with the next formula:
/// cost = link length (meters) x cost multiplier
/// + delta Z level x Z level cost multiplier
/// + cost offset
/// @nodoc
@internal
abstract class NavCost {

  /// Gets the cost multiplier.
  /// @nodoc
  @internal
  double get internalmultiplier;

  /// Gets the cost offset.
  /// @nodoc
  @internal
  double get internaloffset;

  /// Gets the Z level cost multiplier.
  /// @nodoc
  @internal
  double get internalzLevelMultiplier;

}


// NavCost "private" section, not exported.

final _sdkVenueStyleNavcostRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_NavCost_register_finalizer'));
final _sdkVenueStyleNavcostCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_NavCost_copy_handle'));
final _sdkVenueStyleNavcostReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_NavCost_release_handle'));


class NavCost$Impl extends __lib.NativeBase implements NavCost {

  NavCost$Impl(Pointer<Void> handle) : super(handle);

  @internal
  @override
  double get internalmultiplier {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_NavCost_multiplier_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @internal
  @override
  double get internaloffset {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_NavCost_offset_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @internal
  @override
  double get internalzLevelMultiplier {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_NavCost_zLevelMultiplier_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }



}

Pointer<Void> sdkVenueStyleNavcostToFfi(NavCost value) =>
  _sdkVenueStyleNavcostCopyHandle((value as __lib.NativeBase).handle);

NavCost sdkVenueStyleNavcostFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is NavCost) return instance;

  final _copiedHandle = _sdkVenueStyleNavcostCopyHandle(handle);
  final result = NavCost$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleNavcostRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleNavcostReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleNavcostReleaseHandle(handle);

Pointer<Void> sdkVenueStyleNavcostToFfiNullable(NavCost? value) =>
  value != null ? sdkVenueStyleNavcostToFfi(value) : Pointer<Void>.fromAddress(0);

NavCost? sdkVenueStyleNavcostFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleNavcostFromFfi(handle) : null;

void sdkVenueStyleNavcostReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleNavcostReleaseHandle(handle);

// End of NavCost "private" section.


