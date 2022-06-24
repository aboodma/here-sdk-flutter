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
import 'package:here_sdk/src/sdk/venue/data/entity_info.dart';
import 'package:here_sdk/src/sdk/venue/data/geo_shape.dart';
import 'package:here_sdk/src/sdk/venue/data/geometry_shape_type.dart';
import 'package:here_sdk/src/sdk/venue/data/label_info.dart';
import 'package:here_sdk/src/sdk/venue/data/property.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_level.dart';
import 'package:here_sdk/src/sdk/venue/style/venue_geometry_style.dart';
import 'package:here_sdk/src/sdk/venue/style/venue_label_style.dart';
import 'package:meta/meta.dart';

/// Represents a geometry inside the [VenueLevel].
///
/// The geometry can be any object
/// inside the level, like a room, a wall or a table. Also the geometry can represent virtual
/// objects, like a team area in an open space.
abstract class VenueGeometry {

  /// Adds an entity.
  ///
  /// [entity] The entity to add.
  ///
  /// @nodoc
  void internaladdEntity(EntityInfo entity);
  /// Determines whether this geometry contains a passed geometry.
  ///
  /// [geometry] The geometry to check.
  ///
  /// Returns [bool]. true if this geometry contains the passed geometry, false otherwise.
  ///
  /// @nodoc
  bool internalcontains(VenueGeometry geometry);
  /// Sets a custom style for the geometry and the related label.
  ///
  /// [style] The style for the geometry, or `null` to reset the geometry style to default.
  ///
  /// [labelStyle] The style for the geometry label, or `null` to reset the label style to default.
  ///
  /// @nodoc
  void internalsetCustomStyle(VenueGeometryStyle? style, VenueLabelStyle? labelStyle);
  /// Gets an id of the geometry.
  int get id;

  /// Gets a parent level of the geometry.
  VenueLevel get level;

  /// Gets a type of the shape of the geometry.
  /// @nodoc
  @internal
  GeometryShapeType get internalshapeType;

  /// Gets a type of the geometry.
  VenueGeometryGeometryType get geometryType;

  /// Gets a center of the geometry.
  GeoCoordinates get center;

  /// Gets a bounding box of the geometry.
  GeoBox get boundingBox;

  /// Gets a list of geo shapes which represents the geometry.
  /// @nodoc
  @internal
  List<GeoShape> get internalshapes;

  /// Gets a label information for the geometry.
  /// @nodoc
  @internal
  LabelInfo get internallabelInfo;

  /// Gets the properties of the geometry.
  Map<String, Property> get properties;

  /// Gets an internal address of the geometry.
  VenueGeometryInternalAddress? get internalAddress;

  /// Gets the entities of the geometry.
  /// @nodoc
  @internal
  List<EntityInfo> get internalentities;

  /// Gets a name of the geometry. If no name has been set, returns a label name.
  String get name;
  /// Sets a name of the geometry.
  /// @nodoc
  @internal
  set internalname(String value);

  /// Gets a label name of the geometry.
  String get labelName;
  /// Sets a label name of the geometry.
  /// @nodoc
  @internal
  set internallabelName(String value);

  /// Gets a lookup type of the geometry.
  VenueGeometryLookupType get lookupType;
  /// Sets a lookup type of the geometry.
  /// @nodoc
  @internal
  set internallookupType(VenueGeometryLookupType value);

  /// Gets a parent geometry on which the current geometry is located,
  /// or `null` if the geometry represents a base shape.
  VenueGeometry get parentGeometry;
  /// Sets a parent geometry.
  /// @nodoc
  @internal
  set internalparentGeometry(VenueGeometry value);

  /// Gets a nesting depth of the geometry. Returns 0 for
  /// the geometries that represent the base shape.
  /// @nodoc
  @internal
  int get internalnestingDepth;
  /// Sets the nesting depth of geometry.
  /// @nodoc
  @internal
  set internalnestingDepth(int value);

  /// Gets a style name.
  /// @nodoc
  @internal
  String get internalstyleName;
  /// Sets a style name.
  /// @nodoc
  @internal
  set internalstyleName(String value);

  /// Gets a style of the geometry.
  VenueGeometryStyle? get style;
  /// Sets a style of the geometry.
  /// @nodoc
  @internal
  set internalstyle(VenueGeometryStyle? value);

  /// Gets a label style of the geometry.
  VenueLabelStyle? get labelStyle;
  /// Sets a label style of the geometry.
  /// @nodoc
  @internal
  set internallabelStyle(VenueLabelStyle? value);

  /// Gets level ID of the geometry.
  int get levelID;

}

/// Geometry types.
enum VenueGeometryGeometryType {
    /// A point.
    point,
    /// A line.
    linestring,
    /// An area
    polygon,
    /// A collection of points
    multipoint,
    /// A collection of areas.
    multipolygon
}

// VenueGeometryGeometryType "private" section, not exported.

int sdkVenueDataVenuegeometryGeometrytypeToFfi(VenueGeometryGeometryType value) {
  switch (value) {
  case VenueGeometryGeometryType.point:
    return 0;
  case VenueGeometryGeometryType.linestring:
    return 1;
  case VenueGeometryGeometryType.polygon:
    return 2;
  case VenueGeometryGeometryType.multipoint:
    return 3;
  case VenueGeometryGeometryType.multipolygon:
    return 4;
  default:
    throw StateError("Invalid enum value $value for VenueGeometryGeometryType enum.");
  }
}

VenueGeometryGeometryType sdkVenueDataVenuegeometryGeometrytypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return VenueGeometryGeometryType.point;
  case 1:
    return VenueGeometryGeometryType.linestring;
  case 2:
    return VenueGeometryGeometryType.polygon;
  case 3:
    return VenueGeometryGeometryType.multipoint;
  case 4:
    return VenueGeometryGeometryType.multipolygon;
  default:
    throw StateError("Invalid numeric value $handle for VenueGeometryGeometryType enum.");
  }
}

void sdkVenueDataVenuegeometryGeometrytypeReleaseFfiHandle(int handle) {}

final _sdkVenueDataVenuegeometryGeometrytypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_venue_data_VenueGeometry_GeometryType_create_handle_nullable'));
final _sdkVenueDataVenuegeometryGeometrytypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueGeometry_GeometryType_release_handle_nullable'));
final _sdkVenueDataVenuegeometryGeometrytypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueGeometry_GeometryType_get_value_nullable'));

Pointer<Void> sdkVenueDataVenuegeometryGeometrytypeToFfiNullable(VenueGeometryGeometryType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkVenueDataVenuegeometryGeometrytypeToFfi(value);
  final result = _sdkVenueDataVenuegeometryGeometrytypeCreateHandleNullable(_handle);
  sdkVenueDataVenuegeometryGeometrytypeReleaseFfiHandle(_handle);
  return result;
}

VenueGeometryGeometryType? sdkVenueDataVenuegeometryGeometrytypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkVenueDataVenuegeometryGeometrytypeGetValueNullable(handle);
  final result = sdkVenueDataVenuegeometryGeometrytypeFromFfi(_handle);
  sdkVenueDataVenuegeometryGeometrytypeReleaseFfiHandle(_handle);
  return result;
}

void sdkVenueDataVenuegeometryGeometrytypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataVenuegeometryGeometrytypeReleaseHandleNullable(handle);

// End of VenueGeometryGeometryType "private" section.
/// Defines how the geometry will be presented.
enum VenueGeometryLookupType {
    /// Only a shape of the geometry.
    none,
    /// A text on top of a shape of the geometry.
    text,
    /// An icon on top of a shape of the geometry.
    icon,
    /// An image on top of a shape of the geometry.
    image
}

// VenueGeometryLookupType "private" section, not exported.

int sdkVenueDataVenuegeometryLookuptypeToFfi(VenueGeometryLookupType value) {
  switch (value) {
  case VenueGeometryLookupType.none:
    return 0;
  case VenueGeometryLookupType.text:
    return 1;
  case VenueGeometryLookupType.icon:
    return 2;
  case VenueGeometryLookupType.image:
    return 3;
  default:
    throw StateError("Invalid enum value $value for VenueGeometryLookupType enum.");
  }
}

VenueGeometryLookupType sdkVenueDataVenuegeometryLookuptypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return VenueGeometryLookupType.none;
  case 1:
    return VenueGeometryLookupType.text;
  case 2:
    return VenueGeometryLookupType.icon;
  case 3:
    return VenueGeometryLookupType.image;
  default:
    throw StateError("Invalid numeric value $handle for VenueGeometryLookupType enum.");
  }
}

void sdkVenueDataVenuegeometryLookuptypeReleaseFfiHandle(int handle) {}

final _sdkVenueDataVenuegeometryLookuptypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_venue_data_VenueGeometry_LookupType_create_handle_nullable'));
final _sdkVenueDataVenuegeometryLookuptypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueGeometry_LookupType_release_handle_nullable'));
final _sdkVenueDataVenuegeometryLookuptypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueGeometry_LookupType_get_value_nullable'));

Pointer<Void> sdkVenueDataVenuegeometryLookuptypeToFfiNullable(VenueGeometryLookupType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkVenueDataVenuegeometryLookuptypeToFfi(value);
  final result = _sdkVenueDataVenuegeometryLookuptypeCreateHandleNullable(_handle);
  sdkVenueDataVenuegeometryLookuptypeReleaseFfiHandle(_handle);
  return result;
}

VenueGeometryLookupType? sdkVenueDataVenuegeometryLookuptypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkVenueDataVenuegeometryLookuptypeGetValueNullable(handle);
  final result = sdkVenueDataVenuegeometryLookuptypeFromFfi(_handle);
  sdkVenueDataVenuegeometryLookuptypeReleaseFfiHandle(_handle);
  return result;
}

void sdkVenueDataVenuegeometryLookuptypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataVenuegeometryLookuptypeReleaseHandleNullable(handle);

// End of VenueGeometryLookupType "private" section.
/// Represents an internal addresses of the geometry inside the venue.
///
/// The internal
/// address can be a number of a seat in a stadium, or a name of a classroom in a university.
/// One internal address can be shared between few geometries. For example, if a store in
/// a shopping mall is located on few floors, few different geometries will represent it.
/// But each of them will have the same internal address.
abstract class VenueGeometryInternalAddress {

  /// Gets a key of the address.
  String get key;

  /// Gets a value of the short address.
  String get shortAddress;

  /// Gets a parent address
  String get parentAddress;

  /// Gets an address as a complete string, which is
  /// a concatenation of the key and the short address.
  String get longAddress;

  /// Gets a full address as a complete string, which is
  /// a concatenation of the key, the short address and the parent address.
  String get fullAddress;

}


// VenueGeometryInternalAddress "private" section, not exported.

final _sdkVenueDataVenuegeometryInternaladdressRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_data_VenueGeometry_InternalAddress_register_finalizer'));
final _sdkVenueDataVenuegeometryInternaladdressCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueGeometry_InternalAddress_copy_handle'));
final _sdkVenueDataVenuegeometryInternaladdressReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueGeometry_InternalAddress_release_handle'));


class VenueGeometryInternalAddress$Impl extends __lib.NativeBase implements VenueGeometryInternalAddress {

  VenueGeometryInternalAddress$Impl(Pointer<Void> handle) : super(handle);

  @override
  String get key {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_InternalAddress_key_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get shortAddress {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_InternalAddress_shortAddress_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get parentAddress {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_InternalAddress_parentAddress_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get longAddress {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_InternalAddress_longAddress_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get fullAddress {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_InternalAddress_fullAddress_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueDataVenuegeometryInternaladdressToFfi(VenueGeometryInternalAddress value) =>
  _sdkVenueDataVenuegeometryInternaladdressCopyHandle((value as __lib.NativeBase).handle);

VenueGeometryInternalAddress sdkVenueDataVenuegeometryInternaladdressFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueGeometryInternalAddress) return instance;

  final _copiedHandle = _sdkVenueDataVenuegeometryInternaladdressCopyHandle(handle);
  final result = VenueGeometryInternalAddress$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueDataVenuegeometryInternaladdressRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueDataVenuegeometryInternaladdressReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueDataVenuegeometryInternaladdressReleaseHandle(handle);

Pointer<Void> sdkVenueDataVenuegeometryInternaladdressToFfiNullable(VenueGeometryInternalAddress? value) =>
  value != null ? sdkVenueDataVenuegeometryInternaladdressToFfi(value) : Pointer<Void>.fromAddress(0);

VenueGeometryInternalAddress? sdkVenueDataVenuegeometryInternaladdressFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueDataVenuegeometryInternaladdressFromFfi(handle) : null;

void sdkVenueDataVenuegeometryInternaladdressReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataVenuegeometryInternaladdressReleaseHandle(handle);

// End of VenueGeometryInternalAddress "private" section.

// VenueGeometry "private" section, not exported.

final _sdkVenueDataVenuegeometryRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_data_VenueGeometry_register_finalizer'));
final _sdkVenueDataVenuegeometryCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueGeometry_copy_handle'));
final _sdkVenueDataVenuegeometryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueGeometry_release_handle'));





class VenueGeometry$Impl extends __lib.NativeBase implements VenueGeometry {

  VenueGeometry$Impl(Pointer<Void> handle) : super(handle);

  @override
  void internaladdEntity(EntityInfo entity) {
    final _addEntityFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueGeometry_addEntity__EntityInfo'));
    final _entityHandle = sdkVenueDataEntityinfoToFfi(entity);
    final _handle = this.handle;
    _addEntityFfi(_handle, __lib.LibraryContext.isolateId, _entityHandle);
    sdkVenueDataEntityinfoReleaseFfiHandle(_entityHandle);

  }

  @override
  bool internalcontains(VenueGeometry geometry) {
    final _containsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueGeometry_contains__VenueGeometry'));
    final _geometryHandle = sdkVenueDataVenuegeometryToFfi(geometry);
    final _handle = this.handle;
    final __resultHandle = _containsFfi(_handle, __lib.LibraryContext.isolateId, _geometryHandle);
    sdkVenueDataVenuegeometryReleaseFfiHandle(_geometryHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void internalsetCustomStyle(VenueGeometryStyle? style, VenueLabelStyle? labelStyle) {
    final _setCustomStyleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueGeometry_setCustomStyle__VenueGeometryStyle__VenueLabelStyle_'));
    final _styleHandle = sdkVenueStyleVenuegeometrystyleToFfiNullable(style);
    final _labelStyleHandle = sdkVenueStyleVenuelabelstyleToFfiNullable(labelStyle);
    final _handle = this.handle;
    _setCustomStyleFfi(_handle, __lib.LibraryContext.isolateId, _styleHandle, _labelStyleHandle);
    sdkVenueStyleVenuegeometrystyleReleaseFfiHandleNullable(_styleHandle);
    sdkVenueStyleVenuelabelstyleReleaseFfiHandleNullable(_labelStyleHandle);

  }

  @override
  int get id {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_id_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  VenueLevel get level {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_level_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuelevelFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuelevelReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  GeometryShapeType get internalshapeType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_shapeType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataGeometryshapetypeFromFfi(__resultHandle);
    } finally {
      sdkVenueDataGeometryshapetypeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  VenueGeometryGeometryType get geometryType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_geometryType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuegeometryGeometrytypeFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuegeometryGeometrytypeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  GeoCoordinates get center {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_center_get'));
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
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_boundingBox_get'));
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
  List<GeoShape> get internalshapes {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_shapes_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofSdkVenueDataGeoshapeFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofSdkVenueDataGeoshapeReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  LabelInfo get internallabelInfo {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_labelInfo_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataLabelinfoFromFfi(__resultHandle);
    } finally {
      sdkVenueDataLabelinfoReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Map<String, Property> get properties {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_properties_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingsmapofStringToSdkVenueDataPropertyFromFfi(__resultHandle);
    } finally {
      venuecoreBindingsmapofStringToSdkVenueDataPropertyReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  VenueGeometryInternalAddress? get internalAddress {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_internalAddress_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuegeometryInternaladdressFromFfiNullable(__resultHandle);
    } finally {
      sdkVenueDataVenuegeometryInternaladdressReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @internal
  @override
  List<EntityInfo> get internalentities {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_entities_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofSdkVenueDataEntityinfoFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofSdkVenueDataEntityinfoReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get name {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_name_get'));
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
  set internalname(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueGeometry_name_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }


  @override
  String get labelName {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_labelName_get'));
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
  set internallabelName(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueGeometry_labelName_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }


  @override
  VenueGeometryLookupType get lookupType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_lookupType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuegeometryLookuptypeFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuegeometryLookuptypeReleaseFfiHandle(__resultHandle);

    }

  }

  @internal
  @override
  set internallookupType(VenueGeometryLookupType value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_data_VenueGeometry_lookupType_set__LookupType'));
    final _valueHandle = sdkVenueDataVenuegeometryLookuptypeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkVenueDataVenuegeometryLookuptypeReleaseFfiHandle(_valueHandle);

  }


  @override
  VenueGeometry get parentGeometry {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_parentGeometry_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuegeometryFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuegeometryReleaseFfiHandle(__resultHandle);

    }

  }

  @internal
  @override
  set internalparentGeometry(VenueGeometry value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueGeometry_parentGeometry_set__VenueGeometry'));
    final _valueHandle = sdkVenueDataVenuegeometryToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkVenueDataVenuegeometryReleaseFfiHandle(_valueHandle);

  }


  @internal
  @override
  int get internalnestingDepth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_nestingDepth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  @internal
  @override
  set internalnestingDepth(int value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_data_VenueGeometry_nestingDepth_set__Int'));
    final _valueHandle = (value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);


  }


  @internal
  @override
  String get internalstyleName {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_styleName_get'));
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
  set internalstyleName(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueGeometry_styleName_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }


  @override
  VenueGeometryStyle? get style {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_style_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueStyleVenuegeometrystyleFromFfiNullable(__resultHandle);
    } finally {
      sdkVenueStyleVenuegeometrystyleReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @internal
  @override
  set internalstyle(VenueGeometryStyle? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueGeometry_style_set__VenueGeometryStyle_'));
    final _valueHandle = sdkVenueStyleVenuegeometrystyleToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkVenueStyleVenuegeometrystyleReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  VenueLabelStyle? get labelStyle {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_labelStyle_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueStyleVenuelabelstyleFromFfiNullable(__resultHandle);
    } finally {
      sdkVenueStyleVenuelabelstyleReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @internal
  @override
  set internallabelStyle(VenueLabelStyle? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_VenueGeometry_labelStyle_set__VenueLabelStyle_'));
    final _valueHandle = sdkVenueStyleVenuelabelstyleToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkVenueStyleVenuelabelstyleReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  int get levelID {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_VenueGeometry_levelID_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }



}

Pointer<Void> sdkVenueDataVenuegeometryToFfi(VenueGeometry value) =>
  _sdkVenueDataVenuegeometryCopyHandle((value as __lib.NativeBase).handle);

VenueGeometry sdkVenueDataVenuegeometryFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueGeometry) return instance;

  final _copiedHandle = _sdkVenueDataVenuegeometryCopyHandle(handle);
  final result = VenueGeometry$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueDataVenuegeometryRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueDataVenuegeometryReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueDataVenuegeometryReleaseHandle(handle);

Pointer<Void> sdkVenueDataVenuegeometryToFfiNullable(VenueGeometry? value) =>
  value != null ? sdkVenueDataVenuegeometryToFfi(value) : Pointer<Void>.fromAddress(0);

VenueGeometry? sdkVenueDataVenuegeometryFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueDataVenuegeometryFromFfi(handle) : null;

void sdkVenueDataVenuegeometryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataVenuegeometryReleaseHandle(handle);

// End of VenueGeometry "private" section.


