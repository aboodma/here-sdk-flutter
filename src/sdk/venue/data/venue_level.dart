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
import 'package:here_sdk/src/sdk/venue/data/venue_drawing.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_geometry.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_geometry_filter_type.dart';
import 'package:meta/meta.dart';

/// Represents one level of a building or a complex of buildings inside the [VenueDrawing].
abstract class VenueLevel {

  /// Determines if the specified geographic coordinates are contained within this Venue Level.
  ///
  /// [geoCoordinates] Geographic coordinates to check for containment within this Venue Level.
  ///
  /// Returns [bool]. True if is contained within the Venue Level, false otherwise.
  ///
  /// @nodoc
  bool internalcontains(GeoCoordinates geoCoordinates);
  /// Gets a geometry by coordinates.
  ///
  /// [coordinates] The coordinates inside the searching geometry.
  ///
  /// Returns [VenueGeometry?]. The geometry covering the coordinates or `null`.
  ///
  VenueGeometry? getGeometryByCoordinates(GeoCoordinates coordinates);
  /// Gets geometries by coordinates.
  ///
  /// [coordinates] The coordinates inside the searching geometries.
  ///
  /// Returns [List<VenueGeometry>]. The list of geometries covering the coordinate or an empty list.
  ///
  List<VenueGeometry> getGeometriesByCoordinates(GeoCoordinates coordinates);
  /// Gets a geometry by an id.
  ///
  /// [geometryId] The id of the geometry.
  ///
  /// Returns [VenueGeometry?]. The geometry with the given id or `null`.
  ///
  VenueGeometry? getGeometryById(int geometryId);
  /// Gets a geometry by the [VenueGeometryInternalAddress].
  ///
  /// [geometryAddress] The internal address as a String.
  ///
  /// Returns [VenueGeometry?]. The geometry with the given address or `null`.
  ///
  VenueGeometry? getGeometryByAddress(String geometryAddress);
  /// Gets the filtered geometries in an ascending order.
  ///
  /// [filter] The filter string.
  ///
  /// [filterType] The filter type.
  ///
  /// Returns [List<VenueGeometry>]. The list of the filtered geometries or an empty list.
  ///
  List<VenueGeometry> filterGeometry(String filter, VenueGeometryFilterType filterType);
  /// Merges levels.
  ///
  /// [level] The level to merge.
  ///
  /// Returns [bool]. True if the merge was successful and false otherwise.
  ///
  /// @nodoc
  bool internalmergeLevel(VenueLevel level);
  /// Checks if a specified level is merged into this instance
  /// of the level.
  ///
  /// [levelId] The id of the merged level.
  ///
  /// Returns [bool]. True if the specified level is merged into this level object
  /// and false otherwise.
  ///
  /// @nodoc
  bool internalcontainsMergedLevel(int levelId);
  /// Gets an id of the level.
  int get id;

  /// Gets an order in the z direction (altitude). Z index 0 represents
  /// a ground level, negative values represent underground levels,
  /// positive values - levels above ground.
  int get zIndex;

  /// Gets properties of the level.
  Map<String, Property> get properties;

  /// Gets a 'name' property of the level from the level properties.
  /// If the 'name' property is missing in the properties, the string will be empty.
  String get name;

  /// Gets a short name of the level.
  String get shortName;

  /// Indicates if this level is the main level.
  bool get isIsMainLevel;

  /// Gets a parent drawing of the level.
  VenueDrawing get drawing;

  /// Gets a list of geometries of the level.
  List<VenueGeometry> get geometries;
  /// Sets a list of geometries.
  /// @nodoc
  @internal
  set internalgeometries(List<VenueGeometry> value);

  /// Gets drawing ID of the level.
  int get drawingID;
  /// Sets drawing ID to level.
  /// @nodoc
  @internal
  set internaldrawingID(int value);

  /// Gets a center of the level.
  GeoCoordinates get center;

  /// Gets a bounding box of the level.
  GeoBox get boundingBox;

  /// Gets the geometries ordered by a name in an ascending order.
  List<VenueGeometry> get geometriesByName;

  /// Gets the geometries mapped by icon names.
  Map<String, List<VenueGeometry>> get geometriesByIconNames;

  /// Gets the list of merged level ids.
  /// @nodoc
  @internal
  List<int> get internalmergedLevel;

}


// VenueLevel "private" section, not exported.

final _sdkVenueDataVenuelevelRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_data_VenueLevel_register_finalizer'));
final _sdkVenueDataVenuelevelCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueLevel_copy_handle'));
final _sdkVenueDataVenuelevelReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueLevel_release_handle'));










class VenueLevel$Impl extends __lib.NativeBase implements VenueLevel {

  VenueLevel$Impl(Pointer<Void> handle) : super(handle);

  @override
  bool internalcontains(GeoCoordinates geoCoordinates) {
    final _containsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueLevel_contains__GeoCoordinates'));
    final _geoCoordinatesHandle = sdkCoreGeocoordinatesToFfi(geoCoordinates);
    final _handle = this.handle;
    final __resultHandle = _containsFfi(_handle, __lib.LibraryContext.isolateId, _geoCoordinatesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_geoCoordinatesHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  VenueGeometry? getGeometryByCoordinates(GeoCoordinates coordinates) {
    final _getGeometryByCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueLevel_getGeometryByCoordinates__GeoCoordinates'));
    final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(coordinates);
    final _handle = this.handle;
    final __resultHandle = _getGeometryByCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _coordinatesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    try {
      return sdkVenueDataVenuegeometryFromFfiNullable(__resultHandle);
    } finally {
      sdkVenueDataVenuegeometryReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  List<VenueGeometry> getGeometriesByCoordinates(GeoCoordinates coordinates) {
    final _getGeometriesByCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueLevel_getGeometriesByCoordinates__GeoCoordinates'));
    final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(coordinates);
    final _handle = this.handle;
    final __resultHandle = _getGeometriesByCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _coordinatesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    try {
      return venuecoreBindingslistofSdkVenueDataVenuegeometryFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofSdkVenueDataVenuegeometryReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  VenueGeometry? getGeometryById(int geometryId) {
    final _getGeometryByIdFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Int32), Pointer<Void> Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_data_VenueLevel_getGeometryById__Int'));
    final _geometryIdHandle = (geometryId);
    final _handle = this.handle;
    final __resultHandle = _getGeometryByIdFfi(_handle, __lib.LibraryContext.isolateId, _geometryIdHandle);

    try {
      return sdkVenueDataVenuegeometryFromFfiNullable(__resultHandle);
    } finally {
      sdkVenueDataVenuegeometryReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  VenueGeometry? getGeometryByAddress(String geometryAddress) {
    final _getGeometryByAddressFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueLevel_getGeometryByAddress__String'));
    final _geometryAddressHandle = stringToFfi(geometryAddress);
    final _handle = this.handle;
    final __resultHandle = _getGeometryByAddressFfi(_handle, __lib.LibraryContext.isolateId, _geometryAddressHandle);
    stringReleaseFfiHandle(_geometryAddressHandle);
    try {
      return sdkVenueDataVenuegeometryFromFfiNullable(__resultHandle);
    } finally {
      sdkVenueDataVenuegeometryReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  List<VenueGeometry> filterGeometry(String filter, VenueGeometryFilterType filterType) {
    final _filterGeometryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Uint32), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueLevel_filterGeometry__String_VenueGeometryFilterType'));
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
  bool internalmergeLevel(VenueLevel level) {
    final _mergeLevelFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueLevel_mergeLevel__VenueLevel'));
    final _levelHandle = sdkVenueDataVenuelevelToFfi(level);
    final _handle = this.handle;
    final __resultHandle = _mergeLevelFfi(_handle, __lib.LibraryContext.isolateId, _levelHandle);
    sdkVenueDataVenuelevelReleaseFfiHandle(_levelHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool internalcontainsMergedLevel(int levelId) {
    final _containsMergedLevelFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Int32), int Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_data_VenueLevel_containsMergedLevel__Int'));
    final _levelIdHandle = (levelId);
    final _handle = this.handle;
    final __resultHandle = _containsMergedLevelFfi(_handle, __lib.LibraryContext.isolateId, _levelIdHandle);

    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  int get id {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueLevel_id_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  int get zIndex {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueLevel_zIndex_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  Map<String, Property> get properties {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueLevel_properties_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingsmapofStringToSdkVenueDataPropertyFromFfi(__resultHandle);
    } finally {
      venuecoreBindingsmapofStringToSdkVenueDataPropertyReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get name {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueLevel_name_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get shortName {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueLevel_shortName_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  bool get isIsMainLevel {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueLevel_isIsMainLevel_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  VenueDrawing get drawing {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueLevel_drawing_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuedrawingFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuedrawingReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<VenueGeometry> get geometries {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueLevel_geometries_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofSdkVenueDataVenuegeometryFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofSdkVenueDataVenuegeometryReleaseFfiHandle(__resultHandle);

    }

  }

  @internal
  @override
  set internalgeometries(List<VenueGeometry> value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueLevel_geometries_set__ListOf_sdk_venue_data_VenueGeometry'));
    final _valueHandle = venuecoreBindingslistofSdkVenueDataVenuegeometryToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    venuecoreBindingslistofSdkVenueDataVenuegeometryReleaseFfiHandle(_valueHandle);

  }


  @override
  int get drawingID {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueLevel_drawingID_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @internal
  @override
  set internaldrawingID(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_data_VenueLevel_drawingID_set__Int'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @override
  GeoCoordinates get center {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueLevel_center_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  GeoBox get boundingBox {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueLevel_boundingBox_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeoboxFromFfi(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<VenueGeometry> get geometriesByName {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueLevel_geometriesByName_get'));
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
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueLevel_geometriesByIconNames_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingsmapofStringToVenuecoreBindingslistofSdkVenueDataVenuegeometryFromFfi(__resultHandle);
    } finally {
      venuecoreBindingsmapofStringToVenuecoreBindingslistofSdkVenueDataVenuegeometryReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  List<int> get internalmergedLevel {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueLevel_mergedLevel_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofIntFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofIntReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueDataVenuelevelToFfi(VenueLevel value) =>
  _sdkVenueDataVenuelevelCopyHandle((value as __lib.NativeBase).handle);

VenueLevel sdkVenueDataVenuelevelFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueLevel) return instance;

  final _copiedHandle = _sdkVenueDataVenuelevelCopyHandle(handle);
  final result = VenueLevel$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueDataVenuelevelRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueDataVenuelevelReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueDataVenuelevelReleaseHandle(handle);

Pointer<Void> sdkVenueDataVenuelevelToFfiNullable(VenueLevel? value) =>
  value != null ? sdkVenueDataVenuelevelToFfi(value) : Pointer<Void>.fromAddress(0);

VenueLevel? sdkVenueDataVenuelevelFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueDataVenuelevelFromFfi(handle) : null;

void sdkVenueDataVenuelevelReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataVenuelevelReleaseHandle(handle);

// End of VenueLevel "private" section.


