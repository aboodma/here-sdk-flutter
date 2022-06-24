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
import 'package:here_sdk/src/sdk/venue/control/venue.dart';

/// The  for  for
/// the [Venue] lifecycle events.
///
/// Use the [VenueMap]
/// to add and remove the [VenueLifecycleListener].
abstract class VenueLifecycleListener {
  /// The  for  for
  /// the [Venue] lifecycle events.
  ///
  /// Use the [VenueMap]
  /// to add and remove the [VenueLifecycleListener].

  factory VenueLifecycleListener(
    void Function(Venue) onVenueAddedLambda,
    void Function(int) onVenueRemovedLambda,

  ) => VenueLifecycleListener$Lambdas(
    onVenueAddedLambda,
    onVenueRemovedLambda,

  );

  /// Indicates that a [Venue] was added to the [VenueMap].
  ///
  /// [venue] The created [Venue].
  ///
  void onVenueAdded(Venue venue);
  /// Indicates that a [Venue] was removed from the [VenueMap].
  ///
  /// [venueId] The destroyed venue id, that can be obtained from the [VenueModel.id].
  ///
  void onVenueRemoved(int venueId);
}


// VenueLifecycleListener "private" section, not exported.

final _sdkVenueControlVenuelifecyclelistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_control_VenueLifecycleListener_register_finalizer'));
final _sdkVenueControlVenuelifecyclelistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueLifecycleListener_copy_handle'));
final _sdkVenueControlVenuelifecyclelistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueLifecycleListener_release_handle'));
final _sdkVenueControlVenuelifecyclelistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer)
  >('here_sdk_sdk_venue_control_VenueLifecycleListener_create_proxy'));
final _sdkVenueControlVenuelifecyclelistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueLifecycleListener_get_type_id'));



class VenueLifecycleListener$Lambdas implements VenueLifecycleListener {
  void Function(Venue) onVenueAddedLambda;
  void Function(int) onVenueRemovedLambda;

  VenueLifecycleListener$Lambdas(
    this.onVenueAddedLambda,
    this.onVenueRemovedLambda,

  );

  @override
  void onVenueAdded(Venue venue) =>
    onVenueAddedLambda(venue);
  @override
  void onVenueRemoved(int venueId) =>
    onVenueRemovedLambda(venueId);
}

class VenueLifecycleListener$Impl extends __lib.NativeBase implements VenueLifecycleListener {

  VenueLifecycleListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onVenueAdded(Venue venue) {
    final _onVenueAddedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueLifecycleListener_onVenueAdded__Venue'));
    final _venueHandle = sdkVenueControlVenueToFfi(venue);
    final _handle = this.handle;
    _onVenueAddedFfi(_handle, __lib.LibraryContext.isolateId, _venueHandle);
    sdkVenueControlVenueReleaseFfiHandle(_venueHandle);

  }

  @override
  void onVenueRemoved(int venueId) {
    final _onVenueRemovedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_control_VenueLifecycleListener_onVenueRemoved__Int'));
    final _venueIdHandle = (venueId);
    final _handle = this.handle;
    _onVenueRemovedFfi(_handle, __lib.LibraryContext.isolateId, _venueIdHandle);


  }


}

int _sdkVenueControlVenuelifecyclelisteneronVenueAddedStatic(Object _obj, Pointer<Void> venue) {

  try {
    (_obj as VenueLifecycleListener).onVenueAdded(sdkVenueControlVenueFromFfi(venue));
  } finally {
    sdkVenueControlVenueReleaseFfiHandle(venue);
  }
  return 0;
}
int _sdkVenueControlVenuelifecyclelisteneronVenueRemovedStatic(Object _obj, int venueId) {

  try {
    (_obj as VenueLifecycleListener).onVenueRemoved((venueId));
  } finally {
    
  }
  return 0;
}


Pointer<Void> sdkVenueControlVenuelifecyclelistenerToFfi(VenueLifecycleListener value) {
  if (value is __lib.NativeBase) return _sdkVenueControlVenuelifecyclelistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkVenueControlVenuelifecyclelistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkVenueControlVenuelifecyclelisteneronVenueAddedStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Int32)>(_sdkVenueControlVenuelifecyclelisteneronVenueRemovedStatic, __lib.unknownError)
  );

  return result;
}

VenueLifecycleListener sdkVenueControlVenuelifecyclelistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueLifecycleListener) return instance;

  final _typeIdHandle = _sdkVenueControlVenuelifecyclelistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkVenueControlVenuelifecyclelistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : VenueLifecycleListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueControlVenuelifecyclelistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueControlVenuelifecyclelistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueControlVenuelifecyclelistenerReleaseHandle(handle);

Pointer<Void> sdkVenueControlVenuelifecyclelistenerToFfiNullable(VenueLifecycleListener? value) =>
  value != null ? sdkVenueControlVenuelifecyclelistenerToFfi(value) : Pointer<Void>.fromAddress(0);

VenueLifecycleListener? sdkVenueControlVenuelifecyclelistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueControlVenuelifecyclelistenerFromFfi(handle) : null;

void sdkVenueControlVenuelifecyclelistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueControlVenuelifecyclelistenerReleaseHandle(handle);

// End of VenueLifecycleListener "private" section.


