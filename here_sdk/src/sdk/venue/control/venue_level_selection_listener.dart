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
import 'package:here_sdk/src/sdk/venue/data/venue_level.dart';

/// The  for  for
/// the [VenueLevel] selection event.
///
/// Use the [VenueMap]
/// to add and remove the [VenueLevelSelectionListener].
abstract class VenueLevelSelectionListener {
  /// The  for  for
  /// the [VenueLevel] selection event.
  ///
  /// Use the [VenueMap]
  /// to add and remove the [VenueLevelSelectionListener].

  factory VenueLevelSelectionListener(
    void Function(Venue, VenueDrawing, VenueLevel?, VenueLevel) onLevelSelectedLambda,

  ) => VenueLevelSelectionListener$Lambdas(
    onLevelSelectedLambda,

  );

  /// Indicates that the selected [VenueLevel] of a venue changed.
  ///
  /// [venue] The [Venue] where the selected [VenueLevel] changed.
  ///
  /// [drawing] The [VenueDrawing] where the selected [VenueLevel] changed.
  ///
  /// [deselectedLevel] The previously selected [VenueLevel] or `null`
  /// if there was no selected level before.
  ///
  /// [selectedLevel] The new selected [VenueLevel].
  ///
  void onLevelSelected(Venue venue, VenueDrawing drawing, VenueLevel? deselectedLevel, VenueLevel selectedLevel);
}


// VenueLevelSelectionListener "private" section, not exported.

final _sdkVenueControlVenuelevelselectionlistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_control_VenueLevelSelectionListener_register_finalizer'));
final _sdkVenueControlVenuelevelselectionlistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueLevelSelectionListener_copy_handle'));
final _sdkVenueControlVenuelevelselectionlistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueLevelSelectionListener_release_handle'));
final _sdkVenueControlVenuelevelselectionlistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer)
  >('here_sdk_sdk_venue_control_VenueLevelSelectionListener_create_proxy'));
final _sdkVenueControlVenuelevelselectionlistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueLevelSelectionListener_get_type_id'));


class VenueLevelSelectionListener$Lambdas implements VenueLevelSelectionListener {
  void Function(Venue, VenueDrawing, VenueLevel?, VenueLevel) onLevelSelectedLambda;

  VenueLevelSelectionListener$Lambdas(
    this.onLevelSelectedLambda,

  );

  @override
  void onLevelSelected(Venue venue, VenueDrawing drawing, VenueLevel? deselectedLevel, VenueLevel selectedLevel) =>
    onLevelSelectedLambda(venue, drawing, deselectedLevel, selectedLevel);
}

class VenueLevelSelectionListener$Impl extends __lib.NativeBase implements VenueLevelSelectionListener {

  VenueLevelSelectionListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onLevelSelected(Venue venue, VenueDrawing drawing, VenueLevel? deselectedLevel, VenueLevel selectedLevel) {
    final _onLevelSelectedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueLevelSelectionListener_onLevelSelected__Venue_VenueDrawing_VenueLevel__VenueLevel'));
    final _venueHandle = sdkVenueControlVenueToFfi(venue);
    final _drawingHandle = sdkVenueDataVenuedrawingToFfi(drawing);
    final _deselectedLevelHandle = sdkVenueDataVenuelevelToFfiNullable(deselectedLevel);
    final _selectedLevelHandle = sdkVenueDataVenuelevelToFfi(selectedLevel);
    final _handle = this.handle;
    _onLevelSelectedFfi(_handle, __lib.LibraryContext.isolateId, _venueHandle, _drawingHandle, _deselectedLevelHandle, _selectedLevelHandle);
    sdkVenueControlVenueReleaseFfiHandle(_venueHandle);
    sdkVenueDataVenuedrawingReleaseFfiHandle(_drawingHandle);
    sdkVenueDataVenuelevelReleaseFfiHandleNullable(_deselectedLevelHandle);
    sdkVenueDataVenuelevelReleaseFfiHandle(_selectedLevelHandle);

  }


}

int _sdkVenueControlVenuelevelselectionlisteneronLevelSelectedStatic(Object _obj, Pointer<Void> venue, Pointer<Void> drawing, Pointer<Void> deselectedLevel, Pointer<Void> selectedLevel) {

  try {
    (_obj as VenueLevelSelectionListener).onLevelSelected(sdkVenueControlVenueFromFfi(venue), sdkVenueDataVenuedrawingFromFfi(drawing), sdkVenueDataVenuelevelFromFfiNullable(deselectedLevel), sdkVenueDataVenuelevelFromFfi(selectedLevel));
  } finally {
    sdkVenueControlVenueReleaseFfiHandle(venue);
    sdkVenueDataVenuedrawingReleaseFfiHandle(drawing);
    sdkVenueDataVenuelevelReleaseFfiHandleNullable(deselectedLevel);
    sdkVenueDataVenuelevelReleaseFfiHandle(selectedLevel);
  }
  return 0;
}


Pointer<Void> sdkVenueControlVenuelevelselectionlistenerToFfi(VenueLevelSelectionListener value) {
  if (value is __lib.NativeBase) return _sdkVenueControlVenuelevelselectionlistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkVenueControlVenuelevelselectionlistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)>(_sdkVenueControlVenuelevelselectionlisteneronLevelSelectedStatic, __lib.unknownError)
  );

  return result;
}

VenueLevelSelectionListener sdkVenueControlVenuelevelselectionlistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueLevelSelectionListener) return instance;

  final _typeIdHandle = _sdkVenueControlVenuelevelselectionlistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkVenueControlVenuelevelselectionlistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : VenueLevelSelectionListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueControlVenuelevelselectionlistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueControlVenuelevelselectionlistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueControlVenuelevelselectionlistenerReleaseHandle(handle);

Pointer<Void> sdkVenueControlVenuelevelselectionlistenerToFfiNullable(VenueLevelSelectionListener? value) =>
  value != null ? sdkVenueControlVenuelevelselectionlistenerToFfi(value) : Pointer<Void>.fromAddress(0);

VenueLevelSelectionListener? sdkVenueControlVenuelevelselectionlistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueControlVenuelevelselectionlistenerFromFfi(handle) : null;

void sdkVenueControlVenuelevelselectionlistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueControlVenuelevelselectionlistenerReleaseHandle(handle);

// End of VenueLevelSelectionListener "private" section.


