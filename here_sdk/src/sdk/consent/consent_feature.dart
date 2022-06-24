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

/// Defines business features required by contribution consent
/// aware components.
/// @nodoc
enum ConsentFeature {
    /// Application is HERE certified.
    hereCertified,
    /// Application may participate to HERE positioning data collection.
    positioningContribute
}

// ConsentFeature "private" section, not exported.

int sdkConsentConsentfeatureToFfi(ConsentFeature value) {
  switch (value) {
  case ConsentFeature.hereCertified:
    return 0;
  case ConsentFeature.positioningContribute:
    return 1;
  default:
    throw StateError("Invalid enum value $value for ConsentFeature enum.");
  }
}

ConsentFeature sdkConsentConsentfeatureFromFfi(int handle) {
  switch (handle) {
  case 0:
    return ConsentFeature.hereCertified;
  case 1:
    return ConsentFeature.positioningContribute;
  default:
    throw StateError("Invalid numeric value $handle for ConsentFeature enum.");
  }
}

void sdkConsentConsentfeatureReleaseFfiHandle(int handle) {}

final _sdkConsentConsentfeatureCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_consent_ConsentFeature_create_handle_nullable'));
final _sdkConsentConsentfeatureReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentFeature_release_handle_nullable'));
final _sdkConsentConsentfeatureGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_consent_ConsentFeature_get_value_nullable'));

Pointer<Void> sdkConsentConsentfeatureToFfiNullable(ConsentFeature? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkConsentConsentfeatureToFfi(value);
  final result = _sdkConsentConsentfeatureCreateHandleNullable(_handle);
  sdkConsentConsentfeatureReleaseFfiHandle(_handle);
  return result;
}

ConsentFeature? sdkConsentConsentfeatureFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkConsentConsentfeatureGetValueNullable(handle);
  final result = sdkConsentConsentfeatureFromFfi(_handle);
  sdkConsentConsentfeatureReleaseFfiHandle(_handle);
  return result;
}

void sdkConsentConsentfeatureReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkConsentConsentfeatureReleaseHandleNullable(handle);

// End of ConsentFeature "private" section.


