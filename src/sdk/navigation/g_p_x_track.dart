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

/// Single track from the GPXDocument.
///
/// Can be used as an input to the [LocationSimulator].
/// Can be created and modified via [GPXTrackWriter].
abstract class GPXTrack {

  String get name;
  set name(String value);

  String get description;
  set description(String value);

}


// GPXTrack "private" section, not exported.

final _sdkNavigationGpxtrackRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_GPXTrack_register_finalizer'));
final _sdkNavigationGpxtrackCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXTrack_copy_handle'));
final _sdkNavigationGpxtrackReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXTrack_release_handle'));


class GPXTrack$Impl extends __lib.NativeBase implements GPXTrack {

  GPXTrack$Impl(Pointer<Void> handle) : super(handle);

  @override
  String get name {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_GPXTrack_name_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set name(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_GPXTrack_name_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }


  @override
  String get description {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_GPXTrack_description_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set description(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_GPXTrack_description_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkNavigationGpxtrackToFfi(GPXTrack value) =>
  _sdkNavigationGpxtrackCopyHandle((value as __lib.NativeBase).handle);

GPXTrack sdkNavigationGpxtrackFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is GPXTrack) return instance;

  final _copiedHandle = _sdkNavigationGpxtrackCopyHandle(handle);
  final result = GPXTrack$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationGpxtrackRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationGpxtrackReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationGpxtrackReleaseHandle(handle);

Pointer<Void> sdkNavigationGpxtrackToFfiNullable(GPXTrack? value) =>
  value != null ? sdkNavigationGpxtrackToFfi(value) : Pointer<Void>.fromAddress(0);

GPXTrack? sdkNavigationGpxtrackFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationGpxtrackFromFfi(handle) : null;

void sdkNavigationGpxtrackReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationGpxtrackReleaseHandle(handle);

// End of GPXTrack "private" section.


