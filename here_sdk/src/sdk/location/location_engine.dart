/*
 * Copyright (c) 2020-2022 HERE Global B.V. and its affiliate(s).
 * All rights reserved.
 *
 * This software and other materials contain proprietary information
 * controlled by HERE and are protected by applicable copyright legislation.
 * Any use and utilization of this software and other materials and
 * disclosure to any third parties is conditional upon having a separate
 * agreement with HERE for the access, use, utilization or disclosure of this
 * software. In the absence of such agreement, the use of the software is not
 * allowed.
 */

import 'dart:collection';
import 'dart:io' show Platform;

import 'package:here_sdk/core.dart';
import 'package:here_sdk/location.dart';
import 'package:here_sdk/src/sdk/location/location_status_listener_bridge.dart';
import 'package:here_sdk/src/sdk/location/location_update_listener_bridge.dart';

/// Handles location updates received according to the desired [LocationAccuracy] or [LocationOptions].
///
/// Each instance of this class will be using internally the same client providing the actual
/// location updates. For that reason, only one [LocationEngine] can be started at a time.
/// Multiple listeners can be attached, either to receive location updates, see [LocationListener]
/// or status updates, see [LocationStatusListener]. When a different [LocationAccuracy] or [LocationOptions] is
/// desired, the [LocationEngine] needs to be stopped and started again.
/// Note: starting the [LocationEngine] with [LocationOptions] is only supported in Android platforms.
class LocationEngine implements LocationEngineBase {
  /// Constructor of the LocationEngine.
  static final LocationEngineBase _location = LocationFFI.createLocationEngine()!;

  /// Location update listener map for mapping listener to bridge.
  final LinkedHashMap<LocationListener, LocationUpdateListenerBridge> _locationUpdateListeners =
      LinkedHashMap<LocationListener, LocationUpdateListenerBridge>();

  /// Location status listener map for mapping listener to bridge.
  final LinkedHashMap<LocationStatusListener, LocationStatusListenerBridge> _locationStatusListeners =
      LinkedHashMap<LocationStatusListener, LocationStatusListenerBridge>();

  LocationEngine() {
    internalsetCallListenerFromMainThreadEnabled(false);
  }

  /// Starts the location engine with desired [LocationAccuracy]. Returns
  /// [LocationEngineStatus.alreadyStarted] if [LocationEngine.startWithLocationAccuracy] or
  /// [LocationEngine.startWithLocationOptions] is called again without calling [LocationEngine.stop] in between.
  /// See [LocationEngineStatus] for other possible return values.
  LocationEngineStatus startWithLocationAccuracy(LocationAccuracy locationAccuracy) =>
      _location.startWithLocationAccuracy(locationAccuracy);

  /// Starts the location engine with desired [LocationOptions]. Returns
  /// [LocationEngineStatus.alreadyStarted] if [LocationEngine.startWithLocationAccuracy] or
  /// [LocationEngine.startWithLocationOptions] is called again without calling [LocationEngine.stop] in between.
  /// This method variant is not currently supported on iOS platforms. Returns [LocationEngineStatus.notSupported] on platforms
  /// on which this method variant is not supported.
  /// See [LocationEngineStatus] for other possible return values.
  LocationEngineStatus startWithLocationOptions(LocationOptions locationOptions) =>
      _location.startWithLocationOptions(locationOptions);

  /// Reconfigures the location engine with desired LocationAccuracy.
  ///
  /// This method is a faster way to change location accuracy for already started
  /// location engine, than calling [LocationEngineBase.stop] and [LocationEngineBase.startWithLocationOptions] in sequence. Returns [LocationEngineStatus.notReady],
  /// if called for unstarted location engine.
  ///
  /// [locationAccuracy] Desired location accuracy. Requested accuracy is not guaranteed.
  ///
  /// Returns [LocationEngineStatus]. Engine status. Valid values are defined in [LocationEngineStatus]
  ///
  LocationEngineStatus updateLocationAccuracy(LocationAccuracy locationAccuracy) =>
      _location.updateLocationAccuracy(locationAccuracy);

  /// Reconfigures the location engine with desired LocationOptions.
  ///
  /// This method is a faster way to change location options for already started
  /// location engine, than calling [LocationEngineBase.stop] and [LocationEngineBase.startWithLocationOptions] in sequence. Returns [LocationEngineStatus.notReady],
  /// if called for unstarted location engine.
  /// This method variant is not currently supported on iOS platforms. Returns [LocationEngineStatus.notSupported] on platforms which this method variant is not supported.
  ///
  /// [locationOptions] Desired location options.
  ///
  /// Returns [LocationEngineStatus]. Engine status. Valid values are defined in [LocationEngineStatus]
  ///
  LocationEngineStatus updateLocationOptions(LocationOptions locationOptions) =>
      _location.updateLocationOptions(locationOptions);

  /// Stops the location engine.
  void stop() => _location.stop();

  /// Adds a [LocationListener] to the engine to get notified when there is a new location update available.
  /// Supports more than one listener, instance is added only once.
  void addLocationListener(LocationListener listener) {
    if (!_locationUpdateListeners.containsKey(listener)) {
      _locationUpdateListeners[listener] = LocationUpdateListenerBridge(listener);
    }
    _location.addLocationListener(_locationUpdateListeners[listener]!);
  }

  /// Removes a [LocationListener] from the engine.
  void removeLocationListener(LocationListener listener) {
    LocationUpdateListenerBridge? bridge = _locationUpdateListeners.remove(listener);
    if (bridge == null) {
      return;
    }
    _location.removeLocationListener(bridge);
  }

  /// Adds a [LocationStatusListener] to the engine to get notified when there is a an important status change.
  /// Supports more than one listener, instance is added only once.
  void addLocationStatusListener(LocationStatusListener listener) {
    if (!_locationStatusListeners.containsKey(listener)) {
      _locationStatusListeners[listener] = LocationStatusListenerBridge(listener);
    }
    _location.addLocationStatusListener(_locationStatusListeners[listener]!);
  }

  /// Removes a [LocationStatusListener] from the engine.
  void removeLocationStatusListener(LocationStatusListener listener) {
    LocationStatusListenerBridge? bridge = _locationStatusListeners.remove(listener);
    if (bridge == null) {
      return;
    }
    _location.removeLocationStatusListener(bridge);
  }

  /// Enables or disables application's background location updates.
  ///
  /// By default background location updates
  /// are enabled if application has background location capabilities.
  /// [allowed] Set to true to allow background location updates, or false to disable them.
  /// Returns [LocationEngineStatus]. [LocationEngineStatus.ok] if call succeeds. [LocationEngineStatus.notAllowed] if the application
  /// does not have background location capabilities enabled, or [LocationEngineStatus.notSupported] on platforms
  /// which do not support controlling of background location modes.
  LocationEngineStatus setBackgroundLocationAllowed(bool allowed) {
    if (Platform.isIOS) {
      return _location.setBackgroundLocationAllowed(allowed);
    }
    return LocationEngineStatus.notSupported;
  }

  /// Check if application's background location updates are enabled.
  ///
  /// Returns false on platforms which do not
  /// support controlling of background location modes using [setBackgroundLocationAllowed] method.
  /// Returns [bool]. True if background location updates are allowed, false otherwise.
  bool getBackgroundLocationAllowed() {
    if (Platform.isIOS) {
      return _location.getBackgroundLocationAllowed();
    }
    return false;
  }

  /// Controls visibility of application's background location indicator.
  ///
  /// By default background location indicator
  /// is visible, if application has background location capabilities.
  /// [visible] Set to true to show background location indicator, or false to hide it.
  /// Returns [LocationEngineStatus]. [LocationEngineStatus.ok] if call succeeds. [LocationEngineStatus.notAllowed] if the application
  /// does not have background location capabilities enabled, or [LocationEngineStatus.notSupported] on platforms
  /// which do not support controlling of background location indicator visibility.
  LocationEngineStatus setBackgroundLocationIndicatorVisible(bool visible) {
    if (Platform.isIOS) {
      return _location.setBackgroundLocationIndicatorVisible(visible);
    }
    return LocationEngineStatus.notSupported;
  }

  /// Check if application's background location indicator is visible.
  ///
  /// Returns false on platforms which do not
  /// support controlling of background location indicator using [setBackgroundLocationIndicatorVisible] method.
  /// Returns [bool]. True if background location indicator is visible, false otherwise.
  bool getBackgroundLocationIndicatorVisible() {
    if (Platform.isIOS) {
      return _location.getBackgroundLocationIndicatorVisible();
    }
    return false;
  }

  /// Controls automatic pausing of location updates e.g.
  ///
  /// for improving device's battery life at times when
  /// location data is unlikely to change. By default automatic pausing of location updates is allowed.
  /// [allowed] Set to true to allow automatic pausing of location updates, or false to disable them.
  /// Returns [LocationEngineStatus]. [LocationEngineStatus.ok] if call succeeds. [LocationEngineStatus.notSupported] on platforms
  /// which do not support automatic pausing of location updates.
  LocationEngineStatus setPauseLocationUpdatesAutomatically(bool allowed) {
    if (Platform.isIOS) {
      return _location.setPauseLocationUpdatesAutomatically(allowed);
    }
    return LocationEngineStatus.notSupported;
  }

  /// Check if automatic pausing of location updates are enabled.
  ///
  /// Returns false on platforms which do not
  /// support controlling of automatic pausing of location updates using [setPauseLocationUpdatesAutomatically]
  /// method.
  /// Returns [bool]. True if automatic pausing of location updates is enabled, false otherwise.
  bool getPauseLocationUpdatesAutomatically() {
    if (Platform.isIOS) {
      return _location.getPauseLocationUpdatesAutomatically();
    }
    return false;
  }

  /// The last known location obtained by the engine.
  /// [Location] is returned synchronously. [Location] object has a timestamp attribute,
  /// which reflects when data was obtained. If location was never obtained - null is returned.
  Location? get lastKnownLocation => _location.lastKnownLocation;

  // Checks if the engine is in started state.
  bool get isStarted => _location.isStarted;

  void internalsetCallListenerFromMainThreadEnabled(bool enabled) =>
      _location.internalsetCallListenerFromMainThreadEnabled(enabled);
}
