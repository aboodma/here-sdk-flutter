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
import 'package:here_sdk/src/sdk/venue/threading/venue_threads.dart';
import 'package:meta/meta.dart';

/// Provides a thread factory for the current platform.
/// @nodoc
@internal
abstract class VenueThreading {

  /// Gets the thread factory.
  /// @nodoc
  @internal
  static VenueThreads get internalfactory => $prototype.internalfactory;
  /// Sets the thread factory.
  /// @nodoc
  @internal
  static set internalfactory(VenueThreads value) { $prototype.internalfactory = value; }


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = VenueThreading$Impl(Pointer<Void>.fromAddress(0));
}


// VenueThreading "private" section, not exported.

final _sdkVenueThreadingVenuethreadingRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_threading_VenueThreading_register_finalizer'));
final _sdkVenueThreadingVenuethreadingCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_threading_VenueThreading_copy_handle'));
final _sdkVenueThreadingVenuethreadingReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_threading_VenueThreading_release_handle'));


/// @nodoc
@visibleForTesting
class VenueThreading$Impl extends __lib.NativeBase implements VenueThreading {

  VenueThreading$Impl(Pointer<Void> handle) : super(handle);

  @internal
  VenueThreads get internalfactory {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_venue_threading_VenueThreading_factory_get'));
    final __resultHandle = _getFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkVenueThreadingVenuethreadsFromFfi(__resultHandle);
    } finally {
      sdkVenueThreadingVenuethreadsReleaseFfiHandle(__resultHandle);

    }

  }

  @internal
  set internalfactory(VenueThreads value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('here_sdk_sdk_venue_threading_VenueThreading_factory_set__VenueThreads'));
    final _valueHandle = sdkVenueThreadingVenuethreadsToFfi(value);
    _setFfi(__lib.LibraryContext.isolateId, _valueHandle);
    sdkVenueThreadingVenuethreadsReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkVenueThreadingVenuethreadingToFfi(VenueThreading value) =>
  _sdkVenueThreadingVenuethreadingCopyHandle((value as __lib.NativeBase).handle);

VenueThreading sdkVenueThreadingVenuethreadingFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueThreading) return instance;

  final _copiedHandle = _sdkVenueThreadingVenuethreadingCopyHandle(handle);
  final result = VenueThreading$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueThreadingVenuethreadingRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueThreadingVenuethreadingReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueThreadingVenuethreadingReleaseHandle(handle);

Pointer<Void> sdkVenueThreadingVenuethreadingToFfiNullable(VenueThreading? value) =>
  value != null ? sdkVenueThreadingVenuethreadingToFfi(value) : Pointer<Void>.fromAddress(0);

VenueThreading? sdkVenueThreadingVenuethreadingFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueThreadingVenuethreadingFromFfi(handle) : null;

void sdkVenueThreadingVenuethreadingReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueThreadingVenuethreadingReleaseHandle(handle);

// End of VenueThreading "private" section.


