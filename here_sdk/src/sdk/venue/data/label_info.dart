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
import 'package:here_sdk/src/sdk/core/geo_box.dart';
import 'package:meta/meta.dart';

/// Specifies the label's information.
/// @nodoc
@internal
abstract class LabelInfo {

  /// Gets the bounding box.
  /// @nodoc
  @internal
  GeoBox get internalboundingBox;

  /// Gets the angle of rotation.
  /// @nodoc
  @internal
  double get internalangle;

}


// LabelInfo "private" section, not exported.

final _sdkVenueDataLabelinfoRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_data_LabelInfo_register_finalizer'));
final _sdkVenueDataLabelinfoCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_LabelInfo_copy_handle'));
final _sdkVenueDataLabelinfoReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_LabelInfo_release_handle'));


class LabelInfo$Impl extends __lib.NativeBase implements LabelInfo {

  LabelInfo$Impl(Pointer<Void> handle) : super(handle);

  @internal
  @override
  GeoBox get internalboundingBox {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_LabelInfo_boundingBox_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkCoreGeoboxFromFfi(__resultHandle);
    } finally {
      sdkCoreGeoboxReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  double get internalangle {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Float Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_LabelInfo_angle_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }



}

Pointer<Void> sdkVenueDataLabelinfoToFfi(LabelInfo value) =>
  _sdkVenueDataLabelinfoCopyHandle((value as __lib.NativeBase).handle);

LabelInfo sdkVenueDataLabelinfoFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LabelInfo) return instance;

  final _copiedHandle = _sdkVenueDataLabelinfoCopyHandle(handle);
  final result = LabelInfo$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueDataLabelinfoRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueDataLabelinfoReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueDataLabelinfoReleaseHandle(handle);

Pointer<Void> sdkVenueDataLabelinfoToFfiNullable(LabelInfo? value) =>
  value != null ? sdkVenueDataLabelinfoToFfi(value) : Pointer<Void>.fromAddress(0);

LabelInfo? sdkVenueDataLabelinfoFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueDataLabelinfoFromFfi(handle) : null;

void sdkVenueDataLabelinfoReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataLabelinfoReleaseHandle(handle);

// End of LabelInfo "private" section.


