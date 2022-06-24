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
import 'package:here_sdk/src/sdk/navigation/dimension_restriction.dart';
import 'package:here_sdk/src/sdk/navigation/distance_type.dart';
import 'package:here_sdk/src/sdk/navigation/weight_restriction.dart';

/// Represents truck restrictions.
///
/// For example, there can be a bridge ahead not high enough to pass a big truck
/// or there can be a road ahead where the weight of the truck is beyond it's permissible weight.

class TruckRestrictionWarning {
  /// The distance from the current location to the restriction.
  double distanceInMeters;

  /// Weight restriction.
  /// It is `null` when there is no known weight restriction ahead.
  WeightRestriction? weightRestriction;

  /// Vehicle dimension restrictions.
  /// It is `null` when there is no known dimension restriction ahead.
  DimensionRestriction? dimensionRestriction;

  /// Indicates if the specified truck restriction is ahead of the vehicle or has just passed by. If it is ahead, then [TruckRestrictionWarning.distanceInMeters] is greater than 0.
  DistanceType distanceType;

  TruckRestrictionWarning(this.distanceInMeters, this.weightRestriction, this.dimensionRestriction, this.distanceType);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TruckRestrictionWarning) return false;
    TruckRestrictionWarning _other = other;
    return distanceInMeters == _other.distanceInMeters &&
        weightRestriction == _other.weightRestriction &&
        dimensionRestriction == _other.dimensionRestriction &&
        distanceType == _other.distanceType;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + distanceInMeters.hashCode;
    result = 31 * result + weightRestriction.hashCode;
    result = 31 * result + dimensionRestriction.hashCode;
    result = 31 * result + distanceType.hashCode;
    return result;
  }
}


// TruckRestrictionWarning "private" section, not exported.

final _sdkNavigationTruckrestrictionwarningCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Pointer<Void>, Pointer<Void>, Uint32),
    Pointer<Void> Function(double, Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_create_handle'));
final _sdkNavigationTruckrestrictionwarningReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_release_handle'));
final _sdkNavigationTruckrestrictionwarningGetFielddistanceInMeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_field_distanceInMeters'));
final _sdkNavigationTruckrestrictionwarningGetFieldweightRestriction = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_field_weightRestriction'));
final _sdkNavigationTruckrestrictionwarningGetFielddimensionRestriction = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_field_dimensionRestriction'));
final _sdkNavigationTruckrestrictionwarningGetFielddistanceType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_field_distanceType'));



Pointer<Void> sdkNavigationTruckrestrictionwarningToFfi(TruckRestrictionWarning value) {
  final _distanceInMetersHandle = (value.distanceInMeters);
  final _weightRestrictionHandle = sdkNavigationWeightrestrictionToFfiNullable(value.weightRestriction);
  final _dimensionRestrictionHandle = sdkNavigationDimensionrestrictionToFfiNullable(value.dimensionRestriction);
  final _distanceTypeHandle = sdkNavigationDistancetypeToFfi(value.distanceType);
  final _result = _sdkNavigationTruckrestrictionwarningCreateHandle(_distanceInMetersHandle, _weightRestrictionHandle, _dimensionRestrictionHandle, _distanceTypeHandle);
  
  sdkNavigationWeightrestrictionReleaseFfiHandleNullable(_weightRestrictionHandle);
  sdkNavigationDimensionrestrictionReleaseFfiHandleNullable(_dimensionRestrictionHandle);
  sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  return _result;
}

TruckRestrictionWarning sdkNavigationTruckrestrictionwarningFromFfi(Pointer<Void> handle) {
  final _distanceInMetersHandle = _sdkNavigationTruckrestrictionwarningGetFielddistanceInMeters(handle);
  final _weightRestrictionHandle = _sdkNavigationTruckrestrictionwarningGetFieldweightRestriction(handle);
  final _dimensionRestrictionHandle = _sdkNavigationTruckrestrictionwarningGetFielddimensionRestriction(handle);
  final _distanceTypeHandle = _sdkNavigationTruckrestrictionwarningGetFielddistanceType(handle);
  try {
    return TruckRestrictionWarning(
      (_distanceInMetersHandle), 
      sdkNavigationWeightrestrictionFromFfiNullable(_weightRestrictionHandle), 
      sdkNavigationDimensionrestrictionFromFfiNullable(_dimensionRestrictionHandle), 
      sdkNavigationDistancetypeFromFfi(_distanceTypeHandle)
    );
  } finally {
    
    sdkNavigationWeightrestrictionReleaseFfiHandleNullable(_weightRestrictionHandle);
    sdkNavigationDimensionrestrictionReleaseFfiHandleNullable(_dimensionRestrictionHandle);
    sdkNavigationDistancetypeReleaseFfiHandle(_distanceTypeHandle);
  }
}

void sdkNavigationTruckrestrictionwarningReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationTruckrestrictionwarningReleaseHandle(handle);

// Nullable TruckRestrictionWarning

final _sdkNavigationTruckrestrictionwarningCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_create_handle_nullable'));
final _sdkNavigationTruckrestrictionwarningReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_release_handle_nullable'));
final _sdkNavigationTruckrestrictionwarningGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_TruckRestrictionWarning_get_value_nullable'));

Pointer<Void> sdkNavigationTruckrestrictionwarningToFfiNullable(TruckRestrictionWarning? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationTruckrestrictionwarningToFfi(value);
  final result = _sdkNavigationTruckrestrictionwarningCreateHandleNullable(_handle);
  sdkNavigationTruckrestrictionwarningReleaseFfiHandle(_handle);
  return result;
}

TruckRestrictionWarning? sdkNavigationTruckrestrictionwarningFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationTruckrestrictionwarningGetValueNullable(handle);
  final result = sdkNavigationTruckrestrictionwarningFromFfi(_handle);
  sdkNavigationTruckrestrictionwarningReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationTruckrestrictionwarningReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationTruckrestrictionwarningReleaseHandleNullable(handle);

// End of TruckRestrictionWarning "private" section.


