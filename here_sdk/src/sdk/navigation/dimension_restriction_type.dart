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

enum DimensionRestrictionType {
    truckHeight,
    truckWidth,
    truckLength
}

// DimensionRestrictionType "private" section, not exported.

int sdkNavigationDimensionrestrictiontypeToFfi(DimensionRestrictionType value) {
  switch (value) {
  case DimensionRestrictionType.truckHeight:
    return 0;
  case DimensionRestrictionType.truckWidth:
    return 1;
  case DimensionRestrictionType.truckLength:
    return 2;
  default:
    throw StateError("Invalid enum value $value for DimensionRestrictionType enum.");
  }
}

DimensionRestrictionType sdkNavigationDimensionrestrictiontypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return DimensionRestrictionType.truckHeight;
  case 1:
    return DimensionRestrictionType.truckWidth;
  case 2:
    return DimensionRestrictionType.truckLength;
  default:
    throw StateError("Invalid numeric value $handle for DimensionRestrictionType enum.");
  }
}

void sdkNavigationDimensionrestrictiontypeReleaseFfiHandle(int handle) {}

final _sdkNavigationDimensionrestrictiontypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_navigation_DimensionRestrictionType_create_handle_nullable'));
final _sdkNavigationDimensionrestrictiontypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DimensionRestrictionType_release_handle_nullable'));
final _sdkNavigationDimensionrestrictiontypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DimensionRestrictionType_get_value_nullable'));

Pointer<Void> sdkNavigationDimensionrestrictiontypeToFfiNullable(DimensionRestrictionType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationDimensionrestrictiontypeToFfi(value);
  final result = _sdkNavigationDimensionrestrictiontypeCreateHandleNullable(_handle);
  sdkNavigationDimensionrestrictiontypeReleaseFfiHandle(_handle);
  return result;
}

DimensionRestrictionType? sdkNavigationDimensionrestrictiontypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationDimensionrestrictiontypeGetValueNullable(handle);
  final result = sdkNavigationDimensionrestrictiontypeFromFfi(_handle);
  sdkNavigationDimensionrestrictiontypeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationDimensionrestrictiontypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationDimensionrestrictiontypeReleaseHandleNullable(handle);

// End of DimensionRestrictionType "private" section.


