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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/post_action.dart';

/// This Abstract class should be implemented in order to
/// receive post action notifications.
abstract class PostActionListener {
  /// This Abstract class should be implemented in order to
  /// receive post action notifications.

  factory PostActionListener(
    void Function(List<PostAction>) onPostActionsLambda,

  ) => PostActionListener$Lambdas(
    onPostActionsLambda,

  );

  /// Called whenever [PostAction]'s are available.
  ///
  /// Note that
  /// [PostAction]'s are performed after the arrival at the end of a section.
  ///
  /// [postActions] The post actions that should be performed.
  ///
  void onPostActions(List<PostAction> postActions);
}


// PostActionListener "private" section, not exported.

final _sdkNavigationPostactionlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_PostActionListener_register_finalizer'));
final _sdkNavigationPostactionlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_PostActionListener_copy_handle'));
final _sdkNavigationPostactionlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_PostActionListener_release_handle'));
final _sdkNavigationPostactionlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_PostActionListener_create_proxy'));
final _sdkNavigationPostactionlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_PostActionListener_get_type_id'));


class PostActionListener$Lambdas implements PostActionListener {
  void Function(List<PostAction>) onPostActionsLambda;

  PostActionListener$Lambdas(
    this.onPostActionsLambda,

  );

  @override
  void onPostActions(List<PostAction> postActions) =>
    onPostActionsLambda(postActions);
}

class PostActionListener$Impl extends __lib.NativeBase implements PostActionListener {

  PostActionListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onPostActions(List<PostAction> postActions) {
    final _onPostActionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_PostActionListener_onPostActions__ListOf_sdk_routing_PostAction'));
    final _postActionsHandle = heresdkNavigationBindingslistofSdkRoutingPostactionToFfi(postActions);
    final _handle = this.handle;
    _onPostActionsFfi(_handle, __lib.LibraryContext.isolateId, _postActionsHandle);
    heresdkNavigationBindingslistofSdkRoutingPostactionReleaseFfiHandle(_postActionsHandle);

  }


}

int _sdkNavigationPostactionlisteneronPostActionsStatic(Object _obj, Pointer<Void> postActions) {

  try {
    (_obj as PostActionListener).onPostActions(heresdkNavigationBindingslistofSdkRoutingPostactionFromFfi(postActions));
  } finally {
    heresdkNavigationBindingslistofSdkRoutingPostactionReleaseFfiHandle(postActions);
  }
  return 0;
}


Pointer<Void> sdkNavigationPostactionlistenerToFfi(PostActionListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationPostactionlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationPostactionlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationPostactionlisteneronPostActionsStatic, __lib.unknownError)
  );

  return result;
}

PostActionListener sdkNavigationPostactionlistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PostActionListener) return instance;

  final _typeIdHandle = _sdkNavigationPostactionlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationPostactionlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : PostActionListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationPostactionlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationPostactionlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationPostactionlistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationPostactionlistenerToFfiNullable(PostActionListener? value) =>
  value != null ? sdkNavigationPostactionlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

PostActionListener? sdkNavigationPostactionlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationPostactionlistenerFromFfi(handle) : null;

void sdkNavigationPostactionlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationPostactionlistenerReleaseHandle(handle);

// End of PostActionListener "private" section.


