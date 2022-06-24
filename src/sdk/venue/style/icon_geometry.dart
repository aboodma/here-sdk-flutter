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
import 'package:here_sdk/src/sdk/venue/data/venue_geometry.dart';
import 'package:here_sdk/src/sdk/venue/style/venue_geometry_style.dart';
import 'package:meta/meta.dart';

/// Specifies the icon geometries.
/// @nodoc
@internal
abstract class IconGeometry {

  /// Gets the icon geometry type.
  /// @nodoc
  @internal
  VenueGeometryGeometryType get internalgeometryType;

  /// Gets the icon geometry width.
  /// @nodoc
  @internal
  double get internalgeometryWidth;

  /// Gets the icon geometry style.
  /// @nodoc
  @internal
  VenueGeometryStyle get internalstyle;

}


// IconGeometry "private" section, not exported.

final _sdkVenueStyleIcongeometryRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_IconGeometry_register_finalizer'));
final _sdkVenueStyleIcongeometryCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_IconGeometry_copy_handle'));
final _sdkVenueStyleIcongeometryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_IconGeometry_release_handle'));


class IconGeometry$Impl extends __lib.NativeBase implements IconGeometry {

  IconGeometry$Impl(Pointer<Void> handle) : super(handle);

  @internal
  @override
  VenueGeometryGeometryType get internalgeometryType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_IconGeometry_geometryType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuegeometryGeometrytypeFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuegeometryGeometrytypeReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  double get internalgeometryWidth {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_IconGeometry_geometryWidth_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @internal
  @override
  VenueGeometryStyle get internalstyle {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_IconGeometry_style_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueStyleVenuegeometrystyleFromFfi(__resultHandle);
    } finally {
      sdkVenueStyleVenuegeometrystyleReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueStyleIcongeometryToFfi(IconGeometry value) =>
  _sdkVenueStyleIcongeometryCopyHandle((value as __lib.NativeBase).handle);

IconGeometry sdkVenueStyleIcongeometryFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is IconGeometry) return instance;

  final _copiedHandle = _sdkVenueStyleIcongeometryCopyHandle(handle);
  final result = IconGeometry$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleIcongeometryRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleIcongeometryReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleIcongeometryReleaseHandle(handle);

Pointer<Void> sdkVenueStyleIcongeometryToFfiNullable(IconGeometry? value) =>
  value != null ? sdkVenueStyleIcongeometryToFfi(value) : Pointer<Void>.fromAddress(0);

IconGeometry? sdkVenueStyleIcongeometryFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleIcongeometryFromFfi(handle) : null;

void sdkVenueStyleIcongeometryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleIcongeometryReleaseHandle(handle);

// End of IconGeometry "private" section.


