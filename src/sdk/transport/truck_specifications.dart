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
import 'package:here_sdk/src/sdk/transport/truck_type.dart';

/// Truck specifications such as dimensions and weight.

class TruckSpecifications {
  /// Truck weight including trailers and shipped goods in kilograms. The provided value
  /// must be greater than or equal to 0. By default, it is not set.
  /// Route calculation: When not set, possible weight restrictions will not be
  /// taken into consideration.
  /// Rendering `sdk.mapview.TruckProfile`: When set, truck restriction icons for a weight greater
  /// than [TruckSpecifications.grossWeightInKilograms] will not be displayed.
  int? grossWeightInKilograms;

  /// Truck weight per axle in kilograms. The provided value must be greater or equal to 0.
  /// By default, it is not set.
  /// Route calculation: When not set, possible weight per axle restrictions will not be
  /// taken into consideration.
  /// Rendering `sdk.mapview.TruckProfile`: When set, truck restriction icons for a weight per axle
  /// greater than [TruckSpecifications.weightPerAxleInKilograms] will not be displayed.
  int? weightPerAxleInKilograms;

  /// Truck height in centimeters. The provided value must be in the range \[0, 5000\].
  /// By default, it is not set.
  /// Route calculation: When not set, possible height restrictions will not be
  /// taken into consideration.
  /// Rendering `sdk.mapview.TruckProfile`: When set, truck restriction icons for a height greater
  /// than [TruckSpecifications.heightInCentimeters] will not be displayed.
  int? heightInCentimeters;

  /// Truck width in centimeters. The provided value must be in the range \[0, 5000\].
  /// By default, it is not set.
  /// Route calculation: When not set, possible width restrictions will not be
  /// taken into consideration.
  /// Rendering `sdk.mapview.TruckProfile`: When set, truck restriction icons for a width greater
  /// than [TruckSpecifications.widthInCentimeters] will not be displayed.
  int? widthInCentimeters;

  /// Truck length in centimeters. The provided value must be in the range \[0, 30000\].
  /// By default, it is not set.
  /// Route calculation: When not set, possible length restrictions will not be
  /// taken into consideration.
  /// Rendering `sdk.mapview.TruckProfile`: When set, truck restriction icons for a length greater
  /// than [TruckSpecifications.lengthInCentimeters] will not be displayed.
  int? lengthInCentimeters;

  /// Defines total number of axles in the vehicle. The provided value must be greater than or
  /// equal to 2. By default, it is not set.
  /// Route calculation: When not set, possible axle count restrictions will not be
  /// taken into consideration.
  /// Rendering `sdk.mapview.TruckProfile`: When set, truck restriction icons for an axle count
  /// greater than [TruckSpecifications.axleCount] will not be displayed.
  int? axleCount;

  /// Defines number of trailers attached to the vehicle. The provided value must be in the range
  /// \[0, 255\]. By default, it is not set.
  /// Route calculation: When not set, possible trailer count restrictions will not be
  /// taken into consideration.
  /// Rendering `sdk.mapview.TruckProfile`: When set, truck restriction icons for a trailer count
  /// greater than [TruckSpecifications.trailerCount] will not be displayed.
  int? trailerCount;

  /// Defines the type of truck. By default, it is [TruckType.straight].
  /// Rendering `sdk.mapview.TruckProfile`: [TruckSpecifications.truckType] is ignored and has no effect.
  TruckType truckType;

  /// A flag indicating whether the truck is light enough to be classified more as a car than as a truck.
  /// A light truck exempts from many legal restrictions for normal trucks. Restrictions related to the physical
  /// dimensions of the truck, or its cargo, however, still apply. A light trucks are fully supported in Japan and is
  /// experimental in other regions. Default value is false and truck routing will proceed as normal
  /// Rendering `sdk.mapview.TruckProfile`: [TruckSpecifications.isTruckLight] is ignored and has no effect.
  bool isTruckLight;

  TruckSpecifications([int? grossWeightInKilograms = null, int? weightPerAxleInKilograms = null, int? heightInCentimeters = null, int? widthInCentimeters = null, int? lengthInCentimeters = null, int? axleCount = null, int? trailerCount = null, TruckType truckType = TruckType.straight, bool isTruckLight = false])
    : grossWeightInKilograms = grossWeightInKilograms, weightPerAxleInKilograms = weightPerAxleInKilograms, heightInCentimeters = heightInCentimeters, widthInCentimeters = widthInCentimeters, lengthInCentimeters = lengthInCentimeters, axleCount = axleCount, trailerCount = trailerCount, truckType = truckType, isTruckLight = isTruckLight;
  TruckSpecifications.withDefaults()
      : grossWeightInKilograms = null, weightPerAxleInKilograms = null, heightInCentimeters = null, widthInCentimeters = null, lengthInCentimeters = null, axleCount = null, trailerCount = null, truckType = TruckType.straight, isTruckLight = false;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TruckSpecifications) return false;
    TruckSpecifications _other = other;
    return grossWeightInKilograms == _other.grossWeightInKilograms &&
        weightPerAxleInKilograms == _other.weightPerAxleInKilograms &&
        heightInCentimeters == _other.heightInCentimeters &&
        widthInCentimeters == _other.widthInCentimeters &&
        lengthInCentimeters == _other.lengthInCentimeters &&
        axleCount == _other.axleCount &&
        trailerCount == _other.trailerCount &&
        truckType == _other.truckType &&
        isTruckLight == _other.isTruckLight;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + grossWeightInKilograms.hashCode;
    result = 31 * result + weightPerAxleInKilograms.hashCode;
    result = 31 * result + heightInCentimeters.hashCode;
    result = 31 * result + widthInCentimeters.hashCode;
    result = 31 * result + lengthInCentimeters.hashCode;
    result = 31 * result + axleCount.hashCode;
    result = 31 * result + trailerCount.hashCode;
    result = 31 * result + truckType.hashCode;
    result = 31 * result + isTruckLight.hashCode;
    return result;
  }
}


// TruckSpecifications "private" section, not exported.

final _sdkTransportTruckspecificationsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint32, Uint8),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, int)
  >('here_sdk_sdk_transport_TruckSpecifications_create_handle'));
final _sdkTransportTruckspecificationsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_release_handle'));
final _sdkTransportTruckspecificationsGetFieldgrossWeightInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_grossWeightInKilograms'));
final _sdkTransportTruckspecificationsGetFieldweightPerAxleInKilograms = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_weightPerAxleInKilograms'));
final _sdkTransportTruckspecificationsGetFieldheightInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_heightInCentimeters'));
final _sdkTransportTruckspecificationsGetFieldwidthInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_widthInCentimeters'));
final _sdkTransportTruckspecificationsGetFieldlengthInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_lengthInCentimeters'));
final _sdkTransportTruckspecificationsGetFieldaxleCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_axleCount'));
final _sdkTransportTruckspecificationsGetFieldtrailerCount = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_trailerCount'));
final _sdkTransportTruckspecificationsGetFieldtruckType = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_truckType'));
final _sdkTransportTruckspecificationsGetFieldisTruckLight = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_field_isTruckLight'));



Pointer<Void> sdkTransportTruckspecificationsToFfi(TruckSpecifications value) {
  final _grossWeightInKilogramsHandle = intToFfiNullable(value.grossWeightInKilograms);
  final _weightPerAxleInKilogramsHandle = intToFfiNullable(value.weightPerAxleInKilograms);
  final _heightInCentimetersHandle = intToFfiNullable(value.heightInCentimeters);
  final _widthInCentimetersHandle = intToFfiNullable(value.widthInCentimeters);
  final _lengthInCentimetersHandle = intToFfiNullable(value.lengthInCentimeters);
  final _axleCountHandle = intToFfiNullable(value.axleCount);
  final _trailerCountHandle = intToFfiNullable(value.trailerCount);
  final _truckTypeHandle = sdkTransportTrucktypeToFfi(value.truckType);
  final _isTruckLightHandle = booleanToFfi(value.isTruckLight);
  final _result = _sdkTransportTruckspecificationsCreateHandle(_grossWeightInKilogramsHandle, _weightPerAxleInKilogramsHandle, _heightInCentimetersHandle, _widthInCentimetersHandle, _lengthInCentimetersHandle, _axleCountHandle, _trailerCountHandle, _truckTypeHandle, _isTruckLightHandle);
  intReleaseFfiHandleNullable(_grossWeightInKilogramsHandle);
  intReleaseFfiHandleNullable(_weightPerAxleInKilogramsHandle);
  intReleaseFfiHandleNullable(_heightInCentimetersHandle);
  intReleaseFfiHandleNullable(_widthInCentimetersHandle);
  intReleaseFfiHandleNullable(_lengthInCentimetersHandle);
  intReleaseFfiHandleNullable(_axleCountHandle);
  intReleaseFfiHandleNullable(_trailerCountHandle);
  sdkTransportTrucktypeReleaseFfiHandle(_truckTypeHandle);
  booleanReleaseFfiHandle(_isTruckLightHandle);
  return _result;
}

TruckSpecifications sdkTransportTruckspecificationsFromFfi(Pointer<Void> handle) {
  final _grossWeightInKilogramsHandle = _sdkTransportTruckspecificationsGetFieldgrossWeightInKilograms(handle);
  final _weightPerAxleInKilogramsHandle = _sdkTransportTruckspecificationsGetFieldweightPerAxleInKilograms(handle);
  final _heightInCentimetersHandle = _sdkTransportTruckspecificationsGetFieldheightInCentimeters(handle);
  final _widthInCentimetersHandle = _sdkTransportTruckspecificationsGetFieldwidthInCentimeters(handle);
  final _lengthInCentimetersHandle = _sdkTransportTruckspecificationsGetFieldlengthInCentimeters(handle);
  final _axleCountHandle = _sdkTransportTruckspecificationsGetFieldaxleCount(handle);
  final _trailerCountHandle = _sdkTransportTruckspecificationsGetFieldtrailerCount(handle);
  final _truckTypeHandle = _sdkTransportTruckspecificationsGetFieldtruckType(handle);
  final _isTruckLightHandle = _sdkTransportTruckspecificationsGetFieldisTruckLight(handle);
  try {
    return TruckSpecifications(
      intFromFfiNullable(_grossWeightInKilogramsHandle), 
      intFromFfiNullable(_weightPerAxleInKilogramsHandle), 
      intFromFfiNullable(_heightInCentimetersHandle), 
      intFromFfiNullable(_widthInCentimetersHandle), 
      intFromFfiNullable(_lengthInCentimetersHandle), 
      intFromFfiNullable(_axleCountHandle), 
      intFromFfiNullable(_trailerCountHandle), 
      sdkTransportTrucktypeFromFfi(_truckTypeHandle), 
      booleanFromFfi(_isTruckLightHandle)
    );
  } finally {
    intReleaseFfiHandleNullable(_grossWeightInKilogramsHandle);
    intReleaseFfiHandleNullable(_weightPerAxleInKilogramsHandle);
    intReleaseFfiHandleNullable(_heightInCentimetersHandle);
    intReleaseFfiHandleNullable(_widthInCentimetersHandle);
    intReleaseFfiHandleNullable(_lengthInCentimetersHandle);
    intReleaseFfiHandleNullable(_axleCountHandle);
    intReleaseFfiHandleNullable(_trailerCountHandle);
    sdkTransportTrucktypeReleaseFfiHandle(_truckTypeHandle);
    booleanReleaseFfiHandle(_isTruckLightHandle);
  }
}

void sdkTransportTruckspecificationsReleaseFfiHandle(Pointer<Void> handle) => _sdkTransportTruckspecificationsReleaseHandle(handle);

// Nullable TruckSpecifications

final _sdkTransportTruckspecificationsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_create_handle_nullable'));
final _sdkTransportTruckspecificationsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_release_handle_nullable'));
final _sdkTransportTruckspecificationsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_transport_TruckSpecifications_get_value_nullable'));

Pointer<Void> sdkTransportTruckspecificationsToFfiNullable(TruckSpecifications? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkTransportTruckspecificationsToFfi(value);
  final result = _sdkTransportTruckspecificationsCreateHandleNullable(_handle);
  sdkTransportTruckspecificationsReleaseFfiHandle(_handle);
  return result;
}

TruckSpecifications? sdkTransportTruckspecificationsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkTransportTruckspecificationsGetValueNullable(handle);
  final result = sdkTransportTruckspecificationsFromFfi(_handle);
  sdkTransportTruckspecificationsReleaseFfiHandle(_handle);
  return result;
}

void sdkTransportTruckspecificationsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkTransportTruckspecificationsReleaseHandleNullable(handle);

// End of TruckSpecifications "private" section.


