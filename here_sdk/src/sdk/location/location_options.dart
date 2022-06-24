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
import 'package:here_sdk/src/sdk/location/cellular_positioning_options.dart';
import 'package:here_sdk/src/sdk/location/location_accuracy.dart';
import 'package:here_sdk/src/sdk/location/notification_options.dart';
import 'package:here_sdk/src/sdk/location/satellite_positioning_options.dart';
import 'package:here_sdk/src/sdk/location/sensor_options.dart';
import 'package:here_sdk/src/sdk/location/wifi_positioning_options.dart';
import 'package:meta/meta.dart';



/// Location options that combine notification, sensor, cellular positioning, GNSS positioning and WiFi positioning options.

class LocationOptions {
  /// Positioning notification options.
  NotificationOptions notificationOptions;

  /// Positioning sensor options.
  SensorOptions sensorOptions;

  /// Cellular network positioning options.
  CellularPositioningOptions cellularPositioningOptions;

  /// GNSS positioning options.
  SatellitePositioningOptions satellitePositioningOptions;

  /// WiFi network positioning options.
  WifiPositioningOptions wifiPositioningOptions;

  LocationOptions._(this.notificationOptions, this.sensorOptions, this.cellularPositioningOptions, this.satellitePositioningOptions, this.wifiPositioningOptions);
  /// Constructs LocationOptions from default options.
  ///
  factory LocationOptions() => $prototype.$init();
  /// Constructs LocationOptions from LocationAccuracy.
  ///
  /// Returned LocationOptions
  /// instance has default options for given LocationAccuracy set.
  ///
  /// [locationAccuracy] LocationAccuracy to define the LocationOptions.
  ///
  factory LocationOptions.fromLocationAccuracy(LocationAccuracy locationAccuracy) => $prototype.fromLocationAccuracy(locationAccuracy);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = LocationOptions$Impl();
}


// LocationOptions "private" section, not exported.

final _sdkLocationLocationoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_location_LocationOptions_create_handle'));
final _sdkLocationLocationoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationOptions_release_handle'));
final _sdkLocationLocationoptionsGetFieldnotificationOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationOptions_get_field_notificationOptions'));
final _sdkLocationLocationoptionsGetFieldsensorOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationOptions_get_field_sensorOptions'));
final _sdkLocationLocationoptionsGetFieldcellularPositioningOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationOptions_get_field_cellularPositioningOptions'));
final _sdkLocationLocationoptionsGetFieldsatellitePositioningOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationOptions_get_field_satellitePositioningOptions'));
final _sdkLocationLocationoptionsGetFieldwifiPositioningOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationOptions_get_field_wifiPositioningOptions'));



/// @nodoc
@visibleForTesting
class LocationOptions$Impl {
  LocationOptions $init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_location_LocationOptions_make'));
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    try {
      return sdkLocationLocationoptionsFromFfi(__resultHandle);
    } finally {
      sdkLocationLocationoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  LocationOptions fromLocationAccuracy(LocationAccuracy locationAccuracy) {
    final _fromLocationAccuracyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32), Pointer<Void> Function(int, int)>('here_sdk_sdk_location_LocationOptions_make__LocationAccuracy'));
    final _locationAccuracyHandle = sdkLocationLocationaccuracyToFfi(locationAccuracy);
    final __resultHandle = _fromLocationAccuracyFfi(__lib.LibraryContext.isolateId, _locationAccuracyHandle);
    sdkLocationLocationaccuracyReleaseFfiHandle(_locationAccuracyHandle);
    try {
      return sdkLocationLocationoptionsFromFfi(__resultHandle);
    } finally {
      sdkLocationLocationoptionsReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkLocationLocationoptionsToFfi(LocationOptions value) {
  final _notificationOptionsHandle = sdkLocationNotificationoptionsToFfi(value.notificationOptions);
  final _sensorOptionsHandle = sdkLocationSensoroptionsToFfi(value.sensorOptions);
  final _cellularPositioningOptionsHandle = sdkLocationCellularpositioningoptionsToFfi(value.cellularPositioningOptions);
  final _satellitePositioningOptionsHandle = sdkLocationSatellitepositioningoptionsToFfi(value.satellitePositioningOptions);
  final _wifiPositioningOptionsHandle = sdkLocationWifipositioningoptionsToFfi(value.wifiPositioningOptions);
  final _result = _sdkLocationLocationoptionsCreateHandle(_notificationOptionsHandle, _sensorOptionsHandle, _cellularPositioningOptionsHandle, _satellitePositioningOptionsHandle, _wifiPositioningOptionsHandle);
  sdkLocationNotificationoptionsReleaseFfiHandle(_notificationOptionsHandle);
  sdkLocationSensoroptionsReleaseFfiHandle(_sensorOptionsHandle);
  sdkLocationCellularpositioningoptionsReleaseFfiHandle(_cellularPositioningOptionsHandle);
  sdkLocationSatellitepositioningoptionsReleaseFfiHandle(_satellitePositioningOptionsHandle);
  sdkLocationWifipositioningoptionsReleaseFfiHandle(_wifiPositioningOptionsHandle);
  return _result;
}

LocationOptions sdkLocationLocationoptionsFromFfi(Pointer<Void> handle) {
  final _notificationOptionsHandle = _sdkLocationLocationoptionsGetFieldnotificationOptions(handle);
  final _sensorOptionsHandle = _sdkLocationLocationoptionsGetFieldsensorOptions(handle);
  final _cellularPositioningOptionsHandle = _sdkLocationLocationoptionsGetFieldcellularPositioningOptions(handle);
  final _satellitePositioningOptionsHandle = _sdkLocationLocationoptionsGetFieldsatellitePositioningOptions(handle);
  final _wifiPositioningOptionsHandle = _sdkLocationLocationoptionsGetFieldwifiPositioningOptions(handle);
  try {
    return LocationOptions._(
      sdkLocationNotificationoptionsFromFfi(_notificationOptionsHandle), 
      sdkLocationSensoroptionsFromFfi(_sensorOptionsHandle), 
      sdkLocationCellularpositioningoptionsFromFfi(_cellularPositioningOptionsHandle), 
      sdkLocationSatellitepositioningoptionsFromFfi(_satellitePositioningOptionsHandle), 
      sdkLocationWifipositioningoptionsFromFfi(_wifiPositioningOptionsHandle)
    );
  } finally {
    sdkLocationNotificationoptionsReleaseFfiHandle(_notificationOptionsHandle);
    sdkLocationSensoroptionsReleaseFfiHandle(_sensorOptionsHandle);
    sdkLocationCellularpositioningoptionsReleaseFfiHandle(_cellularPositioningOptionsHandle);
    sdkLocationSatellitepositioningoptionsReleaseFfiHandle(_satellitePositioningOptionsHandle);
    sdkLocationWifipositioningoptionsReleaseFfiHandle(_wifiPositioningOptionsHandle);
  }
}

void sdkLocationLocationoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkLocationLocationoptionsReleaseHandle(handle);

// Nullable LocationOptions

final _sdkLocationLocationoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationOptions_create_handle_nullable'));
final _sdkLocationLocationoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationOptions_release_handle_nullable'));
final _sdkLocationLocationoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_LocationOptions_get_value_nullable'));

Pointer<Void> sdkLocationLocationoptionsToFfiNullable(LocationOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkLocationLocationoptionsToFfi(value);
  final result = _sdkLocationLocationoptionsCreateHandleNullable(_handle);
  sdkLocationLocationoptionsReleaseFfiHandle(_handle);
  return result;
}

LocationOptions? sdkLocationLocationoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkLocationLocationoptionsGetValueNullable(handle);
  final result = sdkLocationLocationoptionsFromFfi(_handle);
  sdkLocationLocationoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkLocationLocationoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationLocationoptionsReleaseHandleNullable(handle);

// End of LocationOptions "private" section.


