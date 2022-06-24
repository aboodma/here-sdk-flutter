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

/// Options for controlling sensor usage in positioning.

class SensorOptions {
  /// Controls sensor usage in positioning. If false, sensors are not used for
  /// positioning.
  bool enabled;

  SensorOptions.withDefaults()
      : enabled = true;
  @Deprecated("Will be removed in v4.13.0. Please use `withDefaults()` constructor instead.")
  SensorOptions(this.enabled);
}


// SensorOptions "private" section, not exported.

final _sdkLocationSensoroptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_location_SensorOptions_create_handle'));
final _sdkLocationSensoroptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_SensorOptions_release_handle'));
final _sdkLocationSensoroptionsGetFieldenabled = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_location_SensorOptions_get_field_enabled'));



Pointer<Void> sdkLocationSensoroptionsToFfi(SensorOptions value) {
  final _enabledHandle = booleanToFfi(value.enabled);
  final _result = _sdkLocationSensoroptionsCreateHandle(_enabledHandle);
  booleanReleaseFfiHandle(_enabledHandle);
  return _result;
}

SensorOptions sdkLocationSensoroptionsFromFfi(Pointer<Void> handle) {
  final _enabledHandle = _sdkLocationSensoroptionsGetFieldenabled(handle);
  try {
    return SensorOptions(
      booleanFromFfi(_enabledHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_enabledHandle);
  }
}

void sdkLocationSensoroptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkLocationSensoroptionsReleaseHandle(handle);

// Nullable SensorOptions

final _sdkLocationSensoroptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_SensorOptions_create_handle_nullable'));
final _sdkLocationSensoroptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_SensorOptions_release_handle_nullable'));
final _sdkLocationSensoroptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_SensorOptions_get_value_nullable'));

Pointer<Void> sdkLocationSensoroptionsToFfiNullable(SensorOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkLocationSensoroptionsToFfi(value);
  final result = _sdkLocationSensoroptionsCreateHandleNullable(_handle);
  sdkLocationSensoroptionsReleaseFfiHandle(_handle);
  return result;
}

SensorOptions? sdkLocationSensoroptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkLocationSensoroptionsGetValueNullable(handle);
  final result = sdkLocationSensoroptionsFromFfi(_handle);
  sdkLocationSensoroptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkLocationSensoroptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationSensoroptionsReleaseHandleNullable(handle);

// End of SensorOptions "private" section.


