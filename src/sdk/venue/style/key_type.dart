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
import 'package:meta/meta.dart';

/// The key type.
/// @nodoc
@internal
enum KeyType {
    /// entity property
    entityProperty,
    /// geometry property
    geometryProperty,
    /// address
    address
}

// KeyType "private" section, not exported.

int sdkVenueStyleKeytypeToFfi(KeyType value) {
  switch (value) {
  case KeyType.entityProperty:
    return 0;
  case KeyType.geometryProperty:
    return 1;
  case KeyType.address:
    return 2;
  default:
    throw StateError("Invalid enum value $value for KeyType enum.");
  }
}

KeyType sdkVenueStyleKeytypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return KeyType.entityProperty;
  case 1:
    return KeyType.geometryProperty;
  case 2:
    return KeyType.address;
  default:
    throw StateError("Invalid numeric value $handle for KeyType enum.");
  }
}

void sdkVenueStyleKeytypeReleaseFfiHandle(int handle) {}

final _sdkVenueStyleKeytypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_venue_style_KeyType_create_handle_nullable'));
final _sdkVenueStyleKeytypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_KeyType_release_handle_nullable'));
final _sdkVenueStyleKeytypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_KeyType_get_value_nullable'));

Pointer<Void> sdkVenueStyleKeytypeToFfiNullable(KeyType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkVenueStyleKeytypeToFfi(value);
  final result = _sdkVenueStyleKeytypeCreateHandleNullable(_handle);
  sdkVenueStyleKeytypeReleaseFfiHandle(_handle);
  return result;
}

KeyType? sdkVenueStyleKeytypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkVenueStyleKeytypeGetValueNullable(handle);
  final result = sdkVenueStyleKeytypeFromFfi(_handle);
  sdkVenueStyleKeytypeReleaseFfiHandle(_handle);
  return result;
}

void sdkVenueStyleKeytypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleKeytypeReleaseHandleNullable(handle);

// End of KeyType "private" section.


