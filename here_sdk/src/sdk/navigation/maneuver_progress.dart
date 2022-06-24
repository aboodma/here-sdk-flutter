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

/// Indicates a user's progress to a [Maneuver].

class ManeuverProgress {
  /// Index of the [Maneuver] being traversed along the route.
  /// Defaults to 0.
  int maneuverIndex;

  /// The distance in meters from current location until the [Maneuver].
  /// Defaults to 0.
  int remainingDistanceInMeters;

  /// The estimated time in seconds for traversing the [Section]
  /// from current location until the [Maneuver] is reached,
  /// including traffic delays if available.
  /// Defaults to 0.
  @Deprecated("Will be removed in v4.13.0. Use [ManeuverProgress.remainingDuration] instead.")
  int remainingDurationInSeconds;

  /// The estimated time in seconds for traversing the [Section]
  /// from current location until the [Maneuver] is reached,
  /// including traffic delays if available.
  /// Defaults to 0 seconds.
  Duration remainingDuration;

  ManeuverProgress._(this.maneuverIndex, this.remainingDistanceInMeters, this.remainingDurationInSeconds, this.remainingDuration);
  @Deprecated("Will be removed in v4.13.0. Please use ManeuverProgress.withDefaults() instead.")
  ManeuverProgress(this.maneuverIndex, this.remainingDistanceInMeters, this.remainingDurationInSeconds)
      : remainingDuration = const Duration(seconds: 0);
  ManeuverProgress.withDefaults()
      : maneuverIndex = 0, remainingDistanceInMeters = 0, remainingDurationInSeconds = 0, remainingDuration = const Duration(seconds: 0);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ManeuverProgress) return false;
    ManeuverProgress _other = other;
    return maneuverIndex == _other.maneuverIndex &&
        remainingDistanceInMeters == _other.remainingDistanceInMeters &&
        remainingDurationInSeconds == _other.remainingDurationInSeconds &&
        remainingDuration == _other.remainingDuration;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + maneuverIndex.hashCode;
    result = 31 * result + remainingDistanceInMeters.hashCode;
    result = 31 * result + remainingDurationInSeconds.hashCode;
    result = 31 * result + remainingDuration.hashCode;
    return result;
  }
}


// ManeuverProgress "private" section, not exported.

final _sdkNavigationManeuverprogressCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Int32, Int32, Uint64),
    Pointer<Void> Function(int, int, int, int)
  >('here_sdk_sdk_navigation_ManeuverProgress_create_handle'));
final _sdkNavigationManeuverprogressReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverProgress_release_handle'));
final _sdkNavigationManeuverprogressGetFieldmaneuverIndex = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverProgress_get_field_maneuverIndex'));
final _sdkNavigationManeuverprogressGetFieldremainingDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverProgress_get_field_remainingDistanceInMeters'));
final _sdkNavigationManeuverprogressGetFieldremainingDurationInSeconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverProgress_get_field_remainingDurationInSeconds'));
final _sdkNavigationManeuverprogressGetFieldremainingDuration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverProgress_get_field_remainingDuration'));



Pointer<Void> sdkNavigationManeuverprogressToFfi(ManeuverProgress value) {
  final _maneuverIndexHandle = (value.maneuverIndex);
  final _remainingDistanceInMetersHandle = (value.remainingDistanceInMeters);
  final _remainingDurationInSecondsHandle = (value.remainingDurationInSeconds);
  final _remainingDurationHandle = durationToFfi(value.remainingDuration);
  final _result = _sdkNavigationManeuverprogressCreateHandle(_maneuverIndexHandle, _remainingDistanceInMetersHandle, _remainingDurationInSecondsHandle, _remainingDurationHandle);
  
  
  
  durationReleaseFfiHandle(_remainingDurationHandle);
  return _result;
}

ManeuverProgress sdkNavigationManeuverprogressFromFfi(Pointer<Void> handle) {
  final _maneuverIndexHandle = _sdkNavigationManeuverprogressGetFieldmaneuverIndex(handle);
  final _remainingDistanceInMetersHandle = _sdkNavigationManeuverprogressGetFieldremainingDistanceInMeters(handle);
  final _remainingDurationInSecondsHandle = _sdkNavigationManeuverprogressGetFieldremainingDurationInSeconds(handle);
  final _remainingDurationHandle = _sdkNavigationManeuverprogressGetFieldremainingDuration(handle);
  try {
    return ManeuverProgress._(
      (_maneuverIndexHandle), 
      (_remainingDistanceInMetersHandle), 
      (_remainingDurationInSecondsHandle), 
      durationFromFfi(_remainingDurationHandle)
    );
  } finally {
    
    
    
    durationReleaseFfiHandle(_remainingDurationHandle);
  }
}

void sdkNavigationManeuverprogressReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationManeuverprogressReleaseHandle(handle);

// Nullable ManeuverProgress

final _sdkNavigationManeuverprogressCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverProgress_create_handle_nullable'));
final _sdkNavigationManeuverprogressReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverProgress_release_handle_nullable'));
final _sdkNavigationManeuverprogressGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverProgress_get_value_nullable'));

Pointer<Void> sdkNavigationManeuverprogressToFfiNullable(ManeuverProgress? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationManeuverprogressToFfi(value);
  final result = _sdkNavigationManeuverprogressCreateHandleNullable(_handle);
  sdkNavigationManeuverprogressReleaseFfiHandle(_handle);
  return result;
}

ManeuverProgress? sdkNavigationManeuverprogressFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationManeuverprogressGetValueNullable(handle);
  final result = sdkNavigationManeuverprogressFromFfi(_handle);
  sdkNavigationManeuverprogressReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationManeuverprogressReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationManeuverprogressReleaseHandleNullable(handle);

// End of ManeuverProgress "private" section.


