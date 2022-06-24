// Copyright (c) 2019-2022 HERE Global B.V. and its affiliate(s).
// All rights reserved.
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
import 'package:here_sdk/src/sdk/core/angle_range.dart';
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:here_sdk/src/sdk/mapview/map_measure.dart';
import 'package:here_sdk/src/sdk/mapview/map_measure_range.dart';

/// Controls constraints on map camera parameters.
abstract class MapCameraLimits {

  /// Absolute minimum possible value of tilt angle.
  static final double minTilt = 0.0;

  /// Absolute maximum possible value of tilt angle.
  static final double maxTilt = 70.0;

  /// Absolute minimum possible value of zoom level.
  static final double minZoomLevel = 0.0;

  /// Absolute maximum possible value of zoom level.
  static final double maxZoomLevel = 22.0;

  /// Sets maximum tilt angle that can be set on the camera.
  ///
  /// All previously set tilt ranges are cleared and the minimum tilt - new maximum tilt range is applied for all zoom values.
  /// If current camera tilt is larger than this value,
  /// it will immediately be changed to the maximum set here.
  /// This method will fail if the value being set is
  /// smaller than minimum set tilt, smaller than absolute minimum value allowed
  /// or larger than absolute maximum value allowed.
  ///
  /// [degreesFromNadir] Maximum tilt angle, in degrees from the nadir direction at the target point.
  ///
  @Deprecated("Will be removed in v4.13.0. Use [MapCameraLimits.tiltRange] instead.")

  void setMaxTilt(double degreesFromNadir);
  /// Sets minimum tilt angle that can be set on the camera.
  ///
  /// All previously set tilt ranges are cleared and the new minimum tilt - maximum tilt range is applied for all zoom values.
  /// If current camera tilt is smaller than this value,
  /// it will immediately be changed to the minimum set here.
  /// This method will fail if the value being set is
  /// larger than maximum set tilt, smaller than absolute minimum value allowed
  /// or larger than absolute maximum value allowed.
  ///
  /// [degreesFromNadir] Minimum tilt angle, in degrees from the nadir direction at the target point.
  ///
  @Deprecated("Will be removed in v4.13.0. Use [MapCameraLimits.tiltRange] instead.")

  void setMinTilt(double degreesFromNadir);
  /// Sets maximum zoom level that can be set on the camera.
  ///
  /// If current camera zoom level is larger than this value,
  /// it will immediately be changed to the maximum set here.
  /// This method will fail if the value being set is
  /// smaller than minimum set zoom level, smaller than absolute minimum value allowed
  /// or larger than absolute maximum value allowed.
  ///
  /// [zoomLevel] The zoom level to set as maximum allowed value.
  ///
  @Deprecated("Will be removed in v4.13.0. Use [MapCameraLimits.zoomRange] instead.")

  void setMaxZoomLevel(double zoomLevel);
  /// Sets minimum zoom level that can be set on the camera.
  ///
  /// If current camera zoom level is smaller than this value,
  /// it will immediately be changed to the minimum set here.
  /// This method will fail if the value being set is
  /// larger than maximum set zoom level, smaller than absolute minimum value allowed
  /// or larger than absolute maximum value allowed.
  ///
  /// [zoomLevel] The zoom level to set as minimum allowed value.
  ///
  @Deprecated("Will be removed in v4.13.0. Use [MapCameraLimits.zoomRange] instead.")

  void setMinZoomLevel(double zoomLevel);
  /// Sets the bearing range within which to rotate the camera at a given zoom.
  ///
  /// The resulting camera bearing at a zoom is an interpolated value of the ranges set for closest matching zoom values.
  /// When no bearing range is specified for [MapCameraLimits.minZoomLevel], the bearing range set through [MapCameraLimits.bearingRange] is used for interpolation.
  /// Zoom values outside the supported zoom range are ignored.
  /// By default, the maximum bearing range for all zoom values is set during initialization.
  ///
  /// [zoom] Zoom at which the range is set.
  ///
  /// [bearingRange] Bearing range.
  ///
  void setBearingRangeAtZoom(MapMeasure zoom, AngleRange bearingRange);
  /// Clears bearing ranges for all zoom values and resets [MapCameraLimits.bearingRange] to default.
  ///
  void clearBearingRanges();
  /// Sets tilt ranges that can be set on the camera at given zoom.
  ///
  /// The resulting camera tilt at a zoom is an interpolated value of the ranges set for closest matching zoom values.
  /// When no tilt range is specified for [MapCameraLimits.minZoomLevel], the tilt range set through [MapCameraLimits.tiltRange] is used for interpolation.
  /// Zoom or tilt values outside the supported zoom and tilt range are ignored.
  /// By default, the maximum tilt range for all zoom values is set during initialization.
  ///
  /// [zoom] Zoom at which the range is set.
  ///
  /// [tiltRange] Tilt range.
  ///
  void setTiltRangeAtZoom(MapMeasure zoom, AngleRange tiltRange);
  /// Clears tilt ranges for all zoom values and resets [MapCameraLimits.tiltRange] to default.
  ///
  void clearTiltRanges();
  /// Gets the current tilt range. This range might not be yet active if no rendering
  /// cycle has been executed since the last call to set the range.
  AngleRange get tiltRange;
  /// Sets a new tilt limit range. This new limit range becomes active during the next rendering cycle.
  /// All previously set tilt ranges are cleared and the new tilt range is applied for all zoom values.
  set tiltRange(AngleRange value);

  /// Gets the bearing range set currently. This may not be active now if no rendering
  /// loop has been executed since the last call to set the range.
  AngleRange get bearingRange;
  /// Sets a new bearing range. It will be updated during the next rendering loop.
  /// All previously set bearing ranges are cleared and the new bearing range is applied for all zoom values.
  set bearingRange(AngleRange value);

  /// Gets the currently active camera zoom range.
  MapMeasureRange get zoomRange;
  /// Sets a new camera zoom range. This new limit range becomes active during the next rendering cycle.
  set zoomRange(MapMeasureRange value);

  /// Gets a GeoBox that limits the camera target to a specific geographical area. Absence of a value means that there is no limit.
  GeoBox? get targetArea;
  /// Sets a GeoBox that limits the camera target to a specific geographical area.
  set targetArea(GeoBox? value);

}

@Deprecated("Will be removed in v4.13.0.")
enum MapCameraLimitsErrorCode {
    /// Value is above absolute maximum allowed value.
    valueAboveAbsoluteMaximum,
    /// Value is below absolute minimum allowed value.
    valueBelowAbsoluteMinimum,
    /// The minimum value, if set, would be above the current maximum value.
    minimumAboveMaximum,
    /// The maximum value, if set, would be below the current minimum value.
    maximumBelowMinimum
}

// MapCameraLimitsErrorCode "private" section, not exported.

int sdkMapviewMapcameralimitsErrorcodeToFfi(MapCameraLimitsErrorCode value) {
  switch (value) {
  case MapCameraLimitsErrorCode.valueAboveAbsoluteMaximum:
    return 1;
  case MapCameraLimitsErrorCode.valueBelowAbsoluteMinimum:
    return 2;
  case MapCameraLimitsErrorCode.minimumAboveMaximum:
    return 3;
  case MapCameraLimitsErrorCode.maximumBelowMinimum:
    return 4;
  default:
    throw StateError("Invalid enum value $value for MapCameraLimitsErrorCode enum.");
  }
}

MapCameraLimitsErrorCode sdkMapviewMapcameralimitsErrorcodeFromFfi(int handle) {
  switch (handle) {
  case 1:
    return MapCameraLimitsErrorCode.valueAboveAbsoluteMaximum;
  case 2:
    return MapCameraLimitsErrorCode.valueBelowAbsoluteMinimum;
  case 3:
    return MapCameraLimitsErrorCode.minimumAboveMaximum;
  case 4:
    return MapCameraLimitsErrorCode.maximumBelowMinimum;
  default:
    throw StateError("Invalid numeric value $handle for MapCameraLimitsErrorCode enum.");
  }
}

void sdkMapviewMapcameralimitsErrorcodeReleaseFfiHandle(int handle) {}

final _sdkMapviewMapcameralimitsErrorcodeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_mapview_MapCameraLimits_ErrorCode_create_handle_nullable'));
final _sdkMapviewMapcameralimitsErrorcodeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_ErrorCode_release_handle_nullable'));
final _sdkMapviewMapcameralimitsErrorcodeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_ErrorCode_get_value_nullable'));

Pointer<Void> sdkMapviewMapcameralimitsErrorcodeToFfiNullable(MapCameraLimitsErrorCode? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewMapcameralimitsErrorcodeToFfi(value);
  final result = _sdkMapviewMapcameralimitsErrorcodeCreateHandleNullable(_handle);
  sdkMapviewMapcameralimitsErrorcodeReleaseFfiHandle(_handle);
  return result;
}

MapCameraLimitsErrorCode? sdkMapviewMapcameralimitsErrorcodeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewMapcameralimitsErrorcodeGetValueNullable(handle);
  final result = sdkMapviewMapcameralimitsErrorcodeFromFfi(_handle);
  sdkMapviewMapcameralimitsErrorcodeReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewMapcameralimitsErrorcodeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcameralimitsErrorcodeReleaseHandleNullable(handle);

// End of MapCameraLimitsErrorCode "private" section.
@Deprecated("Will be removed in v4.13.0.")
class MapCameraLimitsMapCameraLimitsExceptionException implements Exception {
  final MapCameraLimitsErrorCode error;
  MapCameraLimitsMapCameraLimitsExceptionException(this.error);
}

// MapCameraLimits "private" section, not exported.

final _sdkMapviewMapcameralimitsRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_mapview_MapCameraLimits_register_finalizer'));
final _sdkMapviewMapcameralimitsCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_copy_handle'));
final _sdkMapviewMapcameralimitsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_release_handle'));


final _setMaxTiltReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMaxTilt__Double_return_release_handle'));
final _setMaxTiltReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMaxTilt__Double_return_get_error'));
final _setMaxTiltReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMaxTilt__Double_return_has_error'));


final _setMinTiltReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMinTilt__Double_return_release_handle'));
final _setMinTiltReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMinTilt__Double_return_get_error'));
final _setMinTiltReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMinTilt__Double_return_has_error'));


final _setMaxZoomLevelReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMaxZoomLevel__Double_return_release_handle'));
final _setMaxZoomLevelReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMaxZoomLevel__Double_return_get_error'));
final _setMaxZoomLevelReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMaxZoomLevel__Double_return_has_error'));


final _setMinZoomLevelReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMinZoomLevel__Double_return_release_handle'));
final _setMinZoomLevelReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMinZoomLevel__Double_return_get_error'));
final _setMinZoomLevelReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_MapCameraLimits_setMinZoomLevel__Double_return_has_error'));






class MapCameraLimits$Impl extends __lib.NativeBase implements MapCameraLimits {

  MapCameraLimits$Impl(Pointer<Void> handle) : super(handle);

  @override
  void setMaxTilt(double degreesFromNadir) {
    final _setMaxTiltFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double), Pointer<Void> Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapCameraLimits_setMaxTilt__Double'));
    final _degreesFromNadirHandle = (degreesFromNadir);
    final _handle = this.handle;
    final __callResultHandle = _setMaxTiltFfi(_handle, __lib.LibraryContext.isolateId, _degreesFromNadirHandle);

    if (_setMaxTiltReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _setMaxTiltReturnGetError(__callResultHandle);
        _setMaxTiltReturnReleaseHandle(__callResultHandle);
        try {
          throw MapCameraLimitsMapCameraLimitsExceptionException(sdkMapviewMapcameralimitsErrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapcameralimitsErrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    _setMaxTiltReturnReleaseHandle(__callResultHandle);

  }

  @override
  void setMinTilt(double degreesFromNadir) {
    final _setMinTiltFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double), Pointer<Void> Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapCameraLimits_setMinTilt__Double'));
    final _degreesFromNadirHandle = (degreesFromNadir);
    final _handle = this.handle;
    final __callResultHandle = _setMinTiltFfi(_handle, __lib.LibraryContext.isolateId, _degreesFromNadirHandle);

    if (_setMinTiltReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _setMinTiltReturnGetError(__callResultHandle);
        _setMinTiltReturnReleaseHandle(__callResultHandle);
        try {
          throw MapCameraLimitsMapCameraLimitsExceptionException(sdkMapviewMapcameralimitsErrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapcameralimitsErrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    _setMinTiltReturnReleaseHandle(__callResultHandle);

  }

  @override
  void setMaxZoomLevel(double zoomLevel) {
    final _setMaxZoomLevelFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double), Pointer<Void> Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapCameraLimits_setMaxZoomLevel__Double'));
    final _zoomLevelHandle = (zoomLevel);
    final _handle = this.handle;
    final __callResultHandle = _setMaxZoomLevelFfi(_handle, __lib.LibraryContext.isolateId, _zoomLevelHandle);

    if (_setMaxZoomLevelReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _setMaxZoomLevelReturnGetError(__callResultHandle);
        _setMaxZoomLevelReturnReleaseHandle(__callResultHandle);
        try {
          throw MapCameraLimitsMapCameraLimitsExceptionException(sdkMapviewMapcameralimitsErrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapcameralimitsErrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    _setMaxZoomLevelReturnReleaseHandle(__callResultHandle);

  }

  @override
  void setMinZoomLevel(double zoomLevel) {
    final _setMinZoomLevelFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double), Pointer<Void> Function(Pointer<Void>, int, double)>('here_sdk_sdk_mapview_MapCameraLimits_setMinZoomLevel__Double'));
    final _zoomLevelHandle = (zoomLevel);
    final _handle = this.handle;
    final __callResultHandle = _setMinZoomLevelFfi(_handle, __lib.LibraryContext.isolateId, _zoomLevelHandle);

    if (_setMinZoomLevelReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _setMinZoomLevelReturnGetError(__callResultHandle);
        _setMinZoomLevelReturnReleaseHandle(__callResultHandle);
        try {
          throw MapCameraLimitsMapCameraLimitsExceptionException(sdkMapviewMapcameralimitsErrorcodeFromFfi(__errorHandle));
        } finally {
          sdkMapviewMapcameralimitsErrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    _setMinZoomLevelReturnReleaseHandle(__callResultHandle);

  }

  @override
  void setBearingRangeAtZoom(MapMeasure zoom, AngleRange bearingRange) {
    final _setBearingRangeAtZoomFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraLimits_setBearingRangeAtZoom__MapMeasure_AngleRange'));
    final _zoomHandle = sdkMapviewMapmeasureToFfi(zoom);
    final _bearingRangeHandle = sdkCoreAnglerangeToFfi(bearingRange);
    final _handle = this.handle;
    _setBearingRangeAtZoomFfi(_handle, __lib.LibraryContext.isolateId, _zoomHandle, _bearingRangeHandle);
    sdkMapviewMapmeasureReleaseFfiHandle(_zoomHandle);
    sdkCoreAnglerangeReleaseFfiHandle(_bearingRangeHandle);

  }

  @override
  void clearBearingRanges() {
    final _clearBearingRangesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraLimits_clearBearingRanges'));
    final _handle = this.handle;
    _clearBearingRangesFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void setTiltRangeAtZoom(MapMeasure zoom, AngleRange tiltRange) {
    final _setTiltRangeAtZoomFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraLimits_setTiltRangeAtZoom__MapMeasure_AngleRange'));
    final _zoomHandle = sdkMapviewMapmeasureToFfi(zoom);
    final _tiltRangeHandle = sdkCoreAnglerangeToFfi(tiltRange);
    final _handle = this.handle;
    _setTiltRangeAtZoomFfi(_handle, __lib.LibraryContext.isolateId, _zoomHandle, _tiltRangeHandle);
    sdkMapviewMapmeasureReleaseFfiHandle(_zoomHandle);
    sdkCoreAnglerangeReleaseFfiHandle(_tiltRangeHandle);

  }

  @override
  void clearTiltRanges() {
    final _clearTiltRangesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraLimits_clearTiltRanges'));
    final _handle = this.handle;
    _clearTiltRangesFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  AngleRange get tiltRange {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraLimits_tiltRange_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreAnglerangeFromFfi(__resultHandle);
    } finally {
      sdkCoreAnglerangeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set tiltRange(AngleRange value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraLimits_tiltRange_set__AngleRange'));
    final _valueHandle = sdkCoreAnglerangeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreAnglerangeReleaseFfiHandle(_valueHandle);

  }


  @override
  AngleRange get bearingRange {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraLimits_bearingRange_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreAnglerangeFromFfi(__resultHandle);
    } finally {
      sdkCoreAnglerangeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set bearingRange(AngleRange value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraLimits_bearingRange_set__AngleRange'));
    final _valueHandle = sdkCoreAnglerangeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreAnglerangeReleaseFfiHandle(_valueHandle);

  }


  @override
  MapMeasureRange get zoomRange {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraLimits_zoomRange_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkMapviewMapmeasurerangeFromFfi(__resultHandle);
    } finally {
      sdkMapviewMapmeasurerangeReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set zoomRange(MapMeasureRange value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraLimits_zoomRange_set__MapMeasureRange'));
    final _valueHandle = sdkMapviewMapmeasurerangeToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkMapviewMapmeasurerangeReleaseFfiHandle(_valueHandle);

  }


  @override
  GeoBox? get targetArea {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_mapview_MapCameraLimits_targetArea_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeoboxFromFfiNullable(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandleNullable(__resultHandle);

    }

  }

  @override
  set targetArea(GeoBox? value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_mapview_MapCameraLimits_targetArea_set__GeoBox_'));
    final _valueHandle = sdkCoreGeoboxToFfiNullable(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkCoreGeoboxReleaseFfiHandleNullable(_valueHandle);

  }



}

Pointer<Void> sdkMapviewMapcameralimitsToFfi(MapCameraLimits value) =>
  _sdkMapviewMapcameralimitsCopyHandle((value as __lib.NativeBase).handle);

MapCameraLimits sdkMapviewMapcameralimitsFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapCameraLimits) return instance;

  final _copiedHandle = _sdkMapviewMapcameralimitsCopyHandle(handle);
  final result = MapCameraLimits$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMapviewMapcameralimitsRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMapviewMapcameralimitsReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMapviewMapcameralimitsReleaseHandle(handle);

Pointer<Void> sdkMapviewMapcameralimitsToFfiNullable(MapCameraLimits? value) =>
  value != null ? sdkMapviewMapcameralimitsToFfi(value) : Pointer<Void>.fromAddress(0);

MapCameraLimits? sdkMapviewMapcameralimitsFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMapviewMapcameralimitsFromFfi(handle) : null;

void sdkMapviewMapcameralimitsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewMapcameralimitsReleaseHandle(handle);

// End of MapCameraLimits "private" section.


