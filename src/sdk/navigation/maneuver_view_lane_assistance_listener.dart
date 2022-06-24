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
import 'package:here_sdk/src/sdk/navigation/maneuver_view_lane_assistance.dart';

/// This abstract class should be
/// implemented in order to receive notifications on [ManeuverViewLaneAssistance].
///
/// See [ManeuverViewLaneAssistance] documentation for further details.
abstract class ManeuverViewLaneAssistanceListener {
  /// This abstract class should be
  /// implemented in order to receive notifications on [ManeuverViewLaneAssistance].
  ///
  /// See [ManeuverViewLaneAssistance] documentation for further details.

  factory ManeuverViewLaneAssistanceListener(
    void Function(ManeuverViewLaneAssistance) onLaneAssistanceUpdatedLambda,

  ) => ManeuverViewLaneAssistanceListener$Lambdas(
    onLaneAssistanceUpdatedLambda,

  );

  /// Called before approaching a maneuver and the maneuver thereafter if lane recommendations are available.
  ///
  /// [laneAssistance] The [ManeuverViewLaneAssistance] notification.
  ///
  void onLaneAssistanceUpdated(ManeuverViewLaneAssistance laneAssistance);
}


// ManeuverViewLaneAssistanceListener "private" section, not exported.

final _sdkNavigationManeuverviewlaneassistancelistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_ManeuverViewLaneAssistanceListener_register_finalizer'));
final _sdkNavigationManeuverviewlaneassistancelistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverViewLaneAssistanceListener_copy_handle'));
final _sdkNavigationManeuverviewlaneassistancelistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverViewLaneAssistanceListener_release_handle'));
final _sdkNavigationManeuverviewlaneassistancelistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_ManeuverViewLaneAssistanceListener_create_proxy'));
final _sdkNavigationManeuverviewlaneassistancelistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverViewLaneAssistanceListener_get_type_id'));


class ManeuverViewLaneAssistanceListener$Lambdas implements ManeuverViewLaneAssistanceListener {
  void Function(ManeuverViewLaneAssistance) onLaneAssistanceUpdatedLambda;

  ManeuverViewLaneAssistanceListener$Lambdas(
    this.onLaneAssistanceUpdatedLambda,

  );

  @override
  void onLaneAssistanceUpdated(ManeuverViewLaneAssistance laneAssistance) =>
    onLaneAssistanceUpdatedLambda(laneAssistance);
}

class ManeuverViewLaneAssistanceListener$Impl extends __lib.NativeBase implements ManeuverViewLaneAssistanceListener {

  ManeuverViewLaneAssistanceListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onLaneAssistanceUpdated(ManeuverViewLaneAssistance laneAssistance) {
    final _onLaneAssistanceUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_ManeuverViewLaneAssistanceListener_onLaneAssistanceUpdated__ManeuverViewLaneAssistance'));
    final _laneAssistanceHandle = sdkNavigationManeuverviewlaneassistanceToFfi(laneAssistance);
    final _handle = this.handle;
    _onLaneAssistanceUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _laneAssistanceHandle);
    sdkNavigationManeuverviewlaneassistanceReleaseFfiHandle(_laneAssistanceHandle);

  }


}

int _sdkNavigationManeuverviewlaneassistancelisteneronLaneAssistanceUpdatedStatic(Object _obj, Pointer<Void> laneAssistance) {

  try {
    (_obj as ManeuverViewLaneAssistanceListener).onLaneAssistanceUpdated(sdkNavigationManeuverviewlaneassistanceFromFfi(laneAssistance));
  } finally {
    sdkNavigationManeuverviewlaneassistanceReleaseFfiHandle(laneAssistance);
  }
  return 0;
}


Pointer<Void> sdkNavigationManeuverviewlaneassistancelistenerToFfi(ManeuverViewLaneAssistanceListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationManeuverviewlaneassistancelistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationManeuverviewlaneassistancelistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationManeuverviewlaneassistancelisteneronLaneAssistanceUpdatedStatic, __lib.unknownError)
  );

  return result;
}

ManeuverViewLaneAssistanceListener sdkNavigationManeuverviewlaneassistancelistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ManeuverViewLaneAssistanceListener) return instance;

  final _typeIdHandle = _sdkNavigationManeuverviewlaneassistancelistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationManeuverviewlaneassistancelistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ManeuverViewLaneAssistanceListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationManeuverviewlaneassistancelistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationManeuverviewlaneassistancelistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationManeuverviewlaneassistancelistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationManeuverviewlaneassistancelistenerToFfiNullable(ManeuverViewLaneAssistanceListener? value) =>
  value != null ? sdkNavigationManeuverviewlaneassistancelistenerToFfi(value) : Pointer<Void>.fromAddress(0);

ManeuverViewLaneAssistanceListener? sdkNavigationManeuverviewlaneassistancelistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationManeuverviewlaneassistancelistenerFromFfi(handle) : null;

void sdkNavigationManeuverviewlaneassistancelistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationManeuverviewlaneassistancelistenerReleaseHandle(handle);

// End of ManeuverViewLaneAssistanceListener "private" section.


