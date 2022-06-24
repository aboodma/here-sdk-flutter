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
import 'package:here_sdk/src/sdk/core/location.dart';
import 'package:here_sdk/src/sdk/core/location_impl.dart' as location_impl;
import 'package:here_sdk/src/sdk/core/location_listener.dart';
import 'package:here_sdk/src/sdk/navigation/g_p_x_track.dart';
import 'package:meta/meta.dart';

/// Writes GPX track points to [GPXTrack].
///
/// The instance of the class should be add as a listener to
/// sdk.location.LocationEngineBase via sdk.location.LocationEngineBase.add_location_listener for GPX track recording.
/// Adds the track point to the back segment of the [GPXTrackWriter.track] whenever [LocationListener.onLocationUpdated] is called.
/// Use case examples.
/// A user wants to create and save a new [GPXDocument] with one [GPXTrack]:
/// - create [GPXTrackWriter] and add it as a location listener to sdk.location.LocationEngineBase.
/// - set user parameters to [GPXTrackWriter.track] (e.g. [GPXTrack.name] or [GPXTrack.description]).
/// - when writing is completed, create a new [GPXDocument] with a list of one [GPXTrack] and save the document via [GPXDocument.save].
/// A user wants to modify and save [GPXTrack] in the existing [GPXDocument]:
/// - load [GPXDocument] from a file by the relevant constructor.
/// - create [GPXTrackWriter] with the required track in the list [GPXDocument.tracks],
/// add the created instance as a location listener to sdk.location.LocationEngineBase.
/// - when writing is completed, save the document via [GPXDocument.save].
abstract class GPXTrackWriter implements LocationListener {
  /// Creates a new instance of GPXTrackWriter with an empty track inside.
  ///
  factory GPXTrackWriter() => $prototype.$init();
  /// Creates a new instance of GPXWriter with [GPXTrack].
  ///
  /// Use this constructor to append locations to an existing track.
  ///
  /// [track] GPX track.
  ///
  factory GPXTrackWriter.withTrack(GPXTrack track) => $prototype.withTrack(track);

  /// GPX track into which GPX track points are written.
  GPXTrack get track;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = GPXTrackWriter$Impl(Pointer<Void>.fromAddress(0));
}


// GPXTrackWriter "private" section, not exported.

final _sdkNavigationGpxtrackwriterRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_GPXTrackWriter_register_finalizer'));
final _sdkNavigationGpxtrackwriterCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXTrackWriter_copy_handle'));
final _sdkNavigationGpxtrackwriterReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXTrackWriter_release_handle'));
final _sdkNavigationGpxtrackwriterGetTypeId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXTrackWriter_get_type_id'));




/// @nodoc
@visibleForTesting
class GPXTrackWriter$Impl extends __lib.NativeBase implements GPXTrackWriter {

  GPXTrackWriter$Impl(Pointer<Void> handle) : super(handle);


  GPXTrackWriter $init() {
    final _result_handle = _$init();
    final _result = GPXTrackWriter$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkNavigationGpxtrackwriterRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  GPXTrackWriter withTrack(GPXTrack track) {
    final _result_handle = _withTrack(track);
    final _result = GPXTrackWriter$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkNavigationGpxtrackwriterRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_navigation_GPXTrackWriter_make'));
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId);
    return __resultHandle;
  }

  static Pointer<Void> _withTrack(GPXTrack track) {
    final _withTrackFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_navigation_GPXTrackWriter_make__GPXTrack'));
    final _trackHandle = sdkNavigationGpxtrackToFfi(track);
    final __resultHandle = _withTrackFfi(__lib.LibraryContext.isolateId, _trackHandle);
    sdkNavigationGpxtrackReleaseFfiHandle(_trackHandle);
    return __resultHandle;
  }

  @override
  void onLocationUpdated(location_impl.Location location) {
    final _onLocationUpdatedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_GPXTrackWriter_onLocationUpdated__Location'));
    final _locationHandle = sdkCoreLocationToFfi(location);
    final _handle = this.handle;
    _onLocationUpdatedFfi(_handle, __lib.LibraryContext.isolateId, _locationHandle);
    sdkCoreLocationReleaseFfiHandle(_locationHandle);

  }

  @override
  GPXTrack get track {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_GPXTrackWriter_track_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkNavigationGpxtrackFromFfi(__resultHandle);
    } finally {
      sdkNavigationGpxtrackReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkNavigationGpxtrackwriterToFfi(GPXTrackWriter value) =>
  _sdkNavigationGpxtrackwriterCopyHandle((value as __lib.NativeBase).handle);

GPXTrackWriter sdkNavigationGpxtrackwriterFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is GPXTrackWriter) return instance;

  final _typeIdHandle = _sdkNavigationGpxtrackwriterGetTypeId(handle);
  final factoryConstructor = __lib.typeRepository[stringFromFfi(_typeIdHandle)];
  stringReleaseFfiHandle(_typeIdHandle);

  final _copiedHandle = _sdkNavigationGpxtrackwriterCopyHandle(handle);
  final result = factoryConstructor != null
    ? factoryConstructor(_copiedHandle)
    : GPXTrackWriter$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationGpxtrackwriterRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationGpxtrackwriterReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationGpxtrackwriterReleaseHandle(handle);

Pointer<Void> sdkNavigationGpxtrackwriterToFfiNullable(GPXTrackWriter? value) =>
  value != null ? sdkNavigationGpxtrackwriterToFfi(value) : Pointer<Void>.fromAddress(0);

GPXTrackWriter? sdkNavigationGpxtrackwriterFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationGpxtrackwriterFromFfi(handle) : null;

void sdkNavigationGpxtrackwriterReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationGpxtrackwriterReleaseHandle(handle);

// End of GPXTrackWriter "private" section.


