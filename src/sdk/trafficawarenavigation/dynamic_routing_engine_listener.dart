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

/// This abstract class should be implemented in order to
/// receive notifications about the new route route via the [DynamicRoutingEngine].
@Deprecated("Will be removed in v4.12.0. Please use [DynamicRoutingListener] instead.")
abstract class DynamicRoutingEngineListener {
  /// This abstract class should be implemented in order to
  /// receive notifications about the new route route via the [DynamicRoutingEngine].
  @Deprecated("Will be removed in v4.12.0. Please use [DynamicRoutingListener] instead.")

  factory DynamicRoutingEngineListener(
    void Function(Route, int, int) onBetterRouteFoundLambda,

  ) => DynamicRoutingEngineListener$Lambdas(
    onBetterRouteFoundLambda,

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
}


// DynamicRoutingEngineListener "private" section, not exported.

final _sdkTrafficawarenavigationDynamicroutingenginelistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineListener_register_finalizer'));
final _sdkTrafficawarenavigationDynamicroutingenginelistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineListener_copy_handle'));
final _sdkTrafficawarenavigationDynamicroutingenginelistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineListener_release_handle'));
final _sdkTrafficawarenavigationDynamicroutingenginelistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineListener_create_proxy'));
final _sdkTrafficawarenavigationDynamicroutingenginelistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineListener_get_type_id'));


class DynamicRoutingEngineListener$Lambdas implements DynamicRoutingEngineListener {
  void Function(Route, int, int) onBetterRouteFoundLambda;

  DynamicRoutingEngineListener$Lambdas(
    this.onBetterRouteFoundLambda,

  );

  @override
  void onBetterRouteFound(Route newRoute, int etaDifferenceInSeconds, int distanceDifferenceInMeters) =>
    onBetterRouteFoundLambda(newRoute, etaDifferenceInSeconds, distanceDifferenceInMeters);
}

class DynamicRoutingEngineListener$Impl extends __lib.NativeBase implements DynamicRoutingEngineListener {

  DynamicRoutingEngineListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onBetterRouteFound(Route newRoute, int etaDifferenceInSeconds, int distanceDifferenceInMeters) {
    final _onBetterRouteFoundFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, Pointer<Void>, int, int)>('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineListener_onBetterRouteFound__Route_Int_Int'));
    final _newRouteHandle = sdkRoutingRouteToFfi(newRoute);
    final _etaDifferenceInSecondsHandle = (etaDifferenceInSeconds);
    final _distanceDifferenceInMetersHandle = (distanceDifferenceInMeters);
    final _handle = this.handle;
    _onBetterRouteFoundFfi(_handle, __lib.LibraryContext.isolateId, _newRouteHandle, _etaDifferenceInSecondsHandle, _distanceDifferenceInMetersHandle);
    sdkRoutingRouteReleaseFfiHandle(_newRouteHandle);



  }


}

int _sdkTrafficawarenavigationDynamicroutingenginelisteneronBetterRouteFoundStatic(Object _obj, Pointer<Void> newRoute, int etaDifferenceInSeconds, int distanceDifferenceInMeters) {

  try {
    (_obj as DynamicRoutingEngineListener).onBetterRouteFound(sdkRoutingRouteFromFfi(newRoute), (etaDifferenceInSeconds), (distanceDifferenceInMeters));
  } finally {
    sdkRoutingRouteReleaseFfiHandle(newRoute);
    
    
  }
  return 0;
}


Pointer<Void> sdkTrafficawarenavigationDynamicroutingenginelistenerToFfi(DynamicRoutingEngineListener value) {
  if (value is __lib.NativeBase) return _sdkTrafficawarenavigationDynamicroutingenginelistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkTrafficawarenavigationDynamicroutingenginelistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Int32, Int32)>(_sdkTrafficawarenavigationDynamicroutingenginelisteneronBetterRouteFoundStatic, __lib.unknownError)
  );

  return result;
}

DynamicRoutingEngineListener sdkTrafficawarenavigationDynamicroutingenginelistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DynamicRoutingEngineListener) return instance;

  final _typeIdHandle = _sdkTrafficawarenavigationDynamicroutingenginelistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkTrafficawarenavigationDynamicroutingenginelistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : DynamicRoutingEngineListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkTrafficawarenavigationDynamicroutingenginelistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkTrafficawarenavigationDynamicroutingenginelistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkTrafficawarenavigationDynamicroutingenginelistenerReleaseHandle(handle);

Pointer<Void> sdkTrafficawarenavigationDynamicroutingenginelistenerToFfiNullable(DynamicRoutingEngineListener? value) =>
  value != null ? sdkTrafficawarenavigationDynamicroutingenginelistenerToFfi(value) : Pointer<Void>.fromAddress(0);

DynamicRoutingEngineListener? sdkTrafficawarenavigationDynamicroutingenginelistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkTrafficawarenavigationDynamicroutingenginelistenerFromFfi(handle) : null;

void sdkTrafficawarenavigationDynamicroutingenginelistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficawarenavigationDynamicroutingenginelistenerReleaseHandle(handle);

// End of DynamicRoutingEngineListener "private" section.


