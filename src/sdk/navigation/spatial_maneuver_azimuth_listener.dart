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
import 'package:here_sdk/src/sdk/navigation/spatial_trajectory_data.dart';

/// This Abstract class should be implemented in order to
/// to receive notifications about the following spatial audio trajectory.
abstract class SpatialManeuverAzimuthListener {
  /// This Abstract class should be implemented in order to
  /// to receive notifications about the following spatial audio trajectory.

  factory SpatialManeuverAzimuthListener(
    void Function(SpatialTrajectoryData) onAzimuthNotificationLambda,

  ) => SpatialManeuverAzimuthListener$Lambdas(
    onAzimuthNotificationLambda,

  );

  /// Returns the next azimuth required to complete a spatial audio trajectory.
  ///
  /// Azimuth angular values are retrieved
  /// individually until the full duration of the audio trajectory has been reached.
  ///
  /// [nextSpatialTrajectoryData] The next angular panning element to be set on a spatial audio engine.
  ///
  void onAzimuthNotification(SpatialTrajectoryData nextSpatialTrajectoryData);
}


// SpatialManeuverAzimuthListener "private" section, not exported.

final _sdkNavigationSpatialmaneuverazimuthlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_SpatialManeuverAzimuthListener_register_finalizer'));
final _sdkNavigationSpatialmaneuverazimuthlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuverAzimuthListener_copy_handle'));
final _sdkNavigationSpatialmaneuverazimuthlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuverAzimuthListener_release_handle'));
final _sdkNavigationSpatialmaneuverazimuthlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_SpatialManeuverAzimuthListener_create_proxy'));
final _sdkNavigationSpatialmaneuverazimuthlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpatialManeuverAzimuthListener_get_type_id'));


class SpatialManeuverAzimuthListener$Lambdas implements SpatialManeuverAzimuthListener {
  void Function(SpatialTrajectoryData) onAzimuthNotificationLambda;

  SpatialManeuverAzimuthListener$Lambdas(
    this.onAzimuthNotificationLambda,

  );

  @override
  void onAzimuthNotification(SpatialTrajectoryData nextSpatialTrajectoryData) =>
    onAzimuthNotificationLambda(nextSpatialTrajectoryData);
}

class SpatialManeuverAzimuthListener$Impl extends __lib.NativeBase implements SpatialManeuverAzimuthListener {

  SpatialManeuverAzimuthListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onAzimuthNotification(SpatialTrajectoryData nextSpatialTrajectoryData) {
    final _onAzimuthNotificationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_SpatialManeuverAzimuthListener_onAzimuthNotification__SpatialTrajectoryData'));
    final _nextSpatialTrajectoryDataHandle = sdkNavigationSpatialtrajectorydataToFfi(nextSpatialTrajectoryData);
    final _handle = this.handle;
    _onAzimuthNotificationFfi(_handle, __lib.LibraryContext.isolateId, _nextSpatialTrajectoryDataHandle);
    sdkNavigationSpatialtrajectorydataReleaseFfiHandle(_nextSpatialTrajectoryDataHandle);

  }


}

int _sdkNavigationSpatialmaneuverazimuthlisteneronAzimuthNotificationStatic(Object _obj, Pointer<Void> nextSpatialTrajectoryData) {

  try {
    (_obj as SpatialManeuverAzimuthListener).onAzimuthNotification(sdkNavigationSpatialtrajectorydataFromFfi(nextSpatialTrajectoryData));
  } finally {
    sdkNavigationSpatialtrajectorydataReleaseFfiHandle(nextSpatialTrajectoryData);
  }
  return 0;
}


Pointer<Void> sdkNavigationSpatialmaneuverazimuthlistenerToFfi(SpatialManeuverAzimuthListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationSpatialmaneuverazimuthlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationSpatialmaneuverazimuthlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationSpatialmaneuverazimuthlisteneronAzimuthNotificationStatic, __lib.unknownError)
  );

  return result;
}

SpatialManeuverAzimuthListener sdkNavigationSpatialmaneuverazimuthlistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is SpatialManeuverAzimuthListener) return instance;

  final _typeIdHandle = _sdkNavigationSpatialmaneuverazimuthlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationSpatialmaneuverazimuthlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : SpatialManeuverAzimuthListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationSpatialmaneuverazimuthlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationSpatialmaneuverazimuthlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationSpatialmaneuverazimuthlistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationSpatialmaneuverazimuthlistenerToFfiNullable(SpatialManeuverAzimuthListener? value) =>
  value != null ? sdkNavigationSpatialmaneuverazimuthlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

SpatialManeuverAzimuthListener? sdkNavigationSpatialmaneuverazimuthlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationSpatialmaneuverazimuthlistenerFromFfi(handle) : null;

void sdkNavigationSpatialmaneuverazimuthlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpatialmaneuverazimuthlistenerReleaseHandle(handle);

// End of SpatialManeuverAzimuthListener "private" section.


