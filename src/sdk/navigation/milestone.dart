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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';

/// Represents information about the waypoints along the route.
///
/// Note that this can include additional waypoints added during route
/// calculation that may not have been part of the original user-defined
/// waypoint list. For example, additional waypoints are added automatically
/// between sections that require a different transport mode like when taking a
/// ferry.

class Milestone {
  /// Index of the section on the route.
  int sectionIndex;

  /// If present, this index corresponds to the waypoint in the original
  /// user-defined waypoint list. Otherwise this waypoint was added during
  /// route calculation by the system.
  int? waypointIndex;

  /// User-defined geographic coordinates. If not available, this waypoint was
  /// added during route calculation.
  GeoCoordinates? originalCoordinates;

  /// Map-matched geographic coordinates.
  GeoCoordinates mapMatchedCoordinates;

  Milestone(this.sectionIndex, this.waypointIndex, this.originalCoordinates, this.mapMatchedCoordinates);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Milestone) return false;
    Milestone _other = other;
    return sectionIndex == _other.sectionIndex &&
        waypointIndex == _other.waypointIndex &&
        originalCoordinates == _other.originalCoordinates &&
        mapMatchedCoordinates == _other.mapMatchedCoordinates;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + sectionIndex.hashCode;
    result = 31 * result + waypointIndex.hashCode;
    result = 31 * result + originalCoordinates.hashCode;
    result = 31 * result + mapMatchedCoordinates.hashCode;
    return result;
  }
}


// Milestone "private" section, not exported.

final _sdkNavigationMilestoneCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_Milestone_create_handle'));
final _sdkNavigationMilestoneReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Milestone_release_handle'));
final _sdkNavigationMilestoneGetFieldsectionIndex = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Milestone_get_field_sectionIndex'));
final _sdkNavigationMilestoneGetFieldwaypointIndex = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Milestone_get_field_waypointIndex'));
final _sdkNavigationMilestoneGetFieldoriginalCoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Milestone_get_field_originalCoordinates'));
final _sdkNavigationMilestoneGetFieldmapMatchedCoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Milestone_get_field_mapMatchedCoordinates'));



Pointer<Void> sdkNavigationMilestoneToFfi(Milestone value) {
  final _sectionIndexHandle = (value.sectionIndex);
  final _waypointIndexHandle = intToFfiNullable(value.waypointIndex);
  final _originalCoordinatesHandle = sdkCoreGeocoordinatesToFfiNullable(value.originalCoordinates);
  final _mapMatchedCoordinatesHandle = sdkCoreGeocoordinatesToFfi(value.mapMatchedCoordinates);
  final _result = _sdkNavigationMilestoneCreateHandle(_sectionIndexHandle, _waypointIndexHandle, _originalCoordinatesHandle, _mapMatchedCoordinatesHandle);
  
  intReleaseFfiHandleNullable(_waypointIndexHandle);
  sdkCoreGeocoordinatesReleaseFfiHandleNullable(_originalCoordinatesHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_mapMatchedCoordinatesHandle);
  return _result;
}

Milestone sdkNavigationMilestoneFromFfi(Pointer<Void> handle) {
  final _sectionIndexHandle = _sdkNavigationMilestoneGetFieldsectionIndex(handle);
  final _waypointIndexHandle = _sdkNavigationMilestoneGetFieldwaypointIndex(handle);
  final _originalCoordinatesHandle = _sdkNavigationMilestoneGetFieldoriginalCoordinates(handle);
  final _mapMatchedCoordinatesHandle = _sdkNavigationMilestoneGetFieldmapMatchedCoordinates(handle);
  try {
    return Milestone(
      (_sectionIndexHandle), 
      intFromFfiNullable(_waypointIndexHandle), 
      sdkCoreGeocoordinatesFromFfiNullable(_originalCoordinatesHandle), 
      sdkCoreGeocoordinatesFromFfi(_mapMatchedCoordinatesHandle)
    );
  } finally {
    
    intReleaseFfiHandleNullable(_waypointIndexHandle);
    sdkCoreGeocoordinatesReleaseFfiHandleNullable(_originalCoordinatesHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_mapMatchedCoordinatesHandle);
  }
}

void sdkNavigationMilestoneReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationMilestoneReleaseHandle(handle);

// Nullable Milestone

final _sdkNavigationMilestoneCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Milestone_create_handle_nullable'));
final _sdkNavigationMilestoneReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Milestone_release_handle_nullable'));
final _sdkNavigationMilestoneGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_Milestone_get_value_nullable'));

Pointer<Void> sdkNavigationMilestoneToFfiNullable(Milestone? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationMilestoneToFfi(value);
  final result = _sdkNavigationMilestoneCreateHandleNullable(_handle);
  sdkNavigationMilestoneReleaseFfiHandle(_handle);
  return result;
}

Milestone? sdkNavigationMilestoneFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationMilestoneGetValueNullable(handle);
  final result = sdkNavigationMilestoneFromFfi(_handle);
  sdkNavigationMilestoneReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationMilestoneReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationMilestoneReleaseHandleNullable(handle);

// End of Milestone "private" section.


