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
import 'package:here_sdk/src/builtin_types__conversion.dart';

/// GNSS positioning options.

class SatellitePositioningOptions {
  /// Controls GNSS positioning. If false, GNSS positioning is disabled.
  bool enabled;

  /// Controls HD GNSS positioning. If false, HD GNSS positioning is disabled.
  /// VDR (Vehicle Dead Reckoning) is used if HD GNSS is enabled and sensors are used for positioning.
  /// This feature requires Android 12 or later and dual frequency GNSS receiver and raw GNSS measurements.
  /// This feature is disabled by default: [Contact us](https://www.here.com/platform/positioning) to enable it.
  /// If it is not enabled or the OS/device requirements are not met, fallback to other positioning technologies may occur and desired accuracy level may not be reached.
  /// Defaults to false.
  bool hdEnabled;

  SatellitePositioningOptions._(this.enabled, this.hdEnabled);
  SatellitePositioningOptions.withDefaults()
      : enabled = true, hdEnabled = false;
  @Deprecated("Will be removed in v4.13.0. Please use SatellitePositioningOptions.withDefaults() instead.")
  SatellitePositioningOptions(this.enabled)
      : hdEnabled = false;
}


// SatellitePositioningOptions "private" section, not exported.

final _sdkLocationSatellitepositioningoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8),
    Pointer<Void> Function(int, int)
  >('here_sdk_sdk_location_SatellitePositioningOptions_create_handle'));
final _sdkLocationSatellitepositioningoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_SatellitePositioningOptions_release_handle'));
final _sdkLocationSatellitepositioningoptionsGetFieldenabled = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_location_SatellitePositioningOptions_get_field_enabled'));
final _sdkLocationSatellitepositioningoptionsGetFieldhdEnabled = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_location_SatellitePositioningOptions_get_field_hdEnabled'));



Pointer<Void> sdkLocationSatellitepositioningoptionsToFfi(SatellitePositioningOptions value) {
  final _enabledHandle = booleanToFfi(value.enabled);
  final _hdEnabledHandle = booleanToFfi(value.hdEnabled);
  final _result = _sdkLocationSatellitepositioningoptionsCreateHandle(_enabledHandle, _hdEnabledHandle);
  booleanReleaseFfiHandle(_enabledHandle);
  booleanReleaseFfiHandle(_hdEnabledHandle);
  return _result;
}

SatellitePositioningOptions sdkLocationSatellitepositioningoptionsFromFfi(Pointer<Void> handle) {
  final _enabledHandle = _sdkLocationSatellitepositioningoptionsGetFieldenabled(handle);
  final _hdEnabledHandle = _sdkLocationSatellitepositioningoptionsGetFieldhdEnabled(handle);
  try {
    return SatellitePositioningOptions._(
      booleanFromFfi(_enabledHandle), 
      booleanFromFfi(_hdEnabledHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_enabledHandle);
    booleanReleaseFfiHandle(_hdEnabledHandle);
  }
}

void sdkLocationSatellitepositioningoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkLocationSatellitepositioningoptionsReleaseHandle(handle);

// Nullable SatellitePositioningOptions

final _sdkLocationSatellitepositioningoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_SatellitePositioningOptions_create_handle_nullable'));
final _sdkLocationSatellitepositioningoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_SatellitePositioningOptions_release_handle_nullable'));
final _sdkLocationSatellitepositioningoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_SatellitePositioningOptions_get_value_nullable'));

Pointer<Void> sdkLocationSatellitepositioningoptionsToFfiNullable(SatellitePositioningOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkLocationSatellitepositioningoptionsToFfi(value);
  final result = _sdkLocationSatellitepositioningoptionsCreateHandleNullable(_handle);
  sdkLocationSatellitepositioningoptionsReleaseFfiHandle(_handle);
  return result;
}

SatellitePositioningOptions? sdkLocationSatellitepositioningoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkLocationSatellitepositioningoptionsGetValueNullable(handle);
  final result = sdkLocationSatellitepositioningoptionsFromFfi(_handle);
  sdkLocationSatellitepositioningoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkLocationSatellitepositioningoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationSatellitepositioningoptionsReleaseHandleNullable(handle);

// End of SatellitePositioningOptions "private" section.


