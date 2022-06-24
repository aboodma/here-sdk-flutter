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
import 'package:here_sdk/src/sdk/core/location.dart';
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;
import 'package:here_sdk/src/sdk/core/location_listener.dart';
import 'package:here_sdk/src/sdk/navigation/destination_reached_listener.dart';
import 'package:here_sdk/src/sdk/navigation/junction_view_lane_assistance_listener.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_notification_listener.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_notification_options.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_notification_timing_options.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_view_lane_assistance_listener.dart';
import 'package:here_sdk/src/sdk/navigation/milestone_reached_listener.dart';
import 'package:here_sdk/src/sdk/navigation/milestone_status_listener.dart';
import 'package:here_sdk/src/sdk/navigation/navigable_location_listener.dart';
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

/// This abstract class provides the basic functionality needed to run a navigation session.
abstract class NavigatorInterface implements LocationListener {
  /// This abstract class provides the basic functionality needed to run a navigation session.

  factory NavigatorInterface(
    void Function(location_impl.Location) onLocationUpdatedLambda,
    Maneuver? Function(int) getManeuverLambda,
    ManeuverNotificationTimingOptions Function(sdk_transport.TransportMode, RoadType) getManeuverNotificationTimingOptionsLambda,
    void Function(sdk_transport.TransportMode, RoadType, ManeuverNotificationTimingOptions) setManeuverNotificationTimingOptionsLambda,
    Route? Function() routeGetLambda,
    void Function(Route?) routeSetLambda,
    sdk_routing.TransportMode Function() trackingTransportModeGetLambda,
    void Function(sdk_routing.TransportMode) trackingTransportModeSetLambda,
    sdk_transport.TransportMode Function() assumedTrackingTransportModeGetLambda,
    void Function(sdk_transport.TransportMode) assumedTrackingTransportModeSetLambda,
    NavigableLocationListener? Function() navigableLocationListenerGetLambda,
    void Function(NavigableLocationListener?) navigableLocationListenerSetLambda,
    RouteProgressListener? Function() routeProgressListenerGetLambda,
    void Function(RouteProgressListener?) routeProgressListenerSetLambda,
    RouteDeviationListener? Function() routeDeviationListenerGetLambda,
    void Function(RouteDeviationListener?) routeDeviationListenerSetLambda,
    ManeuverNotificationListener? Function() maneuverNotificationListenerGetLambda,
    void Function(ManeuverNotificationListener?) maneuverNotificationListenerSetLambda,
    MilestoneStatusListener? Function() milestoneStatusListenerGetLambda,
    void Function(MilestoneStatusListener?) milestoneStatusListenerSetLambda,
    MilestoneReachedListener? Function() milestoneReachedListenerGetLambda,
    void Function(MilestoneReachedListener?) milestoneReachedListenerSetLambda,
    DestinationReachedListener? Function() destinationReachedListenerGetLambda,
    void Function(DestinationReachedListener?) destinationReachedListenerSetLambda,
    SpeedWarningListener? Function() speedWarningListenerGetLambda,
    void Function(SpeedWarningListener?) speedWarningListenerSetLambda,
    ManeuverViewLaneAssistanceListener? Function() maneuverViewLaneAssistanceListenerGetLambda,
    void Function(ManeuverViewLaneAssistanceListener?) maneuverViewLaneAssistanceListenerSetLambda,
    JunctionViewLaneAssistanceListener? Function() junctionViewLaneAssistanceListenerGetLambda,
    void Function(JunctionViewLaneAssistanceListener?) junctionViewLaneAssistanceListenerSetLambda,
    SafetyCameraWarningListener? Function() safetyCameraWarningListenerGetLambda,
    void Function(SafetyCameraWarningListener?) safetyCameraWarningListenerSetLambda,
    TruckRestrictionsWarningListener? Function() truckRestrictionsWarningListenerGetLambda,
    void Function(TruckRestrictionsWarningListener?) truckRestrictionsWarningListenerSetLambda,
    PostActionListener? Function() postActionListenerGetLambda,
    void Function(PostActionListener?) postActionListenerSetLambda,
    SpeedLimitListener? Function() speedLimitListenerGetLambda,
    void Function(SpeedLimitListener?) speedLimitListenerSetLambda,
    RoadTextsListener? Function() roadTextsListenerGetLambda,
    void Function(RoadTextsListener?) roadTextsListenerSetLambda,
    RoadAttributesListener? Function() roadAttributesListenerGetLambda,
    void Function(RoadAttributesListener?) roadAttributesListenerSetLambda,
    SpatialManeuverNotificationListener? Function() spatialManeuverNotificationListenerGetLambda,
    void Function(SpatialManeuverNotificationListener?) spatialManeuverNotificationListenerSetLambda,
    SpatialManeuverAzimuthListener? Function() spatialManeuverAzimuthListenerGetLambda,
    void Function(SpatialManeuverAzimuthListener?) spatialManeuverAzimuthListenerSetLambda,
    ManeuverNotificationOptions Function() maneuverNotificationOptionsGetLambda,
    void Function(ManeuverNotificationOptions) maneuverNotificationOptionsSetLambda,
    SpeedWarningOptions Function() speedWarningOptionsGetLambda,
    void Function(SpeedWarningOptions) speedWarningOptionsSetLambda
  ) => NavigatorInterface$Lambdas(
    onLocationUpdatedLambda,
    getManeuverLambda,
    getManeuverNotificationTimingOptionsLambda,
    setManeuverNotificationTimingOptionsLambda,
    routeGetLambda,
    routeSetLambda,
    trackingTransportModeGetLambda,
    trackingTransportModeSetLambda,
    assumedTrackingTransportModeGetLambda,
    assumedTrackingTransportModeSetLambda,
    navigableLocationListenerGetLambda,
    navigableLocationListenerSetLambda,
    routeProgressListenerGetLambda,
    routeProgressListenerSetLambda,
    routeDeviationListenerGetLambda,
    routeDeviationListenerSetLambda,
    maneuverNotificationListenerGetLambda,
    maneuverNotificationListenerSetLambda,
    milestoneStatusListenerGetLambda,
    milestoneStatusListenerSetLambda,
    milestoneReachedListenerGetLambda,
    milestoneReachedListenerSetLambda,
    destinationReachedListenerGetLambda,
    destinationReachedListenerSetLambda,
    speedWarningListenerGetLambda,
    speedWarningListenerSetLambda,
    maneuverViewLaneAssistanceListenerGetLambda,
    maneuverViewLaneAssistanceListenerSetLambda,
    junctionViewLaneAssistanceListenerGetLambda,
    junctionViewLaneAssistanceListenerSetLambda,
    safetyCameraWarningListenerGetLambda,
    safetyCameraWarningListenerSetLambda,
    truckRestrictionsWarningListenerGetLambda,
    truckRestrictionsWarningListenerSetLambda,
    postActionListenerGetLambda,
    postActionListenerSetLambda,
    speedLimitListenerGetLambda,
    speedLimitListenerSetLambda,
    roadTextsListenerGetLambda,
    roadTextsListenerSetLambda,
    roadAttributesListenerGetLambda,
    roadAttributesListenerSetLambda,
    spatialManeuverNotificationListenerGetLambda,
    spatialManeuverNotificationListenerSetLambda,
    spatialManeuverAzimuthListenerGetLambda,
    spatialManeuverAzimuthListenerSetLambda,
    maneuverNotificationOptionsGetLambda,
    maneuverNotificationOptionsSetLambda,
    speedWarningOptionsGetLambda,
    speedWarningOptionsSetLambda
  );

  /// Returns maneuver at the given index.
  ///
  /// [index] The index of maneuver requested.
  ///
  /// Returns [Maneuver?]. The maneuver if it exists or otherwise `null`.
  ///
  Maneuver? getManeuver(int index);
  /// Returns maneuver notification timing options with default values given the combination of transport mode and road type.
  ///
  /// The return value can be used as the base for configuring maneuver notification timings. Configure the relevant attributes
  /// of this object according to your preferences, and then set it by calling setManeuverNotificationTimingOptions function
  /// for the same combination of transport mode and road type.
  ///
  /// [transportMode] The transport mode of the timing options.
  ///
  /// [roadType] The road type of the timing options.
  ///
  /// Returns [ManeuverNotificationTimingOptions]. The timing options with default values.
  ///
  ManeuverNotificationTimingOptions getManeuverNotificationTimingOptions(sdk_transport.TransportMode transportMode, RoadType roadType);
  /// Set timing option values for the combination of transport mode and road type.
  ///
  /// [transportMode] The transport mode of the timing options.
  ///
  /// [roadType] The road type of the timing options.
  ///
  /// [options] The timing options.
  ///
  void setManeuverNotificationTimingOptions(sdk_transport.TransportMode transportMode, RoadType roadType, ManeuverNotificationTimingOptions options);
  /// Gets the route that is being navigated.
  Route? get route;
  /// Sets the route to navigate.
  set route(Route? value);

  @Deprecated("Will be removed in v4.12.0. Please use [NavigatorInterface.assumedTrackingTransportMode] instead.")
  sdk_routing.TransportMode get trackingTransportMode;
  @Deprecated("Will be removed in v4.12.0. Please use [NavigatorInterface.assumedTrackingTransportMode] instead.")
  set trackingTransportMode(sdk_routing.TransportMode value);

  sdk_transport.TransportMode get assumedTrackingTransportMode;
  set assumedTrackingTransportMode(sdk_transport.TransportMode value);

  /// Gets the listener that notifies current location updates.
  NavigableLocationListener? get navigableLocationListener;
  /// Sets the listener that notifies current location updates.
  set navigableLocationListener(NavigableLocationListener? value);

  /// Gets the listener that notifies when a route progress change occurs.
  RouteProgressListener? get routeProgressListener;
  /// Sets the listener that notifies when a route progress change occurs.
  set routeProgressListener(RouteProgressListener? value);

  /// Gets the listener that notifies when deviation from the route is observed.
  RouteDeviationListener? get routeDeviationListener;
  /// Sets the listener that notifies when deviation from the route is observed.
  set routeDeviationListener(RouteDeviationListener? value);

  /// Gets the listener that notifies when a maneuver notification is available.
  ManeuverNotificationListener? get maneuverNotificationListener;
  /// Sets the listener that notifies when a maneuver notification is available.
  set maneuverNotificationListener(ManeuverNotificationListener? value);

  /// Gets the listener that notifies when a [Milestone] has been reached or missed.
  MilestoneStatusListener? get milestoneStatusListener;
  /// Sets the listener that notifies when a [Milestone] has been reached or missed.
  set milestoneStatusListener(MilestoneStatusListener? value);

  /// Gets the listener that notifies when a [Milestone] has been reached.
  @Deprecated("Will be removed in v4.12.0. Please use milestone status listener instead")
  MilestoneReachedListener? get milestoneReachedListener;
  /// Sets the listener that notifies when a [Milestone] has been reached.
  @Deprecated("Will be removed in v4.12.0. Please use milestone status listener instead")
  set milestoneReachedListener(MilestoneReachedListener? value);

  /// Gets the listener that notify when the destination has been reached.
  DestinationReachedListener? get destinationReachedListener;
  /// Sets the listener that notify when the destination has been reached.
  set destinationReachedListener(DestinationReachedListener? value);

  /// Gets the listener to receive notifications
  /// when a speed limit on a road is exceeded or driving speed is restored back to normal.
  SpeedWarningListener? get speedWarningListener;
  /// Sets the listener to receive notifications
  /// when a speed limit on a road is exceeded or driving speed is restored back to normal.
  set speedWarningListener(SpeedWarningListener? value);

  /// Gets the listener to receive maneuver view lane assistance notifications.
  ManeuverViewLaneAssistanceListener? get maneuverViewLaneAssistanceListener;
  /// Sets the listener to receive maneuver view lane assistance notifications.
  set maneuverViewLaneAssistanceListener(ManeuverViewLaneAssistanceListener? value);

  /// Gets the listener to receive junction view lane assistance notifications.
  JunctionViewLaneAssistanceListener? get junctionViewLaneAssistanceListener;
  /// Sets the listener to receive junction view lane assistance notifications.
  set junctionViewLaneAssistanceListener(JunctionViewLaneAssistanceListener? value);

  /// Gets the listener to receive safety camera warning notifications.
  SafetyCameraWarningListener? get safetyCameraWarningListener;
  /// Sets the listener to receive safety camera warning notifications.
  set safetyCameraWarningListener(SafetyCameraWarningListener? value);

  /// Gets the listener to receive notifications about
  /// truck restrictions on the current road.
  TruckRestrictionsWarningListener? get truckRestrictionsWarningListener;
  /// Sets the listener to receive notifications about
  /// truck restrictions on the current road.
  set truckRestrictionsWarningListener(TruckRestrictionsWarningListener? value);

  /// Gets the listener to receive post action
  /// notifications, such as a charge action at a charging station.
  PostActionListener? get postActionListener;
  /// Sets the listener to receive post action
  /// notifications, such as a charge action at a charging station.
  set postActionListener(PostActionListener? value);

  /// Gets the listener to receive notifications about
  /// the speed limit of the current road.
  SpeedLimitListener? get speedLimitListener;
  /// Sets the listener to receive notifications about
  /// the speed limit of the current road.
  set speedLimitListener(SpeedLimitListener? value);

  /// Gets the listener to receive notifications about
  /// the textual attributes of the current road.
  RoadTextsListener? get roadTextsListener;
  /// Sets the listener to receive notifications about
  /// the textual attributes of the current road.
  set roadTextsListener(RoadTextsListener? value);

  /// Gets the listener to receive notifications about
  /// attributes of the current road.
  RoadAttributesListener? get roadAttributesListener;
  /// Sets the listener to receive notifications about
  /// attributes of the current road.
  set roadAttributesListener(RoadAttributesListener? value);

  /// Gets the listener that notifies when a spatial maneuver notification is available.
  SpatialManeuverNotificationListener? get spatialManeuverNotificationListener;
  /// Sets the listener that notifies when a spatial maneuver notification is available.
  set spatialManeuverNotificationListener(SpatialManeuverNotificationListener? value);

  /// Gets the listener to receive notifications about
  /// the following spatial audio trajectory.
  SpatialManeuverAzimuthListener? get spatialManeuverAzimuthListener;
  /// Sets the listener to receive notifications about
  /// the following spatial audio trajectory.
  set spatialManeuverAzimuthListener(SpatialManeuverAzimuthListener? value);

  /// Gets the maneuver notification options.
  ManeuverNotificationOptions get maneuverNotificationOptions;
  /// Sets the maneuver notification options.
  set maneuverNotificationOptions(ManeuverNotificationOptions value);

  /// Gets the speed warning options.
  SpeedWarningOptions get speedWarningOptions;
  /// Sets the speed warning options.
  set speedWarningOptions(SpeedWarningOptions value);

}


// NavigatorInterface "private" section, not exported.

final _sdkNavigationNavigatorinterfaceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_NavigatorInterface_register_finalizer'));
final _sdkNavigationNavigatorinterfaceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigatorInterface_copy_handle'));
final _sdkNavigationNavigatorinterfaceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigatorInterface_release_handle'));
final _sdkNavigationNavigatorinterfaceCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_navigation_NavigatorInterface_create_proxy'));
final _sdkNavigationNavigatorinterfaceGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_NavigatorInterface_get_type_id'));




class NavigatorInterface$Lambdas implements NavigatorInterface {
  void Function(location_impl.Location) onLocationUpdatedLambda;
  Maneuver? Function(int) getManeuverLambda;
  ManeuverNotificationTimingOptions Function(sdk_transport.TransportMode, RoadType) getManeuverNotificationTimingOptionsLambda;
  void Function(sdk_transport.TransportMode, RoadType, ManeuverNotificationTimingOptions) setManeuverNotificationTimingOptionsLambda;
  Route? Function() routeGetLambda;
  void Function(Route?) routeSetLambda;
  sdk_routing.TransportMode Function() trackingTransportModeGetLambda;
  void Function(sdk_routing.TransportMode) trackingTransportModeSetLambda;
  sdk_transport.TransportMode Function() assumedTrackingTransportModeGetLambda;
  void Function(sdk_transport.TransportMode) assumedTrackingTransportModeSetLambda;
  NavigableLocationListener? Function() navigableLocationListenerGetLambda;
  void Function(NavigableLocationListener?) navigableLocationListenerSetLambda;
  RouteProgressListener? Function() routeProgressListenerGetLambda;
  void Function(RouteProgressListener?) routeProgressListenerSetLambda;
  RouteDeviationListener? Function() routeDeviationListenerGetLambda;
  void Function(RouteDeviationListener?) routeDeviationListenerSetLambda;
  ManeuverNotificationListener? Function() maneuverNotificationListenerGetLambda;
  void Function(ManeuverNotificationListener?) maneuverNotificationListenerSetLambda;
  MilestoneStatusListener? Function() milestoneStatusListenerGetLambda;
  void Function(MilestoneStatusListener?) milestoneStatusListenerSetLambda;
  MilestoneReachedListener? Function() milestoneReachedListenerGetLambda;
  void Function(MilestoneReachedListener?) milestoneReachedListenerSetLambda;
  DestinationReachedListener? Function() destinationReachedListenerGetLambda;
  void Function(DestinationReachedListener?) destinationReachedListenerSetLambda;
  SpeedWarningListener? Function() speedWarningListenerGetLambda;
  void Function(SpeedWarningListener?) speedWarningListenerSetLambda;
  ManeuverViewLaneAssistanceListener? Function() maneuverViewLaneAssistanceListenerGetLambda;
  void Function(ManeuverViewLaneAssistanceListener?) maneuverViewLaneAssistanceListenerSetLambda;
  JunctionViewLaneAssistanceListener? Function() junctionViewLaneAssistanceListenerGetLambda;
  void Function(JunctionViewLaneAssistanceListener?) junctionViewLaneAssistanceListenerSetLambda;
  SafetyCameraWarningListener? Function() safetyCameraWarningListenerGetLambda;
  void Function(SafetyCameraWarningListener?) safetyCameraWarningListenerSetLambda;
  TruckRestrictionsWarningListener? Function() truckRestrictionsWarningListenerGetLambda;
  void Function(TruckRestrictionsWarningListener?) truckRestrictionsWarningListenerSetLambda;
  PostActionListener? Function() postActionListenerGetLambda;
  void Function(PostActionListener?) postActionListenerSetLambda;
  SpeedLimitListener? Function() speedLimitListenerGetLambda;
  void Function(SpeedLimitListener?) speedLimitListenerSetLambda;
  RoadTextsListener? Function() roadTextsListenerGetLambda;
  void Function(RoadTextsListener?) roadTextsListenerSetLambda;
  RoadAttributesListener? Function() roadAttributesListenerGetLambda;
  void Function(RoadAttributesListener?) roadAttributesListenerSetLambda;
  SpatialManeuverNotificationListener? Function() spatialManeuverNotificationListenerGetLambda;
  void Function(SpatialManeuverNotificationListener?) spatialManeuverNotificationListenerSetLambda;
  SpatialManeuverAzimuthListener? Function() spatialManeuverAzimuthListenerGetLambda;
  void Function(SpatialManeuverAzimuthListener?) spatialManeuverAzimuthListenerSetLambda;
  ManeuverNotificationOptions Function() maneuverNotificationOptionsGetLambda;
  void Function(ManeuverNotificationOptions) maneuverNotificationOptionsSetLambda;
  SpeedWarningOptions Function() speedWarningOptionsGetLambda;
  void Function(SpeedWarningOptions) speedWarningOptionsSetLambda;

  NavigatorInterface$Lambdas(
    this.onLocationUpdatedLambda,
    this.getManeuverLambda,
    this.getManeuverNotificationTimingOptionsLambda,
    this.setManeuverNotificationTimingOptionsLambda,
    this.routeGetLambda,
    this.routeSetLambda,
    this.trackingTransportModeGetLambda,
    this.trackingTransportModeSetLambda,
    this.assumedTrackingTransportModeGetLambda,
    this.assumedTrackingTransportModeSetLambda,
    this.navigableLocationListenerGetLambda,
    this.navigableLocationListenerSetLambda,
    this.routeProgressListenerGetLambda,
    this.routeProgressListenerSetLambda,
    this.routeDeviationListenerGetLambda,
    this.routeDeviationListenerSetLambda,
    this.maneuverNotificationListenerGetLambda,
    this.maneuverNotificationListenerSetLambda,
    this.milestoneStatusListenerGetLambda,
    this.milestoneStatusListenerSetLambda,
    this.milestoneReachedListenerGetLambda,
    this.milestoneReachedListenerSetLambda,
    this.destinationReachedListenerGetLambda,
    this.destinationReachedListenerSetLambda,
    this.speedWarningListenerGetLambda,
    this.speedWarningListenerSetLambda,
    this.maneuverViewLaneAssistanceListenerGetLambda,
    this.maneuverViewLaneAssistanceListenerSetLambda,
    this.junctionViewLaneAssistanceListenerGetLambda,
    this.junctionViewLaneAssistanceListenerSetLambda,
    this.safetyCameraWarningListenerGetLambda,
    this.safetyCameraWarningListenerSetLambda,
    this.truckRestrictionsWarningListenerGetLambda,
    this.truckRestrictionsWarningListenerSetLambda,
    this.postActionListenerGetLambda,
    this.postActionListenerSetLambda,
    this.speedLimitListenerGetLambda,
    this.speedLimitListenerSetLambda,
    this.roadTextsListenerGetLambda,
    this.roadTextsListenerSetLambda,
    this.roadAttributesListenerGetLambda,
    this.roadAttributesListenerSetLambda,
    this.spatialManeuverNotificationListenerGetLambda,
    this.spatialManeuverNotificationListenerSetLambda,
    this.spatialManeuverAzimuthListenerGetLambda,
    this.spatialManeuverAzimuthListenerSetLambda,
    this.maneuverNotificationOptionsGetLambda,
    this.maneuverNotificationOptionsSetLambda,
    this.speedWarningOptionsGetLambda,
    this.speedWarningOptionsSetLambda
  );

  @override
  void onLocationUpdated(location_impl.Location location) =>
    onLocationUpdatedLambda(location);
  @override
  Maneuver? getManeuver(int index) =>
    getManeuverLambda(index);
  @override
  ManeuverNotificationTimingOptions getManeuverNotificationTimingOptions(sdk_transport.TransportMode transportMode, RoadType roadType) =>
    getManeuverNotificationTimingOptionsLambda(transportMode, roadType);
  @override
  void setManeuverNotificationTimingOptions(sdk_transport.TransportMode transportMode, RoadType roadType, ManeuverNotificationTimingOptions options) =>
    setManeuverNotificationTimingOptionsLambda(transportMode, roadType, options);
  @override
  Route? get route => routeGetLambda();
  @override
  set route(Route? value) => routeSetLambda(value);
  @override
  sdk_routing.TransportMode get trackingTransportMode => trackingTransportModeGetLambda();
  @override
  set trackingTransportMode(sdk_routing.TransportMode value) => trackingTransportModeSetLambda(value);
  @override
  sdk_transport.TransportMode get assumedTrackingTransportMode => assumedTrackingTransportModeGetLambda();
  @override
  set assumedTrackingTransportMode(sdk_transport.TransportMode value) => assumedTrackingTransportModeSetLambda(value);
  @override
  NavigableLocationListener? get navigableLocationListener => navigableLocationListenerGetLambda();
  @override
  set navigableLocationListener(NavigableLocationListener? value) => navigableLocationListenerSetLambda(value);
  @override
  RouteProgressListener? get routeProgressListener => routeProgressListenerGetLambda();
  @override
  set routeProgressListener(RouteProgressListener? value) => routeProgressListenerSetLambda(value);
  @override
  RouteDeviationListener? get routeDeviationListener => routeDeviationListenerGetLambda();
  @override
  set routeDeviationListener(RouteDeviationListener? value) => routeDeviationListenerSetLambda(value);
  @override
  ManeuverNotificationListener? get maneuverNotificationListener => maneuverNotificationListenerGetLambda();
  @override
  set maneuverNotificationListener(ManeuverNotificationListener? value) => maneuverNotificationListenerSetLambda(value);
  @override
  MilestoneStatusListener? get milestoneStatusListener => milestoneStatusListenerGetLambda();
  @override
  set milestoneStatusListener(MilestoneStatusListener? value) => milestoneStatusListenerSetLambda(value);
  @override
  MilestoneReachedListener? get milestoneReachedListener => milestoneReachedListenerGetLambda();
  @override
  set milestoneReachedListener(MilestoneReachedListener? value) => milestoneReachedListenerSetLambda(value);
  @override
  DestinationReachedListener? get destinationReachedListener => destinationReachedListenerGetLambda();
  @override
  set destinationReachedListener(DestinationReachedListener? value) => destinationReachedListenerSetLambda(value);
  @override
  SpeedWarningListener? get speedWarningListener => speedWarningListenerGetLambda();
  @override
  set speedWarningListener(SpeedWarningListener? value) => speedWarningListenerSetLambda(value);
  @override
  ManeuverViewLaneAssistanceListener? get maneuverViewLaneAssistanceListener => maneuverViewLaneAssistanceListenerGetLambda();
  @override
  set maneuverViewLaneAssistanceListener(ManeuverViewLaneAssistanceListener? value) => maneuverViewLaneAssistanceListenerSetLambda(value);
  @override
  JunctionViewLaneAssistanceListener? get junctionViewLaneAssistanceListener => junctionViewLaneAssistanceListenerGetLambda();
  @override
  set junctionViewLaneAssistanceListener(JunctionViewLaneAssistanceListener? value) => junctionViewLaneAssistanceListenerSetLambda(value);
  @override
  SafetyCameraWarningListener? get safetyCameraWarningListener => safetyCameraWarningListenerGetLambda();
  @override
  set safetyCameraWarningListener(SafetyCameraWarningListener? value) => safetyCameraWarningListenerSetLambda(value);
  @override
  TruckRestrictionsWarningListener? get truckRestrictionsWarningListener => truckRestrictionsWarningListenerGetLambda();
  @override
  set truckRestrictionsWarningListener(TruckRestrictionsWarningListener? value) => truckRestrictionsWarningListenerSetLambda(value);
  @override
  PostActionListener? get postActionListener => postActionListenerGetLambda();
  @override
  set postActionListener(PostActionListener? value) => postActionListenerSetLambda(value);
  @override
  SpeedLimitListener? get speedLimitListener => speedLimitListenerGetLambda();
  @override
  set speedLimitListener(SpeedLimitListener? value) => speedLimitListenerSetLambda(value);
  @override
  RoadTextsListener? get roadTextsListener => roadTextsListenerGetLambda();
  @override
  set roadTextsListener(RoadTextsListener? value) => roadTextsListenerSetLambda(value);
  @override
  RoadAttributesListener? get roadAttributesListener => roadAttributesListenerGetLambda();
  @override
  set roadAttributesListener(RoadAttributesListener? value) => roadAttributesListenerSetLambda(value);
  @override
  SpatialManeuverNotificationListener? get spatialManeuverNotificationListener => spatialManeuverNotificationListenerGetLambda();
  @override
  set spatialManeuverNotificationListener(SpatialManeuverNotificationListener? value) => spatialManeuverNotificationListenerSetLambda(value);
  @override
  SpatialManeuverAzimuthListener? get spatialManeuverAzimuthListener => spatialManeuverAzimuthListenerGetLambda();
  @override
  set spatialManeuverAzimuthListener(SpatialManeuverAzimuthListener? value) => spatialManeuverAzimuthListenerSetLambda(value);
  @override
  ManeuverNotificationOptions get maneuverNotificationOptions => maneuverNotificationOptionsGetLambda();
  @override
  set maneuverNotificationOptions(ManeuverNotificationOptions value) => maneuverNotificationOptionsSetLambda(value);
  @override
  SpeedWarningOptions get speedWarningOptions => speedWarningOptionsGetLambda();
  @override
  set speedWarningOptions(SpeedWarningOptions value) => speedWarningOptionsSetLambda(value);
}

class NavigatorInterface$Impl extends __lib.NativeBase implements NavigatorInterface {

  NavigatorInterface$Impl(Pointer<Void> handle) : super(handle);

  @override
  void onLocationUpdated(location_impl.Location location) {
    final _onLocationUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_LocationListener_onLocationUpdated__Location'));
    final _locationHandle = sdkCoreLocationToFfi(location);
    final _handle = this.handle;
    _onLocationUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _locationHandle);
    sdkCoreLocationReleaseFfiHandle(_locationHandle);

  }

  @override
  Maneuver? getManeuver(int index) {
    final _getManeuverFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Int32), Pointer<Void> Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_NavigatorInterface_getManeuver__Int'));
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
    final _getManeuverNotificationTimingOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Uint32, Uint32), Pointer<Void> Function(Pointer<Void>, int, int, int)>('here_sdk_sdk_navigation_NavigatorInterface_getManeuverNotificationTimingOptions__TransportMode_RoadType'));
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
    final _setManeuverNotificationTimingOptionsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32, Uint32, Pointer<Void>), void Function(Pointer<Void>, int, int, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_setManeuverNotificationTimingOptions__TransportMode_RoadType_ManeuverNotificationTimingOptions'));
    final _transportModeHandle = sdk_transport.sdkTransportTransportmodeToFfi(transportMode);
    final _roadTypeHandle = sdkRoutingRoadtypeToFfi(roadType);
    final _optionsHandle = sdkNavigationManeuvernotificationtimingoptionsToFfi(options);
    final _handle = this.handle;
    _setManeuverNotificationTimingOptionsFfi(_handle, __lib.LibraryContext.isolateId, _transportModeHandle, _roadTypeHandle, _optionsHandle);
    sdk_transport.sdkTransportTransportmodeReleaseFfiHandle(_transportModeHandle);
    sdkRoutingRoadtypeReleaseFfiHandle(_roadTypeHandle);
    sdkNavigationManeuvernotificationtimingoptionsReleaseFfiHandle(_optionsHandle);

  }

  /// Gets the route that is being navigated.
  Route? get route {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_route_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkRoutingRouteFromFfiNullable(__resultHandle);
    } finally {
      sdkRoutingRouteReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the route to navigate.
  set route(Route? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_route_set__Route_'));
    final _valueHandle = sdkRoutingRouteToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkRoutingRouteReleaseFfiHandleNullable(_valueHandle);

  }


  @Deprecated("Will be removed in v4.12.0. Please use [NavigatorInterface.assumedTrackingTransportMode] instead.")
  sdk_routing.TransportMode get trackingTransportMode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_trackingTransportMode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_routing.sdkRoutingTransportmodeFromFfi(__resultHandle);
    } finally {
      sdk_routing.sdkRoutingTransportmodeReleaseFfiHandle(__resultHandle);

    }

  }

  @Deprecated("Will be removed in v4.12.0. Please use [NavigatorInterface.assumedTrackingTransportMode] instead.")
  set trackingTransportMode(sdk_routing.TransportMode value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_NavigatorInterface_trackingTransportMode_set__TransportMode'));
    final _valueHandle = sdk_routing.sdkRoutingTransportmodeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdk_routing.sdkRoutingTransportmodeReleaseFfiHandle(_valueHandle);

  }


  sdk_transport.TransportMode get assumedTrackingTransportMode {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_assumedTrackingTransportMode_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdk_transport.sdkTransportTransportmodeFromFfi(__resultHandle);
    } finally {
      sdk_transport.sdkTransportTransportmodeReleaseFfiHandle(__resultHandle);

    }

  }

  set assumedTrackingTransportMode(sdk_transport.TransportMode value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_navigation_NavigatorInterface_assumedTrackingTransportMode_set__TransportMode'));
    final _valueHandle = sdk_transport.sdkTransportTransportmodeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdk_transport.sdkTransportTransportmodeReleaseFfiHandle(_valueHandle);

  }


  /// Gets the listener that notifies current location updates.
  NavigableLocationListener? get navigableLocationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_navigableLocationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationNavigablelocationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationNavigablelocationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies current location updates.
  set navigableLocationListener(NavigableLocationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_navigableLocationListener_set__NavigableLocationListener_'));
    final _valueHandle = sdkNavigationNavigablelocationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationNavigablelocationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notifies when a route progress change occurs.
  RouteProgressListener? get routeProgressListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_routeProgressListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRouteprogresslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRouteprogresslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies when a route progress change occurs.
  set routeProgressListener(RouteProgressListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_routeProgressListener_set__RouteProgressListener_'));
    final _valueHandle = sdkNavigationRouteprogresslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRouteprogresslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notifies when deviation from the route is observed.
  RouteDeviationListener? get routeDeviationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_routeDeviationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoutedeviationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRoutedeviationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies when deviation from the route is observed.
  set routeDeviationListener(RouteDeviationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_routeDeviationListener_set__RouteDeviationListener_'));
    final _valueHandle = sdkNavigationRoutedeviationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoutedeviationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notifies when a maneuver notification is available.
  ManeuverNotificationListener? get maneuverNotificationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_maneuverNotificationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationManeuvernotificationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationManeuvernotificationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies when a maneuver notification is available.
  set maneuverNotificationListener(ManeuverNotificationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_maneuverNotificationListener_set__ManeuverNotificationListener_'));
    final _valueHandle = sdkNavigationManeuvernotificationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationManeuvernotificationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notifies when a [Milestone] has been reached or missed.
  MilestoneStatusListener? get milestoneStatusListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_milestoneStatusListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationMilestonestatuslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationMilestonestatuslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies when a [Milestone] has been reached or missed.
  set milestoneStatusListener(MilestoneStatusListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_milestoneStatusListener_set__MilestoneStatusListener_'));
    final _valueHandle = sdkNavigationMilestonestatuslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationMilestonestatuslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notifies when a [Milestone] has been reached.
  @Deprecated("Will be removed in v4.12.0. Please use milestone status listener instead")
  MilestoneReachedListener? get milestoneReachedListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_milestoneReachedListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationMilestonereachedlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationMilestonereachedlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies when a [Milestone] has been reached.
  @Deprecated("Will be removed in v4.12.0. Please use milestone status listener instead")
  set milestoneReachedListener(MilestoneReachedListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_milestoneReachedListener_set__MilestoneReachedListener_'));
    final _valueHandle = sdkNavigationMilestonereachedlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationMilestonereachedlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notify when the destination has been reached.
  DestinationReachedListener? get destinationReachedListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_destinationReachedListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationDestinationreachedlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationDestinationreachedlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notify when the destination has been reached.
  set destinationReachedListener(DestinationReachedListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_destinationReachedListener_set__DestinationReachedListener_'));
    final _valueHandle = sdkNavigationDestinationreachedlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationDestinationreachedlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener to receive notifications
  /// when a speed limit on a road is exceeded or driving speed is restored back to normal.
  SpeedWarningListener? get speedWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_speedWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpeedwarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpeedwarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive notifications
  /// when a speed limit on a road is exceeded or driving speed is restored back to normal.
  set speedWarningListener(SpeedWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_speedWarningListener_set__SpeedWarningListener_'));
    final _valueHandle = sdkNavigationSpeedwarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpeedwarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener to receive maneuver view lane assistance notifications.
  ManeuverViewLaneAssistanceListener? get maneuverViewLaneAssistanceListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_maneuverViewLaneAssistanceListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationManeuverviewlaneassistancelistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationManeuverviewlaneassistancelistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive maneuver view lane assistance notifications.
  set maneuverViewLaneAssistanceListener(ManeuverViewLaneAssistanceListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_maneuverViewLaneAssistanceListener_set__ManeuverViewLaneAssistanceListener_'));
    final _valueHandle = sdkNavigationManeuverviewlaneassistancelistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationManeuverviewlaneassistancelistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener to receive junction view lane assistance notifications.
  JunctionViewLaneAssistanceListener? get junctionViewLaneAssistanceListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_junctionViewLaneAssistanceListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationJunctionviewlaneassistancelistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationJunctionviewlaneassistancelistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive junction view lane assistance notifications.
  set junctionViewLaneAssistanceListener(JunctionViewLaneAssistanceListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_junctionViewLaneAssistanceListener_set__JunctionViewLaneAssistanceListener_'));
    final _valueHandle = sdkNavigationJunctionviewlaneassistancelistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationJunctionviewlaneassistancelistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener to receive safety camera warning notifications.
  SafetyCameraWarningListener? get safetyCameraWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_safetyCameraWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSafetycamerawarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSafetycamerawarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive safety camera warning notifications.
  set safetyCameraWarningListener(SafetyCameraWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_safetyCameraWarningListener_set__SafetyCameraWarningListener_'));
    final _valueHandle = sdkNavigationSafetycamerawarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSafetycamerawarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener to receive notifications about
  /// truck restrictions on the current road.
  TruckRestrictionsWarningListener? get truckRestrictionsWarningListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_truckRestrictionsWarningListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationTruckrestrictionswarninglistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationTruckrestrictionswarninglistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive notifications about
  /// truck restrictions on the current road.
  set truckRestrictionsWarningListener(TruckRestrictionsWarningListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_truckRestrictionsWarningListener_set__TruckRestrictionsWarningListener_'));
    final _valueHandle = sdkNavigationTruckrestrictionswarninglistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationTruckrestrictionswarninglistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener to receive post action
  /// notifications, such as a charge action at a charging station.
  PostActionListener? get postActionListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_postActionListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationPostactionlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationPostactionlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive post action
  /// notifications, such as a charge action at a charging station.
  set postActionListener(PostActionListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_postActionListener_set__PostActionListener_'));
    final _valueHandle = sdkNavigationPostactionlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationPostactionlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener to receive notifications about
  /// the speed limit of the current road.
  SpeedLimitListener? get speedLimitListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_speedLimitListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpeedlimitlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpeedlimitlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive notifications about
  /// the speed limit of the current road.
  set speedLimitListener(SpeedLimitListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_speedLimitListener_set__SpeedLimitListener_'));
    final _valueHandle = sdkNavigationSpeedlimitlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpeedlimitlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener to receive notifications about
  /// the textual attributes of the current road.
  RoadTextsListener? get roadTextsListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_roadTextsListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoadtextslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRoadtextslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive notifications about
  /// the textual attributes of the current road.
  set roadTextsListener(RoadTextsListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_roadTextsListener_set__RoadTextsListener_'));
    final _valueHandle = sdkNavigationRoadtextslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadtextslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener to receive notifications about
  /// attributes of the current road.
  RoadAttributesListener? get roadAttributesListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_roadAttributesListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationRoadattributeslistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationRoadattributeslistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive notifications about
  /// attributes of the current road.
  set roadAttributesListener(RoadAttributesListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_roadAttributesListener_set__RoadAttributesListener_'));
    final _valueHandle = sdkNavigationRoadattributeslistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationRoadattributeslistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener that notifies when a spatial maneuver notification is available.
  SpatialManeuverNotificationListener? get spatialManeuverNotificationListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_spatialManeuverNotificationListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpatialmaneuvernotificationlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpatialmaneuvernotificationlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener that notifies when a spatial maneuver notification is available.
  set spatialManeuverNotificationListener(SpatialManeuverNotificationListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_spatialManeuverNotificationListener_set__SpatialManeuverNotificationListener_'));
    final _valueHandle = sdkNavigationSpatialmaneuvernotificationlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpatialmaneuvernotificationlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the listener to receive notifications about
  /// the following spatial audio trajectory.
  SpatialManeuverAzimuthListener? get spatialManeuverAzimuthListener {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_spatialManeuverAzimuthListener_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpatialmaneuverazimuthlistenerFromFfiNullable(__resultHandle);
    } finally {
      sdkNavigationSpatialmaneuverazimuthlistenerReleaseFfiHandleNullable(__resultHandle);

    }

  }

  /// Sets the listener to receive notifications about
  /// the following spatial audio trajectory.
  set spatialManeuverAzimuthListener(SpatialManeuverAzimuthListener? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_spatialManeuverAzimuthListener_set__SpatialManeuverAzimuthListener_'));
    final _valueHandle = sdkNavigationSpatialmaneuverazimuthlistenerToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpatialmaneuverazimuthlistenerReleaseFfiHandleNullable(_valueHandle);

  }


  /// Gets the maneuver notification options.
  ManeuverNotificationOptions get maneuverNotificationOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_maneuverNotificationOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationManeuvernotificationoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationManeuvernotificationoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets the maneuver notification options.
  set maneuverNotificationOptions(ManeuverNotificationOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_maneuverNotificationOptions_set__ManeuverNotificationOptions'));
    final _valueHandle = sdkNavigationManeuvernotificationoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationManeuvernotificationoptionsReleaseFfiHandle(_valueHandle);

  }


  /// Gets the speed warning options.
  SpeedWarningOptions get speedWarningOptions {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_NavigatorInterface_speedWarningOptions_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationSpeedwarningoptionsFromFfi(__resultHandle);
    } finally {
      sdkNavigationSpeedwarningoptionsReleaseFfiHandle(__resultHandle);

    }

  }

  /// Sets the speed warning options.
  set speedWarningOptions(SpeedWarningOptions value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_NavigatorInterface_speedWarningOptions_set__SpeedWarningOptions'));
    final _valueHandle = sdkNavigationSpeedwarningoptionsToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkNavigationSpeedwarningoptionsReleaseFfiHandle(_valueHandle);

  }



}

int _sdkNavigationNavigatorinterfaceonLocationUpdatedStatic(Object _obj, Pointer<Void> location) {

  try {
    (_obj as NavigatorInterface).onLocationUpdated(sdkCoreLocationFromFfi(location));
  } finally {
    sdkCoreLocationReleaseFfiHandle(location);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacegetManeuverStatic(Object _obj, int index, Pointer<Pointer<Void>> _result) {
  Maneuver? _resultObject;
  try {
    _resultObject = (_obj as NavigatorInterface).getManeuver((index));
    _result.value = sdkRoutingManeuverToFfiNullable(_resultObject);
  } finally {
    
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacegetManeuverNotificationTimingOptionsStatic(Object _obj, int transportMode, int roadType, Pointer<Pointer<Void>> _result) {
  ManeuverNotificationTimingOptions? _resultObject;
  try {
    _resultObject = (_obj as NavigatorInterface).getManeuverNotificationTimingOptions(sdk_transport.sdkTransportTransportmodeFromFfi(transportMode), sdkRoutingRoadtypeFromFfi(roadType));
    _result.value = sdkNavigationManeuvernotificationtimingoptionsToFfi(_resultObject);
  } finally {
    sdk_transport.sdkTransportTransportmodeReleaseFfiHandle(transportMode);
    sdkRoutingRoadtypeReleaseFfiHandle(roadType);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacesetManeuverNotificationTimingOptionsStatic(Object _obj, int transportMode, int roadType, Pointer<Void> options) {

  try {
    (_obj as NavigatorInterface).setManeuverNotificationTimingOptions(sdk_transport.sdkTransportTransportmodeFromFfi(transportMode), sdkRoutingRoadtypeFromFfi(roadType), sdkNavigationManeuvernotificationtimingoptionsFromFfi(options));
  } finally {
    sdk_transport.sdkTransportTransportmodeReleaseFfiHandle(transportMode);
    sdkRoutingRoadtypeReleaseFfiHandle(roadType);
    sdkNavigationManeuvernotificationtimingoptionsReleaseFfiHandle(options);
  }
  return 0;
}

int _sdkNavigationNavigatorinterfacerouteGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkRoutingRouteToFfiNullable((_obj as NavigatorInterface).route);
  return 0;
}

int _sdkNavigationNavigatorinterfacerouteSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).route =
      sdkRoutingRouteFromFfiNullable(_value);
  } finally {
    sdkRoutingRouteReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacetrackingTransportModeGetStatic(Object _obj, Pointer<Uint32> _result) {
  _result.value = sdk_routing.sdkRoutingTransportmodeToFfi((_obj as NavigatorInterface).trackingTransportMode);
  return 0;
}

int _sdkNavigationNavigatorinterfacetrackingTransportModeSetStatic(Object _obj, int _value) {
  try {
    (_obj as NavigatorInterface).trackingTransportMode =
      sdk_routing.sdkRoutingTransportmodeFromFfi(_value);
  } finally {
    sdk_routing.sdkRoutingTransportmodeReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceassumedTrackingTransportModeGetStatic(Object _obj, Pointer<Uint32> _result) {
  _result.value = sdk_transport.sdkTransportTransportmodeToFfi((_obj as NavigatorInterface).assumedTrackingTransportMode);
  return 0;
}

int _sdkNavigationNavigatorinterfaceassumedTrackingTransportModeSetStatic(Object _obj, int _value) {
  try {
    (_obj as NavigatorInterface).assumedTrackingTransportMode =
      sdk_transport.sdkTransportTransportmodeFromFfi(_value);
  } finally {
    sdk_transport.sdkTransportTransportmodeReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacenavigableLocationListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationNavigablelocationlistenerToFfiNullable((_obj as NavigatorInterface).navigableLocationListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacenavigableLocationListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).navigableLocationListener =
      sdkNavigationNavigablelocationlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationNavigablelocationlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacerouteProgressListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationRouteprogresslistenerToFfiNullable((_obj as NavigatorInterface).routeProgressListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacerouteProgressListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).routeProgressListener =
      sdkNavigationRouteprogresslistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationRouteprogresslistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacerouteDeviationListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationRoutedeviationlistenerToFfiNullable((_obj as NavigatorInterface).routeDeviationListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacerouteDeviationListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).routeDeviationListener =
      sdkNavigationRoutedeviationlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationRoutedeviationlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacemaneuverNotificationListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationManeuvernotificationlistenerToFfiNullable((_obj as NavigatorInterface).maneuverNotificationListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacemaneuverNotificationListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).maneuverNotificationListener =
      sdkNavigationManeuvernotificationlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationManeuvernotificationlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacemilestoneStatusListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationMilestonestatuslistenerToFfiNullable((_obj as NavigatorInterface).milestoneStatusListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacemilestoneStatusListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).milestoneStatusListener =
      sdkNavigationMilestonestatuslistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationMilestonestatuslistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacemilestoneReachedListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationMilestonereachedlistenerToFfiNullable((_obj as NavigatorInterface).milestoneReachedListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacemilestoneReachedListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).milestoneReachedListener =
      sdkNavigationMilestonereachedlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationMilestonereachedlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacedestinationReachedListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationDestinationreachedlistenerToFfiNullable((_obj as NavigatorInterface).destinationReachedListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacedestinationReachedListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).destinationReachedListener =
      sdkNavigationDestinationreachedlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationDestinationreachedlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacespeedWarningListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationSpeedwarninglistenerToFfiNullable((_obj as NavigatorInterface).speedWarningListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacespeedWarningListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).speedWarningListener =
      sdkNavigationSpeedwarninglistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationSpeedwarninglistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacemaneuverViewLaneAssistanceListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationManeuverviewlaneassistancelistenerToFfiNullable((_obj as NavigatorInterface).maneuverViewLaneAssistanceListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacemaneuverViewLaneAssistanceListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).maneuverViewLaneAssistanceListener =
      sdkNavigationManeuverviewlaneassistancelistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationManeuverviewlaneassistancelistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacejunctionViewLaneAssistanceListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationJunctionviewlaneassistancelistenerToFfiNullable((_obj as NavigatorInterface).junctionViewLaneAssistanceListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacejunctionViewLaneAssistanceListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).junctionViewLaneAssistanceListener =
      sdkNavigationJunctionviewlaneassistancelistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationJunctionviewlaneassistancelistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacesafetyCameraWarningListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationSafetycamerawarninglistenerToFfiNullable((_obj as NavigatorInterface).safetyCameraWarningListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacesafetyCameraWarningListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).safetyCameraWarningListener =
      sdkNavigationSafetycamerawarninglistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationSafetycamerawarninglistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacetruckRestrictionsWarningListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationTruckrestrictionswarninglistenerToFfiNullable((_obj as NavigatorInterface).truckRestrictionsWarningListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacetruckRestrictionsWarningListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).truckRestrictionsWarningListener =
      sdkNavigationTruckrestrictionswarninglistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationTruckrestrictionswarninglistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacepostActionListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationPostactionlistenerToFfiNullable((_obj as NavigatorInterface).postActionListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacepostActionListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).postActionListener =
      sdkNavigationPostactionlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationPostactionlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacespeedLimitListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationSpeedlimitlistenerToFfiNullable((_obj as NavigatorInterface).speedLimitListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacespeedLimitListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).speedLimitListener =
      sdkNavigationSpeedlimitlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationSpeedlimitlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceroadTextsListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationRoadtextslistenerToFfiNullable((_obj as NavigatorInterface).roadTextsListener);
  return 0;
}

int _sdkNavigationNavigatorinterfaceroadTextsListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).roadTextsListener =
      sdkNavigationRoadtextslistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationRoadtextslistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfaceroadAttributesListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationRoadattributeslistenerToFfiNullable((_obj as NavigatorInterface).roadAttributesListener);
  return 0;
}

int _sdkNavigationNavigatorinterfaceroadAttributesListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).roadAttributesListener =
      sdkNavigationRoadattributeslistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationRoadattributeslistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacespatialManeuverNotificationListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationSpatialmaneuvernotificationlistenerToFfiNullable((_obj as NavigatorInterface).spatialManeuverNotificationListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacespatialManeuverNotificationListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).spatialManeuverNotificationListener =
      sdkNavigationSpatialmaneuvernotificationlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationSpatialmaneuvernotificationlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacespatialManeuverAzimuthListenerGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationSpatialmaneuverazimuthlistenerToFfiNullable((_obj as NavigatorInterface).spatialManeuverAzimuthListener);
  return 0;
}

int _sdkNavigationNavigatorinterfacespatialManeuverAzimuthListenerSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).spatialManeuverAzimuthListener =
      sdkNavigationSpatialmaneuverazimuthlistenerFromFfiNullable(_value);
  } finally {
    sdkNavigationSpatialmaneuverazimuthlistenerReleaseFfiHandleNullable(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacemaneuverNotificationOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationManeuvernotificationoptionsToFfi((_obj as NavigatorInterface).maneuverNotificationOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfacemaneuverNotificationOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).maneuverNotificationOptions =
      sdkNavigationManeuvernotificationoptionsFromFfi(_value);
  } finally {
    sdkNavigationManeuvernotificationoptionsReleaseFfiHandle(_value);
  }
  return 0;
}
int _sdkNavigationNavigatorinterfacespeedWarningOptionsGetStatic(Object _obj, Pointer<Pointer<Void>> _result) {
  _result.value = sdkNavigationSpeedwarningoptionsToFfi((_obj as NavigatorInterface).speedWarningOptions);
  return 0;
}

int _sdkNavigationNavigatorinterfacespeedWarningOptionsSetStatic(Object _obj, Pointer<Void> _value) {
  try {
    (_obj as NavigatorInterface).speedWarningOptions =
      sdkNavigationSpeedwarningoptionsFromFfi(_value);
  } finally {
    sdkNavigationSpeedwarningoptionsReleaseFfiHandle(_value);
  }
  return 0;
}

Pointer<Void> sdkNavigationNavigatorinterfaceToFfi(NavigatorInterface value) {
  if (value is __lib.NativeBase) return _sdkNavigationNavigatorinterfaceCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkNavigationNavigatorinterfaceCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceonLocationUpdatedStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Int32, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacegetManeuverStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint32, Uint32, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacegetManeuverNotificationTimingOptionsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint32, Uint32, Pointer<Void>)>(_sdkNavigationNavigatorinterfacesetManeuverNotificationTimingOptionsStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacerouteGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacerouteSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint32>)>(_sdkNavigationNavigatorinterfacetrackingTransportModeGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint32)>(_sdkNavigationNavigatorinterfacetrackingTransportModeSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Uint32>)>(_sdkNavigationNavigatorinterfaceassumedTrackingTransportModeGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Uint32)>(_sdkNavigationNavigatorinterfaceassumedTrackingTransportModeSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacenavigableLocationListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacenavigableLocationListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacerouteProgressListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacerouteProgressListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacerouteDeviationListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacerouteDeviationListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacemaneuverNotificationListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacemaneuverNotificationListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacemilestoneStatusListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacemilestoneStatusListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacemilestoneReachedListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacemilestoneReachedListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacedestinationReachedListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacedestinationReachedListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacespeedWarningListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacespeedWarningListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacemaneuverViewLaneAssistanceListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacemaneuverViewLaneAssistanceListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacejunctionViewLaneAssistanceListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacejunctionViewLaneAssistanceListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacesafetyCameraWarningListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacesafetyCameraWarningListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacetruckRestrictionsWarningListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacetruckRestrictionsWarningListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacepostActionListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacepostActionListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacespeedLimitListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacespeedLimitListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceroadTextsListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceroadTextsListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfaceroadAttributesListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfaceroadAttributesListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacespatialManeuverNotificationListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacespatialManeuverNotificationListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacespatialManeuverAzimuthListenerGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacespatialManeuverAzimuthListenerSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacemaneuverNotificationOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacemaneuverNotificationOptionsSetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Pointer<Void>>)>(_sdkNavigationNavigatorinterfacespeedWarningOptionsGetStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkNavigationNavigatorinterfacespeedWarningOptionsSetStatic, __lib.unknownError)
  );

  return result;
}

NavigatorInterface sdkNavigationNavigatorinterfaceFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is NavigatorInterface) return instance;

  final _typeIdHandle = _sdkNavigationNavigatorinterfaceGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationNavigatorinterfaceCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : NavigatorInterface$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationNavigatorinterfaceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationNavigatorinterfaceReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationNavigatorinterfaceReleaseHandle(handle);

Pointer<Void> sdkNavigationNavigatorinterfaceToFfiNullable(NavigatorInterface? value) =>
  value != null ? sdkNavigationNavigatorinterfaceToFfi(value) : Pointer<Void>.fromAddress(0);

NavigatorInterface? sdkNavigationNavigatorinterfaceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationNavigatorinterfaceFromFfi(handle) : null;

void sdkNavigationNavigatorinterfaceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationNavigatorinterfaceReleaseHandle(handle);

// End of NavigatorInterface "private" section.


