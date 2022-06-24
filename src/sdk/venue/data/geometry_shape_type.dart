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
import 'package:meta/meta.dart';

/// The type of geometry shapes.
/// @nodoc
@internal
enum GeometryShapeType {
    /// A point.
    point,
    /// A path.
    path,
    /// A rotated rectangle.
    rotrect
}

// GeometryShapeType "private" section, not exported.

int sdkVenueDataGeometryshapetypeToFfi(GeometryShapeType value) {
  switch (value) {
  case GeometryShapeType.point:
    return 0;
  case GeometryShapeType.path:
    return 1;
  case GeometryShapeType.rotrect:
    return 2;
  default:
    throw StateError("Invalid enum value $value for GeometryShapeType enum.");
  }
}

GeometryShapeType sdkVenueDataGeometryshapetypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return GeometryShapeType.point;
  case 1:
    return GeometryShapeType.path;
  case 2:
    return GeometryShapeType.rotrect;
  default:
    throw StateError("Invalid numeric value $handle for GeometryShapeType enum.");
  }
}

void sdkVenueDataGeometryshapetypeReleaseFfiHandle(int handle) {}

final _sdkVenueDataGeometryshapetypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_venue_data_GeometryShapeType_create_handle_nullable'));
final _sdkVenueDataGeometryshapetypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_GeometryShapeType_release_handle_nullable'));
final _sdkVenueDataGeometryshapetypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_GeometryShapeType_get_value_nullable'));

Pointer<Void> sdkVenueDataGeometryshapetypeToFfiNullable(GeometryShapeType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkVenueDataGeometryshapetypeToFfi(value);
  final result = _sdkVenueDataGeometryshapetypeCreateHandleNullable(_handle);
  sdkVenueDataGeometryshapetypeReleaseFfiHandle(_handle);
  return result;
}

GeometryShapeType? sdkVenueDataGeometryshapetypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkVenueDataGeometryshapetypeGetValueNullable(handle);
  final result = sdkVenueDataGeometryshapetypeFromFfi(_handle);
  sdkVenueDataGeometryshapetypeReleaseFfiHandle(_handle);
  return result;
}

void sdkVenueDataGeometryshapetypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataGeometryshapetypeReleaseHandleNullable(handle);

// End of GeometryShapeType "private" section.


