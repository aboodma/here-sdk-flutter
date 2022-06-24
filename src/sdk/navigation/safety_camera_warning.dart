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
import 'package:here_sdk/src/sdk/navigation/distance_type.dart';
import 'package:here_sdk/src/sdk/navigation/safety_camera_type.dart';

/// A class that provides safety camera warning information.

class SafetyCameraWarning {
  /// Distance to the safety camera in meters
  double distanceToCameraInMeters;

  /// The speed limit observed by the safety camera
  double speedLimitInMetersPerSecond;

  /// The type of the safety camera element
  SafetyCameraType type;

  /// The distance type of the warning (e.g.: warning for a new safety camera ahead, warning for
  /// passing a safety camera)
  DistanceType distanceType;

  SafetyCameraWarning(this.distanceToCameraInMeters, this.speedLimitInMetersPerSecond, this.type, this.distanceType);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SafetyCameraWarning) return false;
    SafetyCameraWarning _other = other;
    return distanceToCameraInMeters == _other.distanceToCameraInMeters &&
        speedLimitInMetersPerSecond == _other.speedLimitInMetersPerSecond &&
        type == _other.type &&
        distanceType == _other.distanceType;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + distanceToCameraInMeters.hashCode;
    result = 31 * result + speedLimitInMetersPerSecond.hashCode;
    result = 31 * result + type.hashCode;
    result = 31 * result + distanceType.hashCode;
    return result;
  }
}


// SafetyCameraWarning "private" section, not exported.

final _sdkNavigationSafetycamerawarningCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Uint32, Uint32),
    Pointer<Void> Function(double, double, int, int)
  >('here_sdk_sdk_navigation_SafetyCameraWarning_create_handle'));
final _sdkNavigationSafetycamerawarningReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SafetyCameraWarning_release_handle'));
final _sdkNavigationSafetycamerawarningGetFielddistanceToCameraInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SafetyCameraWarning_get_field_distanceToCameraInMeters'));
final _sdkNavigationSafetycamerawarningGetFieldspeedLimitInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SafetyCameraWarning_get_field_speedLimitInMetersPerSecond'));
final _sdkNavigationSafetycamerawarningGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SafetyCameraWarning_get_field_type'));
final _sdkNavigationSafetycamerawarningGetFielddistanceType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SafetyCameraWarning_get_field_distanceType'));



Pointer<Void> sdkNavigationSafetycamerawarningToFfi(SafetyCameraWarning value) {
  final _distanceToCameraInMetersHandle = (value.distanceToCameraInMeters);
  final _speedLimitInMetersPerSecondHandle = (value.speedLimitInMetersPerSecond);
  final _typeHandle = sdkNavigationSafetycameratypeToFfi(value.type);
  final _distanceTypeHandle = sdkNavigationDistancetypeToFfi(value.distanceType);
  final _result = _sdkNavigationSafetycamerawarningCreateHandle(_distanceToCameraInMetersHandle, _speedLimitInMetersPerSecondHandle, _typeHandle, _distanceTypeHandle);
  
  
  sdkNavigationSafetycameratypeReleaseFfiHandle(_typeHandle);
  sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  return _result;
}

SafetyCameraWarning sdkNavigationSafetycamerawarningFromFfi(Pointer<Void> handle) {
  final _distanceToCameraInMetersHandle = _sdkNavigationSafetycamerawarningGetFielddistanceToCameraInMeters(handle);
  final _speedLimitInMetersPerSecondHandle = _sdkNavigationSafetycamerawarningGetFieldspeedLimitInMetersPerSecond(handle);
  final _typeHandle = _sdkNavigationSafetycamerawarningGetFieldtype(handle);
  final _distanceTypeHandle = _sdkNavigationSafetycamerawarningGetFielddistanceType(handle);
  try {
    return SafetyCameraWarning(
      (_distanceToCameraInMetersHandle), 
      (_speedLimitInMetersPerSecondHandle), 
      sdkNavigationSafetycameratypeFromFfi(_typeHandle), 
      sdkNavigationDistancetypeFromFfi(_distanceTypeHandle)
    );
  } finally {
    
    
    sdkNavigationSafetycameratypeReleaseFfiHandle(_typeHandle);
    sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  }
}

void sdkNavigationSafetycamerawarningReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationSafetycamerawarningReleaseHandle(handle);

// Nullable SafetyCameraWarning

final _sdkNavigationSafetycamerawarningCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SafetyCameraWarning_create_handle_nullable'));
final _sdkNavigationSafetycamerawarningReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SafetyCameraWarning_release_handle_nullable'));
final _sdkNavigationSafetycamerawarningGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SafetyCameraWarning_get_value_nullable'));

Pointer<Void> sdkNavigationSafetycamerawarningToFfiNullable(SafetyCameraWarning? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationSafetycamerawarningToFfi(value);
  final result = _sdkNavigationSafetycamerawarningCreateHandleNullable(_handle);
  sdkNavigationSafetycamerawarningReleaseFfiHandle(_handle);
  return result;
}

SafetyCameraWarning? sdkNavigationSafetycamerawarningFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationSafetycamerawarningGetValueNullable(handle);
  final result = sdkNavigationSafetycamerawarningFromFfi(_handle);
  sdkNavigationSafetycamerawarningReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationSafetycamerawarningReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSafetycamerawarningReleaseHandleNullable(handle);

// End of SafetyCameraWarning "private" section.


