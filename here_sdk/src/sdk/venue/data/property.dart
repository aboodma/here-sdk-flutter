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
import 'package:meta/meta.dart';

/// Holds information of varying types, such as Boolean, Integer, String.
///
/// Properties are used
/// in [VenueModel] [VenueDrawing], [VenueLevel]
/// and [VenueGeometry] to describe this objects.
abstract class Property {
  /// Creates a property of the type Boolean.
  ///
  /// [value] The boolean value of the property.
  ///
  /// @nodoc
  factory Property.withBoolean(bool value) => $prototype.internalwithBoolean(value);
  /// Creates a property of the type Integer.
  ///
  /// [value] The Integer value of the property.
  ///
  /// @nodoc
  factory Property.withInt(int value) => $prototype.internalwithInt(value);
  /// Creates a property of the type String.
  ///
  /// [value] The String value of the property.
  ///
  /// @nodoc
  factory Property.withString(String value) => $prototype.internalwithString(value);

  /// Converts the value of the property to a string.
  ///
  /// This works for properties of all types.
  ///
  /// Returns [String]. The string value.
  ///
  String toString_();
  /// Gets a type of the property.
  PropertyPropertyType get type;

  /// Gets the property as a Boolean value.
  bool get asBool;

  /// Gets the property as an Integer value.
  int get asInt;

  /// Gets the property as a String value.
  String get asString;


  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = Property$Impl(Pointer<Void>.fromAddress(0));
}

/// Types of properties.
enum PropertyPropertyType {
    /// A Boolean property.
    bool,
    /// An Integer property.
    int,
    /// A string property.
    string
}

// PropertyPropertyType "private" section, not exported.

int sdkVenueDataPropertyPropertytypeToFfi(PropertyPropertyType value) {
  switch (value) {
  case PropertyPropertyType.bool:
    return 0;
  case PropertyPropertyType.int:
    return 1;
  case PropertyPropertyType.string:
    return 2;
  default:
    throw StateError("Invalid enum value $value for PropertyPropertyType enum.");
  }
}

PropertyPropertyType sdkVenueDataPropertyPropertytypeFromFfi(int handle) {
  switch (handle) {
  case 0:
    return PropertyPropertyType.bool;
  case 1:
    return PropertyPropertyType.int;
  case 2:
    return PropertyPropertyType.string;
  default:
    throw StateError("Invalid numeric value $handle for PropertyPropertyType enum.");
  }
}

void sdkVenueDataPropertyPropertytypeReleaseFfiHandle(int handle) {}

final _sdkVenueDataPropertyPropertytypeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_venue_data_Property_PropertyType_create_handle_nullable'));
final _sdkVenueDataPropertyPropertytypeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_Property_PropertyType_release_handle_nullable'));
final _sdkVenueDataPropertyPropertytypeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_Property_PropertyType_get_value_nullable'));

Pointer<Void> sdkVenueDataPropertyPropertytypeToFfiNullable(PropertyPropertyType? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkVenueDataPropertyPropertytypeToFfi(value);
  final result = _sdkVenueDataPropertyPropertytypeCreateHandleNullable(_handle);
  sdkVenueDataPropertyPropertytypeReleaseFfiHandle(_handle);
  return result;
}

PropertyPropertyType? sdkVenueDataPropertyPropertytypeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkVenueDataPropertyPropertytypeGetValueNullable(handle);
  final result = sdkVenueDataPropertyPropertytypeFromFfi(_handle);
  sdkVenueDataPropertyPropertytypeReleaseFfiHandle(_handle);
  return result;
}

void sdkVenueDataPropertyPropertytypeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataPropertyPropertytypeReleaseHandleNullable(handle);

// End of PropertyPropertyType "private" section.

// Property "private" section, not exported.

final _sdkVenueDataPropertyRegisterFinalizer = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>, Int32, Handle),
    void Function(Pointer<Void>, int, Object)
  >('here_sdk_sdk_venue_data_Property_register_finalizer'));
final _sdkVenueDataPropertyCopyHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_Property_copy_handle'));
final _sdkVenueDataPropertyReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_venue_data_Property_release_handle'));






/// @nodoc
@visibleForTesting
class Property$Impl extends __lib.NativeBase implements Property {

  Property$Impl(Pointer<Void> handle) : super(handle);


  Property internalwithBoolean(bool value) {
    final _result_handle = _withBoolean(value);
    final _result = Property$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkVenueDataPropertyRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  Property internalwithInt(int value) {
    final _result_handle = _withInt(value);
    final _result = Property$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkVenueDataPropertyRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }


  Property internalwithString(String value) {
    final _result_handle = _withString(value);
    final _result = Property$Impl(_result_handle);

    __lib.cacheInstance(_result_handle, _result);

    _sdkVenueDataPropertyRegisterFinalizer(_result_handle, __lib.LibraryContext.isolateId, _result);
    return _result;
  }

  @override
  String toString_() {
    final _toString_Ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_Property_toString'));
    final _handle = this.handle;
    final __resultHandle = _toString_Ffi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }

  static Pointer<Void> _withBoolean(bool value) {
    final _withBooleanFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Uint8), Pointer<Void> Function(int, int)>('here_sdk_sdk_venue_data_Property_fromBool__Boolean'));
    final _valueHandle = booleanToFfi(value);
    final __resultHandle = _withBooleanFfi(__lib.LibraryContext.isolateId, _valueHandle);
    booleanReleaseFfiHandle(_valueHandle);
    return __resultHandle;
  }

  static Pointer<Void> _withInt(int value) {
    final _withIntFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Int32), Pointer<Void> Function(int, int)>('here_sdk_sdk_venue_data_Property_fromInt__Int'));
    final _valueHandle = (value);
    final __resultHandle = _withIntFfi(__lib.LibraryContext.isolateId, _valueHandle);

    return __resultHandle;
  }

  static Pointer<Void> _withString(String value) {
    final _withStringFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_venue_data_Property_fromString__String'));
    final _valueHandle = stringToFfi(value);
    final __resultHandle = _withStringFfi(__lib.LibraryContext.isolateId, _valueHandle);
    stringReleaseFfiHandle(_valueHandle);
    return __resultHandle;
  }

  @override
  PropertyPropertyType get type {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_Property_type_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return sdkVenueDataPropertyPropertytypeFromFfi(__resultHandle);
    } finally {
      sdkVenueDataPropertyPropertytypeReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  bool get asBool {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Uint8 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_Property_isBool_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return booleanFromFfi(__resultHandle);
    } finally {
      booleanReleaseFfiHandle(__resultHandle);

    }

  }


  @override
  int get asInt {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Int32 Function(Pointer<Void>, Int32), int Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_Property_int_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return (__resultHandle);
    } finally {


    }

  }


  @override
  String get asString {
    final _getFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Pointer<Void>, Int32), Pointer<Void> Function(Pointer<Void>, int)>('here_sdk_sdk_venue_data_Property_string_get'));
    final _handle = this.handle;
    final __resultHandle = _getFfi(_handle, __lib.LibraryContext.isolateId);
    try {
      return stringFromFfi(__resultHandle);
    } finally {
      stringReleaseFfiHandle(__resultHandle);

    }

  }



}

Pointer<Void> sdkVenueDataPropertyToFfi(Property value) =>
  _sdkVenueDataPropertyCopyHandle((value as __lib.NativeBase).handle);

Property sdkVenueDataPropertyFromFfi(Pointer<Void> handle) {
  final instance = __lib.getCachedInstance(handle);
  if (instance != null && instance is Property) return instance;

  final _copiedHandle = _sdkVenueDataPropertyCopyHandle(handle);
  final result = Property$Impl(_copiedHandle);
  __lib.cacheInstance(_copiedHandle, result);
  _sdkVenueDataPropertyRegisterFinalizer(_copiedHandle, __lib.LibraryContext.isolateId, result);
  return result;
}

void sdkVenueDataPropertyReleaseFfiHandle(Pointer<Void> handle) =>
  _sdkVenueDataPropertyReleaseHandle(handle);

Pointer<Void> sdkVenueDataPropertyToFfiNullable(Property? value) =>
  value != null ? sdkVenueDataPropertyToFfi(value) : Pointer<Void>.fromAddress(0);

Property? sdkVenueDataPropertyFromFfiNullable(Pointer<Void> handle) =>
  handle.address != 0 ? sdkVenueDataPropertyFromFfi(handle) : null;

void sdkVenueDataPropertyReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkVenueDataPropertyReleaseHandle(handle);

// End of Property "private" section.


