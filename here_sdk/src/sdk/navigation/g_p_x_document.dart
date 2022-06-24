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
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/navigation/g_p_x_options.dart';
import 'package:here_sdk/src/sdk/navigation/g_p_x_track.dart';
import 'package:meta/meta.dart';

/// Use the GPXDocument to load the GPX file.
///
/// Only track data is used from the GPX file format
/// (see trkType at https://www.topografix.com/GPX/1/1/#type_trkType).
/// Any unknown elements in the file are ignored.
/// Any known element with an invalid value returns an error.
/// Elevation values are ignored.
abstract class GPXDocument {
  /// Create a GPX document from a file.
  ///
  /// [gpxFilePath] The path to the GPX file.
  ///
  /// [options] The options to customize reading.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory GPXDocument(String gpxFilePath, GPXOptions options) => $prototype.$init(gpxFilePath, options);
  /// Create a GPX document from a list of GPX tracks.
  ///
  /// [tracks] The list of tracks.
  ///
  factory GPXDocument.withTracks(List<GPXTrack> tracks) => $prototype.withTracks(tracks);

  /// Saves the document to a file.
  ///
  /// For saving the [GPXDocument.tracks] modification before writing to a file, use [GPXTrackWriter].
  ///
  /// [gpxFilePath] The file path where the GPX document will be saved.
  ///
  /// Returns [bool]. True if the document has been saved successfully.
  /// False if an error has been happenned during saving.
  ///
  bool save(String gpxFilePath);
  /// Gets the tracks stored in this GPX document.
  List<GPXTrack> get tracks;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = GPXDocument$Impl(Pointer<Void>.fromAddress(0));
}


// GPXDocument "private" section, not exported.

final _sdkNavigationGpxdocumentRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_navigation_GPXDocument_register_finalizer'));
final _sdkNavigationGpxdocumentCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXDocument_copy_handle'));
final _sdkNavigationGpxdocumentReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXDocument_release_handle'));


final _$initReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXDocument_make__String_GPXOptions_return_release_handle'));
final _$initReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXDocument_make__String_GPXOptions_return_get_result'));
final _$initReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXDocument_make__String_GPXOptions_return_get_error'));
final _$initReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_GPXDocument_make__String_GPXOptions_return_has_error'));




/// @nodoc
@visibleForTesting
class GPXDocument$Impl extends __lib.NativeBase implements GPXDocument {

  GPXDocument$Impl(Pointer<Void> handle) : super(handle);


  GPXDocument $init(String gpxFilePath, GPXOptions options) {
    final _result_handle = _$init(gpxFilePath, options);
    final _result = GPXDocument$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkNavigationGpxdocumentRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  GPXDocument withTracks(List<GPXTrack> tracks) {
    final _result_handle = _withTracks(tracks);
    final _result = GPXDocument$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkNavigationGpxdocumentRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init(String gpxFilePath, GPXOptions options) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_navigation_GPXDocument_make__String_GPXOptions'));
    final _gpxFilePathHandle = stringToFfi(gpxFilePath);
    final _optionsHandle = sdkNavigationGpxoptionsToFfi(options);
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId, _gpxFilePathHandle, _optionsHandle);
    stringReleaseFfiHandle(_gpxFilePathHandle);
    sdkNavigationGpxoptionsReleaseFfiHandle(_optionsHandle);
    if (_$initReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _$initReturnGetError(__callResultHandle);
        _$initReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _$initReturnGetResult(__callResultHandle);
    _$initReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withTracks(List<GPXTrack> tracks) {
    final _withTracksFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_navigation_GPXDocument_make__ListOf_sdk_navigation_GPXTrack'));
    final _tracksHandle = heresdkNavigationBindingslistofSdkNavigationGpxtrackToFfi(tracks);
    final __resultHandle = _withTracksFfi(__lib.LibraryContext.isolateId, _tracksHandle);
    heresdkNavigationBindingslistofSdkNavigationGpxtrackReleaseFfiHandle(_tracksHandle);
    return __resultHandle;
  }

  @override
  bool save(String gpxFilePath) {
    final _saveFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32, Pointer<Void>), int Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_navigation_GPXDocument_save__String'));
    final _gpxFilePathHandle = stringToFfi(gpxFilePath);
    final _handle = this.handle;
    final __resultHandle = _saveFfi(_handle, __lib.LibraryContext.isolateId, _gpxFilePathHandle);
    stringReleaseFfiHandle(_gpxFilePathHandle);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  List<GPXTrack> get tracks {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_navigation_GPXDocument_tracks_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return heresdkNavigationBindingslistofSdkNavigationGpxtrackFromFfi(__resultHandle);
    } finally {
      heresdkNavigationBindingslistofSdkNavigationGpxtrackReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkNavigationGpxdocumentToFfi(GPXDocument value) =>
  _sdkNavigationGpxdocumentCopyHandle((value as __lib.NativeBase).handle);

GPXDocument sdkNavigationGpxdocumentFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is GPXDocument) return instance;

  final _copiedHandle = _sdkNavigationGpxdocumentCopyHandle(handle);
  final result = GPXDocument$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkNavigationGpxdocumentRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkNavigationGpxdocumentReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkNavigationGpxdocumentReleaseHandle(handle);

Pointer<Void> sdkNavigationGpxdocumentToFfiNullable(GPXDocument? value) =>
  value != null ? sdkNavigationGpxdocumentToFfi(value) : Pointer<Void>.fromAddress(0);

GPXDocument? sdkNavigationGpxdocumentFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkNavigationGpxdocumentFromFfi(handle) : null;

void sdkNavigationGpxdocumentReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationGpxdocumentReleaseHandle(handle);

// End of GPXDocument "private" section.


