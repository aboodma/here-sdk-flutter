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

/// A class that provides information on the available lane properties.
///
/// The lane type values can be combined as follows:
///
/// - High Occupancy Vehicle, Reversible
/// - High Occupancy Vehicle and Express
/// - Reversible and Express
/// - High Occupancy Vehicle, Reversible and Express
/// - High Occupancy Vehicle and Acceleration
/// - Reversible, Acceleration Lane
/// - High Occupancy Vehicle, Reversible, Acceleration Lane
/// - Express and Acceleration
/// - High Occupancy Vehicle and Deceleration
/// - Reversible, Deceleration Lane
/// - High Occupancy Vehicle, Reversible, Deceleration Lane
/// - Express and Deceleration

class LaneType {
  /// Regular lane is a lane that does not have a specific use.
  bool isRegular;

  /// A lane which is restricted for high occupancy vehicles.
  /// Note: High occupancy vehicles are vehicles with a driver and one or more passengers.
  bool isHighOccupancyVehicle;

  /// A lane in which traffic may travel in either direction, depending on certain conditions
  /// such as the time of the day to improve traffic flow during rush hours.
  bool isReversible;

  /// Express lane is a lane or set of lanes usually physically separated from the major roadway
  /// with limited entry and exit points to quickly move traffic in and out of a major metropolitan
  /// city. An express lane can be reversible, bidirectional, or one-way.
  bool isExpress;

  /// An acceleration lane is a lane, typically on the right side of a roadway, that lets a vehicle
  /// increase its speed to where it can safely merge with ongoing traffic. These lanes can be
  /// accessed from ramps, rest areas, or weigh stations.
  bool isAcceleration;

  /// A deceleration lane is the same as an acceleration lane but used for the opposite scenario.
  bool isDeceleration;

  /// An auxiliary lane is a lane that runs parallel to a motorway and connects the entrance
  /// ramp/acceleration lane from one interchange exit ramp/deceleration lane of the next
  /// interchange.
  bool isAuxiliary;

  /// A slow lane, also known as truck (US) or crawler lane (UK), is a lane on long and/or steep
  /// uphill/downhill stretches of high-speed roads that is designated to facilitate slow traffic.
  bool isSlow;

  /// A passing lane is a lane that can occur on steep mountain grades or other roads where
  /// overtaking needs to be regulated for safety (i.e., curvy roads). They are used to safely pass
  /// slow moving vehicles.
  bool isPassing;

  /// A shoulder lane is a reserved paved area on the side of the road (one or both sides) that is
  /// not generally used for driving, although it is possible under certain circumstances.
  bool isShoulder;

  /// A regulated lane access is a lane designated as a holding zone, used to regulate traffic
  /// using time intervals. Regulated lane access is only coded for truck holding zones that are
  /// used to regulate truck access into tunnels and over bridges using time intervals (e.g., some
  /// tunnel accesses in Switzerland).
  bool isRegulatedAccess;

  /// Turn lane is a dedicated lane that is used for making a turn in order not to disrupt ongoing
  /// traffic.
  bool isTurn;

  /// Center turn lane is a bidirectional turn lane located in the middle of a road that allows
  /// traffic in both directions to turn left (right for left side driving countries).
  bool isCenterTurn;

  /// Truck parking lanes is a wide shoulder lane that may be used for truck parking as well as for
  /// emergency.
  bool isTruckParking;

  /// Parking lanes are portions of the road bed that may be used for parking legally. They may
  /// allow vehicles to use them as driving lanes at times, though.
  bool isParking;

  /// Variable driving lanes are lanes added to a road that open and close to accommodate traffic
  /// volume and flow using variable indicators.
  bool isVariableDriving;

  /// Bicycle lanes are lanes added to the road bed that only allow bicycle travel as indicated by
  /// lane markings, signs, buffers or barriers.
  bool isBicycle;

  LaneType(this.isRegular, this.isHighOccupancyVehicle, this.isReversible, this.isExpress, this.isAcceleration, this.isDeceleration, this.isAuxiliary, this.isSlow, this.isPassing, this.isShoulder, this.isRegulatedAccess, this.isTurn, this.isCenterTurn, this.isTruckParking, this.isParking, this.isVariableDriving, this.isBicycle);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LaneType) return false;
    LaneType _other = other;
    return isRegular == _other.isRegular &&
        isHighOccupancyVehicle == _other.isHighOccupancyVehicle &&
        isReversible == _other.isReversible &&
        isExpress == _other.isExpress &&
        isAcceleration == _other.isAcceleration &&
        isDeceleration == _other.isDeceleration &&
        isAuxiliary == _other.isAuxiliary &&
        isSlow == _other.isSlow &&
        isPassing == _other.isPassing &&
        isShoulder == _other.isShoulder &&
        isRegulatedAccess == _other.isRegulatedAccess &&
        isTurn == _other.isTurn &&
        isCenterTurn == _other.isCenterTurn &&
        isTruckParking == _other.isTruckParking &&
        isParking == _other.isParking &&
        isVariableDriving == _other.isVariableDriving &&
        isBicycle == _other.isBicycle;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + isRegular.hashCode;
    result = 31 * result + isHighOccupancyVehicle.hashCode;
    result = 31 * result + isReversible.hashCode;
    result = 31 * result + isExpress.hashCode;
    result = 31 * result + isAcceleration.hashCode;
    result = 31 * result + isDeceleration.hashCode;
    result = 31 * result + isAuxiliary.hashCode;
    result = 31 * result + isSlow.hashCode;
    result = 31 * result + isPassing.hashCode;
    result = 31 * result + isShoulder.hashCode;
    result = 31 * result + isRegulatedAccess.hashCode;
    result = 31 * result + isTurn.hashCode;
    result = 31 * result + isCenterTurn.hashCode;
    result = 31 * result + isTruckParking.hashCode;
    result = 31 * result + isParking.hashCode;
    result = 31 * result + isVariableDriving.hashCode;
    result = 31 * result + isBicycle.hashCode;
    return result;
  }
}


// LaneType "private" section, not exported.

final _sdkNavigationLanetypeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8),
    Pointer<Void> Function(int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int, int)
  >('here_sdk_sdk_navigation_LaneType_create_handle'));
final _sdkNavigationLanetypeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_release_handle'));
final _sdkNavigationLanetypeGetFieldisRegular = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isRegular'));
final _sdkNavigationLanetypeGetFieldisHighOccupancyVehicle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isHighOccupancyVehicle'));
final _sdkNavigationLanetypeGetFieldisReversible = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isReversible'));
final _sdkNavigationLanetypeGetFieldisExpress = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isExpress'));
final _sdkNavigationLanetypeGetFieldisAcceleration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isAcceleration'));
final _sdkNavigationLanetypeGetFieldisDeceleration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isDeceleration'));
final _sdkNavigationLanetypeGetFieldisAuxiliary = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isAuxiliary'));
final _sdkNavigationLanetypeGetFieldisSlow = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isSlow'));
final _sdkNavigationLanetypeGetFieldisPassing = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isPassing'));
final _sdkNavigationLanetypeGetFieldisShoulder = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isShoulder'));
final _sdkNavigationLanetypeGetFieldisRegulatedAccess = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isRegulatedAccess'));
final _sdkNavigationLanetypeGetFieldisTurn = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isTurn'));
final _sdkNavigationLanetypeGetFieldisCenterTurn = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isCenterTurn'));
final _sdkNavigationLanetypeGetFieldisTruckParking = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isTruckParking'));
final _sdkNavigationLanetypeGetFieldisParking = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isParking'));
final _sdkNavigationLanetypeGetFieldisVariableDriving = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isVariableDriving'));
final _sdkNavigationLanetypeGetFieldisBicycle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_field_isBicycle'));



Pointer<Void> sdkNavigationLanetypeToFfi(LaneType value) {
  final _isRegularHandle = booleanToFfi(value.isRegular);
  final _isHighOccupancyVehicleHandle = booleanToFfi(value.isHighOccupancyVehicle);
  final _isReversibleHandle = booleanToFfi(value.isReversible);
  final _isExpressHandle = booleanToFfi(value.isExpress);
  final _isAccelerationHandle = booleanToFfi(value.isAcceleration);
  final _isDecelerationHandle = booleanToFfi(value.isDeceleration);
  final _isAuxiliaryHandle = booleanToFfi(value.isAuxiliary);
  final _isSlowHandle = booleanToFfi(value.isSlow);
  final _isPassingHandle = booleanToFfi(value.isPassing);
  final _isShoulderHandle = booleanToFfi(value.isShoulder);
  final _isRegulatedAccessHandle = booleanToFfi(value.isRegulatedAccess);
  final _isTurnHandle = booleanToFfi(value.isTurn);
  final _isCenterTurnHandle = booleanToFfi(value.isCenterTurn);
  final _isTruckParkingHandle = booleanToFfi(value.isTruckParking);
  final _isParkingHandle = booleanToFfi(value.isParking);
  final _isVariableDrivingHandle = booleanToFfi(value.isVariableDriving);
  final _isBicycleHandle = booleanToFfi(value.isBicycle);
  final _result = _sdkNavigationLanetypeCreateHandle(_isRegularHandle, _isHighOccupancyVehicleHandle, _isReversibleHandle, _isExpressHandle, _isAccelerationHandle, _isDecelerationHandle, _isAuxiliaryHandle, _isSlowHandle, _isPassingHandle, _isShoulderHandle, _isRegulatedAccessHandle, _isTurnHandle, _isCenterTurnHandle, _isTruckParkingHandle, _isParkingHandle, _isVariableDrivingHandle, _isBicycleHandle);
  booleanReleaseFfiHandle(_isRegularHandle);
  booleanReleaseFfiHandle(_isHighOccupancyVehicleHandle);
  booleanReleaseFfiHandle(_isReversibleHandle);
  booleanReleaseFfiHandle(_isExpressHandle);
  booleanReleaseFfiHandle(_isAccelerationHandle);
  booleanReleaseFfiHandle(_isDecelerationHandle);
  booleanReleaseFfiHandle(_isAuxiliaryHandle);
  booleanReleaseFfiHandle(_isSlowHandle);
  booleanReleaseFfiHandle(_isPassingHandle);
  booleanReleaseFfiHandle(_isShoulderHandle);
  booleanReleaseFfiHandle(_isRegulatedAccessHandle);
  booleanReleaseFfiHandle(_isTurnHandle);
  booleanReleaseFfiHandle(_isCenterTurnHandle);
  booleanReleaseFfiHandle(_isTruckParkingHandle);
  booleanReleaseFfiHandle(_isParkingHandle);
  booleanReleaseFfiHandle(_isVariableDrivingHandle);
  booleanReleaseFfiHandle(_isBicycleHandle);
  return _result;
}

LaneType sdkNavigationLanetypeFromFfi(Pointer<Void> handle) {
  final _isRegularHandle = _sdkNavigationLanetypeGetFieldisRegular(handle);
  final _isHighOccupancyVehicleHandle = _sdkNavigationLanetypeGetFieldisHighOccupancyVehicle(handle);
  final _isReversibleHandle = _sdkNavigationLanetypeGetFieldisReversible(handle);
  final _isExpressHandle = _sdkNavigationLanetypeGetFieldisExpress(handle);
  final _isAccelerationHandle = _sdkNavigationLanetypeGetFieldisAcceleration(handle);
  final _isDecelerationHandle = _sdkNavigationLanetypeGetFieldisDeceleration(handle);
  final _isAuxiliaryHandle = _sdkNavigationLanetypeGetFieldisAuxiliary(handle);
  final _isSlowHandle = _sdkNavigationLanetypeGetFieldisSlow(handle);
  final _isPassingHandle = _sdkNavigationLanetypeGetFieldisPassing(handle);
  final _isShoulderHandle = _sdkNavigationLanetypeGetFieldisShoulder(handle);
  final _isRegulatedAccessHandle = _sdkNavigationLanetypeGetFieldisRegulatedAccess(handle);
  final _isTurnHandle = _sdkNavigationLanetypeGetFieldisTurn(handle);
  final _isCenterTurnHandle = _sdkNavigationLanetypeGetFieldisCenterTurn(handle);
  final _isTruckParkingHandle = _sdkNavigationLanetypeGetFieldisTruckParking(handle);
  final _isParkingHandle = _sdkNavigationLanetypeGetFieldisParking(handle);
  final _isVariableDrivingHandle = _sdkNavigationLanetypeGetFieldisVariableDriving(handle);
  final _isBicycleHandle = _sdkNavigationLanetypeGetFieldisBicycle(handle);
  try {
    return LaneType(
      booleanFromFfi(_isRegularHandle), 
      booleanFromFfi(_isHighOccupancyVehicleHandle), 
      booleanFromFfi(_isReversibleHandle), 
      booleanFromFfi(_isExpressHandle), 
      booleanFromFfi(_isAccelerationHandle), 
      booleanFromFfi(_isDecelerationHandle), 
      booleanFromFfi(_isAuxiliaryHandle), 
      booleanFromFfi(_isSlowHandle), 
      booleanFromFfi(_isPassingHandle), 
      booleanFromFfi(_isShoulderHandle), 
      booleanFromFfi(_isRegulatedAccessHandle), 
      booleanFromFfi(_isTurnHandle), 
      booleanFromFfi(_isCenterTurnHandle), 
      booleanFromFfi(_isTruckParkingHandle), 
      booleanFromFfi(_isParkingHandle), 
      booleanFromFfi(_isVariableDrivingHandle), 
      booleanFromFfi(_isBicycleHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_isRegularHandle);
    booleanReleaseFfiHandle(_isHighOccupancyVehicleHandle);
    booleanReleaseFfiHandle(_isReversibleHandle);
    booleanReleaseFfiHandle(_isExpressHandle);
    booleanReleaseFfiHandle(_isAccelerationHandle);
    booleanReleaseFfiHandle(_isDecelerationHandle);
    booleanReleaseFfiHandle(_isAuxiliaryHandle);
    booleanReleaseFfiHandle(_isSlowHandle);
    booleanReleaseFfiHandle(_isPassingHandle);
    booleanReleaseFfiHandle(_isShoulderHandle);
    booleanReleaseFfiHandle(_isRegulatedAccessHandle);
    booleanReleaseFfiHandle(_isTurnHandle);
    booleanReleaseFfiHandle(_isCenterTurnHandle);
    booleanReleaseFfiHandle(_isTruckParkingHandle);
    booleanReleaseFfiHandle(_isParkingHandle);
    booleanReleaseFfiHandle(_isVariableDrivingHandle);
    booleanReleaseFfiHandle(_isBicycleHandle);
  }
}

void sdkNavigationLanetypeReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationLanetypeReleaseHandle(handle);

// Nullable LaneType

final _sdkNavigationLanetypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_create_handle_nullable'));
final _sdkNavigationLanetypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_release_handle_nullable'));
final _sdkNavigationLanetypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneType_get_value_nullable'));

Pointer<Void> sdkNavigationLanetypeToFfiNullable(LaneType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationLanetypeToFfi(value);
  final result = _sdkNavigationLanetypeCreateHandleNullable(_handle);
  sdkNavigationLanetypeReleaseFfiHandle(_handle);
  return result;
}

LaneType? sdkNavigationLanetypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationLanetypeGetValueNullable(handle);
  final result = sdkNavigationLanetypeFromFfi(_handle);
  sdkNavigationLanetypeReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationLanetypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationLanetypeReleaseHandleNullable(handle);

// End of LaneType "private" section.


