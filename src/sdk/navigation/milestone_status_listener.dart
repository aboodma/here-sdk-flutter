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
import 'package:here_sdk/src/sdk/navigation/milestone.dart';
import 'package:here_sdk/src/sdk/navigation/milestone_status.dart';

/// This abstract class should be
/// implemented in order to receive notifications from this class about the
/// arrival at each [Milestone] or missing it.
abstract class MilestoneStatusListener {
  /// This abstract class should be
  /// implemented in order to receive notifications from this class about the
  /// arrival at each [Milestone] or missing it.

  factory MilestoneStatusListener(
    void Function(Milestone, MilestoneStatus) onMilestoneStatusUpdatedLambda,

  ) => MilestoneStatusListener$Lambdas(
    onMilestoneStatusUpdatedLambda,

  );

  /// Called when a milestone status has been changed.
  ///
  /// [milestone] The reference to the [Milestone].
  ///
  /// [status] The status of the [Milestone].
  ///
  void onMilestoneStatusUpdated(Milestone milestone, MilestoneStatus status);
}


// MilestoneStatusListener "private" section, not exported.

final _sdkNavigationMilestonestatuslistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_MilestoneStatusListener_register_finalizer'));
final _sdkNavigationMilestonestatuslistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MilestoneStatusListener_copy_handle'));
final _sdkNavigationMilestonestatuslistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MilestoneStatusListener_release_handle'));
final _sdkNavigationMilestonestatuslistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_MilestoneStatusListener_create_proxy'));
final _sdkNavigationMilestonestatuslistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MilestoneStatusListener_get_type_id'));


class MilestoneStatusListener$Lambdas implements MilestoneStatusListener {
  void Function(Milestone, MilestoneStatus) onMilestoneStatusUpdatedLambda;

  MilestoneStatusListener$Lambdas(
    this.onMilestoneStatusUpdatedLambda,

  );

  @override
  void onMilestoneStatusUpdated(Milestone milestone, MilestoneStatus status) =>
    onMilestoneStatusUpdatedLambda(milestone, status);
}

class MilestoneStatusListener$Impl extends __lib.NativeBase implements MilestoneStatusListener {

  MilestoneStatusListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onMilestoneStatusUpdated(Milestone milestone, MilestoneStatus status) {
    final _onMilestoneStatusUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Uint32), void Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_navigation_MilestoneStatusListener_onMilestoneStatusUpdated__Milestone_MilestoneStatus'));
    final _milestoneHandle = sdkNavigationMilestoneToFfi(milestone);
    final _statusHandle = sdkNavigationMilestonestatusToFfi(status);
    final _handle = this.handle;
    _onMilestoneStatusUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _milestoneHandle, _statusHandle);
    sdkNavigationMilestoneReleaseFfiHandle(_milestoneHandle);
    sdkNavigationMilestonestatusReleaseFfiHandle(_statusHandle);

  }


}

int _sdkNavigationMilestonestatuslisteneronMilestoneStatusUpdatedStatic(Object _obj, Pointer<Void> milestone, int status) {

  try {
    (_obj as MilestoneStatusListener).onMilestoneStatusUpdated(sdkNavigationMilestoneFromFfi(milestone), sdkNavigationMilestonestatusFromFfi(status));
  } finally {
    sdkNavigationMilestoneReleaseFfiHandle(milestone);
    sdkNavigationMilestonestatusReleaseFfiHandle(status);
  }
  return 0;
}


Pointer<Void> sdkNavigationMilestonestatuslistenerToFfi(MilestoneStatusListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationMilestonestatuslistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationMilestonestatuslistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Uint32)>(_sdkNavigationMilestonestatuslisteneronMilestoneStatusUpdatedStatic, __lib.unknownError)
  );

  return result;
}

MilestoneStatusListener sdkNavigationMilestonestatuslistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MilestoneStatusListener) return instance;

  final _typeIdHandle = _sdkNavigationMilestonestatuslistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationMilestonestatuslistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MilestoneStatusListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationMilestonestatuslistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationMilestonestatuslistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationMilestonestatuslistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationMilestonestatuslistenerToFfiNullable(MilestoneStatusListener? value) =>
  value != null ? sdkNavigationMilestonestatuslistenerToFfi(value) : Pointer<Void>.fromAddress(0);

MilestoneStatusListener? sdkNavigationMilestonestatuslistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationMilestonestatuslistenerFromFfi(handle) : null;

void sdkNavigationMilestonestatuslistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationMilestonestatuslistenerReleaseHandle(handle);

// End of MilestoneStatusListener "private" section.


