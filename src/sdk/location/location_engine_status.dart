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

/// Indicates the status of the LocationEngine.
enum LocationEngineStatus {
    /// LocationEngine successfully started.
    engineStarted,
    /// Tried to start LocationEngine that is already started.
    alreadyStarted,
    /// LocationEngine has been stopped.
    engineStopped,
    /// Start failed due to an internal error.
    startFailed,
    /// User consent has not been handled yet.
    userConsentNotHandled,
    /// Missing one or more user permissions.
    missingPermissions,
    /// Authentication failed. Check your credentials.
    authenticationFailed,
    /// Request is not supported.
    notSupported,
    /// Request is not supported in current region.
    notAllowed,
    /// Engine is not ready for the requested action.
    notReady,
    /// Requested operation succeeded.
    ok,
    /// HD GNSS requires extra license
    notLicensed,
    /// HD GNSS requires at least Android 9 and dual frequency GNSS with carrier phase measurements
    notCompatible
}

// LocationEngineStatus "private" section, not exported.

int sdkLocationLocationenginestatusToFfi(LocationEngineStatus value) {
  switch (value) {
  case LocationEngineStatus.engineStarted:
    return 0;
  case LocationEngineStatus.alreadyStarted:
    return 1;
  case LocationEngineStatus.engineStopped:
    return 2;
  case LocationEngineStatus.startFailed:
    return 3;
  case LocationEngineStatus.userConsentNotHandled:
    return 4;
  case LocationEngineStatus.missingPermissions:
    return 5;
  case LocationEngineStatus.authenticationFailed:
    return 6;
  case LocationEngineStatus.notSupported:
    return 7;
  case LocationEngineStatus.notAllowed:
    return 8;
  case LocationEngineStatus.notReady:
    return 9;
  case LocationEngineStatus.ok:
    return 10;
  case LocationEngineStatus.notLicensed:
    return 11;
  case LocationEngineStatus.notCompatible:
    return 12;
  default:
    throw StateError("Invalid enum value $value for LocationEngineStatus enum.");
  }
}

LocationEngineStatus sdkLocationLocationenginestatusFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LocationEngineStatus.engineStarted;
  case 1:
    return LocationEngineStatus.alreadyStarted;
  case 2:
    return LocationEngineStatus.engineStopped;
  case 3:
    return LocationEngineStatus.startFailed;
  case 4:
    return LocationEngineStatus.userConsentNotHandled;
  case 5:
    return LocationEngineStatus.missingPermissions;
  case 6:
    return LocationEngineStatus.authenticationFailed;
  case 7:
    return LocationEngineStatus.notSupported;
  case 8:
    return LocationEngineStatus.notAllowed;
  case 9:
    return LocationEngineStatus.notReady;
  case 10:
    return LocationEngineStatus.ok;
  case 11:
    return LocationEngineStatus.notLicensed;
  case 12:
    return LocationEngineStatus.notCompatible;
  default:
    throw StateError("Invalid numeric value $handle for LocationEngineStatus enum.");
  }
}

void sdkLocationLocationenginestatusReleaseFfiHandle(int handle) {}

final _sdkLocationLocationenginestatusCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_location_LocationEngineStatus_create_handle_nullable'));
final _sdkLocationLocationenginestatusReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationEngineStatus_release_handle_nullable'));
final _sdkLocationLocationenginestatusGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationEngineStatus_get_value_nullable'));

Pointer<Void> sdkLocationLocationenginestatusToFfiNullable(LocationEngineStatus? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkLocationLocationenginestatusToFfi(value);
  final result = _sdkLocationLocationenginestatusCreateHandleNullable(_handle);
  sdkLocationLocationenginestatusReleaseFfiHandle(_handle);
  return result;
}

LocationEngineStatus? sdkLocationLocationenginestatusFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkLocationLocationenginestatusGetValueNullable(handle);
  final result = sdkLocationLocationenginestatusFromFfi(_handle);
  sdkLocationLocationenginestatusReleaseFfiHandle(_handle);
  return result;
}

void sdkLocationLocationenginestatusReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationLocationenginestatusReleaseHandleNullable(handle);

// End of LocationEngineStatus "private" section.


