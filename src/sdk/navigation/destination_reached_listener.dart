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

/// This abstract class should be
/// implemented in order to receive notifications from this class about the
/// arrival at the destination.
abstract class DestinationReachedListener {
  /// This abstract class should be
  /// implemented in order to receive notifications from this class about the
  /// arrival at the destination.

  factory DestinationReachedListener(
    void Function() onDestinationReachedLambda,

  ) => DestinationReachedListener$Lambdas(
    onDestinationReachedLambda,

  );

  /// Called when the destination has been reached.
  ///
  void onDestinationReached();
}


// DestinationReachedListener "private" section, not exported.

final _sdkNavigationDestinationreachedlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_DestinationReachedListener_register_finalizer'));
final _sdkNavigationDestinationreachedlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DestinationReachedListener_copy_handle'));
final _sdkNavigationDestinationreachedlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DestinationReachedListener_release_handle'));
final _sdkNavigationDestinationreachedlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_DestinationReachedListener_create_proxy'));
final _sdkNavigationDestinationreachedlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DestinationReachedListener_get_type_id'));


class DestinationReachedListener$Lambdas implements DestinationReachedListener {
  void Function() onDestinationReachedLambda;

  DestinationReachedListener$Lambdas(
    this.onDestinationReachedLambda,

  );

  @override
  void onDestinationReached() =>
    onDestinationReachedLambda();
}

class DestinationReachedListener$Impl extends __lib.NativeBase implements DestinationReachedListener {

  DestinationReachedListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onDestinationReached() {
    final _onDestinationReachedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_DestinationReachedListener_onDestinationReached'));
    final _handle = this.handle;
    _onDestinationReachedFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

int _sdkNavigationDestinationreachedlisteneronDestinationReachedStatic(Object _obj) {

  try {
    (_obj as DestinationReachedListener).onDestinationReached();
  } finally {
  }
  return 0;
}


Pointer<Void> sdkNavigationDestinationreachedlistenerToFfi(DestinationReachedListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationDestinationreachedlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationDestinationreachedlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkNavigationDestinationreachedlisteneronDestinationReachedStatic, __lib.unknownError)
  );

  return result;
}

DestinationReachedListener sdkNavigationDestinationreachedlistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DestinationReachedListener) return instance;

  final _typeIdHandle = _sdkNavigationDestinationreachedlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationDestinationreachedlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : DestinationReachedListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationDestinationreachedlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationDestinationreachedlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationDestinationreachedlistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationDestinationreachedlistenerToFfiNullable(DestinationReachedListener? value) =>
  value != null ? sdkNavigationDestinationreachedlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

DestinationReachedListener? sdkNavigationDestinationreachedlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationDestinationreachedlistenerFromFfi(handle) : null;

void sdkNavigationDestinationreachedlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationDestinationreachedlistenerReleaseHandle(handle);

// End of DestinationReachedListener "private" section.


