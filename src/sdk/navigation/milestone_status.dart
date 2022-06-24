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

/// This enum represents the status of the [Milestone].
enum MilestoneStatus {
    /// This status indicates that the [Milestone] has been reached.
    reached,
    /// This status indicates that the [Milestone] has been missed.
    missed
}

// MilestoneStatus "private" section, not exported.

int sdkNavigationMilestonestatusToFfi(MilestoneStatus value) {
  switch (value) {
  case MilestoneStatus.reached:
    return 0;
  case MilestoneStatus.missed:
    return 1;
  default:
    throw StateError("Invalid enum value $value for MilestoneStatus enum.");
  }
}

MilestoneStatus sdkNavigationMilestonestatusFromFfi(int handle) {
  switch (handle) {
  case 0:
    return MilestoneStatus.reached;
  case 1:
    return MilestoneStatus.missed;
  default:
    throw StateError("Invalid numeric value $handle for MilestoneStatus enum.");
  }
}

void sdkNavigationMilestonestatusReleaseFfiHandle(int handle) {}

final _sdkNavigationMilestonestatusCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_MilestoneStatus_create_handle_nullable'));
final _sdkNavigationMilestonestatusReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MilestoneStatus_release_handle_nullable'));
final _sdkNavigationMilestonestatusGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MilestoneStatus_get_value_nullable'));

Pointer<Void> sdkNavigationMilestonestatusToFfiNullable(MilestoneStatus? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationMilestonestatusToFfi(value);
  final result = _sdkNavigationMilestonestatusCreateHandleNullable(_handle);
  sdkNavigationMilestonestatusReleaseFfiHandle(_handle);
  return result;
}

MilestoneStatus? sdkNavigationMilestonestatusFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationMilestonestatusGetValueNullable(handle);
  final result = sdkNavigationMilestonestatusFromFfi(_handle);
  sdkNavigationMilestonestatusReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationMilestonestatusReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationMilestonestatusReleaseHandleNullable(handle);

// End of MilestoneStatus "private" section.


