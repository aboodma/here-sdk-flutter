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
import 'package:here_sdk/src/sdk/navigation/navigable_location.dart';

/// This abstract class should be implemented in order to receive notifications
/// about the current location from [Navigator].
abstract class NavigableLocationListener {
  /// This abstract class should be implemented in order to receive notifications
  /// about the current location from [Navigator].

  factory NavigableLocationListener(
    void Function(NavigableLocation) onNavigableLocationUpdatedLambda,

  ) => NavigableLocationListener$Lambdas(
    onNavigableLocationUpdatedLambda,

  );

  /// Called whenever the current location has been updated.
  ///
  /// [navigableLocation] The current location update.
  ///
  void onNavigableLocationUpdated(NavigableLocation navigableLocation);
}


// NavigableLocationListener "private" section, not exported.

final _sdkNavigationNavigablelocationlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_NavigableLocationListener_register_finalizer'));
final _sdkNavigationNavigablelocationlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigableLocationListener_copy_handle'));
final _sdkNavigationNavigablelocationlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigableLocationListener_release_handle'));
final _sdkNavigationNavigablelocationlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_NavigableLocationListener_create_proxy'));
final _sdkNavigationNavigablelocationlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigableLocationListener_get_type_id'));


class NavigableLocationListener$Lambdas implements NavigableLocationListener {
  void Function(NavigableLocation) onNavigableLocationUpdatedLambda;

  NavigableLocationListener$Lambdas(
    this.onNavigableLocationUpdatedLambda,

  );

  @override
  void onNavigableLocationUpdated(NavigableLocation navigableLocation) =>
    onNavigableLocationUpdatedLambda(navigableLocation);
}

class NavigableLocationListener$Impl extends __lib.NativeBase implements NavigableLocationListener {

  NavigableLocationListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onNavigableLocationUpdated(NavigableLocation navigableLocation) {
    final _onNavigableLocationUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigableLocationListener_onNavigableLocationUpdated__NavigableLocation'));
    final _navigableLocationHandle = sdkNavigationNavigablelocationToFfi(navigableLocation);
    final _handle = this.handle;
    _onNavigableLocationUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _navigableLocationHandle);
    sdkNavigationNavigablelocationReleaseFfiHandle(_navigableLocationHandle);

  }


}

int _sdkNavigationNavigablelocationlisteneronNavigableLocationUpdatedStatic(Object _obj, Pointer<Void> navigableLocation) {

  try {
    (_obj as NavigableLocationListener).onNavigableLocationUpdated(sdkNavigationNavigablelocationFromFfi(navigableLocation));
  } finally {
    sdkNavigationNavigablelocationReleaseFfiHandle(navigableLocation);
  }
  return 0;
}


Pointer<Void> sdkNavigationNavigablelocationlistenerToFfi(NavigableLocationListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationNavigablelocationlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationNavigablelocationlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigablelocationlisteneronNavigableLocationUpdatedStatic, __lib.unknownError)
  );

  return result;
}

NavigableLocationListener sdkNavigationNavigablelocationlistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is NavigableLocationListener) return instance;

  final _typeIdHandle = _sdkNavigationNavigablelocationlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationNavigablelocationlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : NavigableLocationListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationNavigablelocationlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationNavigablelocationlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationNavigablelocationlistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationNavigablelocationlistenerToFfiNullable(NavigableLocationListener? value) =>
  value != null ? sdkNavigationNavigablelocationlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

NavigableLocationListener? sdkNavigationNavigablelocationlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationNavigablelocationlistenerFromFfi(handle) : null;

void sdkNavigationNavigablelocationlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationNavigablelocationlistenerReleaseHandle(handle);

// End of NavigableLocationListener "private" section.


