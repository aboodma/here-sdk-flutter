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
import 'package:meta/meta.dart';

/// TrafficDataProvider abstract class provides internal traffic information to other HERE SDK modules,
/// e.g.
///
/// to OfflineRoutingEngine.
/// @nodoc
@internal
abstract class TrafficDataProvider {

}


// TrafficDataProvider "private" section, not exported.

final _sdkTrafficTrafficdataproviderRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_traffic_TrafficDataProvider_register_finalizer'));
final _sdkTrafficTrafficdataproviderCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficDataProvider_copy_handle'));
final _sdkTrafficTrafficdataproviderReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficDataProvider_release_handle'));
final _sdkTrafficTrafficdataproviderCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle),
    Pointer<Void> Function(int, int, Object)
  >('here_sdk_sdk_traffic_TrafficDataProvider_create_proxy'));
final _sdkTrafficTrafficdataproviderGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_traffic_TrafficDataProvider_get_type_id'));


class TrafficDataProvider$Impl extends __lib.NativeBase implements TrafficDataProvider {

  TrafficDataProvider$Impl(Pointer<Void> handle) : super(handle);


}



Pointer<Void> sdkTrafficTrafficdataproviderToFfi(TrafficDataProvider value) {
  if (value is __lib.NativeBase) return _sdkTrafficTrafficdataproviderCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkTrafficTrafficdataproviderCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value
  );

  return result;
}

TrafficDataProvider sdkTrafficTrafficdataproviderFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is TrafficDataProvider) return instance;

  final _typeIdHandle = _sdkTrafficTrafficdataproviderGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkTrafficTrafficdataproviderCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : TrafficDataProvider$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkTrafficTrafficdataproviderRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkTrafficTrafficdataproviderReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkTrafficTrafficdataproviderReleaseHandle(handle);

Pointer<Void> sdkTrafficTrafficdataproviderToFfiNullable(TrafficDataProvider? value) =>
  value != null ? sdkTrafficTrafficdataproviderToFfi(value) : Pointer<Void>.fromAddress(0);

TrafficDataProvider? sdkTrafficTrafficdataproviderFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkTrafficTrafficdataproviderFromFfi(handle) : null;

void sdkTrafficTrafficdataproviderReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTrafficTrafficdataproviderReleaseHandle(handle);

// End of TrafficDataProvider "private" section.


