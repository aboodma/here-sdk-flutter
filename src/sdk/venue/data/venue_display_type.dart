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

/// The type of venue display.
/// @nodoc
@internal
enum VenueDisplayType {
    /// standard
    standard,
    /// flattened
    flatten
}

// VenueDisplayType "private" section, not exported.

int sdkVenueDataVenuedisplaytypeToFfi(VenueDisplayType value) {
  switch (value) {
  case VenueDisplayType.standard:
    return 0;
  case VenueDisplayType.flatten:
    return 1;
  default:
    throw StateError("Invalid enum value $value for VenueDisplayType enum.");
  }
}

VenueDisplayType sdkVenueDataVenuedisplaytypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return VenueDisplayType.standard;
  case 1:
    return VenueDisplayType.flatten;
  default:
    throw StateError("Invalid numeric value $handle for VenueDisplayType enum.");
  }
}

void sdkVenueDataVenuedisplaytypeReleaseFfiHandle(int handle) {}

final _sdkVenueDataVenuedisplaytypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_venue_data_VenueDisplayType_create_handle_nullable'));
final _sdkVenueDataVenuedisplaytypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueDisplayType_release_handle_nullable'));
final _sdkVenueDataVenuedisplaytypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_VenueDisplayType_get_value_nullable'));

Pointer<Void> sdkVenueDataVenuedisplaytypeToFfiNullable(VenueDisplayType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkVenueDataVenuedisplaytypeToFfi(value);
  final result = _sdkVenueDataVenuedisplaytypeCreateHandleNullable(_handle);
  sdkVenueDataVenuedisplaytypeReleaseFfiHandle(_handle);
  return result;
}

VenueDisplayType? sdkVenueDataVenuedisplaytypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkVenueDataVenuedisplaytypeGetValueNullable(handle);
  final result = sdkVenueDataVenuedisplaytypeFromFfi(_handle);
  sdkVenueDataVenuedisplaytypeReleaseFfiHandle(_handle);
  return result;
}

void sdkVenueDataVenuedisplaytypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataVenuedisplaytypeReleaseHandleNullable(handle);

// End of VenueDisplayType "private" section.


