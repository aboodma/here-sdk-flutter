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
import 'package:here_sdk/src/sdk/navigation/truck_restriction_warning.dart';

/// This Abstract class
/// should be implemented in order to receive truck restriction warnings.
abstract class TruckRestrictionsWarningListener {
  /// This Abstract class
  /// should be implemented in order to receive truck restriction warnings.

  factory TruckRestrictionsWarningListener(
    void Function(List<TruckRestrictionWarning>) onTruckRestrictionsWarningUpdatedLambda,

  ) => TruckRestrictionsWarningListener$Lambdas(
    onTruckRestrictionsWarningUpdatedLambda,

  );

  /// Called with warnings whenever truck restrictions for the current road are present.
  ///
  /// [restrictions] A list of upcoming restriction warnings on the current road.
  ///
  void onTruckRestrictionsWarningUpdated(List<TruckRestrictionWarning> restrictions);
}


// TruckRestrictionsWarningListener "private" section, not exported.

final _sdkNavigationTruckrestrictionswarninglistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_TruckRestrictionsWarningListener_register_finalizer'));
final _sdkNavigationTruckrestrictionswarninglistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionsWarningListener_copy_handle'));
final _sdkNavigationTruckrestrictionswarninglistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionsWarningListener_release_handle'));
final _sdkNavigationTruckrestrictionswarninglistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_navigation_TruckRestrictionsWarningListener_create_proxy'));
final _sdkNavigationTruckrestrictionswarninglistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionsWarningListener_get_type_id'));


class TruckRestrictionsWarningListener$Lambdas implements TruckRestrictionsWarningListener {
  void Function(List<TruckRestrictionWarning>) onTruckRestrictionsWarningUpdatedLambda;

  TruckRestrictionsWarningListener$Lambdas(
    this.onTruckRestrictionsWarningUpdatedLambda,

  );

  @override
  void onTruckRestrictionsWarningUpdated(List<TruckRestrictionWarning> restrictions) =>
    onTruckRestrictionsWarningUpdatedLambda(restrictions);
}

class TruckRestrictionsWarningListener$Impl extends __lib.NativeBase implements TruckRestrictionsWarningListener {

  TruckRestrictionsWarningListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onTruckRestrictionsWarningUpdated(List<TruckRestrictionWarning> restrictions) {
    final _onTruckRestrictionsWarningUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_TruckRestrictionsWarningListener_onTruckRestrictionsWarningUpdated__ListOf_sdk_navigation_TruckRestrictionWarning'));
    final _restrictionsHandle = heresdkNavigationBindingslistofSdkNavigationTruckrestrictionwarningToFfi(restrictions);
    final _handle = this.handle;
    _onTruckRestrictionsWarningUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _restrictionsHandle);
    heresdkNavigationBindingslistofSdkNavigationTruckrestrictionwarningReleaseFfiHandle(_restrictionsHandle);

  }


}

int _sdkNavigationTruckrestrictionswarninglisteneronTruckRestrictionsWarningUpdatedStatic(Object _obj, Pointer<Void> restrictions) {

  try {
    (_obj as TruckRestrictionsWarningListener).onTruckRestrictionsWarningUpdated(heresdkNavigationBindingslistofSdkNavigationTruckrestrictionwarningFromFfi(restrictions));
  } finally {
    heresdkNavigationBindingslistofSdkNavigationTruckrestrictionwarningReleaseFfiHandle(restrictions);
  }
  return 0;
}


Pointer<Void> sdkNavigationTruckrestrictionswarninglistenerToFfi(TruckRestrictionsWarningListener value) {
  if (value is __lib.NativeBase) return _sdkNavigationTruckrestrictionswarninglistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationTruckrestrictionswarninglistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationTruckrestrictionswarninglisteneronTruckRestrictionsWarningUpdatedStatic, __lib.unknownError)
  );

  return result;
}

TruckRestrictionsWarningListener sdkNavigationTruckrestrictionswarninglistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TruckRestrictionsWarningListener) return instance;

  final _typeIdHandle = _sdkNavigationTruckrestrictionswarninglistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationTruckrestrictionswarninglistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TruckRestrictionsWarningListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationTruckrestrictionswarninglistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationTruckrestrictionswarninglistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationTruckrestrictionswarninglistenerReleaseHandle(handle);

Pointer<Void> sdkNavigationTruckrestrictionswarninglistenerToFfiNullable(TruckRestrictionsWarningListener? value) =>
  value != null ? sdkNavigationTruckrestrictionswarninglistenerToFfi(value) : Pointer<Void>.fromAddress(0);

TruckRestrictionsWarningListener? sdkNavigationTruckrestrictionswarninglistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationTruckrestrictionswarninglistenerFromFfi(handle) : null;

void sdkNavigationTruckrestrictionswarninglistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationTruckrestrictionswarninglistenerReleaseHandle(handle);

// End of TruckRestrictionsWarningListener "private" section.


