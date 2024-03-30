// Copyright (c) 2019-2023 HERE Global B.V. and its affiliate(s).
// All rights reserved.
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



/// Represents a dash pattern for map polyline.
@immutable
class DashPattern {
  /// Length of first gap in pixels.
  final double firstGapLength;

  /// Length of first dash in pixels.
  final double firstDashLength;

  const DashPattern._(this.firstGapLength, this.firstDashLength);
  /// Creates a uniform dash pattern in which the length of a gap is the same
  /// as the length of a dash.
  ///
  /// This allows for patterns like ' — — — —' or '   ———   ———   ———'.
  ///
  /// [dashLength] The length of a dash in pixels. The gap will have the same length.
  /// Clamped to the range of \[1, 500\].
  ///
  factory DashPattern.uniform(double dashLength) => $prototype.uniform(dashLength);
  /// Creates a simple dash pattern in which the lengths of a dash and gap can be different.
  ///
  /// This allows for patterns like '  —  —  —  —' or ' ——— ——— ———'.
  ///
  /// [gapLength] The length of a gap in pixels. Clamped to the range of \[1, 500\].
  ///
  /// [dashLength] The length of a dash in pixels. Clamped to the range of \[1, 500\].
  ///
  factory DashPattern(double gapLength, double dashLength) => $prototype.$init(gapLength, dashLength);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! DashPattern) return false;
    DashPattern _other = other;
    return firstGapLength == _other.firstGapLength &&
        firstDashLength == _other.firstDashLength;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + firstGapLength.hashCode;
    result = 31 * result + firstDashLength.hashCode;
    return result;
  }

  /// @nodoc
  @visibleForTesting
  static dynamic $prototype = DashPattern$Impl();
}


// DashPattern "private" section, not exported.

final _sdkMapviewDashpatternCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double, Double),
    Pointer<Void> Function(double, double)
  >('here_sdk_sdk_mapview_DashPattern_create_handle'));
final _sdkMapviewDashpatternReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_DashPattern_release_handle'));
final _sdkMapviewDashpatternGetFieldfirstGapLength = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_DashPattern_get_field_firstGapLength'));
final _sdkMapviewDashpatternGetFieldfirstDashLength = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_DashPattern_get_field_firstDashLength'));



/// @nodoc
@visibleForTesting
class DashPattern$Impl {
  DashPattern uniform(double dashLength) {
    final _uniformFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double), Pointer<Void> Function(int, double)>('here_sdk_sdk_mapview_DashPattern_make__Double'));
    final _dashLengthHandle = (dashLength);
    final __resultHandle = _uniformFfi(__lib.LibraryContext.isolateId, _dashLengthHandle);

    try {
      return sdkMapviewDashpatternFromFfi(__resultHandle);
    } finally {
      sdkMapviewDashpatternReleaseFfiHandle(__resultHandle);

    }

  }

  DashPattern $init(double gapLength, double dashLength) {
    final _$initFfi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Double, Double), Pointer<Void> Function(int, double, double)>('here_sdk_sdk_mapview_DashPattern_make__Double_Double'));
    final _gapLengthHandle = (gapLength);
    final _dashLengthHandle = (dashLength);
    final __resultHandle = _$initFfi(__lib.LibraryContext.isolateId, _gapLengthHandle, _dashLengthHandle);


    try {
      return sdkMapviewDashpatternFromFfi(__resultHandle);
    } finally {
      sdkMapviewDashpatternReleaseFfiHandle(__resultHandle);

    }

  }

}

Pointer<Void> sdkMapviewDashpatternToFfi(DashPattern value) {
  final _firstGapLengthHandle = (value.firstGapLength);
  final _firstDashLengthHandle = (value.firstDashLength);
  final _result = _sdkMapviewDashpatternCreateHandle(_firstGapLengthHandle, _firstDashLengthHandle);
  
  
  return _result;
}

DashPattern sdkMapviewDashpatternFromFfi(Pointer<Void> handle) {
  final _firstGapLengthHandle = _sdkMapviewDashpatternGetFieldfirstGapLength(handle);
  final _firstDashLengthHandle = _sdkMapviewDashpatternGetFieldfirstDashLength(handle);
  try {
    return DashPattern._(
      (_firstGapLengthHandle), 
      (_firstDashLengthHandle)
    );
  } finally {
    
    
  }
}

void sdkMapviewDashpatternReleaseFfiHandle(Pointer<Void> handle) => _sdkMapviewDashpatternReleaseHandle(handle);

// Nullable DashPattern

final _sdkMapviewDashpatternCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_DashPattern_create_handle_nullable'));
final _sdkMapviewDashpatternReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_DashPattern_release_handle_nullable'));
final _sdkMapviewDashpatternGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_mapview_DashPattern_get_value_nullable'));

Pointer<Void> sdkMapviewDashpatternToFfiNullable(DashPattern? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkMapviewDashpatternToFfi(value);
  final result = _sdkMapviewDashpatternCreateHandleNullable(_handle);
  sdkMapviewDashpatternReleaseFfiHandle(_handle);
  return result;
}

DashPattern? sdkMapviewDashpatternFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkMapviewDashpatternGetValueNullable(handle);
  final result = sdkMapviewDashpatternFromFfi(_handle);
  sdkMapviewDashpatternReleaseFfiHandle(_handle);
  return result;
}

void sdkMapviewDashpatternReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkMapviewDashpatternReleaseHandleNullable(handle);

// End of DashPattern "private" section.


