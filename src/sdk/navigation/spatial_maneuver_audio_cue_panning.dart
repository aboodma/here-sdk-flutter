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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/sdk/navigation/custom_panning_data.dart';

/// ![Spatialisation description](../images/audiomapper_graphs_001.png)
/// Use the [SpatialManeuverAudioCuePanning] to notify each of the azimuths which compose a spatial audio
/// trajectory along the audio cue.
abstract class SpatialManeuverAudioCuePanning {

  /// This method will retrieve a stream of azimuth values to be passed onto the spatial audio renderer, only
  /// if [SpatialManeuverAzimuthListener] has been initialized.
  ///
  /// An optional custom value for [SpatialManeuver.estimatedAudioCueDuration], [SpatialManeuver.initialAzimuthInDegrees],  or its
  /// [CustomPanningData.sweepAzimuthInDegrees] can be here defined if the default data does not fully match the utilized Language or TTS engine
  /// or the angle expectations.
  /// If startPanning is called to spatialize the audio cue of a new maneuver before the full completion of
  /// a previous spatial audio trajectory, then [SpatialManeuverAzimuthListener] will retrieve the azimuth values
  /// of the new maneuver.
  ///
  /// [nextCustomPanningData] Defines a new set of values related to spatial audio panning.
  /// When [CustomPanningData] is initialised as `null`, the default set of values provided by HERE SDK will be used instead.
  ///
  void startPanning(CustomPanningData? nextCustomPanningData);
}


// SpatialManeuverAudioCuePanning "private" section, not exported.

final _sdkNavigationSpatialmaneuveraudiocuepanningRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_SpatialManeuverAudioCuePanning_register_finalizer'));
final _sdkNavigationSpatialmaneuveraudiocuepanningCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuverAudioCuePanning_copy_handle'));
final _sdkNavigationSpatialmaneuveraudiocuepanningReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuverAudioCuePanning_release_handle'));



class SpatialManeuverAudioCuePanning$Impl extends __lib.NativeBase implements SpatialManeuverAudioCuePanning {

  SpatialManeuverAudioCuePanning$Impl(Pointer<Void> handle) : super(handle);

  @override
  void startPanning(CustomPanningData? nextCustomPanningData) {
    final _startPanningFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_SpatialManeuverAudioCuePanning_startPanning__CustomPanningData_'));
    final _nextCustomPanningDataHandle = sdkNavigationCustompanningdataToFfiNullable(nextCustomPanningData);
    final _handle = this.handle;
    _startPanningFfi(_handle, __lib.LibraryContext.isolateId, _nextCustomPanningDataHandle);
    sdkNavigationCustompanningdataReleaseFfiHandleNullable(_nextCustomPanningDataHandle);

  }


}

Pointer<Void> sdkNavigationSpatialmaneuveraudiocuepanningToFfi(SpatialManeuverAudioCuePanning value) =>
  _sdkNavigationSpatialmaneuveraudiocuepanningCopyHandle((value as __lib.NativeBase).handle);

SpatialManeuverAudioCuePanning sdkNavigationSpatialmaneuveraudiocuepanningFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SpatialManeuverAudioCuePanning) return instance;

  final _copiedHandle = _sdkNavigationSpatialmaneuveraudiocuepanningCopyHandle(handle);
  final result = SpatialManeuverAudioCuePanning$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationSpatialmaneuveraudiocuepanningRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationSpatialmaneuveraudiocuepanningReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationSpatialmaneuveraudiocuepanningReleaseHandle(handle);

Pointer<Void> sdkNavigationSpatialmaneuveraudiocuepanningToFfiNullable(SpatialManeuverAudioCuePanning? value) =>
  value != null ? sdkNavigationSpatialmaneuveraudiocuepanningToFfi(value) : Pointer<Void>.fromAddress(0);

SpatialManeuverAudioCuePanning? sdkNavigationSpatialmaneuveraudiocuepanningFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationSpatialmaneuveraudiocuepanningFromFfi(handle) : null;

void sdkNavigationSpatialmaneuveraudiocuepanningReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpatialmaneuveraudiocuepanningReleaseHandle(handle);

// End of SpatialManeuverAudioCuePanning "private" section.


