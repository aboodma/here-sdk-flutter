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

/// Indicates the type of the maneuver notification.
enum ManeuverNotificationType {
    /// The farthest possible maneuver notification.
    range,
    /// Reminder about the maneuver.
    reminder,
    /// Second reminder including the distance to the maneuver.
    distance,
    /// Last notification before the maneuver indicating the action that should be taken.
    action
}

// ManeuverNotificationType "private" section, not exported.

int sdkNavigationManeuvernotificationtypeToFfi(ManeuverNotificationType value) {
  switch (value) {
  case ManeuverNotificationType.range:
    return 0;
  case ManeuverNotificationType.reminder:
    return 1;
  case ManeuverNotificationType.distance:
    return 2;
  case ManeuverNotificationType.action:
    return 3;
  default:
    throw StateError("Invalid enum value $value for ManeuverNotificationType enum.");
  }
}

ManeuverNotificationType sdkNavigationManeuvernotificationtypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ManeuverNotificationType.range;
  case 1:
    return ManeuverNotificationType.reminder;
  case 2:
    return ManeuverNotificationType.distance;
  case 3:
    return ManeuverNotificationType.action;
  default:
    throw StateError("Invalid numeric value $handle for ManeuverNotificationType enum.");
  }
}

void sdkNavigationManeuvernotificationtypeReleaseFfiHandle(int handle) {}

final _sdkNavigationManeuvernotificationtypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_ManeuverNotificationType_create_handle_nullable'));
final _sdkNavigationManeuvernotificationtypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationType_release_handle_nullable'));
final _sdkNavigationManeuvernotificationtypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationType_get_value_nullable'));

Pointer<Void> sdkNavigationManeuvernotificationtypeToFfiNullable(ManeuverNotificationType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationManeuvernotificationtypeToFfi(value);
  final result = _sdkNavigationManeuvernotificationtypeCreateHandleNullable(_handle);
  sdkNavigationManeuvernotificationtypeReleaseFfiHandle(_handle);
  return result;
}

ManeuverNotificationType? sdkNavigationManeuvernotificationtypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationManeuvernotificationtypeGetValueNullable(handle);
  final result = sdkNavigationManeuvernotificationtypeFromFfi(_handle);
  sdkNavigationManeuvernotificationtypeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationManeuvernotificationtypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationManeuvernotificationtypeReleaseHandleNullable(handle);

// End of ManeuverNotificationType "private" section.


