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
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/venue/data/property.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_display_type.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_drawing.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_geometry.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_geometry_filter_type.dart';
import 'package:meta/meta.dart';

/// Represents a building or a complex of buildings, like airports or universities.
abstract class VenueModel {

  /// Gets a drawing for a given drawing id.
  ///
  /// [drawingId] The id of the drawing.
  ///
  /// Returns [VenueDrawing]. The drawing with the given id or `null`.
  ///
  VenueDrawing getDrawing(int drawingId);
  /// Applies the display settings.
  ///
  /// @nodoc
  void internalapplyDisplaySettings();
  /// Gets the filtered geometries in an ascending order.
  ///
  /// [filter] The filter string.
  ///
  /// [filterType] The filter type.
  ///
  /// Returns [List<VenueGeometry>]. The list of the filtered geometries or an empty list.
  ///
  List<VenueGeometry> filterGeometry(String filter, VenueGeometryFilterType filterType);
  /// Gets an id of the venue model.
  int get id;

  /// Gets a center of the venue model.
  GeoCoordinates get center;
  /// Sets the center of Site
  /// @nodoc
  @internal
  set internalcenter(GeoCoordinates value);

  /// Gets a bounding box of the venue model.
  GeoBox get boundingBox;
  /// Sets the bounding box for site.
  /// @nodoc
  @internal
  set internalboundingBox(GeoBox value);

  /// Gets the drawings of the venue model.
  List<VenueDrawing> get drawings;
  /// Sets the array of Drawing objects.
  /// @nodoc
  @internal
  set internaldrawings(List<VenueDrawing> value);

  /// Gets the list of string override URLs.
  /// @nodoc
  @internal
  List<String> get internalstringOverrideUrls;
  /// Sets the list of string override URLs.
  /// @nodoc
  @internal
  set internalstringOverrideUrls(List<String> value);

  /// Gets the list of theme map override URLs.
  /// @nodoc
  @internal
  List<String> get internalthemeMapOverrideUrls;
  /// Sets the list of theme map override URLs.
  /// @nodoc
  @internal
  set internalthemeMapOverrideUrls(List<String> value);

  /// Gets the list of theme override URL map.
  /// @nodoc
  @internal
  Map<String, List<String>> get internalthemeOverrideUrlMap;
  /// Sets the list of theme override URL map.
  /// @nodoc
  @internal
  set internalthemeOverrideUrlMap(Map<String, List<String>> value);

  /// Gets properties of the venue model.
  Map<String, Property> get properties;

  /// Gets the display type.
  /// @nodoc
  @internal
  VenueDisplayType get internaldisplayType;
  /// Sets the display type.
  /// @nodoc
  @internal
  set internaldisplayType(VenueDisplayType value);

  /// Gets a language of the venue model.
  String get language;
  /// Sets a language of the venue model.
  /// @nodoc
  @internal
  set internallanguage(String value);

  /// Gets the geometries ordered by a name in an ascending order.
  List<VenueGeometry> get geometriesByName;

  /// Gets geometries mapped by icon names.
  Map<String, List<VenueGeometry>> get geometriesByIconNames;

}


// VenueModel "private" section, not exported.

final _sdkVenueDataVenuemodelRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_data_VenueModel_register_finalizer'));
final _sdkVenueDataVenuemodelCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueModel_copy_handle'));
final _sdkVenueDataVenuemodelReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueModel_release_handle'));





class VenueModel$Impl extends __lib.NativeBase implements VenueModel {

  VenueModel$Impl(Pointer<Void> handle) : super(handle);

  @override
  VenueDrawing getDrawing(int drawingId) {
    final _getDrawingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Int32), Pointer<Void> Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_data_VenueModel_getDrawing__Int'));
    final _drawingIdHandle = (drawingId);
    final _handle = this.handle;
    final __resultHandle = _getDrawingFfi(_handle, __lib.LibraryContext.isolateId, _drawingIdHandle);

    try {
      return sdkVenueDataVenuedrawingFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuedrawingReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void internalapplyDisplaySettings() {
    final _applyDisplaySettingsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueModel_applyDisplaySettings'));
    final _handle = this.handle;
    _applyDisplaySettingsFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  List<VenueGeometry> filterGeometry(String filter, VenueGeometryFilterType filterType) {
    final _filterGeometryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Uint32), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueModel_filterGeometry__String_VenueGeometryFilterType'));
    final _filterHandle = stringToFfi(filter);
    final _filterTypeHandle = sdkVenueDataVenuegeometryfiltertypeToFfi(filterType);
    final _handle = this.handle;
    final __resultHandle = _filterGeometryFfi(_handle, __lib.LibraryContext.isolateId, _filterHandle, _filterTypeHandle);
    stringReleaseFfiHandle(_filterHandle);
    sdkVenueDataVenuegeometryfiltertypeReleaseFfiHandle(_filterTypeHandle);
    try {
      return venuecoreBindingslistofSdkVenueDataVenuegeometryFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofSdkVenueDataVenuegeometryReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  int get id {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueModel_id_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  GeoCoordinates get center {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueModel_center_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }

  @internal
  @override
  set internalcenter(GeoCoordinates value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueModel_center_set__GeoCoordinates'));
    final _valueHandle = sdkCoreGeocoordinatesToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_valueHandle);

  }


  @override
  GeoBox get boundingBox {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueModel_boundingBox_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeoboxFromFfi(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandle(__resultHandle);

    }

  }

  @internal
  @override
  set internalboundingBox(GeoBox value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueModel_boundingBox_set__GeoBox'));
    final _valueHandle = sdkCoreGeoboxToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreGeoboxReleaseFfiHandle(_valueHandle);

  }


  @override
  List<VenueDrawing> get drawings {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueModel_drawings_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofSdkVenueDataVenuedrawingFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofSdkVenueDataVenuedrawingReleaseFfiHandle(__resultHandle);

    }

  }

  @internal
  @override
  set internaldrawings(List<VenueDrawing> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueModel_drawings_set__ListOf_sdk_venue_data_VenueDrawing'));
    final _valueHandle = venuecoreBindingslistofSdkVenueDataVenuedrawingToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    venuecoreBindingslistofSdkVenueDataVenuedrawingReleaseFfiHandle(_valueHandle);

  }


  @internal
  @override
  List<String> get internalstringOverrideUrls {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueModel_stringOverrideUrls_get'));
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
  set internalstringOverrideUrls(List<String> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueModel_stringOverrideUrls_set__ListOf_String'));
    final _valueHandle = venuecoreBindingslistofStringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    venuecoreBindingslistofStringReleaseFfiHandle(_valueHandle);

  }


  @internal
  @override
  List<String> get internalthemeMapOverrideUrls {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueModel_themeMapOverrideUrls_get'));
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
  set internalthemeMapOverrideUrls(List<String> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueModel_themeMapOverrideUrls_set__ListOf_String'));
    final _valueHandle = venuecoreBindingslistofStringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    venuecoreBindingslistofStringReleaseFfiHandle(_valueHandle);

  }


  @internal
  @override
  Map<String, List<String>> get internalthemeOverrideUrlMap {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueModel_themeOverrideUrlMap_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingsmapofStringToVenuecoreBindingslistofStringFromFfi(__resultHandle);
    } finally {
      venuecoreBindingsmapofStringToVenuecoreBindingslistofStringReleaseFfiHandle(__resultHandle);

    }

  }

  @internal
  @override
  set internalthemeOverrideUrlMap(Map<String, List<String>> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueModel_themeOverrideUrlMap_set__MapOf_String_to_venuecore_bindingsListOf_String'));
    final _valueHandle = venuecoreBindingsmapofStringToVenuecoreBindingslistofStringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    venuecoreBindingsmapofStringToVenuecoreBindingslistofStringReleaseFfiHandle(_valueHandle);

  }


  @override
  Map<String, Property> get properties {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueModel_properties_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingsmapofStringToSdkVenueDataPropertyFromFfi(__resultHandle);
    } finally {
      venuecoreBindingsmapofStringToSdkVenueDataPropertyReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  VenueDisplayType get internaldisplayType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueModel_displayType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuedisplaytypeFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuedisplaytypeReleaseFfiHandle(__resultHandle);

    }

  }

  @internal
  @override
  set internaldisplayType(VenueDisplayType value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_data_VenueModel_displayType_set__VenueDisplayType'));
    final _valueHandle = sdkVenueDataVenuedisplaytypeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkVenueDataVenuedisplaytypeReleaseFfiHandle(_valueHandle);

  }


  @override
  String get language {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueModel_language_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  @internal
  @override
  set internallanguage(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueModel_language_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }


  @override
  List<VenueGeometry> get geometriesByName {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueModel_geometriesByName_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofSdkVenueDataVenuegeometryFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofSdkVenueDataVenuegeometryReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Map<String, List<VenueGeometry>> get geometriesByIconNames {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueModel_geometriesByIconNames_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingsmapofStringToVenuecoreBindingslistofSdkVenueDataVenuegeometryFromFfi(__resultHandle);
    } finally {
      venuecoreBindingsmapofStringToVenuecoreBindingslistofSdkVenueDataVenuegeometryReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueDataVenuemodelToFfi(VenueModel value) =>
  _sdkVenueDataVenuemodelCopyHandle((value as __lib.NativeBase).handle);

VenueModel sdkVenueDataVenuemodelFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueModel) return instance;

  final _copiedHandle = _sdkVenueDataVenuemodelCopyHandle(handle);
  final result = VenueModel$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueDataVenuemodelRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueDataVenuemodelReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueDataVenuemodelReleaseHandle(handle);

Pointer<Void> sdkVenueDataVenuemodelToFfiNullable(VenueModel? value) =>
  value != null ? sdkVenueDataVenuemodelToFfi(value) : Pointer<Void>.fromAddress(0);

VenueModel? sdkVenueDataVenuemodelFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueDataVenuemodelFromFfi(handle) : null;

void sdkVenueDataVenuemodelReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataVenuemodelReleaseHandle(handle);

// End of VenueModel "private" section.


