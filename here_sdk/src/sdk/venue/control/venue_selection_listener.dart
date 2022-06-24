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
/// the [Venue] selection event.
///
/// Use the [VenueMap]
/// to add and remove the [VenueSelectionListener].
abstract class VenueSelectionListener {
  /// The  for  for
  /// the [Venue] selection event.
  ///
  /// Use the [VenueMap]
  /// to add and remove the [VenueSelectionListener].

  factory VenueSelectionListener(
    void Function(Venue?, Venue?) onSelectedVenueChangedLambda,

  ) => VenueSelectionListener$Lambdas(
    onSelectedVenueChangedLambda,

  );

  /// Indicates that the current selected [Venue] changed.
  ///
  /// [deselectedVenue] The [Venue] that was deselected or `null`
  /// if there was no selected venue before.
  ///
  /// [selectedVenue] The [Venue] that was selected or `null`
  /// if there was no new selected venue.
  ///
  void onSelectedVenueChanged(Venue? deselectedVenue, Venue? selectedVenue);
}


// VenueSelectionListener "private" section, not exported.

final _sdkVenueControlVenueselectionlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_control_VenueSelectionListener_register_finalizer'));
final _sdkVenueControlVenueselectionlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueSelectionListener_copy_handle'));
final _sdkVenueControlVenueselectionlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueSelectionListener_release_handle'));
final _sdkVenueControlVenueselectionlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_venue_control_VenueSelectionListener_create_proxy'));
final _sdkVenueControlVenueselectionlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueSelectionListener_get_type_id'));


class VenueSelectionListener$Lambdas implements VenueSelectionListener {
  void Function(Venue?, Venue?) onSelectedVenueChangedLambda;

  VenueSelectionListener$Lambdas(
    this.onSelectedVenueChangedLambda,

  );

  @override
  void onSelectedVenueChanged(Venue? deselectedVenue, Venue? selectedVenue) =>
    onSelectedVenueChangedLambda(deselectedVenue, selectedVenue);
}

class VenueSelectionListener$Impl extends __lib.NativeBase implements VenueSelectionListener {

  VenueSelectionListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onSelectedVenueChanged(Venue? deselectedVenue, Venue? selectedVenue) {
    final _onSelectedVenueChangedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueSelectionListener_onSelectedVenueChanged__Venue__Venue_'));
    final _deselectedVenueHandle = sdkVenueControlVenueToFfiNullable(deselectedVenue);
    final _selectedVenueHandle = sdkVenueControlVenueToFfiNullable(selectedVenue);
    final _handle = this.handle;
    _onSelectedVenueChangedFfi(_handle, __lib.LibraryContext.isolateId, _deselectedVenueHandle, _selectedVenueHandle);
    sdkVenueControlVenueReleaseFfiHandleNullable(_deselectedVenueHandle);
    sdkVenueControlVenueReleaseFfiHandleNullable(_selectedVenueHandle);

  }


}

int _sdkVenueControlVenueselectionlisteneronSelectedVenueChangedStatic(Object _obj, Pointer<Void> deselectedVenue, Pointer<Void> selectedVenue) {

  try {
    (_obj as VenueSelectionListener).onSelectedVenueChanged(sdkVenueControlVenueFromFfiNullable(deselectedVenue), sdkVenueControlVenueFromFfiNullable(selectedVenue));
  } finally {
    sdkVenueControlVenueReleaseFfiHandleNullable(deselectedVenue);
    sdkVenueControlVenueReleaseFfiHandleNullable(selectedVenue);
  }
  return 0;
}


Pointer<Void> sdkVenueControlVenueselectionlistenerToFfi(VenueSelectionListener value) {
  if (value is __lib.NativeBase) return _sdkVenueControlVenueselectionlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkVenueControlVenueselectionlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkVenueControlVenueselectionlisteneronSelectedVenueChangedStatic, __lib.unknownError)
  );

  return result;
}

VenueSelectionListener sdkVenueControlVenueselectionlistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueSelectionListener) return instance;

  final _typeIdHandle = _sdkVenueControlVenueselectionlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkVenueControlVenueselectionlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : VenueSelectionListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueControlVenueselectionlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueControlVenueselectionlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueControlVenueselectionlistenerReleaseHandle(handle);

Pointer<Void> sdkVenueControlVenueselectionlistenerToFfiNullable(VenueSelectionListener? value) =>
  value != null ? sdkVenueControlVenueselectionlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

VenueSelectionListener? sdkVenueControlVenueselectionlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueControlVenueselectionlistenerFromFfi(handle) : null;

void sdkVenueControlVenueselectionlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueControlVenueselectionlistenerReleaseHandle(handle);

// End of VenueSelectionListener "private" section.


