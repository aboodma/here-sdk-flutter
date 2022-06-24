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
import 'package:here_sdk/src/sdk/core/engine/s_d_k_native_engine.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_error_code.dart';
import 'package:here_sdk/src/sdk/core/errors/instantiation_exception.dart';
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/core/language_code.dart';
import 'package:here_sdk/src/sdk/core/threading/on_task_completed.dart';
import 'package:here_sdk/src/sdk/core/threading/task_handle.dart';
import 'package:here_sdk/src/sdk/search/address_query.dart';
import 'package:here_sdk/src/sdk/search/category_query.dart';
import 'package:here_sdk/src/sdk/search/my_places.dart';
import 'package:here_sdk/src/sdk/search/place_id_query.dart';
import 'package:here_sdk/src/sdk/search/place_id_search_callback.dart';
import 'package:here_sdk/src/sdk/search/search_callback.dart';
import 'package:here_sdk/src/sdk/search/search_options.dart';
import 'package:here_sdk/src/sdk/search/suggest_callback.dart';
import 'package:here_sdk/src/sdk/search/text_query.dart';
import 'package:meta/meta.dart';

/// The OfflineSearchEngine works without internet and unlocks the search and geocoding
/// capabilities of HERE services to provide developers with unmatched flexibility
/// to create differentiating location-enabled applications.
///
/// It provides the same interfaces as the SearchEngine, but the results may slightly
/// differ as the results are taken from already downloaded map data instead of initiating
/// a new request to a HERE backend service. This way the data may be, for example, older
/// compared to the data you may receive when using the SearchEngine. On the other hand,
/// this class provides results faster as no online connection is necessary.
///
/// In comparison to the SearchEngine, there are a few limitations:
///
/// - Auto suggestion results are not yet supported.
/// - The IDs of POIs are different and may differ among different map versions.
/// - The implementation is different and the resources are limited, so the results can differ.
///
/// Note: You can only search on already cached map data or persistent map data (downloaded via MapDownloader).
abstract class OfflineSearchEngine {
  /// Creates a new instance of this class.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory OfflineSearchEngine() => $prototype.$init();
  /// Creates a new instance of this class.
  ///
  /// [sdkEngine] Instance of an existing SDKEngine.
  ///
  /// Throws [InstantiationException]. Indicates what went wrong when the instantiation was attempted.
  ///
  factory OfflineSearchEngine.withSdkEngine(SDKNativeEngine sdkEngine) => $prototype.withSdkEngine(sdkEngine);

  /// Attach data source into SearchEngine instance.
  ///
  /// Places from MyPlaces ranked the same
  /// way as places from default source.
  /// New data source replaces old one.
  /// Note: Only OfflineSearchEngine supports search over MyPlaces.
  ///
  TaskHandle attach(MyPlaces dataSource, OnTaskCompleted callback);
  /// Performs an asynchronous request to search for places.
  ///
  /// The user submits a free-form text request
  /// that returns candidate places in the order of intent matching relevance.
  ///
  /// [query] Desired text query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByText(TextQuery query, SearchOptions options, SearchCallback callback);
  /// Performs asynchronous request to search for places based on a list of categories.
  ///
  /// [query] Query with list of desired categories.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByCategory(CategoryQuery query, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to search for places at given coordinates and returns
  /// candidate places in the order of intent matching relevance.
  ///
  /// [coordinates] The coordinates where to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByCoordinates(GeoCoordinates coordinates, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to search for places.
  ///
  /// The user submits a free-form address text
  /// request that returns candidate places in the order of intent matching relevance.
  ///
  /// [query] Desired address query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByAddress(AddressQuery query, SearchOptions options, SearchCallback callback);
  /// Performs an asynchronous request to search for a [Place] based on its ID and [LanguageCode].
  ///
  /// [query] The id of place to search.
  ///
  /// [languageCode] The preferred language for the search results. When unset or unsupported language is chosen,
  /// results will be returned in their local language.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle searchByPlaceIdWithLanguageCode(PlaceIdQuery query, LanguageCode? languageCode, PlaceIdSearchCallback callback);
  /// Performs an asynchronous request to suggest places for text queries and
  /// returns candidate suggestions sorted by relevance.
  ///
  /// [query] Desired text query to search.
  ///
  /// [options] Search options.
  ///
  /// [callback] Callback which receives the result on the main thread.
  ///
  /// Returns [TaskHandle]. Handle that will be used to manipulate the execution of the task.
  ///
  TaskHandle suggest(TextQuery query, SearchOptions options, SuggestCallback callback);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = OfflineSearchEngine$Impl(Pointer<Void>.fromAddress(0));
}


// OfflineSearchEngine "private" section, not exported.

final _sdkSearchOfflinesearchengineRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_search_OfflineSearchEngine_register_finalizer'));
final _sdkSearchOfflinesearchengineCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_copy_handle'));
final _sdkSearchOfflinesearchengineReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_release_handle'));


final _$initReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make_return_release_handle'));
final _$initReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make_return_get_result'));
final _$initReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make_return_get_error'));
final _$initReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make_return_has_error'));


final _withSdkEngineReturnReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make__SDKNativeEngine_return_release_handle'));
final _withSdkEngineReturnGetResult = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make__SDKNativeEngine_return_get_result'));
final _withSdkEngineReturnGetError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make__SDKNativeEngine_return_get_error'));
final _withSdkEngineReturnHasError = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_search_OfflineSearchEngine_make__SDKNativeEngine_return_has_error'));









/// @nodoc
@visibleForTesting
class OfflineSearchEngine$Impl extends __lib.NativeBase implements OfflineSearchEngine {

  OfflineSearchEngine$Impl(Pointer<Void> handle) : super(handle);


  OfflineSearchEngine $init() {
    final _result_handle = _$init();
    final _result = OfflineSearchEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkSearchOfflinesearchengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  OfflineSearchEngine withSdkEngine(SDKNativeEngine sdkEngine) {
    final _result_handle = _withSdkEngine(sdkEngine);
    final _result = OfflineSearchEngine$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkSearchOfflinesearchengineRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _$init() {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32), Pointer<Void> Function(int)>('here_sdk_sdk_search_OfflineSearchEngine_make'));
    final __callResultHandle = _$initFfi(__lib.LibraryContext.isolateId);
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

  static Pointer<Void> _withSdkEngine(SDKNativeEngine sdkEngine) {
    final _withSdkEngineFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __callResultHandle = _withSdkEngineFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    if (_withSdkEngineReturnHasError(__callResultHandle) != 0) {
        final __errorHandle = _withSdkEngineReturnGetError(__callResultHandle);
        _withSdkEngineReturnReleaseHandle(__callResultHandle);
        try {
          throw InstantiationException(sdkCoreErrorsInstantiationerrorcodeFromFfi(__errorHandle));
        } finally {
          sdkCoreErrorsInstantiationerrorcodeReleaseFfiHandle(__errorHandle);
        }
    }
    final __resultHandle = _withSdkEngineReturnGetResult(__callResultHandle);
    _withSdkEngineReturnReleaseHandle(__callResultHandle);
    return __resultHandle;
  }

  @override
  TaskHandle attach(MyPlaces dataSource, OnTaskCompleted callback) {
    final _attachFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_attach__MyPlaces_OnTaskCompleted'));
    final _dataSourceHandle = sdkSearchMyplacesToFfi(dataSource);
    final _callbackHandle = sdkCoreThreadingOntaskcompletedToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _attachFfi(_handle, __lib.LibraryContext.isolateId, _dataSourceHandle, _callbackHandle);
    sdkSearchMyplacesReleaseFfiHandle(_dataSourceHandle);
    sdkCoreThreadingOntaskcompletedReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByText(TextQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByTextFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_search__TextQuery_SearchOptions_SearchCallback'));
    final _queryHandle = sdkSearchTextqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByTextFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchTextqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByCategory(CategoryQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByCategoryFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_search__CategoryQuery_SearchOptions_SearchCallback'));
    final _queryHandle = sdkSearchCategoryqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByCategoryFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchCategoryqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByCoordinates(GeoCoordinates coordinates, SearchOptions options, SearchCallback callback) {
    final _searchByCoordinatesFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_search__GeoCoordinates_SearchOptions_SearchCallback'));
    final _coordinatesHandle = sdkCoreGeocoordinatesToFfi(coordinates);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByCoordinatesFfi(_handle, __lib.LibraryContext.isolateId, _coordinatesHandle, _optionsHandle, _callbackHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_coordinatesHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByAddress(AddressQuery query, SearchOptions options, SearchCallback callback) {
    final _searchByAddressFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_search__AddressQuery_SearchOptions_SearchCallback'));
    final _queryHandle = sdkSearchAddressqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByAddressFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchAddressqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle searchByPlaceIdWithLanguageCode(PlaceIdQuery query, LanguageCode? languageCode, PlaceIdSearchCallback callback) {
    final _searchByPlaceIdWithLanguageCodeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_search__PlaceIdQuery_LanguageCode__PlaceIdSearchCallback'));
    final _queryHandle = sdkSearchPlaceidqueryToFfi(query);
    final _languageCodeHandle = sdkCoreLanguagecodeToFfiNullable(languageCode);
    final _callbackHandle = sdkSearchPlaceidsearchcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _searchByPlaceIdWithLanguageCodeFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _languageCodeHandle, _callbackHandle);
    sdkSearchPlaceidqueryReleaseFfiHandle(_queryHandle);
    sdkCoreLanguagecodeReleaseFfiHandleNullable(_languageCodeHandle);
    sdkSearchPlaceidsearchcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }

  @override
  TaskHandle suggest(TextQuery query, SearchOptions options, SuggestCallback callback) {
    final _suggestFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_search_OfflineSearchEngine_suggest__TextQuery_SearchOptions_SuggestCallback'));
    final _queryHandle = sdkSearchTextqueryToFfi(query);
    final _optionsHandle = sdkSearchSearchoptionsToFfi(options);
    final _callbackHandle = sdkSearchSuggestcallbackToFfi(callback);
    final _handle = this.handle;
    final __resultHandle = _suggestFfi(_handle, __lib.LibraryContext.isolateId, _queryHandle, _optionsHandle, _callbackHandle);
    sdkSearchTextqueryReleaseFfiHandle(_queryHandle);
    sdkSearchSearchoptionsReleaseFfiHandle(_optionsHandle);
    sdkSearchSuggestcallbackReleaseFfiHandle(_callbackHandle);
    try {
      return sdkCoreThreadingTaskhandleFromFfi(__resultHandle);
    } finally {
      sdkCoreThreadingTaskhandleReleaseFfiHandle(__resultHandle);

    }

  }


}

Pointer<Void> sdkSearchOfflinesearchengineToFfi(OfflineSearchEngine value) =>
  _sdkSearchOfflinesearchengineCopyHandle((value as __lib.NativeBase).handle);

OfflineSearchEngine sdkSearchOfflinesearchengineFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is OfflineSearchEngine) return instance;

  final _copiedHandle = _sdkSearchOfflinesearchengineCopyHandle(handle);
  final result = OfflineSearchEngine$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkSearchOfflinesearchengineRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkSearchOfflinesearchengineReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkSearchOfflinesearchengineReleaseHandle(handle);

Pointer<Void> sdkSearchOfflinesearchengineToFfiNullable(OfflineSearchEngine? value) =>
  value != null ? sdkSearchOfflinesearchengineToFfi(value) : Pointer<Void>.fromAddress(0);

OfflineSearchEngine? sdkSearchOfflinesearchengineFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkSearchOfflinesearchengineFromFfi(handle) : null;

void sdkSearchOfflinesearchengineReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkSearchOfflinesearchengineReleaseHandle(handle);

// End of OfflineSearchEngine "private" section.


