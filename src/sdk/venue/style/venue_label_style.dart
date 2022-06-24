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

/// Represents a style of the label.
abstract class VenueLabelStyle {
  /// Creates a custom label style with specific parameters.
  ///
  /// [fillColor] The fill color.
  ///
  /// [outlineColor] The outline color.
  ///
  /// [outlineWidth] The width color.
  ///
  /// [maxFont] The max font.
  ///
  factory VenueLabelStyle(ui.Color fillColor, ui.Color outlineColor, double outlineWidth, int maxFont) => $prototype.make(fillColor, outlineColor, outlineWidth, maxFont);

  /// Gets a font or `null` if a font has not been set for this label style.
  /// @nodoc
  @internal
  String? get internalfont;
  /// Sets the font.
  /// @nodoc
  @internal
  set internalfont(String? value);

  /// Gets a minimum font size for this label style.
  /// @nodoc
  @internal
  int get internalminFont;
  /// Sets a minimum font size.
  /// @nodoc
  @internal
  set internalminFont(int value);

  /// Gets a maximum font size for this label style.
  int get maxFont;
  /// Sets a maximum font size.
  /// @nodoc
  @internal
  set internalmaxFont(int value);

  /// Gets a fill color for this label style.
  ui.Color get fillColor;
  /// Sets a fill color.
  /// @nodoc
  @internal
  set internalfillColor(ui.Color value);

  /// Gets an outline color or `null` if an outline color
  /// has not been set for this label style.
  ui.Color? get outlineColor;
  /// Sets an outline color.
  /// @nodoc
  @internal
  set internaloutlineColor(ui.Color? value);

  /// Gets an outline width for this label style.
  double get outlineWidth;
  /// Sets an outline width.
  /// @nodoc
  @internal
  set internaloutlineWidth(double value);

  /// Gets the minimum z value or `null` if the minimum z value
  /// has not been set for this label style.
  /// @nodoc
  @internal
  double? get internalzMin;
  /// / Sets the minimum Z value.
  /// @nodoc
  @internal
  set internalzMin(double? value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = VenueLabelStyle$Impl(Pointer<Void>.fromAddress(0));
}


// VenueLabelStyle "private" section, not exported.

final _sdkVenueStyleVenuelabelstyleRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_VenueLabelStyle_register_finalizer'));
final _sdkVenueStyleVenuelabelstyleCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_VenueLabelStyle_copy_handle'));
final _sdkVenueStyleVenuelabelstyleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_VenueLabelStyle_release_handle'));



/// @nodoc
@visibleForTesting
class VenueLabelStyle$Impl extends __lib.NativeBase implements VenueLabelStyle {

  VenueLabelStyle$Impl(Pointer<Void> handle) : super(handle);


  VenueLabelStyle make(ui.Color fillColor, ui.Color outlineColor, double outlineWidth, int maxFont) {
    final _result_handle = _make(fillColor, outlineColor, outlineWidth, maxFont);
    final _result = VenueLabelStyle$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkVenueStyleVenuelabelstyleRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make(ui.Color fillColor, ui.Color outlineColor, double outlineWidth, int maxFont) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Float, Int32), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, double, int)>('here_sdk_sdk_venue_style_VenueLabelStyle_make__Color_Color_Float_Int'));
    final _fillColorHandle = sdkCoreColorToFfi(fillColor);
    final _outlineColorHandle = sdkCoreColorToFfi(outlineColor);
    final _outlineWidthHandle = (outlineWidth);
    final _maxFontHandle = (maxFont);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _fillColorHandle, _outlineColorHandle, _outlineWidthHandle, _maxFontHandle);
    sdkCoreColorReleaseFfiHandle(_fillColorHandle);
    sdkCoreColorReleaseFfiHandle(_outlineColorHandle);


    return __resultHandle;
  }

  @internal
  @override
  String? get internalfont {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueLabelStyle_font_get'));
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
  set internalfont(String? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_VenueLabelStyle_font_set__String_'));
    final _valueHandle = stringToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandleNullable(_valueHandle);

  }


  @internal
  @override
  int get internalminFont {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueLabelStyle_minFont_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @internal
  @override
  set internalminFont(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_style_VenueLabelStyle_minFont_set__Int'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  int get maxFont {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueLabelStyle_maxFont_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @internal
  @override
  set internalmaxFont(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_style_VenueLabelStyle_maxFont_set__Int'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  ui.Color get fillColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueLabelStyle_fillColor_get'));
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
  set internalfillColor(ui.Color value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_VenueLabelStyle_fillColor_set__Color'));
    final _valueHandle = sdkCoreColorToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreColorReleaseFfiHandle(_valueHandle);

  }


  @override
  ui.Color? get outlineColor {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueLabelStyle_outlineColor_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreColorFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreColorReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @internal
  @override
  set internaloutlineColor(ui.Color? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_VenueLabelStyle_outlineColor_set__Color_'));
    final _valueHandle = sdkCoreColorToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreColorReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  double get outlineWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueLabelStyle_outlineWidth_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Float), void Function(Pointer<Void>, int, double)>('here_sdk_sdk_venue_style_VenueLabelStyle_outlineWidth_set__Float'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @internal
  @override
  double? get internalzMin {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueLabelStyle_zMin_get'));
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
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_VenueLabelStyle_zMin_set__Float_'));
    final _valueHandle = floatToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    floatReleaseFfiHandleNullable(_valueHandle);

  }



}

Pointer<Void> sdkVenueStyleVenuelabelstyleToFfi(VenueLabelStyle value) =>
  _sdkVenueStyleVenuelabelstyleCopyHandle((value as __lib.NativeBase).handle);

VenueLabelStyle sdkVenueStyleVenuelabelstyleFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueLabelStyle) return instance;

  final _copiedHandle = _sdkVenueStyleVenuelabelstyleCopyHandle(handle);
  final result = VenueLabelStyle$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleVenuelabelstyleRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleVenuelabelstyleReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleVenuelabelstyleReleaseHandle(handle);

Pointer<Void> sdkVenueStyleVenuelabelstyleToFfiNullable(VenueLabelStyle? value) =>
  value != null ? sdkVenueStyleVenuelabelstyleToFfi(value) : Pointer<Void>.fromAddress(0);

VenueLabelStyle? sdkVenueStyleVenuelabelstyleFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleVenuelabelstyleFromFfi(handle) : null;

void sdkVenueStyleVenuelabelstyleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleVenuelabelstyleReleaseHandle(handle);

// End of VenueLabelStyle "private" section.


