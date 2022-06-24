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
import 'package:here_sdk/src/sdk/navigation/weight_restriction_type.dart';


class WeightRestriction {
  int valueInKilograms;

  WeightRestrictionType type;

  WeightRestriction(this.valueInKilograms, this.type);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WeightRestriction) return false;
    WeightRestriction _other = other;
    return valueInKilograms == _other.valueInKilograms &&
        type == _other.type;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + valueInKilograms.hashCode;
    result = 31 * result + type.hashCode;
    return result;
  }
}


// WeightRestriction "private" section, not exported.

final _sdkNavigationWeightrestrictionCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Uint32),
    Pointer<Void> Function(int, int)
  >('here_sdk_sdk_navigation_WeightRestriction_create_handle'));
final _sdkNavigationWeightrestrictionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_WeightRestriction_release_handle'));
final _sdkNavigationWeightrestrictionGetFieldvalueInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_WeightRestriction_get_field_valueInKilograms'));
final _sdkNavigationWeightrestrictionGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_WeightRestriction_get_field_type'));



Pointer<Void> sdkNavigationWeightrestrictionToFfi(WeightRestriction value) {
  final _valueInKilogramsHandle = (value.valueInKilograms);
  final _typeHandle = sdkNavigationWeightrestrictiontypeToFfi(value.type);
  final _result = _sdkNavigationWeightrestrictionCreateHandle(_valueInKilogramsHandle, _typeHandle);
  
  sdkNavigationWeightrestrictiontypeReleaseFfiHandle(_typeHandle);
  return _result;
}

WeightRestriction sdkNavigationWeightrestrictionFromFfi(Pointer<Void> handle) {
  final _valueInKilogramsHandle = _sdkNavigationWeightrestrictionGetFieldvalueInKilograms(handle);
  final _typeHandle = _sdkNavigationWeightrestrictionGetFieldtype(handle);
  try {
    return WeightRestriction(
      (_valueInKilogramsHandle), 
      sdkNavigationWeightrestrictiontypeFromFfi(_typeHandle)
    );
  } finally {
    
    sdkNavigationWeightrestrictiontypeReleaseFfiHandle(_typeHandle);
  }
}

void sdkNavigationWeightrestrictionReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationWeightrestrictionReleaseHandle(handle);

// Nullable WeightRestriction

final _sdkNavigationWeightrestrictionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_WeightRestriction_create_handle_nullable'));
final _sdkNavigationWeightrestrictionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_WeightRestriction_release_handle_nullable'));
final _sdkNavigationWeightrestrictionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_WeightRestriction_get_value_nullable'));

Pointer<Void> sdkNavigationWeightrestrictionToFfiNullable(WeightRestriction? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationWeightrestrictionToFfi(value);
  final result = _sdkNavigationWeightrestrictionCreateHandleNullable(_handle);
  sdkNavigationWeightrestrictionReleaseFfiHandle(_handle);
  return result;
}

WeightRestriction? sdkNavigationWeightrestrictionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationWeightrestrictionGetValueNullable(handle);
  final result = sdkNavigationWeightrestrictionFromFfi(_handle);
  sdkNavigationWeightrestrictionReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationWeightrestrictionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationWeightrestrictionReleaseHandleNullable(handle);

// End of WeightRestriction "private" section.


