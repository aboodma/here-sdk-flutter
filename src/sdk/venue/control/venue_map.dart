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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/venue/control/renderer.dart';
import 'package:here_sdk/src/sdk/venue/control/venue.dart';
import 'package:here_sdk/src/sdk/venue/control/venue_drawing_selection_listener.dart';
import 'package:here_sdk/src/sdk/venue/control/venue_level_selection_listener.dart';
import 'package:here_sdk/src/sdk/venue/control/venue_lifecycle_listener.dart';
import 'package:here_sdk/src/sdk/venue/control/venue_selection_listener.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_geometry.dart';
import 'package:here_sdk/src/sdk/venue/service/venue_service.dart';
import 'package:meta/meta.dart';

/// Connects a map with venues.
///
/// When the [VenueMap] is started,
/// venues can be seen on the map as interactive models. The user can switch drawings and levels,
/// change a visual style of geometries and related labels inside the venue etc.
/// After constructing the [VenueMap],
/// for relevant events should be added to the object, and it needs to be activated by starting
/// the [VenueService] using methods [VenueService.startAsync]
/// or [VenueService.start]. [VenueMap] is an add-on to
/// the base map functionality with its own content loading and cache. For this reason, in certain
/// situations there may be a small delay before the venue is visible.
abstract class VenueMap {
  /// Creates a new instance of this class.
  ///
  /// [service] The venue service.
  ///
  /// [renderer] The optional renderer.
  ///
  /// @nodoc
  factory VenueMap(VenueService service, Renderer? renderer) => $prototype.internalmake(service, renderer);

  /// Downloads and adds a [Venue] to the [VenueMap].
  ///
  /// Method will do nothing if the venue already exists on the venue map.
  ///
  /// [venueId] The ID of the venue to download and add.
  ///
  void addVenueAsync(int venueId);
  /// Removes a [Venue] from the [VenueMap].
  ///
  /// [venue] The venue to remove.
  ///
  void removeVenue(Venue venue);
  /// Downloads a [VenueModel] if needed and selects a [Venue].
  ///
  /// [venueId] The ID of the venue to download and select.
  ///
  void selectVenueAsync(int venueId);
  /// Attempts to cancel venue loading and selection
  /// that may currently be in progress.
  ///
  /// Returns [bool]. True if a venue was about to load and false otherwise.
  ///
  bool cancelVenueSelection();
  /// Tries to find a [Venue] at the specified geographic coordinates.
  ///
  /// [position] Geographic coordinates where a venue is located.
  ///
  /// Returns [Venue?]. Venue or `null` if there is no venue at the specified geographic coordinates.
  ///
  Venue? getVenue(GeoCoordinates position);
  /// Tries to find a [VenueGeometry] at the specified geographic coordinates
  /// in the selected [Venue] in the currently selected [VenueLevel].
  ///
  /// [position] Geographic coordinates where the geometry is located.
  ///
  /// Returns [VenueGeometry?]. Geometry or `null` if there is no geometry at the specified geographic coordinates.
  ///
  VenueGeometry? getGeometry(GeoCoordinates position);
  /// Adds a venue lifecycle .
  ///
  /// [listener] The  to add.
  ///
  void addVenueLifecycleListener(VenueLifecycleListener listener);
  /// Removes a venue lifecycle .
  ///
  /// [listener] The  to remove.
  ///
  void removeVenueLifecycleListener(VenueLifecycleListener listener);
  /// Adds a venue selection .
  ///
  /// [listener] The  to add.
  ///
  void addVenueSelectionListener(VenueSelectionListener listener);
  /// Removes a venue selection .
  ///
  /// [listener] The  to remove.
  ///
  void removeVenueSelectionListener(VenueSelectionListener listener);
  /// Adds a drawing selection .
  ///
  /// [listener] The  to add.
  ///
  void addDrawingSelectionListener(VenueDrawingSelectionListener listener);
  /// Removes a drawing selection .
  ///
  /// [listener] The  to remove.
  ///
  void removeDrawingSelectionListener(VenueDrawingSelectionListener listener);
  /// Adds a level selection .
  ///
  /// [listener] The  to add.
  ///
  void addLevelSelectionListener(VenueLevelSelectionListener listener);
  /// Removes a level selection .
  ///
  /// [listener] The  to remove.
  ///
  void removeLevelSelectionListener(VenueLevelSelectionListener listener);
  /// Gets the venue service. It can be used to search and get the [VenueModel] objects.
  VenueService get venueService;

  /// Gets the renderer.
  /// @nodoc
  @internal
  Renderer? get internalrenderer;
  /// @nodoc
  @internal
  set internalrenderer(Renderer? value);

  /// Gets the current venues on the [VenueMap], mapped by id.
  Map<int, Venue> get venues;

  /// Gets the currently selected [Venue].
  Venue? get selectedVenue;
  /// Sets the selected [Venue]. Use `null` to deselect the venue.
  set selectedVenue(Venue? value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = VenueMap$Impl(Pointer<Void>.fromAddress(0));
}


// VenueMap "private" section, not exported.

final _sdkVenueControlVenuemapRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_control_VenueMap_register_finalizer'));
final _sdkVenueControlVenuemapCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueMap_copy_handle'));
final _sdkVenueControlVenuemapReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_control_VenueMap_release_handle'));

















/// @nodoc
@visibleForTesting
class VenueMap$Impl extends __lib.NativeBase implements VenueMap {

  VenueMap$Impl(Pointer<Void> handle) : super(handle);


  VenueMap internalmake(VenueService service, Renderer? renderer) {
    final _result_handle = _make(service, renderer);
    final _result = VenueMap$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkVenueControlVenuemapRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make(VenueService service, Renderer? renderer) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueMap_make__VenueService_Renderer_'));
    final _serviceHandle = sdkVenueServiceVenueserviceToFfi(service);
    final _rendererHandle = sdkVenueControlRendererToFfiNullable(renderer);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _serviceHandle, _rendererHandle);
    sdkVenueServiceVenueserviceReleaseFfiHandle(_serviceHandle);
    sdkVenueControlRendererReleaseFfiHandleNullable(_rendererHandle);
    return __resultHandle;
  }

  @override
  void addVenueAsync(int venueId) {
    final _addVenueAsyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_control_VenueMap_addVenueAsync__Int'));
    final _venueIdHandle = (venueId);
    final _handle = this.handle;
    _addVenueAsyncFfi(_handle, __lib.LibraryContext.isolateId, _venueIdHandle);


  }

  @override
  void removeVenue(Venue venue) {
    final _removeVenueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueMap_removeVenue__Venue'));
    final _venueHandle = sdkVenueControlVenueToFfi(venue);
    final _handle = this.handle;
    _removeVenueFfi(_handle, __lib.LibraryContext.isolateId, _venueHandle);
    sdkVenueControlVenueReleaseFfiHandle(_venueHandle);

  }

  @override
  void selectVenueAsync(int venueId) {
    final _selectVenueAsyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_control_VenueMap_selectVenueAsync__Int'));
    final _venueIdHandle = (venueId);
    final _handle = this.handle;
    _selectVenueAsyncFfi(_handle, __lib.LibraryContext.isolateId, _venueIdHandle);


  }

  @override
  bool cancelVenueSelection() {
    final _cancelVenueSelectionFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_VenueMap_cancelVenueSelection'));
    final _handle = this.handle;
    final __resultHandle = _cancelVenueSelectionFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  Venue? getVenue(GeoCoordinates position) {
    final _getVenueFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueMap_getVenue__GeoCoordinates'));
    final _positionHandle = sdkCoreGeocoordinatesToFfi(position);
    final _handle = this.handle;
    final __resultHandle = _getVenueFfi(_handle, __lib.LibraryContext.isolateId, _positionHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_positionHandle);
    try {
      return sdkVenueControlVenueFromFfiNullable(__resultHandle);
    } finally {
      sdkVenueControlVenueReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  VenueGeometry? getGeometry(GeoCoordinates position) {
    final _getGeometryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueMap_getGeometry__GeoCoordinates'));
    final _positionHandle = sdkCoreGeocoordinatesToFfi(position);
    final _handle = this.handle;
    final __resultHandle = _getGeometryFfi(_handle, __lib.LibraryContext.isolateId, _positionHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_positionHandle);
    try {
      return sdkVenueDataVenuegeometryFromFfiNullable(__resultHandle);
    } finally {
      sdkVenueDataVenuegeometryReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  void addVenueLifecycleListener(VenueLifecycleListener listener) {
    final _addVenueLifecycleListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueMap_add__VenueLifecycleListener'));
    final _listenerHandle = sdkVenueControlVenuelifecyclelistenerToFfi(listener);
    final _handle = this.handle;
    _addVenueLifecycleListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueControlVenuelifecyclelistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void removeVenueLifecycleListener(VenueLifecycleListener listener) {
    final _removeVenueLifecycleListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueMap_remove__VenueLifecycleListener'));
    final _listenerHandle = sdkVenueControlVenuelifecyclelistenerToFfi(listener);
    final _handle = this.handle;
    _removeVenueLifecycleListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueControlVenuelifecyclelistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void addVenueSelectionListener(VenueSelectionListener listener) {
    final _addVenueSelectionListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueMap_add__VenueSelectionListener'));
    final _listenerHandle = sdkVenueControlVenueselectionlistenerToFfi(listener);
    final _handle = this.handle;
    _addVenueSelectionListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueControlVenueselectionlistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void removeVenueSelectionListener(VenueSelectionListener listener) {
    final _removeVenueSelectionListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueMap_remove__VenueSelectionListener'));
    final _listenerHandle = sdkVenueControlVenueselectionlistenerToFfi(listener);
    final _handle = this.handle;
    _removeVenueSelectionListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueControlVenueselectionlistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void addDrawingSelectionListener(VenueDrawingSelectionListener listener) {
    final _addDrawingSelectionListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueMap_add__VenueDrawingSelectionListener'));
    final _listenerHandle = sdkVenueControlVenuedrawingselectionlistenerToFfi(listener);
    final _handle = this.handle;
    _addDrawingSelectionListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueControlVenuedrawingselectionlistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void removeDrawingSelectionListener(VenueDrawingSelectionListener listener) {
    final _removeDrawingSelectionListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueMap_remove__VenueDrawingSelectionListener'));
    final _listenerHandle = sdkVenueControlVenuedrawingselectionlistenerToFfi(listener);
    final _handle = this.handle;
    _removeDrawingSelectionListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueControlVenuedrawingselectionlistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void addLevelSelectionListener(VenueLevelSelectionListener listener) {
    final _addLevelSelectionListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueMap_add__VenueLevelSelectionListener'));
    final _listenerHandle = sdkVenueControlVenuelevelselectionlistenerToFfi(listener);
    final _handle = this.handle;
    _addLevelSelectionListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueControlVenuelevelselectionlistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void removeLevelSelectionListener(VenueLevelSelectionListener listener) {
    final _removeLevelSelectionListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueMap_remove__VenueLevelSelectionListener'));
    final _listenerHandle = sdkVenueControlVenuelevelselectionlistenerToFfi(listener);
    final _handle = this.handle;
    _removeLevelSelectionListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueControlVenuelevelselectionlistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  VenueService get venueService {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_VenueMap_venueService_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueServiceVenueserviceFromFfi(__resultHandle);
    } finally {
      sdkVenueServiceVenueserviceReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  Renderer? get internalrenderer {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_VenueMap_renderer_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueControlRendererFromFfiNullable(__resultHandle);
    } finally {
      sdkVenueControlRendererReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @internal
  @override
  set internalrenderer(Renderer? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueMap_renderer_set__Renderer_'));
    final _valueHandle = sdkVenueControlRendererToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkVenueControlRendererReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  Map<int, Venue> get venues {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_VenueMap_venues_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingsmapofIntToSdkVenueControlVenueFromFfi(__resultHandle);
    } finally {
      venuecoreBindingsmapofIntToSdkVenueControlVenueReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  Venue? get selectedVenue {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_control_VenueMap_selectedVenue_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueControlVenueFromFfiNullable(__resultHandle);
    } finally {
      sdkVenueControlVenueReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set selectedVenue(Venue? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_control_VenueMap_selectedVenue_set__Venue_'));
    final _valueHandle = sdkVenueControlVenueToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkVenueControlVenueReleaseFfiHandleNullable(_valueHandle);

  }



}

Pointer<Void> sdkVenueControlVenuemapToFfi(VenueMap value) =>
  _sdkVenueControlVenuemapCopyHandle((value as __lib.NativeBase).handle);

VenueMap sdkVenueControlVenuemapFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueMap) return instance;

  final _copiedHandle = _sdkVenueControlVenuemapCopyHandle(handle);
  final result = VenueMap$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueControlVenuemapRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueControlVenuemapReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueControlVenuemapReleaseHandle(handle);

Pointer<Void> sdkVenueControlVenuemapToFfiNullable(VenueMap? value) =>
  value != null ? sdkVenueControlVenuemapToFfi(value) : Pointer<Void>.fromAddress(0);

VenueMap? sdkVenueControlVenuemapFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueControlVenuemapFromFfi(handle) : null;

void sdkVenueControlVenuemapReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueControlVenuemapReleaseHandle(handle);

// End of VenueMap "private" section.


