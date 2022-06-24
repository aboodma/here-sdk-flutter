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
import 'package:here_sdk/src/sdk/navigation/junction_view_lane_assistance.dart';

/// This abstract class should be
/// implemented in order to receive notifications on [JunctionViewLaneAssistance].
///
/// See [JunctionViewLaneAssistance] documentation for further details.
abstract class JunctionViewLaneAssistanceListener {
  /// This abstract class should be
  /// implemented in order to receive notifications on [JunctionViewLaneAssistance].
  ///
  /// See [JunctionViewLaneAssistance] documentation for further details.

  factory JunctionViewLaneAssistanceListener(
    void Function(JunctionViewLaneAssistance) onLaneAssistanceUpdatedLambda,

  ) => JunctionViewLaneAssistanceListener$Lambdas(
    onLaneAssistanceUpdatedLambda,

  );

  /// Called before and after a complex junction if lane recommendations are available.
  ///
  /// [laneAssistance] The [JunctionViewLaneAssistance] notification.
  ///
  void onLaneAssistanceUpdated(JunctionViewLaneAssistance laneAssistance);
}


// JunctionViewLaneAssistanceListener "private" section, not exported.

final _sdkNavigationJunctionviewlaneassistancelistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_JunctionViewLaneAssistanceListener_register_finalizer'));
final _sdkNavigationJunctionviewlaneassistancelistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_JunctionViewLaneAssistanceListener_copy_handle'));
final _sdkNavigationJunctionviewlaneassistancelistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_JunctionViewLaneAssistanceListener_release_handle'));
final _sdkNavigationJunctionviewlaneassistancelistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_JunctionViewLaneAssistanceListener_create_proxy'));
final _sdkNavigationJunctionviewlaneassistancelistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_JunctionViewLaneAssistanceListener_get_type_id'));


class JunctionViewLaneAssistanceListener$Lambdas implements JunctionViewLaneAssistanceListener {
  void Function(JunctionViewLaneAssistance) onLaneAssistanceUpdatedLambda;

  JunctionViewLaneAssistanceListener$Lambdas(
    this.onLaneAssistanceUpdatedLambda,

  );

  @override
  void onLaneAssistanceUpdated(JunctionViewLaneAssistance laneAssistance) =>
    onLaneAssistanceUpdatedLambda(laneAssistance);
}

class JunctionViewLaneAssistanceListener$Impl extends __lib.NativeBase implements JunctionViewLaneAssistanceListener {

  JunctionViewLaneAssistanceListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onLaneAssistanceUpdated(JunctionViewLaneAssistance laneAssistance) {
    final _onLaneAssistanceUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_JunctionViewLaneAssistanceListener_onLaneAssistanceUpdated__JunctionViewLaneAssistance'));
    final _laneAssistanceHandle = sdkNavigationJunctionviewlaneassistanceToFfi(laneAssistance);
    final _handle = this.handle;
    _onLaneAssistanceUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _laneAssistanceHandle);
    sdkNavigationJunctionviewlaneassistanceReleaseFfiHandle(_laneAssistanceHandle);

  }


}

int _sdkNavigationJunctionviewlaneassistancelisteneronLaneAssistanceUpdatedStatic(Object _obj, Pointer<Void> laneAssistance) {

  try {
    (_obj as JunctionViewLaneAssistanceListener).onLaneAssistanceUpdated(sdkNavigationJunctionviewlaneassistanceFromFfi(laneAssistance));
  } finally {
    sdkNavigationJunctionviewlaneassistanceReleaseFfiHandle(laneAssistance);
  }
  return 0;
}


Pointer<Void> sdkNavigationJunctionviewlaneassistancelistenerToFfi(JunctionViewLaneAssistanceListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationJunctionviewlaneassistancelistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationJunctionviewlaneassistancelistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationJunctionviewlaneassistancelisteneronLaneAssistanceUpdatedStatic, __lib.unknownError)
  );

  return result;
}

JunctionViewLaneAssistanceListener sdkNavigationJunctionviewlaneassistancelistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is JunctionViewLaneAssistanceListener) return instance;

  final _typeIdHandle = _sdkNavigationJunctionviewlaneassistancelistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationJunctionviewlaneassistancelistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : JunctionViewLaneAssistanceListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationJunctionviewlaneassistancelistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationJunctionviewlaneassistancelistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationJunctionviewlaneassistancelistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationJunctionviewlaneassistancelistenerToFfiNullable(JunctionViewLaneAssistanceListener? value) =>
  value != null ? sdkNavigationJunctionviewlaneassistancelistenerToFfi(value) : Pointer<Void>.fromAddress(0);

JunctionViewLaneAssistanceListener? sdkNavigationJunctionviewlaneassistancelistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationJunctionviewlaneassistancelistenerFromFfi(handle) : null;

void sdkNavigationJunctionviewlaneassistancelistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationJunctionviewlaneassistancelistenerReleaseHandle(handle);

// End of JunctionViewLaneAssistanceListener "private" section.


