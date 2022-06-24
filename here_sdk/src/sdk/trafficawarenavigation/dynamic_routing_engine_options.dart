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

/// Options defining the behavior of the [DynamicRoutingEngine].
///
/// When at least one check passes: the [DynamicRoutingEngineListener] is notified.
/// When at least one has a value of 0: on each new calculation the [DynamicRoutingEngineListener] is notified.

class DynamicRoutingEngineOptions {
  /// The poll interval in minutes.
  /// A value of 0 triggers a route calculation with each position update.
  /// Triggered via [DynamicRoutingEngine.updateCurrentLocation]
  /// Defaults to 15.
  @Deprecated("Will be removed in v4.13.0. Use [DynamicRoutingEngineOptions.pollInterval] instead.")
  int pollIntervalInMinutes;

  /// The minimum time difference, before notifying the [DynamicRoutingEngineListener].
  /// To get notified, the following check must be true:
  /// oldEstimatedTimeOfArrival - newEstimatedTimeOfArrival > [DynamicRoutingEngineOptions.minTimeDifferenceInSeconds].
  /// A value of 0 will notify the [DynamicRoutingEngineListener] with each calculated route.
  /// Defauts to `null`.
  @Deprecated("Will be removed in v4.13.0. Use [DynamicRoutingEngineOptions.minTimeDifference] instead.")
  int? minTimeDifferenceInSeconds;

  /// The value is in the range of \[0, 1\] over the remaining \(current position to next waypoint\)
  /// To get notified, the following check must be true:
  /// oldEstimatedTimeOfArrival - newEstimatedTimeOfArrival >= newRouteDuration * [min_time_difference_percentage].
  /// Defauts to `null`.
  double? minTimeDifferencePercentage;

  /// The minimum time difference, before notifying the [DynamicRoutingEngineListener].
  /// To get notified, the following check must be true:
  /// oldEstimatedTimeOfArrival - newEstimatedTimeOfArrival > [DynamicRoutingEngineOptions.minTimeDifference].
  /// A value of 0 will notify the [DynamicRoutingEngineListener] with each calculated route.
  /// Defauts to `null`.
  Duration? minTimeDifference;

  /// The poll interval.
  /// Zero duration triggers a route calculation with each position update.
  /// Triggered via [DynamicRoutingEngine.updateCurrentLocation]
  /// Defaults to 15 minutes.
  Duration pollInterval;

  /// Creates an instance of this class.

  /// [pollIntervalInMinutes] The poll interval in minutes.
  /// A value of 0 triggers a route calculation with each position update.
  /// Triggered via [DynamicRoutingEngine.updateCurrentLocation]
  /// Defaults to 15.

  /// [minTimeDifferenceInSeconds] The minimum time difference, before notifying the [DynamicRoutingEngineListener].
  /// To get notified, the following check must be true:
  /// oldEstimatedTimeOfArrival - newEstimatedTimeOfArrival > [DynamicRoutingEngineOptions.minTimeDifferenceInSeconds].
  /// A value of 0 will notify the [DynamicRoutingEngineListener] with each calculated route.
  /// Defauts to `null`.

  /// [minTimeDifferencePercentage] The value is in the range of \[0, 1\] over the remaining \(current position to next waypoint\)
  /// To get notified, the following check must be true:
  /// oldEstimatedTimeOfArrival - newEstimatedTimeOfArrival >= newRouteDuration * [min_time_difference_percentage].
  /// Defauts to `null`.

  /// [minTimeDifference] The minimum time difference, before notifying the [DynamicRoutingEngineListener].
  /// To get notified, the following check must be true:
  /// oldEstimatedTimeOfArrival - newEstimatedTimeOfArrival > [DynamicRoutingEngineOptions.minTimeDifference].
  /// A value of 0 will notify the [DynamicRoutingEngineListener] with each calculated route.
  /// Defauts to `null`.

  /// [pollInterval] The poll interval.
  /// Zero duration triggers a route calculation with each position update.
  /// Triggered via [DynamicRoutingEngine.updateCurrentLocation]
  /// Defaults to 15 minutes.

  DynamicRoutingEngineOptions._(this.pollIntervalInMinutes, this.minTimeDifferenceInSeconds, this.minTimeDifferencePercentage, this.minTimeDifference, this.pollInterval);
  /// Creates an instance of this class.
  DynamicRoutingEngineOptions.withAllDefaults()
      : pollIntervalInMinutes = 15, minTimeDifferenceInSeconds = null, minTimeDifferencePercentage = null, minTimeDifference = null, pollInterval = const Duration(minutes: 15);
  /// Creates an instance of this class.
  /// [minTimeDifferenceInSeconds] The minimum time difference, before notifying the [DynamicRoutingEngineListener].
  /// To get notified, the following check must be true:
  /// oldEstimatedTimeOfArrival - newEstimatedTimeOfArrival > [DynamicRoutingEngineOptions.minTimeDifferenceInSeconds].
  /// A value of 0 will notify the [DynamicRoutingEngineListener] with each calculated route.
  /// Defauts to `null`.
  /// [minTimeDifferencePercentage] The value is in the range of \[0, 1\] over the remaining \(current position to next waypoint\)
  /// To get notified, the following check must be true:
  /// oldEstimatedTimeOfArrival - newEstimatedTimeOfArrival >= newRouteDuration * [min_time_difference_percentage].
  /// Defauts to `null`.
  @Deprecated("Will be removed in v4.13.0. Please use DynamicRoutingEngineOptions.withAllDefaults() instead.")
  DynamicRoutingEngineOptions.withDefaults(this.minTimeDifferenceInSeconds, this.minTimeDifferencePercentage)
      : pollIntervalInMinutes = 15, minTimeDifference = null, pollInterval = const Duration(minutes: 15);
  /// Creates an instance of this class.
  /// [pollIntervalInMinutes] The poll interval in minutes.
  /// A value of 0 triggers a route calculation with each position update.
  /// Triggered via [DynamicRoutingEngine.updateCurrentLocation]
  /// Defaults to 15.
  /// [minTimeDifferenceInSeconds] The minimum time difference, before notifying the [DynamicRoutingEngineListener].
  /// To get notified, the following check must be true:
  /// oldEstimatedTimeOfArrival - newEstimatedTimeOfArrival > [DynamicRoutingEngineOptions.minTimeDifferenceInSeconds].
  /// A value of 0 will notify the [DynamicRoutingEngineListener] with each calculated route.
  /// Defauts to `null`.
  /// [minTimeDifferencePercentage] The value is in the range of \[0, 1\] over the remaining \(current position to next waypoint\)
  /// To get notified, the following check must be true:
  /// oldEstimatedTimeOfArrival - newEstimatedTimeOfArrival >= newRouteDuration * [min_time_difference_percentage].
  /// Defauts to `null`.
  @Deprecated("Will be removed in v4.13.0. Please use DynamicRoutingEngineOptions.withAllDefaults() instead.")
  DynamicRoutingEngineOptions(this.pollIntervalInMinutes, this.minTimeDifferenceInSeconds, this.minTimeDifferencePercentage)
      : minTimeDifference = null, pollInterval = const Duration(minutes: 15);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DynamicRoutingEngineOptions) return false;
    DynamicRoutingEngineOptions _other = other;
    return pollIntervalInMinutes == _other.pollIntervalInMinutes &&
        minTimeDifferenceInSeconds == _other.minTimeDifferenceInSeconds &&
        minTimeDifferencePercentage == _other.minTimeDifferencePercentage &&
        minTimeDifference == _other.minTimeDifference &&
        pollInterval == _other.pollInterval;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + pollIntervalInMinutes.hashCode;
    result = 31 * result + minTimeDifferenceInSeconds.hashCode;
    result = 31 * result + minTimeDifferencePercentage.hashCode;
    result = 31 * result + minTimeDifference.hashCode;
    result = 31 * result + pollInterval.hashCode;
    return result;
  }
}


// DynamicRoutingEngineOptions "private" section, not exported.

final _sdkTrafficawarenavigationDynamicroutingengineoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint64),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineOptions_create_handle'));
final _sdkTrafficawarenavigationDynamicroutingengineoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineOptions_release_handle'));
final _sdkTrafficawarenavigationDynamicroutingengineoptionsGetFieldpollIntervalInMinutes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineOptions_get_field_pollIntervalInMinutes'));
final _sdkTrafficawarenavigationDynamicroutingengineoptionsGetFieldminTimeDifferenceInSeconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineOptions_get_field_minTimeDifferenceInSeconds'));
final _sdkTrafficawarenavigationDynamicroutingengineoptionsGetFieldminTimeDifferencePercentage = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineOptions_get_field_minTimeDifferencePercentage'));
final _sdkTrafficawarenavigationDynamicroutingengineoptionsGetFieldminTimeDifference = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineOptions_get_field_minTimeDifference'));
final _sdkTrafficawarenavigationDynamicroutingengineoptionsGetFieldpollInterval = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineOptions_get_field_pollInterval'));



Pointer<Void> sdkTrafficawarenavigationDynamicroutingengineoptionsToFfi(DynamicRoutingEngineOptions value) {
  final _pollIntervalInMinutesHandle = (value.pollIntervalInMinutes);
  final _minTimeDifferenceInSecondsHandle = intToFfiNullable(value.minTimeDifferenceInSeconds);
  final _minTimeDifferencePercentageHandle = doubleToFfiNullable(value.minTimeDifferencePercentage);
  final _minTimeDifferenceHandle = durationToFfiNullable(value.minTimeDifference);
  final _pollIntervalHandle = durationToFfi(value.pollInterval);
  final _result = _sdkTrafficawarenavigationDynamicroutingengineoptionsCreateHandle(_pollIntervalInMinutesHandle, _minTimeDifferenceInSecondsHandle, _minTimeDifferencePercentageHandle, _minTimeDifferenceHandle, _pollIntervalHandle);
  
  intReleaseFfiHandleNullable(_minTimeDifferenceInSecondsHandle);
  doubleReleaseFfiHandleNullable(_minTimeDifferencePercentageHandle);
  durationReleaseFfiHandleNullable(_minTimeDifferenceHandle);
  durationReleaseFfiHandle(_pollIntervalHandle);
  return _result;
}

DynamicRoutingEngineOptions sdkTrafficawarenavigationDynamicroutingengineoptionsFromFfi(Pointer<Void> handle) {
  final _pollIntervalInMinutesHandle = _sdkTrafficawarenavigationDynamicroutingengineoptionsGetFieldpollIntervalInMinutes(handle);
  final _minTimeDifferenceInSecondsHandle = _sdkTrafficawarenavigationDynamicroutingengineoptionsGetFieldminTimeDifferenceInSeconds(handle);
  final _minTimeDifferencePercentageHandle = _sdkTrafficawarenavigationDynamicroutingengineoptionsGetFieldminTimeDifferencePercentage(handle);
  final _minTimeDifferenceHandle = _sdkTrafficawarenavigationDynamicroutingengineoptionsGetFieldminTimeDifference(handle);
  final _pollIntervalHandle = _sdkTrafficawarenavigationDynamicroutingengineoptionsGetFieldpollInterval(handle);
  try {
    return DynamicRoutingEngineOptions._(
      (_pollIntervalInMinutesHandle), 
      intFromFfiNullable(_minTimeDifferenceInSecondsHandle), 
      doubleFromFfiNullable(_minTimeDifferencePercentageHandle), 
      durationFromFfiNullable(_minTimeDifferenceHandle), 
      durationFromFfi(_pollIntervalHandle)
    );
  } finally {
    
    intReleaseFfiHandleNullable(_minTimeDifferenceInSecondsHandle);
    doubleReleaseFfiHandleNullable(_minTimeDifferencePercentageHandle);
    durationReleaseFfiHandleNullable(_minTimeDifferenceHandle);
    durationReleaseFfiHandle(_pollIntervalHandle);
  }
}

void sdkTrafficawarenavigationDynamicroutingengineoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkTrafficawarenavigationDynamicroutingengineoptionsReleaseHandle(handle);

// Nullable DynamicRoutingEngineOptions

final _sdkTrafficawarenavigationDynamicroutingengineoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineOptions_create_handle_nullable'));
final _sdkTrafficawarenavigationDynamicroutingengineoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineOptions_release_handle_nullable'));
final _sdkTrafficawarenavigationDynamicroutingengineoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_trafficawarenavigation_DynamicRoutingEngineOptions_get_value_nullable'));

Pointer<Void> sdkTrafficawarenavigationDynamicroutingengineoptionsToFfiNullable(DynamicRoutingEngineOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTrafficawarenavigationDynamicroutingengineoptionsToFfi(value);
  final result = _sdkTrafficawarenavigationDynamicroutingengineoptionsCreateHandleNullable(_handle);
  sdkTrafficawarenavigationDynamicroutingengineoptionsReleaseFfiHandle(_handle);
  return result;
}

DynamicRoutingEngineOptions? sdkTrafficawarenavigationDynamicroutingengineoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTrafficawarenavigationDynamicroutingengineoptionsGetValueNullable(handle);
  final result = sdkTrafficawarenavigationDynamicroutingengineoptionsFromFfi(_handle);
  sdkTrafficawarenavigationDynamicroutingengineoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkTrafficawarenavigationDynamicroutingengineoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficawarenavigationDynamicroutingengineoptionsReleaseHandleNullable(handle);

// End of DynamicRoutingEngineOptions "private" section.


