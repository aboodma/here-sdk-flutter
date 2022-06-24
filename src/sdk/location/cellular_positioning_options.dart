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
import 'package:here_sdk/src/builtin_types__conversion.dart';

/// Cellular positioning options.

class CellularPositioningOptions {
  /// Controls cellular positioning. If false, cellular positioning is disabled.
  bool enabled;

  CellularPositioningOptions.withDefaults()
      : enabled = true;
  @Deprecated("Will be removed in v4.13.0. Please use `withDefaults()` constructor instead.")
  CellularPositioningOptions(this.enabled);
}


// CellularPositioningOptions "private" section, not exported.

final _sdkLocationCellularpositioningoptionsCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_location_CellularPositioningOptions_create_handle'));
final _sdkLocationCellularpositioningoptionsReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_CellularPositioningOptions_release_handle'));
final _sdkLocationCellularpositioningoptionsGetFieldenabled = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_location_CellularPositioningOptions_get_field_enabled'));



Pointer<Void> sdkLocationCellularpositioningoptionsToFfi(CellularPositioningOptions value) {
  final _enabledHandle = booleanToFfi(value.enabled);
  final _result = _sdkLocationCellularpositioningoptionsCreateHandle(_enabledHandle);
  booleanReleaseFfiHandle(_enabledHandle);
  return _result;
}

CellularPositioningOptions sdkLocationCellularpositioningoptionsFromFfi(Pointer<Void> handle) {
  final _enabledHandle = _sdkLocationCellularpositioningoptionsGetFieldenabled(handle);
  try {
    return CellularPositioningOptions(
      booleanFromFfi(_enabledHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_enabledHandle);
  }
}

void sdkLocationCellularpositioningoptionsReleaseFfiHandle(Pointer<Void> handle) => _sdkLocationCellularpositioningoptionsReleaseHandle(handle);

// Nullable CellularPositioningOptions

final _sdkLocationCellularpositioningoptionsCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_CellularPositioningOptions_create_handle_nullable'));
final _sdkLocationCellularpositioningoptionsReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_location_CellularPositioningOptions_release_handle_nullable'));
final _sdkLocationCellularpositioningoptionsGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_location_CellularPositioningOptions_get_value_nullable'));

Pointer<Void> sdkLocationCellularpositioningoptionsToFfiNullable(CellularPositioningOptions? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkLocationCellularpositioningoptionsToFfi(value);
  final result = _sdkLocationCellularpositioningoptionsCreateHandleNullable(_handle);
  sdkLocationCellularpositioningoptionsReleaseFfiHandle(_handle);
  return result;
}

CellularPositioningOptions? sdkLocationCellularpositioningoptionsFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkLocationCellularpositioningoptionsGetValueNullable(handle);
  final result = sdkLocationCellularpositioningoptionsFromFfi(_handle);
  sdkLocationCellularpositioningoptionsReleaseFfiHandle(_handle);
  return result;
}

void sdkLocationCellularpositioningoptionsReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkLocationCellularpositioningoptionsReleaseHandleNullable(handle);

// End of CellularPositioningOptions "private" section.


