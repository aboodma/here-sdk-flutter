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

/// Indicates the desired location accuracy, however the actual accuracy is not
/// guaranteed.
///
/// When requesting high-accuracy locations, the initial update delivered
/// by the LocationEngine may not have the requested accuracy. Requesting higher
/// accuracy location updates usually means higher power consumption, therefore
/// you should use the lowest accuracy suitable for your use case to preserve the
/// device battery.
enum LocationAccuracy {
    bestAvailable,
    /// Decimeter accurate navigation using satellite and WiFi positioning.
    /// Additional sensor data may be used for improving positioning accuracy.
    /// Update frequency is as close to once per second as possible.
    /// This feature requires Android 12 or later and dual frequency GNSS receiver and raw GNSS measurements.
    /// This feature is disabled by default: [Contact us](https://www.here.com/platform/positioning) to enable it.
    /// If it is not enabled or the OS/device requirements are not met, fallback to other positioning technologies may occur and desired accuracy level may not be reached.
    ///
    /// Not supported in iOS.
    subMeterNavigation,
    navigation,
    /// Accurate to within tens of meters of the desired target.
    tensOfMeters,
    /// Accurate to within hundreds of meters of the desired target.
    hundredsOfMeters,
    /// Accurate to within kilometers of the desired target.
    kilometers
}

// LocationAccuracy "private" section, not exported.

int sdkLocationLocationaccuracyToFfi(LocationAccuracy value) {
  switch (value) {
  case LocationAccuracy.bestAvailable:
    return 0;
  case LocationAccuracy.subMeterNavigation:
    return 1;
  case LocationAccuracy.navigation:
    return 2;
  case LocationAccuracy.tensOfMeters:
    return 3;
  case LocationAccuracy.hundredsOfMeters:
    return 4;
  case LocationAccuracy.kilometers:
    return 5;
  default:
    throw StateError("Invalid enum value $value for LocationAccuracy enum.");
  }
}

LocationAccuracy sdkLocationLocationaccuracyFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LocationAccuracy.bestAvailable;
  case 1:
    return LocationAccuracy.subMeterNavigation;
  case 2:
    return LocationAccuracy.navigation;
  case 3:
    return LocationAccuracy.tensOfMeters;
  case 4:
    return LocationAccuracy.hundredsOfMeters;
  case 5:
    return LocationAccuracy.kilometers;
  default:
    throw StateError("Invalid numeric value $handle for LocationAccuracy enum.");
  }
}

void sdkLocationLocationaccuracyReleaseFfiHandle(int handle) {}

final _sdkLocationLocationaccuracyCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_location_LocationAccuracy_create_handle_nullable'));
final _sdkLocationLocationaccuracyReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationAccuracy_release_handle_nullable'));
final _sdkLocationLocationaccuracyGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationAccuracy_get_value_nullable'));

Pointer<Void> sdkLocationLocationaccuracyToFfiNullable(LocationAccuracy? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkLocationLocationaccuracyToFfi(value);
  final result = _sdkLocationLocationaccuracyCreateHandleNullable(_handle);
  sdkLocationLocationaccuracyReleaseFfiHandle(_handle);
  return result;
}

LocationAccuracy? sdkLocationLocationaccuracyFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkLocationLocationaccuracyGetValueNullable(handle);
  final result = sdkLocationLocationaccuracyFromFfi(_handle);
  sdkLocationLocationaccuracyReleaseFfiHandle(_handle);
  return result;
}

void sdkLocationLocationaccuracyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationLocationaccuracyReleaseHandleNullable(handle);

// End of LocationAccuracy "private" section.


