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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/venue/control/venue.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_geometry.dart';
import 'package:meta/meta.dart';

/// Specifies the  for renderers.
///
/// Venue map
/// uses this  to render venues on the map.
/// @nodoc
@internal
abstract class Renderer {
  /// Specifies the  for renderers.
  ///
  /// Venue map
  /// uses this  to render venues on the map.
  /// @nodoc

  factory Renderer(
    bool Function(VenueGeometry) centerLambda,
    void Function(Venue) addVenueLambda,
    void Function(Venue) removeVenueLambda,
    void Function(Venue) selectVenueLambda,
    void Function() updateLambda,
    void Function(Venue, List<VenueGeometry>) updateGeometriesLambda,
    double Function() zoomLevelGetLambda,
    GeoBox Function() viewRectangleGetLambda
  ) => Renderer$Lambdas(
    centerLambda,
    addVenueLambda,
    removeVenueLambda,
    selectVenueLambda,
    updateLambda,
    updateGeometriesLambda,
    zoomLevelGetLambda,
    viewRectangleGetLambda
  );

  /// Centers the camera on a given geometry.
  ///
  /// [geometry] The geometry to center on.
  ///
  /// Returns [bool]. True on success and false otherwise.
  ///
  /// @nodoc
  bool internalcenter(VenueGeometry geometry);
  /// Adds a venue to the map.
  ///
  /// [venue] The venue to add.
  ///
  /// @nodoc
  void internaladdVenue(Venue venue);
  /// Removes a venue from the map.
  ///
  /// [venue] The venue to remove.
  ///
  /// @nodoc
  void internalremoveVenue(Venue venue);
  /// Selects a venue on the map.
  ///
  /// A previously selected venue will be deselected.
  ///
  /// [venue] The venue to select.
  ///
  /// @nodoc
  void internalselectVenue(Venue venue);
  /// Method should be called when the renderer is required to be updated.
  ///
  /// @nodoc
  void internalupdate();
  /// Method should be called when specific geometries require a visual update.
  ///
  /// [venue] The venue where geometries are located.
  ///
  /// [geometries] The geometries that require a visual update.
  ///
  /// @nodoc
  void internalupdateGeometries(Venue venue, List<VenueGeometry> geometries);
  /// Gets the zoom level of the map.
  /// @nodoc
  @internal
  double get internalzoomLevel;

  /// Gets the current view rectangle of the map.
  /// @nodoc
  @internal
  GeoBox get internalviewRectangle;

}


// Renderer "private" section, not exported.

final _sdkVenueControlRendererRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_control_Renderer_register_finalizer'));
final _sdkVenueControlRendererCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_Renderer_copy_handle'));
final _sdkVenueControlRendererReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_Renderer_release_handle'));
final _sdkVenueControlRendererCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_venue_control_Renderer_create_proxy'));
final _sdkVenueControlRendererGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_Renderer_get_type_id'));







class Renderer$Lambdas implements Renderer {
  bool Function(VenueGeometry) centerLambda;
  void Function(Venue) addVenueLambda;
  void Function(Venue) removeVenueLambda;
  void Function(Venue) selectVenueLambda;
  void Function() updateLambda;
  void Function(Venue, List<VenueGeometry>) updateGeometriesLambda;
  double Function() zoomLevelGetLambda;
  GeoBox Function() viewRectangleGetLambda;

  Renderer$Lambdas(
    this.centerLambda,
    this.addVenueLambda,
    this.removeVenueLambda,
    this.selectVenueLambda,
    this.updateLambda,
    this.updateGeometriesLambda,
    this.zoomLevelGetLambda,
    this.viewRectangleGetLambda
  );

  @override
  bool internalcenter(VenueGeometry geometry) =>
    centerLambda(geometry);
  @override
  void internaladdVenue(Venue venue) =>
    addVenueLambda(venue);
  @override
  void internalremoveVenue(Venue venue) =>
    removeVenueLambda(venue);
  @override
  void internalselectVenue(Venue venue) =>
    selectVenueLambda(venue);
  @override
  void internalupdate() =>
    updateLambda();
  @override
  void internalupdateGeometries(Venue venue, List<VenueGeometry> geometries) =>
    updateGeometriesLambda(venue, geometries);
  @override
  double get internalzoomLevel => zoomLevelGetLambda();
  @override
  GeoBox get internalviewRectangle => viewRectangleGetLambda();
}

class Renderer$Impl extends __lib.NativeBase implements Renderer {

  Renderer$Impl(Pointer<Void> handle) : super(handle);

  @override
  bool internalcenter(VenueGeometry geometry) {
    final _centerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_Renderer_center__VenueGeometry'));
    final _geometryHandle = sdkVenueDataVenuegeometryToFfi(geometry);
    final _handle = this.handle;
    final __resultHandle = _centerFfi(_handle, __lib.LibraryContext.isolateId, _geometryHandle);
    sdkVenueDataVenuegeometryReleaseFfiHandle(_geometryHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void internaladdVenue(Venue venue) {
    final _addVenueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_Renderer_addVenue__Venue'));
    final _venueHandle = sdkVenueControlVenueToFfi(venue);
    final _handle = this.handle;
    _addVenueFfi(_handle, __lib.LibraryContext.isolateId, _venueHandle);
    sdkVenueControlVenueReleaseFfiHandle(_venueHandle);

  }

  @override
  void internalremoveVenue(Venue venue) {
    final _removeVenueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_Renderer_removeVenue__Venue'));
    final _venueHandle = sdkVenueControlVenueToFfi(venue);
    final _handle = this.handle;
    _removeVenueFfi(_handle, __lib.LibraryContext.isolateId, _venueHandle);
    sdkVenueControlVenueReleaseFfiHandle(_venueHandle);

  }

  @override
  void internalselectVenue(Venue venue) {
    final _selectVenueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_Renderer_selectVenue__Venue'));
    final _venueHandle = sdkVenueControlVenueToFfi(venue);
    final _handle = this.handle;
    _selectVenueFfi(_handle, __lib.LibraryContext.isolateId, _venueHandle);
    sdkVenueControlVenueReleaseFfiHandle(_venueHandle);

  }

  @override
  void internalupdate() {
    final _updateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_Renderer_update'));
    final _handle = this.handle;
    _updateFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void internalupdateGeometries(Venue venue, List<VenueGeometry> geometries) {
    final _updateGeometriesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_venue_control_Renderer_updateGeometries__Venue_ListOf_sdk_venue_data_VenueGeometry'));
    final _venueHandle = sdkVenueControlVenueToFfi(venue);
    final _geometriesHandle = venuecoreBindingslistofSdkVenueDataVenuegeometryToFfi(geometries);
    final _handle = this.handle;
    _updateGeometriesFfi(_handle, __lib.LibraryContext.isolateId, _venueHandle, _geometriesHandle);
    sdkVenueControlVenueReleaseFfiHandle(_venueHandle);
    venuecoreBindingslistofSdkVenueDataVenuegeometryReleaseFfiHandle(_geometriesHandle);

  }

  /// Gets the zoom level of the map.
  /// @nodoc
  @internal
  double get internalzoomLevel {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_Renderer_zoomLevel_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  /// Gets the current view rectangle of the map.
  /// @nodoc
  @internal
  GeoBox get internalviewRectangle {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_Renderer_viewRectangle_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeoboxFromFfi(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandle(__resultHandle);

    }

  }



}

int _sdkVenueControlRenderercenterStatic(Object _obj, Pointer<Void> geometry, Pointer<Uint8> _result) {
  bool? _resultObject;
  try {
    _resultObject = (_obj as Renderer).internalcenter(sdkVenueDataVenuegeometryFromFfi(geometry));
    _result.value = booleanToFfi(_resultObject);
  } finally {
    sdkVenueDataVenuegeometryReleaseFfiHandle(geometry);
  }
  return 0;
}
int _sdkVenueControlRendereraddVenueStatic(Object _obj, Pointer<Void> venue) {

  try {
    (_obj as Renderer).internaladdVenue(sdkVenueControlVenueFromFfi(venue));
  } finally {
    sdkVenueControlVenueReleaseFfiHandle(venue);
  }
  return 0;
}
int _sdkVenueControlRendererremoveVenueStatic(Object _obj, Pointer<Void> venue) {

  try {
    (_obj as Renderer).internalremoveVenue(sdkVenueControlVenueFromFfi(venue));
  } finally {
    sdkVenueControlVenueReleaseFfiHandle(venue);
  }
  return 0;
}
int _sdkVenueControlRendererselectVenueStatic(Object _obj, Pointer<Void> venue) {

  try {
    (_obj as Renderer).internalselectVenue(sdkVenueControlVenueFromFfi(venue));
  } finally {
    sdkVenueControlVenueReleaseFfiHandle(venue);
  }
  return 0;
}
int _sdkVenueControlRendererupdateStatic(Object _obj) {

  try {
    (_obj as Renderer).internalupdate();
  } finally {
  }
  return 0;
}
int _sdkVenueControlRendererupdateGeometriesStatic(Object _obj, Pointer<Void> venue, Pointer<Void> geometries) {

  try {
    (_obj as Renderer).internalupdateGeometries(sdkVenueControlVenueFromFfi(venue), venuecoreBindingslistofSdkVenueDataVenuegeometryFromFfi(geometries));
  } finally {
    sdkVenueControlVenueReleaseFfiHandle(venue);
    venuecoreBindingslistofSdkVenueDataVenuegeometryReleaseFfiHandle(geometries);
  }
  return 0;
}

int _sdkVenueControlRendererzoomLevelGetStatic(Object _obj, Pointer<Float> _result) {
  _result.value = ((_obj as Renderer).internalzoomLevel);
  return 0;
}
int _sdkVenueControlRendererviewRectangleGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkCoreGeoboxToFfi((_obj as Renderer).internalviewRectangle);
  return 0;
}

Pointer<Void> sdkVenueControlRendererToFfi(Renderer value) {
  if (value is __lib.NativeBase) return _sdkVenueControlRendererCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkVenueControlRendererCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Uint8>)>(_sdkVenueControlRenderercenterStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkVenueControlRendereraddVenueStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkVenueControlRendererremoveVenueStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkVenueControlRendererselectVenueStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkVenueControlRendererupdateStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>, Pointer<Void>)>(_sdkVenueControlRendererupdateGeometriesStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Float>)>(_sdkVenueControlRendererzoomLevelGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkVenueControlRendererviewRectangleGetStatic, __lib.unknownError)
  );

  return result;
}

Renderer sdkVenueControlRendererFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Renderer) return instance;

  final _typeIdHandle = _sdkVenueControlRendererGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkVenueControlRendererCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : Renderer$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueControlRendererRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueControlRendererReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueControlRendererReleaseHandle(handle);

Pointer<Void> sdkVenueControlRendererToFfiNullable(Renderer? value) =>
  value != null ? sdkVenueControlRendererToFfi(value) : Pointer<Void>.fromAddress(0);

Renderer? sdkVenueControlRendererFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueControlRendererFromFfi(handle) : null;

void sdkVenueControlRendererReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueControlRendererReleaseHandle(handle);

// End of Renderer "private" section.


