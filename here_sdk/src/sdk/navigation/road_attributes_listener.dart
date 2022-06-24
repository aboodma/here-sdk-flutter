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
import 'package:here_sdk/src/sdk/navigation/road_attributes.dart';

/// This Abstract class
/// should be implemented in order to receive attributes of the current road.
abstract class RoadAttributesListener {
  /// This Abstract class
  /// should be implemented in order to receive attributes of the current road.

  factory RoadAttributesListener(
    void Function(RoadAttributes) onRoadAttributesUpdatedLambda,

  ) => RoadAttributesListener$Lambdas(
    onRoadAttributesUpdatedLambda,

  );

  /// Called whenever any attribute of the current road changes.
  ///
  /// It's guaranteed to
  /// be called at least once for the first road the user is traveling on.
  ///
  /// [roadAttributes] The object that contains attributes of the current road.
  ///
  void onRoadAttributesUpdated(RoadAttributes roadAttributes);
}


// RoadAttributesListener "private" section, not exported.

final _sdkNavigationRoadattributeslistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_RoadAttributesListener_register_finalizer'));
final _sdkNavigationRoadattributeslistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributesListener_copy_handle'));
final _sdkNavigationRoadattributeslistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributesListener_release_handle'));
final _sdkNavigationRoadattributeslistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_RoadAttributesListener_create_proxy'));
final _sdkNavigationRoadattributeslistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributesListener_get_type_id'));


class RoadAttributesListener$Lambdas implements RoadAttributesListener {
  void Function(RoadAttributes) onRoadAttributesUpdatedLambda;

  RoadAttributesListener$Lambdas(
    this.onRoadAttributesUpdatedLambda,

  );

  @override
  void onRoadAttributesUpdated(RoadAttributes roadAttributes) =>
    onRoadAttributesUpdatedLambda(roadAttributes);
}

class RoadAttributesListener$Impl extends __lib.NativeBase implements RoadAttributesListener {

  RoadAttributesListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onRoadAttributesUpdated(RoadAttributes roadAttributes) {
    final _onRoadAttributesUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_RoadAttributesListener_onRoadAttributesUpdated__RoadAttributes'));
    final _roadAttributesHandle = sdkNavigationRoadattributesToFfi(roadAttributes);
    final _handle = this.handle;
    _onRoadAttributesUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _roadAttributesHandle);
    sdkNavigationRoadattributesReleaseFfiHandle(_roadAttributesHandle);

  }


}

int _sdkNavigationRoadattributeslisteneronRoadAttributesUpdatedStatic(Object _obj, Pointer<Void> roadAttributes) {

  try {
    (_obj as RoadAttributesListener).onRoadAttributesUpdated(sdkNavigationRoadattributesFromFfi(roadAttributes));
  } finally {
    sdkNavigationRoadattributesReleaseFfiHandle(roadAttributes);
  }
  return 0;
}


Pointer<Void> sdkNavigationRoadattributeslistenerToFfi(RoadAttributesListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationRoadattributeslistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationRoadattributeslistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationRoadattributeslisteneronRoadAttributesUpdatedStatic, __lib.unknownError)
  );

  return result;
}

RoadAttributesListener sdkNavigationRoadattributeslistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is RoadAttributesListener) return instance;

  final _typeIdHandle = _sdkNavigationRoadattributeslistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationRoadattributeslistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : RoadAttributesListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationRoadattributeslistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationRoadattributeslistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationRoadattributeslistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationRoadattributeslistenerToFfiNullable(RoadAttributesListener? value) =>
  value != null ? sdkNavigationRoadattributeslistenerToFfi(value) : Pointer<Void>.fromAddress(0);

RoadAttributesListener? sdkNavigationRoadattributeslistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationRoadattributeslistenerFromFfi(handle) : null;

void sdkNavigationRoadattributeslistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRoadattributeslistenerReleaseHandle(handle);

// End of RoadAttributesListener "private" section.


