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

/// Positioning notification options.

class NotificationOptions {
  /// Desired interval for position updates in milliseconds. This interval
  /// is not guaranteed.
  int desiredIntervalMilliseconds;

  /// Smallest allowed interval for position updates in milliseconds.  It is
  /// guaranteed that positions are not provided more often than this value.
  /// Smallest interval could be used for throttling position updates, e.g.
  /// when each position update triggers CPU intensive calculations in the
  /// client application.
  int smallestIntervalMilliseconds;

  NotificationOptions.withDefaults()
      : desiredIntervalMilliseconds = 30000, smallestIntervalMilliseconds = 1000;
  @Deprecated("Will be removed in v4.13.0. Please use `withDefaults()` constructor instead.")
  NotificationOptions(this.desiredIntervalMilliseconds, this.smallestIntervalMilliseconds);
}


// NotificationOptions "private" section, not exported.

final _sdkLocationNotificationoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Uint64),
    Pointer<Void> Function(int, int)
  >('here_sdk_sdk_location_NotificationOptions_create_handle'));
final _sdkLocationNotificationoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_NotificationOptions_release_handle'));
final _sdkLocationNotificationoptionsGetFielddesiredIntervalMilliseconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_location_NotificationOptions_get_field_desiredIntervalMilliseconds'));
final _sdkLocationNotificationoptionsGetFieldsmallestIntervalMilliseconds = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_location_NotificationOptions_get_field_smallestIntervalMilliseconds'));



Pointer<Void> sdkLocationNotificationoptionsToFfi(NotificationOptions value) {
  final _desiredIntervalMillisecondsHandle = (value.desiredIntervalMilliseconds);
  final _smallestIntervalMillisecondsHandle = (value.smallestIntervalMilliseconds);
  final _result = _sdkLocationNotificationoptionsCreateHandle(_desiredIntervalMillisecondsHandle, _smallestIntervalMillisecondsHandle);
  
  
  return _result;
}

NotificationOptions sdkLocationNotificationoptionsFromFfi(Pointer<Void> handle) {
  final _desiredIntervalMillisecondsHandle = _sdkLocationNotificationoptionsGetFielddesiredIntervalMilliseconds(handle);
  final _smallestIntervalMillisecondsHandle = _sdkLocationNotificationoptionsGetFieldsmallestIntervalMilliseconds(handle);
  try {
    return NotificationOptions(
      (_desiredIntervalMillisecondsHandle), 
      (_smallestIntervalMillisecondsHandle)
    );
  } finally {
    
    
  }
}

void sdkLocationNotificationoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkLocationNotificationoptionsReleaseHandle(handle);

// Nullable NotificationOptions

final _sdkLocationNotificationoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_NotificationOptions_create_handle_nullable'));
final _sdkLocationNotificationoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_NotificationOptions_release_handle_nullable'));
final _sdkLocationNotificationoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_NotificationOptions_get_value_nullable'));

Pointer<Void> sdkLocationNotificationoptionsToFfiNullable(NotificationOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkLocationNotificationoptionsToFfi(value);
  final result = _sdkLocationNotificationoptionsCreateHandleNullable(_handle);
  sdkLocationNotificationoptionsReleaseFfiHandle(_handle);
  return result;
}

NotificationOptions? sdkLocationNotificationoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkLocationNotificationoptionsGetValueNullable(handle);
  final result = sdkLocationNotificationoptionsFromFfi(_handle);
  sdkLocationNotificationoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkLocationNotificationoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationNotificationoptionsReleaseHandleNullable(handle);

// End of NotificationOptions "private" section.


