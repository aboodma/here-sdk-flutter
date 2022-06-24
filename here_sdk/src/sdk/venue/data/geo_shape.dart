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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:meta/meta.dart';

/// Specifies a geo shape which can represent a polygon, polyline or point.
/// @nodoc
@internal
abstract class GeoShape {

  /// Gets the list of geographic coordinates which represents the path of the shape.
  /// @nodoc
  @internal
  List<GeoCoordinates> get internalpath;

  /// Gets the list of indices that represents seams of the polygon.
  /// @nodoc
  @internal
  List<int> get internalseamIndices;

  /// @nodoc
  @internal
  List<int> get internaltriangleIndices;

}


// GeoShape "private" section, not exported.

final _sdkVenueDataGeoshapeRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_data_GeoShape_register_finalizer'));
final _sdkVenueDataGeoshapeCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_GeoShape_copy_handle'));
final _sdkVenueDataGeoshapeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_GeoShape_release_handle'));


class GeoShape$Impl extends __lib.NativeBase implements GeoShape {

  GeoShape$Impl(Pointer<Void> handle) : super(handle);

  @internal
  @override
  List<GeoCoordinates> get internalpath {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_GeoShape_path_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofSdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofSdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  List<int> get internalseamIndices {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_GeoShape_seamIndices_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofIntFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofIntReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  List<int> get internaltriangleIndices {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_GeoShape_triangleIndices_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofIntFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofIntReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueDataGeoshapeToFfi(GeoShape value) =>
  _sdkVenueDataGeoshapeCopyHandle((value as __lib.NativeBase).handle);

GeoShape sdkVenueDataGeoshapeFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is GeoShape) return instance;

  final _copiedHandle = _sdkVenueDataGeoshapeCopyHandle(handle);
  final result = GeoShape$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueDataGeoshapeRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueDataGeoshapeReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueDataGeoshapeReleaseHandle(handle);

Pointer<Void> sdkVenueDataGeoshapeToFfiNullable(GeoShape? value) =>
  value != null ? sdkVenueDataGeoshapeToFfi(value) : Pointer<Void>.fromAddress(0);

GeoShape? sdkVenueDataGeoshapeFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueDataGeoshapeFromFfi(handle) : null;

void sdkVenueDataGeoshapeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataGeoshapeReleaseHandle(handle);

// End of GeoShape "private" section.


