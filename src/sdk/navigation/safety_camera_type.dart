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

/// Indicates the type of the safety camera.
enum SafetyCameraType {
    /// Safety camera for checking drive on bus lane violation
    busLane,
    /// Safety camera for checking safe distance violation
    distance,
    /// Safety camera for checking red light violation
    redLight,
    /// Safety camera for checking red light violation and overspeed
    redLightAndSpeed,
    /// Safety camera for checking section end
    sectionEnd,
    /// Safety camera for checking section start
    sectionStart,
    /// Safety camera for checking overspeed
    speed
}

// SafetyCameraType "private" section, not exported.

int sdkNavigationSafetycameratypeToFfi(SafetyCameraType value) {
  switch (value) {
  case SafetyCameraType.busLane:
    return 0;
  case SafetyCameraType.distance:
    return 1;
  case SafetyCameraType.redLight:
    return 2;
  case SafetyCameraType.redLightAndSpeed:
    return 3;
  case SafetyCameraType.sectionEnd:
    return 4;
  case SafetyCameraType.sectionStart:
    return 5;
  case SafetyCameraType.speed:
    return 6;
  default:
    throw StateError("Invalid enum value $value for SafetyCameraType enum.");
  }
}

SafetyCameraType sdkNavigationSafetycameratypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return SafetyCameraType.busLane;
  case 1:
    return SafetyCameraType.distance;
  case 2:
    return SafetyCameraType.redLight;
  case 3:
    return SafetyCameraType.redLightAndSpeed;
  case 4:
    return SafetyCameraType.sectionEnd;
  case 5:
    return SafetyCameraType.sectionStart;
  case 6:
    return SafetyCameraType.speed;
  default:
    throw StateError("Invalid numeric value $handle for SafetyCameraType enum.");
  }
}

void sdkNavigationSafetycameratypeReleaseFfiHandle(int handle) {}

final _sdkNavigationSafetycameratypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_SafetyCameraType_create_handle_nullable'));
final _sdkNavigationSafetycameratypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SafetyCameraType_release_handle_nullable'));
final _sdkNavigationSafetycameratypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SafetyCameraType_get_value_nullable'));

Pointer<Void> sdkNavigationSafetycameratypeToFfiNullable(SafetyCameraType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationSafetycameratypeToFfi(value);
  final result = _sdkNavigationSafetycameratypeCreateHandleNullable(_handle);
  sdkNavigationSafetycameratypeReleaseFfiHandle(_handle);
  return result;
}

SafetyCameraType? sdkNavigationSafetycameratypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationSafetycameratypeGetValueNullable(handle);
  final result = sdkNavigationSafetycameratypeFromFfi(_handle);
  sdkNavigationSafetycameratypeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationSafetycameratypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSafetycameratypeReleaseHandleNullable(handle);

// End of SafetyCameraType "private" section.


