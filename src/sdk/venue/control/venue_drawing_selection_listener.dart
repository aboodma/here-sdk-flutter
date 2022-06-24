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
import 'package:here_sdk/src/sdk/venue/data/venue_drawing.dart';

/// The  for  for
/// the [VenueDrawing] selection event.
///
/// Use the [VenueMap]
/// to add and remove the [VenueDrawingSelectionListener].
abstract class VenueDrawingSelectionListener {
  /// The  for  for
  /// the [VenueDrawing] selection event.
  ///
  /// Use the [VenueMap]
  /// to add and remove the [VenueDrawingSelectionListener].

  factory VenueDrawingSelectionListener(
    void Function(Venue, VenueDrawing?, VenueDrawing) onDrawingSelectedLambda,

  ) => VenueDrawingSelectionListener$Lambdas(
    onDrawingSelectedLambda,

  );

  /// Indicates that new [VenueDrawing] has been selected.
  ///
  /// [venue] The [Venue] where a selected drawing was changed.
  ///
  /// [deselectedDrawing] The previously selected [VenueDrawing] object or `null`
  /// if there was no selected drawing before.
  ///
  /// [selectedDrawing] The new selected [VenueDrawing] object.
  ///
  void onDrawingSelected(Venue venue, VenueDrawing? deselectedDrawing, VenueDrawing selectedDrawing);
}


// VenueDrawingSelectionListener "private" section, not exported.

final _sdkVenueControlVenuedrawingselectionlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_control_VenueDrawingSelectionListener_register_finalizer'));
final _sdkVenueControlVenuedrawingselectionlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueDrawingSelectionListener_copy_handle'));
final _sdkVenueControlVenuedrawingselectionlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueDrawingSelectionListener_release_handle'));
final _sdkVenueControlVenuedrawingselectionlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_venue_control_VenueDrawingSelectionListener_create_proxy'));
final _sdkVenueControlVenuedrawingselectionlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueDrawingSelectionListener_get_type_id'));


class VenueDrawingSelectionListener$Lambdas implements VenueDrawingSelectionListener {
  void Function(Venue, VenueDrawing?, VenueDrawing) onDrawingSelectedLambda;

  VenueDrawingSelectionListener$Lambdas(
    this.onDrawingSelectedLambda,

  );

  @override
  void onDrawingSelected(Venue venue, VenueDrawing? deselectedDrawing, VenueDrawing selectedDrawing) =>
    onDrawingSelectedLambda(venue, deselectedDrawing, selectedDrawing);
}

class VenueDrawingSelectionListener$Impl extends __lib.NativeBase implements VenueDrawingSelectionListener {

  VenueDrawingSelectionListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onDrawingSelected(Venue venue, VenueDrawing? deselectedDrawing, VenueDrawing selectedDrawing) {
    final _onDrawingSelectedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueDrawingSelectionListener_onDrawingSelected__Venue_VenueDrawing__VenueDrawing'));
    final _venueHandle = sdkVenueControlVenueToFfi(venue);
    final _deselectedDrawingHandle = sdkVenueDataVenuedrawingToFfiNullable(deselectedDrawing);
    final _selectedDrawingHandle = sdkVenueDataVenuedrawingToFfi(selectedDrawing);
    final _handle = this.handle;
    _onDrawingSelectedFfi(_handle, __lib.LibraryContext.isolateId, _venueHandle, _deselectedDrawingHandle, _selectedDrawingHandle);
    sdkVenueControlVenueReleaseFfiHandle(_venueHandle);
    sdkVenueDataVenuedrawingReleaseFfiHandleNullable(_deselectedDrawingHandle);
    sdkVenueDataVenuedrawingReleaseFfiHandle(_selectedDrawingHandle);

  }


}

int _sdkVenueControlVenuedrawingselectionlisteneronDrawingSelectedStatic(Object _obj, Pointer<Void> venue, Pointer<Void> deselectedDrawing, Pointer<Void> selectedDrawing) {

  try {
    (_obj as VenueDrawingSelectionListener).onDrawingSelected(sdkVenueControlVenueFromFfi(venue), sdkVenueDataVenuedrawingFromFfiNullable(deselectedDrawing), sdkVenueDataVenuedrawingFromFfi(selectedDrawing));
  } finally {
    sdkVenueControlVenueReleaseFfiHandle(venue);
    sdkVenueDataVenuedrawingReleaseFfiHandleNullable(deselectedDrawing);
    sdkVenueDataVenuedrawingReleaseFfiHandle(selectedDrawing);
  }
  return 0;
}


Pointer<Void> sdkVenueControlVenuedrawingselectionlistenerToFfi(VenueDrawingSelectionListener value) {
  if (value is __lib.NativeBase) return _sdkVenueControlVenuedrawingselectionlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkVenueControlVenuedrawingselectionlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_sdkVenueControlVenuedrawingselectionlisteneronDrawingSelectedStatic, __lib.unknownError)
  );

  return result;
}

VenueDrawingSelectionListener sdkVenueControlVenuedrawingselectionlistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueDrawingSelectionListener) return instance;

  final _typeIdHandle = _sdkVenueControlVenuedrawingselectionlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkVenueControlVenuedrawingselectionlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : VenueDrawingSelectionListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueControlVenuedrawingselectionlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueControlVenuedrawingselectionlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueControlVenuedrawingselectionlistenerReleaseHandle(handle);

Pointer<Void> sdkVenueControlVenuedrawingselectionlistenerToFfiNullable(VenueDrawingSelectionListener? value) =>
  value != null ? sdkVenueControlVenuedrawingselectionlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

VenueDrawingSelectionListener? sdkVenueControlVenuedrawingselectionlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueControlVenuedrawingselectionlistenerFromFfi(handle) : null;

void sdkVenueControlVenuedrawingselectionlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueControlVenuedrawingselectionlistenerReleaseHandle(handle);

// End of VenueDrawingSelectionListener "private" section.


