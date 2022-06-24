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
import 'package:here_sdk/src/_native_base.dart' as __lib;
import 'package:here_sdk/src/_token_cache.dart' as __lib;
import 'package:here_sdk/src/_type_repository.dart' as __lib;
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/language_code.dart';
import 'package:here_sdk/src/sdk/core/location.dart';
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;
import 'package:here_sdk/src/sdk/mapview/location_indicator.dart';
import 'package:here_sdk/src/sdk/mapview/map_view_base.dart';
import 'package:here_sdk/src/sdk/navigation/camera_settings.dart';
import 'package:here_sdk/src/sdk/navigation/camera_tracking_mode.dart';
import 'package:here_sdk/src/sdk/navigation/destination_reached_listener.dart';
import 'package:here_sdk/src/sdk/navigation/interpolated_location_listener.dart';
import 'package:here_sdk/src/sdk/navigation/junction_view_lane_assistance_listener.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_notification_listener.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_notification_options.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_notification_timing_options.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_view_lane_assistance_listener.dart';
import 'package:here_sdk/src/sdk/navigation/milestone_reached_listener.dart';
import 'package:here_sdk/src/sdk/navigation/milestone_status_listener.dart';
import 'package:here_sdk/src/sdk/navigation/navigable_location_listener.dart';
import 'package:here_sdk/src/sdk/navigation/navigator_interface.dart';
import 'package:here_sdk/src/sdk/navigation/post_action_listener.dart';
import 'package:here_sdk/src/sdk/navigation/road_attributes_listener.dart';
import 'package:here_sdk/src/sdk/navigation/road_texts_listener.dart';
import 'package:here_sdk/src/sdk/navigation/route_deviation_listener.dart';
import 'package:here_sdk/src/sdk/navigation/route_progress_listener.dart';
import 'package:here_sdk/src/sdk/navigation/safety_camera_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/spatial_maneuver_azimuth_listener.dart';
import 'package:here_sdk/src/sdk/navigation/spatial_maneuver_notification_listener.dart';
import 'package:here_sdk/src/sdk/navigation/speed_limit_listener.dart';
import 'package:here_sdk/src/sdk/navigation/speed_warning_listener.dart';
import 'package:here_sdk/src/sdk/navigation/speed_warning_options.dart';
import 'package:here_sdk/src/sdk/navigation/truck_restrictions_warning_listener.dart';
import 'package:here_sdk/src/sdk/routing/maneuver.dart';
import 'package:here_sdk/src/sdk/routing/road_type.dart';
import 'package:here_sdk/src/sdk/routing/route.dart';
import 'package:here_sdk/src/sdk/routing/transport_mode.dart' as sdk_routing;
import 'package:here_sdk/src/sdk/transport/transport_mode.dart' as sdk_transport;
import 'package:meta/meta.dart';

/// This class provides all functionality of [NavigatorInterface].
///
/// In addition,
/// it provides advanced rendering capabilities for a smooth navigation experience.
/// This includes interpolation of location updates along a route during turn-by-turn navigation
/// and during tracking mode. By default, suitable map view settings are automatically applied.
/// For example, a predefined current location marker is rendered.
/// Similar to [Navigator], this class continuously reacts to new locations
/// provided from a location source and acts as a [LocationListener].
abstract class VisualNavigator implements NavigatorInterface {
  /// Creates a new instance of this class.
  ///
  factory VisualNavigator() => $prototype.$init();
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] An SDKEngine instance.
  ///
  factory VisualNavigator.withSdkEngine(SDKNativeEngine sdkEngine) => $prototype.withSdkEngine(sdkEngine);

  /// Returns the list of languages for maneuver notification currently available in the SDK.
  ///
  /// Returns [List<LanguageCode>]. the list of languages for maneuver notification currently available in the SDK.
  ///
  static List<LanguageCode> getAvailableLanguagesForManeuverNotifications() => $prototype.getAvailableLanguagesForManeuverNotifications();
  /// Starts visual navigation rendering.
  ///
  /// A preconfigured current location marker is shown as soon as a location is received.
  /// The marker is chosen according to the transport mode specified in the route. If no route is
  /// present, the marker is chosen based on the [NavigatorInterface.trackingTransportMode] property.
  /// Calling startRendering() changes the [MapCamera.principalPoint] property so that the current
  /// position indicator is placed slightly at the bottom of the mapview. It is restored to its original value
  /// when stopRendering() is called.
  /// **Note:** When rendering is started again for a new map view instance, rendering
  /// is automatically stopped on the previous map view instance. Also note that
  /// the [MapViewBase.frameRate] can be lowered to reduce CPU usage, to adjust for tradeoffs
  /// between rendering smoothness versus battery consumption.
  ///
  /// [mapView] The map view on which visual navigation will take place.
  ///
  void startRendering(MapViewBase mapView);
  /// Stops visual navigation rendering.
  ///
  /// This removes the current location marker. Other
  /// settings, like map orientation or camera distance, which may have been altered during rendering
  /// are no longer updated.
  ///
  void stopRendering();
  CameraTrackingMode get cameraMode;
  set cameraMode(CameraTrackingMode value);

  /// Gets camera settings to be used during visual navigation.
  CameraSettings get cameraSettings;
  /// Updates camera setings to be used during visual navigation.
  set cameraSettings(CameraSettings value);

  /// Returns current state of route rendering during visual navigation.
  bool get isRouteVisible;
  /// Set to false to disable route rendering, set to true to enable route rendering.
  set isRouteVisible(bool value);

  LocationIndicator? get customLocationIndicator;
  set customLocationIndicator(LocationIndicator? value);

  /// Gets the listener that receives interpolated locations.
  InterpolatedLocationListener? get interpolatedLocationListener;
  /// Sets the listener that receives interpolated locations.
  set interpolatedLocationListener(InterpolatedLocationListener? value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = VisualNavigator$Impl(Pointer<Void>.fromAddress(0));
}


// VisualNavigator "private" section, not exported.

final _sdkNavigationVisualnavigatorRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_VisualNavigator_register_finalizer'));
final _sdkNavigationVisualnavigatorCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_copy_handle'));
final _sdkNavigationVisualnavigatorReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_release_handle'));
final _sdkNavigationVisualnavigatorGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_get_type_id'));


final _$initReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make_return_release_handle'));
final _$initReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make_return_get_result'));
final _$initReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make_return_get_error'));
final _$initReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make_return_has_error'));


final _withSdkEngineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make__SDKNativeEngine_return_release_handle'));
final _withSdkEngineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make__SDKNativeEngine_return_get_result'));
final _withSdkEngineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make__SDKNativeEngine_return_get_error'));
final _withSdkEngineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_VisualNavigator_make__SDKNativeEngine_return_has_error'));





/// @nodoc
@visibleForTesting
class VisualNavigator$Impl extends __lib.NativeBase implements VisualNavigator {

  VisualNavigator$Impl(Pointer<Void> handle) : super(handle);


  VisualNavigator $init() {
    final _result_handle = _$init();
    final _result = VisualNavigator$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkNavigationVisualnavigatorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  VisualNavigator withSdkEngine(SDKNativeEngine sdkEngine) {
    final _result_handle = _withSdkEngine(sdkEngine);
    final _result = VisualNavigator$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkNavigationVisualnavigatorRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_navigation_VisualNavigator_make'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    if (_$initReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initReturnGetError(__callResultHandle);
        _$initReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initReturnGetResult(__callResultHandle);
    _$initReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine) {
    final _withSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _withSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    if (_withSdkEngineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withSdkEngineReturnGetError(__callResultHandle);
        _withSdkEngineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withSdkEngineReturnGetResult(__callResultHandle);
    _withSdkEngineReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  List<LanguageCode> getAvailableLanguagesForManeuverNotifications() {
    final _getAvailableLanguagesForManeuverNotificationsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_navigation_VisualNavigator_getAvailableLanguagesForManeuverNotifications'));
    final __resultHandle = _getAvailableLanguagesForManeuverNotificationsFfi(__lib.LibraryContext.isolateId);
    try {
      return heresdkVisualNavigationBindingslistofSdkCoreLanguagecodeFromFfi(__resultHandle);
    } finally {
      heresdkVisualNavigationBindingslistofSdkCoreLanguagecodeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void startRendering(MapViewBase mapView) {
    final _startRenderingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_startRendering__MapViewBase'));
    final _mapViewHandle = sdkMapviewMapviewbaseToFfi(mapView);
    final _handle = this.handle;
    _startRenderingFfi(_handle, __lib.LibraryContext.isolateId, _mapViewHandle);
    sdkMapviewMapviewbaseReleaseFfiHandle(_mapViewHandle);

  }

  @override
  void stopRendering() {
    final _stopRenderingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_stopRendering'));
    final _handle = this.handle;
    _stopRenderingFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  Maneuver? getManeuver(int index) {
    final _getManeuverFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Int32), Pointer<Void> Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_VisualNavigator_getManeuver__Int'));
    final _indexHandle = (index);
    final _handle = this.handle;
    final __resultHandle = _getManeuverFfi(_handle, __lib.LibraryContext.isolateId, _indexHandle);

    try {
      return sdkRoutingManeuverFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingManeuverReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  ManeuverNotificationTimingOptions getManeuverNotificationTimingOptions(sdk_transport.TransportMode transportMode, RoadType roadType) {
    final _getManeuverNotificationTimingOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Uint32, Uint32), Pointer<Void> Function(Pointer<Void>, int, int, int)>('here_sdk_sdk_navigation_VisualNavigator_getManeuverNotificationTimingOptions__TransportMode_RoadType'));
    final _transportModeHandle = sdk_transport.sdkTransportTransportmodeToFfi(transportMode);
    final _roadTypeHandle = sdkRoutingRoadtypeToFfi(roadType);
    final _handle = this.handle;
    final __resultHandle = _getManeuverNotificationTimingOptionsFfi(_handle, __lib.LibraryContext.isolateId, _transportModeHandle, _roadTypeHandle);
    sdk_transport.sdkTransportTransportmodeReleaseFfiHandle(_transportModeHandle);
    sdkRoutingRoadtypeReleaseFfiHandle(_roadTypeHandle);
    try {
      return sdkNavigationManeuvernotificationtimingoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationManeuvernotificationtimingoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void setManeuverNotificationTimingOptions(sdk_transport.TransportMode transportMode, RoadType roadType, ManeuverNotificationTimingOptions options) {
    final _setManeuverNotificationTimingOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Uint32, Pointer<Void>), void Function(Pointer<Void>, int, int, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_setManeuverNotificationTimingOptions__TransportMode_RoadType_ManeuverNotificationTimingOptions'));
    final _transportModeHandle = sdk_transport.sdkTransportTransportmodeToFfi(transportMode);
    final _roadTypeHandle = sdkRoutingRoadtypeToFfi(roadType);
    final _optionsHandle = sdkNavigationManeuvernotificationtimingoptionsToFfi(options);
    final _handle = this.handle;
    _setManeuverNotificationTimingOptionsFfi(_handle, __lib.LibraryContext.isolateId, _transportModeHandle, _roadTypeHandle, _optionsHandle);
    sdk_transport.sdkTransportTransportmodeReleaseFfiHandle(_transportModeHandle);
    sdkRoutingRoadtypeReleaseFfiHandle(_roadTypeHandle);
    sdkNavigationManeuvernotificationtimingoptionsReleaseFfiHandle(_optionsHandle);

  }

  @override
  void onLocationUpdated(location_impl.Location location) {
    final _onLocationUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_onLocationUpdated__Location'));
    final _locationHandle = sdkCoreLocationToFfi(location);
    final _handle = this.handle;
    _onLocationUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _locationHandle);
    sdkCoreLocationReleaseFfiHandle(_locationHandle);

  }

  @override
  CameraTrackingMode get cameraMode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_cameraMode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationCameratrackingmodeFromFfi(__resultHandle);
    } finally {
      sdkNavigationCameratrackingmodeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set cameraMode(CameraTrackingMode value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_VisualNavigator_cameraMode_set__CameraTrackingMode'));
    final _valueHandle = sdkNavigationCameratrackingmodeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationCameratrackingmodeReleaseFfiHandle(_valueHandle);

  }


  @override
  CameraSettings get cameraSettings {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_cameraSettings_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationCamerasettingsFromFfi(__resultHandle);
    } finally {
      sdkNavigationCamerasettingsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set cameraSettings(CameraSettings value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_cameraSettings_set__CameraSettings'));
    final _valueHandle = sdkNavigationCamerasettingsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationCamerasettingsReleaseFfiHandle(_valueHandle);

  }


  @override
  bool get isRouteVisible {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_isRouteVisible_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set isRouteVisible(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_VisualNavigator_isRouteVisible_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }


  @override
  LocationIndicator? get customLocationIndicator {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_customLocationIndicator_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewLocationindicatorFromFfiNullable(__resultHandle);
    } finally {
      sdkMapviewLocationindicatorReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set customLocationIndicator(LocationIndicator? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_customLocationIndicator_set__LocationIndicator_'));
    final _valueHandle = sdkMapviewLocationindicatorToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkMapviewLocationindicatorReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  InterpolatedLocationListener? get interpolatedLocationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_interpolatedLocationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationInterpolatedlocationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationInterpolatedlocationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set interpolatedLocationListener(InterpolatedLocationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_interpolatedLocationListener_set__InterpolatedLocationListener_'));
    final _valueHandle = sdkNavigationInterpolatedlocationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationInterpolatedlocationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  Route? get route {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_route_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRouteFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingRouteReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set route(Route? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_route_set'));
    final _valueHandle = sdkRoutingRouteToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkRoutingRouteReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  sdk_routing.TransportMode get trackingTransportMode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_trackingTransportMode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_routing.sdkRoutingTransportmodeFromFfi(__resultHandle);
    } finally {
      sdk_routing.sdkRoutingTransportmodeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set trackingTransportMode(sdk_routing.TransportMode value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_VisualNavigator_trackingTransportMode_set'));
    final _valueHandle = sdk_routing.sdkRoutingTransportmodeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdk_routing.sdkRoutingTransportmodeReleaseFfiHandle(_valueHandle);

  }


  @override
  sdk_transport.TransportMode get assumedTrackingTransportMode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_assumedTrackingTransportMode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_transport.sdkTransportTransportmodeFromFfi(__resultHandle);
    } finally {
      sdk_transport.sdkTransportTransportmodeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set assumedTrackingTransportMode(sdk_transport.TransportMode value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_VisualNavigator_assumedTrackingTransportMode_set'));
    final _valueHandle = sdk_transport.sdkTransportTransportmodeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdk_transport.sdkTransportTransportmodeReleaseFfiHandle(_valueHandle);

  }


  @override
  NavigableLocationListener? get navigableLocationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_navigableLocationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationNavigablelocationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationNavigablelocationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set navigableLocationListener(NavigableLocationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_navigableLocationListener_set'));
    final _valueHandle = sdkNavigationNavigablelocationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationNavigablelocationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RouteProgressListener? get routeProgressListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_routeProgressListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRouteprogresslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRouteprogresslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set routeProgressListener(RouteProgressListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_routeProgressListener_set'));
    final _valueHandle = sdkNavigationRouteprogresslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRouteprogresslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RouteDeviationListener? get routeDeviationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_routeDeviationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoutedeviationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRoutedeviationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set routeDeviationListener(RouteDeviationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_routeDeviationListener_set'));
    final _valueHandle = sdkNavigationRoutedeviationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoutedeviationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  ManeuverNotificationListener? get maneuverNotificationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_maneuverNotificationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationManeuvernotificationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationManeuvernotificationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set maneuverNotificationListener(ManeuverNotificationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_maneuverNotificationListener_set'));
    final _valueHandle = sdkNavigationManeuvernotificationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationManeuvernotificationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  MilestoneStatusListener? get milestoneStatusListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_milestoneStatusListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationMilestonestatuslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationMilestonestatuslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set milestoneStatusListener(MilestoneStatusListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_milestoneStatusListener_set'));
    final _valueHandle = sdkNavigationMilestonestatuslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationMilestonestatuslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  MilestoneReachedListener? get milestoneReachedListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_milestoneReachedListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationMilestonereachedlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationMilestonereachedlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set milestoneReachedListener(MilestoneReachedListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_milestoneReachedListener_set'));
    final _valueHandle = sdkNavigationMilestonereachedlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationMilestonereachedlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  DestinationReachedListener? get destinationReachedListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_destinationReachedListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationDestinationreachedlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationDestinationreachedlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set destinationReachedListener(DestinationReachedListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_destinationReachedListener_set'));
    final _valueHandle = sdkNavigationDestinationreachedlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationDestinationreachedlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SpeedWarningListener? get speedWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_speedWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpeedwarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpeedwarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set speedWarningListener(SpeedWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_speedWarningListener_set'));
    final _valueHandle = sdkNavigationSpeedwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpeedwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  ManeuverViewLaneAssistanceListener? get maneuverViewLaneAssistanceListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_maneuverViewLaneAssistanceListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationManeuverviewlaneassistancelistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationManeuverviewlaneassistancelistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set maneuverViewLaneAssistanceListener(ManeuverViewLaneAssistanceListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_maneuverViewLaneAssistanceListener_set'));
    final _valueHandle = sdkNavigationManeuverviewlaneassistancelistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationManeuverviewlaneassistancelistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  JunctionViewLaneAssistanceListener? get junctionViewLaneAssistanceListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_junctionViewLaneAssistanceListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationJunctionviewlaneassistancelistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationJunctionviewlaneassistancelistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set junctionViewLaneAssistanceListener(JunctionViewLaneAssistanceListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_junctionViewLaneAssistanceListener_set'));
    final _valueHandle = sdkNavigationJunctionviewlaneassistancelistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationJunctionviewlaneassistancelistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SafetyCameraWarningListener? get safetyCameraWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_safetyCameraWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSafetycamerawarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSafetycamerawarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set safetyCameraWarningListener(SafetyCameraWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_safetyCameraWarningListener_set'));
    final _valueHandle = sdkNavigationSafetycamerawarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSafetycamerawarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  TruckRestrictionsWarningListener? get truckRestrictionsWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_truckRestrictionsWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationTruckrestrictionswarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationTruckrestrictionswarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set truckRestrictionsWarningListener(TruckRestrictionsWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_truckRestrictionsWarningListener_set'));
    final _valueHandle = sdkNavigationTruckrestrictionswarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationTruckrestrictionswarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  PostActionListener? get postActionListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_postActionListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationPostactionlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationPostactionlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set postActionListener(PostActionListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_postActionListener_set'));
    final _valueHandle = sdkNavigationPostactionlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationPostactionlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SpeedLimitListener? get speedLimitListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_speedLimitListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpeedlimitlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpeedlimitlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set speedLimitListener(SpeedLimitListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_speedLimitListener_set'));
    final _valueHandle = sdkNavigationSpeedlimitlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpeedlimitlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RoadTextsListener? get roadTextsListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_roadTextsListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoadtextslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRoadtextslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set roadTextsListener(RoadTextsListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_roadTextsListener_set'));
    final _valueHandle = sdkNavigationRoadtextslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadtextslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  RoadAttributesListener? get roadAttributesListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_roadAttributesListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoadattributeslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRoadattributeslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set roadAttributesListener(RoadAttributesListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_roadAttributesListener_set'));
    final _valueHandle = sdkNavigationRoadattributeslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadattributeslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SpatialManeuverNotificationListener? get spatialManeuverNotificationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_spatialManeuverNotificationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpatialmaneuvernotificationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpatialmaneuvernotificationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set spatialManeuverNotificationListener(SpatialManeuverNotificationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_spatialManeuverNotificationListener_set'));
    final _valueHandle = sdkNavigationSpatialmaneuvernotificationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpatialmaneuvernotificationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  SpatialManeuverAzimuthListener? get spatialManeuverAzimuthListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_spatialManeuverAzimuthListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpatialmaneuverazimuthlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpatialmaneuverazimuthlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set spatialManeuverAzimuthListener(SpatialManeuverAzimuthListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_spatialManeuverAzimuthListener_set'));
    final _valueHandle = sdkNavigationSpatialmaneuverazimuthlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpatialmaneuverazimuthlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  @override
  ManeuverNotificationOptions get maneuverNotificationOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_maneuverNotificationOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationManeuvernotificationoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationManeuvernotificationoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set maneuverNotificationOptions(ManeuverNotificationOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_maneuverNotificationOptions_set'));
    final _valueHandle = sdkNavigationManeuvernotificationoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationManeuvernotificationoptionsReleaseFfiHandle(_valueHandle);

  }


  @override
  SpeedWarningOptions get speedWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_VisualNavigator_speedWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpeedwarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationSpeedwarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set speedWarningOptions(SpeedWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_VisualNavigator_speedWarningOptions_set'));
    final _valueHandle = sdkNavigationSpeedwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpeedwarningoptionsReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkNavigationVisualnavigatorToFfi(VisualNavigator value) =>
  _sdkNavigationVisualnavigatorCopyHandle((value as __lib.NativeBase).handle);

VisualNavigator sdkNavigationVisualnavigatorFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VisualNavigator) return instance;

  final _typeIdHandle = _sdkNavigationVisualnavigatorGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationVisualnavigatorCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : VisualNavigator$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationVisualnavigatorRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationVisualnavigatorReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationVisualnavigatorReleaseHandle(handle);

Pointer<Void> sdkNavigationVisualnavigatorToFfiNullable(VisualNavigator? value) =>
  value != null ? sdkNavigationVisualnavigatorToFfi(value) : Pointer<Void>.fromAddress(0);

VisualNavigator? sdkNavigationVisualnavigatorFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationVisualnavigatorFromFfi(handle) : null;

void sdkNavigationVisualnavigatorReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationVisualnavigatorReleaseHandle(handle);

// End of VisualNavigator "private" section.


