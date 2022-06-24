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

/// Indicates the directions of a lane.
///
/// Most lanes lead only to one direction,
/// but there can be also lanes that split up into multiple directions.
/// A road can consist of multiple lanes towards the same direction.
/// Note: All members can be true or false at the same time. Lanes such as bicycle
/// lanes mostly never contain a direction category and thus, all members are false.

class LaneDirectionCategory {
  /// A lane that goes straight up.
  bool straight;

  /// A lane that goes slightly left.
  bool slightlyLeft;

  /// A lane that goes quite left.
  bool quiteLeft;

  /// A lane that goes hard left.
  bool hardLeft;

  /// A lane that makes a left u-turn.
  bool uTurnLeft;

  /// A lane that goes slightly right.
  bool slightlyRight;

  /// A lane that goes quite right.
  bool quiteRight;

  /// A lane that goes hard right.
  bool hardRight;

  /// A lane that makes a right u-turn.
  bool uTurnRight;

  LaneDirectionCategory(this.straight, this.slightlyLeft, this.quiteLeft, this.hardLeft, this.uTurnLeft, this.slightlyRight, this.quiteRight, this.hardRight, this.uTurnRight);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LaneDirectionCategory) return false;
    LaneDirectionCategory _other = other;
    return straight == _other.straight &&
        slightlyLeft == _other.slightlyLeft &&
        quiteLeft == _other.quiteLeft &&
        hardLeft == _other.hardLeft &&
        uTurnLeft == _other.uTurnLeft &&
        slightlyRight == _other.slightlyRight &&
        quiteRight == _other.quiteRight &&
        hardRight == _other.hardRight &&
        uTurnRight == _other.uTurnRight;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + straight.hashCode;
    result = 31 * result + slightlyLeft.hashCode;
    result = 31 * result + quiteLeft.hashCode;
    result = 31 * result + hardLeft.hashCode;
    result = 31 * result + uTurnLeft.hashCode;
    result = 31 * result + slightlyRight.hashCode;
    result = 31 * result + quiteRight.hashCode;
    result = 31 * result + hardRight.hashCode;
    result = 31 * result + uTurnRight.hashCode;
    return result;
  }
}


// LaneDirectionCategory "private" section, not exported.

final _sdkNavigationLanedirectioncategoryCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8, Uint8),
    Pointer<Void> Function(int, int, int, int, int, int, int, int, int)
  >('here_sdk_sdk_navigation_LaneDirectionCategory_create_handle'));
final _sdkNavigationLanedirectioncategoryReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneDirectionCategory_release_handle'));
final _sdkNavigationLanedirectioncategoryGetFieldstraight = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneDirectionCategory_get_field_straight'));
final _sdkNavigationLanedirectioncategoryGetFieldslightlyLeft = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneDirectionCategory_get_field_slightlyLeft'));
final _sdkNavigationLanedirectioncategoryGetFieldquiteLeft = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneDirectionCategory_get_field_quiteLeft'));
final _sdkNavigationLanedirectioncategoryGetFieldhardLeft = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneDirectionCategory_get_field_hardLeft'));
final _sdkNavigationLanedirectioncategoryGetFielduTurnLeft = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneDirectionCategory_get_field_uTurnLeft'));
final _sdkNavigationLanedirectioncategoryGetFieldslightlyRight = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneDirectionCategory_get_field_slightlyRight'));
final _sdkNavigationLanedirectioncategoryGetFieldquiteRight = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneDirectionCategory_get_field_quiteRight'));
final _sdkNavigationLanedirectioncategoryGetFieldhardRight = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneDirectionCategory_get_field_hardRight'));
final _sdkNavigationLanedirectioncategoryGetFielduTurnRight = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneDirectionCategory_get_field_uTurnRight'));



Pointer<Void> sdkNavigationLanedirectioncategoryToFfi(LaneDirectionCategory value) {
  final _straightHandle = booleanToFfi(value.straight);
  final _slightlyLeftHandle = booleanToFfi(value.slightlyLeft);
  final _quiteLeftHandle = booleanToFfi(value.quiteLeft);
  final _hardLeftHandle = booleanToFfi(value.hardLeft);
  final _uTurnLeftHandle = booleanToFfi(value.uTurnLeft);
  final _slightlyRightHandle = booleanToFfi(value.slightlyRight);
  final _quiteRightHandle = booleanToFfi(value.quiteRight);
  final _hardRightHandle = booleanToFfi(value.hardRight);
  final _uTurnRightHandle = booleanToFfi(value.uTurnRight);
  final _result = _sdkNavigationLanedirectioncategoryCreateHandle(_straightHandle, _slightlyLeftHandle, _quiteLeftHandle, _hardLeftHandle, _uTurnLeftHandle, _slightlyRightHandle, _quiteRightHandle, _hardRightHandle, _uTurnRightHandle);
  booleanReleaseFfiHandle(_straightHandle);
  booleanReleaseFfiHandle(_slightlyLeftHandle);
  booleanReleaseFfiHandle(_quiteLeftHandle);
  booleanReleaseFfiHandle(_hardLeftHandle);
  booleanReleaseFfiHandle(_uTurnLeftHandle);
  booleanReleaseFfiHandle(_slightlyRightHandle);
  booleanReleaseFfiHandle(_quiteRightHandle);
  booleanReleaseFfiHandle(_hardRightHandle);
  booleanReleaseFfiHandle(_uTurnRightHandle);
  return _result;
}

LaneDirectionCategory sdkNavigationLanedirectioncategoryFromFfi(Pointer<Void> handle) {
  final _straightHandle = _sdkNavigationLanedirectioncategoryGetFieldstraight(handle);
  final _slightlyLeftHandle = _sdkNavigationLanedirectioncategoryGetFieldslightlyLeft(handle);
  final _quiteLeftHandle = _sdkNavigationLanedirectioncategoryGetFieldquiteLeft(handle);
  final _hardLeftHandle = _sdkNavigationLanedirectioncategoryGetFieldhardLeft(handle);
  final _uTurnLeftHandle = _sdkNavigationLanedirectioncategoryGetFielduTurnLeft(handle);
  final _slightlyRightHandle = _sdkNavigationLanedirectioncategoryGetFieldslightlyRight(handle);
  final _quiteRightHandle = _sdkNavigationLanedirectioncategoryGetFieldquiteRight(handle);
  final _hardRightHandle = _sdkNavigationLanedirectioncategoryGetFieldhardRight(handle);
  final _uTurnRightHandle = _sdkNavigationLanedirectioncategoryGetFielduTurnRight(handle);
  try {
    return LaneDirectionCategory(
      booleanFromFfi(_straightHandle), 
      booleanFromFfi(_slightlyLeftHandle), 
      booleanFromFfi(_quiteLeftHandle), 
      booleanFromFfi(_hardLeftHandle), 
      booleanFromFfi(_uTurnLeftHandle), 
      booleanFromFfi(_slightlyRightHandle), 
      booleanFromFfi(_quiteRightHandle), 
      booleanFromFfi(_hardRightHandle), 
      booleanFromFfi(_uTurnRightHandle)
    );
  } finally {
    booleanReleaseFfiHandle(_straightHandle);
    booleanReleaseFfiHandle(_slightlyLeftHandle);
    booleanReleaseFfiHandle(_quiteLeftHandle);
    booleanReleaseFfiHandle(_hardLeftHandle);
    booleanReleaseFfiHandle(_uTurnLeftHandle);
    booleanReleaseFfiHandle(_slightlyRightHandle);
    booleanReleaseFfiHandle(_quiteRightHandle);
    booleanReleaseFfiHandle(_hardRightHandle);
    booleanReleaseFfiHandle(_uTurnRightHandle);
  }
}

void sdkNavigationLanedirectioncategoryReleaseFfiHandle(Pointer<Void> handle) => _sdkNavigationLanedirectioncategoryReleaseHandle(handle);

// Nullable LaneDirectionCategory

final _sdkNavigationLanedirectioncategoryCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneDirectionCategory_create_handle_nullable'));
final _sdkNavigationLanedirectioncategoryReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneDirectionCategory_release_handle_nullable'));
final _sdkNavigationLanedirectioncategoryGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_navigation_LaneDirectionCategory_get_value_nullable'));

Pointer<Void> sdkNavigationLanedirectioncategoryToFfiNullable(LaneDirectionCategory? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkNavigationLanedirectioncategoryToFfi(value);
  final result = _sdkNavigationLanedirectioncategoryCreateHandleNullable(_handle);
  sdkNavigationLanedirectioncategoryReleaseFfiHandle(_handle);
  return result;
}

LaneDirectionCategory? sdkNavigationLanedirectioncategoryFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkNavigationLanedirectioncategoryGetValueNullable(handle);
  final result = sdkNavigationLanedirectioncategoryFromFfi(_handle);
  sdkNavigationLanedirectioncategoryReleaseFfiHandle(_handle);
  return result;
}

void sdkNavigationLanedirectioncategoryReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkNavigationLanedirectioncategoryReleaseHandleNullable(handle);

// End of LaneDirectionCategory "private" section.


