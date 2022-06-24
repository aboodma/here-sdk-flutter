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
import 'package:here_sdk/src/sdk/venue/data/venue_geometry.dart';
import 'package:here_sdk/src/sdk/venue/style/icon_info.dart';
import 'package:here_sdk/src/sdk/venue/style/label_name.dart';
import 'package:here_sdk/src/sdk/venue/style/theme.dart';
import 'package:here_sdk/src/sdk/venue/style/venue_geometry_style.dart';
import 'package:here_sdk/src/sdk/venue/style/venue_label_style.dart';
import 'package:meta/meta.dart';

/// Represents a style of the venue.
///
/// Contains the information about the geometry and label styles
/// available for the venue.
abstract class VenueStyle {

  /// Adds a theme override.
  ///
  /// [theme] The theme overrides.
  ///
  /// @nodoc
  void internaladdThemeOverride(Theme theme);
  /// Gets a style name for a given geometry.
  ///
  /// [geometry] The geometry for which to get the style name.
  ///
  /// Returns [String]. The name of the style.
  ///
  /// @nodoc
  String internalgetStyleNameForGeometry(VenueGeometry geometry);
  /// Finds a label name for a given geometry.
  ///
  /// [geometry] The geometry for which to get the label name.
  ///
  /// Returns [LabelName]. The label name for a given geometry.
  ///
  /// @nodoc
  LabelName internalfindLabelName(VenueGeometry geometry);
  /// Gets a geometry style.
  ///
  /// [name] The name of the geometry style to get.
  ///
  /// Returns [VenueGeometryStyle]. The geometry style.
  ///
  VenueGeometryStyle getStyle(String name);
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
  /// Returns [VenueLabelStyle]. The label style.
  ///
  VenueLabelStyle getLabelStyle(String name);
  /// Gets the available languages.
  /// @nodoc
  @internal
  List<String> get internallanguages;

}


// VenueStyle "private" section, not exported.

final _sdkVenueStyleVenuestyleRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_VenueStyle_register_finalizer'));
final _sdkVenueStyleVenuestyleCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_VenueStyle_copy_handle'));
final _sdkVenueStyleVenuestyleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_VenueStyle_release_handle'));








class VenueStyle$Impl extends __lib.NativeBase implements VenueStyle {

  VenueStyle$Impl(Pointer<Void> handle) : super(handle);

  @override
  void internaladdThemeOverride(Theme theme) {
    final _addThemeOverrideFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_VenueStyle_addThemeOverride__Theme'));
    final _themeHandle = sdkVenueStyleThemeToFfi(theme);
    final _handle = this.handle;
    _addThemeOverrideFfi(_handle, __lib.LibraryContext.isolateId, _themeHandle);
    sdkVenueStyleThemeReleaseFfiHandle(_themeHandle);

  }

  @override
  String internalgetStyleNameForGeometry(VenueGeometry geometry) {
    final _getStyleNameForGeometryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_VenueStyle_getStyleNameForGeometry__VenueGeometry'));
    final _geometryHandle = sdkVenueDataVenuegeometryToFfi(geometry);
    final _handle = this.handle;
    final __resultHandle = _getStyleNameForGeometryFfi(_handle, __lib.LibraryContext.isolateId, _geometryHandle);
    sdkVenueDataVenuegeometryReleaseFfiHandle(_geometryHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  LabelName internalfindLabelName(VenueGeometry geometry) {
    final _findLabelNameFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_VenueStyle_findLabelName__VenueGeometry'));
    final _geometryHandle = sdkVenueDataVenuegeometryToFfi(geometry);
    final _handle = this.handle;
    final __resultHandle = _findLabelNameFfi(_handle, __lib.LibraryContext.isolateId, _geometryHandle);
    sdkVenueDataVenuegeometryReleaseFfiHandle(_geometryHandle);
    try {
      return sdkVenueStyleLabelnameFromFfi(__resultHandle);
    } finally {
      sdkVenueStyleLabelnameReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  VenueGeometryStyle getStyle(String name) {
    final _getStyleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_VenueStyle_getStyle__String'));
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
    final _getIconFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_VenueStyle_getIcon__String'));
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
  VenueLabelStyle getLabelStyle(String name) {
    final _getLabelStyleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_VenueStyle_getLabelStyle__String'));
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

  @internal
  @override
  List<String> get internallanguages {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_VenueStyle_languages_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofStringFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofStringReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueStyleVenuestyleToFfi(VenueStyle value) =>
  _sdkVenueStyleVenuestyleCopyHandle((value as __lib.NativeBase).handle);

VenueStyle sdkVenueStyleVenuestyleFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueStyle) return instance;

  final _copiedHandle = _sdkVenueStyleVenuestyleCopyHandle(handle);
  final result = VenueStyle$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleVenuestyleRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleVenuestyleReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleVenuestyleReleaseHandle(handle);

Pointer<Void> sdkVenueStyleVenuestyleToFfiNullable(VenueStyle? value) =>
  value != null ? sdkVenueStyleVenuestyleToFfi(value) : Pointer<Void>.fromAddress(0);

VenueStyle? sdkVenueStyleVenuestyleFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleVenuestyleFromFfi(handle) : null;

void sdkVenueStyleVenuestyleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleVenuestyleReleaseHandle(handle);

// End of VenueStyle "private" section.


