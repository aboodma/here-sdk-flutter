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

/// @nodoc
enum FuelType {
    diesel,
    petrol,
    lpg
}

// FuelType "private" section, not exported.

int sdkTransportFueltypeToFfi(FuelType value) {
  switch (value) {
  case FuelType.diesel:
    return 0;
  case FuelType.petrol:
    return 1;
  case FuelType.lpg:
    return 2;
  default:
    throw StateError("Invalid enum value $value for FuelType enum.");
  }
}

FuelType sdkTransportFueltypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return FuelType.diesel;
  case 1:
    return FuelType.petrol;
  case 2:
    return FuelType.lpg;
  default:
    throw StateError("Invalid numeric value $handle for FuelType enum.");
  }
}

void sdkTransportFueltypeReleaseFfiHandle(int handle) {}

final _sdkTransportFueltypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_transport_FuelType_create_handle_nullable'));
final _sdkTransportFueltypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_FuelType_release_handle_nullable'));
final _sdkTransportFueltypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_FuelType_get_value_nullable'));

Pointer<Void> sdkTransportFueltypeToFfiNullable(FuelType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportFueltypeToFfi(value);
  final result = _sdkTransportFueltypeCreateHandleNullable(_handle);
  sdkTransportFueltypeReleaseFfiHandle(_handle);
  return result;
}

FuelType? sdkTransportFueltypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportFueltypeGetValueNullable(handle);
  final result = sdkTransportFueltypeFromFfi(_handle);
  sdkTransportFueltypeReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportFueltypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportFueltypeReleaseHandleNullable(handle);

// End of FuelType "private" section.


