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
import 'package:here_sdk/src/sdk/location/location_engine_status.dart';
import 'package:here_sdk/src/sdk/location/location_feature.dart';

/// Abstract class for listening the
/// LocationEngine status updates.
abstract class LocationStatusListener {
  /// Abstract class for listening the
  /// LocationEngine status updates.

  factory LocationStatusListener(
    void Function(LocationEngineStatus) onStatusChangedLambda,
    void Function(List<LocationFeature>) onFeaturesNotAvailableLambda,

  ) => LocationStatusListener$Lambdas(
    onStatusChangedLambda,
    onFeaturesNotAvailableLambda,

  );

  /// Called each time the status of the LocationEngine has changed.
  ///
  /// Invoked on the main thread.
  ///
  void onStatusChanged(LocationEngineStatus locationEngineStatus);
  /// Called after start() if any requested location feature is not available
  /// for the application.
  ///
  /// Typically all features are enabled by default, but in
  /// certain variants some features may be disabled, e.g. to reduce binary size.
  /// If a feature that you need is not available, contact your HERE representative
  /// for more information.
  ///
  /// [features] List of unavailable location features.
  ///
  void onFeaturesNotAvailable(List<LocationFeature> features);
}


// LocationStatusListener "private" section, not exported.

final _sdkLocationLocationstatuslistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_location_LocationStatusListener_register_finalizer'));
final _sdkLocationLocationstatuslistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationStatusListener_copy_handle'));
final _sdkLocationLocationstatuslistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationStatusListener_release_handle'));
final _sdkLocationLocationstatuslistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('here_sdk_sdk_location_LocationStatusListener_create_proxy'));
final _sdkLocationLocationstatuslistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationStatusListener_get_type_id'));



class LocationStatusListener$Lambdas implements LocationStatusListener {
  void Function(LocationEngineStatus) onStatusChangedLambda;
  void Function(List<LocationFeature>) onFeaturesNotAvailableLambda;

  LocationStatusListener$Lambdas(
    this.onStatusChangedLambda,
    this.onFeaturesNotAvailableLambda,

  );

  @override
  void onStatusChanged(LocationEngineStatus locationEngineStatus) =>
    onStatusChangedLambda(locationEngineStatus);
  @override
  void onFeaturesNotAvailable(List<LocationFeature> features) =>
    onFeaturesNotAvailableLambda(features);
}

class LocationStatusListener$Impl extends __lib.NativeBase implements LocationStatusListener {

  LocationStatusListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onStatusChanged(LocationEngineStatus locationEngineStatus) {
    final _onStatusChangedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_location_LocationStatusListener_onStatusChanged__LocationEngineStatus'));
    final _locationEngineStatusHandle = sdkLocationLocationenginestatusToFfi(locationEngineStatus);
    final _handle = this.handle;
    _onStatusChangedFfi(_handle, __lib.LibraryContext.isolateId, _locationEngineStatusHandle);
    sdkLocationLocationenginestatusReleaseFfiHandle(_locationEngineStatusHandle);

  }

  @override
  void onFeaturesNotAvailable(List<LocationFeature> features) {
    final _onFeaturesNotAvailableFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_location_LocationStatusListener_onFeaturesNotAvailable__ListOf_sdk_location_LocationFeature'));
    final _featuresHandle = heresdkPositioningBindingslistofSdkLocationLocationfeatureToFfi(features);
    final _handle = this.handle;
    _onFeaturesNotAvailableFfi(_handle, __lib.LibraryContext.isolateId, _featuresHandle);
    heresdkPositioningBindingslistofSdkLocationLocationfeatureReleaseFfiHandle(_featuresHandle);

  }


}

int _sdkLocationLocationstatuslisteneronStatusChangedStatic(Object _obj, int locationEngineStatus) {

  try {
    (_obj as LocationStatusListener).onStatusChanged(sdkLocationLocationenginestatusFromFfi(locationEngineStatus));
  } finally {
    sdkLocationLocationenginestatusReleaseFfiHandle(locationEngineStatus);
  }
  return 0;
}
int _sdkLocationLocationstatuslisteneronFeaturesNotAvailableStatic(Object _obj, Pointer<Void> features) {

  try {
    (_obj as LocationStatusListener).onFeaturesNotAvailable(heresdkPositioningBindingslistofSdkLocationLocationfeatureFromFfi(features));
  } finally {
    heresdkPositioningBindingslistofSdkLocationLocationfeatureReleaseFfiHandle(features);
  }
  return 0;
}


Pointer<Void> sdkLocationLocationstatuslistenerToFfi(LocationStatusListener value) {
  if (value is __lib.NativeBase) return _sdkLocationLocationstatuslistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkLocationLocationstatuslistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Uint32)>(_sdkLocationLocationstatuslisteneronStatusChangedStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkLocationLocationstatuslisteneronFeaturesNotAvailableStatic, __lib.unknownError)
  );

  return result;
}

LocationStatusListener sdkLocationLocationstatuslistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LocationStatusListener) return instance;

  final _typeIdHandle = _sdkLocationLocationstatuslistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkLocationLocationstatuslistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : LocationStatusListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkLocationLocationstatuslistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkLocationLocationstatuslistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkLocationLocationstatuslistenerReleaseHandle(handle);

Pointer<Void> sdkLocationLocationstatuslistenerToFfiNullable(LocationStatusListener? value) =>
  value != null ? sdkLocationLocationstatuslistenerToFfi(value) : Pointer<Void>.fromAddress(0);

LocationStatusListener? sdkLocationLocationstatuslistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkLocationLocationstatuslistenerFromFfi(handle) : null;

void sdkLocationLocationstatuslistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationLocationstatuslistenerReleaseHandle(handle);

// End of LocationStatusListener "private" section.


