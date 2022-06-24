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
import 'package:here_sdk/src/sdk/navigation/speed_limit_offset.dart';

/// Contains all options to be used for the speed limit warnings.

class SpeedWarningOptions {
  /// The speed limit offsets to be used when notifying about exceeding the speed limit.
  SpeedLimitOffset speedLimitOffset;

  SpeedWarningOptions(this.speedLimitOffset);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SpeedWarningOptions) return false;
    SpeedWarningOptions _other = other;
    return speedLimitOffset == _other.speedLimitOffset;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + speedLimitOffset.hashCode;
    return result;
  }
}


// SpeedWarningOptions "private" section, not exported.

final _sdkNavigationSpeedwarningoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedWarningOptions_create_handle'));
final _sdkNavigationSpeedwarningoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedWarningOptions_release_handle'));
final _sdkNavigationSpeedwarningoptionsGetFieldspeedLimitOffset = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedWarningOptions_get_field_speedLimitOffset'));



Pointer<Void> sdkNavigationSpeedwarningoptionsToFfi(SpeedWarningOptions value) {
  final _speedLimitOffsetHandle = sdkNavigationSpeedlimitoffsetToFfi(value.speedLimitOffset);
  final _result = _sdkNavigationSpeedwarningoptionsCreateHandle(_speedLimitOffsetHandle);
  sdkNavigationSpeedlimitoffsetReleaseFfiHandle(_speedLimitOffsetHandle);
  return _result;
}

SpeedWarningOptions sdkNavigationSpeedwarningoptionsFromFfi(Pointer<Void> handle) {
  final _speedLimitOffsetHandle = _sdkNavigationSpeedwarningoptionsGetFieldspeedLimitOffset(handle);
  try {
    return SpeedWarningOptions(
      sdkNavigationSpeedlimitoffsetFromFfi(_speedLimitOffsetHandle)
    );
  } finally {
    sdkNavigationSpeedlimitoffsetReleaseFfiHandle(_speedLimitOffsetHandle);
  }
}

void sdkNavigationSpeedwarningoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationSpeedwarningoptionsReleaseHandle(handle);

// Nullable SpeedWarningOptions

final _sdkNavigationSpeedwarningoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedWarningOptions_create_handle_nullable'));
final _sdkNavigationSpeedwarningoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedWarningOptions_release_handle_nullable'));
final _sdkNavigationSpeedwarningoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedWarningOptions_get_value_nullable'));

Pointer<Void> sdkNavigationSpeedwarningoptionsToFfiNullable(SpeedWarningOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationSpeedwarningoptionsToFfi(value);
  final result = _sdkNavigationSpeedwarningoptionsCreateHandleNullable(_handle);
  sdkNavigationSpeedwarningoptionsReleaseFfiHandle(_handle);
  return result;
}

SpeedWarningOptions? sdkNavigationSpeedwarningoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationSpeedwarningoptionsGetValueNullable(handle);
  final result = sdkNavigationSpeedwarningoptionsFromFfi(_handle);
  sdkNavigationSpeedwarningoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationSpeedwarningoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpeedwarningoptionsReleaseHandleNullable(handle);

// End of SpeedWarningOptions "private" section.


