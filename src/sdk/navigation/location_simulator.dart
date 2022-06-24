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
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/location_listener.dart';
import 'package:here_sdk/src/sdk/navigation/g_p_x_track.dart';
import 'package:here_sdk/src/sdk/navigation/location_simulator_options.dart';
import 'package:here_sdk/src/sdk/routing/route.dart';
import 'package:meta/meta.dart';

/// Use the LocationSimulator to generate locations along a route or a GPX document.
///
/// It notifies
/// the registered object about the current location at a fixed interval. In order to customize
/// the interval, see [LocationSimulatorOptions].
/// The locations are closely matched to the shape and proceeded from the start to the destination.
/// For the route, the LocationSimulator uses a base speed provided by the router (estimated speed without
/// considering any traffic-related constraints).
/// For the GPX document a speed is ether based on timestamps in the original file or provided by the user.
/// In case of multiple tracks in a single GPX document, they will be simulated sequentially.
///
/// Notifications will stop after the entire route has been traveled.
///
/// **Note:**
/// Map-matched locations are only accessible from [RouteProgress].
abstract class LocationSimulator {
  /// Creates a new instance of this class.
  ///
  /// [route] The route to travel.
  ///
  /// [options] The options to specify how the location simulator will behave.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory LocationSimulator.withRoute(Route route, LocationSimulatorOptions options) => $prototype.withRoute(route, options);
  /// Create a location simulator
  ///
  /// [gpxTrack] The GPX track to travel.
  ///
  /// [options] The options to specify how the location simulator will behave.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory LocationSimulator.withTrack(GPXTrack gpxTrack, LocationSimulatorOptions options) => $prototype.withTrack(gpxTrack, options);

  /// Starts the location provider to send notifications to the subscribers.
  ///
  /// Calling this method will always start the location simulator from the route's first
  /// [Waypoint], even if a simulation has already been started or stopped.
  ///
  void start();
  /// Stops the location provider from sending notifications to the subscribers.
  ///
  void stop();
  /// Gets a LocationListener that notifies on location updates.
  LocationListener? get listener;
  /// Sets a LocationListener that notifies on location updates.
  set listener(LocationListener? value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = LocationSimulator$Impl(Pointer<Void>.fromAddress(0));
}


// LocationSimulator "private" section, not exported.

final _sdkNavigationLocationsimulatorRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_LocationSimulator_register_finalizer'));
final _sdkNavigationLocationsimulatorCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulator_copy_handle'));
final _sdkNavigationLocationsimulatorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulator_release_handle'));


final _withRouteReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulator_make__Route_LocationSimulatorOptions_return_release_handle'));
final _withRouteReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulator_make__Route_LocationSimulatorOptions_return_get_result'));
final _withRouteReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulator_make__Route_LocationSimulatorOptions_return_get_error'));
final _withRouteReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulator_make__Route_LocationSimulatorOptions_return_has_error'));


final _withTrackReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulator_make__GPXTrack_LocationSimulatorOptions_return_release_handle'));
final _withTrackReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulator_make__GPXTrack_LocationSimulatorOptions_return_get_result'));
final _withTrackReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulator_make__GPXTrack_LocationSimulatorOptions_return_get_error'));
final _withTrackReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulator_make__GPXTrack_LocationSimulatorOptions_return_has_error'));




/// @nodoc
@visibleForTesting
class LocationSimulator$Impl extends __lib.NativeBase implements LocationSimulator {

  LocationSimulator$Impl(Pointer<Void> handle) : super(handle);


  LocationSimulator withRoute(Route route, LocationSimulatorOptions options) {
    final _result_handle = _withRoute(route, options);
    final _result = LocationSimulator$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkNavigationLocationsimulatorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  LocationSimulator withTrack(GPXTrack gpxTrack, LocationSimulatorOptions options) {
    final _result_handle = _withTrack(gpxTrack, options);
    final _result = LocationSimulator$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkNavigationLocationsimulatorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _withRoute(Route route, LocationSimulatorOptions options) {
    final _withRouteFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_navigation_LocationSimulator_make__Route_LocationSimulatorOptions'));
    final _routeHandle = sdkRoutingRouteToFfi(route);
    final _optionsHandle = sdkNavigationLocationsimulatoroptionsToFfi(options);
    final __callResultHandle = _withRouteFfi(__lib.LibraryContext.isolateId, _routeHandle, _optionsHandle);
    sdkRoutingRouteReleaseFfiHandle(_routeHandle);
    sdkNavigationLocationsimulatoroptionsReleaseFfiHandle(_optionsHandle);
    if (_withRouteReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withRouteReturnGetError(__callResultHandle);
        _withRouteReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withRouteReturnGetResult(__callResultHandle);
    _withRouteReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withTrack(GPXTrack gpxTrack, LocationSimulatorOptions options) {
    final _withTrackFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_navigation_LocationSimulator_make__GPXTrack_LocationSimulatorOptions'));
    final _gpxTrackHandle = sdkNavigationGpxtrackToFfi(gpxTrack);
    final _optionsHandle = sdkNavigationLocationsimulatoroptionsToFfi(options);
    final __callResultHandle = _withTrackFfi(__lib.LibraryContext.isolateId, _gpxTrackHandle, _optionsHandle);
    sdkNavigationGpxtrackReleaseFfiHandle(_gpxTrackHandle);
    sdkNavigationLocationsimulatoroptionsReleaseFfiHandle(_optionsHandle);
    if (_withTrackReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withTrackReturnGetError(__callResultHandle);
        _withTrackReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withTrackReturnGetResult(__callResultHandle);
    _withTrackReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  void start() {
    final _startFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_LocationSimulator_start'));
    final _handle = this.handle;
    _startFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void stop() {
    final _stopFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_LocationSimulator_stop'));
    final _handle = this.handle;
    _stopFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  LocationListener? get listener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_LocationSimulator_listener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLocationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreLocationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set listener(LocationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_LocationSimulator_listener_set__LocationListener_'));
    final _valueHandle = sdkCoreLocationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreLocationlistenerReleaseFfiHandleNullable(_valueHandle);

  }



}

Pointer<Void> sdkNavigationLocationsimulatorToFfi(LocationSimulator value) =>
  _sdkNavigationLocationsimulatorCopyHandle((value as __lib.NativeBase).handle);

LocationSimulator sdkNavigationLocationsimulatorFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LocationSimulator) return instance;

  final _copiedHandle = _sdkNavigationLocationsimulatorCopyHandle(handle);
  final result = LocationSimulator$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationLocationsimulatorRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationLocationsimulatorReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationLocationsimulatorReleaseHandle(handle);

Pointer<Void> sdkNavigationLocationsimulatorToFfiNullable(LocationSimulator? value) =>
  value != null ? sdkNavigationLocationsimulatorToFfi(value) : Pointer<Void>.fromAddress(0);

LocationSimulator? sdkNavigationLocationsimulatorFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationLocationsimulatorFromFfi(handle) : null;

void sdkNavigationLocationsimulatorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationLocationsimulatorReleaseHandle(handle);

// End of LocationSimulator "private" section.


