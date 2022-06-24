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

/// Represents the availability of one or more map updates.
enum MapUpdateAvailability {
    /// One ore more previously downloaded regions can be updated to their latest version.
    available,
    /// All previously downloaded regions are up-to-date or no regions have been downloaded yet.
    notAvailable
}

// MapUpdateAvailability "private" section, not exported.

int sdkMaploaderMapupdateavailabilityToFfi(MapUpdateAvailability value) {
  switch (value) {
  case MapUpdateAvailability.available:
    return 1;
  case MapUpdateAvailability.notAvailable:
    return 2;
  default:
    throw StateError("Invalid enum value $value for MapUpdateAvailability enum.");
  }
}

MapUpdateAvailability sdkMaploaderMapupdateavailabilityFromFfi(int handle) {
  switch (handle) {
  case 1:
    return MapUpdateAvailability.available;
  case 2:
    return MapUpdateAvailability.notAvailable;
  default:
    throw StateError("Invalid numeric value $handle for MapUpdateAvailability enum.");
  }
}

void sdkMaploaderMapupdateavailabilityReleaseFfiHandle(int handle) {}

final _sdkMaploaderMapupdateavailabilityCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_maploader_MapUpdateAvailability_create_handle_nullable'));
final _sdkMaploaderMapupdateavailabilityReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdateAvailability_release_handle_nullable'));
final _sdkMaploaderMapupdateavailabilityGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapUpdateAvailability_get_value_nullable'));

Pointer<Void> sdkMaploaderMapupdateavailabilityToFfiNullable(MapUpdateAvailability? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMaploaderMapupdateavailabilityToFfi(value);
  final result = _sdkMaploaderMapupdateavailabilityCreateHandleNullable(_handle);
  sdkMaploaderMapupdateavailabilityReleaseFfiHandle(_handle);
  return result;
}

MapUpdateAvailability? sdkMaploaderMapupdateavailabilityFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMaploaderMapupdateavailabilityGetValueNullable(handle);
  final result = sdkMaploaderMapupdateavailabilityFromFfi(_handle);
  sdkMaploaderMapupdateavailabilityReleaseFfiHandle(_handle);
  return result;
}

void sdkMaploaderMapupdateavailabilityReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderMapupdateavailabilityReleaseHandleNullable(handle);

// End of MapUpdateAvailability "private" section.


