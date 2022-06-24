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
import 'package:here_sdk/src/sdk/navigation/route_deviation.dart';

/// This abstract class should be implemented in order to receive notifications
/// about route deviations from [Navigator].
abstract class RouteDeviationListener {
  /// This abstract class should be implemented in order to receive notifications
  /// about route deviations from [Navigator].

  factory RouteDeviationListener(
    void Function(RouteDeviation) onRouteDeviationLambda,

  ) => RouteDeviationListener$Lambdas(
    onRouteDeviationLambda,

  );

  /// Called whenever route deviation has been observed.
  ///
  /// It contains the information
  /// that can be used to decide whether to request a re-route calculation from the routing engine.
  ///
  /// [routeDeviation] The route deviation observed.
  ///
  void onRouteDeviation(RouteDeviation routeDeviation);
}


// RouteDeviationListener "private" section, not exported.

final _sdkNavigationRoutedeviationlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_RouteDeviationListener_register_finalizer'));
final _sdkNavigationRoutedeviationlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviationListener_copy_handle'));
final _sdkNavigationRoutedeviationlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviationListener_release_handle'));
final _sdkNavigationRoutedeviationlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_RouteDeviationListener_create_proxy'));
final _sdkNavigationRoutedeviationlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviationListener_get_type_id'));


class RouteDeviationListener$Lambdas implements RouteDeviationListener {
  void Function(RouteDeviation) onRouteDeviationLambda;

  RouteDeviationListener$Lambdas(
    this.onRouteDeviationLambda,

  );

  @override
  void onRouteDeviation(RouteDeviation routeDeviation) =>
    onRouteDeviationLambda(routeDeviation);
}

class RouteDeviationListener$Impl extends __lib.NativeBase implements RouteDeviationListener {

  RouteDeviationListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onRouteDeviation(RouteDeviation routeDeviation) {
    final _onRouteDeviationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_RouteDeviationListener_onRouteDeviation__RouteDeviation'));
    final _routeDeviationHandle = sdkNavigationRoutedeviationToFfi(routeDeviation);
    final _handle = this.handle;
    _onRouteDeviationFfi(_handle, __lib.LibraryContext.isolateId, _routeDeviationHandle);
    sdkNavigationRoutedeviationReleaseFfiHandle(_routeDeviationHandle);

  }


}

int _sdkNavigationRoutedeviationlisteneronRouteDeviationStatic(Object _obj, Pointer<Void> routeDeviation) {

  try {
    (_obj as RouteDeviationListener).onRouteDeviation(sdkNavigationRoutedeviationFromFfi(routeDeviation));
  } finally {
    sdkNavigationRoutedeviationReleaseFfiHandle(routeDeviation);
  }
  return 0;
}


Pointer<Void> sdkNavigationRoutedeviationlistenerToFfi(RouteDeviationListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationRoutedeviationlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationRoutedeviationlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationRoutedeviationlisteneronRouteDeviationStatic, __lib.unknownError)
  );

  return result;
}

RouteDeviationListener sdkNavigationRoutedeviationlistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is RouteDeviationListener) return instance;

  final _typeIdHandle = _sdkNavigationRoutedeviationlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationRoutedeviationlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : RouteDeviationListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationRoutedeviationlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationRoutedeviationlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationRoutedeviationlistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationRoutedeviationlistenerToFfiNullable(RouteDeviationListener? value) =>
  value != null ? sdkNavigationRoutedeviationlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

RouteDeviationListener? sdkNavigationRoutedeviationlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationRoutedeviationlistenerFromFfi(handle) : null;

void sdkNavigationRoutedeviationlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRoutedeviationlistenerReleaseHandle(handle);

// End of RouteDeviationListener "private" section.


