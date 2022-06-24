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

/// Consent specific status codes.
enum ConsentStatus {
    /// Operation succeeded.
    ok,
    /// Operation is pending.
    pending,
    /// Operation not allowed.
    errNotAllowed,
    /// Illegal argument provided.
    errIllegalArgument,
    /// Unexpected failure.
    errFailed,
    /// Engine not ready.
    errNotReady
}

// ConsentStatus "private" section, not exported.

int sdkConsentConsentstatusToFfi(ConsentStatus value) {
  switch (value) {
  case ConsentStatus.ok:
    return 0;
  case ConsentStatus.pending:
    return 1;
  case ConsentStatus.errNotAllowed:
    return 2;
  case ConsentStatus.errIllegalArgument:
    return 3;
  case ConsentStatus.errFailed:
    return 4;
  case ConsentStatus.errNotReady:
    return 5;
  default:
    throw StateError("Invalid enum value $value for ConsentStatus enum.");
  }
}

ConsentStatus sdkConsentConsentstatusFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ConsentStatus.ok;
  case 1:
    return ConsentStatus.pending;
  case 2:
    return ConsentStatus.errNotAllowed;
  case 3:
    return ConsentStatus.errIllegalArgument;
  case 4:
    return ConsentStatus.errFailed;
  case 5:
    return ConsentStatus.errNotReady;
  default:
    throw StateError("Invalid numeric value $handle for ConsentStatus enum.");
  }
}

void sdkConsentConsentstatusReleaseFfiHandle(int handle) {}

final _sdkConsentConsentstatusCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_consent_ConsentStatus_create_handle_nullable'));
final _sdkConsentConsentstatusReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentStatus_release_handle_nullable'));
final _sdkConsentConsentstatusGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentStatus_get_value_nullable'));

Pointer<Void> sdkConsentConsentstatusToFfiNullable(ConsentStatus? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkConsentConsentstatusToFfi(value);
  final result = _sdkConsentConsentstatusCreateHandleNullable(_handle);
  sdkConsentConsentstatusReleaseFfiHandle(_handle);
  return result;
}

ConsentStatus? sdkConsentConsentstatusFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkConsentConsentstatusGetValueNullable(handle);
  final result = sdkConsentConsentstatusFromFfi(_handle);
  sdkConsentConsentstatusReleaseFfiHandle(_handle);
  return result;
}

void sdkConsentConsentstatusReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkConsentConsentstatusReleaseHandleNullable(handle);

// End of ConsentStatus "private" section.


