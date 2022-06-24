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

/// Represents version of the map.
abstract class MapVersionHandle {

  /// Returns a string representation of the map version in the format
  /// "\[cache-version\]\[separator\]\[offline-maps-version\], \[japan-cache-version\]\[separator\]\[japan-offline-maps-version\]",
  /// which can be obtained via [MapUpdater].
  ///
  /// [separator] Separator being used between elements of the map version.
  /// In case map version has single element to it, separator is not used.
  /// `none` token is used, when it is not possible to determine the version of the map.
  ///
  /// Examples:
  /// * separator=", " possible result is "8.10, 9.10"
  /// * separator="."  possible result is "8.10.9.10"
  /// * separator="; " possible result is "8.10; 9.10"
  /// * separator="; " possible result is "8.10"
  ///
  String stringRepresentation(String separator);
}


// MapVersionHandle "private" section, not exported.

final _sdkMaploaderMapversionhandleRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_maploader_MapVersionHandle_register_finalizer'));
final _sdkMaploaderMapversionhandleCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapVersionHandle_copy_handle'));
final _sdkMaploaderMapversionhandleReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_maploader_MapVersionHandle_release_handle'));



class MapVersionHandle$Impl extends __lib.NativeBase implements MapVersionHandle {

  MapVersionHandle$Impl(Pointer<Void> handle) : super(handle);

  @override
  String stringRepresentation(String separator) {
    final _stringRepresentationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_maploader_MapVersionHandle_stringRepresentation__String'));
    final _separatorHandle = stringToFfi(separator);
    final _handle = this.handle;
    final __resultHandle = _stringRepresentationFfi(_handle, __lib.LibraryContext.isolateId, _separatorHandle);
    stringReleaseFfiHandle(_separatorHandle);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkMaploaderMapversionhandleToFfi(MapVersionHandle value) =>
  _sdkMaploaderMapversionhandleCopyHandle((value as __lib.NativeBase).handle);

MapVersionHandle sdkMaploaderMapversionhandleFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MapVersionHandle) return instance;

  final _copiedHandle = _sdkMaploaderMapversionhandleCopyHandle(handle);
  final result = MapVersionHandle$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkMaploaderMapversionhandleRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkMaploaderMapversionhandleReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkMaploaderMapversionhandleReleaseHandle(handle);

Pointer<Void> sdkMaploaderMapversionhandleToFfiNullable(MapVersionHandle? value) =>
  value != null ? sdkMaploaderMapversionhandleToFfi(value) : Pointer<Void>.fromAddress(0);

MapVersionHandle? sdkMaploaderMapversionhandleFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkMaploaderMapversionhandleFromFfi(handle) : null;

void sdkMaploaderMapversionhandleReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMaploaderMapversionhandleReleaseHandle(handle);

// End of MapVersionHandle "private" section.


