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
import 'package:here_sdk/src/_token_cache.dart' as __lib;

/// This method will be called on the main thread when VenueEngine initialization is completed.
typedef VenueEngineInitCallback = void Function();

// VenueEngineInitCallback "private" section, not exported.

final _sdkVenueVenueengineinitcallbackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_VenueEngineInitCallback_register_finalizer'));
final _sdkVenueVenueengineinitcallbackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_VenueEngineInitCallback_copy_handle'));
final _sdkVenueVenueengineinitcallbackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_VenueEngineInitCallback_release_handle'));
final _sdkVenueVenueengineinitcallbackCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_venue_VenueEngineInitCallback_create_proxy'));

class VenueEngineInitCallback$Impl {
  final Pointer<Void> handle;
  VenueEngineInitCallback$Impl(this.handle);

  void call() {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_venue_VenueEngineInitCallback_call'));
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId);

  }

}

int _sdkVenueVenueengineinitcallbackcallStatic(Object _obj) {
  
  try {
    (_obj as VenueEngineInitCallback)();
  } finally {
  }
  return 0;
}

Pointer<Void> sdkVenueVenueengineinitcallbackToFfi(VenueEngineInitCallback value) =>
  _sdkVenueVenueengineinitcallbackCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle)>(_sdkVenueVenueengineinitcallbackcallStatic, __lib.unknownError)
  );

VenueEngineInitCallback sdkVenueVenueengineinitcallbackFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkVenueVenueengineinitcallbackCopyHandle(handle);
  final _impl = VenueEngineInitCallback$Impl(_copiedHandle);
  final result = () => _impl.call();
  _sdkVenueVenueengineinitcallbackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueVenueengineinitcallbackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueVenueengineinitcallbackReleaseHandle(handle);

// Nullable VenueEngineInitCallback

final _sdkVenueVenueengineinitcallbackCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_VenueEngineInitCallback_create_handle_nullable'));
final _sdkVenueVenueengineinitcallbackReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_VenueEngineInitCallback_release_handle_nullable'));
final _sdkVenueVenueengineinitcallbackGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_VenueEngineInitCallback_get_value_nullable'));

Pointer<Void> sdkVenueVenueengineinitcallbackToFfiNullable(VenueEngineInitCallback? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkVenueVenueengineinitcallbackToFfi(value);
  final result = _sdkVenueVenueengineinitcallbackCreateHandleNullable(_handle);
  sdkVenueVenueengineinitcallbackReleaseFfiHandle(_handle);
  return result;
}

VenueEngineInitCallback? sdkVenueVenueengineinitcallbackFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkVenueVenueengineinitcallbackGetValueNullable(handle);
  final result = sdkVenueVenueengineinitcallbackFromFfi(_handle);
  sdkVenueVenueengineinitcallbackReleaseFfiHandle(_handle);
  return result;
}

void sdkVenueVenueengineinitcallbackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueVenueengineinitcallbackReleaseHandleNullable(handle);

// End of VenueEngineInitCallback "private" section.


