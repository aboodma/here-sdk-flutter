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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/avoidance_options.dart';
import 'package:here_sdk/src/sdk/routing/e_v_consumption_model.dart';
import 'package:here_sdk/src/sdk/routing/hazardous_good.dart';
import 'package:here_sdk/src/sdk/routing/route_options.dart';
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';
import 'package:here_sdk/src/sdk/routing/truck_specifications.dart' as sdk_routing;
import 'package:here_sdk/src/sdk/routing/tunnel_category.dart' as sdk_routing;
import 'package:here_sdk/src/sdk/transport/hazardous_material.dart';
import 'package:here_sdk/src/sdk/transport/truck_specifications.dart' as sdk_transport;
import 'package:here_sdk/src/sdk/transport/tunnel_category.dart' as sdk_transport;

/// All the options to specify how a route for an electric truck should be calculated.

class EVTruckOptions {
  /// Specifies the common route calculation options.
  RouteOptions routeOptions;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  RouteTextOptions textOptions;

  /// Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.
  AvoidanceOptions avoidanceOptions;

  /// Detailed truck specifications such as dimensions and weight.
  @Deprecated("Will be removed in v4.14.0. Please use [EVTruckOptions.truckSpecifications] instead.")
  sdk_routing.TruckSpecifications specifications;

  /// Detailed truck specifications such as dimensions and weight.
  sdk_transport.TruckSpecifications truckSpecifications;

  /// Specifies the tunnel categories to restrict certain route links.
  /// The route will pass only through tunnels of a less strict category.
  /// Refer to [TunnelCategory] for the available options.
  @Deprecated("Will be removed in v4.12.0. Please use [EVTruckOptions.linkTunnelCategory] instead.")
  sdk_routing.TunnelCategory? tunnelCategory;

  /// Specifies the tunnel categories to restrict certain route links.
  /// The route will pass only through tunnels of a less strict category.
  /// Refer to [TunnelCategory] for the available options.
  sdk_transport.TunnelCategory? linkTunnelCategory;

  /// Specifies a list of hazardous materials shipped in the vehicle.
  /// Refer to [HazardousGood] for the available options.
  @Deprecated("Will be removed in v4.13.0. Please use [EVTruckOptions.hazardousMaterials] instead.")
  List<HazardousGood> hazardousGoods;

  /// Specifies a list of hazardous materials shipped in the vehicle.
  /// Refer to [HazardousMaterial] for the available options.
  List<HazardousMaterial> hazardousMaterials;

  /// Vehicle specific parameters, which are then used to calculate energy consumption
  /// for the vehicle on a given route.
  EVConsumptionModel consumptionModel;

  EVTruckOptions._(this.routeOptions, this.textOptions, this.avoidanceOptions, this.specifications, this.truckSpecifications, this.tunnelCategory, this.linkTunnelCategory, this.hazardousGoods, this.hazardousMaterials, this.consumptionModel);
  EVTruckOptions.withDefaults()
      : routeOptions = RouteOptions.withDefaults(), textOptions = RouteTextOptions.withDefaults(), avoidanceOptions = AvoidanceOptions.withDefaults(), specifications = sdk_routing.TruckSpecifications(), truckSpecifications = sdk_transport.TruckSpecifications(), tunnelCategory = null, linkTunnelCategory = null, hazardousGoods = [], hazardousMaterials = [], consumptionModel = EVConsumptionModel.withDefaults();
  @Deprecated("Will be removed in v4.13.0. Please use EVTruckOptions.withDefaults() instead.")
  EVTruckOptions(this.routeOptions, this.textOptions, this.avoidanceOptions, this.specifications, this.tunnelCategory, this.hazardousGoods, this.consumptionModel)
      : truckSpecifications = sdk_transport.TruckSpecifications(), linkTunnelCategory = null, hazardousMaterials = [];
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EVTruckOptions) return false;
    EVTruckOptions _other = other;
    return routeOptions == _other.routeOptions &&
        textOptions == _other.textOptions &&
        avoidanceOptions == _other.avoidanceOptions &&
        specifications == _other.specifications &&
        truckSpecifications == _other.truckSpecifications &&
        tunnelCategory == _other.tunnelCategory &&
        linkTunnelCategory == _other.linkTunnelCategory &&
        DeepCollectionEquality().equals(hazardousGoods, _other.hazardousGoods) &&
        DeepCollectionEquality().equals(hazardousMaterials, _other.hazardousMaterials) &&
        consumptionModel == _other.consumptionModel;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + routeOptions.hashCode;
    result = 31 * result + textOptions.hashCode;
    result = 31 * result + avoidanceOptions.hashCode;
    result = 31 * result + specifications.hashCode;
    result = 31 * result + truckSpecifications.hashCode;
    result = 31 * result + tunnelCategory.hashCode;
    result = 31 * result + linkTunnelCategory.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(hazardousGoods);
    result = 31 * result + DeepCollectionEquality().hash(hazardousMaterials);
    result = 31 * result + consumptionModel.hashCode;
    return result;
  }
}


// EVTruckOptions "private" section, not exported.

final _sdkRoutingEvtruckoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_EVTruckOptions_create_handle'));
final _sdkRoutingEvtruckoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVTruckOptions_release_handle'));
final _sdkRoutingEvtruckoptionsGetFieldrouteOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVTruckOptions_get_field_routeOptions'));
final _sdkRoutingEvtruckoptionsGetFieldtextOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVTruckOptions_get_field_textOptions'));
final _sdkRoutingEvtruckoptionsGetFieldavoidanceOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVTruckOptions_get_field_avoidanceOptions'));
final _sdkRoutingEvtruckoptionsGetFieldspecifications = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVTruckOptions_get_field_specifications'));
final _sdkRoutingEvtruckoptionsGetFieldtruckSpecifications = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVTruckOptions_get_field_truckSpecifications'));
final _sdkRoutingEvtruckoptionsGetFieldtunnelCategory = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVTruckOptions_get_field_tunnelCategory'));
final _sdkRoutingEvtruckoptionsGetFieldlinkTunnelCategory = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVTruckOptions_get_field_linkTunnelCategory'));
final _sdkRoutingEvtruckoptionsGetFieldhazardousGoods = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVTruckOptions_get_field_hazardousGoods'));
final _sdkRoutingEvtruckoptionsGetFieldhazardousMaterials = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVTruckOptions_get_field_hazardousMaterials'));
final _sdkRoutingEvtruckoptionsGetFieldconsumptionModel = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVTruckOptions_get_field_consumptionModel'));



Pointer<Void> sdkRoutingEvtruckoptionsToFfi(EVTruckOptions value) {
  final _routeOptionsHandle = sdkRoutingRouteoptionsToFfi(value.routeOptions);
  final _textOptionsHandle = sdkRoutingRoutetextoptionsToFfi(value.textOptions);
  final _avoidanceOptionsHandle = sdkRoutingAvoidanceoptionsToFfi(value.avoidanceOptions);
  final _specificationsHandle = sdk_routing.sdkRoutingTruckspecificationsToFfi(value.specifications);
  final _truckSpecificationsHandle = sdk_transport.sdkTransportTruckspecificationsToFfi(value.truckSpecifications);
  final _tunnelCategoryHandle = sdk_routing.sdkRoutingTunnelcategoryToFfiNullable(value.tunnelCategory);
  final _linkTunnelCategoryHandle = sdk_transport.sdkTransportTunnelcategoryToFfiNullable(value.linkTunnelCategory);
  final _hazardousGoodsHandle = heresdkRoutingCommonBindingslistofSdkRoutingHazardousgoodToFfi(value.hazardousGoods);
  final _hazardousMaterialsHandle = heresdkRoutingCommonBindingslistofSdkTransportHazardousmaterialToFfi(value.hazardousMaterials);
  final _consumptionModelHandle = sdkRoutingEvconsumptionmodelToFfi(value.consumptionModel);
  final _result = _sdkRoutingEvtruckoptionsCreateHandle(_routeOptionsHandle, _textOptionsHandle, _avoidanceOptionsHandle, _specificationsHandle, _truckSpecificationsHandle, _tunnelCategoryHandle, _linkTunnelCategoryHandle, _hazardousGoodsHandle, _hazardousMaterialsHandle, _consumptionModelHandle);
  sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
  sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
  sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
  sdk_routing.sdkRoutingTruckspecificationsReleaseFfiHandle(_specificationsHandle);
  sdk_transport.sdkTransportTruckspecificationsReleaseFfiHandle(_truckSpecificationsHandle);
  sdk_routing.sdkRoutingTunnelcategoryReleaseFfiHandleNullable(_tunnelCategoryHandle);
  sdk_transport.sdkTransportTunnelcategoryReleaseFfiHandleNullable(_linkTunnelCategoryHandle);
  heresdkRoutingCommonBindingslistofSdkRoutingHazardousgoodReleaseFfiHandle(_hazardousGoodsHandle);
  heresdkRoutingCommonBindingslistofSdkTransportHazardousmaterialReleaseFfiHandle(_hazardousMaterialsHandle);
  sdkRoutingEvconsumptionmodelReleaseFfiHandle(_consumptionModelHandle);
  return _result;
}

EVTruckOptions sdkRoutingEvtruckoptionsFromFfi(Pointer<Void> handle) {
  final _routeOptionsHandle = _sdkRoutingEvtruckoptionsGetFieldrouteOptions(handle);
  final _textOptionsHandle = _sdkRoutingEvtruckoptionsGetFieldtextOptions(handle);
  final _avoidanceOptionsHandle = _sdkRoutingEvtruckoptionsGetFieldavoidanceOptions(handle);
  final _specificationsHandle = _sdkRoutingEvtruckoptionsGetFieldspecifications(handle);
  final _truckSpecificationsHandle = _sdkRoutingEvtruckoptionsGetFieldtruckSpecifications(handle);
  final _tunnelCategoryHandle = _sdkRoutingEvtruckoptionsGetFieldtunnelCategory(handle);
  final _linkTunnelCategoryHandle = _sdkRoutingEvtruckoptionsGetFieldlinkTunnelCategory(handle);
  final _hazardousGoodsHandle = _sdkRoutingEvtruckoptionsGetFieldhazardousGoods(handle);
  final _hazardousMaterialsHandle = _sdkRoutingEvtruckoptionsGetFieldhazardousMaterials(handle);
  final _consumptionModelHandle = _sdkRoutingEvtruckoptionsGetFieldconsumptionModel(handle);
  try {
    return EVTruckOptions._(
      sdkRoutingRouteoptionsFromFfi(_routeOptionsHandle), 
      sdkRoutingRoutetextoptionsFromFfi(_textOptionsHandle), 
      sdkRoutingAvoidanceoptionsFromFfi(_avoidanceOptionsHandle), 
      sdk_routing.sdkRoutingTruckspecificationsFromFfi(_specificationsHandle), 
      sdk_transport.sdkTransportTruckspecificationsFromFfi(_truckSpecificationsHandle), 
      sdk_routing.sdkRoutingTunnelcategoryFromFfiNullable(_tunnelCategoryHandle), 
      sdk_transport.sdkTransportTunnelcategoryFromFfiNullable(_linkTunnelCategoryHandle), 
      heresdkRoutingCommonBindingslistofSdkRoutingHazardousgoodFromFfi(_hazardousGoodsHandle), 
      heresdkRoutingCommonBindingslistofSdkTransportHazardousmaterialFromFfi(_hazardousMaterialsHandle), 
      sdkRoutingEvconsumptionmodelFromFfi(_consumptionModelHandle)
    );
  } finally {
    sdkRoutingRouteoptionsReleaseFfiHandle(_routeOptionsHandle);
    sdkRoutingRoutetextoptionsReleaseFfiHandle(_textOptionsHandle);
    sdkRoutingAvoidanceoptionsReleaseFfiHandle(_avoidanceOptionsHandle);
    sdk_routing.sdkRoutingTruckspecificationsReleaseFfiHandle(_specificationsHandle);
    sdk_transport.sdkTransportTruckspecificationsReleaseFfiHandle(_truckSpecificationsHandle);
    sdk_routing.sdkRoutingTunnelcategoryReleaseFfiHandleNullable(_tunnelCategoryHandle);
    sdk_transport.sdkTransportTunnelcategoryReleaseFfiHandleNullable(_linkTunnelCategoryHandle);
    heresdkRoutingCommonBindingslistofSdkRoutingHazardousgoodReleaseFfiHandle(_hazardousGoodsHandle);
    heresdkRoutingCommonBindingslistofSdkTransportHazardousmaterialReleaseFfiHandle(_hazardousMaterialsHandle);
    sdkRoutingEvconsumptionmodelReleaseFfiHandle(_consumptionModelHandle);
  }
}

void sdkRoutingEvtruckoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingEvtruckoptionsReleaseHandle(handle);

// Nullable EVTruckOptions

final _sdkRoutingEvtruckoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVTruckOptions_create_handle_nullable'));
final _sdkRoutingEvtruckoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVTruckOptions_release_handle_nullable'));
final _sdkRoutingEvtruckoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_EVTruckOptions_get_value_nullable'));

Pointer<Void> sdkRoutingEvtruckoptionsToFfiNullable(EVTruckOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingEvtruckoptionsToFfi(value);
  final result = _sdkRoutingEvtruckoptionsCreateHandleNullable(_handle);
  sdkRoutingEvtruckoptionsReleaseFfiHandle(_handle);
  return result;
}

EVTruckOptions? sdkRoutingEvtruckoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingEvtruckoptionsGetValueNullable(handle);
  final result = sdkRoutingEvtruckoptionsFromFfi(_handle);
  sdkRoutingEvtruckoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingEvtruckoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingEvtruckoptionsReleaseHandleNullable(handle);

// End of EVTruckOptions "private" section.


