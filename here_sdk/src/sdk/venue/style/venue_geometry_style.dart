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
import 'dart:ui' as ui;
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/color.dart';
import 'package:meta/meta.dart';

/// Represents a style of the [VenueGeometry].
abstract class VenueGeometryStyle {
  /// Creates a custom style with specific parameters.
  ///
  /// [mainColor] The main color.
  ///
  /// [outlineColor] The outline color.
  ///
  /// [outlineWidth] The outline width.
  ///
  factory VenueGeometryStyle(ui.Color mainColor, ui.Color outlineColor, double outlineWidth) => $prototype.make(mainColor, outlineColor, outlineWidth);

  /// Gets the main color for this style.
  ui.Color get mainColor;
  /// Sets the main color.
  /// @nodoc
  @internal
  set internalmainColor(ui.Color value);

  /// Gets an outline color for this style.
  ui.Color get outlineColor;
  /// Sets an outline color.
  /// @nodoc
  @internal
  set internaloutlineColor(ui.Color value);

  /// Gets an outline width for this style.
  double get outlineWidth;
  /// Sets an outline width.
  /// @nodoc
  @internal
  set internaloutlineWidth(double value);

  /// Gets the minimum z value or `null` if the minimum z value
  /// has not been set for this style.
  /// @nodoc
  @internal
  double? get internalzMin;
  /// Sets the minimum Z value.
  /// @nodoc
  @internal
  set internalzMin(double? value);

  /// Gets a label style name or `null` if a label style name
  /// has not been set for this style.
  String? get labelStyleName;
  /// Sets a name of the label style.
  /// @nodoc
  @internal
  set internallabelStyleName(String? value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = VenueGeometryStyle$Impl(Pointer<Void>.fromAddress(0));
}


// VenueGeometryStyle "private" section, not exported.

final _sdkVenueStyleVenuegeometrystyleRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_VenueGeometryStyle_register_finalizer'));
final _sdkVenueStyleVenuegeometrystyleCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_VenueGeometryStyle_copy_handle'));
final _sdkVenueStyleVenuegeometrystyleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_VenueGeometryStyle_release_handle'));



/// @nodoc
@visibleForTesting
class VenueGeometryStyle$Impl extends __lib.NativeBase implements VenueGeometryStyle {

  VenueGeometryStyle$Impl(Pointer<Void> handle) : super(handle);


  VenueGeometryStyle make(ui.Color mainColor, ui.Color outlineColor, double outlineWidth) {
    final _result_handle = _make(mainColor, outlineColor, outlineWidth);
    final _result = VenueGeometryStyle$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkVenueStyleVenuegeometrystyleRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make(ui.Color mainColor, ui.Color outlineColor, double outlineWidth) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Float), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, double)>('here_sdk_sdk_venue_style_VenueGeometryStyle_make__Color_Color_Float'));
    final _mainColorHandle = sdkCoreColorToFfi(mainColor);
    final _outlineColorHandle = sdkCoreColorToFfi(outlineColor);
    final _outlineWidthHandle = (outlineWidth);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _mainColorHandle, _outlineColorHandle, _outlineWidthHandle);
    sdkCoreColorReleaseFfiHandle(_mainColorHandle);
    sdkCoreColorReleaseFfiHandle(_outlineColorHandle);

    return __resultHandle;
  }

  @override
  ui.Color get mainColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueGeometryStyle_mainColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfi(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandle(__resultHandle);

    }

  }

  @internal
  @override
  set internalmainColor(ui.Color value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_VenueGeometryStyle_mainColor_set__Color'));
    final _valueHandle = sdkCoreColorToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreColorReleaseFfiHandle(_valueHandle);

  }


  @override
  ui.Color get outlineColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueGeometryStyle_outlineColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfi(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandle(__resultHandle);

    }

  }

  @internal
  @override
  set internaloutlineColor(ui.Color value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_VenueGeometryStyle_outlineColor_set__Color'));
    final _valueHandle = sdkCoreColorToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreColorReleaseFfiHandle(_valueHandle);

  }


  @override
  double get outlineWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueGeometryStyle_outlineWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @internal
  @override
  set internaloutlineWidth(double value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Float), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_venue_style_VenueGeometryStyle_outlineWidth_set__Float'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @internal
  @override
  double? get internalzMin {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueGeometryStyle_zMin_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return floatFromFfiNullable(__resultHandle);
    } finally {
      floatReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @internal
  @override
  set internalzMin(double? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_VenueGeometryStyle_zMin_set__Float_'));
    final _valueHandle = floatToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    floatReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  String? get labelStyleName {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueGeometryStyle_labelStyleName_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfiNullable(__resultHandle);
    } finally {
      stringReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @internal
  @override
  set internallabelStyleName(String? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_VenueGeometryStyle_labelStyleName_set__String_'));
    final _valueHandle = stringToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandleNullable(_valueHandle);

  }



}

Pointer<Void> sdkVenueStyleVenuegeometrystyleToFfi(VenueGeometryStyle value) =>
  _sdkVenueStyleVenuegeometrystyleCopyHandle((value as __lib.NativeBase).handle);

VenueGeometryStyle sdkVenueStyleVenuegeometrystyleFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueGeometryStyle) return instance;

  final _copiedHandle = _sdkVenueStyleVenuegeometrystyleCopyHandle(handle);
  final result = VenueGeometryStyle$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleVenuegeometrystyleRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleVenuegeometrystyleReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleVenuegeometrystyleReleaseHandle(handle);

Pointer<Void> sdkVenueStyleVenuegeometrystyleToFfiNullable(VenueGeometryStyle? value) =>
  value != null ? sdkVenueStyleVenuegeometrystyleToFfi(value) : Pointer<Void>.fromAddress(0);

VenueGeometryStyle? sdkVenueStyleVenuegeometrystyleFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleVenuegeometrystyleFromFfi(handle) : null;

void sdkVenueStyleVenuegeometrystyleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleVenuegeometrystyleReleaseHandle(handle);

// End of VenueGeometryStyle "private" section.


