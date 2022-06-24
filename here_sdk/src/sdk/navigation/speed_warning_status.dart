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

/// This enum represents the status of the speed warning feature.
enum SpeedWarningStatus {
    /// Status when the current speed exceeded the speed limit (plus offset) for the current road segment.
    /// This status is followed by [SpeedWarningStatus.speedLimitRestored] once the driving
    /// speed is again below the speed limit (plus offset) for the current road segment.
    ///
    /// **Note:**
    /// The speed limit used to check this condition does not take into account any temporary special
    /// speed limit. See [SpeedLimitListener].
    speedLimitExceeded,
    /// Status where the current speed is again below the speed limit (plus offset) for the current road segment.
    /// This status is only possible after previously exceeding a speed limit.
    ///
    /// **Note:**
    /// The speed limit used to check this condition does not take into account any temporary special
    /// speed limit. See [SpeedLimitListener].
    speedLimitRestored
}

// SpeedWarningStatus "private" section, not exported.

int sdkNavigationSpeedwarningstatusToFfi(SpeedWarningStatus value) {
  switch (value) {
  case SpeedWarningStatus.speedLimitExceeded:
    return 0;
  case SpeedWarningStatus.speedLimitRestored:
    return 1;
  default:
    throw StateError("Invalid enum value $value for SpeedWarningStatus enum.");
  }
}

SpeedWarningStatus sdkNavigationSpeedwarningstatusFromFfi(int handle) {
  switch (handle) {
  case 0:
    return SpeedWarningStatus.speedLimitExceeded;
  case 1:
    return SpeedWarningStatus.speedLimitRestored;
  default:
    throw StateError("Invalid numeric value $handle for SpeedWarningStatus enum.");
  }
}

void sdkNavigationSpeedwarningstatusReleaseFfiHandle(int handle) {}

final _sdkNavigationSpeedwarningstatusCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_SpeedWarningStatus_create_handle_nullable'));
final _sdkNavigationSpeedwarningstatusReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedWarningStatus_release_handle_nullable'));
final _sdkNavigationSpeedwarningstatusGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedWarningStatus_get_value_nullable'));

Pointer<Void> sdkNavigationSpeedwarningstatusToFfiNullable(SpeedWarningStatus? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationSpeedwarningstatusToFfi(value);
  final result = _sdkNavigationSpeedwarningstatusCreateHandleNullable(_handle);
  sdkNavigationSpeedwarningstatusReleaseFfiHandle(_handle);
  return result;
}

SpeedWarningStatus? sdkNavigationSpeedwarningstatusFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationSpeedwarningstatusGetValueNullable(handle);
  final result = sdkNavigationSpeedwarningstatusFromFfi(_handle);
  sdkNavigationSpeedwarningstatusReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationSpeedwarningstatusReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpeedwarningstatusReleaseHandleNullable(handle);

// End of SpeedWarningStatus "private" section.


