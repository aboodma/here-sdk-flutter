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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/navigation/map_matched_location.dart';
import 'package:here_sdk/src/sdk/routing/refresh_route_options.dart';
import 'package:here_sdk/src/sdk/routing/route.dart';
import 'package:here_sdk/src/sdk/routing/route_handle.dart';
import 'package:here_sdk/src/sdk/routing/waypoint.dart';
import 'package:here_sdk/src/sdk/trafficawarenavigation/dynamic_routing_engine_listener.dart';
import 'package:here_sdk/src/sdk/trafficawarenavigation/dynamic_routing_engine_options.dart';
import 'package:here_sdk/src/sdk/trafficawarenavigation/dynamic_routing_listener.dart';
import 'package:meta/meta.dart';

/// This class queries the HERE routing backend
/// to find routes with less traffic and therefore an earlier remaining estimated time of arrival.
///
/// [DynamicRoutingEngine] polls the HERE routing backend periodically to find the best new route out
/// of a given initial route.
/// For initial route calculation it is recommended to use the [RoutingEngine]
/// as it already requests traffic-optimized routes.
///
/// For both [DynamicRoutingEngine] and [RoutingEngine],
/// the resulting routes are optimized based on speed flow changes such as traffic jams,
/// street closures or road accidents.
/// To get the best result, it is recommended to not specify the
/// [RouteOptions.departureTime] as then the current time is used by default.
///
/// The poll interval is defined by
/// [DynamicRoutingEngineOptions.pollInterval] and
/// triggered by [DynamicRoutingEngine.updateCurrentLocation].
abstract class DynamicRoutingEngine {
  /// Creates a new instance of this class.
  ///
  /// [options] The options defining the behavior of the [DynamicRoutingEngine].
  ///
  /// Throws [InstantiationException]. when the engine was not initialized properly.
  ///
  factory DynamicRoutingEngine(DynamicRoutingEngineOptions? options) => $prototype.$init(options);
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] Instance of an existing SDKEngine.
  ///
  /// [options] The options defining the behavior of the [DynamicRoutingEngine].
  ///
  /// Throws [InstantiationException]. when the engine was not initialized properly.
  ///
  factory DynamicRoutingEngine.withSdkEngine(SDKNativeEngine sdkEngine, DynamicRoutingEngineOptions? options) => $prototype.withSdkEngine(sdkEngine, options);

  /// Starts polling the HERE backend services to find a better route,
  /// as defined by the DynamicRoutingEngineOptions.
  ///
  /// [route] The route to be refreshed. The route must contain a [RouteHandle],
  /// therefore the route must have been requested with
  /// [RouteOptions.enableRouteHandle] set to true.
  /// The information to calculate new routes will be extracted from the provided route parameter.
  /// If more information from the original waypoints is important besides their location,
  /// consider to use one of the overloaded methods instead.
  ///
  /// [listener] The listener to receive the events.
  ///
  /// Throws [DynamicRoutingEngineStartException]. when the passed parameter are invalid.
  ///
  void start(Route route, DynamicRoutingListener listener);
  /// Starts polling the HERE backend services to find a better route,
  /// as defined by the [DynamicRoutingEngineOptions].
  ///
  /// [routeHandle] The route handle from the HERE routing backend.
  ///
  /// [waypoints] Allows to specify detailed information on the waypoints of the route.
  /// This parameter can be useful, when additional information needs to be
  /// specified besides the coordinates - as the coordinates can be retrieved
  /// from the contained [RoutePlace] that are already contained in
  /// the [RouteHandle] parameter.
  ///
  /// [refreshRouteOptions] The options for the route calculation.
  ///
  /// [listener] The listener to receive the events.
  ///
  /// Throws [DynamicRoutingEngineStartException]. when the passed parameter are invalid.
  ///
  void startWithWaypoints(RouteHandle routeHandle, List<Waypoint> waypoints, RefreshRouteOptions refreshRouteOptions, DynamicRoutingListener listener);
  /// Starts polling the HERE backend services to find a better route,
  /// as defined by the DynamicRoutingEngineOptions.
  ///
  /// [route] The route to be refreshed. The route must contain a [RouteHandle],
  /// therefore the route must have been requested with
  /// [RouteOptions.enableRouteHandle] set to true.
  /// The information to calculate new routes will be extracted from the provided route parameter.
  /// If more information from the original waypoints is important besides their location,
  /// consider to use one of the overloaded methods instead.
  ///
  @Deprecated("Will be removed in v4.12.0. Please use the other `start` methods instead.")

  void startWithRoute(Route route);
  /// Starts polling the HERE backend services to find a better route,
  /// as defined by the [DynamicRoutingEngineOptions].
  ///
  /// [routeHandle] The route handle from the HERE routing backend.
  ///
  /// [waypoints] Allows to specify detailed information on the waypoints of the route.
  /// This parameter can be useful, when additional information needs to be
  /// specified besides the coordinates - as the coordinates can be retrieved
  /// from the contained [RoutePlace] that are already contained in
  /// the [RouteHandle] parameter.
  ///
  /// [refreshRouteOptions] The options for the route calculation.
  ///
  @Deprecated("Will be removed in v4.12.0. Please use the other `start` methods instead.")

  void startWithRouteAndWaypoints(RouteHandle routeHandle, List<Waypoint> waypoints, RefreshRouteOptions refreshRouteOptions);
  /// Stops polling the HERE backend services.
  ///
  void stop();
  /// Updates the current location.
  ///
  /// This location will be used as new starting point when the next
  /// [DynamicRoutingEngineOptions.pollInterval] is reached and a new route is requested.
  /// If an immediate route update is needed, consider to use the RoutingEngine instead.
  /// All subsequently calculated routes used for the ETA calculation will start from this location.
  ///
  /// [mapMatchedLocation] The last known location.
  /// It is recommended to use a [NavigableLocation.mapMatchedLocation]
  /// as the driver is expected to be on a road.
  ///
  /// [sectionIndex] The current section from [RouteProgress.sectionIndex].
  ///
  void updateCurrentLocation(MapMatchedLocation mapMatchedLocation, int sectionIndex);
  @Deprecated("Will be removed in v4.12.0. Please set the listener via the `start` method.")
  DynamicRoutingEngineListener? get listener;
  @Deprecated("Will be removed in v4.12.0. Please set the listener via the `start` method.")
  set listener(DynamicRoutingEngineListener? value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = DynamicRoutingEngine$Impl(Pointer<Void>.fromAddress(0));
}

enum DynamicRoutingEngineStartError {
    /// An internal issue occurred.
    /// Maybe the logs can provide some information.
    internalError,
    /// The passed route object is invalid/`null`.
    missingRoute,
    /// The passed route has no route handle.
    /// [RouteOptions.enableRouteHandle] needs to be set to true
    /// on the initial route calculation.
    missingRouteHandle,
    /// The listener is not valid.
    missingListener,
    /// Too few waypoints where passed.
    tooFewWaypoints,
    /// Invalid RefreshRouteOptions passed.
    invalidRefreshRouteOptions
}

// DynamicRoutingEngineStartError "private" section, not exported.

int sdkTrafficawarenavigationDynamicroutingengineStarterrorToFfi(DynamicRoutingEngineStartError value) {
  switch (value) {
  case DynamicRoutingEngineStartError.internalError:
    return 0;
  case DynamicRoutingEngineStartError.missingRoute:
    return 1;
  case DynamicRoutingEngineStartError.missingRouteHandle:
    return 2;
  case DynamicRoutingEngineStartError.missingListener:
    return 3;
  case DynamicRoutingEngineStartError.tooFewWaypoints:
    return 4;
  case DynamicRoutingEngineStartError.invalidRefreshRouteOptions:
    return 5;
  default:
    throw StateError("Invalid enum value $value for DynamicRoutingEngineStartError enum.");
  }
}

DynamicRoutingEngineStartError sdkTrafficawarenavigationDynamicroutingengineStarterrorFromFfi(int handle) {
  switch (handle) {
  case 0:
    return DynamicRoutingEngineStartError.internalError;
  case 1:
    return DynamicRoutingEngineStartError.missingRoute;
  case 2:
    return DynamicRoutingEngineStartError.missingRouteHandle;
  case 3:
    return DynamicRoutingEngineStartError.missingListener;
  case 4:
    return DynamicRoutingEngineStartError.tooFewWaypoints;
  case 5:
    return DynamicRoutingEngineStartError.invalidRefreshRouteOptions;
  default:
    throw StateError("Invalid numeric value $handle for DynamicRoutingEngineStartError enum.");
  }
}

void sdkTrafficawarenavigationDynamicroutingengineStarterrorReleaseFfiHandle(int handle) {}

final _sdkTrafficawarenavigationDynamicroutingengineStarterrorCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_StartError_create_handle_nullable'));
final _sdkTrafficawarenavigationDynamicroutingengineStarterrorReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_StartError_release_handle_nullable'));
final _sdkTrafficawarenavigationDynamicroutingengineStarterrorGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_StartError_get_value_nullable'));

Pointer<Void> sdkTrafficawarenavigationDynamicroutingengineStarterrorToFfiNullable(DynamicRoutingEngineStartError? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficawarenavigationDynamicroutingengineStarterrorToFfi(value);
  final result = _sdkTrafficawarenavigationDynamicroutingengineStarterrorCreateHandleNullable(_handle);
  sdkTrafficawarenavigationDynamicroutingengineStarterrorReleaseFfiHandle(_handle);
  return result;
}

DynamicRoutingEngineStartError? sdkTrafficawarenavigationDynamicroutingengineStarterrorFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficawarenavigationDynamicroutingengineStarterrorGetValueNullable(handle);
  final result = sdkTrafficawarenavigationDynamicroutingengineStarterrorFromFfi(_handle);
  sdkTrafficawarenavigationDynamicroutingengineStarterrorReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficawarenavigationDynamicroutingengineStarterrorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficawarenavigationDynamicroutingengineStarterrorReleaseHandleNullable(handle);

// End of DynamicRoutingEngineStartError "private" section.
class DynamicRoutingEngineStartException implements Exception {
  final DynamicRoutingEngineStartError error;
  DynamicRoutingEngineStartException(this.error);
}

// DynamicRoutingEngine "private" section, not exported.

final _sdkTrafficawarenavigationDynamicroutingengineRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_register_finalizer'));
final _sdkTrafficawarenavigationDynamicroutingengineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_copy_handle'));
final _sdkTrafficawarenavigationDynamicroutingengineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_release_handle'));


final _$initReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_make__DynamicRoutingEngineOptions__return_release_handle'));
final _$initReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_make__DynamicRoutingEngineOptions__return_get_result'));
final _$initReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_make__DynamicRoutingEngineOptions__return_get_error'));
final _$initReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_make__DynamicRoutingEngineOptions__return_has_error'));


final _withSdkEngineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_make__SDKNativeEngine_DynamicRoutingEngineOptions__return_release_handle'));
final _withSdkEngineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_make__SDKNativeEngine_DynamicRoutingEngineOptions__return_get_result'));
final _withSdkEngineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_make__SDKNativeEngine_DynamicRoutingEngineOptions__return_get_error'));
final _withSdkEngineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_make__SDKNativeEngine_DynamicRoutingEngineOptions__return_has_error'));


final _startReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_start__Route_DynamicRoutingListener_return_release_handle'));
final _startReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_start__Route_DynamicRoutingListener_return_get_error'));
final _startReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_start__Route_DynamicRoutingListener_return_has_error'));


final _startWithWaypointsReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_start__RouteHandle_ListOf_sdk_routing_Waypoint_RefreshRouteOptions_DynamicRoutingListener_return_release_handle'));
final _startWithWaypointsReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_start__RouteHandle_ListOf_sdk_routing_Waypoint_RefreshRouteOptions_DynamicRoutingListener_return_get_error'));
final _startWithWaypointsReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_start__RouteHandle_ListOf_sdk_routing_Waypoint_RefreshRouteOptions_DynamicRoutingListener_return_has_error'));






/// @nodoc
@visibleForTesting
class DynamicRoutingEngine$Impl extends __lib.NativeBase implements DynamicRoutingEngine {

  DynamicRoutingEngine$Impl(Pointer<Void> handle) : super(handle);


  DynamicRoutingEngine $init(DynamicRoutingEngineOptions? options) {
    final _result_handle = _$init(options);
    final _result = DynamicRoutingEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkTrafficawarenavigationDynamicroutingengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  DynamicRoutingEngine withSdkEngine(SDKNativeEngine sdkEngine, DynamicRoutingEngineOptions? options) {
    final _result_handle = _withSdkEngine(sdkEngine, options);
    final _result = DynamicRoutingEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkTrafficawarenavigationDynamicroutingengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(DynamicRoutingEngineOptions? options) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_make__DynamicRoutingEngineOptions_'));
    final _optionsHandle = sdkTrafficawarenavigationDynamicroutingengineoptionsToFfiNullable(options);
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId, _optionsHandle);
    sdkTrafficawarenavigationDynamicroutingengineoptionsReleaseFfiHandleNullable(_optionsHandle);
    if (_$initReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initReturnGetError(__callResultHandle);
        _$initReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initReturnGetResult(__callResultHandle);
    _$initReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine, DynamicRoutingEngineOptions? options) {
    final _withSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_make__SDKNativeEngine_DynamicRoutingEngineOptions_'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final _optionsHandle = sdkTrafficawarenavigationDynamicroutingengineoptionsToFfiNullable(options);
    final __callResultHandle = _withSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle, _optionsHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    sdkTrafficawarenavigationDynamicroutingengineoptionsReleaseFfiHandleNullable(_optionsHandle);
    if (_withSdkEngineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withSdkEngineReturnGetError(__callResultHandle);
        _withSdkEngineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withSdkEngineReturnGetResult(__callResultHandle);
    _withSdkEngineReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  void start(Route route, DynamicRoutingListener listener) {
    final _startFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_start__Route_DynamicRoutingListener'));
    final _routeHandle = sdkRoutingRouteToFfi(route);
    final _listenerHandle = sdkTrafficawarenavigationDynamicroutinglistenerToFfi(listener);
    final _handle = this.handle;
    final __callResultHandle = _startFfi(_handle, __lib.LibraryContext.isolateId, _routeHandle, _listenerHandle);
    sdkRoutingRouteReleaseFfiHandle(_routeHandle);
    sdkTrafficawarenavigationDynamicroutinglistenerReleaseFfiHandle(_listenerHandle);
    if (_startReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _startReturnGetError(__callResultHandle);
        _startReturnReleaseHandle(__callResultHandle);
        try {
          throw DynamicRoutingEngineStartException(sdkTrafficawarenavigationDynamicroutingengineStarterrorFromFfi(__errorHandle));
        } finally {
          sdkTrafficawarenavigationDynamicroutingengineStarterrorReleaseFfiHandle(__errorHandle);
        }
    }
    _startReturnReleaseHandle(__callResultHandle);

  }

  @override
  void startWithWaypoints(RouteHandle routeHandle, List<Waypoint> waypoints, RefreshRouteOptions refreshRouteOptions, DynamicRoutingListener listener) {
    final _startWithWaypointsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_start__RouteHandle_ListOf_sdk_routing_Waypoint_RefreshRouteOptions_DynamicRoutingListener'));
    final _routeHandleHandle = sdkRoutingRoutehandleToFfi(routeHandle);
    final _waypointsHandle = heresdkTrafficAwareNavigationBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _refreshRouteOptionsHandle = sdkRoutingRefreshrouteoptionsToFfi(refreshRouteOptions);
    final _listenerHandle = sdkTrafficawarenavigationDynamicroutinglistenerToFfi(listener);
    final _handle = this.handle;
    final __callResultHandle = _startWithWaypointsFfi(_handle, __lib.LibraryContext.isolateId, _routeHandleHandle, _waypointsHandle, _refreshRouteOptionsHandle, _listenerHandle);
    sdkRoutingRoutehandleReleaseFfiHandle(_routeHandleHandle);
    heresdkTrafficAwareNavigationBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingRefreshrouteoptionsReleaseFfiHandle(_refreshRouteOptionsHandle);
    sdkTrafficawarenavigationDynamicroutinglistenerReleaseFfiHandle(_listenerHandle);
    if (_startWithWaypointsReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _startWithWaypointsReturnGetError(__callResultHandle);
        _startWithWaypointsReturnReleaseHandle(__callResultHandle);
        try {
          throw DynamicRoutingEngineStartException(sdkTrafficawarenavigationDynamicroutingengineStarterrorFromFfi(__errorHandle));
        } finally {
          sdkTrafficawarenavigationDynamicroutingengineStarterrorReleaseFfiHandle(__errorHandle);
        }
    }
    _startWithWaypointsReturnReleaseHandle(__callResultHandle);

  }

  @override
  void startWithRoute(Route route) {
    final _startWithRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_start__Route'));
    final _routeHandle = sdkRoutingRouteToFfi(route);
    final _handle = this.handle;
    _startWithRouteFfi(_handle, __lib.LibraryContext.isolateId, _routeHandle);
    sdkRoutingRouteReleaseFfiHandle(_routeHandle);

  }

  @override
  void startWithRouteAndWaypoints(RouteHandle routeHandle, List<Waypoint> waypoints, RefreshRouteOptions refreshRouteOptions) {
    final _startWithRouteAndWaypointsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_start__RouteHandle_ListOf_sdk_routing_Waypoint_RefreshRouteOptions'));
    final _routeHandleHandle = sdkRoutingRoutehandleToFfi(routeHandle);
    final _waypointsHandle = heresdkTrafficAwareNavigationBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _refreshRouteOptionsHandle = sdkRoutingRefreshrouteoptionsToFfi(refreshRouteOptions);
    final _handle = this.handle;
    _startWithRouteAndWaypointsFfi(_handle, __lib.LibraryContext.isolateId, _routeHandleHandle, _waypointsHandle, _refreshRouteOptionsHandle);
    sdkRoutingRoutehandleReleaseFfiHandle(_routeHandleHandle);
    heresdkTrafficAwareNavigationBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingRefreshrouteoptionsReleaseFfiHandle(_refreshRouteOptionsHandle);

  }

  @override
  void stop() {
    final _stopFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_stop'));
    final _handle = this.handle;
    _stopFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void updateCurrentLocation(MapMatchedLocation mapMatchedLocation, int sectionIndex) {
    final _updateCurrentLocationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Int32), void Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_updateCurrentLocation__MapMatchedLocation_Int'));
    final _mapMatchedLocationHandle = sdkNavigationMapmatchedlocationToFfi(mapMatchedLocation);
    final _sectionIndexHandle = (sectionIndex);
    final _handle = this.handle;
    _updateCurrentLocationFfi(_handle, __lib.LibraryContext.isolateId, _mapMatchedLocationHandle, _sectionIndexHandle);
    sdkNavigationMapmatchedlocationReleaseFfiHandle(_mapMatchedLocationHandle);


  }

  @override
  DynamicRoutingEngineListener? get listener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_listener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficawarenavigationDynamicroutingenginelistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkTrafficawarenavigationDynamicroutingenginelistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set listener(DynamicRoutingEngineListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngine_listener_set__DynamicRoutingEngineListener_'));
    final _valueHandle = sdkTrafficawarenavigationDynamicroutingenginelistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkTrafficawarenavigationDynamicroutingenginelistenerReleaseFfiHandleNullable(_valueHandle);

  }



}

Pointer<Void> sdkTrafficawarenavigationDynamicroutingengineToFfi(DynamicRoutingEngine value) =>
  _sdkTrafficawarenavigationDynamicroutingengineCopyHandle((value as __lib.NativeBase).handle);

DynamicRoutingEngine sdkTrafficawarenavigationDynamicroutingengineFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is DynamicRoutingEngine) return instance;

  final _copiedHandle = _sdkTrafficawarenavigationDynamicroutingengineCopyHandle(handle);
  final result = DynamicRoutingEngine$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkTrafficawarenavigationDynamicroutingengineRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkTrafficawarenavigationDynamicroutingengineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkTrafficawarenavigationDynamicroutingengineReleaseHandle(handle);

Pointer<Void> sdkTrafficawarenavigationDynamicroutingengineToFfiNullable(DynamicRoutingEngine? value) =>
  value != null ? sdkTrafficawarenavigationDynamicroutingengineToFfi(value) : Pointer<Void>.fromAddress(0);

DynamicRoutingEngine? sdkTrafficawarenavigationDynamicroutingengineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkTrafficawarenavigationDynamicroutingengineFromFfi(handle) : null;

void sdkTrafficawarenavigationDynamicroutingengineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficawarenavigationDynamicroutingengineReleaseHandle(handle);

// End of DynamicRoutingEngine "private" section.


