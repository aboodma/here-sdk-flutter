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
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/venue/data/venue_geometry.dart';
import 'package:meta/meta.dart';

/// Specifies the label names.
/// @nodoc
@internal
abstract class LabelName {
  /// Creates a label name.
  ///
  /// [lookupType] The lookup type.
  ///
  /// [reference] The reference.
  ///
  /// @nodoc
  factory LabelName(VenueGeometryLookupType lookupType, String reference) => $prototype.internalmake(lookupType, reference);

  /// Gets the lookup type.
  /// @nodoc
  @internal
  VenueGeometryLookupType get internallookupType;

  /// Gets the reference.
  /// @nodoc
  @internal
  String get internalreference;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = LabelName$Impl(Pointer<Void>.fromAddress(0));
}


// LabelName "private" section, not exported.

final _sdkVenueStyleLabelnameRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_LabelName_register_finalizer'));
final _sdkVenueStyleLabelnameCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_LabelName_copy_handle'));
final _sdkVenueStyleLabelnameReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_LabelName_release_handle'));



/// @nodoc
@visibleForTesting
class LabelName$Impl extends __lib.NativeBase implements LabelName {

  LabelName$Impl(Pointer<Void> handle) : super(handle);


  LabelName internalmake(VenueGeometryLookupType lookupType, String reference) {
    final _result_handle = _make(lookupType, reference);
    final _result = LabelName$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkVenueStyleLabelnameRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make(VenueGeometryLookupType lookupType, String reference) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint32, Pointer<Void>), Pointer<Void> Function(int, int, Pointer<Void>)>('here_sdk_sdk_venue_style_LabelName_make__LookupType_String'));
    final _lookupTypeHandle = sdkVenueDataVenuegeometryLookuptypeToFfi(lookupType);
    final _referenceHandle = stringToFfi(reference);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _lookupTypeHandle, _referenceHandle);
    sdkVenueDataVenuegeometryLookuptypeReleaseFfiHandle(_lookupTypeHandle);
    stringReleaseFfiHandle(_referenceHandle);
    return __resultHandle;
  }

  @internal
  @override
  VenueGeometryLookupType get internallookupType {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_LabelName_lookupType_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataVenuegeometryLookuptypeFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVenuegeometryLookuptypeReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  String get internalreference {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_LabelName_reference_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueStyleLabelnameToFfi(LabelName value) =>
  _sdkVenueStyleLabelnameCopyHandle((value as __lib.NativeBase).handle);

LabelName sdkVenueStyleLabelnameFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is LabelName) return instance;

  final _copiedHandle = _sdkVenueStyleLabelnameCopyHandle(handle);
  final result = LabelName$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleLabelnameRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleLabelnameReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleLabelnameReleaseHandle(handle);

Pointer<Void> sdkVenueStyleLabelnameToFfiNullable(LabelName? value) =>
  value != null ? sdkVenueStyleLabelnameToFfi(value) : Pointer<Void>.fromAddress(0);

LabelName? sdkVenueStyleLabelnameFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleLabelnameFromFfi(handle) : null;

void sdkVenueStyleLabelnameReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleLabelnameReleaseHandle(handle);

// End of LabelName "private" section.


