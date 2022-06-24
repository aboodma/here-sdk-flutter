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

/// Initialization status types of the [VenueService].
enum VenueServiceInitStatus {
    /// The venue service successfully initialized online.
    onlineSuccess,
    /// The venue service failed to initialize online.
    onlineFailed,
    /// The venue service has not started.
    notStarted,
    /// The venue service is in a process of initialization.
    inProgress
}

// VenueServiceInitStatus "private" section, not exported.

int sdkVenueServiceVenueserviceinitstatusToFfi(VenueServiceInitStatus value) {
  switch (value) {
  case VenueServiceInitStatus.onlineSuccess:
    return 0;
  case VenueServiceInitStatus.onlineFailed:
    return 1;
  case VenueServiceInitStatus.notStarted:
    return 2;
  case VenueServiceInitStatus.inProgress:
    return 3;
  default:
    throw StateError("Invalid enum value $value for VenueServiceInitStatus enum.");
  }
}

VenueServiceInitStatus sdkVenueServiceVenueserviceinitstatusFromFfi(int handle) {
  switch (handle) {
  case 0:
    return VenueServiceInitStatus.onlineSuccess;
  case 1:
    return VenueServiceInitStatus.onlineFailed;
  case 2:
    return VenueServiceInitStatus.notStarted;
  case 3:
    return VenueServiceInitStatus.inProgress;
  default:
    throw StateError("Invalid numeric value $handle for VenueServiceInitStatus enum.");
  }
}

void sdkVenueServiceVenueserviceinitstatusReleaseFfiHandle(int handle) {}

final _sdkVenueServiceVenueserviceinitstatusCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_venue_service_VenueServiceInitStatus_create_handle_nullable'));
final _sdkVenueServiceVenueserviceinitstatusReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_service_VenueServiceInitStatus_release_handle_nullable'));
final _sdkVenueServiceVenueserviceinitstatusGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_venue_service_VenueServiceInitStatus_get_value_nullable'));

Pointer<Void> sdkVenueServiceVenueserviceinitstatusToFfiNullable(VenueServiceInitStatus? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkVenueServiceVenueserviceinitstatusToFfi(value);
  final result = _sdkVenueServiceVenueserviceinitstatusCreateHandleNullable(_handle);
  sdkVenueServiceVenueserviceinitstatusReleaseFfiHandle(_handle);
  return result;
}

VenueServiceInitStatus? sdkVenueServiceVenueserviceinitstatusFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkVenueServiceVenueserviceinitstatusGetValueNullable(handle);
  final result = sdkVenueServiceVenueserviceinitstatusFromFfi(_handle);
  sdkVenueServiceVenueserviceinitstatusReleaseFfiHandle(_handle);
  return result;
}

void sdkVenueServiceVenueserviceinitstatusReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueServiceVenueserviceinitstatusReleaseHandleNullable(handle);

// End of VenueServiceInitStatus "private" section.


