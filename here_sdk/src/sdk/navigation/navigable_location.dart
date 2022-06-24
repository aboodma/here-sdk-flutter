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
import 'package:here_sdk/src/sdk/core/location.dart';
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;
import 'package:here_sdk/src/sdk/navigation/map_matched_location.dart';

/// Contains all the relevant information on the current location.

class NavigableLocation {
  /// The original location that was passed in via [LocationListener].
  location_impl.Location originalLocation;

  /// The map-matched location on a road. It is calculated from the passed in [NavigableLocation.originalLocation].
  MapMatchedLocation? mapMatchedLocation;

  NavigableLocation(this.originalLocation, this.mapMatchedLocation);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NavigableLocation) return false;
    NavigableLocation _other = other;
    return originalLocation == _other.originalLocation &&
        mapMatchedLocation == _other.mapMatchedLocation;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + originalLocation.hashCode;
    result = 31 * result + mapMatchedLocation.hashCode;
    return result;
  }
}


// NavigableLocation "private" section, not exported.

final _sdkNavigationNavigablelocationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigableLocation_create_handle'));
final _sdkNavigationNavigablelocationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigableLocation_release_handle'));
final _sdkNavigationNavigablelocationGetFieldoriginalLocation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigableLocation_get_field_originalLocation'));
final _sdkNavigationNavigablelocationGetFieldmapMatchedLocation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigableLocation_get_field_mapMatchedLocation'));



Pointer<Void> sdkNavigationNavigablelocationToFfi(NavigableLocation value) {
  final _originalLocationHandle = sdkCoreLocationToFfi(value.originalLocation);
  final _mapMatchedLocationHandle = sdkNavigationMapmatchedlocationToFfiNullable(value.mapMatchedLocation);
  final _result = _sdkNavigationNavigablelocationCreateHandle(_originalLocationHandle, _mapMatchedLocationHandle);
  sdkCoreLocationReleaseFfiHandle(_originalLocationHandle);
  sdkNavigationMapmatchedlocationReleaseFfiHandleNullable(_mapMatchedLocationHandle);
  return _result;
}

NavigableLocation sdkNavigationNavigablelocationFromFfi(Pointer<Void> handle) {
  final _originalLocationHandle = _sdkNavigationNavigablelocationGetFieldoriginalLocation(handle);
  final _mapMatchedLocationHandle = _sdkNavigationNavigablelocationGetFieldmapMatchedLocation(handle);
  try {
    return NavigableLocation(
      sdkCoreLocationFromFfi(_originalLocationHandle), 
      sdkNavigationMapmatchedlocationFromFfiNullable(_mapMatchedLocationHandle)
    );
  } finally {
    sdkCoreLocationReleaseFfiHandle(_originalLocationHandle);
    sdkNavigationMapmatchedlocationReleaseFfiHandleNullable(_mapMatchedLocationHandle);
  }
}

void sdkNavigationNavigablelocationReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationNavigablelocationReleaseHandle(handle);

// Nullable NavigableLocation

final _sdkNavigationNavigablelocationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigableLocation_create_handle_nullable'));
final _sdkNavigationNavigablelocationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigableLocation_release_handle_nullable'));
final _sdkNavigationNavigablelocationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigableLocation_get_value_nullable'));

Pointer<Void> sdkNavigationNavigablelocationToFfiNullable(NavigableLocation? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationNavigablelocationToFfi(value);
  final result = _sdkNavigationNavigablelocationCreateHandleNullable(_handle);
  sdkNavigationNavigablelocationReleaseFfiHandle(_handle);
  return result;
}

NavigableLocation? sdkNavigationNavigablelocationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationNavigablelocationGetValueNullable(handle);
  final result = sdkNavigationNavigablelocationFromFfi(_handle);
  sdkNavigationNavigablelocationReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationNavigablelocationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationNavigablelocationReleaseHandleNullable(handle);

// End of NavigableLocation "private" section.


