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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/routing/bicycle_options.dart';
import 'package:here_sdk/src/sdk/routing/bus_options.dart';
import 'package:here_sdk/src/sdk/routing/calculate_route_callback.dart';
import 'package:here_sdk/src/sdk/routing/car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_car_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_truck_options.dart';
import 'package:here_sdk/src/sdk/routing/pedestrian_options.dart';
import 'package:here_sdk/src/sdk/routing/route.dart';
import 'package:here_sdk/src/sdk/routing/routing_interface.dart';
import 'package:here_sdk/src/sdk/routing/scooter_options.dart';
import 'package:here_sdk/src/sdk/routing/taxi_options.dart';
import 'package:here_sdk/src/sdk/routing/truck_options.dart';
import 'package:here_sdk/src/sdk/routing/waypoint.dart';
import 'package:meta/meta.dart';

/// Use this class to calculate a route offline from A to B with
/// a number of waypoints in between.
///
/// Route calculation is done asynchronously, and requires map data that is
/// available offline. This can be temporarily cached map data or downloaded
/// offline map data stored in the persisted storage via `MapDownloader`.
/// Note that when using the cache there is a risk of missing data and this may
/// reduce the overall quality of the route or can result in a
/// [RoutingError.noRouteFound] error.
///
/// The resulting route contains various information such as the polyline,
/// route length in meters, estimated time to traverse along the route
/// and maneuver data, but it does not contain traffic information and
/// maneuver text instructions. Moreover, the [RouteHandle]
/// is not provided even if it was requested.
///
/// Unlike the `RoutingEngine` (which requires an online connection), this engine
/// allows to use an unlimited number of waypoints.
///
/// As an alternative to this engine, consider to use the `RoutingEngine` for online
/// route calculations to get fresher traffic, maneuver, route handles and street
/// information, and to use a more elaborate algorithms to calculate the fastest route.
///
/// **Note:** As of now, only car, truck and pedestrian routes are supported.
/// Other transport modes are not officially supported yet and will fail with
/// [RoutingError.invalidParameter].
abstract class OfflineRoutingEngine implements RoutingInterface {
  /// Creates a new instance of this class.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory OfflineRoutingEngine() => $prototype.$init();
  /// Creates a new instance of OfflineRoutingEngine.
  ///
  /// [sdkEngine] An SDKEngine instance.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory OfflineRoutingEngine.withSdkEngine(SDKNativeEngine sdkEngine) => $prototype.withSdkEngine(sdkEngine);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = OfflineRoutingEngine$Impl(Pointer<Void>.fromAddress(0));
}


// OfflineRoutingEngine "private" section, not exported.

final _sdkRoutingOfflineroutingengineRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_routing_OfflineRoutingEngine_register_finalizer'));
final _sdkRoutingOfflineroutingengineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngine_copy_handle'));
final _sdkRoutingOfflineroutingengineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngine_release_handle'));
final _sdkRoutingOfflineroutingengineGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngine_get_type_id'));


final _$initReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngine_make_return_release_handle'));
final _$initReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngine_make_return_get_result'));
final _$initReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngine_make_return_get_error'));
final _$initReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngine_make_return_has_error'));


final _withSdkEngineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngine_make__SDKNativeEngine_return_release_handle'));
final _withSdkEngineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngine_make__SDKNativeEngine_return_get_result'));
final _withSdkEngineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngine_make__SDKNativeEngine_return_get_error'));
final _withSdkEngineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_OfflineRoutingEngine_make__SDKNativeEngine_return_has_error'));


/// @nodoc
@visibleForTesting
class OfflineRoutingEngine$Impl extends __lib.NativeBase implements OfflineRoutingEngine {

  OfflineRoutingEngine$Impl(Pointer<Void> handle) : super(handle);


  OfflineRoutingEngine $init() {
    final _result_handle = _$init();
    final _result = OfflineRoutingEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingOfflineroutingengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  OfflineRoutingEngine withSdkEngine(SDKNativeEngine sdkEngine) {
    final _result_handle = _withSdkEngine(sdkEngine);
    final _result = OfflineRoutingEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkRoutingOfflineroutingengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_routing_OfflineRoutingEngine_make'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
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

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine) {
    final _withSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_routing_OfflineRoutingEngine_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _withSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
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
  TaskHandle calculateCarRoute(List<Waypoint> waypoints, CarOptions carOptions, CalculateRouteCallback callback) {
    final _calculateCarRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_OfflineRoutingEngine_calculateRoute__ListOf_sdk_routing_Waypoint_CarOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingOfflineBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _carOptionsHandle = sdkRoutingCaroptionsToFfi(carOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateCarRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _carOptionsHandle, _callbackHandle);
    heresdkRoutingOfflineBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingCaroptionsReleaseFfiHandle(_carOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculatePedestrianRoute(List<Waypoint> waypoints, PedestrianOptions pedestrianOptions, CalculateRouteCallback callback) {
    final _calculatePedestrianRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_OfflineRoutingEngine_calculateRoute__ListOf_sdk_routing_Waypoint_PedestrianOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingOfflineBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _pedestrianOptionsHandle = sdkRoutingPedestrianoptionsToFfi(pedestrianOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculatePedestrianRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _pedestrianOptionsHandle, _callbackHandle);
    heresdkRoutingOfflineBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingPedestrianoptionsReleaseFfiHandle(_pedestrianOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateTruckRoute(List<Waypoint> waypoints, TruckOptions truckOptions, CalculateRouteCallback callback) {
    final _calculateTruckRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_OfflineRoutingEngine_calculateRoute__ListOf_sdk_routing_Waypoint_TruckOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingOfflineBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _truckOptionsHandle = sdkRoutingTruckoptionsToFfi(truckOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateTruckRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _truckOptionsHandle, _callbackHandle);
    heresdkRoutingOfflineBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingTruckoptionsReleaseFfiHandle(_truckOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateScooterRoute(List<Waypoint> waypoints, ScooterOptions scooterOptions, CalculateRouteCallback callback) {
    final _calculateScooterRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_OfflineRoutingEngine_calculateRoute__ListOf_sdk_routing_Waypoint_ScooterOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingOfflineBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _scooterOptionsHandle = sdkRoutingScooteroptionsToFfi(scooterOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateScooterRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _scooterOptionsHandle, _callbackHandle);
    heresdkRoutingOfflineBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingScooteroptionsReleaseFfiHandle(_scooterOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateBicycleRoute(List<Waypoint> waypoints, BicycleOptions bicycleOptions, CalculateRouteCallback callback) {
    final _calculateBicycleRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_OfflineRoutingEngine_calculateRoute__ListOf_sdk_routing_Waypoint_BicycleOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingOfflineBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _bicycleOptionsHandle = sdkRoutingBicycleoptionsToFfi(bicycleOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateBicycleRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _bicycleOptionsHandle, _callbackHandle);
    heresdkRoutingOfflineBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingBicycleoptionsReleaseFfiHandle(_bicycleOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateTaxiRoute(List<Waypoint> waypoints, TaxiOptions taxiOptions, CalculateRouteCallback callback) {
    final _calculateTaxiRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_OfflineRoutingEngine_calculateRoute__ListOf_sdk_routing_Waypoint_TaxiOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingOfflineBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _taxiOptionsHandle = sdkRoutingTaxioptionsToFfi(taxiOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateTaxiRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _taxiOptionsHandle, _callbackHandle);
    heresdkRoutingOfflineBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingTaxioptionsReleaseFfiHandle(_taxiOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateEVCarRoute(List<Waypoint> waypoints, EVCarOptions evCarOptions, CalculateRouteCallback callback) {
    final _calculateEVCarRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_OfflineRoutingEngine_calculateRoute__ListOf_sdk_routing_Waypoint_EVCarOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingOfflineBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _evCarOptionsHandle = sdkRoutingEvcaroptionsToFfi(evCarOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateEVCarRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _evCarOptionsHandle, _callbackHandle);
    heresdkRoutingOfflineBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingEvcaroptionsReleaseFfiHandle(_evCarOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateEVTruckRoute(List<Waypoint> waypoints, EVTruckOptions evTruckOptions, CalculateRouteCallback callback) {
    final _calculateEVTruckRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_OfflineRoutingEngine_calculateRoute__ListOf_sdk_routing_Waypoint_EVTruckOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingOfflineBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _evTruckOptionsHandle = sdkRoutingEvtruckoptionsToFfi(evTruckOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateEVTruckRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _evTruckOptionsHandle, _callbackHandle);
    heresdkRoutingOfflineBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingEvtruckoptionsReleaseFfiHandle(_evTruckOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle calculateBusRoute(List<Waypoint> waypoints, BusOptions busOptions, CalculateRouteCallback callback) {
    final _calculateBusRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_routing_OfflineRoutingEngine_calculateRoute__ListOf_sdk_routing_Waypoint_BusOptions_CalculateRouteCallback'));
    final _waypointsHandle = heresdkRoutingOfflineBindingslistofSdkRoutingWaypointToFfi(waypoints);
    final _busOptionsHandle = sdkRoutingBusoptionsToFfi(busOptions);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _calculateBusRouteFfi(_handle, __lib.LibraryContext.isolateId, _waypointsHandle, _busOptionsHandle, _callbackHandle);
    heresdkRoutingOfflineBindingslistofSdkRoutingWaypointReleaseFfiHandle(_waypointsHandle);
    sdkRoutingBusoptionsReleaseFfiHandle(_busOptionsHandle);
    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle returnToRoute(Route route, Waypoint startingPoint, double routeFractionTraveled, CalculateRouteCallback callback) {
    final _returnToRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Double, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, double, Pointer<Void>)>('here_sdk_sdk_routing_OfflineRoutingEngine_returnToRoute__Route_Waypoint_Double_CalculateRouteCallback'));
    final _routeHandle = sdkRoutingRouteToFfi(route);
    final _startingPointHandle = sdkRoutingWaypointToFfi(startingPoint);
    final _routeFractionTraveledHandle = (routeFractionTraveled);
    final _callbackHandle = sdkRoutingCalculateroutecallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _returnToRouteFfi(_handle, __lib.LibraryContext.isolateId, _routeHandle, _startingPointHandle, _routeFractionTraveledHandle, _callbackHandle);
    sdkRoutingRouteReleaseFfiHandle(_routeHandle);
    sdkRoutingWaypointReleaseFfiHandle(_startingPointHandle);

    sdkRoutingCalculateroutecallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkRoutingOfflineroutingengineToFfi(OfflineRoutingEngine value) =>
  _sdkRoutingOfflineroutingengineCopyHandle((value as __lib.NativeBase).handle);

OfflineRoutingEngine sdkRoutingOfflineroutingengineFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OfflineRoutingEngine) return instance;

  final _typeIdHandle = _sdkRoutingOfflineroutingengineGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkRoutingOfflineroutingengineCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : OfflineRoutingEngine$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkRoutingOfflineroutingengineRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkRoutingOfflineroutingengineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkRoutingOfflineroutingengineReleaseHandle(handle);

Pointer<Void> sdkRoutingOfflineroutingengineToFfiNullable(OfflineRoutingEngine? value) =>
  value != null ? sdkRoutingOfflineroutingengineToFfi(value) : Pointer<Void>.fromAddress(0);

OfflineRoutingEngine? sdkRoutingOfflineroutingengineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkRoutingOfflineroutingengineFromFfi(handle) : null;

void sdkRoutingOfflineroutingengineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingOfflineroutingengineReleaseHandle(handle);

// End of OfflineRoutingEngine "private" section.


