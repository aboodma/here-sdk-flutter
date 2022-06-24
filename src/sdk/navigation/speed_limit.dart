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
import 'package:meta/meta.dart';


/// Represents the speed limit of the current road.
///
/// Speed limits that are described as conditional can be time-dependent. For time-dependent speed limits,
/// the HERE SDK internally reads the current device time and notifies only on speed limits
/// that are currently active.

class SpeedLimit {
  /// Regular speed limit if available. In case of unbounded speed limit, the value is zero.
  ///
  /// **Note:**
  /// Currently only car and truck speed limits are in use.
  /// Speed limits for others transport modes are not taken into account yet.
  double? speedLimitInMetersPerSecond;

  /// A recommended speed limit that may not be indicated on the local road signs,
  /// but that serves to warn a driver that the road conditions may indicate a lower speed.
  /// Typically, the road condition is a curved road or a ramp but it may be due to a narrow road,
  /// narrow bridge, intersecting road, drainage dip, etc. In some cases, the advisory sign is on a
  /// different road than the one for which it applies (this can happen with ramps). In this case,
  /// the advisory speed is indicated for the road for which it is intended, even if the sign is
  /// further than 50 meters from the particular road.
  /// - Advisory speed signs due to construction are not included.
  /// - A speed value is published for advisory signs.
  ///
  /// A possible usage example can be to show an icon on the device's screen containing both
  /// special speed limit value and a visual cue in order to warn the user about the conditional
  /// speed limit.
  double? advisorySpeedLimitInMetersPerSecond;

  /// A conditional speed limit as indicated on the local road signs.
  /// The road speed limit that is in effect only when there is snow on the road.
  ///
  /// A possible usage example can be to show an icon on the device's screen containing both
  /// special speed limit value and a visual cue in order to warn the user about the conditional
  /// speed limit.
  double? snowSpeedLimitInMetersPerSecond;

  /// A conditional speed limit as indicated on the local road signs.
  /// The road speed limit that is in effect only when it is raining or there is water on the road.
  ///
  /// A possible usage example can be to show an icon on the device's screen containing both
  /// special speed limit value and a visual cue in order to warn the user about the conditional
  /// speed limit.
  double? rainSpeedLimitInMetersPerSecond;

  /// A conditional speed limit as indicated on the local road signs.
  /// The road speed limit that is in effect only when the visibility decreases due to fog.
  ///
  /// A possible usage example can be to show an icon on the device's screen containing both
  /// special speed limit value and a visual cue in order to warn the user about the conditional
  /// speed limit.
  double? fogSpeedLimitInMetersPerSecond;

  /// A conditional speed limit as indicated on the local road signs.
  /// The road speed limit that is in effect only when the visibility is optimal due to weather
  /// conditions.
  ///
  /// A possible usage example can be to show an icon on the device's screen containing both
  /// special speed limit value and a visual cue in order to warn the user about the conditional
  /// speed limit.
  ///
  /// **Note:**
  /// This speed limit is conditioned by factors not expressed by the other ones.
  /// For example, it may be a time-related speed limit or a vehicle-related one.
  double? optimalWeatherSpeedLimitInMetersPerSecond;

  /// A conditional speed limit as indicated on the local road signs.
  /// School zone signs are often placed to slow drivers before reaching an intersection where
  /// children are crossing.
  ///
  /// A possible usage example can be to show an icon on the device's screen containing both
  /// special speed limit value and a visual cue in order to warn the user about the conditional
  /// speed limit.
  double? schoolZoneSpeedLimitInMetersPerSecond;

  /// A conditional speed limit as indicated on the local road signs.
  /// Speed limit that is in effect considering the current local time provided by the device's
  /// clock.
  double? timeDependentSpeedLimitInMetersPerSecond;

  SpeedLimit.withDefaults()
      : speedLimitInMetersPerSecond = null, advisorySpeedLimitInMetersPerSecond = null, snowSpeedLimitInMetersPerSecond = null, rainSpeedLimitInMetersPerSecond = null, fogSpeedLimitInMetersPerSecond = null, optimalWeatherSpeedLimitInMetersPerSecond = null, schoolZoneSpeedLimitInMetersPerSecond = null, timeDependentSpeedLimitInMetersPerSecond = null;
  @Deprecated("Will be removed in v4.13.0. Please use `withDefaults()` constructor instead.")
  SpeedLimit(this.speedLimitInMetersPerSecond, this.advisorySpeedLimitInMetersPerSecond, this.snowSpeedLimitInMetersPerSecond, this.rainSpeedLimitInMetersPerSecond, this.fogSpeedLimitInMetersPerSecond, this.optimalWeatherSpeedLimitInMetersPerSecond, this.schoolZoneSpeedLimitInMetersPerSecond, this.timeDependentSpeedLimitInMetersPerSecond);
  /// Returns the effective (lowest) speed limit between [SpeedLimit.speedLimitInMetersPerSecond],
  /// [SpeedLimit.schoolZoneSpeedLimitInMetersPerSecond], [SpeedLimit.timeDependentSpeedLimitInMetersPerSecond]
  /// and [SpeedLimit.optimalWeatherSpeedLimitInMetersPerSecond].
  ///
  /// Returns [double?]. Returns the lowest value between: [SpeedLimit.speedLimitInMetersPerSecond],
  /// [SpeedLimit.schoolZoneSpeedLimitInMetersPerSecond], [SpeedLimit.timeDependentSpeedLimitInMetersPerSecond]
  /// and [SpeedLimit.optimalWeatherSpeedLimitInMetersPerSecond].
  ///
  double? effectiveSpeedLimitInMetersPerSecond() => $prototype.effectiveSpeedLimitInMetersPerSecond(this);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SpeedLimit) return false;
    SpeedLimit _other = other;
    return speedLimitInMetersPerSecond == _other.speedLimitInMetersPerSecond &&
        advisorySpeedLimitInMetersPerSecond == _other.advisorySpeedLimitInMetersPerSecond &&
        snowSpeedLimitInMetersPerSecond == _other.snowSpeedLimitInMetersPerSecond &&
        rainSpeedLimitInMetersPerSecond == _other.rainSpeedLimitInMetersPerSecond &&
        fogSpeedLimitInMetersPerSecond == _other.fogSpeedLimitInMetersPerSecond &&
        optimalWeatherSpeedLimitInMetersPerSecond == _other.optimalWeatherSpeedLimitInMetersPerSecond &&
        schoolZoneSpeedLimitInMetersPerSecond == _other.schoolZoneSpeedLimitInMetersPerSecond &&
        timeDependentSpeedLimitInMetersPerSecond == _other.timeDependentSpeedLimitInMetersPerSecond;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + speedLimitInMetersPerSecond.hashCode;
    result = 31 * result + advisorySpeedLimitInMetersPerSecond.hashCode;
    result = 31 * result + snowSpeedLimitInMetersPerSecond.hashCode;
    result = 31 * result + rainSpeedLimitInMetersPerSecond.hashCode;
    result = 31 * result + fogSpeedLimitInMetersPerSecond.hashCode;
    result = 31 * result + optimalWeatherSpeedLimitInMetersPerSecond.hashCode;
    result = 31 * result + schoolZoneSpeedLimitInMetersPerSecond.hashCode;
    result = 31 * result + timeDependentSpeedLimitInMetersPerSecond.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = SpeedLimit$Impl();
}


// SpeedLimit "private" section, not exported.

final _sdkNavigationSpeedlimitCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimit_create_handle'));
final _sdkNavigationSpeedlimitReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimit_release_handle'));
final _sdkNavigationSpeedlimitGetFieldspeedLimitInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimit_get_field_speedLimitInMetersPerSecond'));
final _sdkNavigationSpeedlimitGetFieldadvisorySpeedLimitInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimit_get_field_advisorySpeedLimitInMetersPerSecond'));
final _sdkNavigationSpeedlimitGetFieldsnowSpeedLimitInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimit_get_field_snowSpeedLimitInMetersPerSecond'));
final _sdkNavigationSpeedlimitGetFieldrainSpeedLimitInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimit_get_field_rainSpeedLimitInMetersPerSecond'));
final _sdkNavigationSpeedlimitGetFieldfogSpeedLimitInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimit_get_field_fogSpeedLimitInMetersPerSecond'));
final _sdkNavigationSpeedlimitGetFieldoptimalWeatherSpeedLimitInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimit_get_field_optimalWeatherSpeedLimitInMetersPerSecond'));
final _sdkNavigationSpeedlimitGetFieldschoolZoneSpeedLimitInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimit_get_field_schoolZoneSpeedLimitInMetersPerSecond'));
final _sdkNavigationSpeedlimitGetFieldtimeDependentSpeedLimitInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimit_get_field_timeDependentSpeedLimitInMetersPerSecond'));



/// @nodoc
@visibleForTesting
class SpeedLimit$Impl {
  double? effectiveSpeedLimitInMetersPerSecond(SpeedLimit $that) {
    final _effectiveSpeedLimitInMetersPerSecondFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_SpeedLimit_effectiveSpeedLimitInMetersPerSecond'));
    final _handle = sdkNavigationSpeedlimitToFfi($that);
    final __resultHandle = _effectiveSpeedLimitInMetersPerSecondFfi(_handle, __lib.LibraryContext.isolateId);
    sdkNavigationSpeedlimitReleaseFfiHandle(_handle);
    try {
      return doubleFromFfiNullable(__resultHandle);
    } finally {
      doubleReleaseFfiHandleNullable(__resultHandle);

    }

  }

}

Pointer<Void> sdkNavigationSpeedlimitToFfi(SpeedLimit value) {
  final _speedLimitInMetersPerSecondHandle = doubleToFfiNullable(value.speedLimitInMetersPerSecond);
  final _advisorySpeedLimitInMetersPerSecondHandle = doubleToFfiNullable(value.advisorySpeedLimitInMetersPerSecond);
  final _snowSpeedLimitInMetersPerSecondHandle = doubleToFfiNullable(value.snowSpeedLimitInMetersPerSecond);
  final _rainSpeedLimitInMetersPerSecondHandle = doubleToFfiNullable(value.rainSpeedLimitInMetersPerSecond);
  final _fogSpeedLimitInMetersPerSecondHandle = doubleToFfiNullable(value.fogSpeedLimitInMetersPerSecond);
  final _optimalWeatherSpeedLimitInMetersPerSecondHandle = doubleToFfiNullable(value.optimalWeatherSpeedLimitInMetersPerSecond);
  final _schoolZoneSpeedLimitInMetersPerSecondHandle = doubleToFfiNullable(value.schoolZoneSpeedLimitInMetersPerSecond);
  final _timeDependentSpeedLimitInMetersPerSecondHandle = doubleToFfiNullable(value.timeDependentSpeedLimitInMetersPerSecond);
  final _result = _sdkNavigationSpeedlimitCreateHandle(_speedLimitInMetersPerSecondHandle, _advisorySpeedLimitInMetersPerSecondHandle, _snowSpeedLimitInMetersPerSecondHandle, _rainSpeedLimitInMetersPerSecondHandle, _fogSpeedLimitInMetersPerSecondHandle, _optimalWeatherSpeedLimitInMetersPerSecondHandle, _schoolZoneSpeedLimitInMetersPerSecondHandle, _timeDependentSpeedLimitInMetersPerSecondHandle);
  doubleReleaseFfiHandleNullable(_speedLimitInMetersPerSecondHandle);
  doubleReleaseFfiHandleNullable(_advisorySpeedLimitInMetersPerSecondHandle);
  doubleReleaseFfiHandleNullable(_snowSpeedLimitInMetersPerSecondHandle);
  doubleReleaseFfiHandleNullable(_rainSpeedLimitInMetersPerSecondHandle);
  doubleReleaseFfiHandleNullable(_fogSpeedLimitInMetersPerSecondHandle);
  doubleReleaseFfiHandleNullable(_optimalWeatherSpeedLimitInMetersPerSecondHandle);
  doubleReleaseFfiHandleNullable(_schoolZoneSpeedLimitInMetersPerSecondHandle);
  doubleReleaseFfiHandleNullable(_timeDependentSpeedLimitInMetersPerSecondHandle);
  return _result;
}

SpeedLimit sdkNavigationSpeedlimitFromFfi(Pointer<Void> handle) {
  final _speedLimitInMetersPerSecondHandle = _sdkNavigationSpeedlimitGetFieldspeedLimitInMetersPerSecond(handle);
  final _advisorySpeedLimitInMetersPerSecondHandle = _sdkNavigationSpeedlimitGetFieldadvisorySpeedLimitInMetersPerSecond(handle);
  final _snowSpeedLimitInMetersPerSecondHandle = _sdkNavigationSpeedlimitGetFieldsnowSpeedLimitInMetersPerSecond(handle);
  final _rainSpeedLimitInMetersPerSecondHandle = _sdkNavigationSpeedlimitGetFieldrainSpeedLimitInMetersPerSecond(handle);
  final _fogSpeedLimitInMetersPerSecondHandle = _sdkNavigationSpeedlimitGetFieldfogSpeedLimitInMetersPerSecond(handle);
  final _optimalWeatherSpeedLimitInMetersPerSecondHandle = _sdkNavigationSpeedlimitGetFieldoptimalWeatherSpeedLimitInMetersPerSecond(handle);
  final _schoolZoneSpeedLimitInMetersPerSecondHandle = _sdkNavigationSpeedlimitGetFieldschoolZoneSpeedLimitInMetersPerSecond(handle);
  final _timeDependentSpeedLimitInMetersPerSecondHandle = _sdkNavigationSpeedlimitGetFieldtimeDependentSpeedLimitInMetersPerSecond(handle);
  try {
    return SpeedLimit(
      doubleFromFfiNullable(_speedLimitInMetersPerSecondHandle), 
      doubleFromFfiNullable(_advisorySpeedLimitInMetersPerSecondHandle), 
      doubleFromFfiNullable(_snowSpeedLimitInMetersPerSecondHandle), 
      doubleFromFfiNullable(_rainSpeedLimitInMetersPerSecondHandle), 
      doubleFromFfiNullable(_fogSpeedLimitInMetersPerSecondHandle), 
      doubleFromFfiNullable(_optimalWeatherSpeedLimitInMetersPerSecondHandle), 
      doubleFromFfiNullable(_schoolZoneSpeedLimitInMetersPerSecondHandle), 
      doubleFromFfiNullable(_timeDependentSpeedLimitInMetersPerSecondHandle)
    );
  } finally {
    doubleReleaseFfiHandleNullable(_speedLimitInMetersPerSecondHandle);
    doubleReleaseFfiHandleNullable(_advisorySpeedLimitInMetersPerSecondHandle);
    doubleReleaseFfiHandleNullable(_snowSpeedLimitInMetersPerSecondHandle);
    doubleReleaseFfiHandleNullable(_rainSpeedLimitInMetersPerSecondHandle);
    doubleReleaseFfiHandleNullable(_fogSpeedLimitInMetersPerSecondHandle);
    doubleReleaseFfiHandleNullable(_optimalWeatherSpeedLimitInMetersPerSecondHandle);
    doubleReleaseFfiHandleNullable(_schoolZoneSpeedLimitInMetersPerSecondHandle);
    doubleReleaseFfiHandleNullable(_timeDependentSpeedLimitInMetersPerSecondHandle);
  }
}

void sdkNavigationSpeedlimitReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationSpeedlimitReleaseHandle(handle);

// Nullable SpeedLimit

final _sdkNavigationSpeedlimitCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimit_create_handle_nullable'));
final _sdkNavigationSpeedlimitReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimit_release_handle_nullable'));
final _sdkNavigationSpeedlimitGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimit_get_value_nullable'));

Pointer<Void> sdkNavigationSpeedlimitToFfiNullable(SpeedLimit? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationSpeedlimitToFfi(value);
  final result = _sdkNavigationSpeedlimitCreateHandleNullable(_handle);
  sdkNavigationSpeedlimitReleaseFfiHandle(_handle);
  return result;
}

SpeedLimit? sdkNavigationSpeedlimitFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationSpeedlimitGetValueNullable(handle);
  final result = sdkNavigationSpeedlimitFromFfi(_handle);
  sdkNavigationSpeedlimitReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationSpeedlimitReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpeedlimitReleaseHandleNullable(handle);

// End of SpeedLimit "private" section.


