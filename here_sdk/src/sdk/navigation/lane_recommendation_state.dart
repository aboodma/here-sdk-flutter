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

/// Indicates whether this lane leads to the next maneuvers or not.
///
/// The next maneuver is the next upcoming maneuver which is not yet reached, but
/// that was already announced as _new_ maneuver in [RouteProgress.maneuverProgress].
enum LaneRecommendationState {
    /// This lane will not lead the user to the next maneuver.
    notRecommended,
    /// Only possible when [ManeuverViewLaneAssistance.lanesForNextNextManeuver] is not empty.
    /// If [ManeuverViewLaneAssistance.lanesForNextNextManeuver] is not empty, then
    /// this lane will lead the user only to the next maneuver, but not to the
    /// maneuver after the next maneuver.
    recommended,
    /// This lane will lead the user to the next maneuver.
    /// If [ManeuverViewLaneAssistance.lanesForNextNextManeuver] is not empty, then
    /// this lane will lead the user to the next maneuver _and_ to the
    /// maneuver after the next maneuver.
    highlyRecommended
}

// LaneRecommendationState "private" section, not exported.

int sdkNavigationLanerecommendationstateToFfi(LaneRecommendationState value) {
  switch (value) {
  case LaneRecommendationState.notRecommended:
    return 0;
  case LaneRecommendationState.recommended:
    return 1;
  case LaneRecommendationState.highlyRecommended:
    return 2;
  default:
    throw StateError("Invalid enum value $value for LaneRecommendationState enum.");
  }
}

LaneRecommendationState sdkNavigationLanerecommendationstateFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LaneRecommendationState.notRecommended;
  case 1:
    return LaneRecommendationState.recommended;
  case 2:
    return LaneRecommendationState.highlyRecommended;
  default:
    throw StateError("Invalid numeric value $handle for LaneRecommendationState enum.");
  }
}

void sdkNavigationLanerecommendationstateReleaseFfiHandle(int handle) {}

final _sdkNavigationLanerecommendationstateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_LaneRecommendationState_create_handle_nullable'));
final _sdkNavigationLanerecommendationstateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneRecommendationState_release_handle_nullable'));
final _sdkNavigationLanerecommendationstateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneRecommendationState_get_value_nullable'));

Pointer<Void> sdkNavigationLanerecommendationstateToFfiNullable(LaneRecommendationState? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationLanerecommendationstateToFfi(value);
  final result = _sdkNavigationLanerecommendationstateCreateHandleNullable(_handle);
  sdkNavigationLanerecommendationstateReleaseFfiHandle(_handle);
  return result;
}

LaneRecommendationState? sdkNavigationLanerecommendationstateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationLanerecommendationstateGetValueNullable(handle);
  final result = sdkNavigationLanerecommendationstateFromFfi(_handle);
  sdkNavigationLanerecommendationstateReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationLanerecommendationstateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationLanerecommendationstateReleaseHandleNullable(handle);

// End of LaneRecommendationState "private" section.


