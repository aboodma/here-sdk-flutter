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
import 'package:here_sdk/src/sdk/navigation/lane_access.dart';
import 'package:here_sdk/src/sdk/navigation/lane_direction_category.dart';
import 'package:here_sdk/src/sdk/navigation/lane_recommendation_state.dart';
import 'package:here_sdk/src/sdk/navigation/lane_type.dart';

/// A class that provides information for a lane.

class Lane {
  /// Indicates this lane's properties.
  LaneType type;

  /// Indicates towards which directions this lane leads.
  LaneDirectionCategory directionCategory;

  /// Indicates if this lane leads to the upcoming maneuvers.
  LaneRecommendationState recommendationState;

  /// Indicates which vehicle types can access this lane.
  LaneAccess access;

  Lane(this.type, this.directionCategory, this.recommendationState, this.access);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Lane) return false;
    Lane _other = other;
    return type == _other.type &&
        directionCategory == _other.directionCategory &&
        recommendationState == _other.recommendationState &&
        access == _other.access;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + type.hashCode;
    result = 31 * result + directionCategory.hashCode;
    result = 31 * result + recommendationState.hashCode;
    result = 31 * result + access.hashCode;
    return result;
  }
}


// Lane "private" section, not exported.

final _sdkNavigationLaneCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Uint32, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, int, Pointer<Void>)
  >('here_sdk_sdk_navigation_Lane_create_handle'));
final _sdkNavigationLaneReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Lane_release_handle'));
final _sdkNavigationLaneGetFieldtype = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Lane_get_field_type'));
final _sdkNavigationLaneGetFielddirectionCategory = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Lane_get_field_directionCategory'));
final _sdkNavigationLaneGetFieldrecommendationState = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Lane_get_field_recommendationState'));
final _sdkNavigationLaneGetFieldaccess = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Lane_get_field_access'));



Pointer<Void> sdkNavigationLaneToFfi(Lane value) {
  final _typeHandle = sdkNavigationLanetypeToFfi(value.type);
  final _directionCategoryHandle = sdkNavigationLanedirectioncategoryToFfi(value.directionCategory);
  final _recommendationStateHandle = sdkNavigationLanerecommendationstateToFfi(value.recommendationState);
  final _accessHandle = sdkNavigationLaneaccessToFfi(value.access);
  final _result = _sdkNavigationLaneCreateHandle(_typeHandle, _directionCategoryHandle, _recommendationStateHandle, _accessHandle);
  sdkNavigationLanetypeReleaseFfiHandle(_typeHandle);
  sdkNavigationLanedirectioncategoryReleaseFfiHandle(_directionCategoryHandle);
  sdkNavigationLanerecommendationstateReleaseFfiHandle(_recommendationStateHandle);
  sdkNavigationLaneaccessReleaseFfiHandle(_accessHandle);
  return _result;
}

Lane sdkNavigationLaneFromFfi(Pointer<Void> handle) {
  final _typeHandle = _sdkNavigationLaneGetFieldtype(handle);
  final _directionCategoryHandle = _sdkNavigationLaneGetFielddirectionCategory(handle);
  final _recommendationStateHandle = _sdkNavigationLaneGetFieldrecommendationState(handle);
  final _accessHandle = _sdkNavigationLaneGetFieldaccess(handle);
  try {
    return Lane(
      sdkNavigationLanetypeFromFfi(_typeHandle), 
      sdkNavigationLanedirectioncategoryFromFfi(_directionCategoryHandle), 
      sdkNavigationLanerecommendationstateFromFfi(_recommendationStateHandle), 
      sdkNavigationLaneaccessFromFfi(_accessHandle)
    );
  } finally {
    sdkNavigationLanetypeReleaseFfiHandle(_typeHandle);
    sdkNavigationLanedirectioncategoryReleaseFfiHandle(_directionCategoryHandle);
    sdkNavigationLanerecommendationstateReleaseFfiHandle(_recommendationStateHandle);
    sdkNavigationLaneaccessReleaseFfiHandle(_accessHandle);
  }
}

void sdkNavigationLaneReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationLaneReleaseHandle(handle);

// Nullable Lane

final _sdkNavigationLaneCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Lane_create_handle_nullable'));
final _sdkNavigationLaneReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Lane_release_handle_nullable'));
final _sdkNavigationLaneGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Lane_get_value_nullable'));

Pointer<Void> sdkNavigationLaneToFfiNullable(Lane? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationLaneToFfi(value);
  final result = _sdkNavigationLaneCreateHandleNullable(_handle);
  sdkNavigationLaneReleaseFfiHandle(_handle);
  return result;
}

Lane? sdkNavigationLaneFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationLaneGetValueNullable(handle);
  final result = sdkNavigationLaneFromFfi(_handle);
  sdkNavigationLaneReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationLaneReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationLaneReleaseHandleNullable(handle);

// End of Lane "private" section.


