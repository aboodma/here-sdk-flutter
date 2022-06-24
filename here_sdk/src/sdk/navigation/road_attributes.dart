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

/// Road attributes, including usage and physical characteristics.
///
/// Note that a road can have more than one attribute at the same time.

class RoadAttributes {
  /// Indicates whether the navigable segment is paved.
  /// Paved is primarily used for map display and routing by assigning
  /// higher penalties to unpaved roads.
  /// Paved roads are made of concrete, asphalt, cobblestone or brick.
  /// Unpaved roads do not have a solid surface, e.g. are made of gravel, dirt or grass.
  bool isDirtRoad;

  /// Identifies an enclosed (on all sides) passageway through or under an obstruction.
  /// This attribute can be used for display or route guidance.
  bool isTunnel;

  /// Identifies a structure that allows a road, railway, or walkway
  /// to pass over another road, railway, waterway, or valley serving
  /// map display and route guidance functionalities.
  /// Bridge is published on segments that represent significant
  /// bridges and/or overpasses; elevated roads are not published as bridge.
  bool isBridge;

  /// Range is a ramp: connects roads that do not intersect at grade.
  /// Ramp allows explication of maneuvers involving ramps (e.g., “Take the ramp”)
  /// and for route guidance when determining if sign text should be used.
  bool isRamp;

  /// Controlled access roads are roads with limited entrances and exits
  /// that allow uninterrupted high-speed traffic flow.
  /// For example, the Interstate/Freeway network in the United States or
  /// the Motorway network in Europe.
  /// Controlled Access can be used for map display, avoidance of freeway/motorway,
  /// publishing speed limits, and route guidance timing.
  bool isControlledAccess;

  /// Private identifies roads that are not maintained by an organization
  /// responsible for maintenance of public roads.
  /// Allows for unique cartographic representation of roads that restrict public use.
  /// May be used to avoid routing through a private road.
  bool isPrivate;

  /// Identifies a no through road. This can also be a part of the route you can only enter or leave if it’s a waypoint.
  bool isNoThrough;

  /// Identifies a road for which a fee must be paid to use the road.
  /// Tollway may be used for map display (e.g., different rendering of toll roads) and routing.
  /// Tollway is flagged on roads that require a fee for traversal.
  bool isTollway;

  /// Indicates if there is a physical structure or painted road marking intended to legally
  /// prohibit left turns in right-side driving countries, right turns in left-side driving
  /// countries, and U-turns at divided intersections or in the middle of divided segments.
  bool isDividedRoad;

  /// Indicates if vehicles have to drive on the right-hand side of the road or the left-hand side.
  /// For example, in New York it is always true and in London always false as the United Kingdom is
  /// a left-hand driving country.
  bool isRightDrivingSide;

  /// Indicates the presence of a roundabout.
  bool isRoundabout;

  RoadAttributes.withDefaults()
      : isDirtRoad = false, isTunnel = false, isBridge = false, isRamp = false, isControlledAccess = false, isPrivate = false, isNoThrough = false, isTollway = false, isDividedRoad = false, isRightDrivingSide = false, isRoundabout = false;
  @Deprecated("Will be removed in v4.13.0. Please use `withDefaults()` constructor instead.")
  RoadAttributes(this.isDirtRoad, this.isTunnel, this.isBridge, this.isRamp, this.isControlledAccess, this.isPrivate, this.isNoThrough, this.isTollway, this.isDividedRoad, this.isRightDrivingSide, this.isRoundabout);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RoadAttributes) return false;
    RoadAttributes _other = other;
    return isDirtRoad == _other.isDirtRoad &&
        isTunnel == _other.isTunnel &&
        isBridge == _other.isBridge &&
        isRamp == _other.isRamp &&
        isControlledAccess == _other.isControlledAccess &&
        isPrivate == _other.isPrivate &&
        isNoThrough == _other.isNoThrough &&
        isTollway == _other.isTollway &&
        isDividedRoad == _other.isDividedRoad &&
        isRightDrivingSide == _other.isRightDrivingSide &&
        isRoundabout == _other.isRoundabout;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + isDirtRoad.hashCode;
    result = 31 * result + isTunnel.hashCode;
    result = 31 * result + isBridge.hashCode;
    result = 31 * result + isRamp.hashCode;
    result = 31 * result + isControlledAccess.hashCode;
    result = 31 * result + isPrivate.hashCode;
    result = 31 * result + isNoThrough.hashCode;
    result = 31 * result + isTollway.hashCode;
    result = 31 * result + isDividedRoad.hashCode;
    result = 31 * result + isRightDrivingSide.hashCode;
    result = 31 * result + isRoundabout.hashCode;
    return result;
  }
}


// RoadAttributes "private" section, not exported.

final _sdkNavigationRoadattributesCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8),
    Pointer<Void> Function(int, int, int, int, int, int, int, int, int, int, int)
  >('here_sdk_sdk_navigation_RoadAttributes_create_handle'));
final _sdkNavigationRoadattributesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributes_release_handle'));
final _sdkNavigationRoadattributesGetFieldisDirtRoad = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributes_get_field_isDirtRoad'));
final _sdkNavigationRoadattributesGetFieldisTunnel = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributes_get_field_isTunnel'));
final _sdkNavigationRoadattributesGetFieldisBridge = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributes_get_field_isBridge'));
final _sdkNavigationRoadattributesGetFieldisRamp = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributes_get_field_isRamp'));
final _sdkNavigationRoadattributesGetFieldisControlledAccess = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributes_get_field_isControlledAccess'));
final _sdkNavigationRoadattributesGetFieldisPrivate = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributes_get_field_isPrivate'));
final _sdkNavigationRoadattributesGetFieldisNoThrough = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributes_get_field_isNoThrough'));
final _sdkNavigationRoadattributesGetFieldisTollway = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributes_get_field_isTollway'));
final _sdkNavigationRoadattributesGetFieldisDividedRoad = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributes_get_field_isDividedRoad'));
final _sdkNavigationRoadattributesGetFieldisRightDrivingSide = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributes_get_field_isRightDrivingSide'));
final _sdkNavigationRoadattributesGetFieldisRoundabout = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributes_get_field_isRoundabout'));



Pointer<Void> sdkNavigationRoadattributesToFfi(RoadAttributes value) {
  final _isDirtRoadHandle = booleanToFfi(value.isDirtRoad);
  final _isTunnelHandle = booleanToFfi(value.isTunnel);
  final _isBridgeHandle = booleanToFfi(value.isBridge);
  final _isRampHandle = booleanToFfi(value.isRamp);
  final _isControlledAccessHandle = booleanToFfi(value.isControlledAccess);
  final _isPrivateHandle = booleanToFfi(value.isPrivate);
  final _isNoThroughHandle = booleanToFfi(value.isNoThrough);
  final _isTollwayHandle = booleanToFfi(value.isTollway);
  final _isDividedRoadHandle = booleanToFfi(value.isDividedRoad);
  final _isRightDrivingSideHandle = booleanToFfi(value.isRightDrivingSide);
  final _isRoundaboutHandle = booleanToFfi(value.isRoundabout);
  final _result = _sdkNavigationRoadattributesCreateHandle(_isDirtRoadHandle, _isTunnelHandle, _isBridgeHandle, _isRampHandle, _isControlledAccessHandle, _isPrivateHandle, _isNoThroughHandle, _isTollwayHandle, _isDividedRoadHandle, _isRightDrivingSideHandle, _isRoundaboutHandle);
  booleanReleaseFfiHandle(_isDirtRoadHandle);
  booleanReleaseFfiHandle(_isTunnelHandle);
  booleanReleaseFfiHandle(_isBridgeHandle);
  booleanReleaseFfiHandle(_isRampHandle);
  booleanReleaseFfiHandle(_isControlledAccessHandle);
  booleanReleaseFfiHandle(_isPrivateHandle);
  booleanReleaseFfiHandle(_isNoThroughHandle);
  booleanReleaseFfiHandle(_isTollwayHandle);
  booleanReleaseFfiHandle(_isDividedRoadHandle);
  booleanReleaseFfiHandle(_isRightDrivingSideHandle);
  booleanReleaseFfiHandle(_isRoundaboutHandle);
  return _result;
}

RoadAttributes sdkNavigationRoadattributesFromFfi(Pointer<Void> handle) {
  final _isDirtRoadHandle = _sdkNavigationRoadattributesGetFieldisDirtRoad(handle);
  final _isTunnelHandle = _sdkNavigationRoadattributesGetFieldisTunnel(handle);
  final _isBridgeHandle = _sdkNavigationRoadattributesGetFieldisBridge(handle);
  final _isRampHandle = _sdkNavigationRoadattributesGetFieldisRamp(handle);
  final _isControlledAccessHandle = _sdkNavigationRoadattributesGetFieldisControlledAccess(handle);
  final _isPrivateHandle = _sdkNavigationRoadattributesGetFieldisPrivate(handle);
  final _isNoThroughHandle = _sdkNavigationRoadattributesGetFieldisNoThrough(handle);
  final _isTollwayHandle = _sdkNavigationRoadattributesGetFieldisTollway(handle);
  final _isDividedRoadHandle = _sdkNavigationRoadattributesGetFieldisDividedRoad(handle);
  final _isRightDrivingSideHandle = _sdkNavigationRoadattributesGetFieldisRightDrivingSide(handle);
  final _isRoundaboutHandle = _sdkNavigationRoadattributesGetFieldisRoundabout(handle);
  try {
    return RoadAttributes(
      booleanFromFfi(_isDirtRoadHandle), 
      booleanFromFfi(_isTunnelHandle), 
      booleanFromFfi(_isBridgeHandle), 
      booleanFromFfi(_isRampHandle), 
      booleanFromFfi(_isControlledAccessHandle), 
      booleanFromFfi(_isPrivateHandle), 
      booleanFromFfi(_isNoThroughHandle), 
      booleanFromFfi(_isTollwayHandle), 
      booleanFromFfi(_isDividedRoadHandle), 
      booleanFromFfi(_isRightDrivingSideHandle), 
      booleanFromFfi(_isRoundaboutHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_isDirtRoadHandle);
    booleanReleaseFfiHandle(_isTunnelHandle);
    booleanReleaseFfiHandle(_isBridgeHandle);
    booleanReleaseFfiHandle(_isRampHandle);
    booleanReleaseFfiHandle(_isControlledAccessHandle);
    booleanReleaseFfiHandle(_isPrivateHandle);
    booleanReleaseFfiHandle(_isNoThroughHandle);
    booleanReleaseFfiHandle(_isTollwayHandle);
    booleanReleaseFfiHandle(_isDividedRoadHandle);
    booleanReleaseFfiHandle(_isRightDrivingSideHandle);
    booleanReleaseFfiHandle(_isRoundaboutHandle);
  }
}

void sdkNavigationRoadattributesReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationRoadattributesReleaseHandle(handle);

// Nullable RoadAttributes

final _sdkNavigationRoadattributesCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributes_create_handle_nullable'));
final _sdkNavigationRoadattributesReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributes_release_handle_nullable'));
final _sdkNavigationRoadattributesGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RoadAttributes_get_value_nullable'));

Pointer<Void> sdkNavigationRoadattributesToFfiNullable(RoadAttributes? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRoadattributesToFfi(value);
  final result = _sdkNavigationRoadattributesCreateHandleNullable(_handle);
  sdkNavigationRoadattributesReleaseFfiHandle(_handle);
  return result;
}

RoadAttributes? sdkNavigationRoadattributesFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRoadattributesGetValueNullable(handle);
  final result = sdkNavigationRoadattributesFromFfi(_handle);
  sdkNavigationRoadattributesReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRoadattributesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRoadattributesReleaseHandleNullable(handle);

// End of RoadAttributes "private" section.


