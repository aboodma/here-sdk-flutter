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

/// This abstract class should be
/// implemented in order to receive notifications from this class about the
/// arrival at each [Milestone].
@Deprecated("Will be removed in v4.12.0. Please use [MilestoneStatusListener] instead")
abstract class MilestoneReachedListener {
  /// This abstract class should be
  /// implemented in order to receive notifications from this class about the
  /// arrival at each [Milestone].
  @Deprecated("Will be removed in v4.12.0. Please use [MilestoneStatusListener] instead")

  factory MilestoneReachedListener(
    void Function(Milestone) onMilestoneReachedLambda,

  ) => MilestoneReachedListener$Lambdas(
    onMilestoneReachedLambda,

  );

  /// Called when a milestone has been reached.
  ///
  /// [milestone] A [Milestone] on the route.
  ///
  void onMilestoneReached(Milestone milestone);
}


// MilestoneReachedListener "private" section, not exported.

final _sdkNavigationMilestonereachedlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_MilestoneReachedListener_register_finalizer'));
final _sdkNavigationMilestonereachedlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MilestoneReachedListener_copy_handle'));
final _sdkNavigationMilestonereachedlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MilestoneReachedListener_release_handle'));
final _sdkNavigationMilestonereachedlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_MilestoneReachedListener_create_proxy'));
final _sdkNavigationMilestonereachedlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MilestoneReachedListener_get_type_id'));


class MilestoneReachedListener$Lambdas implements MilestoneReachedListener {
  void Function(Milestone) onMilestoneReachedLambda;

  MilestoneReachedListener$Lambdas(
    this.onMilestoneReachedLambda,

  );

  @override
  void onMilestoneReached(Milestone milestone) =>
    onMilestoneReachedLambda(milestone);
}

class MilestoneReachedListener$Impl extends __lib.NativeBase implements MilestoneReachedListener {

  MilestoneReachedListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onMilestoneReached(Milestone milestone) {
    final _onMilestoneReachedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_MilestoneReachedListener_onMilestoneReached__Milestone'));
    final _milestoneHandle = sdkNavigationMilestoneToFfi(milestone);
    final _handle = this.handle;
    _onMilestoneReachedFfi(_handle, __lib.LibraryContext.isolateId, _milestoneHandle);
    sdkNavigationMilestoneReleaseFfiHandle(_milestoneHandle);

  }


}

int _sdkNavigationMilestonereachedlisteneronMilestoneReachedStatic(Object _obj, Pointer<Void> milestone) {

  try {
    (_obj as MilestoneReachedListener).onMilestoneReached(sdkNavigationMilestoneFromFfi(milestone));
  } finally {
    sdkNavigationMilestoneReleaseFfiHandle(milestone);
  }
  return 0;
}


Pointer<Void> sdkNavigationMilestonereachedlistenerToFfi(MilestoneReachedListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationMilestonereachedlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationMilestonereachedlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationMilestonereachedlisteneronMilestoneReachedStatic, __lib.unknownError)
  );

  return result;
}

MilestoneReachedListener sdkNavigationMilestonereachedlistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MilestoneReachedListener) return instance;

  final _typeIdHandle = _sdkNavigationMilestonereachedlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationMilestonereachedlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MilestoneReachedListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationMilestonereachedlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationMilestonereachedlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationMilestonereachedlistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationMilestonereachedlistenerToFfiNullable(MilestoneReachedListener? value) =>
  value != null ? sdkNavigationMilestonereachedlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

MilestoneReachedListener? sdkNavigationMilestonereachedlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationMilestonereachedlistenerFromFfi(handle) : null;

void sdkNavigationMilestonereachedlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationMilestonereachedlistenerReleaseHandle(handle);

// End of MilestoneReachedListener "private" section.


