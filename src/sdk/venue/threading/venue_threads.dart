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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/venue/threading/venue_runnable.dart';
import 'package:meta/meta.dart';

/// Specifies the  of threads.
/// @nodoc
@internal
abstract class VenueThreads {
  /// Specifies the  of threads.
  /// @nodoc

  factory VenueThreads(
    void Function(String, VenueRunnable) createThreadLambda,
    void Function(VenueRunnable) postToMainThreadLambda,

  ) => VenueThreads$Lambdas(
    createThreadLambda,
    postToMainThreadLambda,

  );

  /// Creates and starts a new thread which will call the given runnable.
  ///
  /// [name] The name of the thread.
  ///
  /// [runnable] The runnable to be run by the thread.
  ///
  /// @nodoc
  void internalcreateThread(String name, VenueRunnable runnable);
  /// Posts the given runnable to the main thread.
  ///
  /// [runnable] The runnable to be run by the thread.
  ///
  /// @nodoc
  void internalpostToMainThread(VenueRunnable runnable);
}


// VenueThreads "private" section, not exported.

final _sdkVenueThreadingVenuethreadsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_threading_VenueThreads_register_finalizer'));
final _sdkVenueThreadingVenuethreadsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_threading_VenueThreads_copy_handle'));
final _sdkVenueThreadingVenuethreadsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_threading_VenueThreads_release_handle'));
final _sdkVenueThreadingVenuethreadsCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('here_sdk_sdk_venue_threading_VenueThreads_create_proxy'));
final _sdkVenueThreadingVenuethreadsGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_threading_VenueThreads_get_type_id'));



class VenueThreads$Lambdas implements VenueThreads {
  void Function(String, VenueRunnable) createThreadLambda;
  void Function(VenueRunnable) postToMainThreadLambda;

  VenueThreads$Lambdas(
    this.createThreadLambda,
    this.postToMainThreadLambda,

  );

  @override
  void internalcreateThread(String name, VenueRunnable runnable) =>
    createThreadLambda(name, runnable);
  @override
  void internalpostToMainThread(VenueRunnable runnable) =>
    postToMainThreadLambda(runnable);
}

class VenueThreads$Impl extends __lib.NativeBase implements VenueThreads {

  VenueThreads$Impl(Pointer<Void> handle) : super(handle);

  @override
  void internalcreateThread(String name, VenueRunnable runnable) {
    final _createThreadFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_venue_threading_VenueThreads_createThread__String_VenueRunnable'));
    final _nameHandle = stringToFfi(name);
    final _runnableHandle = sdkVenueThreadingVenuerunnableToFfi(runnable);
    final _handle = this.handle;
    _createThreadFfi(_handle, __lib.LibraryContext.isolateId, _nameHandle, _runnableHandle);
    stringReleaseFfiHandle(_nameHandle);
    sdkVenueThreadingVenuerunnableReleaseFfiHandle(_runnableHandle);

  }

  @override
  void internalpostToMainThread(VenueRunnable runnable) {
    final _postToMainThreadFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_threading_VenueThreads_postToMainThread__VenueRunnable'));
    final _runnableHandle = sdkVenueThreadingVenuerunnableToFfi(runnable);
    final _handle = this.handle;
    _postToMainThreadFfi(_handle, __lib.LibraryContext.isolateId, _runnableHandle);
    sdkVenueThreadingVenuerunnableReleaseFfiHandle(_runnableHandle);

  }


}

int _sdkVenueThreadingVenuethreadscreateThreadStatic(Object _obj, Pointer<Void> name, Pointer<Void> runnable) {

  try {
    (_obj as VenueThreads).internalcreateThread(stringFromFfi(name), sdkVenueThreadingVenuerunnableFromFfi(runnable));
  } finally {
    stringReleaseFfiHandle(name);
    sdkVenueThreadingVenuerunnableReleaseFfiHandle(runnable);
  }
  return 0;
}
int _sdkVenueThreadingVenuethreadspostToMainThreadStatic(Object _obj, Pointer<Void> runnable) {

  try {
    (_obj as VenueThreads).internalpostToMainThread(sdkVenueThreadingVenuerunnableFromFfi(runnable));
  } finally {
    sdkVenueThreadingVenuerunnableReleaseFfiHandle(runnable);
  }
  return 0;
}


Pointer<Void> sdkVenueThreadingVenuethreadsToFfi(VenueThreads value) {
  if (value is __lib.NativeBase) return _sdkVenueThreadingVenuethreadsCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkVenueThreadingVenuethreadsCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkVenueThreadingVenuethreadscreateThreadStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkVenueThreadingVenuethreadspostToMainThreadStatic, __lib.unknownError)
  );

  return result;
}

VenueThreads sdkVenueThreadingVenuethreadsFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueThreads) return instance;

  final _typeIdHandle = _sdkVenueThreadingVenuethreadsGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkVenueThreadingVenuethreadsCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : VenueThreads$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueThreadingVenuethreadsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueThreadingVenuethreadsReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueThreadingVenuethreadsReleaseHandle(handle);

Pointer<Void> sdkVenueThreadingVenuethreadsToFfiNullable(VenueThreads? value) =>
  value != null ? sdkVenueThreadingVenuethreadsToFfi(value) : Pointer<Void>.fromAddress(0);

VenueThreads? sdkVenueThreadingVenuethreadsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueThreadingVenuethreadsFromFfi(handle) : null;

void sdkVenueThreadingVenuethreadsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueThreadingVenuethreadsReleaseHandle(handle);

// End of VenueThreads "private" section.


