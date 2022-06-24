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

/// Represents two separate speed limit offsets for higher and lower speed limits.
///
/// A driver will be notified when the current driving speed is above the speed limit + offset.
/// Only one of the two offsets is used depending on the current speed limit.

class SpeedLimitOffset {
  /// A speed limit offset for speed limits below the [SpeedLimitOffset.highSpeedBoundaryInMetersPerSecond].
  double lowSpeedOffsetInMetersPerSecond;

  /// A speed limit offset for speed limits above the [SpeedLimitOffset.highSpeedBoundaryInMetersPerSecond].
  double highSpeedOffsetInMetersPerSecond;

  /// The boundary that defines higher and lower speed limits.
  double highSpeedBoundaryInMetersPerSecond;

  SpeedLimitOffset.withDefaults()
      : lowSpeedOffsetInMetersPerSecond = 0, highSpeedOffsetInMetersPerSecond = 0, highSpeedBoundaryInMetersPerSecond = 0;
  @Deprecated("Will be removed in v4.13.0. Please use `withDefaults()` constructor instead.")
  SpeedLimitOffset(this.lowSpeedOffsetInMetersPerSecond, this.highSpeedOffsetInMetersPerSecond, this.highSpeedBoundaryInMetersPerSecond);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SpeedLimitOffset) return false;
    SpeedLimitOffset _other = other;
    return lowSpeedOffsetInMetersPerSecond == _other.lowSpeedOffsetInMetersPerSecond &&
        highSpeedOffsetInMetersPerSecond == _other.highSpeedOffsetInMetersPerSecond &&
        highSpeedBoundaryInMetersPerSecond == _other.highSpeedBoundaryInMetersPerSecond;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + lowSpeedOffsetInMetersPerSecond.hashCode;
    result = 31 * result + highSpeedOffsetInMetersPerSecond.hashCode;
    result = 31 * result + highSpeedBoundaryInMetersPerSecond.hashCode;
    return result;
  }
}


// SpeedLimitOffset "private" section, not exported.

final _sdkNavigationSpeedlimitoffsetCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double, Double),
    Pointer<Void> Function(double, double, double)
  >('here_sdk_sdk_navigation_SpeedLimitOffset_create_handle'));
final _sdkNavigationSpeedlimitoffsetReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimitOffset_release_handle'));
final _sdkNavigationSpeedlimitoffsetGetFieldlowSpeedOffsetInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimitOffset_get_field_lowSpeedOffsetInMetersPerSecond'));
final _sdkNavigationSpeedlimitoffsetGetFieldhighSpeedOffsetInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimitOffset_get_field_highSpeedOffsetInMetersPerSecond'));
final _sdkNavigationSpeedlimitoffsetGetFieldhighSpeedBoundaryInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimitOffset_get_field_highSpeedBoundaryInMetersPerSecond'));



Pointer<Void> sdkNavigationSpeedlimitoffsetToFfi(SpeedLimitOffset value) {
  final _lowSpeedOffsetInMetersPerSecondHandle = (value.lowSpeedOffsetInMetersPerSecond);
  final _highSpeedOffsetInMetersPerSecondHandle = (value.highSpeedOffsetInMetersPerSecond);
  final _highSpeedBoundaryInMetersPerSecondHandle = (value.highSpeedBoundaryInMetersPerSecond);
  final _result = _sdkNavigationSpeedlimitoffsetCreateHandle(_lowSpeedOffsetInMetersPerSecondHandle, _highSpeedOffsetInMetersPerSecondHandle, _highSpeedBoundaryInMetersPerSecondHandle);
  
  
  
  return _result;
}

SpeedLimitOffset sdkNavigationSpeedlimitoffsetFromFfi(Pointer<Void> handle) {
  final _lowSpeedOffsetInMetersPerSecondHandle = _sdkNavigationSpeedlimitoffsetGetFieldlowSpeedOffsetInMetersPerSecond(handle);
  final _highSpeedOffsetInMetersPerSecondHandle = _sdkNavigationSpeedlimitoffsetGetFieldhighSpeedOffsetInMetersPerSecond(handle);
  final _highSpeedBoundaryInMetersPerSecondHandle = _sdkNavigationSpeedlimitoffsetGetFieldhighSpeedBoundaryInMetersPerSecond(handle);
  try {
    return SpeedLimitOffset(
      (_lowSpeedOffsetInMetersPerSecondHandle), 
      (_highSpeedOffsetInMetersPerSecondHandle), 
      (_highSpeedBoundaryInMetersPerSecondHandle)
    );
  } finally {
    
    
    
  }
}

void sdkNavigationSpeedlimitoffsetReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationSpeedlimitoffsetReleaseHandle(handle);

// Nullable SpeedLimitOffset

final _sdkNavigationSpeedlimitoffsetCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimitOffset_create_handle_nullable'));
final _sdkNavigationSpeedlimitoffsetReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimitOffset_release_handle_nullable'));
final _sdkNavigationSpeedlimitoffsetGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_SpeedLimitOffset_get_value_nullable'));

Pointer<Void> sdkNavigationSpeedlimitoffsetToFfiNullable(SpeedLimitOffset? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationSpeedlimitoffsetToFfi(value);
  final result = _sdkNavigationSpeedlimitoffsetCreateHandleNullable(_handle);
  sdkNavigationSpeedlimitoffsetReleaseFfiHandle(_handle);
  return result;
}

SpeedLimitOffset? sdkNavigationSpeedlimitoffsetFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationSpeedlimitoffsetGetValueNullable(handle);
  final result = sdkNavigationSpeedlimitoffsetFromFfi(_handle);
  sdkNavigationSpeedlimitoffsetReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationSpeedlimitoffsetReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationSpeedlimitoffsetReleaseHandleNullable(handle);

// End of SpeedLimitOffset "private" section.


