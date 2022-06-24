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
import 'package:here_sdk/src/sdk/venue/style/icon.dart';
import 'package:meta/meta.dart';

/// Specifies the icon information.
/// @nodoc
@internal
abstract class IconInfo {

  /// Gets the URL of the icon.
  /// @nodoc
  @internal
  String get internalurl;

  /// Gets the name of the icon.
  /// @nodoc
  @internal
  String get internalname;

  /// Gets the icon.
  /// @nodoc
  @internal
  Icon get internalicon;
  /// Sets the icon.
  /// @nodoc
  @internal
  set internalicon(Icon value);

}


// IconInfo "private" section, not exported.

final _sdkVenueStyleIconinfoRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_style_IconInfo_register_finalizer'));
final _sdkVenueStyleIconinfoCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_IconInfo_copy_handle'));
final _sdkVenueStyleIconinfoReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_style_IconInfo_release_handle'));


class IconInfo$Impl extends __lib.NativeBase implements IconInfo {

  IconInfo$Impl(Pointer<Void> handle) : super(handle);

  @internal
  @override
  String get internalurl {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_IconInfo_url_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  String get internalname {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_IconInfo_name_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }


  @internal
  @override
  Icon get internalicon {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_style_IconInfo_icon_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueStyleIconFromFfi(__resultHandle);
    } finally {
      sdkVenueStyleIconReleaseFfiHandle(__resultHandle);

    }

  }

  @internal
  @override
  set internalicon(Icon value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_style_IconInfo_icon_set__Icon'));
    final _valueHandle = sdkVenueStyleIconToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkVenueStyleIconReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkVenueStyleIconinfoToFfi(IconInfo value) =>
  _sdkVenueStyleIconinfoCopyHandle((value as __lib.NativeBase).handle);

IconInfo sdkVenueStyleIconinfoFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is IconInfo) return instance;

  final _copiedHandle = _sdkVenueStyleIconinfoCopyHandle(handle);
  final result = IconInfo$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueStyleIconinfoRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueStyleIconinfoReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueStyleIconinfoReleaseHandle(handle);

Pointer<Void> sdkVenueStyleIconinfoToFfiNullable(IconInfo? value) =>
  value != null ? sdkVenueStyleIconinfoToFfi(value) : Pointer<Void>.fromAddress(0);

IconInfo? sdkVenueStyleIconinfoFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueStyleIconinfoFromFfi(handle) : null;

void sdkVenueStyleIconinfoReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueStyleIconinfoReleaseHandle(handle);

// End of IconInfo "private" section.


