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

/// Options used when reading the GPX file.

class GPXOptions {
  /// If there are no timestamps in the GPX file, they will be generated assuming
  /// constant speed of movement. Otherwise, this value will be ignored.
  double speedInMetersPerSecond;

  GPXOptions.withDefaults()
      : speedInMetersPerSecond = 10;
  @Deprecated("Will be removed in v4.13.0. Please use GPXOptions.withDefaults() instead.")
  GPXOptions(this.speedInMetersPerSecond);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GPXOptions) return false;
    GPXOptions _other = other;
    return speedInMetersPerSecond == _other.speedInMetersPerSecond;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + speedInMetersPerSecond.hashCode;
    return result;
  }
}


// GPXOptions "private" section, not exported.

final _sdkNavigationGpxoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('here_sdk_sdk_navigation_GPXOptions_create_handle'));
final _sdkNavigationGpxoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXOptions_release_handle'));
final _sdkNavigationGpxoptionsGetFieldspeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXOptions_get_field_speedInMetersPerSecond'));



Pointer<Void> sdkNavigationGpxoptionsToFfi(GPXOptions value) {
  final _speedInMetersPerSecondHandle = (value.speedInMetersPerSecond);
  final _result = _sdkNavigationGpxoptionsCreateHandle(_speedInMetersPerSecondHandle);
  
  return _result;
}

GPXOptions sdkNavigationGpxoptionsFromFfi(Pointer<Void> handle) {
  final _speedInMetersPerSecondHandle = _sdkNavigationGpxoptionsGetFieldspeedInMetersPerSecond(handle);
  try {
    return GPXOptions(
      (_speedInMetersPerSecondHandle)
    );
  } finally {
    
  }
}

void sdkNavigationGpxoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationGpxoptionsReleaseHandle(handle);

// Nullable GPXOptions

final _sdkNavigationGpxoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXOptions_create_handle_nullable'));
final _sdkNavigationGpxoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXOptions_release_handle_nullable'));
final _sdkNavigationGpxoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXOptions_get_value_nullable'));

Pointer<Void> sdkNavigationGpxoptionsToFfiNullable(GPXOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationGpxoptionsToFfi(value);
  final result = _sdkNavigationGpxoptionsCreateHandleNullable(_handle);
  sdkNavigationGpxoptionsReleaseFfiHandle(_handle);
  return result;
}

GPXOptions? sdkNavigationGpxoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationGpxoptionsGetValueNullable(handle);
  final result = sdkNavigationGpxoptionsFromFfi(_handle);
  sdkNavigationGpxoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationGpxoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationGpxoptionsReleaseHandleNullable(handle);

// End of GPXOptions "private" section.


