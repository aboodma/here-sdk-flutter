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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_drawing.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_geometry.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_level.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_model.dart';
import 'package:here_sdk/src/sdk/venue/style/venue_geometry_style.dart';
import 'package:here_sdk/src/sdk/venue/style/venue_label_style.dart';
import 'package:here_sdk/src/sdk/venue/style/venue_style.dart';

/// Controls the [VenueModel] inside the [VenueMap] object.
///
/// The venue controls the selection of the [VenueDrawing] and the [VenueLevel]
/// of the [VenueModel]. It provides the possibility to customize styles for the [VenueGeometry].
/// Objects of this class can only be created using methods
/// [VenueMap.addVenueAsync] and [VenueMap.selectVenueAsync].
abstract class Venue {

  /// Sets a custom style for geometries and related labels.
  ///
  /// [geometries] The list of geometries to apply the new style.
  ///
  /// [style] The style for geometries, or `null` to reset the style to default.
  ///
  /// [labelStyle] The style for geometry labels, or `null` to reset the label style to default.
  ///
  void setCustomStyle(List<VenueGeometry> geometries, VenueGeometryStyle? style, VenueLabelStyle? labelStyle);
  /// Gets the [VenueModel] controlled by this object.
  VenueModel get venueModel;

  /// Gets the [VenueStyle] associated with the [VenueModel]
  /// controlled by this object.
  VenueStyle get venueStyle;

  /// Gets the currently selected [VenueDrawing] of the [VenueModel].
  /// Only the selected drawing will be visible as active on the map. All others will be
  /// hidden or displayed without details, depending on the implementation of the renderer.
  VenueDrawing get selectedDrawing;
  /// Sets the selected [VenueDrawing].
  set selectedDrawing(VenueDrawing value);

  /// Gets the currently selected [VenueLevel] from the selected [VenueDrawing].
  /// Only the selected level will be visible as active on the map. All others will be
  /// hidden or displayed without details, depending on a renderer implementation.
  VenueLevel get selectedLevel;
  /// Sets the selected [VenueLevel] from the currently selected [VenueDrawing].
  /// If the level doesn't belong to the currently selected drawing, it can not be selected.
  set selectedLevel(VenueLevel value);

  /// Gets the Z index of the currently selected [VenueLevel].
  /// Z index 0 represents the ground level, negative values represent
  /// underground levels, positive values - levels above the ground.
  /// Z index can also be taken from [VenueLevel.zIndex].
  int get selectedLevelZIndex;
  /// Sets the [VenueLevel] with the specified Z index as selected.
  set selectedLevelZIndex(int value);

  /// Gets the index of the currently selected [VenueLevel] in the level array
  /// of the related [VenueDrawing]. The level array can be taken from
  /// [VenueDrawing.levels]. Unlike the Z index, it can't have a negative value.
  int get selectedLevelIndex;
  /// Sets the [VenueLevel] with the specified index from the level array
  /// of the [VenueDrawing] as selected. It should not be a negative value.
  set selectedLevelIndex(int value);

}


// Venue "private" section, not exported.

final _sdkVenueControlVenueRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_control_Venue_register_finalizer'));
final _sdkVenueControlVenueCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_Venue_copy_handle'));
final _sdkVenueControlVenueReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_Venue_release_handle'));



class Venue$Impl extends __lib.NativeBase implements Venue {

  Venue$Impl(Pointer<Void> handle) : super(handle);

  @override
  void setCustomStyle(List<VenueGeometry> geometries, VenueGeometryStyle? style, VenueLabelStyle? labelStyle) {
    final _setCustomStyleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_venue_control_Venue_setCustomStyle__ListOf_sdk_venue_data_VenueGeometry_VenueGeometryStyle__VenueLabelStyle_'));
    final _geometriesHandle = venuecoreBindingslistofSdkVenueDataVenuegeometryToFfi(geometries);
    final _styleHandle = sdkVenueStyleVenuegeometrystyleToFfiNullable(style);
    final _labelStyleHandle = sdkVenueStyleVenuelabelstyleToFfiNullable(labelStyle);
    final _handle = this.handle;
    _setCustomStyleFfi(_handle, __lib.LibraryContext.isolateId, _geometriesHandle, _styleHandle, _labelStyleHandle);
    venuecoreBindingslistofSdkVenueDataVenuegeometryReleaseFfiHandle(_geometriesHandle);
    sdkVenueStyleVenuegeometrystyleReleaseFfiHandleNullable(_styleHandle);
    sdkVenueStyleVenuelabelstyleReleaseFfiHandleNullable(_labelStyleHandle);

  }

  @override
  VenueModel get venueModel {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_Venue_venueModel_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuemodelFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuemodelReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  VenueStyle get venueStyle {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_Venue_venueStyle_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueStyleVenuestyleFromFfi(__resultHandle);
    } finally {
      sdkVenueStyleVenuestyleReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  VenueDrawing get selectedDrawing {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_Venue_selectedDrawing_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuedrawingFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuedrawingReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set selectedDrawing(VenueDrawing value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_Venue_selectedDrawing_set__VenueDrawing'));
    final _valueHandle = sdkVenueDataVenuedrawingToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkVenueDataVenuedrawingReleaseFfiHandle(_valueHandle);

  }


  @override
  VenueLevel get selectedLevel {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_Venue_selectedLevel_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuelevelFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuelevelReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set selectedLevel(VenueLevel value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_Venue_selectedLevel_set__VenueLevel'));
    final _valueHandle = sdkVenueDataVenuelevelToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkVenueDataVenuelevelReleaseFfiHandle(_valueHandle);

  }


  @override
  int get selectedLevelZIndex {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_Venue_selectedLevelZIndex_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set selectedLevelZIndex(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_control_Venue_selectedLevelZIndex_set__Int'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  int get selectedLevelIndex {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_Venue_selectedLevelIndex_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @override
  set selectedLevelIndex(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_control_Venue_selectedLevelIndex_set__Int'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }



}

Pointer<Void> sdkVenueControlVenueToFfi(Venue value) =>
  _sdkVenueControlVenueCopyHandle((value as __lib.NativeBase).handle);

Venue sdkVenueControlVenueFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Venue) return instance;

  final _copiedHandle = _sdkVenueControlVenueCopyHandle(handle);
  final result = Venue$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueControlVenueRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueControlVenueReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueControlVenueReleaseHandle(handle);

Pointer<Void> sdkVenueControlVenueToFfiNullable(Venue? value) =>
  value != null ? sdkVenueControlVenueToFfi(value) : Pointer<Void>.fromAddress(0);

Venue? sdkVenueControlVenueFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueControlVenueFromFfi(handle) : null;

void sdkVenueControlVenueReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueControlVenueReleaseHandle(handle);

// End of Venue "private" section.


