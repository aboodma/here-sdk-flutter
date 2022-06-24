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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/core/threading/on_task_completed.dart';
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/search/geo_place.dart';
import 'package:here_sdk/src/sdk/search/my_places_listener.dart';
import 'package:meta/meta.dart';

/// Provides means to populate personal places data source.
///
/// Also acts as a
/// owner of the collection of personal places. MyPlaces is
/// memory-only object: nothing is persisted and/or sent over the network.
/// Client has full control on how to store personal places.
abstract class MyPlaces {
  /// Creates a new instance of this class.
  ///
  factory MyPlaces() => $prototype.make();

  /// Adds a place to this data source.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle addPlace(GeoPlace place, OnTaskCompleted callback);
  /// Adds a list of places to this data source.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle addPlaces(List<GeoPlace> places, OnTaskCompleted callback);
  /// Removes a place from this data source.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle removePlace(String placeId, OnTaskCompleted callback);
  /// Removes a list of places from this data source.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle removePlaces(List<String> placeIds, OnTaskCompleted callback);
  /// Removes all places from this data source.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle removeAll(OnTaskCompleted callback);

  /// @nodoc
  void internallistenUpdates(MyPlacesListener listener);
  List<GeoPlace> get places;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = MyPlaces$Impl(Pointer<Void>.fromAddress(0));
}


// MyPlaces "private" section, not exported.

final _sdkSearchMyplacesRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_MyPlaces_register_finalizer'));
final _sdkSearchMyplacesCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_MyPlaces_copy_handle'));
final _sdkSearchMyplacesReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_MyPlaces_release_handle'));









/// @nodoc
@visibleForTesting
class MyPlaces$Impl extends __lib.NativeBase implements MyPlaces {

  MyPlaces$Impl(Pointer<Void> handle) : super(handle);


  MyPlaces make() {
    final _result_handle = _make();
    final _result = MyPlaces$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkSearchMyplacesRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make() {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_search_MyPlaces_make'));
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  @override
  TaskHandle addPlace(GeoPlace place, OnTaskCompleted callback) {
    final _addPlaceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_MyPlaces_addPlace__GeoPlace_OnTaskCompleted'));
    final _placeHandle = sdkSearchGeoplaceToFfi(place);
    final _callbackHandle = sdkCoreThreadingOntaskcompletedToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _addPlaceFfi(_handle, __lib.LibraryContext.isolateId, _placeHandle, _callbackHandle);
    sdkSearchGeoplaceReleaseFfiHandle(_placeHandle);
    sdkCoreThreadingOntaskcompletedReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle addPlaces(List<GeoPlace> places, OnTaskCompleted callback) {
    final _addPlacesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_MyPlaces_addPlaces__ListOf_sdk_search_GeoPlace_OnTaskCompleted'));
    final _placesHandle = heresdkPersonalPlacesBindingslistofSdkSearchGeoplaceToFfi(places);
    final _callbackHandle = sdkCoreThreadingOntaskcompletedToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _addPlacesFfi(_handle, __lib.LibraryContext.isolateId, _placesHandle, _callbackHandle);
    heresdkPersonalPlacesBindingslistofSdkSearchGeoplaceReleaseFfiHandle(_placesHandle);
    sdkCoreThreadingOntaskcompletedReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle removePlace(String placeId, OnTaskCompleted callback) {
    final _removePlaceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_MyPlaces_removePlace__String_OnTaskCompleted'));
    final _placeIdHandle = stringToFfi(placeId);
    final _callbackHandle = sdkCoreThreadingOntaskcompletedToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _removePlaceFfi(_handle, __lib.LibraryContext.isolateId, _placeIdHandle, _callbackHandle);
    stringReleaseFfiHandle(_placeIdHandle);
    sdkCoreThreadingOntaskcompletedReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle removePlaces(List<String> placeIds, OnTaskCompleted callback) {
    final _removePlacesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_MyPlaces_removePlaces__ListOf_String_OnTaskCompleted'));
    final _placeIdsHandle = heresdkPersonalPlacesBindingslistofStringToFfi(placeIds);
    final _callbackHandle = sdkCoreThreadingOntaskcompletedToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _removePlacesFfi(_handle, __lib.LibraryContext.isolateId, _placeIdsHandle, _callbackHandle);
    heresdkPersonalPlacesBindingslistofStringReleaseFfiHandle(_placeIdsHandle);
    sdkCoreThreadingOntaskcompletedReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle removeAll(OnTaskCompleted callback) {
    final _removeAllFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_search_MyPlaces_removeAll__OnTaskCompleted'));
    final _callbackHandle = sdkCoreThreadingOntaskcompletedToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _removeAllFfi(_handle, __lib.LibraryContext.isolateId, _callbackHandle);
    sdkCoreThreadingOntaskcompletedReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void internallistenUpdates(MyPlacesListener listener) {
    final _listenUpdatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_search_MyPlaces_listenUpdates__MyPlacesListener'));
    final _listenerHandle = sdkSearchMyplaceslistenerToFfi(listener);
    final _handle = this.handle;
    _listenUpdatesFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkSearchMyplaceslistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  List<GeoPlace> get places {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_search_MyPlaces_places_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkPersonalPlacesBindingslistofSdkSearchGeoplaceFromFfi(__resultHandle);
    } finally {
      heresdkPersonalPlacesBindingslistofSdkSearchGeoplaceReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkSearchMyplacesToFfi(MyPlaces value) =>
  _sdkSearchMyplacesCopyHandle((value as __lib.NativeBase).handle);

MyPlaces sdkSearchMyplacesFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MyPlaces) return instance;

  final _copiedHandle = _sdkSearchMyplacesCopyHandle(handle);
  final result = MyPlaces$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkSearchMyplacesRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchMyplacesReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchMyplacesReleaseHandle(handle);

Pointer<Void> sdkSearchMyplacesToFfiNullable(MyPlaces? value) =>
  value != null ? sdkSearchMyplacesToFfi(value) : Pointer<Void>.fromAddress(0);

MyPlaces? sdkSearchMyplacesFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkSearchMyplacesFromFfi(handle) : null;

void sdkSearchMyplacesReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchMyplacesReleaseHandle(handle);

// End of MyPlaces "private" section.


