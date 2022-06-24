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
import 'package:here_sdk/src/sdk/routing/route.dart';
import 'package:here_sdk/src/sdk/routing/routing_error.dart';

/// This abstract class should be implemented in order to
/// receive notifications about the new route route via the [DynamicRoutingEngine].
abstract class DynamicRoutingListener {
  /// This abstract class should be implemented in order to
  /// receive notifications about the new route route via the [DynamicRoutingEngine].

  factory DynamicRoutingListener(
    void Function(Route, int, int) onBetterRouteFoundLambda,
    void Function(RoutingError) onRoutingErrorLambda,

  ) => DynamicRoutingListener$Lambdas(
    onBetterRouteFoundLambda,
    onRoutingErrorLambda,

  );

  /// This event is issued when a better route could be found,
  /// as defined by [DynamicRoutingEngineOptions].
  ///
  /// To find a better route, two routes are calculated.
  /// The updated current route: A route that is calculated via the route specified.
  /// The dynamic route: A route that starts at the current position on the route specified
  /// and passes through the remaining waypoints.
  ///
  /// [newRoute] The newly calculated route.
  /// Passing the initial waypoints and the updated position.
  ///
  /// [etaDifferenceInSeconds] The difference in seconds:
  /// eta of the current updated route - eta of the dynamic route.
  ///
  /// [distanceDifferenceInMeters] The difference in meters:
  /// distance of the current updated route - distance of the dynamic route.
  /// The value can be negative in case the current updated route has
  /// a shorter distance, but its now assumed to be longer than the dynamic route.
  ///
  void onBetterRouteFound(Route newRoute, int etaDifferenceInSeconds, int distanceDifferenceInMeters);
  /// This event is issued when an error occurred.
  ///
  /// [routingError] Routing error
  ///
  void onRoutingError(RoutingError routingError);
}


// DynamicRoutingListener "private" section, not exported.

final _sdkTrafficawarenavigationDynamicroutinglistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingListener_register_finalizer'));
final _sdkTrafficawarenavigationDynamicroutinglistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingListener_copy_handle'));
final _sdkTrafficawarenavigationDynamicroutinglistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingListener_release_handle'));
final _sdkTrafficawarenavigationDynamicroutinglistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingListener_create_proxy'));
final _sdkTrafficawarenavigationDynamicroutinglistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingListener_get_type_id'));



class DynamicRoutingListener$Lambdas implements DynamicRoutingListener {
  void Function(Route, int, int) onBetterRouteFoundLambda;
  void Function(RoutingError) onRoutingErrorLambda;

  DynamicRoutingListener$Lambdas(
    this.onBetterRouteFoundLambda,
    this.onRoutingErrorLambda,

  );

  @override
  void onBetterRouteFound(Route newRoute, int etaDifferenceInSeconds, int distanceDifferenceInMeters) =>
    onBetterRouteFoundLambda(newRoute, etaDifferenceInSeconds, distanceDifferenceInMeters);
  @override
  void onRoutingError(RoutingError routingError) =>
    onRoutingErrorLambda(routingError);
}

class DynamicRoutingListener$Impl extends __lib.NativeBase implements DynamicRoutingListener {

  DynamicRoutingListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onBetterRouteFound(Route newRoute, int etaDifferenceInSeconds, int distanceDifferenceInMeters) {
    final _onBetterRouteFoundFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, Pointer<Void>, int, int)>('here_sdk_sdk_trafficawarenavigation_DynamicRoutingListener_onBetterRouteFound__Route_Int_Int'));
    final _newRouteHandle = sdkRoutingRouteToFfi(newRoute);
    final _etaDifferenceInSecondsHandle = (etaDifferenceInSeconds);
    final _distanceDifferenceInMetersHandle = (distanceDifferenceInMeters);
    final _handle = this.handle;
    _onBetterRouteFoundFfi(_handle, __lib.LibraryContext.isolateId, _newRouteHandle, _etaDifferenceInSecondsHandle, _distanceDifferenceInMetersHandle);
    sdkRoutingRouteReleaseFfiHandle(_newRouteHandle);



  }

  @override
  void onRoutingError(RoutingError routingError) {
    final _onRoutingErrorFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_trafficawarenavigation_DynamicRoutingListener_onRoutingError__RoutingError'));
    final _routingErrorHandle = sdkRoutingRoutingerrorToFfi(routingError);
    final _handle = this.handle;
    _onRoutingErrorFfi(_handle, __lib.LibraryContext.isolateId, _routingErrorHandle);
    sdkRoutingRoutingerrorReleaseFfiHandle(_routingErrorHandle);

  }


}

int _sdkTrafficawarenavigationDynamicroutinglisteneronBetterRouteFoundStatic(Object _obj, Pointer<Void> newRoute, int etaDifferenceInSeconds, int distanceDifferenceInMeters) {

  try {
    (_obj as DynamicRoutingListener).onBetterRouteFound(sdkRoutingRouteFromFfi(newRoute), (etaDifferenceInSeconds), (distanceDifferenceInMeters));
  } finally {
    sdkRoutingRouteReleaseFfiHandle(newRoute);
    
    
  }
  return 0;
}
int _sdkTrafficawarenavigationDynamicroutinglisteneronRoutingErrorStatic(Object _obj, int routingError) {

  try {
    (_obj as DynamicRoutingListener).onRoutingError(sdkRoutingRoutingerrorFromFfi(routingError));
  } finally {
    sdkRoutingRoutingerrorReleaseFfiHandle(routingError);
  }
  return 0;
}


Pointer<Void> sdkTrafficawarenavigationDynamicroutinglistenerToFfi(DynamicRoutingListener value) {
  if (value is __lib.NativeBase) return _sdkTrafficawarenavigationDynamicroutinglistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkTrafficawarenavigationDynamicroutinglistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Int32, Int32)>(_sdkTrafficawarenavigationDynamicroutinglisteneronBetterRouteFoundStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint32)>(_sdkTrafficawarenavigationDynamicroutinglisteneronRoutingErrorStatic, __lib.unknownError)
  );

  return result;
}

DynamicRoutingListener sdkTrafficawarenavigationDynamicroutinglistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DynamicRoutingListener) return instance;

  final _typeIdHandle = _sdkTrafficawarenavigationDynamicroutinglistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkTrafficawarenavigationDynamicroutinglistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : DynamicRoutingListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkTrafficawarenavigationDynamicroutinglistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkTrafficawarenavigationDynamicroutinglistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkTrafficawarenavigationDynamicroutinglistenerReleaseHandle(handle);

Pointer<Void> sdkTrafficawarenavigationDynamicroutinglistenerToFfiNullable(DynamicRoutingListener? value) =>
  value != null ? sdkTrafficawarenavigationDynamicroutinglistenerToFfi(value) : Pointer<Void>.fromAddress(0);

DynamicRoutingListener? sdkTrafficawarenavigationDynamicroutinglistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkTrafficawarenavigationDynamicroutinglistenerFromFfi(handle) : null;

void sdkTrafficawarenavigationDynamicroutinglistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficawarenavigationDynamicroutinglistenerReleaseHandle(handle);

// End of DynamicRoutingListener "private" section.


