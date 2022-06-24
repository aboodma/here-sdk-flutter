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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/location/location_engine_base.dart';
import 'package:here_sdk/src/sdk/location/location_feature.dart';
import 'package:meta/meta.dart';

/// LocationFFI
/// @nodoc
abstract class LocationFFI {

  /// Registers SDK offline mode change listener.
  ///
  /// Returns current offline mode on call.
  ///
  /// @nodoc
  static bool setLocationOfflineModeListener(LocationFFILocationOfflineModeListener listener) => $prototype.setLocationOfflineModeListener(listener);
  /// Sets location engine factory.
  ///
  /// @nodoc
  static void setLocationEngineFactory(LocationFFILocationEngineFactory factory) => $prototype.setLocationEngineFactory(factory);
  /// Creates and returns new instance of location engine.
  ///
  /// @nodoc
  static LocationEngineBase? createLocationEngine() => $prototype.createLocationEngine();
  /// Registers authorization change listener.
  ///
  /// Returns current status on call.
  ///
  /// @nodoc
  static LocationFFIAuthorizationResult setAuthorizationListener(LocationFFIAuthorizationListener listener) => $prototype.setAuthorizationListener(listener);
  /// Start authorization for the feature.
  ///
  /// [locationFeature] Authorized feature.
  ///
  /// @nodoc
  static void isFeatureSupported(LocationFeature locationFeature) => $prototype.isFeatureSupported(locationFeature);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = LocationFFI$Impl(Pointer<Void>.fromAddress(0));
}

/// Authorization result.
/// @nodoc

class LocationFFIAuthorizationResult {
  /// Authorized feature.
  LocationFeature feature;

  /// Authorization result, false if not authorized.
  bool result;

  LocationFFIAuthorizationResult._(this.feature, this.result);
  LocationFFIAuthorizationResult()
    : feature = LocationFeature.undefined, result = false;
}


// LocationFFIAuthorizationResult "private" section, not exported.

final _sdkLocationLocationffiAuthorizationresultCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Uint8),
    Pointer<Void> Function(int, int)
  >('here_sdk_sdk_location_LocationFFI_AuthorizationResult_create_handle'));
final _sdkLocationLocationffiAuthorizationresultReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_AuthorizationResult_release_handle'));
final _sdkLocationLocationffiAuthorizationresultGetFieldfeature = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_AuthorizationResult_get_field_feature'));
final _sdkLocationLocationffiAuthorizationresultGetFieldresult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_AuthorizationResult_get_field_result'));



Pointer<Void> sdkLocationLocationffiAuthorizationresultToFfi(LocationFFIAuthorizationResult value) {
  final _featureHandle = sdkLocationLocationfeatureToFfi(value.feature);
  final _resultHandle = booleanToFfi(value.result);
  final _result = _sdkLocationLocationffiAuthorizationresultCreateHandle(_featureHandle, _resultHandle);
  sdkLocationLocationfeatureReleaseFfiHandle(_featureHandle);
  booleanReleaseFfiHandle(_resultHandle);
  return _result;
}

LocationFFIAuthorizationResult sdkLocationLocationffiAuthorizationresultFromFfi(Pointer<Void> handle) {
  final _featureHandle = _sdkLocationLocationffiAuthorizationresultGetFieldfeature(handle);
  final _resultHandle = _sdkLocationLocationffiAuthorizationresultGetFieldresult(handle);
  try {
    return LocationFFIAuthorizationResult._(
      sdkLocationLocationfeatureFromFfi(_featureHandle), 
      booleanFromFfi(_resultHandle)
    );
  } finally {
    sdkLocationLocationfeatureReleaseFfiHandle(_featureHandle);
    booleanReleaseFfiHandle(_resultHandle);
  }
}

void sdkLocationLocationffiAuthorizationresultReleaseFfiHandle(Pointer<Void> handle) => _sdkLocationLocationffiAuthorizationresultReleaseHandle(handle);

// Nullable LocationFFIAuthorizationResult

final _sdkLocationLocationffiAuthorizationresultCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_AuthorizationResult_create_handle_nullable'));
final _sdkLocationLocationffiAuthorizationresultReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_AuthorizationResult_release_handle_nullable'));
final _sdkLocationLocationffiAuthorizationresultGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_AuthorizationResult_get_value_nullable'));

Pointer<Void> sdkLocationLocationffiAuthorizationresultToFfiNullable(LocationFFIAuthorizationResult? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkLocationLocationffiAuthorizationresultToFfi(value);
  final result = _sdkLocationLocationffiAuthorizationresultCreateHandleNullable(_handle);
  sdkLocationLocationffiAuthorizationresultReleaseFfiHandle(_handle);
  return result;
}

LocationFFIAuthorizationResult? sdkLocationLocationffiAuthorizationresultFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkLocationLocationffiAuthorizationresultGetValueNullable(handle);
  final result = sdkLocationLocationffiAuthorizationresultFromFfi(_handle);
  sdkLocationLocationffiAuthorizationresultReleaseFfiHandle(_handle);
  return result;
}

void sdkLocationLocationffiAuthorizationresultReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationLocationffiAuthorizationresultReleaseHandleNullable(handle);

// End of LocationFFIAuthorizationResult "private" section.
/// @nodoc
typedef LocationFFILocationEngineFactory = LocationEngineBase? Function();

// LocationFFILocationEngineFactory "private" section, not exported.

final _sdkLocationLocationffiLocationenginefactoryRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_location_LocationFFI_LocationEngineFactory_register_finalizer'));
final _sdkLocationLocationffiLocationenginefactoryCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_LocationEngineFactory_copy_handle'));
final _sdkLocationLocationffiLocationenginefactoryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_LocationEngineFactory_release_handle'));
final _sdkLocationLocationffiLocationenginefactoryCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_location_LocationFFI_LocationEngineFactory_create_proxy'));

class LocationFFILocationEngineFactory$Impl {
  final Pointer<Void> handle;
  LocationFFILocationEngineFactory$Impl(this.handle);

  LocationEngineBase? call() {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_location_LocationFFI_LocationEngineFactory_call'));
    final _handle = this.handle;
    final __resultHandle = _callFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkLocationLocationenginebaseFromFfiNullable(__resultHandle);
    } finally {
      sdkLocationLocationenginebaseReleaseFfiHandleNullable(__resultHandle);

    }

  }

}

int _sdkLocationLocationffiLocationenginefactorycallStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  LocationEngineBase? _resultObject;
  try {
    _resultObject = (_obj as LocationFFILocationEngineFactory)();
    _result.value = sdkLocationLocationenginebaseToFfiNullable(_resultObject);
  } finally {
  }
  return 0;
}

Pointer<Void> sdkLocationLocationffiLocationenginefactoryToFfi(LocationFFILocationEngineFactory value) =>
  _sdkLocationLocationffiLocationenginefactoryCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Pointer<Void>>)>(_sdkLocationLocationffiLocationenginefactorycallStatic, __lib.unknownError)
  );

LocationFFILocationEngineFactory sdkLocationLocationffiLocationenginefactoryFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkLocationLocationffiLocationenginefactoryCopyHandle(handle);
  final _impl = LocationFFILocationEngineFactory$Impl(_copiedHandle);
  final result = () => _impl.call();
  _sdkLocationLocationffiLocationenginefactoryRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkLocationLocationffiLocationenginefactoryReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkLocationLocationffiLocationenginefactoryReleaseHandle(handle);

// Nullable LocationFFILocationEngineFactory

final _sdkLocationLocationffiLocationenginefactoryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_LocationEngineFactory_create_handle_nullable'));
final _sdkLocationLocationffiLocationenginefactoryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_LocationEngineFactory_release_handle_nullable'));
final _sdkLocationLocationffiLocationenginefactoryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_LocationEngineFactory_get_value_nullable'));

Pointer<Void> sdkLocationLocationffiLocationenginefactoryToFfiNullable(LocationFFILocationEngineFactory? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkLocationLocationffiLocationenginefactoryToFfi(value);
  final result = _sdkLocationLocationffiLocationenginefactoryCreateHandleNullable(_handle);
  sdkLocationLocationffiLocationenginefactoryReleaseFfiHandle(_handle);
  return result;
}

LocationFFILocationEngineFactory? sdkLocationLocationffiLocationenginefactoryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkLocationLocationffiLocationenginefactoryGetValueNullable(handle);
  final result = sdkLocationLocationffiLocationenginefactoryFromFfi(_handle);
  sdkLocationLocationffiLocationenginefactoryReleaseFfiHandle(_handle);
  return result;
}

void sdkLocationLocationffiLocationenginefactoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationLocationffiLocationenginefactoryReleaseHandleNullable(handle);

// End of LocationFFILocationEngineFactory "private" section.
/// @nodoc
typedef LocationFFILocationOfflineModeListener = void Function(bool);

// LocationFFILocationOfflineModeListener "private" section, not exported.

final _sdkLocationLocationffiLocationofflinemodelistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_location_LocationFFI_LocationOfflineModeListener_register_finalizer'));
final _sdkLocationLocationffiLocationofflinemodelistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_LocationOfflineModeListener_copy_handle'));
final _sdkLocationLocationffiLocationofflinemodelistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_LocationOfflineModeListener_release_handle'));
final _sdkLocationLocationffiLocationofflinemodelistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_location_LocationFFI_LocationOfflineModeListener_create_proxy'));

class LocationFFILocationOfflineModeListener$Impl {
  final Pointer<Void> handle;
  LocationFFILocationOfflineModeListener$Impl(this.handle);

  void call(bool p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_location_LocationFFI_LocationOfflineModeListener_call__Boolean'));
    final _p0Handle = booleanToFfi(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    booleanReleaseFfiHandle(_p0Handle);

  }

}

int _sdkLocationLocationffiLocationofflinemodelistenercallStatic(Object _obj, int p0) {
  
  try {
    (_obj as LocationFFILocationOfflineModeListener)(booleanFromFfi(p0));
  } finally {
    booleanReleaseFfiHandle(p0);
  }
  return 0;
}

Pointer<Void> sdkLocationLocationffiLocationofflinemodelistenerToFfi(LocationFFILocationOfflineModeListener value) =>
  _sdkLocationLocationffiLocationofflinemodelistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Uint8)>(_sdkLocationLocationffiLocationofflinemodelistenercallStatic, __lib.unknownError)
  );

LocationFFILocationOfflineModeListener sdkLocationLocationffiLocationofflinemodelistenerFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkLocationLocationffiLocationofflinemodelistenerCopyHandle(handle);
  final _impl = LocationFFILocationOfflineModeListener$Impl(_copiedHandle);
  final result = (bool p0) => _impl.call(p0);
  _sdkLocationLocationffiLocationofflinemodelistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkLocationLocationffiLocationofflinemodelistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkLocationLocationffiLocationofflinemodelistenerReleaseHandle(handle);

// Nullable LocationFFILocationOfflineModeListener

final _sdkLocationLocationffiLocationofflinemodelistenerCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_LocationOfflineModeListener_create_handle_nullable'));
final _sdkLocationLocationffiLocationofflinemodelistenerReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_LocationOfflineModeListener_release_handle_nullable'));
final _sdkLocationLocationffiLocationofflinemodelistenerGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_LocationOfflineModeListener_get_value_nullable'));

Pointer<Void> sdkLocationLocationffiLocationofflinemodelistenerToFfiNullable(LocationFFILocationOfflineModeListener? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkLocationLocationffiLocationofflinemodelistenerToFfi(value);
  final result = _sdkLocationLocationffiLocationofflinemodelistenerCreateHandleNullable(_handle);
  sdkLocationLocationffiLocationofflinemodelistenerReleaseFfiHandle(_handle);
  return result;
}

LocationFFILocationOfflineModeListener? sdkLocationLocationffiLocationofflinemodelistenerFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkLocationLocationffiLocationofflinemodelistenerGetValueNullable(handle);
  final result = sdkLocationLocationffiLocationofflinemodelistenerFromFfi(_handle);
  sdkLocationLocationffiLocationofflinemodelistenerReleaseFfiHandle(_handle);
  return result;
}

void sdkLocationLocationffiLocationofflinemodelistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationLocationffiLocationofflinemodelistenerReleaseHandleNullable(handle);

// End of LocationFFILocationOfflineModeListener "private" section.
/// @nodoc
typedef LocationFFIAuthorizationListener = void Function(LocationFFIAuthorizationResult);

// LocationFFIAuthorizationListener "private" section, not exported.

final _sdkLocationLocationffiAuthorizationlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_location_LocationFFI_AuthorizationListener_register_finalizer'));
final _sdkLocationLocationffiAuthorizationlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_AuthorizationListener_copy_handle'));
final _sdkLocationLocationffiAuthorizationlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_AuthorizationListener_release_handle'));
final _sdkLocationLocationffiAuthorizationlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_location_LocationFFI_AuthorizationListener_create_proxy'));

class LocationFFIAuthorizationListener$Impl {
  final Pointer<Void> handle;
  LocationFFIAuthorizationListener$Impl(this.handle);

  void call(LocationFFIAuthorizationResult p0) {
    final _callFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_location_LocationFFI_AuthorizationListener_call__AuthorizationResult'));
    final _p0Handle = sdkLocationLocationffiAuthorizationresultToFfi(p0);
    final _handle = this.handle;
    _callFfi(_handle, __lib.LibraryContext.isolateId, _p0Handle);
    sdkLocationLocationffiAuthorizationresultReleaseFfiHandle(_p0Handle);

  }

}

int _sdkLocationLocationffiAuthorizationlistenercallStatic(Object _obj, Pointer<Void> p0) {
  
  try {
    (_obj as LocationFFIAuthorizationListener)(sdkLocationLocationffiAuthorizationresultFromFfi(p0));
  } finally {
    sdkLocationLocationffiAuthorizationresultReleaseFfiHandle(p0);
  }
  return 0;
}

Pointer<Void> sdkLocationLocationffiAuthorizationlistenerToFfi(LocationFFIAuthorizationListener value) =>
  _sdkLocationLocationffiAuthorizationlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Int64 Function(Handle, Pointer<Void>)>(_sdkLocationLocationffiAuthorizationlistenercallStatic, __lib.unknownError)
  );

LocationFFIAuthorizationListener sdkLocationLocationffiAuthorizationlistenerFromFfi(Pointer<Void> handle) {
  final _copiedHandle = _sdkLocationLocationffiAuthorizationlistenerCopyHandle(handle);
  final _impl = LocationFFIAuthorizationListener$Impl(_copiedHandle);
  final result = (LocationFFIAuthorizationResult p0) => _impl.call(p0);
  _sdkLocationLocationffiAuthorizationlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkLocationLocationffiAuthorizationlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkLocationLocationffiAuthorizationlistenerReleaseHandle(handle);

// Nullable LocationFFIAuthorizationListener

final _sdkLocationLocationffiAuthorizationlistenerCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_AuthorizationListener_create_handle_nullable'));
final _sdkLocationLocationffiAuthorizationlistenerReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_AuthorizationListener_release_handle_nullable'));
final _sdkLocationLocationffiAuthorizationlistenerGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_AuthorizationListener_get_value_nullable'));

Pointer<Void> sdkLocationLocationffiAuthorizationlistenerToFfiNullable(LocationFFIAuthorizationListener? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkLocationLocationffiAuthorizationlistenerToFfi(value);
  final result = _sdkLocationLocationffiAuthorizationlistenerCreateHandleNullable(_handle);
  sdkLocationLocationffiAuthorizationlistenerReleaseFfiHandle(_handle);
  return result;
}

LocationFFIAuthorizationListener? sdkLocationLocationffiAuthorizationlistenerFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkLocationLocationffiAuthorizationlistenerGetValueNullable(handle);
  final result = sdkLocationLocationffiAuthorizationlistenerFromFfi(_handle);
  sdkLocationLocationffiAuthorizationlistenerReleaseFfiHandle(_handle);
  return result;
}

void sdkLocationLocationffiAuthorizationlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationLocationffiAuthorizationlistenerReleaseHandleNullable(handle);

// End of LocationFFIAuthorizationListener "private" section.

// LocationFFI "private" section, not exported.

final _sdkLocationLocationffiRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_location_LocationFFI_register_finalizer'));
final _sdkLocationLocationffiCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_copy_handle'));
final _sdkLocationLocationffiReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFFI_release_handle'));







/// @nodoc
@visibleForTesting
class LocationFFI$Impl extends __lib.NativeBase implements LocationFFI {

  LocationFFI$Impl(Pointer<Void> handle) : super(handle);

  bool setLocationOfflineModeListener(LocationFFILocationOfflineModeListener listener) {
    final _setLocationOfflineModeListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Int32, Pointer<Void>), int Function(int, Pointer<Void>)>('here_sdk_sdk_location_LocationFFI_setLocationOfflineModeListener__LocationOfflineModeListener'));
    final _listenerHandle = sdkLocationLocationffiLocationofflinemodelistenerToFfi(listener);
    final __resultHandle = _setLocationOfflineModeListenerFfi(__lib.LibraryContext.isolateId, _listenerHandle);
    sdkLocationLocationffiLocationofflinemodelistenerReleaseFfiHandle(_listenerHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  void setLocationEngineFactory(LocationFFILocationEngineFactory factory) {
    final _setLocationEngineFactoryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Pointer<Void>), void Function(int, Pointer<Void>)>('here_sdk_sdk_location_LocationFFI_setLocationEngineFactory__LocationEngineFactory'));
    final _factoryHandle = sdkLocationLocationffiLocationenginefactoryToFfi(factory);
    _setLocationEngineFactoryFfi(__lib.LibraryContext.isolateId, _factoryHandle);
    sdkLocationLocationffiLocationenginefactoryReleaseFfiHandle(_factoryHandle);

  }

  LocationEngineBase? createLocationEngine() {
    final _createLocationEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_location_LocationFFI_createLocationEngine'));
    final __resultHandle = _createLocationEngineFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkLocationLocationenginebaseFromFfiNullable(__resultHandle);
    } finally {
      sdkLocationLocationenginebaseReleaseFfiHandleNullable(__resultHandle);

    }

  }

  LocationFFIAuthorizationResult setAuthorizationListener(LocationFFIAuthorizationListener listener) {
    final _setAuthorizationListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_location_LocationFFI_setAuthorizationListener__AuthorizationListener'));
    final _listenerHandle = sdkLocationLocationffiAuthorizationlistenerToFfi(listener);
    final __resultHandle = _setAuthorizationListenerFfi(__lib.LibraryContext.isolateId, _listenerHandle);
    sdkLocationLocationffiAuthorizationlistenerReleaseFfiHandle(_listenerHandle);
    try {
      return sdkLocationLocationffiAuthorizationresultFromFfi(__resultHandle);
    } finally {
      sdkLocationLocationffiAuthorizationresultReleaseFfiHandle(__resultHandle);

    }

  }

  void isFeatureSupported(LocationFeature locationFeature) {
    final _isFeatureSupportedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Int32, Uint32), void Function(int, int)>('here_sdk_sdk_location_LocationFFI_isFeatureSupported__LocationFeature'));
    final _locationFeatureHandle = sdkLocationLocationfeatureToFfi(locationFeature);
    _isFeatureSupportedFfi(__lib.LibraryContext.isolateId, _locationFeatureHandle);
    sdkLocationLocationfeatureReleaseFfiHandle(_locationFeatureHandle);

  }


}

Pointer<Void> sdkLocationLocationffiToFfi(LocationFFI value) =>
  _sdkLocationLocationffiCopyHandle((value as __lib.NativeBase).handle);

LocationFFI sdkLocationLocationffiFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LocationFFI) return instance;

  final _copiedHandle = _sdkLocationLocationffiCopyHandle(handle);
  final result = LocationFFI$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkLocationLocationffiRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkLocationLocationffiReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkLocationLocationffiReleaseHandle(handle);

Pointer<Void> sdkLocationLocationffiToFfiNullable(LocationFFI? value) =>
  value != null ? sdkLocationLocationffiToFfi(value) : Pointer<Void>.fromAddress(0);

LocationFFI? sdkLocationLocationffiFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkLocationLocationffiFromFfi(handle) : null;

void sdkLocationLocationffiReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationLocationffiReleaseHandle(handle);

// End of LocationFFI "private" section.


