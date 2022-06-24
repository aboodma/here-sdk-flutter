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
import 'package:here_sdk/src/sdk/navigation/navigable_location.dart';

/// Contains all the relevant information on a deviation from the route.

class RouteDeviation {
  /// The last known location on the route.
  NavigableLocation? lastLocationOnRoute;

  /// The amount of the [Route] which is already traversed.
  /// The value is in the range of \[0, 1\].
  double fractionTraveled;

  /// The current location.
  NavigableLocation currentLocation;

  RouteDeviation(this.lastLocationOnRoute, this.fractionTraveled, this.currentLocation);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RouteDeviation) return false;
    RouteDeviation _other = other;
    return lastLocationOnRoute == _other.lastLocationOnRoute &&
        fractionTraveled == _other.fractionTraveled &&
        currentLocation == _other.currentLocation;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + lastLocationOnRoute.hashCode;
    result = 31 * result + fractionTraveled.hashCode;
    result = 31 * result + currentLocation.hashCode;
    return result;
  }
}


// RouteDeviation "private" section, not exported.

final _sdkNavigationRoutedeviationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Double, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, double, Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_create_handle'));
final _sdkNavigationRoutedeviationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_release_handle'));
final _sdkNavigationRoutedeviationGetFieldlastLocationOnRoute = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_get_field_lastLocationOnRoute'));
final _sdkNavigationRoutedeviationGetFieldfractionTraveled = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_get_field_fractionTraveled'));
final _sdkNavigationRoutedeviationGetFieldcurrentLocation = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_get_field_currentLocation'));



Pointer<Void> sdkNavigationRoutedeviationToFfi(RouteDeviation value) {
  final _lastLocationOnRouteHandle = sdkNavigationNavigablelocationToFfiNullable(value.lastLocationOnRoute);
  final _fractionTraveledHandle = (value.fractionTraveled);
  final _currentLocationHandle = sdkNavigationNavigablelocationToFfi(value.currentLocation);
  final _result = _sdkNavigationRoutedeviationCreateHandle(_lastLocationOnRouteHandle, _fractionTraveledHandle, _currentLocationHandle);
  sdkNavigationNavigablelocationReleaseFfiHandleNullable(_lastLocationOnRouteHandle);
  
  sdkNavigationNavigablelocationReleaseFfiHandle(_currentLocationHandle);
  return _result;
}

RouteDeviation sdkNavigationRoutedeviationFromFfi(Pointer<Void> handle) {
  final _lastLocationOnRouteHandle = _sdkNavigationRoutedeviationGetFieldlastLocationOnRoute(handle);
  final _fractionTraveledHandle = _sdkNavigationRoutedeviationGetFieldfractionTraveled(handle);
  final _currentLocationHandle = _sdkNavigationRoutedeviationGetFieldcurrentLocation(handle);
  try {
    return RouteDeviation(
      sdkNavigationNavigablelocationFromFfiNullable(_lastLocationOnRouteHandle), 
      (_fractionTraveledHandle), 
      sdkNavigationNavigablelocationFromFfi(_currentLocationHandle)
    );
  } finally {
    sdkNavigationNavigablelocationReleaseFfiHandleNullable(_lastLocationOnRouteHandle);
    
    sdkNavigationNavigablelocationReleaseFfiHandle(_currentLocationHandle);
  }
}

void sdkNavigationRoutedeviationReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationRoutedeviationReleaseHandle(handle);

// Nullable RouteDeviation

final _sdkNavigationRoutedeviationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_create_handle_nullable'));
final _sdkNavigationRoutedeviationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_release_handle_nullable'));
final _sdkNavigationRoutedeviationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteDeviation_get_value_nullable'));

Pointer<Void> sdkNavigationRoutedeviationToFfiNullable(RouteDeviation? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRoutedeviationToFfi(value);
  final result = _sdkNavigationRoutedeviationCreateHandleNullable(_handle);
  sdkNavigationRoutedeviationReleaseFfiHandle(_handle);
  return result;
}

RouteDeviation? sdkNavigationRoutedeviationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRoutedeviationGetValueNullable(handle);
  final result = sdkNavigationRoutedeviationFromFfi(_handle);
  sdkNavigationRoutedeviationReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRoutedeviationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRoutedeviationReleaseHandleNullable(handle);

// End of RouteDeviation "private" section.


