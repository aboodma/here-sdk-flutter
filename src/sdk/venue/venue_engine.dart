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
import 'package:here_sdk/src/sdk/core/authentication_callback.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/venue/control/venue_map.dart';
import 'package:here_sdk/src/sdk/venue/service/venue_service.dart';
import 'package:here_sdk/src/sdk/venue/venue_engine_init_callback.dart';
import 'package:meta/meta.dart';

/// VenueEngine is an add-on to the base map functionality with its
/// own content loading and cache.
///
/// VenueEngine gives access to the venue functionality, which allows you
/// to load and visualize venues on the map, search content inside venues etc.
abstract class VenueEngine {
  /// Creates a new instance of this class.
  ///
  /// [callback] The optional callback that will be triggered when a venue engine initialization
  /// will be completed. After the initialization, the [VenueService] should
  /// be started using one of its methods or using [VenueEngine.start].
  ///
  factory VenueEngine(VenueEngineInitCallback? callback) => $prototype.$init(callback);
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] Instance of existing SDKEngine.
  ///
  /// [callback] The optional callback that will be triggered when a venue engine initialization
  /// will be completed. After the initialization, the [VenueService] should
  /// be started using one of its methods or using [VenueEngine.start].
  ///
  factory VenueEngine.withSdkEngine(SDKNativeEngine sdkEngine, VenueEngineInitCallback? callback) => $prototype.withSdkEngine(sdkEngine, callback);

  /// Authenticates asynchronously using HERE SDK credentials and uses a result token to start
  /// the [VenueService].
  ///
  /// An initialization status of the venue service is
  /// returned to objects registered as [VenueServiceListener]. If the
  /// authentication will fail, the venue service will not be started.
  ///
  /// [callback] The optional callback that will be triggered when the authentication will be completed.
  /// If the authentication fails, the venue service will not be started.
  ///
  void start(AuthenticationCallback? callback);
  /// Releases all internally used resources.
  ///
  /// The instance can't be used anymore after calling
  /// this method.
  ///
  void destroy();
  /// Gets the venue service. This service can be used to load the venue model objects.
  VenueService get venueService;

  /// Gets a venue map to visualize venues and control the
  /// state of the venues on the map. You need to start the [VenueService]
  /// before using the venue map.
  VenueMap get venueMap;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = VenueEngine$Impl(Pointer<Void>.fromAddress(0));
}


// VenueEngine "private" section, not exported.

final _sdkVenueVenueengineRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_VenueEngine_register_finalizer'));
final _sdkVenueVenueengineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_VenueEngine_copy_handle'));
final _sdkVenueVenueengineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_VenueEngine_release_handle'));






/// @nodoc
@visibleForTesting
class VenueEngine$Impl extends __lib.NativeBase implements VenueEngine {

  VenueEngine$Impl(Pointer<Void> handle) : super(handle);


  VenueEngine $init(VenueEngineInitCallback? callback) {
    final _result_handle = _$init(callback);
    final _result = VenueEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkVenueVenueengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  VenueEngine withSdkEngine(SDKNativeEngine sdkEngine, VenueEngineInitCallback? callback) {
    final _result_handle = _withSdkEngine(sdkEngine, callback);
    final _result = VenueEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkVenueVenueengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(VenueEngineInitCallback? callback) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_venue_VenueEngine_make__VenueEngineInitCallback_'));
    final _callbackHandle = sdkVenueVenueengineinitcallbackToFfiNullable(callback);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _callbackHandle);
    sdkVenueVenueengineinitcallbackReleaseFfiHandleNullable(_callbackHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine, VenueEngineInitCallback? callback) {
    final _withSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_venue_VenueEngine_make__SDKNativeEngine_VenueEngineInitCallback_'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final _callbackHandle = sdkVenueVenueengineinitcallbackToFfiNullable(callback);
    final __resultHandle = _withSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle, _callbackHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    sdkVenueVenueengineinitcallbackReleaseFfiHandleNullable(_callbackHandle);
    return __resultHandle;
  }

  @override
  void start(AuthenticationCallback? callback) {
    final _startFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_VenueEngine_start__AuthenticationCallback_'));
    final _callbackHandle = sdkCoreAuthenticationcallbackToFfiNullable(callback);
    final _handle = this.handle;
    _startFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkCoreAuthenticationcallbackReleaseFfiHandleNullable(_callbackHandle);

  }

  @override
  void destroy() {
    final _destroyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_venue_VenueEngine_destroy'));
    final _handle = this.handle;
    _destroyFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  VenueService get venueService {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_VenueEngine_venueService_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueServiceVenueserviceFromFfi(__resultHandle);
    } finally {
      sdkVenueServiceVenueserviceReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  VenueMap get venueMap {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_VenueEngine_venueMap_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueControlVenuemapFromFfi(__resultHandle);
    } finally {
      sdkVenueControlVenuemapReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueVenueengineToFfi(VenueEngine value) =>
  _sdkVenueVenueengineCopyHandle((value as __lib.NativeBase).handle);

VenueEngine sdkVenueVenueengineFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueEngine) return instance;

  final _copiedHandle = _sdkVenueVenueengineCopyHandle(handle);
  final result = VenueEngine$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueVenueengineRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueVenueengineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueVenueengineReleaseHandle(handle);

Pointer<Void> sdkVenueVenueengineToFfiNullable(VenueEngine? value) =>
  value != null ? sdkVenueVenueengineToFfi(value) : Pointer<Void>.fromAddress(0);

VenueEngine? sdkVenueVenueengineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueVenueengineFromFfi(handle) : null;

void sdkVenueVenueengineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueVenueengineReleaseHandle(handle);

// End of VenueEngine "private" section.


