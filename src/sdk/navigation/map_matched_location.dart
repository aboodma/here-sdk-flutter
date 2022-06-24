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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/routing/segment_reference.dart';

/// Describes a map-matched location in the world at a given time.

class MapMatchedLocation {
  /// The geographic coordinates of the map-matched location.
  GeoCoordinates coordinates;

  /// The bearing orientation points to the direction of travel, and has the same angle as the
  /// street where it is matched to. Therefore, it must not necessarily be the same as the
  /// bearing of a location source.
  /// Starts at 0 in the geographic north and rotates in a clockwise direction around the
  /// compass. It means that for going north it's equal to 0, for northeast it's equal to 45,
  /// for east it's equal to 90, and so on.
  /// If it cannot be determined, the value is `null`. Otherwise, it is guaranteed to be in the
  /// range [0, 360).
  double? bearingInDegrees;

  /// Reference to the current segment.
  SegmentReference segmentReference;

  /// Offset from start of segment in centimeters.
  int segmentOffsetInCentimeters;

  /// Confidence level (between 0 and 1) of the matched location
  double confidence;

  MapMatchedLocation._(this.coordinates, this.bearingInDegrees, this.segmentReference, this.segmentOffsetInCentimeters, this.confidence);
  MapMatchedLocation(GeoCoordinates coordinates, double? bearingInDegrees)
    : coordinates = coordinates, bearingInDegrees = bearingInDegrees, segmentReference = SegmentReference.withDefaults(), segmentOffsetInCentimeters = 0, confidence = 0.0;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MapMatchedLocation) return false;
    MapMatchedLocation _other = other;
    return coordinates == _other.coordinates &&
        bearingInDegrees == _other.bearingInDegrees &&
        segmentReference == _other.segmentReference &&
        segmentOffsetInCentimeters == _other.segmentOffsetInCentimeters &&
        confidence == _other.confidence;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + coordinates.hashCode;
    result = 31 * result + bearingInDegrees.hashCode;
    result = 31 * result + segmentReference.hashCode;
    result = 31 * result + segmentOffsetInCentimeters.hashCode;
    result = 31 * result + confidence.hashCode;
    return result;
  }
}


// MapMatchedLocation "private" section, not exported.

final _sdkNavigationMapmatchedlocationCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint32, Double),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int, double)
  >('here_sdk_sdk_navigation_MapMatchedLocation_create_handle'));
final _sdkNavigationMapmatchedlocationReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MapMatchedLocation_release_handle'));
final _sdkNavigationMapmatchedlocationGetFieldcoordinates = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MapMatchedLocation_get_field_coordinates'));
final _sdkNavigationMapmatchedlocationGetFieldbearingInDegrees = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MapMatchedLocation_get_field_bearingInDegrees'));
final _sdkNavigationMapmatchedlocationGetFieldsegmentReference = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MapMatchedLocation_get_field_segmentReference'));
final _sdkNavigationMapmatchedlocationGetFieldsegmentOffsetInCentimeters = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MapMatchedLocation_get_field_segmentOffsetInCentimeters'));
final _sdkNavigationMapmatchedlocationGetFieldconfidence = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MapMatchedLocation_get_field_confidence'));



Pointer<Void> sdkNavigationMapmatchedlocationToFfi(MapMatchedLocation value) {
  final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(value.coordinates);
  final _bearingInDegreesHandle = doubleToFfiNullable(value.bearingInDegrees);
  final _segmentReferenceHandle = sdkRoutingSegmentreferenceToFfi(value.segmentReference);
  final _segmentOffsetInCentimetersHandle = (value.segmentOffsetInCentimeters);
  final _confidenceHandle = (value.confidence);
  final _result = _sdkNavigationMapmatchedlocationCreateHandle(_coordinatesHandle, _bearingInDegreesHandle, _segmentReferenceHandle, _segmentOffsetInCentimetersHandle, _confidenceHandle);
  sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
  doubleReleaseFfiHandleNullable(_bearingInDegreesHandle);
  sdkRoutingSegmentreferenceReleaseFfiHandle(_segmentReferenceHandle);
  
  
  return _result;
}

MapMatchedLocation sdkNavigationMapmatchedlocationFromFfi(Pointer<Void> handle) {
  final _coordinatesHandle = _sdkNavigationMapmatchedlocationGetFieldcoordinates(handle);
  final _bearingInDegreesHandle = _sdkNavigationMapmatchedlocationGetFieldbearingInDegrees(handle);
  final _segmentReferenceHandle = _sdkNavigationMapmatchedlocationGetFieldsegmentReference(handle);
  final _segmentOffsetInCentimetersHandle = _sdkNavigationMapmatchedlocationGetFieldsegmentOffsetInCentimeters(handle);
  final _confidenceHandle = _sdkNavigationMapmatchedlocationGetFieldconfidence(handle);
  try {
    return MapMatchedLocation._(
      sdkCoreGeocoordinatesFromFfi(_coordinatesHandle), 
      doubleFromFfiNullable(_bearingInDegreesHandle), 
      sdkRoutingSegmentreferenceFromFfi(_segmentReferenceHandle), 
      (_segmentOffsetInCentimetersHandle), 
      (_confidenceHandle)
    );
  } finally {
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    doubleReleaseFfiHandleNullable(_bearingInDegreesHandle);
    sdkRoutingSegmentreferenceReleaseFfiHandle(_segmentReferenceHandle);
    
    
  }
}

void sdkNavigationMapmatchedlocationReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationMapmatchedlocationReleaseHandle(handle);

// Nullable MapMatchedLocation

final _sdkNavigationMapmatchedlocationCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MapMatchedLocation_create_handle_nullable'));
final _sdkNavigationMapmatchedlocationReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MapMatchedLocation_release_handle_nullable'));
final _sdkNavigationMapmatchedlocationGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_MapMatchedLocation_get_value_nullable'));

Pointer<Void> sdkNavigationMapmatchedlocationToFfiNullable(MapMatchedLocation? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationMapmatchedlocationToFfi(value);
  final result = _sdkNavigationMapmatchedlocationCreateHandleNullable(_handle);
  sdkNavigationMapmatchedlocationReleaseFfiHandle(_handle);
  return result;
}

MapMatchedLocation? sdkNavigationMapmatchedlocationFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationMapmatchedlocationGetValueNullable(handle);
  final result = sdkNavigationMapmatchedlocationFromFfi(_handle);
  sdkNavigationMapmatchedlocationReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationMapmatchedlocationReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationMapmatchedlocationReleaseHandleNullable(handle);

// End of MapMatchedLocation "private" section.


