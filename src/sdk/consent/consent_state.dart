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

/// Consent internal state.
/// @nodoc
enum ConsentState {
    /// Consent state not set.
    unknown,
    /// Consent being requested, but user has not replied, yet.
    requesting,
    /// Consent granted.
    granted,
    /// Consent denied.
    notGranted,
    /// Consent granted, but not yet trusted. Waiting for certification check
    /// with the server.
    pendingGranted,
    /// Consent denied, but not yet trusted. Waiting for certification check
    /// with the server.
    pendingNotGranted
}

// ConsentState "private" section, not exported.

int sdkConsentConsentstateToFfi(ConsentState value) {
  switch (value) {
  case ConsentState.unknown:
    return 0;
  case ConsentState.requesting:
    return 1;
  case ConsentState.granted:
    return 2;
  case ConsentState.notGranted:
    return 3;
  case ConsentState.pendingGranted:
    return 4;
  case ConsentState.pendingNotGranted:
    return 5;
  default:
    throw StateError("Invalid enum value $value for ConsentState enum.");
  }
}

ConsentState sdkConsentConsentstateFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ConsentState.unknown;
  case 1:
    return ConsentState.requesting;
  case 2:
    return ConsentState.granted;
  case 3:
    return ConsentState.notGranted;
  case 4:
    return ConsentState.pendingGranted;
  case 5:
    return ConsentState.pendingNotGranted;
  default:
    throw StateError("Invalid numeric value $handle for ConsentState enum.");
  }
}

void sdkConsentConsentstateReleaseFfiHandle(int handle) {}

final _sdkConsentConsentstateCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_consent_ConsentState_create_handle_nullable'));
final _sdkConsentConsentstateReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentState_release_handle_nullable'));
final _sdkConsentConsentstateGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentState_get_value_nullable'));

Pointer<Void> sdkConsentConsentstateToFfiNullable(ConsentState? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkConsentConsentstateToFfi(value);
  final result = _sdkConsentConsentstateCreateHandleNullable(_handle);
  sdkConsentConsentstateReleaseFfiHandle(_handle);
  return result;
}

ConsentState? sdkConsentConsentstateFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkConsentConsentstateGetValueNullable(handle);
  final result = sdkConsentConsentstateFromFfi(_handle);
  sdkConsentConsentstateReleaseFfiHandle(_handle);
  return result;
}

void sdkConsentConsentstateReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkConsentConsentstateReleaseHandleNullable(handle);

// End of ConsentState "private" section.


