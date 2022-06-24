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
import 'package:here_sdk/src/sdk/venue/service/venue_service_init_status.dart';

/// The interface for listeners for
/// lifecycle events in [VenueService].
abstract class VenueServiceListener {
  /// The interface for listeners for
  /// lifecycle events in [VenueService].

  factory VenueServiceListener(
    void Function(VenueServiceInitStatus) onInitializationCompletedLambda,
    void Function() onVenueServiceStoppedLambda,

  ) => VenueServiceListener$Lambdas(
    onInitializationCompletedLambda,
    onVenueServiceStoppedLambda,

  );

  /// Called when a service initialization has been completed.
  ///
  /// [result] The initialization status.
  ///
  void onInitializationCompleted(VenueServiceInitStatus result);
  /// Called when the venue service stops.
  ///
  void onVenueServiceStopped();
}


// VenueServiceListener "private" section, not exported.

final _sdkVenueServiceVenueservicelistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_service_VenueServiceListener_register_finalizer'));
final _sdkVenueServiceVenueservicelistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_service_VenueServiceListener_copy_handle'));
final _sdkVenueServiceVenueservicelistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_service_VenueServiceListener_release_handle'));
final _sdkVenueServiceVenueservicelistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('here_sdk_sdk_venue_service_VenueServiceListener_create_proxy'));
final _sdkVenueServiceVenueservicelistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_service_VenueServiceListener_get_type_id'));



class VenueServiceListener$Lambdas implements VenueServiceListener {
  void Function(VenueServiceInitStatus) onInitializationCompletedLambda;
  void Function() onVenueServiceStoppedLambda;

  VenueServiceListener$Lambdas(
    this.onInitializationCompletedLambda,
    this.onVenueServiceStoppedLambda,

  );

  @override
  void onInitializationCompleted(VenueServiceInitStatus result) =>
    onInitializationCompletedLambda(result);
  @override
  void onVenueServiceStopped() =>
    onVenueServiceStoppedLambda();
}

class VenueServiceListener$Impl extends __lib.NativeBase implements VenueServiceListener {

  VenueServiceListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onInitializationCompleted(VenueServiceInitStatus result) {
    final _onInitializationCompletedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_service_VenueServiceListener_onInitializationCompleted__VenueServiceInitStatus'));
    final _resultHandle = sdkVenueServiceVenueserviceinitstatusToFfi(result);
    final _handle = this.handle;
    _onInitializationCompletedFfi(_handle, __lib.LibraryContext.isolateId, _resultHandle);
    sdkVenueServiceVenueserviceinitstatusReleaseFfiHandle(_resultHandle);

  }

  @override
  void onVenueServiceStopped() {
    final _onVenueServiceStoppedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_VenueServiceListener_onVenueServiceStopped'));
    final _handle = this.handle;
    _onVenueServiceStoppedFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

int _sdkVenueServiceVenueservicelisteneronInitializationCompletedStatic(Object _obj, int result) {

  try {
    (_obj as VenueServiceListener).onInitializationCompleted(sdkVenueServiceVenueserviceinitstatusFromFfi(result));
  } finally {
    sdkVenueServiceVenueserviceinitstatusReleaseFfiHandle(result);
  }
  return 0;
}
int _sdkVenueServiceVenueservicelisteneronVenueServiceStoppedStatic(Object _obj) {

  try {
    (_obj as VenueServiceListener).onVenueServiceStopped();
  } finally {
  }
  return 0;
}


Pointer<Void> sdkVenueServiceVenueservicelistenerToFfi(VenueServiceListener value) {
  if (value is __lib.NativeBase) return _sdkVenueServiceVenueservicelistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkVenueServiceVenueservicelistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Uint32)>(_sdkVenueServiceVenueservicelisteneronInitializationCompletedStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkVenueServiceVenueservicelisteneronVenueServiceStoppedStatic, __lib.unknownError)
  );

  return result;
}

VenueServiceListener sdkVenueServiceVenueservicelistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueServiceListener) return instance;

  final _typeIdHandle = _sdkVenueServiceVenueservicelistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkVenueServiceVenueservicelistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : VenueServiceListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueServiceVenueservicelistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueServiceVenueservicelistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueServiceVenueservicelistenerReleaseHandle(handle);

Pointer<Void> sdkVenueServiceVenueservicelistenerToFfiNullable(VenueServiceListener? value) =>
  value != null ? sdkVenueServiceVenueservicelistenerToFfi(value) : Pointer<Void>.fromAddress(0);

VenueServiceListener? sdkVenueServiceVenueservicelistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueServiceVenueservicelistenerFromFfi(handle) : null;

void sdkVenueServiceVenueservicelistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueServiceVenueservicelistenerReleaseHandle(handle);

// End of VenueServiceListener "private" section.


