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
import 'package:here_sdk/src/sdk/core/geo_coordinates.dart';
import 'package:here_sdk/src/sdk/navigation/navigator.dart';
import 'package:meta/meta.dart';

/// Supports downloading of map data - in advance - into the cache to optimize temporary offline
/// use cases that rely on cached map data.
///
/// This allows scenarios such as navigation to work in a
/// specific area reliably even though the network might be offline at that time.
/// Please note, this class puts data in the map cache, which has its own size constraints,
/// and extensive usage may start evicting old cached data.
/// Note: This is a beta release of this feature, so there could be a few bugs and unexpected behaviors.
/// Related APIs may change for new releases without a deprecation process.
abstract class RoutePrefetcher {
  /// Creates a RoutePrefetcher instance for a given [SDKNativeEngine].
  ///
  /// [sdkEngine] Instance of an existing SDKEngine.
  ///
  factory RoutePrefetcher(SDKNativeEngine sdkEngine) => $prototype.make(sdkEngine);

  /// Prefetches map data within a circle of radius 2km of around a location.
  ///
  /// It is recommended to call this method once before starting navigation
  /// for a smooth experience.
  ///
  void prefetchAroundLocation(GeoCoordinates currentLocation);
  /// Prefetches map data within a corridor along the route, that is currently set for the
  /// provided [Navigator] instance.
  ///
  /// If no route is set, no data will be prefetched.
  /// The route corridor defaults to a length of 10 km and a width of 5 km.
  /// Map data is prefetched only in discrete intervals. Prefetching starts 1 km before reaching the
  /// end of the current corridor. Prefetching happens based on the current map-matched location - as
  /// indicated by the [RouteProgress] event.
  /// This method should be called right after navigation has started.
  /// The first prefetching will start after travelling a distance of 9 km along the route.
  ///
  void prefetchAroundRouteOnIntervals(Navigator navigator);

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = RoutePrefetcher$Impl(Pointer<Void>.fromAddress(0));
}


// RoutePrefetcher "private" section, not exported.

final _sdkPrefetcherRouteprefetcherRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_prefetcher_RoutePrefetcher_register_finalizer'));
final _sdkPrefetcherRouteprefetcherCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_RoutePrefetcher_copy_handle'));
final _sdkPrefetcherRouteprefetcherReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_prefetcher_RoutePrefetcher_release_handle'));





/// @nodoc
@visibleForTesting
class RoutePrefetcher$Impl extends __lib.NativeBase implements RoutePrefetcher {

  RoutePrefetcher$Impl(Pointer<Void> handle) : super(handle);


  RoutePrefetcher make(SDKNativeEngine sdkEngine) {
    final _result_handle = _make(sdkEngine);
    final _result = RoutePrefetcher$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkPrefetcherRouteprefetcherRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  static Pointer<Void> _make(SDKNativeEngine sdkEngine) {
    final _makeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_prefetcher_RoutePrefetcher_make__SDKNativeEngine'));
    final _sdkEngineHandle = sdkCoreEngineSdknativeengineToFfi(sdkEngine);
    final __resultHandle = _makeFfi(__lib.LibraryContext.isolateId, _sdkEngineHandle);
    sdkCoreEngineSdknativeengineReleaseFfiHandle(_sdkEngineHandle);
    return __resultHandle;
  }

  @override
  void prefetchAroundLocation(GeoCoordinates currentLocation) {
    final _prefetchAroundLocationFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_prefetcher_RoutePrefetcher_prefetchAroundLocation__GeoCoordinates'));
    final _currentLocationHandle = sdkCoreGeocoordinatesToFfi(currentLocation);
    final _handle = this.handle;
    _prefetchAroundLocationFfi(_handle, __lib.LibraryContext.isolateId, _currentLocationHandle);
    sdkCoreGeocoordinatesReleaseFfiHandle(_currentLocationHandle);

  }

  @override
  void prefetchAroundRouteOnIntervals(Navigator navigator) {
    final _prefetchAroundRouteOnIntervalsFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Void Function(Pointer<Void>, Int32, Pointer<Void>), void Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_prefetcher_RoutePrefetcher_prefetchAroundRouteOnIntervals__Navigator'));
    final _navigatorHandle = sdkNavigationNavigatorToFfi(navigator);
    final _handle = this.handle;
    _prefetchAroundRouteOnIntervalsFfi(_handle, __lib.LibraryContext.isolateId, _navigatorHandle);
    sdkNavigationNavigatorReleaseFfiHandle(_navigatorHandle);

  }


}

Pointer<Void> sdkPrefetcherRouteprefetcherToFfi(RoutePrefetcher value) =>
  _sdkPrefetcherRouteprefetcherCopyHandle((value as __lib.NativeBase).handle);

RoutePrefetcher sdkPrefetcherRouteprefetcherFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is RoutePrefetcher) return instance;

  final _copiedHandle = _sdkPrefetcherRouteprefetcherCopyHandle(handle);
  final result = RoutePrefetcher$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkPrefetcherRouteprefetcherRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkPrefetcherRouteprefetcherReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkPrefetcherRouteprefetcherReleaseHandle(handle);

Pointer<Void> sdkPrefetcherRouteprefetcherToFfiNullable(RoutePrefetcher? value) =>
  value != null ? sdkPrefetcherRouteprefetcherToFfi(value) : Pointer<Void>.fromAddress(0);

RoutePrefetcher? sdkPrefetcherRouteprefetcherFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkPrefetcherRouteprefetcherFromFfi(handle) : null;

void sdkPrefetcherRouteprefetcherReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkPrefetcherRouteprefetcherReleaseHandle(handle);

// End of RoutePrefetcher "private" section.


