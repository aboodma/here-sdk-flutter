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
import 'package:here_sdk/src/sdk/consent/consent_feature.dart';
import 'package:here_sdk/src/sdk/consent/consent_state.dart';

/// Consent state listener.
/// @nodoc
abstract class ConsentListener {
  /// Consent state listener.
  /// @nodoc

  factory ConsentListener(
    void Function(ConsentFeature, ConsentState) onConsentUpdatedLambda,

  ) => ConsentListener$Lambdas(
    onConsentUpdatedLambda,

  );

  /// This callback is called when business feature used in registration
  /// has been allocated for the application and the contribution consent
  /// state changes.
  ///
  /// [feature] Business feature for which consent is updated.
  ///
  /// [state] New contribution consent state.
  ///
  void onConsentUpdated(ConsentFeature feature, ConsentState state);
}


// ConsentListener "private" section, not exported.

final _sdkConsentConsentlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_consent_ConsentListener_register_finalizer'));
final _sdkConsentConsentlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentListener_copy_handle'));
final _sdkConsentConsentlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentListener_release_handle'));
final _sdkConsentConsentlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_consent_ConsentListener_create_proxy'));
final _sdkConsentConsentlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentListener_get_type_id'));


class ConsentListener$Lambdas implements ConsentListener {
  void Function(ConsentFeature, ConsentState) onConsentUpdatedLambda;

  ConsentListener$Lambdas(
    this.onConsentUpdatedLambda,

  );

  @override
  void onConsentUpdated(ConsentFeature feature, ConsentState state) =>
    onConsentUpdatedLambda(feature, state);
}

class ConsentListener$Impl extends __lib.NativeBase implements ConsentListener {

  ConsentListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onConsentUpdated(ConsentFeature feature, ConsentState state) {
    final _onConsentUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Uint32), void Function(Pointer<Void>, int, int, int)>('here_sdk_sdk_consent_ConsentListener_onConsentUpdated__ConsentFeature_ConsentState'));
    final _featureHandle = sdkConsentConsentfeatureToFfi(feature);
    final _stateHandle = sdkConsentConsentstateToFfi(state);
    final _handle = this.handle;
    _onConsentUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _featureHandle, _stateHandle);
    sdkConsentConsentfeatureReleaseFfiHandle(_featureHandle);
    sdkConsentConsentstateReleaseFfiHandle(_stateHandle);

  }


}

int _sdkConsentConsentlisteneronConsentUpdatedStatic(Object _obj, int feature, int state) {

  try {
    (_obj as ConsentListener).onConsentUpdated(sdkConsentConsentfeatureFromFfi(feature), sdkConsentConsentstateFromFfi(state));
  } finally {
    sdkConsentConsentfeatureReleaseFfiHandle(feature);
    sdkConsentConsentstateReleaseFfiHandle(state);
  }
  return 0;
}


Pointer<Void> sdkConsentConsentlistenerToFfi(ConsentListener value) {
  if (value is __lib.NativeBase) return _sdkConsentConsentlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkConsentConsentlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Uint32, Uint32)>(_sdkConsentConsentlisteneronConsentUpdatedStatic, __lib.unknownError)
  );

  return result;
}

ConsentListener sdkConsentConsentlistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ConsentListener) return instance;

  final _typeIdHandle = _sdkConsentConsentlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkConsentConsentlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : ConsentListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkConsentConsentlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkConsentConsentlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkConsentConsentlistenerReleaseHandle(handle);

Pointer<Void> sdkConsentConsentlistenerToFfiNullable(ConsentListener? value) =>
  value != null ? sdkConsentConsentlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

ConsentListener? sdkConsentConsentlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkConsentConsentlistenerFromFfi(handle) : null;

void sdkConsentConsentlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkConsentConsentlistenerReleaseHandle(handle);

// End of ConsentListener "private" section.


