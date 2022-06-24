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

/// A class that provides lane assistance information for the next complex junction
/// in order to keep following the route.
///
/// It is recommended to indicate [JunctionViewLaneAssistance]
/// and [ManeuverViewLaneAssistance] separately or to indicate only [ManeuverViewLaneAssistance] information -
/// [JunctionViewLaneAssistance] will recommend all lanes that allow to pass the upcoming complex junction, regardless
/// if they will lead to the next maneuver or not.
/// If the location of a maneuver lies on an upcoming complex junction, the recommended lanes will be
/// the same as the ones from [ManeuverViewLaneAssistance].
///
/// A junction is recognized as complex only if:
/// - it is at least a bifurcation;
/// - it has at least two lanes whose directions do not follow the current route.
///   In opposition to [ManeuverViewLaneAssistance], notifications are also forwarded when there is
///   no maneuver action occurring at the next complex junction.
///   Therefore, [JunctionViewLaneAssistance] can be disjointed from maneuvers. If lane assistance should be used to
///   associate it with upcoming maneuvers, consider to use [ManeuverViewLaneAssistance] instead.
///   Note that [ManeuverViewLaneAssistance] notifications are synchronized with maneuver events,
///   whereas [JunctionViewLaneAssistance] events are not strictly synchronized with maneuver events.

class JunctionViewLaneAssistance {
  /// A list of lanes on the next complex junction.
  /// The lanes are sorted from left to right: The lane at index 0 represents the leftmost lane and
  /// the last index represents the rightmost lane. This is valid for right-hand and left-hand driving
  /// countries. An empty list means that the complex junction has been passed and that the lane information is not
  /// valid anymore. Exactly one event with a non-empty list is delivered before reaching a complex junction and
  /// one event with an empty list afterwards.
  ///
  /// **Note:** Lanes going in opposite direction are not included in the list.
  List<Lane> lanesForNextJunction;

  JunctionViewLaneAssistance(this.lanesForNextJunction);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! JunctionViewLaneAssistance) return false;
    JunctionViewLaneAssistance _other = other;
    return DeepCollectionEquality().equals(lanesForNextJunction, _other.lanesForNextJunction);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(lanesForNextJunction);
    return result;
  }
}


// JunctionViewLaneAssistance "private" section, not exported.

final _sdkNavigationJunctionviewlaneassistanceCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_JunctionViewLaneAssistance_create_handle'));
final _sdkNavigationJunctionviewlaneassistanceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_JunctionViewLaneAssistance_release_handle'));
final _sdkNavigationJunctionviewlaneassistanceGetFieldlanesForNextJunction = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_JunctionViewLaneAssistance_get_field_lanesForNextJunction'));



Pointer<Void> sdkNavigationJunctionviewlaneassistanceToFfi(JunctionViewLaneAssistance value) {
  final _lanesForNextJunctionHandle = heresdkNavigationBindingslistofSdkNavigationLaneToFfi(value.lanesForNextJunction);
  final _result = _sdkNavigationJunctionviewlaneassistanceCreateHandle(_lanesForNextJunctionHandle);
  heresdkNavigationBindingslistofSdkNavigationLaneReleaseFfiHandle(_lanesForNextJunctionHandle);
  return _result;
}

JunctionViewLaneAssistance sdkNavigationJunctionviewlaneassistanceFromFfi(Pointer<Void> handle) {
  final _lanesForNextJunctionHandle = _sdkNavigationJunctionviewlaneassistanceGetFieldlanesForNextJunction(handle);
  try {
    return JunctionViewLaneAssistance(
      heresdkNavigationBindingslistofSdkNavigationLaneFromFfi(_lanesForNextJunctionHandle)
    );
  } finally {
    heresdkNavigationBindingslistofSdkNavigationLaneReleaseFfiHandle(_lanesForNextJunctionHandle);
  }
}

void sdkNavigationJunctionviewlaneassistanceReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationJunctionviewlaneassistanceReleaseHandle(handle);

// Nullable JunctionViewLaneAssistance

final _sdkNavigationJunctionviewlaneassistanceCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_JunctionViewLaneAssistance_create_handle_nullable'));
final _sdkNavigationJunctionviewlaneassistanceReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_JunctionViewLaneAssistance_release_handle_nullable'));
final _sdkNavigationJunctionviewlaneassistanceGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_JunctionViewLaneAssistance_get_value_nullable'));

Pointer<Void> sdkNavigationJunctionviewlaneassistanceToFfiNullable(JunctionViewLaneAssistance? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationJunctionviewlaneassistanceToFfi(value);
  final result = _sdkNavigationJunctionviewlaneassistanceCreateHandleNullable(_handle);
  sdkNavigationJunctionviewlaneassistanceReleaseFfiHandle(_handle);
  return result;
}

JunctionViewLaneAssistance? sdkNavigationJunctionviewlaneassistanceFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationJunctionviewlaneassistanceGetValueNullable(handle);
  final result = sdkNavigationJunctionviewlaneassistanceFromFfi(_handle);
  sdkNavigationJunctionviewlaneassistanceReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationJunctionviewlaneassistanceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationJunctionviewlaneassistanceReleaseHandleNullable(handle);

// End of JunctionViewLaneAssistance "private" section.


