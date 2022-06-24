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

/// Wi-Fi positioning options.

class WifiPositioningOptions {
  /// Controls WiFi positioning. If false, WiFi positioning is disabled.
  bool enabled;

  WifiPositioningOptions.withDefaults()
      : enabled = true;
  @Deprecated("Will be removed in v4.13.0. Please use `withDefaults()` constructor instead.")
  WifiPositioningOptions(this.enabled);
}


// WifiPositioningOptions "private" section, not exported.

final _sdkLocationWifipositioningoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_location_WifiPositioningOptions_create_handle'));
final _sdkLocationWifipositioningoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_WifiPositioningOptions_release_handle'));
final _sdkLocationWifipositioningoptionsGetFieldenabled = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_location_WifiPositioningOptions_get_field_enabled'));



Pointer<Void> sdkLocationWifipositioningoptionsToFfi(WifiPositioningOptions value) {
  final _enabledHandle = booleanToFfi(value.enabled);
  final _result = _sdkLocationWifipositioningoptionsCreateHandle(_enabledHandle);
  booleanReleaseFfiHandle(_enabledHandle);
  return _result;
}

WifiPositioningOptions sdkLocationWifipositioningoptionsFromFfi(Pointer<Void> handle) {
  final _enabledHandle = _sdkLocationWifipositioningoptionsGetFieldenabled(handle);
  try {
    return WifiPositioningOptions(
      booleanFromFfi(_enabledHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_enabledHandle);
  }
}

void sdkLocationWifipositioningoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkLocationWifipositioningoptionsReleaseHandle(handle);

// Nullable WifiPositioningOptions

final _sdkLocationWifipositioningoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_WifiPositioningOptions_create_handle_nullable'));
final _sdkLocationWifipositioningoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_WifiPositioningOptions_release_handle_nullable'));
final _sdkLocationWifipositioningoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_WifiPositioningOptions_get_value_nullable'));

Pointer<Void> sdkLocationWifipositioningoptionsToFfiNullable(WifiPositioningOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkLocationWifipositioningoptionsToFfi(value);
  final result = _sdkLocationWifipositioningoptionsCreateHandleNullable(_handle);
  sdkLocationWifipositioningoptionsReleaseFfiHandle(_handle);
  return result;
}

WifiPositioningOptions? sdkLocationWifipositioningoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkLocationWifipositioningoptionsGetValueNullable(handle);
  final result = sdkLocationWifipositioningoptionsFromFfi(_handle);
  sdkLocationWifipositioningoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkLocationWifipositioningoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationWifipositioningoptionsReleaseHandleNullable(handle);

// End of WifiPositioningOptions "private" section.


