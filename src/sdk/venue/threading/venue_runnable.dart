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

/// Specifies the object runnable in a thread.
/// @nodoc
@internal
abstract class VenueRunnable {

  /// Runs the object.
  ///
  /// @nodoc
  void internalrun();
}


// VenueRunnable "private" section, not exported.

final _sdkVenueThreadingVenuerunnableRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_threading_VenueRunnable_register_finalizer'));
final _sdkVenueThreadingVenuerunnableCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_threading_VenueRunnable_copy_handle'));
final _sdkVenueThreadingVenuerunnableReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_threading_VenueRunnable_release_handle'));



class VenueRunnable$Impl extends __lib.NativeBase implements VenueRunnable {

  VenueRunnable$Impl(Pointer<Void> handle) : super(handle);

  @override
  void internalrun() {
    final _runFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_venue_threading_VenueRunnable_run'));
    final _handle = this.handle;
    _runFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

Pointer<Void> sdkVenueThreadingVenuerunnableToFfi(VenueRunnable value) =>
  _sdkVenueThreadingVenuerunnableCopyHandle((value as __lib.NativeBase).handle);

VenueRunnable sdkVenueThreadingVenuerunnableFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueRunnable) return instance;

  final _copiedHandle = _sdkVenueThreadingVenuerunnableCopyHandle(handle);
  final result = VenueRunnable$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueThreadingVenuerunnableRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueThreadingVenuerunnableReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueThreadingVenuerunnableReleaseHandle(handle);

Pointer<Void> sdkVenueThreadingVenuerunnableToFfiNullable(VenueRunnable? value) =>
  value != null ? sdkVenueThreadingVenuerunnableToFfi(value) : Pointer<Void>.fromAddress(0);

VenueRunnable? sdkVenueThreadingVenuerunnableFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueThreadingVenuerunnableFromFfi(handle) : null;

void sdkVenueThreadingVenuerunnableReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueThreadingVenuerunnableReleaseHandle(handle);

// End of VenueRunnable "private" section.


