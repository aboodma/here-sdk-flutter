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

/// A class which identifies the vehicle type(s) allowed to
/// access a lane.

class LaneAccess {
  /// Four-wheel vehicles that are allowed according to national/local vehicle regulations to drive
  /// on motorways, ranging from sub-compact cars to full-size vans and light road vehicles.
  bool automobiles;

  /// Buses that are used for public transportation.
  bool buses;

  /// Four-wheel vehicles that are usually fitted with a taximeter, that may be hired,
  /// along with their driver, to carry passengers to any specified destination.
  bool taxis;

  /// Represents the sharing of car journeys so that more than one person travels in a car, and
  /// prevents the need for others to have to drive to a location themselves.
  bool carpools;

  /// Persons traveling on foot, whether walking or running.
  bool pedestrians;

  /// Large vehicles that range from medium to heavy duty trucks.
  bool trucks;

  /// Passenger vehicles (i.e., those defined as passenger car/automobiles) that are
  /// allowed to access roads that have traffic restrictions.
  bool throughTraffic;

  /// Delivery [LaneAccess.trucks] that are permitted to enter the city proper
  /// to unload goods at businesses.
  bool deliveryVehicles;

  /// Any vehicle that is designated and authorized to respond to an emergency in a
  /// life-threatening situation.
  bool emergencyVehicles;

  /// Motorized two-wheeled passenger vehicles. Generally, mopeds are considered
  /// motorcycles.
  bool motorcycles;

  LaneAccess(this.automobiles, this.buses, this.taxis, this.carpools, this.pedestrians, this.trucks, this.throughTraffic, this.deliveryVehicles, this.emergencyVehicles, this.motorcycles);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LaneAccess) return false;
    LaneAccess _other = other;
    return automobiles == _other.automobiles &&
        buses == _other.buses &&
        taxis == _other.taxis &&
        carpools == _other.carpools &&
        pedestrians == _other.pedestrians &&
        trucks == _other.trucks &&
        throughTraffic == _other.throughTraffic &&
        deliveryVehicles == _other.deliveryVehicles &&
        emergencyVehicles == _other.emergencyVehicles &&
        motorcycles == _other.motorcycles;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + automobiles.hashCode;
    result = 31 * result + buses.hashCode;
    result = 31 * result + taxis.hashCode;
    result = 31 * result + carpools.hashCode;
    result = 31 * result + pedestrians.hashCode;
    result = 31 * result + trucks.hashCode;
    result = 31 * result + throughTraffic.hashCode;
    result = 31 * result + deliveryVehicles.hashCode;
    result = 31 * result + emergencyVehicles.hashCode;
    result = 31 * result + motorcycles.hashCode;
    return result;
  }
}


// LaneAccess "private" section, not exported.

final _sdkNavigationLaneaccessCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8),
    Pointer<Void> Function(int, int, int, int, int, int, int, int, int, int)
  >('here_sdk_sdk_navigation_LaneAccess_create_handle'));
final _sdkNavigationLaneaccessReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneAccess_release_handle'));
final _sdkNavigationLaneaccessGetFieldautomobiles = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneAccess_get_field_automobiles'));
final _sdkNavigationLaneaccessGetFieldbuses = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneAccess_get_field_buses'));
final _sdkNavigationLaneaccessGetFieldtaxis = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneAccess_get_field_taxis'));
final _sdkNavigationLaneaccessGetFieldcarpools = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneAccess_get_field_carpools'));
final _sdkNavigationLaneaccessGetFieldpedestrians = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneAccess_get_field_pedestrians'));
final _sdkNavigationLaneaccessGetFieldtrucks = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneAccess_get_field_trucks'));
final _sdkNavigationLaneaccessGetFieldthroughTraffic = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneAccess_get_field_throughTraffic'));
final _sdkNavigationLaneaccessGetFielddeliveryVehicles = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneAccess_get_field_deliveryVehicles'));
final _sdkNavigationLaneaccessGetFieldemergencyVehicles = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneAccess_get_field_emergencyVehicles'));
final _sdkNavigationLaneaccessGetFieldmotorcycles = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneAccess_get_field_motorcycles'));



Pointer<Void> sdkNavigationLaneaccessToFfi(LaneAccess value) {
  final _automobilesHandle = booleanToFfi(value.automobiles);
  final _busesHandle = booleanToFfi(value.buses);
  final _taxisHandle = booleanToFfi(value.taxis);
  final _carpoolsHandle = booleanToFfi(value.carpools);
  final _pedestriansHandle = booleanToFfi(value.pedestrians);
  final _trucksHandle = booleanToFfi(value.trucks);
  final _throughTrafficHandle = booleanToFfi(value.throughTraffic);
  final _deliveryVehiclesHandle = booleanToFfi(value.deliveryVehicles);
  final _emergencyVehiclesHandle = booleanToFfi(value.emergencyVehicles);
  final _motorcyclesHandle = booleanToFfi(value.motorcycles);
  final _result = _sdkNavigationLaneaccessCreateHandle(_automobilesHandle, _busesHandle, _taxisHandle, _carpoolsHandle, _pedestriansHandle, _trucksHandle, _throughTrafficHandle, _deliveryVehiclesHandle, _emergencyVehiclesHandle, _motorcyclesHandle);
  booleanReleaseFfiHandle(_automobilesHandle);
  booleanReleaseFfiHandle(_busesHandle);
  booleanReleaseFfiHandle(_taxisHandle);
  booleanReleaseFfiHandle(_carpoolsHandle);
  booleanReleaseFfiHandle(_pedestriansHandle);
  booleanReleaseFfiHandle(_trucksHandle);
  booleanReleaseFfiHandle(_throughTrafficHandle);
  booleanReleaseFfiHandle(_deliveryVehiclesHandle);
  booleanReleaseFfiHandle(_emergencyVehiclesHandle);
  booleanReleaseFfiHandle(_motorcyclesHandle);
  return _result;
}

LaneAccess sdkNavigationLaneaccessFromFfi(Pointer<Void> handle) {
  final _automobilesHandle = _sdkNavigationLaneaccessGetFieldautomobiles(handle);
  final _busesHandle = _sdkNavigationLaneaccessGetFieldbuses(handle);
  final _taxisHandle = _sdkNavigationLaneaccessGetFieldtaxis(handle);
  final _carpoolsHandle = _sdkNavigationLaneaccessGetFieldcarpools(handle);
  final _pedestriansHandle = _sdkNavigationLaneaccessGetFieldpedestrians(handle);
  final _trucksHandle = _sdkNavigationLaneaccessGetFieldtrucks(handle);
  final _throughTrafficHandle = _sdkNavigationLaneaccessGetFieldthroughTraffic(handle);
  final _deliveryVehiclesHandle = _sdkNavigationLaneaccessGetFielddeliveryVehicles(handle);
  final _emergencyVehiclesHandle = _sdkNavigationLaneaccessGetFieldemergencyVehicles(handle);
  final _motorcyclesHandle = _sdkNavigationLaneaccessGetFieldmotorcycles(handle);
  try {
    return LaneAccess(
      booleanFromFfi(_automobilesHandle), 
      booleanFromFfi(_busesHandle), 
      booleanFromFfi(_taxisHandle), 
      booleanFromFfi(_carpoolsHandle), 
      booleanFromFfi(_pedestriansHandle), 
      booleanFromFfi(_trucksHandle), 
      booleanFromFfi(_throughTrafficHandle), 
      booleanFromFfi(_deliveryVehiclesHandle), 
      booleanFromFfi(_emergencyVehiclesHandle), 
      booleanFromFfi(_motorcyclesHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_automobilesHandle);
    booleanReleaseFfiHandle(_busesHandle);
    booleanReleaseFfiHandle(_taxisHandle);
    booleanReleaseFfiHandle(_carpoolsHandle);
    booleanReleaseFfiHandle(_pedestriansHandle);
    booleanReleaseFfiHandle(_trucksHandle);
    booleanReleaseFfiHandle(_throughTrafficHandle);
    booleanReleaseFfiHandle(_deliveryVehiclesHandle);
    booleanReleaseFfiHandle(_emergencyVehiclesHandle);
    booleanReleaseFfiHandle(_motorcyclesHandle);
  }
}

void sdkNavigationLaneaccessReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationLaneaccessReleaseHandle(handle);

// Nullable LaneAccess

final _sdkNavigationLaneaccessCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneAccess_create_handle_nullable'));
final _sdkNavigationLaneaccessReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneAccess_release_handle_nullable'));
final _sdkNavigationLaneaccessGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneAccess_get_value_nullable'));

Pointer<Void> sdkNavigationLaneaccessToFfiNullable(LaneAccess? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationLaneaccessToFfi(value);
  final result = _sdkNavigationLaneaccessCreateHandleNullable(_handle);
  sdkNavigationLaneaccessReleaseFfiHandle(_handle);
  return result;
}

LaneAccess? sdkNavigationLaneaccessFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationLaneaccessGetValueNullable(handle);
  final result = sdkNavigationLaneaccessFromFfi(_handle);
  sdkNavigationLaneaccessReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationLaneaccessReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationLaneaccessReleaseHandleNullable(handle);

// End of LaneAccess "private" section.


