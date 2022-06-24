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

/// Defines camera parameters that VisualNavigator uses to track the current position during visual guidance.

class CameraSettings {
  /// Camera distance to current location. The default value is 150.
  double cameraDistanceInMeters;

  /// Camera tilt with axis parallel to the ground. The default value is 50.
  double cameraTiltInDegrees;

  /// Optional fixed bearing, from true North (0 degrees) in clockwise direction. The valid range is \[0, 360]\.
  /// If set, it will prevent the map from rotating to the direction of travel. For example, a value of zero results
  /// in "north up" mode.
  /// Defaults to (null), which means the camera derives the
  /// bearing from the [Location], so that it points to the direction of travel.
  double? cameraBearingInDegrees;

  CameraSettings.withDefaults()
      : cameraDistanceInMeters = 150.0, cameraTiltInDegrees = 50.0, cameraBearingInDegrees = null;
  @Deprecated("Will be removed in v4.13.0. Please use CammeraSettings.withDefaults() instead.")
  CameraSettings(this.cameraDistanceInMeters, this.cameraTiltInDegrees, this.cameraBearingInDegrees);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CameraSettings) return false;
    CameraSettings _other = other;
    return cameraDistanceInMeters == _other.cameraDistanceInMeters &&
        cameraTiltInDegrees == _other.cameraTiltInDegrees &&
        cameraBearingInDegrees == _other.cameraBearingInDegrees;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + cameraDistanceInMeters.hashCode;
    result = 31 * result + cameraTiltInDegrees.hashCode;
    result = 31 * result + cameraBearingInDegrees.hashCode;
    return result;
  }
}


// CameraSettings "private" section, not exported.

final _sdkNavigationCamerasettingsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Pointer<Void>),
    Pointer<Void> Function(double, double, Pointer<Void>)
  >('here_sdk_sdk_navigation_CameraSettings_create_handle'));
final _sdkNavigationCamerasettingsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CameraSettings_release_handle'));
final _sdkNavigationCamerasettingsGetFieldcameraDistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CameraSettings_get_field_cameraDistanceInMeters'));
final _sdkNavigationCamerasettingsGetFieldcameraTiltInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CameraSettings_get_field_cameraTiltInDegrees'));
final _sdkNavigationCamerasettingsGetFieldcameraBearingInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CameraSettings_get_field_cameraBearingInDegrees'));



Pointer<Void> sdkNavigationCamerasettingsToFfi(CameraSettings value) {
  final _cameraDistanceInMetersHandle = (value.cameraDistanceInMeters);
  final _cameraTiltInDegreesHandle = (value.cameraTiltInDegrees);
  final _cameraBearingInDegreesHandle = doubleToFfiNullable(value.cameraBearingInDegrees);
  final _result = _sdkNavigationCamerasettingsCreateHandle(_cameraDistanceInMetersHandle, _cameraTiltInDegreesHandle, _cameraBearingInDegreesHandle);
  
  
  doubleReleaseFfiHandleNullable(_cameraBearingInDegreesHandle);
  return _result;
}

CameraSettings sdkNavigationCamerasettingsFromFfi(Pointer<Void> handle) {
  final _cameraDistanceInMetersHandle = _sdkNavigationCamerasettingsGetFieldcameraDistanceInMeters(handle);
  final _cameraTiltInDegreesHandle = _sdkNavigationCamerasettingsGetFieldcameraTiltInDegrees(handle);
  final _cameraBearingInDegreesHandle = _sdkNavigationCamerasettingsGetFieldcameraBearingInDegrees(handle);
  try {
    return CameraSettings(
      (_cameraDistanceInMetersHandle), 
      (_cameraTiltInDegreesHandle), 
      doubleFromFfiNullable(_cameraBearingInDegreesHandle)
    );
  } finally {
    
    
    doubleReleaseFfiHandleNullable(_cameraBearingInDegreesHandle);
  }
}

void sdkNavigationCamerasettingsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationCamerasettingsReleaseHandle(handle);

// Nullable CameraSettings

final _sdkNavigationCamerasettingsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CameraSettings_create_handle_nullable'));
final _sdkNavigationCamerasettingsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CameraSettings_release_handle_nullable'));
final _sdkNavigationCamerasettingsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CameraSettings_get_value_nullable'));

Pointer<Void> sdkNavigationCamerasettingsToFfiNullable(CameraSettings? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationCamerasettingsToFfi(value);
  final result = _sdkNavigationCamerasettingsCreateHandleNullable(_handle);
  sdkNavigationCamerasettingsReleaseFfiHandle(_handle);
  return result;
}

CameraSettings? sdkNavigationCamerasettingsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationCamerasettingsGetValueNullable(handle);
  final result = sdkNavigationCamerasettingsFromFfi(_handle);
  sdkNavigationCamerasettingsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationCamerasettingsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationCamerasettingsReleaseHandleNullable(handle);

// End of CameraSettings "private" section.


