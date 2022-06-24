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
import 'package:here_sdk/src/sdk/navigation/speed_warning_status.dart';

/// This Abstract class should be implemented in order to receive notifications
/// when a speed limit on a road is exceeded or driving speed is restored back to normal.
///
/// **Note:**
/// The warnings issued by this Abstract class
/// don't take into account any temporary special speed limits. See [SpeedLimitListener].
abstract class SpeedWarningListener {
  /// This Abstract class should be implemented in order to receive notifications
  /// when a speed limit on a road is exceeded or driving speed is restored back to normal.
  ///
  /// **Note:**
  /// The warnings issued by this Abstract class
  /// don't take into account any temporary special speed limits. See [SpeedLimitListener].

  factory SpeedWarningListener(
    void Function(SpeedWarningStatus) onSpeedWarningStatusChangedLambda,

  ) => SpeedWarningListener$Lambdas(
    onSpeedWarningStatusChangedLambda,

  );

  /// Called whenever a new [SpeedWarningStatus] is available.
  ///
  /// [status] The new status of the speed warning.
  ///
  void onSpeedWarningStatusChanged(SpeedWarningStatus status);
}


// SpeedWarningListener "private" section, not exported.

final _sdkNavigationSpeedwarninglistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_SpeedWarningListener_register_finalizer'));
final _sdkNavigationSpeedwarninglistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedWarningListener_copy_handle'));
final _sdkNavigationSpeedwarninglistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedWarningListener_release_handle'));
final _sdkNavigationSpeedwarninglistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_SpeedWarningListener_create_proxy'));
final _sdkNavigationSpeedwarninglistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedWarningListener_get_type_id'));


class SpeedWarningListener$Lambdas implements SpeedWarningListener {
  void Function(SpeedWarningStatus) onSpeedWarningStatusChangedLambda;

  SpeedWarningListener$Lambdas(
    this.onSpeedWarningStatusChangedLambda,

  );

  @override
  void onSpeedWarningStatusChanged(SpeedWarningStatus status) =>
    onSpeedWarningStatusChangedLambda(status);
}

class SpeedWarningListener$Impl extends __lib.NativeBase implements SpeedWarningListener {

  SpeedWarningListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onSpeedWarningStatusChanged(SpeedWarningStatus status) {
    final _onSpeedWarningStatusChangedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_SpeedWarningListener_onSpeedWarningStatusChanged__SpeedWarningStatus'));
    final _statusHandle = sdkNavigationSpeedwarningstatusToFfi(status);
    final _handle = this.handle;
    _onSpeedWarningStatusChangedFfi(_handle, __lib.LibraryContext.isolateId, _statusHandle);
    sdkNavigationSpeedwarningstatusReleaseFfiHandle(_statusHandle);

  }


}

int _sdkNavigationSpeedwarninglisteneronSpeedWarningStatusChangedStatic(Object _obj, int status) {

  try {
    (_obj as SpeedWarningListener).onSpeedWarningStatusChanged(sdkNavigationSpeedwarningstatusFromFfi(status));
  } finally {
    sdkNavigationSpeedwarningstatusReleaseFfiHandle(status);
  }
  return 0;
}


Pointer<Void> sdkNavigationSpeedwarninglistenerToFfi(SpeedWarningListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationSpeedwarninglistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationSpeedwarninglistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Uint32)>(_sdkNavigationSpeedwarninglisteneronSpeedWarningStatusChangedStatic, __lib.unknownError)
  );

  return result;
}

SpeedWarningListener sdkNavigationSpeedwarninglistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SpeedWarningListener) return instance;

  final _typeIdHandle = _sdkNavigationSpeedwarninglistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationSpeedwarninglistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : SpeedWarningListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationSpeedwarninglistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationSpeedwarninglistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationSpeedwarninglistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationSpeedwarninglistenerToFfiNullable(SpeedWarningListener? value) =>
  value != null ? sdkNavigationSpeedwarninglistenerToFfi(value) : Pointer<Void>.fromAddress(0);

SpeedWarningListener? sdkNavigationSpeedwarninglistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationSpeedwarninglistenerFromFfi(handle) : null;

void sdkNavigationSpeedwarninglistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpeedwarninglistenerReleaseHandle(handle);

// End of SpeedWarningListener "private" section.


