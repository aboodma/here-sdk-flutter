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

/// This struct provides all the information regarding an angular panning element, including the panning angle
/// and whether or not it is the last element on the spatial audio trajectory.

class SpatialTrajectoryData {
  /// The next azimuth value to be set on a spatial audio engine.
  double azimuthInDegrees;

  /// Indicates whether is the last element of the current spatial audio trajectory or not.
  bool completedSpatialTrajectory;

  SpatialTrajectoryData(this.azimuthInDegrees, this.completedSpatialTrajectory);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SpatialTrajectoryData) return false;
    SpatialTrajectoryData _other = other;
    return azimuthInDegrees == _other.azimuthInDegrees &&
        completedSpatialTrajectory == _other.completedSpatialTrajectory;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + azimuthInDegrees.hashCode;
    result = 31 * result + completedSpatialTrajectory.hashCode;
    return result;
  }
}


// SpatialTrajectoryData "private" section, not exported.

final _sdkNavigationSpatialtrajectorydataCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Uint8),
    Pointer<Void> Function(double, int)
  >('here_sdk_sdk_navigation_SpatialTrajectoryData_create_handle'));
final _sdkNavigationSpatialtrajectorydataReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialTrajectoryData_release_handle'));
final _sdkNavigationSpatialtrajectorydataGetFieldazimuthInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialTrajectoryData_get_field_azimuthInDegrees'));
final _sdkNavigationSpatialtrajectorydataGetFieldcompletedSpatialTrajectory = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialTrajectoryData_get_field_completedSpatialTrajectory'));



Pointer<Void> sdkNavigationSpatialtrajectorydataToFfi(SpatialTrajectoryData value) {
  final _azimuthInDegreesHandle = (value.azimuthInDegrees);
  final _completedSpatialTrajectoryHandle = booleanToFfi(value.completedSpatialTrajectory);
  final _result = _sdkNavigationSpatialtrajectorydataCreateHandle(_azimuthInDegreesHandle, _completedSpatialTrajectoryHandle);
  
  booleanReleaseFfiHandle(_completedSpatialTrajectoryHandle);
  return _result;
}

SpatialTrajectoryData sdkNavigationSpatialtrajectorydataFromFfi(Pointer<Void> handle) {
  final _azimuthInDegreesHandle = _sdkNavigationSpatialtrajectorydataGetFieldazimuthInDegrees(handle);
  final _completedSpatialTrajectoryHandle = _sdkNavigationSpatialtrajectorydataGetFieldcompletedSpatialTrajectory(handle);
  try {
    return SpatialTrajectoryData(
      (_azimuthInDegreesHandle), 
      booleanFromFfi(_completedSpatialTrajectoryHandle)
    );
  } finally {
    
    booleanReleaseFfiHandle(_completedSpatialTrajectoryHandle);
  }
}

void sdkNavigationSpatialtrajectorydataReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationSpatialtrajectorydataReleaseHandle(handle);

// Nullable SpatialTrajectoryData

final _sdkNavigationSpatialtrajectorydataCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialTrajectoryData_create_handle_nullable'));
final _sdkNavigationSpatialtrajectorydataReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialTrajectoryData_release_handle_nullable'));
final _sdkNavigationSpatialtrajectorydataGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialTrajectoryData_get_value_nullable'));

Pointer<Void> sdkNavigationSpatialtrajectorydataToFfiNullable(SpatialTrajectoryData? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationSpatialtrajectorydataToFfi(value);
  final result = _sdkNavigationSpatialtrajectorydataCreateHandleNullable(_handle);
  sdkNavigationSpatialtrajectorydataReleaseFfiHandle(_handle);
  return result;
}

SpatialTrajectoryData? sdkNavigationSpatialtrajectorydataFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationSpatialtrajectorydataGetValueNullable(handle);
  final result = sdkNavigationSpatialtrajectorydataFromFfi(_handle);
  sdkNavigationSpatialtrajectorydataReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationSpatialtrajectorydataReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpatialtrajectorydataReleaseHandleNullable(handle);

// End of SpatialTrajectoryData "private" section.


