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
import 'package:here_sdk/src/sdk/navigation/route_progress.dart';

/// This abstract class should be implemented in order to receive notifications
/// about the route progress from [Navigator].
abstract class RouteProgressListener {
  /// This abstract class should be implemented in order to receive notifications
  /// about the route progress from [Navigator].

  factory RouteProgressListener(
    void Function(RouteProgress) onRouteProgressUpdatedLambda,

  ) => RouteProgressListener$Lambdas(
    onRouteProgressUpdatedLambda,

  );

  /// Called whenever route progress has been updated.
  ///
  /// [routeProgress] The route progress update.
  ///
  void onRouteProgressUpdated(RouteProgress routeProgress);
}


// RouteProgressListener "private" section, not exported.

final _sdkNavigationRouteprogresslistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_RouteProgressListener_register_finalizer'));
final _sdkNavigationRouteprogresslistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgressListener_copy_handle'));
final _sdkNavigationRouteprogresslistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgressListener_release_handle'));
final _sdkNavigationRouteprogresslistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_RouteProgressListener_create_proxy'));
final _sdkNavigationRouteprogresslistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgressListener_get_type_id'));


class RouteProgressListener$Lambdas implements RouteProgressListener {
  void Function(RouteProgress) onRouteProgressUpdatedLambda;

  RouteProgressListener$Lambdas(
    this.onRouteProgressUpdatedLambda,

  );

  @override
  void onRouteProgressUpdated(RouteProgress routeProgress) =>
    onRouteProgressUpdatedLambda(routeProgress);
}

class RouteProgressListener$Impl extends __lib.NativeBase implements RouteProgressListener {

  RouteProgressListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onRouteProgressUpdated(RouteProgress routeProgress) {
    final _onRouteProgressUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_RouteProgressListener_onRouteProgressUpdated__RouteProgress'));
    final _routeProgressHandle = sdkNavigationRouteprogressToFfi(routeProgress);
    final _handle = this.handle;
    _onRouteProgressUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _routeProgressHandle);
    sdkNavigationRouteprogressReleaseFfiHandle(_routeProgressHandle);

  }


}

int _sdkNavigationRouteprogresslisteneronRouteProgressUpdatedStatic(Object _obj, Pointer<Void> routeProgress) {

  try {
    (_obj as RouteProgressListener).onRouteProgressUpdated(sdkNavigationRouteprogressFromFfi(routeProgress));
  } finally {
    sdkNavigationRouteprogressReleaseFfiHandle(routeProgress);
  }
  return 0;
}


Pointer<Void> sdkNavigationRouteprogresslistenerToFfi(RouteProgressListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationRouteprogresslistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationRouteprogresslistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationRouteprogresslisteneronRouteProgressUpdatedStatic, __lib.unknownError)
  );

  return result;
}

RouteProgressListener sdkNavigationRouteprogresslistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is RouteProgressListener) return instance;

  final _typeIdHandle = _sdkNavigationRouteprogresslistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationRouteprogresslistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : RouteProgressListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationRouteprogresslistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationRouteprogresslistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationRouteprogresslistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationRouteprogresslistenerToFfiNullable(RouteProgressListener? value) =>
  value != null ? sdkNavigationRouteprogresslistenerToFfi(value) : Pointer<Void>.fromAddress(0);

RouteProgressListener? sdkNavigationRouteprogresslistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationRouteprogresslistenerFromFfi(handle) : null;

void sdkNavigationRouteprogresslistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRouteprogresslistenerReleaseHandle(handle);

// End of RouteProgressListener "private" section.


