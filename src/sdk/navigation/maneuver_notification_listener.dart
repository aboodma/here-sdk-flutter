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

/// This abstract class should be implemented in order to receive notifications
/// when maneuver notifications are available from [Navigator].
///
/// Multiple notifications
/// can be given for the same maneuver at different distances.
abstract class ManeuverNotificationListener {
  /// This abstract class should be implemented in order to receive notifications
  /// when maneuver notifications are available from [Navigator].
  ///
  /// Multiple notifications
  /// can be given for the same maneuver at different distances.

  factory ManeuverNotificationListener(
    void Function(String) onManeuverNotificationLambda,

  ) => ManeuverNotificationListener$Lambdas(
    onManeuverNotificationLambda,

  );

  /// Called whenever there is a new notification for a maneuver (multiple notifications can be
  /// given for the same maneuver at different distances (for example: "After 500 meters turn
  /// right." or "Now turn right.") and in that case, this method will be called once for each
  /// distance.
  ///
  /// [text] The text of the maneuver notification.
  ///
  void onManeuverNotification(String text);
}


// ManeuverNotificationListener "private" section, not exported.

final _sdkNavigationManeuvernotificationlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_ManeuverNotificationListener_register_finalizer'));
final _sdkNavigationManeuvernotificationlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationListener_copy_handle'));
final _sdkNavigationManeuvernotificationlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationListener_release_handle'));
final _sdkNavigationManeuvernotificationlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_ManeuverNotificationListener_create_proxy'));
final _sdkNavigationManeuvernotificationlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_ManeuverNotificationListener_get_type_id'));


class ManeuverNotificationListener$Lambdas implements ManeuverNotificationListener {
  void Function(String) onManeuverNotificationLambda;

  ManeuverNotificationListener$Lambdas(
    this.onManeuverNotificationLambda,

  );

  @override
  void onManeuverNotification(String text) =>
    onManeuverNotificationLambda(text);
}

class ManeuverNotificationListener$Impl extends __lib.NativeBase implements ManeuverNotificationListener {

  ManeuverNotificationListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onManeuverNotification(String text) {
    final _onManeuverNotificationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_ManeuverNotificationListener_onManeuverNotification__String'));
    final _textHandle = stringToFfi(text);
    final _handle = this.handle;
    _onManeuverNotificationFfi(_handle, __lib.LibraryContext.isolateId, _textHandle);
    stringReleaseFfiHandle(_textHandle);

  }


}

int _sdkNavigationManeuvernotificationlisteneronManeuverNotificationStatic(Object _obj, Pointer<Void> text) {

  try {
    (_obj as ManeuverNotificationListener).onManeuverNotification(stringFromFfi(text));
  } finally {
    stringReleaseFfiHandle(text);
  }
  return 0;
}


Pointer<Void> sdkNavigationManeuvernotificationlistenerToFfi(ManeuverNotificationListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationManeuvernotificationlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationManeuvernotificationlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationManeuvernotificationlisteneronManeuverNotificationStatic, __lib.unknownError)
  );

  return result;
}

ManeuverNotificationListener sdkNavigationManeuvernotificationlistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ManeuverNotificationListener) return instance;

  final _typeIdHandle = _sdkNavigationManeuvernotificationlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationManeuvernotificationlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ManeuverNotificationListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationManeuvernotificationlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationManeuvernotificationlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationManeuvernotificationlistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationManeuvernotificationlistenerToFfiNullable(ManeuverNotificationListener? value) =>
  value != null ? sdkNavigationManeuvernotificationlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

ManeuverNotificationListener? sdkNavigationManeuvernotificationlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationManeuvernotificationlistenerFromFfi(handle) : null;

void sdkNavigationManeuvernotificationlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationManeuvernotificationlistenerReleaseHandle(handle);

// End of ManeuverNotificationListener "private" section.


