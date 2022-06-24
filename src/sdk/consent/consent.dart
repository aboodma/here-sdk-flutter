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
import 'package:here_sdk/src/sdk/consent/consent_status.dart';

/// Use the Consent abstract class to control user consent for different data collection scenarios.
abstract class Consent {
  /// Use the Consent abstract class to control user consent for different data collection scenarios.

  factory Consent(
    ConsentStatus Function() grantUserConsentLambda,
    ConsentStatus Function() denyUserConsentLambda,
    ConsentUserReply Function() userConsentStateGetLambda
  ) => Consent$Lambdas(
    grantUserConsentLambda,
    denyUserConsentLambda,
    userConsentStateGetLambda
  );

  /// Grant consent for data contribution.
  ///
  /// Returns [ConsentStatus]. [ConsentStatus.ok] if call succeeded, [ConsentStatus.errNotAllowed] if application is not certified,
  /// or [ConsentStatus.pending] if application's certification  status is not yet known.
  ///
  ConsentStatus grantUserConsent();
  /// Deny consent for data contribution.
  ///
  /// Returns [ConsentStatus]. [ConsentStatus.ok] if call succeeded, [ConsentStatus.errNotAllowed]  if application is not certified,
  /// or [ConsentStatus.pending] if application's certification status is not yet known.
  ///
  ConsentStatus denyUserConsent();
  /// Gets the current user consent state.
  ConsentUserReply get userConsentState;

}

/// State of the user reply regarding consent.
enum ConsentUserReply {
    /// Consent granted.
    granted,
    /// Consent denied.
    denied,
    /// Consent has not been handled. Application needs to call one of following
    /// [Consent.requestUserConsent], [Consent.grantUserConsent] or [Consent.denyUserConsent].
    notHandled,
    /// Consent is being requested from the user (the Consent dialog is currently being
    /// shown to the user).
    requesting
}

// ConsentUserReply "private" section, not exported.

int sdkConsentConsentUserreplyToFfi(ConsentUserReply value) {
  switch (value) {
  case ConsentUserReply.granted:
    return 0;
  case ConsentUserReply.denied:
    return 1;
  case ConsentUserReply.notHandled:
    return 2;
  case ConsentUserReply.requesting:
    return 3;
  default:
    throw StateError("Invalid enum value $value for ConsentUserReply enum.");
  }
}

ConsentUserReply sdkConsentConsentUserreplyFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ConsentUserReply.granted;
  case 1:
    return ConsentUserReply.denied;
  case 2:
    return ConsentUserReply.notHandled;
  case 3:
    return ConsentUserReply.requesting;
  default:
    throw StateError("Invalid numeric value $handle for ConsentUserReply enum.");
  }
}

void sdkConsentConsentUserreplyReleaseFfiHandle(int handle) {}

final _sdkConsentConsentUserreplyCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_consent_Consent_UserReply_create_handle_nullable'));
final _sdkConsentConsentUserreplyReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_consent_Consent_UserReply_release_handle_nullable'));
final _sdkConsentConsentUserreplyGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_consent_Consent_UserReply_get_value_nullable'));

Pointer<Void> sdkConsentConsentUserreplyToFfiNullable(ConsentUserReply? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkConsentConsentUserreplyToFfi(value);
  final result = _sdkConsentConsentUserreplyCreateHandleNullable(_handle);
  sdkConsentConsentUserreplyReleaseFfiHandle(_handle);
  return result;
}

ConsentUserReply? sdkConsentConsentUserreplyFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkConsentConsentUserreplyGetValueNullable(handle);
  final result = sdkConsentConsentUserreplyFromFfi(_handle);
  sdkConsentConsentUserreplyReleaseFfiHandle(_handle);
  return result;
}

void sdkConsentConsentUserreplyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkConsentConsentUserreplyReleaseHandleNullable(handle);

// End of ConsentUserReply "private" section.

// Consent "private" section, not exported.

final _sdkConsentConsentRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_consent_Consent_register_finalizer'));
final _sdkConsentConsentCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_consent_Consent_copy_handle'));
final _sdkConsentConsentReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_consent_Consent_release_handle'));
final _sdkConsentConsentCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_consent_Consent_create_proxy'));
final _sdkConsentConsentGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_consent_Consent_get_type_id'));



class Consent$Lambdas implements Consent {
  ConsentStatus Function() grantUserConsentLambda;
  ConsentStatus Function() denyUserConsentLambda;
  ConsentUserReply Function() userConsentStateGetLambda;

  Consent$Lambdas(
    this.grantUserConsentLambda,
    this.denyUserConsentLambda,
    this.userConsentStateGetLambda
  );

  @override
  ConsentStatus grantUserConsent() =>
    grantUserConsentLambda();
  @override
  ConsentStatus denyUserConsent() =>
    denyUserConsentLambda();
  @override
  ConsentUserReply get userConsentState => userConsentStateGetLambda();
}

class Consent$Impl extends __lib.NativeBase implements Consent {

  Consent$Impl(Pointer<Void> handle) : super(handle);

  @override
  ConsentStatus grantUserConsent() {
    final _grantUserConsentFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_consent_Consent_grantUserConsent'));
    final _handle = this.handle;
    final __resultHandle = _grantUserConsentFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkConsentConsentstatusFromFfi(__resultHandle);
    } finally {
      sdkConsentConsentstatusReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  ConsentStatus denyUserConsent() {
    final _denyUserConsentFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_consent_Consent_denyUserConsent'));
    final _handle = this.handle;
    final __resultHandle = _denyUserConsentFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkConsentConsentstatusFromFfi(__resultHandle);
    } finally {
      sdkConsentConsentstatusReleaseFfiHandle(__resultHandle);

    }

  }

  /// Gets the current user consent state.
  ConsentUserReply get userConsentState {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_consent_Consent_userConsentState_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkConsentConsentUserreplyFromFfi(__resultHandle);
    } finally {
      sdkConsentConsentUserreplyReleaseFfiHandle(__resultHandle);

    }

  }



}

int _sdkConsentConsentgrantUserConsentStatic(Object _obj, Pointer<Uint32> _result) {
  ConsentStatus? _resultObject;
  try {
    _resultObject = (_obj as Consent).grantUserConsent();
    _result.value = sdkConsentConsentstatusToFfi(_resultObject);
  } finally {
  }
  return 0;
}
int _sdkConsentConsentdenyUserConsentStatic(Object _obj, Pointer<Uint32> _result) {
  ConsentStatus? _resultObject;
  try {
    _resultObject = (_obj as Consent).denyUserConsent();
    _result.value = sdkConsentConsentstatusToFfi(_resultObject);
  } finally {
  }
  return 0;
}

int _sdkConsentConsentuserConsentStateGetStatic(Object _obj, Pointer<Uint32> _result) {
  _result.value = sdkConsentConsentUserreplyToFfi((_obj as Consent).userConsentState);
  return 0;
}

Pointer<Void> sdkConsentConsentToFfi(Consent value) {
  if (value is __lib.NativeBase) return _sdkConsentConsentCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkConsentConsentCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint32>)>(_sdkConsentConsentgrantUserConsentStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint32>)>(_sdkConsentConsentdenyUserConsentStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint32>)>(_sdkConsentConsentuserConsentStateGetStatic, __lib.unknownError)
  );

  return result;
}

Consent sdkConsentConsentFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Consent) return instance;

  final _typeIdHandle = _sdkConsentConsentGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkConsentConsentCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : Consent$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkConsentConsentRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkConsentConsentReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkConsentConsentReleaseHandle(handle);

Pointer<Void> sdkConsentConsentToFfiNullable(Consent? value) =>
  value != null ? sdkConsentConsentToFfi(value) : Pointer<Void>.fromAddress(0);

Consent? sdkConsentConsentFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkConsentConsentFromFfi(handle) : null;

void sdkConsentConsentReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkConsentConsentReleaseHandle(handle);

// End of Consent "private" section.


