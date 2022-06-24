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
import 'package:here_sdk/src/sdk/consent/consent_internal.dart';
import 'package:meta/meta.dart';

/// Consent Foreign Function Interface class.
/// @nodoc
@internal
abstract class ConsentFFI {


  /// @nodoc
  static void internalsetConsentEngineFactory(ConsentFFIConsentEngineFactory factory) => $prototype.internalsetConsentEngineFactory(factory);

  /// @nodoc
  static ConsentInternal? internalcreateConsentEngine() => $prototype.internalcreateConsentEngine();

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = ConsentFFI$Impl(Pointer<Void>.fromAddress(0));
}

/// @nodoc
@internal
typedef ConsentFFIConsentEngineFactory = ConsentInternal? Function();

// ConsentFFIConsentEngineFactory "private" section, not exported.

final _sdkConsentConsentffiConsentenginefactoryRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_consent_ConsentFFI_ConsentEngineFactory_register_finalizer'));
final _sdkConsentConsentffiConsentenginefactoryCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentFFI_ConsentEngineFactory_copy_handle'));
final _sdkConsentConsentffiConsentenginefactoryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentFFI_ConsentEngineFactory_release_handle'));
final _sdkConsentConsentffiConsentenginefactoryCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_consent_ConsentFFI_ConsentEngineFactory_create_proxy'));

class ConsentFFIConsentEngineFactory$Impl {
  final Pointer<Void> handle;
  ConsentFFIConsentEngineFactory$Impl(this.handle);

  ConsentInternal? internalcall() {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_consent_ConsentFFI_ConsentEngineFactory_call'));
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkConsentConsentinternalFromFfiNullable(__resultHandle);
    } finally {
      sdkConsentConsentinternalReleaseFfiHandleNullable(__resultHandle);

    }

  }

}

int _sdkConsentConsentffiConsentenginefactorycallStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  ConsentInternal? _resultObject;
  try {
    _resultObject = (_obj as ConsentFFIConsentEngineFactory)();
    _result.value = sdkConsentConsentinternalToFfiNullable(_resultObject);
  } finally {
  }
  return 0;
}

Pointer<Void> sdkConsentConsentffiConsentenginefactoryToFfi(ConsentFFIConsentEngineFactory value) =>
  _sdkConsentConsentffiConsentenginefactoryCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Pointer<Void>>)>(_sdkConsentConsentffiConsentenginefactorycallStatic, __lib.unknownError)
  );

ConsentFFIConsentEngineFactory sdkConsentConsentffiConsentenginefactoryFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkConsentConsentffiConsentenginefactoryCopyHandle(handle);
  final _impl = ConsentFFIConsentEngineFactory$Impl(_copiedHandle);
  final result = () => _impl.internalcall();
  _sdkConsentConsentffiConsentenginefactoryRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkConsentConsentffiConsentenginefactoryReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkConsentConsentffiConsentenginefactoryReleaseHandle(handle);

// Nullable ConsentFFIConsentEngineFactory

final _sdkConsentConsentffiConsentenginefactoryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentFFI_ConsentEngineFactory_create_handle_nullable'));
final _sdkConsentConsentffiConsentenginefactoryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentFFI_ConsentEngineFactory_release_handle_nullable'));
final _sdkConsentConsentffiConsentenginefactoryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentFFI_ConsentEngineFactory_get_value_nullable'));

Pointer<Void> sdkConsentConsentffiConsentenginefactoryToFfiNullable(ConsentFFIConsentEngineFactory? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkConsentConsentffiConsentenginefactoryToFfi(value);
  final result = _sdkConsentConsentffiConsentenginefactoryCreateHandleNullable(_handle);
  sdkConsentConsentffiConsentenginefactoryReleaseFfiHandle(_handle);
  return result;
}

ConsentFFIConsentEngineFactory? sdkConsentConsentffiConsentenginefactoryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkConsentConsentffiConsentenginefactoryGetValueNullable(handle);
  final result = sdkConsentConsentffiConsentenginefactoryFromFfi(_handle);
  sdkConsentConsentffiConsentenginefactoryReleaseFfiHandle(_handle);
  return result;
}

void sdkConsentConsentffiConsentenginefactoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkConsentConsentffiConsentenginefactoryReleaseHandleNullable(handle);

// End of ConsentFFIConsentEngineFactory "private" section.

// ConsentFFI "private" section, not exported.

final _sdkConsentConsentffiRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_consent_ConsentFFI_register_finalizer'));
final _sdkConsentConsentffiCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentFFI_copy_handle'));
final _sdkConsentConsentffiReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentFFI_release_handle'));




/// @nodoc
@visibleForTesting
class ConsentFFI$Impl extends __lib.NativeBase implements ConsentFFI {

  ConsentFFI$Impl(Pointer<Void> handle) : super(handle);

  void internalsetConsentEngineFactory(ConsentFFIConsentEngineFactory factory) {
    final _setConsentEngineFactoryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('here_sdk_sdk_consent_ConsentFFI_setConsentEngineFactory__ConsentEngineFactory'));
    final _factoryHandle = sdkConsentConsentffiConsentenginefactoryToFfi(factory);
    _setConsentEngineFactoryFfi(__lib.LibraryContext.isolateId, _factoryHandle);
    sdkConsentConsentffiConsentenginefactoryReleaseFfiHandle(_factoryHandle);

  }

  ConsentInternal? internalcreateConsentEngine() {
    final _createConsentEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_consent_ConsentFFI_createConsentEngine'));
    final __resultHandle = _createConsentEngineFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkConsentConsentinternalFromFfiNullable(__resultHandle);
    } finally {
      sdkConsentConsentinternalReleaseFfiHandleNullable(__resultHandle);

    }

  }


}

Pointer<Void> sdkConsentConsentffiToFfi(ConsentFFI value) =>
  _sdkConsentConsentffiCopyHandle((value as __lib.NativeBase).handle);

ConsentFFI sdkConsentConsentffiFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is ConsentFFI) return instance;

  final _copiedHandle = _sdkConsentConsentffiCopyHandle(handle);
  final result = ConsentFFI$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkConsentConsentffiRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkConsentConsentffiReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkConsentConsentffiReleaseHandle(handle);

Pointer<Void> sdkConsentConsentffiToFfiNullable(ConsentFFI? value) =>
  value != null ? sdkConsentConsentffiToFfi(value) : Pointer<Void>.fromAddress(0);

ConsentFFI? sdkConsentConsentffiFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkConsentConsentffiFromFfi(handle) : null;

void sdkConsentConsentffiReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkConsentConsentffiReleaseHandle(handle);

// End of ConsentFFI "private" section.


