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
import 'package:here_sdk/src/sdk/venue/service/config.dart';
import 'package:here_sdk/src/sdk/venue/service/venue_listener.dart';
import 'package:here_sdk/src/sdk/venue/service/venue_service_init_status.dart';
import 'package:here_sdk/src/sdk/venue/service/venue_service_listener.dart';
import 'package:meta/meta.dart';

/// Offers methods to download venues.
///
/// Use of this
/// object does not necessitate Map involvement.
///
/// <p>
/// Before loading the venues, initialize the venue service
/// with one of the start methods.
/// </p>
/// <p>
/// The venue service is online only. Even if there is a cached
/// venue on the device, the venue service requires an online
/// connection to check if the venue is available for the user.
/// </p>
abstract class VenueService {
  /// Creates a venue service.
  ///
  /// [config] The configuration.
  ///
  /// @nodoc
  factory VenueService(Config config) => $prototype.internalmake(config);

  /// Starts the venue service synchronously.
  ///
  /// An initialization status is returned to objects
  /// registered as [VenueServiceListener].
  ///
  /// [token] The HERE token of the user or the application.
  ///
  void start(String token);
  /// Starts the venue service asynchronously.
  ///
  /// An initialization status is returned to objects
  /// registered as [VenueServiceListener].
  ///
  /// [token] The HERE token of the user or the application.
  ///
  void startAsync(String token);
  /// Stops the venue service.
  ///
  void stop();
  /// Adds a service .
  ///
  /// The
  /// is not added if it is `null` or is already present in the list of
  /// .
  ///
  /// [listener] The service  to add.
  ///
  void addServiceListener(VenueServiceListener listener);
  /// Removes a service .
  ///
  /// The
  /// is not removed if it is not present in the list of .
  ///
  /// [listener] The service  to remove.
  ///
  void removeServiceListener(VenueServiceListener listener);
  /// Adds a venue .
  ///
  /// The
  /// is not added if it is `null` or is already present in the list of
  /// .
  ///
  /// [listener] The venue  to add.
  ///
  void addVenueListener(VenueListener listener);
  /// Removes a venue .
  ///
  /// The
  /// is not removed if it is not present in the list of .
  ///
  /// [listener] The venue  to remove.
  ///
  void removeVenueListener(VenueListener listener);
  /// Gets an initialization status.
  ///
  /// Returns [VenueServiceInitStatus]. The initialization status.
  ///
  VenueServiceInitStatus getInitStatus();
  /// Checks if the venue service is initialized.
  ///
  /// Returns [bool]. True if the venue service is initialized and false otherwise.
  ///
  bool isInitialized();
  /// Starts a new venue loading queue.
  ///
  /// [venueIds] The list of venue id's to load.
  ///
  void startLoading(List<int> venueIds);
  /// Adds a venue to the loading queue.
  ///
  /// [venueId] The id of the venue to load.
  ///
  void addVenueToLoad(int venueId);
  /// Sets HRN of platform catalog.
  ///
  /// [hrn] The HRN of platform catalog.
  ///
  void setHrn(String hrn);
  /// Checks if the venue service is online.
  ///
  /// Returns [bool]. True if the venue service is online and false otherwise.
  ///
  /// @nodoc
  bool internalisOnline();
  /// Controls if the venue service can go online.
  ///
  /// [enabled] True if the venue service can go online and false otherwise.
  ///
  /// @nodoc
  void internalenableOnline(bool enabled);
  /// Gets the languages available in the venue service.
  List<String> get languages;

  /// Gets an active language in the venue service. The venue service will try to load
  /// a venue with a translation in the active language. If such translation doesn't
  /// exist, a venue will be loaded in its default language.
  String get language;
  /// Sets an active language.
  set language(String value);

  /// Gets the flag to indicate if icons should be loaded as SVG.
  /// @nodoc
  @internal
  bool get internalisLoadIconsAsSvg;
  /// Sets the flag to indicate if icons should be loaded as SVG.
  /// @nodoc
  @internal
  set internalisLoadIconsAsSvg(bool value);


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = VenueService$Impl(Pointer<Void>.fromAddress(0));
}


// VenueService "private" section, not exported.

final _sdkVenueServiceVenueserviceRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_service_VenueService_register_finalizer'));
final _sdkVenueServiceVenueserviceCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_service_VenueService_copy_handle'));
final _sdkVenueServiceVenueserviceReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_service_VenueService_release_handle'));

















/// @nodoc
@visibleForTesting
class VenueService$Impl extends __lib.NativeBase implements VenueService {

  VenueService$Impl(Pointer<Void> handle) : super(handle);


  VenueService internalmake(Config config) {
    final _result_handle = _make(config);
    final _result = VenueService$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkVenueServiceVenueserviceRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  @override
  void start(String token) {
    final _startFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_start__String'));
    final _tokenHandle = stringToFfi(token);
    final _handle = this.handle;
    _startFfi(_handle, __lib.LibraryContext.isolateId, _tokenHandle);
    stringReleaseFfiHandle(_tokenHandle);

  }

  @override
  void startAsync(String token) {
    final _startAsyncFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_startAsync__String'));
    final _tokenHandle = stringToFfi(token);
    final _handle = this.handle;
    _startAsyncFfi(_handle, __lib.LibraryContext.isolateId, _tokenHandle);
    stringReleaseFfiHandle(_tokenHandle);

  }

  @override
  void stop() {
    final _stopFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32), void Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_VenueService_stop'));
    final _handle = this.handle;
    _stopFfi(_handle, __lib.LibraryContext.isolateId);

  }

  @override
  void addServiceListener(VenueServiceListener listener) {
    final _addServiceListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_add__VenueServiceListener'));
    final _listenerHandle = sdkVenueServiceVenueservicelistenerToFfi(listener);
    final _handle = this.handle;
    _addServiceListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueServiceVenueservicelistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void removeServiceListener(VenueServiceListener listener) {
    final _removeServiceListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_remove__VenueServiceListener'));
    final _listenerHandle = sdkVenueServiceVenueservicelistenerToFfi(listener);
    final _handle = this.handle;
    _removeServiceListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueServiceVenueservicelistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void addVenueListener(VenueListener listener) {
    final _addVenueListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_add__VenueListener'));
    final _listenerHandle = sdkVenueServiceVenuelistenerToFfi(listener);
    final _handle = this.handle;
    _addVenueListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueServiceVenuelistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  void removeVenueListener(VenueListener listener) {
    final _removeVenueListenerFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_remove__VenueListener'));
    final _listenerHandle = sdkVenueServiceVenuelistenerToFfi(listener);
    final _handle = this.handle;
    _removeVenueListenerFfi(_handle, __lib.LibraryContext.isolateId, _listenerHandle);
    sdkVenueServiceVenuelistenerReleaseFfiHandle(_listenerHandle);

  }

  @override
  VenueServiceInitStatus getInitStatus() {
    final _getInitStatusFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_VenueService_getInitStatus'));
    final _handle = this.handle;
    final __resultHandle = _getInitStatusFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueServiceVenueserviceinitstatusFromFfi(__resultHandle);
    } finally {
      sdkVenueServiceVenueserviceinitstatusReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  bool isInitialized() {
    final _isInitializedFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_VenueService_isInitialized'));
    final _handle = this.handle;
    final __resultHandle = _isInitializedFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void startLoading(List<int> venueIds) {
    final _startLoadingFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_startLoading__ListOf_Int'));
    final _venueIdsHandle = venuecoreBindingslistofIntToFfi(venueIds);
    final _handle = this.handle;
    _startLoadingFfi(_handle, __lib.LibraryContext.isolateId, _venueIdsHandle);
    venuecoreBindingslistofIntReleaseFfiHandle(_venueIdsHandle);

  }

  @override
  void addVenueToLoad(int venueId) {
    final _addVenueToLoadFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Int32), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_service_VenueService_addVenueToLoad__Int'));
    final _venueIdHandle = (venueId);
    final _handle = this.handle;
    _addVenueToLoadFfi(_handle, __lib.LibraryContext.isolateId, _venueIdHandle);


  }

  @override
  void setHrn(String hrn) {
    final _setHrnFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_setHrn__String'));
    final _hrnHandle = stringToFfi(hrn);
    final _handle = this.handle;
    _setHrnFfi(_handle, __lib.LibraryContext.isolateId, _hrnHandle);
    stringReleaseFfiHandle(_hrnHandle);

  }

  @override
  bool internalisOnline() {
    final _isOnlineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_VenueService_isOnline'));
    final _handle = this.handle;
    final __resultHandle = _isOnlineFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  void internalenableOnline(bool enabled) {
    final _enableOnlineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_service_VenueService_enableOnline__Boolean'));
    final _enabledHandle = booleanToFfi(enabled);
    final _handle = this.handle;
    _enableOnlineFfi(_handle, __lib.LibraryContext.isolateId, _enabledHandle);
    booleanReleaseFfiHandle(_enabledHandle);

  }

  static Pointer<Void> _make(Config config) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_make__Config'));
    final _configHandle = sdkVenueServiceConfigToFfi(config);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _configHandle);
    sdkVenueServiceConfigReleaseFfiHandle(_configHandle);
    return __resultHandle;
  }

  @override
  List<String> get languages {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_VenueService_languages_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return venuecoreBindingslistofStringFromFfi(__resultHandle);
    } finally {
      venuecoreBindingslistofStringReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  String get language {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_VenueService_language_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  set language(String value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_service_VenueService_language_set__String'));
    final _valueHandle = stringToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);

  }


  @internal
  @override
  bool get internalisLoadIconsAsSvg {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_service_VenueService_isLoadIconsAsSvg_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }

  @internal
  @override
  set internalisLoadIconsAsSvg(bool value) {
    final _setFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Uint8), void Function(Pointer<Void>, int, int)>('here_sdk_sdk_venue_service_VenueService_isLoadIconsAsSvg_set__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final _handle = this.handle;
    _setFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);

  }



}

Pointer<Void> sdkVenueServiceVenueserviceToFfi(VenueService value) =>
  _sdkVenueServiceVenueserviceCopyHandle((value as __lib.NativeBase).handle);

VenueService sdkVenueServiceVenueserviceFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is VenueService) return instance;

  final _copiedHandle = _sdkVenueServiceVenueserviceCopyHandle(handle);
  final result = VenueService$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueServiceVenueserviceRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueServiceVenueserviceReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueServiceVenueserviceReleaseHandle(handle);

Pointer<Void> sdkVenueServiceVenueserviceToFfiNullable(VenueService? value) =>
  value != null ? sdkVenueServiceVenueserviceToFfi(value) : Pointer<Void>.fromAddress(0);

VenueService? sdkVenueServiceVenueserviceFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueServiceVenueserviceFromFfi(handle) : null;

void sdkVenueServiceVenueserviceReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueServiceVenueserviceReleaseHandle(handle);

// End of VenueService "private" section.


