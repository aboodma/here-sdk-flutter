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
import 'package:here_sdk/src/sdk/routing/road_texts.dart';

/// This Abstract class
/// should be implemented in order to receive textual attributes of the current road.
abstract class RoadTextsListener {
  /// This Abstract class
  /// should be implemented in order to receive textual attributes of the current road.

  factory RoadTextsListener(
    void Function(RoadTexts) onRoadTextsUpdatedLambda,

  ) => RoadTextsListener$Lambdas(
    onRoadTextsUpdatedLambda,

  );

  /// Called whenever any textual attribute of the current road changes, i.e., the current road
  /// texts differs from the previous one already issued.
  ///
  /// [roadTexts] The object that contains the textual attributes of the current road.
  ///
  void onRoadTextsUpdated(RoadTexts roadTexts);
}


// RoadTextsListener "private" section, not exported.

final _sdkNavigationRoadtextslistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_RoadTextsListener_register_finalizer'));
final _sdkNavigationRoadtextslistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadTextsListener_copy_handle'));
final _sdkNavigationRoadtextslistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadTextsListener_release_handle'));
final _sdkNavigationRoadtextslistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_RoadTextsListener_create_proxy'));
final _sdkNavigationRoadtextslistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadTextsListener_get_type_id'));


class RoadTextsListener$Lambdas implements RoadTextsListener {
  void Function(RoadTexts) onRoadTextsUpdatedLambda;

  RoadTextsListener$Lambdas(
    this.onRoadTextsUpdatedLambda,

  );

  @override
  void onRoadTextsUpdated(RoadTexts roadTexts) =>
    onRoadTextsUpdatedLambda(roadTexts);
}

class RoadTextsListener$Impl extends __lib.NativeBase implements RoadTextsListener {

  RoadTextsListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onRoadTextsUpdated(RoadTexts roadTexts) {
    final _onRoadTextsUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_RoadTextsListener_onRoadTextsUpdated__RoadTexts'));
    final _roadTextsHandle = sdkRoutingRoadtextsToFfi(roadTexts);
    final _handle = this.handle;
    _onRoadTextsUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _roadTextsHandle);
    sdkRoutingRoadtextsReleaseFfiHandle(_roadTextsHandle);

  }


}

int _sdkNavigationRoadtextslisteneronRoadTextsUpdatedStatic(Object _obj, Pointer<Void> roadTexts) {

  try {
    (_obj as RoadTextsListener).onRoadTextsUpdated(sdkRoutingRoadtextsFromFfi(roadTexts));
  } finally {
    sdkRoutingRoadtextsReleaseFfiHandle(roadTexts);
  }
  return 0;
}


Pointer<Void> sdkNavigationRoadtextslistenerToFfi(RoadTextsListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationRoadtextslistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationRoadtextslistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationRoadtextslisteneronRoadTextsUpdatedStatic, __lib.unknownError)
  );

  return result;
}

RoadTextsListener sdkNavigationRoadtextslistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is RoadTextsListener) return instance;

  final _typeIdHandle = _sdkNavigationRoadtextslistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationRoadtextslistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : RoadTextsListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationRoadtextslistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationRoadtextslistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationRoadtextslistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationRoadtextslistenerToFfiNullable(RoadTextsListener? value) =>
  value != null ? sdkNavigationRoadtextslistenerToFfi(value) : Pointer<Void>.fromAddress(0);

RoadTextsListener? sdkNavigationRoadtextslistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationRoadtextslistenerFromFfi(handle) : null;

void sdkNavigationRoadtextslistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRoadtextslistenerReleaseHandle(handle);

// End of RoadTextsListener "private" section.


