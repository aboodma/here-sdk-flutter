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
import 'package:here_sdk/src/sdk/venue/data/venue_model.dart';
import 'package:here_sdk/src/sdk/venue/style/venue_style.dart';

/// The interface for listeners for
/// venue loading events in [VenueService].
abstract class VenueListener {
  /// The interface for listeners for
  /// venue loading events in [VenueService].

  factory VenueListener(
    void Function(int, VenueModel?, bool, VenueStyle?) onGetVenueCompletedLambda,

  ) => VenueListener$Lambdas(
    onGetVenueCompletedLambda,

  );

  /// Called when loading of a venue or its retrieval from the cache is completed.
  ///
  /// [venueId] The id of the venue.
  ///
  /// [venueModel] The venue model.
  ///
  /// [online] True if a new venue was loaded from the server and false otherwise.
  ///
  /// [venueStyle] The style associated with the venue.
  ///
  void onGetVenueCompleted(int venueId, VenueModel? venueModel, bool online, VenueStyle? venueStyle);
}


// VenueListener "private" section, not exported.

final _sdkVenueServiceVenuelistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_service_VenueListener_register_finalizer'));
final _sdkVenueServiceVenuelistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_service_VenueListener_copy_handle'));
final _sdkVenueServiceVenuelistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_service_VenueListener_release_handle'));
final _sdkVenueServiceVenuelistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_venue_service_VenueListener_create_proxy'));
final _sdkVenueServiceVenuelistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_service_VenueListener_get_type_id'));


class VenueListener$Lambdas implements VenueListener {
  void Function(int, VenueModel?, bool, VenueStyle?) onGetVenueCompletedLambda;

  VenueListener$Lambdas(
    this.onGetVenueCompletedLambda,

  );

  @override
  void onGetVenueCompleted(int venueId, VenueModel? venueModel, bool online, VenueStyle? venueStyle) =>
    onGetVenueCompletedLambda(venueId, venueModel, online, venueStyle);
}

class VenueListener$Impl extends __lib.NativeBase implements VenueListener {

  VenueListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onGetVenueCompleted(int venueId, VenueModel? venueModel, bool online, VenueStyle? venueStyle) {
    final _onGetVenueCompletedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32, Pointer<Void>, Uint8, Pointer<Void>), void Function(Pointer<Void>, int, int, Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueListener_onGetVenueCompleted__Int_VenueModel__Boolean_VenueStyle_'));
    final _venueIdHandle = (venueId);
    final _venueModelHandle = sdkVenueDataVenuemodelToFfiNullable(venueModel);
    final _onlineHandle = booleanToFfi(online);
    final _venueStyleHandle = sdkVenueStyleVenuestyleToFfiNullable(venueStyle);
    final _handle = this.handle;
    _onGetVenueCompletedFfi(_handle, __lib.LibraryContext.isolateId, _venueIdHandle, _venueModelHandle, _onlineHandle, _venueStyleHandle);

    sdkVenueDataVenuemodelReleaseFfiHandleNullable(_venueModelHandle);
    booleanReleaseFfiHandle(_onlineHandle);
    sdkVenueStyleVenuestyleReleaseFfiHandleNullable(_venueStyleHandle);

  }


}

int _sdkVenueServiceVenuelisteneronGetVenueCompletedStatic(Object _obj, int venueId, Pointer<Void> venueModel, int online, Pointer<Void> venueStyle) {

  try {
    (_obj as VenueListener).onGetVenueCompleted((venueId), sdkVenueDataVenuemodelFromFfiNullable(venueModel), booleanFromFfi(online), sdkVenueStyleVenuestyleFromFfiNullable(venueStyle));
  } finally {
    
    sdkVenueDataVenuemodelReleaseFfiHandleNullable(venueModel);
    booleanReleaseFfiHandle(online);
    sdkVenueStyleVenuestyleReleaseFfiHandleNullable(venueStyle);
  }
  return 0;
}


Pointer<Void> sdkVenueServiceVenuelistenerToFfi(VenueListener value) {
  if (value is __lib.NativeBase) return _sdkVenueServiceVenuelistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkVenueServiceVenuelistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Int32, Pointer<Void>, Uint8, Pointer<Void>)>(_sdkVenueServiceVenuelisteneronGetVenueCompletedStatic, __lib.unknownError)
  );

  return result;
}

VenueListener sdkVenueServiceVenuelistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueListener) return instance;

  final _typeIdHandle = _sdkVenueServiceVenuelistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkVenueServiceVenuelistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : VenueListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueServiceVenuelistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueServiceVenuelistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueServiceVenuelistenerReleaseHandle(handle);

Pointer<Void> sdkVenueServiceVenuelistenerToFfiNullable(VenueListener? value) =>
  value != null ? sdkVenueServiceVenuelistenerToFfi(value) : Pointer<Void>.fromAddress(0);

VenueListener? sdkVenueServiceVenuelistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueServiceVenuelistenerFromFfi(handle) : null;

void sdkVenueServiceVenuelistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueServiceVenuelistenerReleaseHandle(handle);

// End of VenueListener "private" section.


