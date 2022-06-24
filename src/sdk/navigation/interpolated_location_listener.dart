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
import 'package:here_sdk/src/sdk/core/location.dart';
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;

/// This Abstract class should be implemented
/// in order to receive interpolated locations.
abstract class InterpolatedLocationListener {
  /// This Abstract class should be implemented
  /// in order to receive interpolated locations.

  factory InterpolatedLocationListener(
    void Function(location_impl.Location) onInterpolatedLocationUpdatedLambda,

  ) => InterpolatedLocationListener$Lambdas(
    onInterpolatedLocationUpdatedLambda,

  );

  /// Called whenever a new interpolated location is calculated, usually several times per second.
  ///
  /// [location] The interpolated location.
  ///
  void onInterpolatedLocationUpdated(location_impl.Location location);
}


// InterpolatedLocationListener "private" section, not exported.

final _sdkNavigationInterpolatedlocationlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_InterpolatedLocationListener_register_finalizer'));
final _sdkNavigationInterpolatedlocationlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_InterpolatedLocationListener_copy_handle'));
final _sdkNavigationInterpolatedlocationlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_InterpolatedLocationListener_release_handle'));
final _sdkNavigationInterpolatedlocationlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_InterpolatedLocationListener_create_proxy'));
final _sdkNavigationInterpolatedlocationlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_InterpolatedLocationListener_get_type_id'));


class InterpolatedLocationListener$Lambdas implements InterpolatedLocationListener {
  void Function(location_impl.Location) onInterpolatedLocationUpdatedLambda;

  InterpolatedLocationListener$Lambdas(
    this.onInterpolatedLocationUpdatedLambda,

  );

  @override
  void onInterpolatedLocationUpdated(location_impl.Location location) =>
    onInterpolatedLocationUpdatedLambda(location);
}

class InterpolatedLocationListener$Impl extends __lib.NativeBase implements InterpolatedLocationListener {

  InterpolatedLocationListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onInterpolatedLocationUpdated(location_impl.Location location) {
    final _onInterpolatedLocationUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_InterpolatedLocationListener_onInterpolatedLocationUpdated__Location'));
    final _locationHandle = sdkCoreLocationToFfi(location);
    final _handle = this.handle;
    _onInterpolatedLocationUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _locationHandle);
    sdkCoreLocationReleaseFfiHandle(_locationHandle);

  }


}

int _sdkNavigationInterpolatedlocationlisteneronInterpolatedLocationUpdatedStatic(Object _obj, Pointer<Void> location) {

  try {
    (_obj as InterpolatedLocationListener).onInterpolatedLocationUpdated(sdkCoreLocationFromFfi(location));
  } finally {
    sdkCoreLocationReleaseFfiHandle(location);
  }
  return 0;
}


Pointer<Void> sdkNavigationInterpolatedlocationlistenerToFfi(InterpolatedLocationListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationInterpolatedlocationlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationInterpolatedlocationlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationInterpolatedlocationlisteneronInterpolatedLocationUpdatedStatic, __lib.unknownError)
  );

  return result;
}

InterpolatedLocationListener sdkNavigationInterpolatedlocationlistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is InterpolatedLocationListener) return instance;

  final _typeIdHandle = _sdkNavigationInterpolatedlocationlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationInterpolatedlocationlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : InterpolatedLocationListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationInterpolatedlocationlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationInterpolatedlocationlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationInterpolatedlocationlistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationInterpolatedlocationlistenerToFfiNullable(InterpolatedLocationListener? value) =>
  value != null ? sdkNavigationInterpolatedlocationlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

InterpolatedLocationListener? sdkNavigationInterpolatedlocationlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationInterpolatedlocationlistenerFromFfi(handle) : null;

void sdkNavigationInterpolatedlocationlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationInterpolatedlocationlistenerReleaseHandle(handle);

// End of InterpolatedLocationListener "private" section.


