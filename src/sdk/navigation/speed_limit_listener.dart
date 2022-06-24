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
import 'package:here_sdk/src/sdk/navigation/speed_limit.dart';

/// This Abstract class
/// should be implemented in order to receive the speed limit of the current road.
abstract class SpeedLimitListener {
  /// This Abstract class
  /// should be implemented in order to receive the speed limit of the current road.

  factory SpeedLimitListener(
    void Function(SpeedLimit) onSpeedLimitUpdatedLambda,

  ) => SpeedLimitListener$Lambdas(
    onSpeedLimitUpdatedLambda,

  );

  /// Called whenever the speed limit of the current road changes.
  ///
  /// [speedLimit] Speed limit of the current road.
  ///
  void onSpeedLimitUpdated(SpeedLimit speedLimit);
}


// SpeedLimitListener "private" section, not exported.

final _sdkNavigationSpeedlimitlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_SpeedLimitListener_register_finalizer'));
final _sdkNavigationSpeedlimitlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimitListener_copy_handle'));
final _sdkNavigationSpeedlimitlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimitListener_release_handle'));
final _sdkNavigationSpeedlimitlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_SpeedLimitListener_create_proxy'));
final _sdkNavigationSpeedlimitlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimitListener_get_type_id'));


class SpeedLimitListener$Lambdas implements SpeedLimitListener {
  void Function(SpeedLimit) onSpeedLimitUpdatedLambda;

  SpeedLimitListener$Lambdas(
    this.onSpeedLimitUpdatedLambda,

  );

  @override
  void onSpeedLimitUpdated(SpeedLimit speedLimit) =>
    onSpeedLimitUpdatedLambda(speedLimit);
}

class SpeedLimitListener$Impl extends __lib.NativeBase implements SpeedLimitListener {

  SpeedLimitListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onSpeedLimitUpdated(SpeedLimit speedLimit) {
    final _onSpeedLimitUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_SpeedLimitListener_onSpeedLimitUpdated__SpeedLimit'));
    final _speedLimitHandle = sdkNavigationSpeedlimitToFfi(speedLimit);
    final _handle = this.handle;
    _onSpeedLimitUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _speedLimitHandle);
    sdkNavigationSpeedlimitReleaseFfiHandle(_speedLimitHandle);

  }


}

int _sdkNavigationSpeedlimitlisteneronSpeedLimitUpdatedStatic(Object _obj, Pointer<Void> speedLimit) {

  try {
    (_obj as SpeedLimitListener).onSpeedLimitUpdated(sdkNavigationSpeedlimitFromFfi(speedLimit));
  } finally {
    sdkNavigationSpeedlimitReleaseFfiHandle(speedLimit);
  }
  return 0;
}


Pointer<Void> sdkNavigationSpeedlimitlistenerToFfi(SpeedLimitListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationSpeedlimitlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationSpeedlimitlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationSpeedlimitlisteneronSpeedLimitUpdatedStatic, __lib.unknownError)
  );

  return result;
}

SpeedLimitListener sdkNavigationSpeedlimitlistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SpeedLimitListener) return instance;

  final _typeIdHandle = _sdkNavigationSpeedlimitlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationSpeedlimitlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : SpeedLimitListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationSpeedlimitlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationSpeedlimitlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationSpeedlimitlistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationSpeedlimitlistenerToFfiNullable(SpeedLimitListener? value) =>
  value != null ? sdkNavigationSpeedlimitlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

SpeedLimitListener? sdkNavigationSpeedlimitlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationSpeedlimitlistenerFromFfi(handle) : null;

void sdkNavigationSpeedlimitlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpeedlimitlistenerReleaseHandle(handle);

// End of SpeedLimitListener "private" section.


