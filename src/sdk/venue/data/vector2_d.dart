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
import 'package:meta/meta.dart';











/// Specifies the interface of 2-dimensional vectors.
/// @nodoc
@internal

class Vector2D {
  /// Position along the X axis. The default value is 0.
  /// @nodoc
  @internal
  double internalx;

  /// Position along the Y axis. The default value is 0.
  /// @nodoc
  @internal
  double internaly;

  Vector2D._(this.internalx, this.internaly);
  Vector2D()
    : internalx = 0.0, internaly = 0.0;
  /// Gets the length of the vector.
  ///
  /// Returns [double]. The Float with the length of the vector.
  ///
  /// @nodoc
  double internallength() => $prototype.internallength(this);
  /// Returns the normalized version of the vector with a length of 1.
  ///
  /// Returns [Vector2D]. The copy of the vector object with a length of 1.
  ///
  /// @nodoc
  Vector2D internalnormalize() => $prototype.internalnormalize(this);
  /// Rotates the vector to the specified angle.
  ///
  /// [angle] Angle in degrees on which the vector should be rotated.
  ///
  /// Returns [Vector2D]. The copy of the vector with the rotation applied.
  ///
  /// @nodoc
  Vector2D internalrotate(double angle) => $prototype.internalrotate(this, angle);
  /// Gets the angle between 2 vectors.
  ///
  /// [vector] The vector used to calculate the angle between it and the current vector.
  ///
  /// Returns [double]. The result angle value in degrees.
  ///
  /// @nodoc
  double internalangle(Vector2D vector) => $prototype.internalangle(this, vector);
  /// Adds a vector to the current one.
  ///
  /// [vector] The vector to add.
  ///
  /// Returns [Vector2D]. The result vector with the add operation applied.
  ///
  /// @nodoc
  Vector2D internaladd(Vector2D vector) => $prototype.internaladd(this, vector);
  /// Subtracts a vector from the current one.
  ///
  /// [vector] The vector to remove.
  ///
  /// Returns [Vector2D]. The result vector with the subtract operation applied.
  ///
  /// @nodoc
  Vector2D internalsubtract(Vector2D vector) => $prototype.internalsubtract(this, vector);
  /// Multiplies the vector to a constant value.
  ///
  /// [value] The constant value.
  ///
  /// Returns [Vector2D]. The result vector with the multiplication applied.
  ///
  /// @nodoc
  Vector2D internalmultiply(double value) => $prototype.internalmultiply(this, value);
  /// Divides the vector to a constant value.
  ///
  /// [value] The constant value.
  ///
  /// Returns [Vector2D]. The result vector with the division applied.
  ///
  /// @nodoc
  Vector2D internaldivide(double value) => $prototype.internaldivide(this, value);
  /// Multiplies two vectors component-wise.
  ///
  /// Every component in the result is
  /// a component of the first vector multiplied by the same component of the second vector.
  ///
  /// [left] The first vector.
  ///
  /// [right] The second vector.
  ///
  /// Returns [Vector2D]. The result vector.
  ///
  /// @nodoc
  static Vector2D internalscale(Vector2D left, Vector2D right) => $prototype.internalscale(left, right);
  /// Dot product of two vectors.
  ///
  /// For normalized vectors, the Dot product returns 1 if they point in
  /// exactly the same direction; -1 if they point in completely opposite directions;
  /// and a number in between for other cases (e.g. the Dot product returns zero if the vectors are
  /// perpendicular). For vectors of arbitrary length, the Dot product returns values that are similar:
  /// they get larger when the angle between the vectors decreases.
  ///
  /// [left] The left vector of the Dot product.
  ///
  /// [right] The right vector of the Dot product.
  ///
  /// Returns [double]. The result of Dot product (left .
  ///
  /// right).
  ///
  /// @nodoc
  static double internaldot(Vector2D left, Vector2D right) => $prototype.internaldot(left, right);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Vector2D) return false;
    Vector2D _other = other;
    return internalx == _other.internalx &&
        internaly == _other.internaly;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + internalx.hashCode;
    result = 31 * result + internaly.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Vector2D$Impl();
}


// Vector2D "private" section, not exported.

final _sdkVenueDataVector2dCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('here_sdk_sdk_venue_data_Vector2D_create_handle'));
final _sdkVenueDataVector2dReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_Vector2D_release_handle'));
final _sdkVenueDataVector2dGetFieldx = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_Vector2D_get_field_x'));
final _sdkVenueDataVector2dGetFieldy = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_Vector2D_get_field_y'));



/// @nodoc
@visibleForTesting
class Vector2D$Impl {
  double internallength(Vector2D $that) {
    final _lengthFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32), double Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_Vector2D_length'));
    final _handle = sdkVenueDataVector2dToFfi($that);
    final __resultHandle = _lengthFfi(_handle, __lib.LibraryContext.isolateId);
    sdkVenueDataVector2dReleaseFfiHandle(_handle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  Vector2D internalnormalize(Vector2D $that) {
    final _normalizeFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_Vector2D_normalize'));
    final _handle = sdkVenueDataVector2dToFfi($that);
    final __resultHandle = _normalizeFfi(_handle, __lib.LibraryContext.isolateId);
    sdkVenueDataVector2dReleaseFfiHandle(_handle);
    try {
      return sdkVenueDataVector2dFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVector2dReleaseFfiHandle(__resultHandle);

    }

  }

  Vector2D internalrotate(Vector2D $that, double angle) {
    final _rotateFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double), Pointer<Void> Function(Pointer<Void>, int, double)>('here_sdk_sdk_venue_data_Vector2D_rotate__Double'));
    final _angleHandle = (angle);
    final _handle = sdkVenueDataVector2dToFfi($that);
    final __resultHandle = _rotateFfi(_handle, __lib.LibraryContext.isolateId, _angleHandle);
    sdkVenueDataVector2dReleaseFfiHandle(_handle);

    try {
      return sdkVenueDataVector2dFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVector2dReleaseFfiHandle(__resultHandle);

    }

  }

  double internalangle(Vector2D $that, Vector2D vector) {
    final _angleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Pointer<Void>, Int32, Pointer<Void>), double Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_Vector2D_angle__Vector2D'));
    final _vectorHandle = sdkVenueDataVector2dToFfi(vector);
    final _handle = sdkVenueDataVector2dToFfi($that);
    final __resultHandle = _angleFfi(_handle, __lib.LibraryContext.isolateId, _vectorHandle);
    sdkVenueDataVector2dReleaseFfiHandle(_handle);
    sdkVenueDataVector2dReleaseFfiHandle(_vectorHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

  Vector2D internaladd(Vector2D $that, Vector2D vector) {
    final _addFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_Vector2D_add__Vector2D'));
    final _vectorHandle = sdkVenueDataVector2dToFfi(vector);
    final _handle = sdkVenueDataVector2dToFfi($that);
    final __resultHandle = _addFfi(_handle, __lib.LibraryContext.isolateId, _vectorHandle);
    sdkVenueDataVector2dReleaseFfiHandle(_handle);
    sdkVenueDataVector2dReleaseFfiHandle(_vectorHandle);
    try {
      return sdkVenueDataVector2dFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVector2dReleaseFfiHandle(__resultHandle);

    }

  }

  Vector2D internalsubtract(Vector2D $that, Vector2D vector) {
    final _subtractFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Pointer<Void>), Pointer<Void> Function(Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_venue_data_Vector2D_subtract__Vector2D'));
    final _vectorHandle = sdkVenueDataVector2dToFfi(vector);
    final _handle = sdkVenueDataVector2dToFfi($that);
    final __resultHandle = _subtractFfi(_handle, __lib.LibraryContext.isolateId, _vectorHandle);
    sdkVenueDataVector2dReleaseFfiHandle(_handle);
    sdkVenueDataVector2dReleaseFfiHandle(_vectorHandle);
    try {
      return sdkVenueDataVector2dFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVector2dReleaseFfiHandle(__resultHandle);

    }

  }

  Vector2D internalmultiply(Vector2D $that, double value) {
    final _multiplyFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double), Pointer<Void> Function(Pointer<Void>, int, double)>('here_sdk_sdk_venue_data_Vector2D_multiply__Double'));
    final _valueHandle = (value);
    final _handle = sdkVenueDataVector2dToFfi($that);
    final __resultHandle = _multiplyFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkVenueDataVector2dReleaseFfiHandle(_handle);

    try {
      return sdkVenueDataVector2dFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVector2dReleaseFfiHandle(__resultHandle);

    }

  }

  Vector2D internaldivide(Vector2D $that, double value) {
    final _divideFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32, Double), Pointer<Void> Function(Pointer<Void>, int, double)>('here_sdk_sdk_venue_data_Vector2D_divide__Double'));
    final _valueHandle = (value);
    final _handle = sdkVenueDataVector2dToFfi($that);
    final __resultHandle = _divideFfi(_handle, __lib.LibraryContext.isolateId, _valueHandle);
    sdkVenueDataVector2dReleaseFfiHandle(_handle);

    try {
      return sdkVenueDataVector2dFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVector2dReleaseFfiHandle(__resultHandle);

    }

  }

  Vector2D internalscale(Vector2D left, Vector2D right) {
    final _scaleFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_venue_data_Vector2D_scale__Vector2D_Vector2D'));
    final _leftHandle = sdkVenueDataVector2dToFfi(left);
    final _rightHandle = sdkVenueDataVector2dToFfi(right);
    final __resultHandle = _scaleFfi(__lib.LibraryContext.isolateId, _leftHandle, _rightHandle);
    sdkVenueDataVector2dReleaseFfiHandle(_leftHandle);
    sdkVenueDataVector2dReleaseFfiHandle(_rightHandle);
    try {
      return sdkVenueDataVector2dFromFfi(__resultHandle);
    } finally {
      sdkVenueDataVector2dReleaseFfiHandle(__resultHandle);

    }

  }

  double internaldot(Vector2D left, Vector2D right) {
    final _dotFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Double Function(Int32, Pointer<Void>, Pointer<Void>), double Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_venue_data_Vector2D_dot__Vector2D_Vector2D'));
    final _leftHandle = sdkVenueDataVector2dToFfi(left);
    final _rightHandle = sdkVenueDataVector2dToFfi(right);
    final __resultHandle = _dotFfi(__lib.LibraryContext.isolateId, _leftHandle, _rightHandle);
    sdkVenueDataVector2dReleaseFfiHandle(_leftHandle);
    sdkVenueDataVector2dReleaseFfiHandle(_rightHandle);
    try {
      return (__resultHandle);
    } finally {


    }

  }

}

Pointer<Void> sdkVenueDataVector2dToFfi(Vector2D value) {
  final _xHandle = (value.internalx);
  final _yHandle = (value.internaly);
  final _result = _sdkVenueDataVector2dCreateHandle(_xHandle, _yHandle);
  
  
  return _result;
}

Vector2D sdkVenueDataVector2dFromFfi(Pointer<Void> handle) {
  final _xHandle = _sdkVenueDataVector2dGetFieldx(handle);
  final _yHandle = _sdkVenueDataVector2dGetFieldy(handle);
  try {
    return Vector2D._(
      (_xHandle), 
      (_yHandle)
    );
  } finally {
    
    
  }
}

void sdkVenueDataVector2dReleaseFfiHandle(Pointer<Void> handle) => _sdkVenueDataVector2dReleaseHandle(handle);

// Nullable Vector2D

final _sdkVenueDataVector2dCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_Vector2D_create_handle_nullable'));
final _sdkVenueDataVector2dReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_Vector2D_release_handle_nullable'));
final _sdkVenueDataVector2dGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_Vector2D_get_value_nullable'));

Pointer<Void> sdkVenueDataVector2dToFfiNullable(Vector2D? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkVenueDataVector2dToFfi(value);
  final result = _sdkVenueDataVector2dCreateHandleNullable(_handle);
  sdkVenueDataVector2dReleaseFfiHandle(_handle);
  return result;
}

Vector2D? sdkVenueDataVector2dFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkVenueDataVector2dGetValueNullable(handle);
  final result = sdkVenueDataVector2dFromFfi(_handle);
  sdkVenueDataVector2dReleaseFfiHandle(_handle);
  return result;
}

void sdkVenueDataVector2dReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataVector2dReleaseHandleNullable(handle);

// End of Vector2D "private" section.


