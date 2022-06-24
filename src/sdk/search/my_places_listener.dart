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
import 'package:here_sdk/src/sdk/search/geo_place.dart';
import 'package:meta/meta.dart';

/// Purely fabricated class to break dependency between client facing Personal
/// places API and possible consumers.
///
/// For example, offline search map of
/// personal places listens to the updates of the "parent" data source and
/// reflects all the changes to offline search.
/// @nodoc
@internal
abstract class MyPlacesListener {
  /// Purely fabricated class to break dependency between client facing Personal
  /// places API and possible consumers.
  ///
  /// For example, offline search map of
  /// personal places listens to the updates of the "parent" data source and
  /// reflects all the changes to offline search.
  /// @nodoc

  factory MyPlacesListener(
    void Function(GeoPlace) onAddPlaceLambda,
    void Function(List<GeoPlace>) onAddPlacesLambda,
    void Function(String) onRemovePlaceLambda,
    void Function(List<String>) onRemovePlacesLambda,
    void Function() onRemoveAllLambda,

  ) => MyPlacesListener$Lambdas(
    onAddPlaceLambda,
    onAddPlacesLambda,
    onRemovePlaceLambda,
    onRemovePlacesLambda,
    onRemoveAllLambda,

  );


  /// @nodoc
  void internalonAddPlace(GeoPlace place);

  /// @nodoc
  void internalonAddPlaces(List<GeoPlace> places);

  /// @nodoc
  void internalonRemovePlace(String placeId);

  /// @nodoc
  void internalonRemovePlaces(List<String> placesIds);

  /// @nodoc
  void internalonRemoveAll();
}


// MyPlacesListener "private" section, not exported.

final _sdkSearchMyplaceslistenerRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_MyPlacesListener_register_finalizer'));
final _sdkSearchMyplaceslistenerCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_MyPlacesListener_copy_handle'));
final _sdkSearchMyplaceslistenerReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_MyPlacesListener_release_handle'));
final _sdkSearchMyplaceslistenerCreateProxy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint64, Int32, Handle, Pointer, Pointer, Pointer, Pointer, Pointer),
    Pointer<Void> Function(int, int, Object, Pointer, Pointer, Pointer, Pointer, Pointer)
  >('here_sdk_sdk_search_MyPlacesListener_create_proxy'));
final _sdkSearchMyplaceslistenerGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_MyPlacesListener_get_type_id'));






class MyPlacesListener$Lambdas implements MyPlacesListener {
  void Function(GeoPlace) onAddPlaceLambda;
  void Function(List<GeoPlace>) onAddPlacesLambda;
  void Function(String) onRemovePlaceLambda;
  void Function(List<String>) onRemovePlacesLambda;
  void Function() onRemoveAllLambda;

  MyPlacesListener$Lambdas(
    this.onAddPlaceLambda,
    this.onAddPlacesLambda,
    this.onRemovePlaceLambda,
    this.onRemovePlacesLambda,
    this.onRemoveAllLambda,

  );

  @override
  void internalonAddPlace(GeoPlace place) =>
    onAddPlaceLambda(place);
  @override
  void internalonAddPlaces(List<GeoPlace> places) =>
    onAddPlacesLambda(places);
  @override
  void internalonRemovePlace(String placeId) =>
    onRemovePlaceLambda(placeId);
  @override
  void internalonRemovePlaces(List<String> placesIds) =>
    onRemovePlacesLambda(placesIds);
  @override
  void internalonRemoveAll() =>
    onRemoveAllLambda();
}

class MyPlacesListener$Impl extends __lib.NativeBase implements MyPlacesListener {

  MyPlacesListener$Impl(Pointer<Void> handle) : super(handle);

  @override
  void internalonAddPlace(GeoPlace place) {
    final _onAddPlaceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_search_MyPlacesListener_onAddPlace__GeoPlace'));
    final _placeHandle = sdkSearchGeoplaceToFfi(place);
    final _handle = this.handle;
    _onAddPlaceFfi(_handle, __lib.LibraryContext.isolateId, _placeHandle);
    sdkSearchGeoplaceReleaseFfiHandle(_placeHandle);

  }

  @override
  void internalonAddPlaces(List<GeoPlace> places) {
    final _onAddPlacesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_search_MyPlacesListener_onAddPlaces__ListOf_sdk_search_GeoPlace'));
    final _placesHandle = heresdkPersonalPlacesBindingslistofSdkSearchGeoplaceToFfi(places);
    final _handle = this.handle;
    _onAddPlacesFfi(_handle, __lib.LibraryContext.isolateId, _placesHandle);
    heresdkPersonalPlacesBindingslistofSdkSearchGeoplaceReleaseFfiHandle(_placesHandle);

  }

  @override
  void internalonRemovePlace(String placeId) {
    final _onRemovePlaceFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_search_MyPlacesListener_onRemovePlace__String'));
    final _placeIdHandle = stringToFfi(placeId);
    final _handle = this.handle;
    _onRemovePlaceFfi(_handle, __lib.LibraryContext.isolateId, _placeIdHandle);
    stringReleaseFfiHandle(_placeIdHandle);

  }

  @override
  void internalonRemovePlaces(List<String> placesIds) {
    final _onRemovePlacesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_search_MyPlacesListener_onRemovePlaces__ListOf_String'));
    final _placesIdsHandle = heresdkPersonalPlacesBindingslistofStringToFfi(placesIds);
    final _handle = this.handle;
    _onRemovePlacesFfi(_handle, __lib.LibraryContext.isolateId, _placesIdsHandle);
    heresdkPersonalPlacesBindingslistofStringReleaseFfiHandle(_placesIdsHandle);

  }

  @override
  void internalonRemoveAll() {
    final _onRemoveAllFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_search_MyPlacesListener_onRemoveAll'));
    final _handle = this.handle;
    _onRemoveAllFfi(_handle, __lib.LibraryContext.isolateId);

  }


}

int _sdkSearchMyplaceslisteneronAddPlaceStatic(Object _obj, Pointer<Void> place) {

  try {
    (_obj as MyPlacesListener).internalonAddPlace(sdkSearchGeoplaceFromFfi(place));
  } finally {
    sdkSearchGeoplaceReleaseFfiHandle(place);
  }
  return 0;
}
int _sdkSearchMyplaceslisteneronAddPlacesStatic(Object _obj, Pointer<Void> places) {

  try {
    (_obj as MyPlacesListener).internalonAddPlaces(heresdkPersonalPlacesBindingslistofSdkSearchGeoplaceFromFfi(places));
  } finally {
    heresdkPersonalPlacesBindingslistofSdkSearchGeoplaceReleaseFfiHandle(places);
  }
  return 0;
}
int _sdkSearchMyplaceslisteneronRemovePlaceStatic(Object _obj, Pointer<Void> placeId) {

  try {
    (_obj as MyPlacesListener).internalonRemovePlace(stringFromFfi(placeId));
  } finally {
    stringReleaseFfiHandle(placeId);
  }
  return 0;
}
int _sdkSearchMyplaceslisteneronRemovePlacesStatic(Object _obj, Pointer<Void> placesIds) {

  try {
    (_obj as MyPlacesListener).internalonRemovePlaces(heresdkPersonalPlacesBindingslistofStringFromFfi(placesIds));
  } finally {
    heresdkPersonalPlacesBindingslistofStringReleaseFfiHandle(placesIds);
  }
  return 0;
}
int _sdkSearchMyplaceslisteneronRemoveAllStatic(Object _obj) {

  try {
    (_obj as MyPlacesListener).internalonRemoveAll();
  } finally {
  }
  return 0;
}


Pointer<Void> sdkSearchMyplaceslistenerToFfi(MyPlacesListener value) {
  if (value is __lib.NativeBase) return _sdkSearchMyplaceslistenerCopyHandle((value as __lib.NativeBase).handle);

  final result = _sdkSearchMyplaceslistenerCreateProxy(
    __lib.getObjectToken(value),
    __lib.LibraryContext.isolateId,
    value,
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkSearchMyplaceslisteneronAddPlaceStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkSearchMyplaceslisteneronAddPlacesStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkSearchMyplaceslisteneronRemovePlaceStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle, Pointer<Void>)>(_sdkSearchMyplaceslisteneronRemovePlacesStatic, __lib.unknownError),
    Pointer.fromFunction<Uint8 Function(Handle)>(_sdkSearchMyplaceslisteneronRemoveAllStatic, __lib.unknownError)
  );

  return result;
}

MyPlacesListener sdkSearchMyplaceslistenerFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is MyPlacesListener) return instance;

  final _typeIdHandle = _sdkSearchMyplaceslistenerGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkSearchMyplaceslistenerCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : MyPlacesListener$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkSearchMyplaceslistenerRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchMyplaceslistenerReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchMyplaceslistenerReleaseHandle(handle);

Pointer<Void> sdkSearchMyplaceslistenerToFfiNullable(MyPlacesListener? value) =>
  value != null ? sdkSearchMyplaceslistenerToFfi(value) : Pointer<Void>.fromAddress(0);

MyPlacesListener? sdkSearchMyplaceslistenerFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkSearchMyplaceslistenerFromFfi(handle) : null;

void sdkSearchMyplaceslistenerReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchMyplaceslistenerReleaseHandle(handle);

// End of MyPlacesListener "private" section.


