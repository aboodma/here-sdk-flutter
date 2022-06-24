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
import 'package:here_sdk/src/sdk/core/location_listener.dart';
import 'package:here_sdk/src/sdk/location/location_accuracy.dart';
import 'package:here_sdk/src/sdk/location/location_engine_status.dart';
import 'package:here_sdk/src/sdk/location/location_options.dart';
import 'package:here_sdk/src/sdk/location/location_status_listener.dart';

/// Public abstract class that describes the behaviour of LocationEngine.
///
/// Implementation is platform-specific.
abstract class LocationEngineBase {
  /// Public abstract class that describes the behaviour of LocationEngine.
  ///
  /// Implementation is platform-specific.

  factory LocationEngineBase(
    LocationEngineStatus Function(LocationAccuracy) startWithLocationAccuracyLambda,
    LocationEngineStatus Function(LocationOptions) startWithLocationOptionsLambda,
    LocationEngineStatus Function(LocationAccuracy) updateLocationAccuracyLambda,
    LocationEngineStatus Function(LocationOptions) updateLocationOptionsLambda,
    void Function() stopLambda,
    void Function(LocationListener) addLocationListenerLambda,
    void Function(LocationListener) removeLocationListenerLambda,
    void Function(LocationStatusListener) addLocationStatusListenerLambda,
    void Function(LocationStatusListener) removeLocationStatusListenerLambda,
    LocationEngineStatus Function(bool) setBackgroundLocationAllowedLambda,
    bool Function() getBackgroundLocationAllowedLambda,
    LocationEngineStatus Function(bool) setBackgroundLocationIndicatorVisibleLambda,
    bool Function() getBackgroundLocationIndicatorVisibleLambda,
    LocationEngineStatus Function(bool) setPauseLocationUpdatesAutomaticallyLambda,
    bool Function() getPauseLocationUpdatesAutomaticallyLambda,
    void Function(bool) setCallListenerFromMainThreadEnabledLambda,
    location_impl.Location? Function() lastKnownLocationGetLambda,
    bool Function() isStartedGetLambda
  ) => LocationEngineBase$Lambdas(
    startWithLocationAccuracyLambda,
    startWithLocationOptionsLambda,
    updateLocationAccuracyLambda,
    updateLocationOptionsLambda,
    stopLambda,
    addLocationListenerLambda,
    removeLocationListenerLambda,
    addLocationStatusListenerLambda,
    removeLocationStatusListenerLambda,
    setBackgroundLocationAllowedLambda,
    getBackgroundLocationAllowedLambda,
    setBackgroundLocationIndicatorVisibleLambda,
    getBackgroundLocationIndicatorVisibleLambda,
    setPauseLocationUpdatesAutomaticallyLambda,
    getPauseLocationUpdatesAutomaticallyLambda,
    setCallListenerFromMainThreadEnabledLambda,
    lastKnownLocationGetLambda,
    isStartedGetLambda
  );

  /// Starts the location engine with desired LocationAccuracy.
  ///
  /// Returns
  /// [LocationEngineStatus.alreadyStarted], if [LocationEngineBase.startWithLocationOptions] is called again without [LocationEngineBase.stop] in between.
  ///
  /// [locationAccuracy] Desired location accuracy. Requested accuracy is not guaranteed.
  ///
  /// Returns [LocationEngineStatus]. Engine status. Valid values are defined in [LocationEngineStatus]
  ///
  LocationEngineStatus startWithLocationAccuracy(LocationAccuracy locationAccuracy);
  /// Starts the location engine with desired LocationOptions.
  ///
  /// Returns
  /// [LocationEngineStatus.alreadyStarted], if [LocationEngineBase.startWithLocationOptions] is called again without [LocationEngineBase.stop] in between.
  /// This method variant is not currently supported on iOS platforms. Returns [LocationEngineStatus.notSupported] on platforms which this method variant is not supported.
  ///
  /// [locationOptions] Desired location options.
  ///
  /// Returns [LocationEngineStatus]. Engine status. Valid values are defined in [LocationEngineStatus]
  ///
  LocationEngineStatus startWithLocationOptions(LocationOptions locationOptions);
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
  LocationEngineStatus updateLocationAccuracy(LocationAccuracy locationAccuracy);
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
  LocationEngineStatus updateLocationOptions(LocationOptions locationOptions);
  /// Stops the location engine.
  ///
  void stop();
  /// Adds a LocationListener to the engine to get notified when there is a new location
  /// update available.
  ///
  /// Supports more than one listener, instance is added only once.
  ///
  void addLocationListener(LocationListener listener);
  /// Removes a LocationListener from the engine.
  ///
  void removeLocationListener(LocationListener listener);
  /// Adds a LocationStatusListener to the engine to get notified when there is an important
  /// status change.
  ///
  /// Supports more than one listener, instance is added only once.
  ///
  void addLocationStatusListener(LocationStatusListener listener);
  /// Removes a LocationStatusListener from the engine.
  ///
  void removeLocationStatusListener(LocationStatusListener listener);
  /// Enables or disables background location updates for an application.
  ///
  /// Defaults to false.
  ///
  /// [allowed] Set to true to allow background location updates, or false to disable them.
  ///
  /// Returns [LocationEngineStatus]. [LocationEngineStatus.ok] if call succeeds. [LocationEngineStatus.notAllowed] if the application
  /// does not have background location capabilities enabled.
  /// [LocationEngineStatus.notSupported] on platforms which do not support controlling of background location modes.
  ///
  LocationEngineStatus setBackgroundLocationAllowed(bool allowed);
  /// Check if application's background location updates are enabled.
  ///
  /// Returns false on platforms which do not
  /// support controlling of background location modes using [LocationEngineBase.setBackgroundLocationAllowed] method.
  ///
  /// Returns [bool]. True if background location updates are allowed, false otherwise.
  ///
  bool getBackgroundLocationAllowed();
  /// Controls visibility of application's background location indicator.
  ///
  /// By default background location indicator
  /// is visible, if application has background location capabilities.
  ///
  /// [visible] Set to true to show background location indicator, or false to hide it.
  ///
  /// Returns [LocationEngineStatus]. [LocationEngineStatus.ok] if call succeeds. [LocationEngineStatus.notAllowed] if the application
  /// does not have background location capabilities enabled.
  /// [LocationEngineStatus.notSupported] on platforms which do not support controlling of background location
  /// indicator visibility.
  ///
  LocationEngineStatus setBackgroundLocationIndicatorVisible(bool visible);
  /// Check if application's background location indicator is visible.
  ///
  /// Returns false on platforms which do not
  /// support controlling of background location indicator using [LocationEngineBase.setBackgroundLocationIndicatorVisible] method.
  ///
  /// Returns [bool]. True if background location indicator is visible, false otherwise.
  ///
  bool getBackgroundLocationIndicatorVisible();
  /// Controls automatic pausing of location updates e.g.
  ///
  /// for improving device's battery life at times when
  /// location data is unlikely to change. By default automatic pausing of location updates is allowed.
  ///
  /// [allowed] Set to true to allow automatic pausing of location updates, or false to disable them.
  ///
  /// Returns [LocationEngineStatus]. [LocationEngineStatus.ok] if call succeeds. [LocationEngineStatus.notSupported] on platforms
  /// which do not support automatic pausing of location updates.
  ///
  LocationEngineStatus setPauseLocationUpdatesAutomatically(bool allowed);
  /// Check if automatic pausing of location updates are enabled.
  ///
  /// Returns false on platforms which do not
  /// support controlling of automatic pausing of location updates using [LocationEngineBase.setPauseLocationUpdatesAutomatically]
  /// method.
  ///
  /// Returns [bool]. True if automatic pausing of location updates is enabled, false otherwise.
  ///
  bool getPauseLocationUpdatesAutomatically();
  /// Enables or disables forcing listener calls to originate from main thread.
  ///
  /// When disabled listener calls can originate from any thread.
  /// Defaults to false .
  ///
  /// @nodoc
  void internalsetCallListenerFromMainThreadEnabled(bool enabled);
  /// Gets last known location or null if never obtained.
  location_impl.Location? get lastKnownLocation;

  /// Checks if the engine is in started state.
  bool get isStarted;

}


// LocationEngineBase "private" section, not exported.

final _sdkLocationLocationenginebaseRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_location_LocationEngineBase_register_finalizer'));
final _sdkLocationLocationenginebaseCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationEngineBase_copy_handle'));
final _sdkLocationLocationenginebaseReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationEngineBase_release_handle'));
final _sdkLocationLocationenginebaseCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_location_LocationEngineBase_create_proxy'));
final _sdkLocationLocationenginebaseGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationEngineBase_get_type_id'));

















class LocationEngineBase$Lambdas implements LocationEngineBase {
  LocationEngineStatus Function(LocationAccuracy) startWithLocationAccuracyLambda;
  LocationEngineStatus Function(LocationOptions) startWithLocationOptionsLambda;
  LocationEngineStatus Function(LocationAccuracy) updateLocationAccuracyLambda;
  LocationEngineStatus Function(LocationOptions) updateLocationOptionsLambda;
  void Function() stopLambda;
  void Function(LocationListener) addLocationListenerLambda;
  void Function(LocationListener) removeLocationListenerLambda;
  void Function(LocationStatusListener) addLocationStatusListenerLambda;
  void Function(LocationStatusListener) removeLocationStatusListenerLambda;
  LocationEngineStatus Function(bool) setBackgroundLocationAllowedLambda;
  bool Function() getBackgroundLocationAllowedLambda;
  LocationEngineStatus Function(bool) setBackgroundLocationIndicatorVisibleLambda;
  bool Function() getBackgroundLocationIndicatorVisibleLambda;
  LocationEngineStatus Function(bool) setPauseLocationUpdatesAutomaticallyLambda;
  bool Function() getPauseLocationUpdatesAutomaticallyLambda;
  void Function(bool) setCallListenerFromMainThreadEnabledLambda;
  location_impl.Location? Function() lastKnownLocationGetLambda;
  bool Function() isStartedGetLambda;

  LocationEngineBase$Lambdas(
    this.startWithLocationAccuracyLambda,
    this.startWithLocationOptionsLambda,
    this.updateLocationAccuracyLambda,
    this.updateLocationOptionsLambda,
    this.stopLambda,
    this.addLocationListenerLambda,
    this.removeLocationListenerLambda,
    this.addLocationStatusListenerLambda,
    this.removeLocationStatusListenerLambda,
    this.setBackgroundLocationAllowedLambda,
    this.getBackgroundLocationAllowedLambda,
    this.setBackgroundLocationIndicatorVisibleLambda,
    this.getBackgroundLocationIndicatorVisibleLambda,
    this.setPauseLocationUpdatesAutomaticallyLambda,
    this.getPauseLocationUpdatesAutomaticallyLambda,
    this.setCallListenerFromMainThreadEnabledLambda,
    this.lastKnownLocationGetLambda,
    this.isStartedGetLambda
  );

  @override
  LocationEngineStatus startWithLocationAccuracy(LocationAccuracy locationAccuracy) =>
    startWithLocationAccuracyLambda(locationAccuracy);
  @override
  LocationEngineStatus startWithLocationOptions(LocationOptions locationOptions) =>
    startWithLocationOptionsLambda(locationOptions);
  @override
  LocationEngineStatus updateLocationAccuracy(LocationAccuracy locationAccuracy) =>
    updateLocationAccuracyLambda(locationAccuracy);
  @override
  LocationEngineStatus updateLocationOptions(LocationOptions locationOptions) =>
    updateLocationOptionsLambda(locationOptions);
  @override
  void stop() =>
    stopLambda();
  @override
  void addLocationListener(LocationListener listener) =>
    addLocationListenerLambda(listener);
  @override
  void removeLocationListener(LocationListener listener) =>
    removeLocationListenerLambda(listener);
  @override
  void addLocationStatusListener(LocationStatusListener listener) =>
    addLocationStatusListenerLambda(listener);
  @override
  void removeLocationStatusListener(LocationStatusListener listener) =>
    removeLocationStatusListenerLambda(listener);
  @override
  LocationEngineStatus setBackgroundLocationAllowed(bool allowed) =>
    setBackgroundLocationAllowedLambda(allowed);
  @override
  bool getBackgroundLocationAllowed() =>
    getBackgroundLocationAllowedLambda();
  @override
  LocationEngineStatus setBackgroundLocationIndicatorVisible(bool visible) =>
    setBackgroundLocationIndicatorVisibleLambda(visible);
  @override
  bool getBackgroundLocationIndicatorVisible() =>
    getBackgroundLocationIndicatorVisibleLambda();
  @override
  LocationEngineStatus setPauseLocationUpdatesAutomatically(bool allowed) =>
    setPauseLocationUpdatesAutomaticallyLambda(allowed);
  @override
  bool getPauseLocationUpdatesAutomatically() =>
    getPauseLocationUpdatesAutomaticallyLambda();
  @override
  void internalsetCallListenerFromMainThreadEnabled(bool enabled) =>
    setCallListenerFromMainThreadEnabledLambda(enabled);
  @override
  location_impl.Location? get lastKnownLocation => lastKnownLocationGetLambda();
  @override
  bool get isStarted => isStartedGetLambda();
}

class LocationEngineBase$Impl extends __lib.NativeBase implements LocationEngineBase {

  LocationEngineBase$Impl(Pointer<Void> handle) : super(handle);

  @override
  LocationEngineStatus startWithLocationAccuracy(LocationAccuracy locationAccuracy) {
    final _startWithLocationAccuracyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32, Uint32), int Function(Pointer<Void>, int, int)>('here_sdk_sdk_location_LocationEngineBase_start__LocationAccuracy'));
    final _locationAccuracyHandle = sdkLocationLocationaccuracyToFfi(locationAccuracy);
    final _handle = this.handle;
    final __resultHandle = _startWithLocationAccuracyFfi(_handle, __lib.LibraryContext.isolateId, _locationAccuracyHandle);
    sdkLocationLocationaccuracyReleaseFfiHandle(_locationAccuracyHandle);
    try {
      return sdkLocationLocationenginestatusFromFfi(__resultHandle);
    } finally {
      sdkLocationLocationenginestatusReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  LocationEngineStatus startWithLocationOptions(LocationOptions locationOptions) {
    final _startWithLocationOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_location_LocationEngineBase_start__LocationOptions'));
    final _locationOptionsHandle = sdkLocationLocationoptionsToFfi(locationOptions);
    final _handle = this.handle;
    final __resultHandle = _startWithLocationOptionsFfi(_handle, __lib.LibraryContext.isolateId, _locationOptionsHandle);
    sdkLocationLocationoptionsReleaseFfiHandle(_locationOptionsHandle);
    try {
      return sdkLocationLocationenginestatusFromFfi(__resultHandle);
    } finally {
      sdkLocationLocationenginestatusReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  LocationEngineStatus updateLocationAccuracy(LocationAccuracy locationAccuracy) {
    final _updateLocationAccuracyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32, Uint32), int Function(Pointer<Void>, int, int)>('here_sdk_sdk_location_LocationEngineBase_updateLocationAccuracy__LocationAccuracy'));
    final _locationAccuracyHandle = sdkLocationLocationaccuracyToFfi(locationAccuracy);
    final _handle = this.handle;
    final __resultHandle = _updateLocationAccuracyFfi(_handle, __lib.LibraryContext.isolateId, _locationAccuracyHandle);
    sdkLocationLocationaccuracyReleaseFfiHandle(_locationAccuracyHandle);
    try {
      return sdkLocationLocationenginestatusFromFfi(__resultHandle);
    } finally {
      sdkLocationLocationenginestatusReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  LocationEngineStatus updateLocationOptions(LocationOptions locationOptions) {
    final _updateLocationOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_location_LocationEngineBase_updateLocationOptions__LocationOptions'));
    final _locationOptionsHandle = sdkLocationLocationoptionsToFfi(locationOptions);
    final _handle = this.handle;
    final __resultHandle = _updateLocationOptionsFfi(_handle, __lib.LibraryContext.isolateId, _locationOptionsHandle);
    sdkLocationLocationoptionsReleaseFfiHandle(_locationOptionsHandle);
    try {
      return sdkLocationLocationenginestatusFromFfi(__resultHandle);
    } finally {
      sdkLocationLocationenginestatusReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void stop() {
    final _stopFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_location_LocationEngineBase_stop'));
    final _handle = this.handle;
    _stopFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void addLocationListener(LocationListener listener) {
    final _addLocationListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_location_LocationEngineBase_addLocationListener__LocationListener'));
    final _listenerHandle = sdkCoreLocationlistenerToFfi(listener);
    final _handle = this.handle;
    _addLocationListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkCoreLocationlistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void removeLocationListener(LocationListener listener) {
    final _removeLocationListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_location_LocationEngineBase_removeLocationListener__LocationListener'));
    final _listenerHandle = sdkCoreLocationlistenerToFfi(listener);
    final _handle = this.handle;
    _removeLocationListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkCoreLocationlistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void addLocationStatusListener(LocationStatusListener listener) {
    final _addLocationStatusListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_location_LocationEngineBase_addLocationStatusListener__LocationStatusListener'));
    final _listenerHandle = sdkLocationLocationstatuslistenerToFfi(listener);
    final _handle = this.handle;
    _addLocationStatusListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkLocationLocationstatuslistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void removeLocationStatusListener(LocationStatusListener listener) {
    final _removeLocationStatusListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_location_LocationEngineBase_removeLocationStatusListener__LocationStatusListener'));
    final _listenerHandle = sdkLocationLocationstatuslistenerToFfi(listener);
    final _handle = this.handle;
    _removeLocationStatusListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkLocationLocationstatuslistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  LocationEngineStatus setBackgroundLocationAllowed(bool allowed) {
    final _setBackgroundLocationAllowedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32, Uint8), int Function(Pointer<Void>, int, int)>('here_sdk_sdk_location_LocationEngineBase_setBackgroundLocationAllowed__Boolean'));
    final _allowedHandle = booleanToFfi(allowed);
    final _handle = this.handle;
    final __resultHandle = _setBackgroundLocationAllowedFfi(_handle, __lib.LibraryContext.isolateId, _allowedHandle);
    booleanReleaseFfiHandle(_allowedHandle);
    try {
      return sdkLocationLocationenginestatusFromFfi(__resultHandle);
    } finally {
      sdkLocationLocationenginestatusReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool getBackgroundLocationAllowed() {
    final _getBackgroundLocationAllowedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_location_LocationEngineBase_getBackgroundLocationAllowed'));
    final _handle = this.handle;
    final __resultHandle = _getBackgroundLocationAllowedFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  LocationEngineStatus setBackgroundLocationIndicatorVisible(bool visible) {
    final _setBackgroundLocationIndicatorVisibleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32, Uint8), int Function(Pointer<Void>, int, int)>('here_sdk_sdk_location_LocationEngineBase_setBackgroundLocationIndicatorVisible__Boolean'));
    final _visibleHandle = booleanToFfi(visible);
    final _handle = this.handle;
    final __resultHandle = _setBackgroundLocationIndicatorVisibleFfi(_handle, __lib.LibraryContext.isolateId, _visibleHandle);
    booleanReleaseFfiHandle(_visibleHandle);
    try {
      return sdkLocationLocationenginestatusFromFfi(__resultHandle);
    } finally {
      sdkLocationLocationenginestatusReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool getBackgroundLocationIndicatorVisible() {
    final _getBackgroundLocationIndicatorVisibleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_location_LocationEngineBase_getBackgroundLocationIndicatorVisible'));
    final _handle = this.handle;
    final __resultHandle = _getBackgroundLocationIndicatorVisibleFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  LocationEngineStatus setPauseLocationUpdatesAutomatically(bool allowed) {
    final _setPauseLocationUpdatesAutomaticallyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32, Uint8), int Function(Pointer<Void>, int, int)>('here_sdk_sdk_location_LocationEngineBase_setPauseLocationUpdatesAutomatically__Boolean'));
    final _allowedHandle = booleanToFfi(allowed);
    final _handle = this.handle;
    final __resultHandle = _setPauseLocationUpdatesAutomaticallyFfi(_handle, __lib.LibraryContext.isolateId, _allowedHandle);
    booleanReleaseFfiHandle(_allowedHandle);
    try {
      return sdkLocationLocationenginestatusFromFfi(__resultHandle);
    } finally {
      sdkLocationLocationenginestatusReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool getPauseLocationUpdatesAutomatically() {
    final _getPauseLocationUpdatesAutomaticallyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_location_LocationEngineBase_getPauseLocationUpdatesAutomatically'));
    final _handle = this.handle;
    final __resultHandle = _getPauseLocationUpdatesAutomaticallyFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void internalsetCallListenerFromMainThreadEnabled(bool enabled) {
    final _setCallListenerFromMainThreadEnabledFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_location_LocationEngineBase_setCallListenerFromMainThreadEnabled__Boolean'));
    final _enabledHandle = booleanToFfi(enabled);
    final _handle = this.handle;
    _setCallListenerFromMainThreadEnabledFfi(_handle, __lib.LibraryContext.isolateId, _enabledHandle);
    booleanReleaseFfiHandle(_enabledHandle);

  }

  /// Gets last known location or null if never obtained.
  location_impl.Location? get lastKnownLocation {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_location_LocationEngineBase_lastKnownLocation_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLocationFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreLocationReleaseFfiHandleNullable(__resultHandle);

    }

  }


  /// Checks if the engine is in started state.
  bool get isStarted {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_location_LocationEngineBase_isStarted_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }



}

int _sdkLocationLocationenginebasestartWithLocationAccuracyStatic(Object _obj, int locationAccuracy, Pointer<Uint32> _result) {
  LocationEngineStatus? _resultObject;
  try {
    _resultObject = (_obj as LocationEngineBase).startWithLocationAccuracy(sdkLocationLocationaccuracyFromFfi(locationAccuracy));
    _result.value = sdkLocationLocationenginestatusToFfi(_resultObject);
  } finally {
    sdkLocationLocationaccuracyReleaseFfiHandle(locationAccuracy);
  }
  return 0;
}
int _sdkLocationLocationenginebasestartWithLocationOptionsStatic(Object _obj, Pointer<Void> locationOptions, Pointer<Uint32> _result) {
  LocationEngineStatus? _resultObject;
  try {
    _resultObject = (_obj as LocationEngineBase).startWithLocationOptions(sdkLocationLocationoptionsFromFfi(locationOptions));
    _result.value = sdkLocationLocationenginestatusToFfi(_resultObject);
  } finally {
    sdkLocationLocationoptionsReleaseFfiHandle(locationOptions);
  }
  return 0;
}
int _sdkLocationLocationenginebaseupdateLocationAccuracyStatic(Object _obj, int locationAccuracy, Pointer<Uint32> _result) {
  LocationEngineStatus? _resultObject;
  try {
    _resultObject = (_obj as LocationEngineBase).updateLocationAccuracy(sdkLocationLocationaccuracyFromFfi(locationAccuracy));
    _result.value = sdkLocationLocationenginestatusToFfi(_resultObject);
  } finally {
    sdkLocationLocationaccuracyReleaseFfiHandle(locationAccuracy);
  }
  return 0;
}
int _sdkLocationLocationenginebaseupdateLocationOptionsStatic(Object _obj, Pointer<Void> locationOptions, Pointer<Uint32> _result) {
  LocationEngineStatus? _resultObject;
  try {
    _resultObject = (_obj as LocationEngineBase).updateLocationOptions(sdkLocationLocationoptionsFromFfi(locationOptions));
    _result.value = sdkLocationLocationenginestatusToFfi(_resultObject);
  } finally {
    sdkLocationLocationoptionsReleaseFfiHandle(locationOptions);
  }
  return 0;
}
int _sdkLocationLocationenginebasestopStatic(Object _obj) {

  try {
    (_obj as LocationEngineBase).stop();
  } finally {
  }
  return 0;
}
int _sdkLocationLocationenginebaseaddLocationListenerStatic(Object _obj, Pointer<Void> listener) {

  try {
    (_obj as LocationEngineBase).addLocationListener(sdkCoreLocationlistenerFromFfi(listener));
  } finally {
    sdkCoreLocationlistenerReleaseFfiHandle(listener);
  }
  return 0;
}
int _sdkLocationLocationenginebaseremoveLocationListenerStatic(Object _obj, Pointer<Void> listener) {

  try {
    (_obj as LocationEngineBase).removeLocationListener(sdkCoreLocationlistenerFromFfi(listener));
  } finally {
    sdkCoreLocationlistenerReleaseFfiHandle(listener);
  }
  return 0;
}
int _sdkLocationLocationenginebaseaddLocationStatusListenerStatic(Object _obj, Pointer<Void> listener) {

  try {
    (_obj as LocationEngineBase).addLocationStatusListener(sdkLocationLocationstatuslistenerFromFfi(listener));
  } finally {
    sdkLocationLocationstatuslistenerReleaseFfiHandle(listener);
  }
  return 0;
}
int _sdkLocationLocationenginebaseremoveLocationStatusListenerStatic(Object _obj, Pointer<Void> listener) {

  try {
    (_obj as LocationEngineBase).removeLocationStatusListener(sdkLocationLocationstatuslistenerFromFfi(listener));
  } finally {
    sdkLocationLocationstatuslistenerReleaseFfiHandle(listener);
  }
  return 0;
}
int _sdkLocationLocationenginebasesetBackgroundLocationAllowedStatic(Object _obj, int allowed, Pointer<Uint32> _result) {
  LocationEngineStatus? _resultObject;
  try {
    _resultObject = (_obj as LocationEngineBase).setBackgroundLocationAllowed(booleanFromFfi(allowed));
    _result.value = sdkLocationLocationenginestatusToFfi(_resultObject);
  } finally {
    booleanReleaseFfiHandle(allowed);
  }
  return 0;
}
int _sdkLocationLocationenginebasegetBackgroundLocationAllowedStatic(Object _obj, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as LocationEngineBase).getBackgroundLocationAllowed();
    _result.value = booleanToFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _sdkLocationLocationenginebasesetBackgroundLocationIndicatorVisibleStatic(Object _obj, int visible, Pointer<Uint32> _result) {
  LocationEngineStatus? _resultObject;
  try {
    _resultObject = (_obj as LocationEngineBase).setBackgroundLocationIndicatorVisible(booleanFromFfi(visible));
    _result.value = sdkLocationLocationenginestatusToFfi(_resultObject);
  } finally {
    booleanReleaseFfiHandle(visible);
  }
  return 0;
}
int _sdkLocationLocationenginebasegetBackgroundLocationIndicatorVisibleStatic(Object _obj, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as LocationEngineBase).getBackgroundLocationIndicatorVisible();
    _result.value = booleanToFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _sdkLocationLocationenginebasesetPauseLocationUpdatesAutomaticallyStatic(Object _obj, int allowed, Pointer<Uint32> _result) {
  LocationEngineStatus? _resultObject;
  try {
    _resultObject = (_obj as LocationEngineBase).setPauseLocationUpdatesAutomatically(booleanFromFfi(allowed));
    _result.value = sdkLocationLocationenginestatusToFfi(_resultObject);
  } finally {
    booleanReleaseFfiHandle(allowed);
  }
  return 0;
}
int _sdkLocationLocationenginebasegetPauseLocationUpdatesAutomaticallyStatic(Object _obj, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as LocationEngineBase).getPauseLocationUpdatesAutomatically();
    _result.value = booleanToFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _sdkLocationLocationenginebasesetCallListenerFromMainThreadEnabledStatic(Object _obj, int enabled) {

  try {
    (_obj as LocationEngineBase).internalsetCallListenerFromMainThreadEnabled(booleanFromFfi(enabled));
  } finally {
    booleanReleaseFfiHandle(enabled);
  }
  return 0;
}

int _sdkLocationLocationenginebaselastKnownLocationGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkCoreLocationToFfiNullable((_obj as LocationEngineBase).lastKnownLocation);
  return 0;
}
int _sdkLocationLocationenginebaseisStartedGetStatic(Object _obj, Pointer<Uint8> _result) {
  _result.value = booleanToFfi((_obj as LocationEngineBase).isStarted);
  return 0;
}

Pointer<Void> sdkLocationLocationenginebaseToFfi(LocationEngineBase value) {
  if (value is __lib.NativeBase) return _sdkLocationLocationenginebaseCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkLocationLocationenginebaseCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Uint32, Pointer<Uint32>)>(_sdkLocationLocationenginebasestartWithLocationAccuracyStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Uint32>)>(_sdkLocationLocationenginebasestartWithLocationOptionsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint32, Pointer<Uint32>)>(_sdkLocationLocationenginebaseupdateLocationAccuracyStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Uint32>)>(_sdkLocationLocationenginebaseupdateLocationOptionsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkLocationLocationenginebasestopStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkLocationLocationenginebaseaddLocationListenerStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkLocationLocationenginebaseremoveLocationListenerStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkLocationLocationenginebaseaddLocationStatusListenerStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkLocationLocationenginebaseremoveLocationStatusListenerStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint8, Pointer<Uint32>)>(_sdkLocationLocationenginebasesetBackgroundLocationAllowedStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint8>)>(_sdkLocationLocationenginebasegetBackgroundLocationAllowedStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint8, Pointer<Uint32>)>(_sdkLocationLocationenginebasesetBackgroundLocationIndicatorVisibleStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint8>)>(_sdkLocationLocationenginebasegetBackgroundLocationIndicatorVisibleStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint8, Pointer<Uint32>)>(_sdkLocationLocationenginebasesetPauseLocationUpdatesAutomaticallyStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint8>)>(_sdkLocationLocationenginebasegetPauseLocationUpdatesAutomaticallyStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint8)>(_sdkLocationLocationenginebasesetCallListenerFromMainThreadEnabledStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkLocationLocationenginebaselastKnownLocationGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint8>)>(_sdkLocationLocationenginebaseisStartedGetStatic, __lib.unknownError)
  );

  return result;
}

LocationEngineBase sdkLocationLocationenginebaseFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LocationEngineBase) return instance;

  final _typeIdHandle = _sdkLocationLocationenginebaseGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkLocationLocationenginebaseCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : LocationEngineBase$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkLocationLocationenginebaseRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkLocationLocationenginebaseReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkLocationLocationenginebaseReleaseHandle(handle);

Pointer<Void> sdkLocationLocationenginebaseToFfiNullable(LocationEngineBase? value) =>
  value != null ? sdkLocationLocationenginebaseToFfi(value) : Pointer<Void>.fromAddress(0);

LocationEngineBase? sdkLocationLocationenginebaseFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkLocationLocationenginebaseFromFfi(handle) : null;

void sdkLocationLocationenginebaseReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationLocationenginebaseReleaseHandle(handle);

// End of LocationEngineBase "private" section.


