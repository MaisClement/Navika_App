// Copyright (c) 2018-2023 HERE Global B.V. and its affiliate(s).
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

/// An integer range with inclusive top and bottom value.

class IntegerRange {
  /// Minimum of the range.
  int min;

  /// Maximum of the range. If not set, maximum is unbounded.
  int? max;

  /// Creates a new instance.

  /// [min] Minimum of the range.

  /// [max] Maximum of the range. If not set, maximum is unbounded.

  IntegerRange._(this.min, this.max);
  IntegerRange(int min)
    : min = min, max = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! IntegerRange) return false;
    IntegerRange _other = other;
    return min == _other.min &&
        max == _other.max;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + min.hashCode;
    result = 31 * result + max.hashCode;
    return result;
  }
}


// IntegerRange "private" section, not exported.

final _sdkCoreIntegerrangeCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Int32, Pointer<Void>),
    Pointer<Void> Function(int, Pointer<Void>)
  >('here_sdk_sdk_core_IntegerRange_create_handle'));
final _sdkCoreIntegerrangeReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_IntegerRange_release_handle'));
final _sdkCoreIntegerrangeGetFieldmin = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_IntegerRange_get_field_min'));
final _sdkCoreIntegerrangeGetFieldmax = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_IntegerRange_get_field_max'));



Pointer<Void> sdkCoreIntegerrangeToFfi(IntegerRange value) {
  final _minHandle = (value.min);
  final _maxHandle = intToFfiNullable(value.max);
  final _result = _sdkCoreIntegerrangeCreateHandle(_minHandle, _maxHandle);
  
  intReleaseFfiHandleNullable(_maxHandle);
  return _result;
}

IntegerRange sdkCoreIntegerrangeFromFfi(Pointer<Void> handle) {
  final _minHandle = _sdkCoreIntegerrangeGetFieldmin(handle);
  final _maxHandle = _sdkCoreIntegerrangeGetFieldmax(handle);
  try {
    return IntegerRange._(
      (_minHandle), 
      intFromFfiNullable(_maxHandle)
    );
  } finally {
    
    intReleaseFfiHandleNullable(_maxHandle);
  }
}

void sdkCoreIntegerrangeReleaseFfiHandle(Pointer<Void> handle) => _sdkCoreIntegerrangeReleaseHandle(handle);

// Nullable IntegerRange

final _sdkCoreIntegerrangeCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_IntegerRange_create_handle_nullable'));
final _sdkCoreIntegerrangeReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_IntegerRange_release_handle_nullable'));
final _sdkCoreIntegerrangeGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_IntegerRange_get_value_nullable'));

Pointer<Void> sdkCoreIntegerrangeToFfiNullable(IntegerRange? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCoreIntegerrangeToFfi(value);
  final result = _sdkCoreIntegerrangeCreateHandleNullable(_handle);
  sdkCoreIntegerrangeReleaseFfiHandle(_handle);
  return result;
}

IntegerRange? sdkCoreIntegerrangeFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCoreIntegerrangeGetValueNullable(handle);
  final result = sdkCoreIntegerrangeFromFfi(_handle);
  sdkCoreIntegerrangeReleaseFfiHandle(_handle);
  return result;
}

void sdkCoreIntegerrangeReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCoreIntegerrangeReleaseHandleNullable(handle);

// End of IntegerRange "private" section.


