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
import 'package:here_sdk/src/sdk/routing/maneuver.dart';

/// This struct provides all the information for a spatial maneuver, including the
/// maneuver data and extra data which is required to set the direction of spatialisation of the audio cue.

class SpatialManeuver {
  /// The maneuver instruction. The text is formatted and localized as specified via
  /// [RouteTextOptions].
  ///
  /// **Note:** During navigation, the text will be always empty when the [Maneuver] is
  /// taken from the `Navigator` or `VisualNavigator` instance via the provided index. The text instruction that can
  /// be accessed from the [Route] instance is meant as preview and it is not necessarily matching the
  /// more comprehensive maneuver information you can access during navigation. This information can be enhanced
  /// with real-time `ManeuverNotifications` texts that can be used for spoken voice announcements during a trip.
  String voiceText;

  /// Maneuver which is being notified.
  Maneuver maneuver;

  /// Initial desired angular position of the upcoming audio cue. For example, for a maneuver such as "Turn right on" (`ManeuverAction.RightTurn`)
  /// we want to create a spatial audio arc trajectory from the front to the right, mimicking the maneuver geometry. In this case,
  /// it is good practice to start the trajectory from an initial azimuth that is slightly located on the opposite direction of the maneuver
  /// (e.g. slightly starting from "front-left") and terminate the trajectory fully on the right side. The initial azimuth angle of such
  /// a trajectory would be, for example, -5.0 (slightly front-left).
  /// This azimuth value is needed to set the position of the audio renderer before starting to play the audio cue to avoid unwanted audio "jumps".
  double initialAzimuthInDegrees;

  /// Estimation of the required time to play an audio cue at speech rate 1.0.
  /// For example the cue "Turn right on Name-Of-A-Street" will playback over an X number of milliseconds. Therefore, an estimation of this
  /// audio cue duration is needed to correctly sync the movement of sound to the cue (so that audio movement and audio duration match).
  Duration estimatedAudioCueDuration;

  SpatialManeuver(this.voiceText, this.maneuver, this.initialAzimuthInDegrees, this.estimatedAudioCueDuration);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SpatialManeuver) return false;
    SpatialManeuver _other = other;
    return voiceText == _other.voiceText &&
        maneuver == _other.maneuver &&
        initialAzimuthInDegrees == _other.initialAzimuthInDegrees &&
        estimatedAudioCueDuration == _other.estimatedAudioCueDuration;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + voiceText.hashCode;
    result = 31 * result + maneuver.hashCode;
    result = 31 * result + initialAzimuthInDegrees.hashCode;
    result = 31 * result + estimatedAudioCueDuration.hashCode;
    return result;
  }
}


// SpatialManeuver "private" section, not exported.

final _sdkNavigationSpatialmaneuverCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Double, Uint64),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, double, int)
  >('here_sdk_sdk_navigation_SpatialManeuver_create_handle'));
final _sdkNavigationSpatialmaneuverReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuver_release_handle'));
final _sdkNavigationSpatialmaneuverGetFieldvoiceText = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuver_get_field_voiceText'));
final _sdkNavigationSpatialmaneuverGetFieldmaneuver = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuver_get_field_maneuver'));
final _sdkNavigationSpatialmaneuverGetFieldinitialAzimuthInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuver_get_field_initialAzimuthInDegrees'));
final _sdkNavigationSpatialmaneuverGetFieldestimatedAudioCueDuration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuver_get_field_estimatedAudioCueDuration'));



Pointer<Void> sdkNavigationSpatialmaneuverToFfi(SpatialManeuver value) {
  final _voiceTextHandle = stringToFfi(value.voiceText);
  final _maneuverHandle = sdkRoutingManeuverToFfi(value.maneuver);
  final _initialAzimuthInDegreesHandle = (value.initialAzimuthInDegrees);
  final _estimatedAudioCueDurationHandle = durationToFfi(value.estimatedAudioCueDuration);
  final _result = _sdkNavigationSpatialmaneuverCreateHandle(_voiceTextHandle, _maneuverHandle, _initialAzimuthInDegreesHandle, _estimatedAudioCueDurationHandle);
  stringReleaseFfiHandle(_voiceTextHandle);
  sdkRoutingManeuverReleaseFfiHandle(_maneuverHandle);
  
  durationReleaseFfiHandle(_estimatedAudioCueDurationHandle);
  return _result;
}

SpatialManeuver sdkNavigationSpatialmaneuverFromFfi(Pointer<Void> handle) {
  final _voiceTextHandle = _sdkNavigationSpatialmaneuverGetFieldvoiceText(handle);
  final _maneuverHandle = _sdkNavigationSpatialmaneuverGetFieldmaneuver(handle);
  final _initialAzimuthInDegreesHandle = _sdkNavigationSpatialmaneuverGetFieldinitialAzimuthInDegrees(handle);
  final _estimatedAudioCueDurationHandle = _sdkNavigationSpatialmaneuverGetFieldestimatedAudioCueDuration(handle);
  try {
    return SpatialManeuver(
      stringFromFfi(_voiceTextHandle), 
      sdkRoutingManeuverFromFfi(_maneuverHandle), 
      (_initialAzimuthInDegreesHandle), 
      durationFromFfi(_estimatedAudioCueDurationHandle)
    );
  } finally {
    stringReleaseFfiHandle(_voiceTextHandle);
    sdkRoutingManeuverReleaseFfiHandle(_maneuverHandle);
    
    durationReleaseFfiHandle(_estimatedAudioCueDurationHandle);
  }
}

void sdkNavigationSpatialmaneuverReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationSpatialmaneuverReleaseHandle(handle);

// Nullable SpatialManeuver

final _sdkNavigationSpatialmaneuverCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuver_create_handle_nullable'));
final _sdkNavigationSpatialmaneuverReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuver_release_handle_nullable'));
final _sdkNavigationSpatialmaneuverGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuver_get_value_nullable'));

Pointer<Void> sdkNavigationSpatialmaneuverToFfiNullable(SpatialManeuver? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationSpatialmaneuverToFfi(value);
  final result = _sdkNavigationSpatialmaneuverCreateHandleNullable(_handle);
  sdkNavigationSpatialmaneuverReleaseFfiHandle(_handle);
  return result;
}

SpatialManeuver? sdkNavigationSpatialmaneuverFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationSpatialmaneuverGetValueNullable(handle);
  final result = sdkNavigationSpatialmaneuverFromFfi(_handle);
  sdkNavigationSpatialmaneuverReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationSpatialmaneuverReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpatialmaneuverReleaseHandleNullable(handle);

// End of SpatialManeuver "private" section.


