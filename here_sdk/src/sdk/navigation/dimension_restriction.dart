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
import 'package:here_sdk/src/sdk/navigation/dimension_restriction_type.dart';


class DimensionRestriction {
  int valueInCentimeters;

  DimensionRestrictionType type;

  DimensionRestriction(this.valueInCentimeters, this.type);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DimensionRestriction) return false;
    DimensionRestriction _other = other;
    return valueInCentimeters == _other.valueInCentimeters &&
        type == _other.type;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + valueInCentimeters.hashCode;
    result = 31 * result + type.hashCode;
    return result;
  }
}


// DimensionRestriction "private" section, not exported.

final _sdkNavigationDimensionrestrictionCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint32),
    Pointer<Void> Function(int, int)
  >('here_sdk_sdk_navigation_DimensionRestriction_create_handle'));
final _sdkNavigationDimensionrestrictionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DimensionRestriction_release_handle'));
final _sdkNavigationDimensionrestrictionGetFieldvalueInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DimensionRestriction_get_field_valueInCentimeters'));
final _sdkNavigationDimensionrestrictionGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DimensionRestriction_get_field_type'));



Pointer<Void> sdkNavigationDimensionrestrictionToFfi(DimensionRestriction value) {
  final _valueInCentimetersHandle = (value.valueInCentimeters);
  final _typeHandle = sdkNavigationDimensionrestrictiontypeToFfi(value.type);
  final _result = _sdkNavigationDimensionrestrictionCreateHandle(_valueInCentimetersHandle, _typeHandle);
  
  sdkNavigationDimensionrestrictiontypeReleaseFfiHandle(_typeHandle);
  return _result;
}

DimensionRestriction sdkNavigationDimensionrestrictionFromFfi(Pointer<Void> handle) {
  final _valueInCentimetersHandle = _sdkNavigationDimensionrestrictionGetFieldvalueInCentimeters(handle);
  final _typeHandle = _sdkNavigationDimensionrestrictionGetFieldtype(handle);
  try {
    return DimensionRestriction(
      (_valueInCentimetersHandle), 
      sdkNavigationDimensionrestrictiontypeFromFfi(_typeHandle)
    );
  } finally {
    
    sdkNavigationDimensionrestrictiontypeReleaseFfiHandle(_typeHandle);
  }
}

void sdkNavigationDimensionrestrictionReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationDimensionrestrictionReleaseHandle(handle);

// Nullable DimensionRestriction

final _sdkNavigationDimensionrestrictionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DimensionRestriction_create_handle_nullable'));
final _sdkNavigationDimensionrestrictionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DimensionRestriction_release_handle_nullable'));
final _sdkNavigationDimensionrestrictionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_DimensionRestriction_get_value_nullable'));

Pointer<Void> sdkNavigationDimensionrestrictionToFfiNullable(DimensionRestriction? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationDimensionrestrictionToFfi(value);
  final result = _sdkNavigationDimensionrestrictionCreateHandleNullable(_handle);
  sdkNavigationDimensionrestrictionReleaseFfiHandle(_handle);
  return result;
}

DimensionRestriction? sdkNavigationDimensionrestrictionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationDimensionrestrictionGetValueNullable(handle);
  final result = sdkNavigationDimensionrestrictionFromFfi(_handle);
  sdkNavigationDimensionrestrictionReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationDimensionrestrictionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationDimensionrestrictionReleaseHandleNullable(handle);

// End of DimensionRestriction "private" section.


