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
import 'package:here_sdk/src/sdk/navigation/safety_camera_warning.dart';

/// This Abstract class
/// should be implemented in order to receive notifications on safety cameras.
abstract class SafetyCameraWarningListener {
  /// This Abstract class
  /// should be implemented in order to receive notifications on safety cameras.

  factory SafetyCameraWarningListener(
    void Function(SafetyCameraWarning) onSafetyCameraWarningUpdatedLambda,

  ) => SafetyCameraWarningListener$Lambdas(
    onSafetyCameraWarningUpdatedLambda,

  );

  /// Called whenever a new [SafetyCameraWarning] is available.
  ///
  /// [safetyCameraWarning] The object that contains details on the safety camera warning.
  ///
  void onSafetyCameraWarningUpdated(SafetyCameraWarning safetyCameraWarning);
}


// SafetyCameraWarningListener "private" section, not exported.

final _sdkNavigationSafetycamerawarninglistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_SafetyCameraWarningListener_register_finalizer'));
final _sdkNavigationSafetycamerawarninglistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SafetyCameraWarningListener_copy_handle'));
final _sdkNavigationSafetycamerawarninglistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SafetyCameraWarningListener_release_handle'));
final _sdkNavigationSafetycamerawarninglistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_SafetyCameraWarningListener_create_proxy'));
final _sdkNavigationSafetycamerawarninglistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SafetyCameraWarningListener_get_type_id'));


class SafetyCameraWarningListener$Lambdas implements SafetyCameraWarningListener {
  void Function(SafetyCameraWarning) onSafetyCameraWarningUpdatedLambda;

  SafetyCameraWarningListener$Lambdas(
    this.onSafetyCameraWarningUpdatedLambda,

  );

  @override
  void onSafetyCameraWarningUpdated(SafetyCameraWarning safetyCameraWarning) =>
    onSafetyCameraWarningUpdatedLambda(safetyCameraWarning);
}

class SafetyCameraWarningListener$Impl extends __lib.NativeBase implements SafetyCameraWarningListener {

  SafetyCameraWarningListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onSafetyCameraWarningUpdated(SafetyCameraWarning safetyCameraWarning) {
    final _onSafetyCameraWarningUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_SafetyCameraWarningListener_onSafetyCameraWarningUpdated__SafetyCameraWarning'));
    final _safetyCameraWarningHandle = sdkNavigationSafetycamerawarningToFfi(safetyCameraWarning);
    final _handle = this.handle;
    _onSafetyCameraWarningUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _safetyCameraWarningHandle);
    sdkNavigationSafetycamerawarningReleaseFfiHandle(_safetyCameraWarningHandle);

  }


}

int _sdkNavigationSafetycamerawarninglisteneronSafetyCameraWarningUpdatedStatic(Object _obj, Pointer<Void> safetyCameraWarning) {

  try {
    (_obj as SafetyCameraWarningListener).onSafetyCameraWarningUpdated(sdkNavigationSafetycamerawarningFromFfi(safetyCameraWarning));
  } finally {
    sdkNavigationSafetycamerawarningReleaseFfiHandle(safetyCameraWarning);
  }
  return 0;
}


Pointer<Void> sdkNavigationSafetycamerawarninglistenerToFfi(SafetyCameraWarningListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationSafetycamerawarninglistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationSafetycamerawarninglistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationSafetycamerawarninglisteneronSafetyCameraWarningUpdatedStatic, __lib.unknownError)
  );

  return result;
}

SafetyCameraWarningListener sdkNavigationSafetycamerawarninglistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SafetyCameraWarningListener) return instance;

  final _typeIdHandle = _sdkNavigationSafetycamerawarninglistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationSafetycamerawarninglistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : SafetyCameraWarningListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationSafetycamerawarninglistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationSafetycamerawarninglistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationSafetycamerawarninglistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationSafetycamerawarninglistenerToFfiNullable(SafetyCameraWarningListener? value) =>
  value != null ? sdkNavigationSafetycamerawarninglistenerToFfi(value) : Pointer<Void>.fromAddress(0);

SafetyCameraWarningListener? sdkNavigationSafetycamerawarninglistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationSafetycamerawarninglistenerFromFfi(handle) : null;

void sdkNavigationSafetycamerawarninglistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSafetycamerawarninglistenerReleaseHandle(handle);

// End of SafetyCameraWarningListener "private" section.


