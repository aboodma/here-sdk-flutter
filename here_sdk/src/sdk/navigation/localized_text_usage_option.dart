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

/// Indicates the option of localized text usage.
enum LocalizedTextUsageOption {
    /// Information is not included in the notification.
    never,
    /// Information is included in the notification, if available.
    always,
    /// Information is included in the notification, if available and its language code is compatible with the voice
    /// package language. For example, in case the voice package language is German and the localized text information
    /// is in Italian, the information is then excluded from the notification.
    /// More examples:
    /// | Voice package language | Information language | Included |
    /// | en-GB                  | en                   | yes      |
    /// | en-GB                  | de                   | no       |
    /// | pt-BR                  | pt                   | yes      |
    /// | pt-PT                  | pt                   | yes      |
    ifLanguageIsCompatible
}

// LocalizedTextUsageOption "private" section, not exported.

int sdkNavigationLocalizedtextusageoptionToFfi(LocalizedTextUsageOption value) {
  switch (value) {
  case LocalizedTextUsageOption.never:
    return 0;
  case LocalizedTextUsageOption.always:
    return 1;
  case LocalizedTextUsageOption.ifLanguageIsCompatible:
    return 2;
  default:
    throw StateError("Invalid enum value $value for LocalizedTextUsageOption enum.");
  }
}

LocalizedTextUsageOption sdkNavigationLocalizedtextusageoptionFromFfi(int handle) {
  switch (handle) {
  case 0:
    return LocalizedTextUsageOption.never;
  case 1:
    return LocalizedTextUsageOption.always;
  case 2:
    return LocalizedTextUsageOption.ifLanguageIsCompatible;
  default:
    throw StateError("Invalid numeric value $handle for LocalizedTextUsageOption enum.");
  }
}

void sdkNavigationLocalizedtextusageoptionReleaseFfiHandle(int handle) {}

final _sdkNavigationLocalizedtextusageoptionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_LocalizedTextUsageOption_create_handle_nullable'));
final _sdkNavigationLocalizedtextusageoptionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocalizedTextUsageOption_release_handle_nullable'));
final _sdkNavigationLocalizedtextusageoptionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LocalizedTextUsageOption_get_value_nullable'));

Pointer<Void> sdkNavigationLocalizedtextusageoptionToFfiNullable(LocalizedTextUsageOption? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationLocalizedtextusageoptionToFfi(value);
  final result = _sdkNavigationLocalizedtextusageoptionCreateHandleNullable(_handle);
  sdkNavigationLocalizedtextusageoptionReleaseFfiHandle(_handle);
  return result;
}

LocalizedTextUsageOption? sdkNavigationLocalizedtextusageoptionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationLocalizedtextusageoptionGetValueNullable(handle);
  final result = sdkNavigationLocalizedtextusageoptionFromFfi(_handle);
  sdkNavigationLocalizedtextusageoptionReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationLocalizedtextusageoptionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationLocalizedtextusageoptionReleaseHandleNullable(handle);

// End of LocalizedTextUsageOption "private" section.


