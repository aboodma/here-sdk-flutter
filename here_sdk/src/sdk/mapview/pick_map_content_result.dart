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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/localized_text.dart';
import 'package:here_sdk/src/sdk/mapview/pick_map_features_result.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_base.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_impact.dart';
import 'package:here_sdk/src/sdk/traffic/traffic_incident_type.dart';

/// A class that contains possible results from picking map content on the map scene.
abstract class PickMapContentResult {

  /// Gets a list of POIs at the location of picking.
  List<PickPoiResult> get pois;

  List<PickTrafficIncidentResult> get trafficIncidents;

}

/// Carries the result of picking a Carto traffic incident object.
///
/// Description of incident is not currently present in map data, so
/// [TrafficIncidentBase.description] always returns an empty string.
abstract class PickTrafficIncidentResult implements TrafficIncidentBase {

  String get originalId;

  GeoCoordinates get coordinates;

}


// PickTrafficIncidentResult "private" section, not exported.

final _sdkMapviewPickmapcontentresultforflutterTrafficincidentresultRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_PickMapContentResultForFlutter_TrafficIncidentResult_register_finalizer'));
final _sdkMapviewPickmapcontentresultforflutterTrafficincidentresultCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResultForFlutter_TrafficIncidentResult_copy_handle'));
final _sdkMapviewPickmapcontentresultforflutterTrafficincidentresultReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResultForFlutter_TrafficIncidentResult_release_handle'));
final _sdkMapviewPickmapcontentresultforflutterTrafficincidentresultGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResultForFlutter_TrafficIncidentResult_get_type_id'));


class PickTrafficIncidentResult$Impl extends __lib.NativeBase implements PickTrafficIncidentResult {

  PickTrafficIncidentResult$Impl(Pointer<Void> handle) : super(handle);

  @override
  String get originalId {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResultForFlutter_TrafficIncidentResult_originalId_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  GeoCoordinates get coordinates {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResultForFlutter_TrafficIncidentResult_coordinates_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeocoordinatesFromFfi(__resultHandle);
    } finally {
      sdkCoreGeocoordinatesReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  TrafficIncidentImpact get impact {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResultForFlutter_TrafficIncidentResult_impact_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficTrafficincidentimpactFromFfi(__resultHandle);
    } finally {
      sdkTrafficTrafficincidentimpactReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  TrafficIncidentType get type {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResultForFlutter_TrafficIncidentResult_type_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkTrafficTrafficincidenttypeFromFfi(__resultHandle);
    } finally {
      sdkTrafficTrafficincidenttypeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  LocalizedText get description {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResultForFlutter_TrafficIncidentResult_description_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreLocalizedtextFromFfi(__resultHandle);
    } finally {
      sdkCoreLocalizedtextReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  DateTime? get startTime {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResultForFlutter_TrafficIncidentResult_startTime_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return dateFromFfiNullable(__resultHandle);
    } finally {
      dateReleaseFfiHandleNullable(__resultHandle);

    }

  }


  @override
  DateTime? get endTime {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResultForFlutter_TrafficIncidentResult_endTime_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return dateFromFfiNullable(__resultHandle);
    } finally {
      dateReleaseFfiHandleNullable(__resultHandle);

    }

  }



}

Pointer<Void> sdkMapviewPickmapcontentresultforflutterTrafficincidentresultToFfi(PickTrafficIncidentResult value) =>
  _sdkMapviewPickmapcontentresultforflutterTrafficincidentresultCopyHandle((value as __lib.NativeBase).handle);

PickTrafficIncidentResult sdkMapviewPickmapcontentresultforflutterTrafficincidentresultFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PickTrafficIncidentResult) return instance;

  final _typeIdHandle = _sdkMapviewPickmapcontentresultforflutterTrafficincidentresultGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkMapviewPickmapcontentresultforflutterTrafficincidentresultCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : PickTrafficIncidentResult$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewPickmapcontentresultforflutterTrafficincidentresultRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewPickmapcontentresultforflutterTrafficincidentresultReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewPickmapcontentresultforflutterTrafficincidentresultReleaseHandle(handle);

Pointer<Void> sdkMapviewPickmapcontentresultforflutterTrafficincidentresultToFfiNullable(PickTrafficIncidentResult? value) =>
  value != null ? sdkMapviewPickmapcontentresultforflutterTrafficincidentresultToFfi(value) : Pointer<Void>.fromAddress(0);

PickTrafficIncidentResult? sdkMapviewPickmapcontentresultforflutterTrafficincidentresultFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewPickmapcontentresultforflutterTrafficincidentresultFromFfi(handle) : null;

void sdkMapviewPickmapcontentresultforflutterTrafficincidentresultReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewPickmapcontentresultforflutterTrafficincidentresultReleaseHandle(handle);

// End of PickTrafficIncidentResult "private" section.

// PickMapContentResult "private" section, not exported.

final _sdkMapviewPickmapcontentresultforflutterRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_PickMapContentResultForFlutter_register_finalizer'));
final _sdkMapviewPickmapcontentresultforflutterCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResultForFlutter_copy_handle'));
final _sdkMapviewPickmapcontentresultforflutterReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_PickMapContentResultForFlutter_release_handle'));


class PickMapContentResult$Impl extends __lib.NativeBase implements PickMapContentResult {

  PickMapContentResult$Impl(Pointer<Void> handle) : super(handle);

  @override
  List<PickPoiResult> get pois {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResultForFlutter_pois_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkMapviewHarpBindingslistofSdkMapviewPickmapfeaturesresultPoiresultFromFfi(__resultHandle);
    } finally {
      heresdkMapviewHarpBindingslistofSdkMapviewPickmapfeaturesresultPoiresultReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  List<PickTrafficIncidentResult> get trafficIncidents {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_PickMapContentResultForFlutter_trafficIncidents_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkMapviewHarpBindingslistofSdkMapviewPickmapcontentresultforflutterTrafficincidentresultFromFfi(__resultHandle);
    } finally {
      heresdkMapviewHarpBindingslistofSdkMapviewPickmapcontentresultforflutterTrafficincidentresultReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkMapviewPickmapcontentresultforflutterToFfi(PickMapContentResult value) =>
  _sdkMapviewPickmapcontentresultforflutterCopyHandle((value as __lib.NativeBase).handle);

PickMapContentResult sdkMapviewPickmapcontentresultforflutterFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is PickMapContentResult) return instance;

  final _copiedHandle = _sdkMapviewPickmapcontentresultforflutterCopyHandle(handle);
  final result = PickMapContentResult$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewPickmapcontentresultforflutterRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewPickmapcontentresultforflutterReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewPickmapcontentresultforflutterReleaseHandle(handle);

Pointer<Void> sdkMapviewPickmapcontentresultforflutterToFfiNullable(PickMapContentResult? value) =>
  value != null ? sdkMapviewPickmapcontentresultforflutterToFfi(value) : Pointer<Void>.fromAddress(0);

PickMapContentResult? sdkMapviewPickmapcontentresultforflutterFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewPickmapcontentresultforflutterFromFfi(handle) : null;

void sdkMapviewPickmapcontentresultforflutterReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewPickmapcontentresultforflutterReleaseHandle(handle);

// End of PickMapContentResult "private" section.


