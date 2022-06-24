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

/// Filter types for the [VenueGeometry] search.
enum VenueGeometryFilterType {
    /// Filter by a name.
    name,
    /// Filter by an address.
    address,
    /// Filter by a name or an address.
    nameOrAddress,
    /// Filter by an icon name.
    iconName
}

// VenueGeometryFilterType "private" section, not exported.

int sdkVenueDataVenuegeometryfiltertypeToFfi(VenueGeometryFilterType value) {
  switch (value) {
  case VenueGeometryFilterType.name:
    return 0;
  case VenueGeometryFilterType.address:
    return 1;
  case VenueGeometryFilterType.nameOrAddress:
    return 2;
  case VenueGeometryFilterType.iconName:
    return 3;
  default:
    throw StateError("Invalid enum value $value for VenueGeometryFilterType enum.");
  }
}

VenueGeometryFilterType sdkVenueDataVenuegeometryfiltertypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return VenueGeometryFilterType.name;
  case 1:
    return VenueGeometryFilterType.address;
  case 2:
    return VenueGeometryFilterType.nameOrAddress;
  case 3:
    return VenueGeometryFilterType.iconName;
  default:
    throw StateError("Invalid numeric value $handle for VenueGeometryFilterType enum.");
  }
}

void sdkVenueDataVenuegeometryfiltertypeReleaseFfiHandle(int handle) {}

final _sdkVenueDataVenuegeometryfiltertypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_venue_data_VenueGeometryFilterType_create_handle_nullable'));
final _sdkVenueDataVenuegeometryfiltertypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueGeometryFilterType_release_handle_nullable'));
final _sdkVenueDataVenuegeometryfiltertypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueGeometryFilterType_get_value_nullable'));

Pointer<Void> sdkVenueDataVenuegeometryfiltertypeToFfiNullable(VenueGeometryFilterType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkVenueDataVenuegeometryfiltertypeToFfi(value);
  final result = _sdkVenueDataVenuegeometryfiltertypeCreateHandleNullable(_handle);
  sdkVenueDataVenuegeometryfiltertypeReleaseFfiHandle(_handle);
  return result;
}

VenueGeometryFilterType? sdkVenueDataVenuegeometryfiltertypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkVenueDataVenuegeometryfiltertypeGetValueNullable(handle);
  final result = sdkVenueDataVenuegeometryfiltertypeFromFfi(_handle);
  sdkVenueDataVenuegeometryfiltertypeReleaseFfiHandle(_handle);
  return result;
}

void sdkVenueDataVenuegeometryfiltertypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataVenuegeometryfiltertypeReleaseHandleNullable(handle);

// End of VenueGeometryFilterType "private" section.


