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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/navigation/maneuver_progress.dart';
import 'package:here_sdk/src/sdk/navigation/section_progress.dart';

/// Contains all the relevant information on the user's progress along a route.

class RouteProgress {
  /// Index of the [Section] in the route.
  int sectionIndex;

  /// The progress for each [Section] from the current one to the last one.
  /// Note that the progress information is accumulated successively, therefore information relative
  /// to the final destination is in the last item of the list. The list is guaranteed to be non-empty.
  List<SectionProgress> sectionProgress;

  /// The progress for next and next-next maneuvers (see [Maneuver]). Note that the list
  /// can contain at maximum two items (for next and next-next maneuvers) and one or zero when approaching the
  /// destination.
  List<ManeuverProgress> maneuverProgress;

  RouteProgress(this.sectionIndex, this.sectionProgress, this.maneuverProgress);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! RouteProgress) return false;
    RouteProgress _other = other;
    return sectionIndex == _other.sectionIndex &&
        DeepCollectionEquality().equals(sectionProgress, _other.sectionProgress) &&
        DeepCollectionEquality().equals(maneuverProgress, _other.maneuverProgress);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + sectionIndex.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(sectionProgress);
    result = 31 * result + DeepCollectionEquality().hash(maneuverProgress);
    return result;
  }
}


// RouteProgress "private" section, not exported.

final _sdkNavigationRouteprogressCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgress_create_handle'));
final _sdkNavigationRouteprogressReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgress_release_handle'));
final _sdkNavigationRouteprogressGetFieldsectionIndex = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgress_get_field_sectionIndex'));
final _sdkNavigationRouteprogressGetFieldsectionProgress = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgress_get_field_sectionProgress'));
final _sdkNavigationRouteprogressGetFieldmaneuverProgress = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgress_get_field_maneuverProgress'));



Pointer<Void> sdkNavigationRouteprogressToFfi(RouteProgress value) {
  final _sectionIndexHandle = (value.sectionIndex);
  final _sectionProgressHandle = heresdkNavigationBindingslistofSdkNavigationSectionprogressToFfi(value.sectionProgress);
  final _maneuverProgressHandle = heresdkNavigationBindingslistofSdkNavigationManeuverprogressToFfi(value.maneuverProgress);
  final _result = _sdkNavigationRouteprogressCreateHandle(_sectionIndexHandle, _sectionProgressHandle, _maneuverProgressHandle);
  
  heresdkNavigationBindingslistofSdkNavigationSectionprogressReleaseFfiHandle(_sectionProgressHandle);
  heresdkNavigationBindingslistofSdkNavigationManeuverprogressReleaseFfiHandle(_maneuverProgressHandle);
  return _result;
}

RouteProgress sdkNavigationRouteprogressFromFfi(Pointer<Void> handle) {
  final _sectionIndexHandle = _sdkNavigationRouteprogressGetFieldsectionIndex(handle);
  final _sectionProgressHandle = _sdkNavigationRouteprogressGetFieldsectionProgress(handle);
  final _maneuverProgressHandle = _sdkNavigationRouteprogressGetFieldmaneuverProgress(handle);
  try {
    return RouteProgress(
      (_sectionIndexHandle), 
      heresdkNavigationBindingslistofSdkNavigationSectionprogressFromFfi(_sectionProgressHandle), 
      heresdkNavigationBindingslistofSdkNavigationManeuverprogressFromFfi(_maneuverProgressHandle)
    );
  } finally {
    
    heresdkNavigationBindingslistofSdkNavigationSectionprogressReleaseFfiHandle(_sectionProgressHandle);
    heresdkNavigationBindingslistofSdkNavigationManeuverprogressReleaseFfiHandle(_maneuverProgressHandle);
  }
}

void sdkNavigationRouteprogressReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationRouteprogressReleaseHandle(handle);

// Nullable RouteProgress

final _sdkNavigationRouteprogressCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgress_create_handle_nullable'));
final _sdkNavigationRouteprogressReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgress_release_handle_nullable'));
final _sdkNavigationRouteprogressGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_RouteProgress_get_value_nullable'));

Pointer<Void> sdkNavigationRouteprogressToFfiNullable(RouteProgress? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationRouteprogressToFfi(value);
  final result = _sdkNavigationRouteprogressCreateHandleNullable(_handle);
  sdkNavigationRouteprogressReleaseFfiHandle(_handle);
  return result;
}

RouteProgress? sdkNavigationRouteprogressFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationRouteprogressGetValueNullable(handle);
  final result = sdkNavigationRouteprogressFromFfi(_handle);
  sdkNavigationRouteprogressReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationRouteprogressReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationRouteprogressReleaseHandleNullable(handle);

// End of RouteProgress "private" section.


