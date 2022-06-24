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

/// Camera tracking mode.
///
/// Note: This mode has no effect until visual navigation rendering is started.
/// When visual navigation rendering is started _and_ this mode is disabled, then
/// the [MapCamera] will not be manipulated until this mode is enabled.
enum CameraTrackingMode {
    /// The map view camera will follow the current location using the bearing
    /// as provided by the [Location].
    enabled,
    /// Camera position control is disabled.
    disabled
}

// CameraTrackingMode "private" section, not exported.

int sdkNavigationCameratrackingmodeToFfi(CameraTrackingMode value) {
  switch (value) {
  case CameraTrackingMode.enabled:
    return 0;
  case CameraTrackingMode.disabled:
    return 1;
  default:
    throw StateError("Invalid enum value $value for CameraTrackingMode enum.");
  }
}

CameraTrackingMode sdkNavigationCameratrackingmodeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return CameraTrackingMode.enabled;
  case 1:
    return CameraTrackingMode.disabled;
  default:
    throw StateError("Invalid numeric value $handle for CameraTrackingMode enum.");
  }
}

void sdkNavigationCameratrackingmodeReleaseFfiHandle(int handle) {}

final _sdkNavigationCameratrackingmodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_CameraTrackingMode_create_handle_nullable'));
final _sdkNavigationCameratrackingmodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CameraTrackingMode_release_handle_nullable'));
final _sdkNavigationCameratrackingmodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CameraTrackingMode_get_value_nullable'));

Pointer<Void> sdkNavigationCameratrackingmodeToFfiNullable(CameraTrackingMode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationCameratrackingmodeToFfi(value);
  final result = _sdkNavigationCameratrackingmodeCreateHandleNullable(_handle);
  sdkNavigationCameratrackingmodeReleaseFfiHandle(_handle);
  return result;
}

CameraTrackingMode? sdkNavigationCameratrackingmodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationCameratrackingmodeGetValueNullable(handle);
  final result = sdkNavigationCameratrackingmodeFromFfi(_handle);
  sdkNavigationCameratrackingmodeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationCameratrackingmodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationCameratrackingmodeReleaseHandleNullable(handle);

// End of CameraTrackingMode "private" section.


