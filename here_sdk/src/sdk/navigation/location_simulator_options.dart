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
import 'package:here_sdk/src/builtin_types__conversion.dart';

/// Options to specify how the location simulator will behave.

class LocationSimulatorOptions {
  /// A factor to scale the speed.
  /// Useful to speed up (or down) the simulation.
  /// By default, the speed factor is 1.0, which is equal to the speed that one normally drives along
  /// each route segment without taking into account any traffic-related constraints.
  /// The default speed may vary based on the road geometry, road condition and other statistical
  /// data, but it is never higher than the current speed limit.
  /// Values above 1.0 will increase the speed, values below 1.0 will reduce the speed.
  /// For example, a value of 2.0 will double the speed.
  double speedFactor;

  /// Interval between notifications in milliseconds.
  /// Defaults to 1000 milliseconds.
  /// Values less than 1ms are not acceptable and the interval is raised to this minimum in object constructors.
  /// Note: This value does not affect LocationSimulator when created with a GPX document.
  @Deprecated("Will be removed in v4.13.0. Use [LocationSimulatorOptions.notificationInterval] instead.")
  int notificationIntervalInMilliseconds;

  /// Interval between notifications.
  /// Defaults to 1 second.
  ///
  /// Values less than 1 ms are not acceptable and the interval is raised to this minimum in object constructors.
  ///
  /// Note: This value does not affect `LocationSimulator` when created with a GPX document.
  Duration notificationInterval;

  /// Creates a new instance of this class.

  /// [speedFactor] A factor to scale the speed.
  /// Useful to speed up (or down) the simulation.
  /// By default, the speed factor is 1.0, which is equal to the speed that one normally drives along
  /// each route segment without taking into account any traffic-related constraints.
  /// The default speed may vary based on the road geometry, road condition and other statistical
  /// data, but it is never higher than the current speed limit.
  /// Values above 1.0 will increase the speed, values below 1.0 will reduce the speed.
  /// For example, a value of 2.0 will double the speed.

  /// [notificationIntervalInMilliseconds] Interval between notifications in milliseconds.
  /// Defaults to 1000 milliseconds.
  /// Values less than 1ms are not acceptable and the interval is raised to this minimum in object constructors.
  /// Note: This value does not affect LocationSimulator when created with a GPX document.

  /// [notificationInterval] Interval between notifications.
  /// Defaults to 1 second.
  ///
  /// Values less than 1 ms are not acceptable and the interval is raised to this minimum in object constructors.
  ///
  /// Note: This value does not affect `LocationSimulator` when created with a GPX document.

  LocationSimulatorOptions._(this.speedFactor, this.notificationIntervalInMilliseconds, this.notificationInterval);
  /// Creates a new instance of this class.
  LocationSimulatorOptions.withDefaults()
      : speedFactor = 1.0, notificationIntervalInMilliseconds = 1000, notificationInterval = const Duration(milliseconds: 1000);
  /// Creates a new instance of this class.
  /// [speedFactor] A factor to scale the speed.
  /// Useful to speed up (or down) the simulation.
  /// By default, the speed factor is 1.0, which is equal to the speed that one normally drives along
  /// each route segment without taking into account any traffic-related constraints.
  /// The default speed may vary based on the road geometry, road condition and other statistical
  /// data, but it is never higher than the current speed limit.
  /// Values above 1.0 will increase the speed, values below 1.0 will reduce the speed.
  /// For example, a value of 2.0 will double the speed.
  /// [notificationIntervalInMilliseconds] Interval between notifications in milliseconds.
  /// Defaults to 1000 milliseconds.
  /// Values less than 1ms are not acceptable and the interval is raised to this minimum in object constructors.
  /// Note: This value does not affect LocationSimulator when created with a GPX document.
  @Deprecated("Will be removed in v4.13.0. Please use LocationSimulatorOptions.withDefaults() instead.")
  LocationSimulatorOptions(this.speedFactor, this.notificationIntervalInMilliseconds)
      : notificationInterval = const Duration(milliseconds: 1000);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LocationSimulatorOptions) return false;
    LocationSimulatorOptions _other = other;
    return speedFactor == _other.speedFactor &&
        notificationIntervalInMilliseconds == _other.notificationIntervalInMilliseconds &&
        notificationInterval == _other.notificationInterval;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + speedFactor.hashCode;
    result = 31 * result + notificationIntervalInMilliseconds.hashCode;
    result = 31 * result + notificationInterval.hashCode;
    return result;
  }
}


// LocationSimulatorOptions "private" section, not exported.

final _sdkNavigationLocationsimulatoroptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Int32, Uint64),
    Pointer<Void> Function(double, int, int)
  >('here_sdk_sdk_navigation_LocationSimulatorOptions_create_handle'));
final _sdkNavigationLocationsimulatoroptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulatorOptions_release_handle'));
final _sdkNavigationLocationsimulatoroptionsGetFieldspeedFactor = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulatorOptions_get_field_speedFactor'));
final _sdkNavigationLocationsimulatoroptionsGetFieldnotificationIntervalInMilliseconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulatorOptions_get_field_notificationIntervalInMilliseconds'));
final _sdkNavigationLocationsimulatoroptionsGetFieldnotificationInterval = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulatorOptions_get_field_notificationInterval'));



Pointer<Void> sdkNavigationLocationsimulatoroptionsToFfi(LocationSimulatorOptions value) {
  final _speedFactorHandle = (value.speedFactor);
  final _notificationIntervalInMillisecondsHandle = (value.notificationIntervalInMilliseconds);
  final _notificationIntervalHandle = durationToFfi(value.notificationInterval);
  final _result = _sdkNavigationLocationsimulatoroptionsCreateHandle(_speedFactorHandle, _notificationIntervalInMillisecondsHandle, _notificationIntervalHandle);
  
  
  durationReleaseFfiHandle(_notificationIntervalHandle);
  return _result;
}

LocationSimulatorOptions sdkNavigationLocationsimulatoroptionsFromFfi(Pointer<Void> handle) {
  final _speedFactorHandle = _sdkNavigationLocationsimulatoroptionsGetFieldspeedFactor(handle);
  final _notificationIntervalInMillisecondsHandle = _sdkNavigationLocationsimulatoroptionsGetFieldnotificationIntervalInMilliseconds(handle);
  final _notificationIntervalHandle = _sdkNavigationLocationsimulatoroptionsGetFieldnotificationInterval(handle);
  try {
    return LocationSimulatorOptions._(
      (_speedFactorHandle), 
      (_notificationIntervalInMillisecondsHandle), 
      durationFromFfi(_notificationIntervalHandle)
    );
  } finally {
    
    
    durationReleaseFfiHandle(_notificationIntervalHandle);
  }
}

void sdkNavigationLocationsimulatoroptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationLocationsimulatoroptionsReleaseHandle(handle);

// Nullable LocationSimulatorOptions

final _sdkNavigationLocationsimulatoroptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulatorOptions_create_handle_nullable'));
final _sdkNavigationLocationsimulatoroptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulatorOptions_release_handle_nullable'));
final _sdkNavigationLocationsimulatoroptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocationSimulatorOptions_get_value_nullable'));

Pointer<Void> sdkNavigationLocationsimulatoroptionsToFfiNullable(LocationSimulatorOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationLocationsimulatoroptionsToFfi(value);
  final result = _sdkNavigationLocationsimulatoroptionsCreateHandleNullable(_handle);
  sdkNavigationLocationsimulatoroptionsReleaseFfiHandle(_handle);
  return result;
}

LocationSimulatorOptions? sdkNavigationLocationsimulatoroptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationLocationsimulatoroptionsGetValueNullable(handle);
  final result = sdkNavigationLocationsimulatoroptionsFromFfi(_handle);
  sdkNavigationLocationsimulatoroptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationLocationsimulatoroptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationLocationsimulatoroptionsReleaseHandleNullable(handle);

// End of LocationSimulatorOptions "private" section.


