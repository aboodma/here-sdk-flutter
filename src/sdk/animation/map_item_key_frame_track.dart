// Copyright (c) 2019-2022 HERE Global B.V. and its affiliate(s).
// All rights reserved.
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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/animation/easing_function.dart';
import 'package:here_sdk/src/sdk/animation/geo_coordinates_keyframe.dart';
import 'package:here_sdk/src/sdk/animation/keyframe_interpolation_mode.dart';
import 'package:meta/meta.dart';

/// Stores keyframes for interpolation of a map item property using a specific
/// easing function and interpolation mode.
abstract class MapItemKeyFrameTrack {

  /// Creates a map item position keyframe track.
  ///
  /// It enables animations over the geographical
  /// coordinates where the map item is positioned.
  ///
  /// [keyframes] The list of keyframes that specify how the map item position is changed.
  /// Keyframe time offsets are considered to be relative to the previous keyframe
  /// in the list or relative to the start of the animation if the current keyframe
  /// is first in the list.
  /// Time offset of the first keyframe in the list should be 0, otherwise an error occurs
  /// and creation of the keyframe track will fail.
  ///
  /// [easingFunction] The easing function to apply during keyframe interpolation.
  ///
  /// [interpolationMode] The type of interpolation done between keyframe values.
  ///
  static MapItemKeyFrameTrack moveTo(List<GeoCoordinatesKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) => $prototype.moveTo(keyframes, easingFunction, interpolationMode);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MapItemKeyFrameTrack$Impl(Pointer<Void>.fromAddress(0));
}

/// Describes a reason for failing to create a [MapItemKeyFrameTrack].
enum MapItemKeyFrameTrackInstantiationErrorCode {
    /// List of keyframes is empty.
    emptyKeyframeList,
    /// Invalid keyframe duration value.
    invalidKeyframeDuration
}

// MapItemKeyFrameTrackInstantiationErrorCode "private" section, not exported.

int sdkAnimationMapitemkeyframetrackInstantiationerrorcodeToFfi(MapItemKeyFrameTrackInstantiationErrorCode value) {
  switch (value) {
  case MapItemKeyFrameTrackInstantiationErrorCode.emptyKeyframeList:
    return 1;
  case MapItemKeyFrameTrackInstantiationErrorCode.invalidKeyframeDuration:
    return 2;
  default:
    throw StateError("Invalid enum value $value for MapItemKeyFrameTrackInstantiationErrorCode enum.");
  }
}

MapItemKeyFrameTrackInstantiationErrorCode sdkAnimationMapitemkeyframetrackInstantiationerrorcodeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return MapItemKeyFrameTrackInstantiationErrorCode.emptyKeyframeList;
  case 2:
    return MapItemKeyFrameTrackInstantiationErrorCode.invalidKeyframeDuration;
  default:
    throw StateError("Invalid numeric value $handle for MapItemKeyFrameTrackInstantiationErrorCode enum.");
  }
}

void sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseFfiHandle(int handle) {}

final _sdkAnimationMapitemkeyframetrackInstantiationerrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_InstantiationErrorCode_create_handle_nullable'));
final _sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_InstantiationErrorCode_release_handle_nullable'));
final _sdkAnimationMapitemkeyframetrackInstantiationerrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_InstantiationErrorCode_get_value_nullable'));

Pointer<Void> sdkAnimationMapitemkeyframetrackInstantiationerrorcodeToFfiNullable(MapItemKeyFrameTrackInstantiationErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkAnimationMapitemkeyframetrackInstantiationerrorcodeToFfi(value);
  final result = _sdkAnimationMapitemkeyframetrackInstantiationerrorcodeCreateHandleNullable(_handle);
  sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

MapItemKeyFrameTrackInstantiationErrorCode? sdkAnimationMapitemkeyframetrackInstantiationerrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkAnimationMapitemkeyframetrackInstantiationerrorcodeGetValueNullable(handle);
  final result = sdkAnimationMapitemkeyframetrackInstantiationerrorcodeFromFfi(_handle);
  sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseHandleNullable(handle);

// End of MapItemKeyFrameTrackInstantiationErrorCode "private" section.
/// Thrown when a problem occurs while trying to create [MapItemKeyFrameTrack].
class MapItemKeyFrameTrackInstantiationException implements Exception {
  final MapItemKeyFrameTrackInstantiationErrorCode error;
  MapItemKeyFrameTrackInstantiationException(this.error);
}

// MapItemKeyFrameTrack "private" section, not exported.

final _sdkAnimationMapitemkeyframetrackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_register_finalizer'));
final _sdkAnimationMapitemkeyframetrackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_copy_handle'));
final _sdkAnimationMapitemkeyframetrackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_release_handle'));


final _moveToReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_moveTo__ListOf_sdk_animation_GeoCoordinatesKeyframe_EasingFunction_KeyframeInterpolationMode_return_release_handle'));
final _moveToReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_moveTo__ListOf_sdk_animation_GeoCoordinatesKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_result'));
final _moveToReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_moveTo__ListOf_sdk_animation_GeoCoordinatesKeyframe_EasingFunction_KeyframeInterpolationMode_return_get_error'));
final _moveToReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_animation_MapItemKeyFrameTrack_moveTo__ListOf_sdk_animation_GeoCoordinatesKeyframe_EasingFunction_KeyframeInterpolationMode_return_has_error'));


/// @nodoc
@visibleForTesting
class MapItemKeyFrameTrack$Impl extends __lib.NativeBase implements MapItemKeyFrameTrack {

  MapItemKeyFrameTrack$Impl(Pointer<Void> handle) : super(handle);

  MapItemKeyFrameTrack moveTo(List<GeoCoordinatesKeyframe> keyframes, EasingFunction easingFunction, KeyframeInterpolationMode interpolationMode) {
    final _moveToFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Uint32, Uint32), Pointer<Void> Function(int, Pointer<Void>, int, int)>('here_sdk_sdk_animation_MapItemKeyFrameTrack_moveTo__ListOf_sdk_animation_GeoCoordinatesKeyframe_EasingFunction_KeyframeInterpolationMode'));
    final _keyframesHandle = harpSdkBindingslistofSdkAnimationGeocoordinateskeyframeToFfi(keyframes);
    final _easingFunctionHandle = sdkAnimationEasingfunctionToFfi(easingFunction);
    final _interpolationModeHandle = sdkAnimationKeyframeinterpolationmodeToFfi(interpolationMode);
    final __callResultHandle = _moveToFfi(__lib.LibraryContext.isolateId, _keyframesHandle, _easingFunctionHandle, _interpolationModeHandle);
    harpSdkBindingslistofSdkAnimationGeocoordinateskeyframeReleaseFfiHandle(_keyframesHandle);
    sdkAnimationEasingfunctionReleaseFfiHandle(_easingFunctionHandle);
    sdkAnimationKeyframeinterpolationmodeReleaseFfiHandle(_interpolationModeHandle);
    if (_moveToReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _moveToReturnGetError(__callResultHandle);
        _moveToReturnReleaseHandle(__callResultHandle);
        try {
          throw MapItemKeyFrameTrackInstantiationException(sdkAnimationMapitemkeyframetrackInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkAnimationMapitemkeyframetrackInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _moveToReturnGetResult(__callResultHandle);
    _moveToReturnReleaseHandle(__callResultHandle);
    try {
      return sdkAnimationMapitemkeyframetrackFromFfi(__resultHandle);
    } finally {
      sdkAnimationMapitemkeyframetrackReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkAnimationMapitemkeyframetrackToFfi(MapItemKeyFrameTrack value) =>
  _sdkAnimationMapitemkeyframetrackCopyHandle((value as __lib.NativeBase).handle);

MapItemKeyFrameTrack sdkAnimationMapitemkeyframetrackFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapItemKeyFrameTrack) return instance;

  final _copiedHandle = _sdkAnimationMapitemkeyframetrackCopyHandle(handle);
  final result = MapItemKeyFrameTrack$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkAnimationMapitemkeyframetrackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkAnimationMapitemkeyframetrackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkAnimationMapitemkeyframetrackReleaseHandle(handle);

Pointer<Void> sdkAnimationMapitemkeyframetrackToFfiNullable(MapItemKeyFrameTrack? value) =>
  value != null ? sdkAnimationMapitemkeyframetrackToFfi(value) : Pointer<Void>.fromAddress(0);

MapItemKeyFrameTrack? sdkAnimationMapitemkeyframetrackFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkAnimationMapitemkeyframetrackFromFfi(handle) : null;

void sdkAnimationMapitemkeyframetrackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkAnimationMapitemkeyframetrackReleaseHandle(handle);

// End of MapItemKeyFrameTrack "private" section.


