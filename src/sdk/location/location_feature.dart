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

/// Location features supported by HERE positioning.
enum LocationFeature {
    /// Cellular network positioning.
    cellularPositioning,
    /// WiFi network positioning without altitude.
    wifiPositioning2d,
    /// HD GNSS positioning.
    hdGnssPositioning,
    /// Not defined.
    undefined
}

// LocationFeature "private" section, not exported.

int sdkLocationLocationfeatureToFfi(LocationFeature value) {
  switch (value) {
  case LocationFeature.cellularPositioning:
    return 0;
  case LocationFeature.wifiPositioning2d:
    return 1;
  case LocationFeature.hdGnssPositioning:
    return 2;
  case LocationFeature.undefined:
    return 3;
  default:
    throw StateError("Invalid enum value $value for LocationFeature enum.");
  }
}

LocationFeature sdkLocationLocationfeatureFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LocationFeature.cellularPositioning;
  case 1:
    return LocationFeature.wifiPositioning2d;
  case 2:
    return LocationFeature.hdGnssPositioning;
  case 3:
    return LocationFeature.undefined;
  default:
    throw StateError("Invalid numeric value $handle for LocationFeature enum.");
  }
}

void sdkLocationLocationfeatureReleaseFfiHandle(int handle) {}

final _sdkLocationLocationfeatureCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_location_LocationFeature_create_handle_nullable'));
final _sdkLocationLocationfeatureReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFeature_release_handle_nullable'));
final _sdkLocationLocationfeatureGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationFeature_get_value_nullable'));

Pointer<Void> sdkLocationLocationfeatureToFfiNullable(LocationFeature? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkLocationLocationfeatureToFfi(value);
  final result = _sdkLocationLocationfeatureCreateHandleNullable(_handle);
  sdkLocationLocationfeatureReleaseFfiHandle(_handle);
  return result;
}

LocationFeature? sdkLocationLocationfeatureFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkLocationLocationfeatureGetValueNullable(handle);
  final result = sdkLocationLocationfeatureFromFfi(_handle);
  sdkLocationLocationfeatureReleaseFfiHandle(_handle);
  return result;
}

void sdkLocationLocationfeatureReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationLocationfeatureReleaseHandleNullable(handle);

// End of LocationFeature "private" section.


