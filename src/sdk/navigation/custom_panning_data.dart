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

/// This struct contains all the information regarding the next angular panning element, including a new estimated audio cue duration,
/// and a new set of initial and sweep angular angle, allowing the customization of the spatial audio trajectories.
///
/// The orientation in space for [CustomPanningData.initialAzimuthInDegrees] and [CustomPanningData.sweepAzimuthInDegrees] can be represented by the following angular values:
/// |  Front |  Right | Rear  | Left  |
/// |:----:|:----:|:----:|:----:|
/// |  0° | +90° | +- 180 | -90° |
/// When any of the members of [CustomPanningData] are initialized as null, the default value provided by HERE SDK will be used instead.

class CustomPanningData {
  /// Customized estimated duration for playing the audio cue on the selected TTS Engine. When not used, HERE SDK' estimation will be used instead.
  Duration? estimatedAudioCueDuration;

  /// Initial desired angular position of the upcoming audio cue. For example, for a maneuver such as "Turn right on" (`ManeuverAction.RightTurn`)
  /// we want to create a spatial audio arc trajectory from the front to the right, mimicking the maneuver geometry. In this case,
  /// it is good practice to start the trajectory from an initial azimuth that is slightly located on the opposite direction of the maneuver
  /// (e.g. slightly starting from "front-left") and terminate the trajectory fully on the right side. The initial azimuth angle of such
  /// a trajectory would be, for example, -5.0 (slightly front-left).
  /// This azimuth value is needed to set the position of the audio renderer before starting to play the audio cue to avoid unwanted audio "jumps".
  double? initialAzimuthInDegrees;

  /// Initial desired angular position of the upcoming audio cue. For example, for a maneuver such as "Turn right on" (i.e. `ManeuverAction.RightTurn`),
  /// within an `initial_azimuth_in_degrees` of -5 degrees, we want to create a spatial audio arc trajectory from the front to the right, mimicking the maneuver geometry.
  /// In this case, the desired final angle would be +90 degrees, and therefore, a sweep angle of +95 degrees would be required.
  /// On the other hand, when the desired spatialisation is to the left side (i.e. `ManeuverAction.LeftTurn`), the `initial_azimuth_in_degrees` could be set to +5 degrees and the `sweep_azimuth_in_degrees`
  /// to -95 degrees
  double? sweepAzimuthInDegrees;

  CustomPanningData(this.estimatedAudioCueDuration, this.initialAzimuthInDegrees, this.sweepAzimuthInDegrees);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CustomPanningData) return false;
    CustomPanningData _other = other;
    return estimatedAudioCueDuration == _other.estimatedAudioCueDuration &&
        initialAzimuthInDegrees == _other.initialAzimuthInDegrees &&
        sweepAzimuthInDegrees == _other.sweepAzimuthInDegrees;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + estimatedAudioCueDuration.hashCode;
    result = 31 * result + initialAzimuthInDegrees.hashCode;
    result = 31 * result + sweepAzimuthInDegrees.hashCode;
    return result;
  }
}


// CustomPanningData "private" section, not exported.

final _sdkNavigationCustompanningdataCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_CustomPanningData_create_handle'));
final _sdkNavigationCustompanningdataReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CustomPanningData_release_handle'));
final _sdkNavigationCustompanningdataGetFieldestimatedAudioCueDuration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CustomPanningData_get_field_estimatedAudioCueDuration'));
final _sdkNavigationCustompanningdataGetFieldinitialAzimuthInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CustomPanningData_get_field_initialAzimuthInDegrees'));
final _sdkNavigationCustompanningdataGetFieldsweepAzimuthInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CustomPanningData_get_field_sweepAzimuthInDegrees'));



Pointer<Void> sdkNavigationCustompanningdataToFfi(CustomPanningData value) {
  final _estimatedAudioCueDurationHandle = durationToFfiNullable(value.estimatedAudioCueDuration);
  final _initialAzimuthInDegreesHandle = doubleToFfiNullable(value.initialAzimuthInDegrees);
  final _sweepAzimuthInDegreesHandle = doubleToFfiNullable(value.sweepAzimuthInDegrees);
  final _result = _sdkNavigationCustompanningdataCreateHandle(_estimatedAudioCueDurationHandle, _initialAzimuthInDegreesHandle, _sweepAzimuthInDegreesHandle);
  durationReleaseFfiHandleNullable(_estimatedAudioCueDurationHandle);
  doubleReleaseFfiHandleNullable(_initialAzimuthInDegreesHandle);
  doubleReleaseFfiHandleNullable(_sweepAzimuthInDegreesHandle);
  return _result;
}

CustomPanningData sdkNavigationCustompanningdataFromFfi(Pointer<Void> handle) {
  final _estimatedAudioCueDurationHandle = _sdkNavigationCustompanningdataGetFieldestimatedAudioCueDuration(handle);
  final _initialAzimuthInDegreesHandle = _sdkNavigationCustompanningdataGetFieldinitialAzimuthInDegrees(handle);
  final _sweepAzimuthInDegreesHandle = _sdkNavigationCustompanningdataGetFieldsweepAzimuthInDegrees(handle);
  try {
    return CustomPanningData(
      durationFromFfiNullable(_estimatedAudioCueDurationHandle), 
      doubleFromFfiNullable(_initialAzimuthInDegreesHandle), 
      doubleFromFfiNullable(_sweepAzimuthInDegreesHandle)
    );
  } finally {
    durationReleaseFfiHandleNullable(_estimatedAudioCueDurationHandle);
    doubleReleaseFfiHandleNullable(_initialAzimuthInDegreesHandle);
    doubleReleaseFfiHandleNullable(_sweepAzimuthInDegreesHandle);
  }
}

void sdkNavigationCustompanningdataReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationCustompanningdataReleaseHandle(handle);

// Nullable CustomPanningData

final _sdkNavigationCustompanningdataCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CustomPanningData_create_handle_nullable'));
final _sdkNavigationCustompanningdataReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CustomPanningData_release_handle_nullable'));
final _sdkNavigationCustompanningdataGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_CustomPanningData_get_value_nullable'));

Pointer<Void> sdkNavigationCustompanningdataToFfiNullable(CustomPanningData? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationCustompanningdataToFfi(value);
  final result = _sdkNavigationCustompanningdataCreateHandleNullable(_handle);
  sdkNavigationCustompanningdataReleaseFfiHandle(_handle);
  return result;
}

CustomPanningData? sdkNavigationCustompanningdataFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationCustompanningdataGetValueNullable(handle);
  final result = sdkNavigationCustompanningdataFromFfi(_handle);
  sdkNavigationCustompanningdataReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationCustompanningdataReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationCustompanningdataReleaseHandleNullable(handle);

// End of CustomPanningData "private" section.


