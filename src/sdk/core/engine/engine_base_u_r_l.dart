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

/// Lists the available HERE SDK engines that can be customized with a custom backend base URL.
enum EngineBaseURL {
    /// Indicates a `SearchEngine` endpoint.
    /// Note that the provided string value will replace the base URL.
    /// The endpoint names for this engine are "v1/discover", "v1/geocode", "v1/revgeocode",
    /// "v1/autosuggest", "v1/lookup" and "v1/browse". A valid base string value
    /// could look like "www.my-company.com". An example of the resulting URL for the first
    /// endpoint looks like this: "https://www.my-company.com/v1/discover" appended with
    /// query data. You need to ensure that the provided base URL supports all required endpoints.
    searchEngine,
    /// Indicates a `RoutingEngine` endpoint.
    /// Note that the provided string value will replace the base URL.
    /// The endpoint names for this engine are "v8/routes", "v8/import". A valid base string value
    /// could look like "www.my-company.com". An example of the resulting URL for the first
    /// endpoint looks like this: "https://www.my-company.com/v8/routing" appended with
    /// query data. You need to ensure that the provided base URL supports all required endpoints.
    routingEngine
}

// EngineBaseURL "private" section, not exported.

int sdkCoreEngineEnginebaseurlToFfi(EngineBaseURL value) {
  switch (value) {
  case EngineBaseURL.searchEngine:
    return 0;
  case EngineBaseURL.routingEngine:
    return 1;
  default:
    throw StateError("Invalid enum value $value for EngineBaseURL enum.");
  }
}

EngineBaseURL sdkCoreEngineEnginebaseurlFromFfi(int handle) {
  switch (handle) {
  case 0:
    return EngineBaseURL.searchEngine;
  case 1:
    return EngineBaseURL.routingEngine;
  default:
    throw StateError("Invalid numeric value $handle for EngineBaseURL enum.");
  }
}

void sdkCoreEngineEnginebaseurlReleaseFfiHandle(int handle) {}

final _sdkCoreEngineEnginebaseurlCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_engine_EngineBaseURL_create_handle_nullable'));
final _sdkCoreEngineEnginebaseurlReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_EngineBaseURL_release_handle_nullable'));
final _sdkCoreEngineEnginebaseurlGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_EngineBaseURL_get_value_nullable'));

Pointer<Void> sdkCoreEngineEnginebaseurlToFfiNullable(EngineBaseURL? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreEngineEnginebaseurlToFfi(value);
  final result = _sdkCoreEngineEnginebaseurlCreateHandleNullable(_handle);
  sdkCoreEngineEnginebaseurlReleaseFfiHandle(_handle);
  return result;
}

EngineBaseURL? sdkCoreEngineEnginebaseurlFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreEngineEnginebaseurlGetValueNullable(handle);
  final result = sdkCoreEngineEnginebaseurlFromFfi(_handle);
  sdkCoreEngineEnginebaseurlReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreEngineEnginebaseurlReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreEngineEnginebaseurlReleaseHandleNullable(handle);

// End of EngineBaseURL "private" section.


