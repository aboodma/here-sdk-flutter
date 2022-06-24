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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/venue/style/icon_info.dart';
import 'package:here_sdk/src/sdk/venue/style/venue_geometry_style.dart';
import 'package:here_sdk/src/sdk/venue/style/venue_label_style.dart';
import 'package:meta/meta.dart';

/// Specifies the themes for the map style, map icons, and the labels on the map.
/// @nodoc
@internal
abstract class Theme {
  /// Creates a theme.
  ///
  /// [styles] The map of styles.
  ///
  /// [icons] The map of icons.
  ///
  /// [labelStyles] The map of label styles.
  ///
  /// @nodoc
  factory Theme(Map<String, VenueGeometryStyle> styles, Map<String, IconInfo> icons, Map<String, VenueLabelStyle> labelStyles) => $prototype.internalmake(styles, icons, labelStyles);

  /// Gets a style.
  ///
  /// [name] The name of the style to get.
  ///
  /// Returns [VenueGeometryStyle]. The named style.
  ///
  /// @nodoc
  VenueGeometryStyle internalgetStyle(String name);
  /// Gets an icon.
  ///
  /// [name] The name of the icon to get.
  ///
  /// Returns [IconInfo]. The named icon.
  ///
  /// @nodoc
  IconInfo internalgetIcon(String name);
  /// Gets a label style.
  ///
  /// [name] The name of the label style to get.
  ///
  /// Returns [VenueLabelStyle]. The named label style.
  ///
  /// @nodoc
  VenueLabelStyle internalgetLabelStyle(String name);
  /// Gets the names of styles.
  /// @nodoc
  @internal
  List<String> get internalstyleNames;

  /// Gets the names of icons.
  /// @nodoc
  @internal
  List<String> get internaliconNames;

  /// Gets the names of label styles.
  /// @nodoc
  @internal
  List<String> get internallabelStyleNames;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Theme$Impl(Pointer<Void>.fromAddress(0));
}


// Theme "private" section, not exported.

final _sdkVenueStyleThemeRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_Theme_register_finalizer'));
final _sdkVenueStyleThemeCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_Theme_copy_handle'));
final _sdkVenueStyleThemeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_Theme_release_handle'));






/// @nodoc
@visibleForTesting
class Theme$Impl extends __lib.NativeBase implements Theme {

  Theme$Impl(Pointer<Void> handle) : super(handle);


  Theme internalmake(Map<String, VenueGeometryStyle> styles, Map<String, IconInfo> icons, Map<String, VenueLabelStyle> labelStyles) {
    final _result_handle = _make(styles, icons, labelStyles);
    final _result = Theme$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkVenueStyleThemeRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  @override
  VenueGeometryStyle internalgetStyle(String name) {
    final _getStyleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_Theme_getStyle__String'));
    final _nameHandle = stringToFfi(name);
    final _handle = this.handle;
    final __resultHandle = _getStyleFfi(_handle, __lib.LibraryContext.isolateId, _nameHandle);
    stringReleaseFfiHandle(_nameHandle);
    try {
      return sdkVenueStyleVenuegeometrystyleFromFfi(__resultHandle);
    } finally {
      sdkVenueStyleVenuegeometrystyleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  IconInfo internalgetIcon(String name) {
    final _getIconFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_Theme_getIcon__String'));
    final _nameHandle = stringToFfi(name);
    final _handle = this.handle;
    final __resultHandle = _getIconFfi(_handle, __lib.LibraryContext.isolateId, _nameHandle);
    stringReleaseFfiHandle(_nameHandle);
    try {
      return sdkVenueStyleIconinfoFromFfi(__resultHandle);
    } finally {
      sdkVenueStyleIconinfoReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  VenueLabelStyle internalgetLabelStyle(String name) {
    final _getLabelStyleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_Theme_getLabelStyle__String'));
    final _nameHandle = stringToFfi(name);
    final _handle = this.handle;
    final __resultHandle = _getLabelStyleFfi(_handle, __lib.LibraryContext.isolateId, _nameHandle);
    stringReleaseFfiHandle(_nameHandle);
    try {
      return sdkVenueStyleVenuelabelstyleFromFfi(__resultHandle);
    } finally {
      sdkVenueStyleVenuelabelstyleReleaseFfiHandle(__resultHandle);

    }

  }

  static Pointer<Void> _make(Map<String, VenueGeometryStyle> styles, Map<String, IconInfo> icons, Map<String, VenueLabelStyle> labelStyles) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_venue_style_Theme_make__MapOf_String_to_sdk_venue_style_VenueGeometryStyle_MapOf_String_to_sdk_venue_style_IconInfo_MapOf_String_to_sdk_venue_style_VenueLabelStyle'));
    final _stylesHandle = venuecoreBindingsmapofStringToSdkVenueStyleVenuegeometrystyleToFfi(styles);
    final _iconsHandle = venuecoreBindingsmapofStringToSdkVenueStyleIconinfoToFfi(icons);
    final _labelStylesHandle = venuecoreBindingsmapofStringToSdkVenueStyleVenuelabelstyleToFfi(labelStyles);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _stylesHandle, _iconsHandle, _labelStylesHandle);
    venuecoreBindingsmapofStringToSdkVenueStyleVenuegeometrystyleReleaseFfiHandle(_stylesHandle);
    venuecoreBindingsmapofStringToSdkVenueStyleIconinfoReleaseFfiHandle(_iconsHandle);
    venuecoreBindingsmapofStringToSdkVenueStyleVenuelabelstyleReleaseFfiHandle(_labelStylesHandle);
    return __resultHandle;
  }

  @internal
  @override
  List<String> get internalstyleNames {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_Theme_styleNames_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofStringFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofStringReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  List<String> get internaliconNames {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_Theme_iconNames_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofStringFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofStringReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  List<String> get internallabelStyleNames {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_Theme_labelStyleNames_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofStringFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofStringReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueStyleThemeToFfi(Theme value) =>
  _sdkVenueStyleThemeCopyHandle((value as __lib.NativeBase).handle);

Theme sdkVenueStyleThemeFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Theme) return instance;

  final _copiedHandle = _sdkVenueStyleThemeCopyHandle(handle);
  final result = Theme$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleThemeRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleThemeReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleThemeReleaseHandle(handle);

Pointer<Void> sdkVenueStyleThemeToFfiNullable(Theme? value) =>
  value != null ? sdkVenueStyleThemeToFfi(value) : Pointer<Void>.fromAddress(0);

Theme? sdkVenueStyleThemeFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleThemeFromFfi(handle) : null;

void sdkVenueStyleThemeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleThemeReleaseHandle(handle);

// End of Theme "private" section.


