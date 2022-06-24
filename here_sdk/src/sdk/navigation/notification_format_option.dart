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

/// Indicates the formatting option of phoneme included in the notification.
enum NotificationFormatOption {
    /// No phoneme is used for this option as plain orthographic form is included in the notification. Notification
    /// example: 'After 300 meters turn right onto Wall Street.'.
    plain,
    /// Phoneme in SSML format is included in the notification, only if [ManeuverNotificationOptions.enablePhoneme]
    /// option is set to true. Notification example: 'After 300 meters turn right onto <lang xml:lang="ENG"><phoneme
    /// alphabet="nts" ph="&quot;wɔːl&quot;striːt" orthmode="ignorepunct">Wall Street</phoneme></lang>.'. This format
    /// is compatible with and supported by the TTS engines provided by Android and iOS, presumably by many other TTS
    /// engines. Please check https://www.w3.org/TR/speech-synthesis11/ for detailed information about the SSML format.
    ssml
}

// NotificationFormatOption "private" section, not exported.

int sdkNavigationNotificationformatoptionToFfi(NotificationFormatOption value) {
  switch (value) {
  case NotificationFormatOption.plain:
    return 0;
  case NotificationFormatOption.ssml:
    return 1;
  default:
    throw StateError("Invalid enum value $value for NotificationFormatOption enum.");
  }
}

NotificationFormatOption sdkNavigationNotificationformatoptionFromFfi(int handle) {
  switch (handle) {
  case 0:
    return NotificationFormatOption.plain;
  case 1:
    return NotificationFormatOption.ssml;
  default:
    throw StateError("Invalid numeric value $handle for NotificationFormatOption enum.");
  }
}

void sdkNavigationNotificationformatoptionReleaseFfiHandle(int handle) {}

final _sdkNavigationNotificationformatoptionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_NotificationFormatOption_create_handle_nullable'));
final _sdkNavigationNotificationformatoptionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NotificationFormatOption_release_handle_nullable'));
final _sdkNavigationNotificationformatoptionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NotificationFormatOption_get_value_nullable'));

Pointer<Void> sdkNavigationNotificationformatoptionToFfiNullable(NotificationFormatOption? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationNotificationformatoptionToFfi(value);
  final result = _sdkNavigationNotificationformatoptionCreateHandleNullable(_handle);
  sdkNavigationNotificationformatoptionReleaseFfiHandle(_handle);
  return result;
}

NotificationFormatOption? sdkNavigationNotificationformatoptionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationNotificationformatoptionGetValueNullable(handle);
  final result = sdkNavigationNotificationformatoptionFromFfi(_handle);
  sdkNavigationNotificationformatoptionReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationNotificationformatoptionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationNotificationformatoptionReleaseHandleNullable(handle);

// End of NotificationFormatOption "private" section.


