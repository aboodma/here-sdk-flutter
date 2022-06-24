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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/navigation/lane.dart';

/// A class that provides lane assistance information for the next maneuver(s).
///
/// During turn-by-turn navigation lane assistance can help a driver to choose the recommended lanes
/// in order to complete the upcoming maneuvers.
/// The notifications are synchronized with the [ManeuverNotificationListener].
/// [ManeuverNotificationListener] has 4 notification types:
/// Range, Reminder, Distance and Action.
/// Only the maneuver notification of type Distance will also notify a ManeuverViewLaneAssistance object
/// (e.g. "After 400 meters, turn right onto Invalidenstraße").
/// The notification will not be sent when other types of maneuver notification are given.
/// The notification will not be sent when no lane data is available.
/// During tracking mode, no notifications are delivered.
/// This ManeuverViewLaneAssistance information is valid until the next maneuver is reached.

class ManeuverViewLaneAssistance {
  /// A list of lanes on the current road that leads to the upcoming maneuver.
  /// The lanes are sorted from left to right: The lane at index 0 represents the leftmost lane and
  /// the last index represents the rightmost lane.
  /// This is valid for both right-hand and left-hand driving countries.
  /// Contraflow lanes are not included in the list.
  /// The list is guaranteed to be non-empty.
  /// [RoadAttributes.isRightDrivingSide] indicates if this is a left-hand driving country or not.
  List<Lane> lanesForNextManeuver;

  /// A list of lanes on the road that leads to the maneuver after the upcoming maneuver.
  /// The lanes are sorted from left to right: The lane at index 0 represents the leftmost lane and
  /// the last index represents the rightmost lane.
  /// This is valid for both right-hand and left-hand driving countries.
  /// Contraflow lanes are not included in the list.
  /// [RoadAttributes.isRightDrivingSide] indicates if this is a left-hand driving country or not.
  /// By default, this list is empty. It will be filled when the next two maneuvers are too
  /// close to each other, or when the next two maneuvers are roundabout maneuvers.
  /// Note: This notification is delivered at the same time as the [ManeuverViewLaneAssistance.lanesForNextManeuver].
  /// There is no separate maneuver notification on the second maneuver when two maneuvers are
  /// are too close to each other.
  List<Lane> lanesForNextNextManeuver;

  ManeuverViewLaneAssistance(this.lanesForNextManeuver, this.lanesForNextNextManeuver);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ManeuverViewLaneAssistance) return false;
    ManeuverViewLaneAssistance _other = other;
    return DeepCollectionEquality().equals(lanesForNextManeuver, _other.lanesForNextManeuver) &&
        DeepCollectionEquality().equals(lanesForNextNextManeuver, _other.lanesForNextNextManeuver);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(lanesForNextManeuver);
    result = 31 * result + DeepCollectionEquality().hash(lanesForNextNextManeuver);
    return result;
  }
}


// ManeuverViewLaneAssistance "private" section, not exported.

final _sdkNavigationManeuverviewlaneassistanceCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverViewLaneAssistance_create_handle'));
final _sdkNavigationManeuverviewlaneassistanceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverViewLaneAssistance_release_handle'));
final _sdkNavigationManeuverviewlaneassistanceGetFieldlanesForNextManeuver = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverViewLaneAssistance_get_field_lanesForNextManeuver'));
final _sdkNavigationManeuverviewlaneassistanceGetFieldlanesForNextNextManeuver = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverViewLaneAssistance_get_field_lanesForNextNextManeuver'));



Pointer<Void> sdkNavigationManeuverviewlaneassistanceToFfi(ManeuverViewLaneAssistance value) {
  final _lanesForNextManeuverHandle = heresdkNavigationBindingslistofSdkNavigationLaneToFfi(value.lanesForNextManeuver);
  final _lanesForNextNextManeuverHandle = heresdkNavigationBindingslistofSdkNavigationLaneToFfi(value.lanesForNextNextManeuver);
  final _result = _sdkNavigationManeuverviewlaneassistanceCreateHandle(_lanesForNextManeuverHandle, _lanesForNextNextManeuverHandle);
  heresdkNavigationBindingslistofSdkNavigationLaneReleaseFfiHandle(_lanesForNextManeuverHandle);
  heresdkNavigationBindingslistofSdkNavigationLaneReleaseFfiHandle(_lanesForNextNextManeuverHandle);
  return _result;
}

ManeuverViewLaneAssistance sdkNavigationManeuverviewlaneassistanceFromFfi(Pointer<Void> handle) {
  final _lanesForNextManeuverHandle = _sdkNavigationManeuverviewlaneassistanceGetFieldlanesForNextManeuver(handle);
  final _lanesForNextNextManeuverHandle = _sdkNavigationManeuverviewlaneassistanceGetFieldlanesForNextNextManeuver(handle);
  try {
    return ManeuverViewLaneAssistance(
      heresdkNavigationBindingslistofSdkNavigationLaneFromFfi(_lanesForNextManeuverHandle), 
      heresdkNavigationBindingslistofSdkNavigationLaneFromFfi(_lanesForNextNextManeuverHandle)
    );
  } finally {
    heresdkNavigationBindingslistofSdkNavigationLaneReleaseFfiHandle(_lanesForNextManeuverHandle);
    heresdkNavigationBindingslistofSdkNavigationLaneReleaseFfiHandle(_lanesForNextNextManeuverHandle);
  }
}

void sdkNavigationManeuverviewlaneassistanceReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationManeuverviewlaneassistanceReleaseHandle(handle);

// Nullable ManeuverViewLaneAssistance

final _sdkNavigationManeuverviewlaneassistanceCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverViewLaneAssistance_create_handle_nullable'));
final _sdkNavigationManeuverviewlaneassistanceReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverViewLaneAssistance_release_handle_nullable'));
final _sdkNavigationManeuverviewlaneassistanceGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverViewLaneAssistance_get_value_nullable'));

Pointer<Void> sdkNavigationManeuverviewlaneassistanceToFfiNullable(ManeuverViewLaneAssistance? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationManeuverviewlaneassistanceToFfi(value);
  final result = _sdkNavigationManeuverviewlaneassistanceCreateHandleNullable(_handle);
  sdkNavigationManeuverviewlaneassistanceReleaseFfiHandle(_handle);
  return result;
}

ManeuverViewLaneAssistance? sdkNavigationManeuverviewlaneassistanceFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationManeuverviewlaneassistanceGetValueNullable(handle);
  final result = sdkNavigationManeuverviewlaneassistanceFromFfi(_handle);
  sdkNavigationManeuverviewlaneassistanceReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationManeuverviewlaneassistanceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationManeuverviewlaneassistanceReleaseHandleNullable(handle);

// End of ManeuverViewLaneAssistance "private" section.


