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
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/navigation/spatial_maneuver.dart';
import 'package:here_sdk/src/sdk/navigation/spatial_maneuver_audio_cue_panning.dart';

/// This Abstract class should be implemented in order to
/// receive notifications when spatial maneuvers are available.
///
/// Multiple notifications
/// can be given for the same maneuver at different distances.
abstract class SpatialManeuverNotificationListener {
  /// This Abstract class should be implemented in order to
  /// receive notifications when spatial maneuvers are available.
  ///
  /// Multiple notifications
  /// can be given for the same maneuver at different distances.

  factory SpatialManeuverNotificationListener(
    void Function(SpatialManeuver, SpatialManeuverAudioCuePanning) onSpatialManeuverNotificationLambda,

  ) => SpatialManeuverNotificationListener$Lambdas(
    onSpatialManeuverNotificationLambda,

  );

  /// Called whenever there is a new notification for a spatial maneuver (multiple notifications can be
  /// given for the same maneuver at different distances (for example: "After 500 meters turn
  /// right." or "Now turn right.") and in that case, this method will be called once for each
  /// distance.
  ///
  /// [spatialManeuver] The spatial maneuver notification data.
  ///
  /// [audioCuePanning] Object to start the angular panning.
  ///
  void onSpatialManeuverNotification(SpatialManeuver spatialManeuver, SpatialManeuverAudioCuePanning audioCuePanning);
}


// SpatialManeuverNotificationListener "private" section, not exported.

final _sdkNavigationSpatialmaneuvernotificationlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_SpatialManeuverNotificationListener_register_finalizer'));
final _sdkNavigationSpatialmaneuvernotificationlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuverNotificationListener_copy_handle'));
final _sdkNavigationSpatialmaneuvernotificationlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuverNotificationListener_release_handle'));
final _sdkNavigationSpatialmaneuvernotificationlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_SpatialManeuverNotificationListener_create_proxy'));
final _sdkNavigationSpatialmaneuvernotificationlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuverNotificationListener_get_type_id'));


class SpatialManeuverNotificationListener$Lambdas implements SpatialManeuverNotificationListener {
  void Function(SpatialManeuver, SpatialManeuverAudioCuePanning) onSpatialManeuverNotificationLambda;

  SpatialManeuverNotificationListener$Lambdas(
    this.onSpatialManeuverNotificationLambda,

  );

  @override
  void onSpatialManeuverNotification(SpatialManeuver spatialManeuver, SpatialManeuverAudioCuePanning audioCuePanning) =>
    onSpatialManeuverNotificationLambda(spatialManeuver, audioCuePanning);
}

class SpatialManeuverNotificationListener$Impl extends __lib.NativeBase implements SpatialManeuverNotificationListener {

  SpatialManeuverNotificationListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onSpatialManeuverNotification(SpatialManeuver spatialManeuver, SpatialManeuverAudioCuePanning audioCuePanning) {
    final _onSpatialManeuverNotificationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_navigation_SpatialManeuverNotificationListener_onSpatialManeuverNotification__SpatialManeuver_SpatialManeuverAudioCuePanning'));
    final _spatialManeuverHandle = sdkNavigationSpatialmaneuverToFfi(spatialManeuver);
    final _audioCuePanningHandle = sdkNavigationSpatialmaneuveraudiocuepanningToFfi(audioCuePanning);
    final _handle = this.handle;
    _onSpatialManeuverNotificationFfi(_handle, __lib.LibraryContext.isolateId, _spatialManeuverHandle, _audioCuePanningHandle);
    sdkNavigationSpatialmaneuverReleaseFfiHandle(_spatialManeuverHandle);
    sdkNavigationSpatialmaneuveraudiocuepanningReleaseFfiHandle(_audioCuePanningHandle);

  }


}

int _sdkNavigationSpatialmaneuvernotificationlisteneronSpatialManeuverNotificationStatic(Object _obj, Pointer<Void> spatialManeuver, Pointer<Void> audioCuePanning) {

  try {
    (_obj as SpatialManeuverNotificationListener).onSpatialManeuverNotification(sdkNavigationSpatialmaneuverFromFfi(spatialManeuver), sdkNavigationSpatialmaneuveraudiocuepanningFromFfi(audioCuePanning));
  } finally {
    sdkNavigationSpatialmaneuverReleaseFfiHandle(spatialManeuver);
    sdkNavigationSpatialmaneuveraudiocuepanningReleaseFfiHandle(audioCuePanning);
  }
  return 0;
}


Pointer<Void> sdkNavigationSpatialmaneuvernotificationlistenerToFfi(SpatialManeuverNotificationListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationSpatialmaneuvernotificationlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationSpatialmaneuvernotificationlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkNavigationSpatialmaneuvernotificationlisteneronSpatialManeuverNotificationStatic, __lib.unknownError)
  );

  return result;
}

SpatialManeuverNotificationListener sdkNavigationSpatialmaneuvernotificationlistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SpatialManeuverNotificationListener) return instance;

  final _typeIdHandle = _sdkNavigationSpatialmaneuvernotificationlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationSpatialmaneuvernotificationlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : SpatialManeuverNotificationListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationSpatialmaneuvernotificationlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationSpatialmaneuvernotificationlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationSpatialmaneuvernotificationlistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationSpatialmaneuvernotificationlistenerToFfiNullable(SpatialManeuverNotificationListener? value) =>
  value != null ? sdkNavigationSpatialmaneuvernotificationlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

SpatialManeuverNotificationListener? sdkNavigationSpatialmaneuvernotificationlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationSpatialmaneuvernotificationlistenerFromFfi(handle) : null;

void sdkNavigationSpatialmaneuvernotificationlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpatialmaneuvernotificationlistenerReleaseHandle(handle);

// End of SpatialManeuverNotificationListener "private" section.


