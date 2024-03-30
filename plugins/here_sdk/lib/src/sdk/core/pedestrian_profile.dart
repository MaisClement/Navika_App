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

/// Contains values of pedestrian profile.
///
/// This is a BETA feature and thus there can be bugs and unexpected behavior.

class PedestrianProfile {
  /// Defines the walking speed in meters per second.
  /// By default this value is 1 meter per second.
  double walkingSpeedInMetersPerSecond;

  /// Creates a new instance.

  /// [walkingSpeedInMetersPerSecond] Defines the walking speed in meters per second.
  /// By default this value is 1 meter per second.

  PedestrianProfile._(this.walkingSpeedInMetersPerSecond);
  PedestrianProfile()
    : walkingSpeedInMetersPerSecond = 1.0;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PedestrianProfile) return false;
    PedestrianProfile _other = other;
    return walkingSpeedInMetersPerSecond == _other.walkingSpeedInMetersPerSecond;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + walkingSpeedInMetersPerSecond.hashCode;
    return result;
  }
}


// PedestrianProfile "private" section, not exported.

final _sdkCorePedestrianprofileCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Double),
    Pointer<Void> Function(double)
  >('here_sdk_sdk_core_PedestrianProfile_create_handle'));
final _sdkCorePedestrianprofileReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_PedestrianProfile_release_handle'));
final _sdkCorePedestrianprofileGetFieldwalkingSpeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_core_PedestrianProfile_get_field_walkingSpeedInMetersPerSecond'));



Pointer<Void> sdkCorePedestrianprofileToFfi(PedestrianProfile value) {
  final _walkingSpeedInMetersPerSecondHandle = (value.walkingSpeedInMetersPerSecond);
  final _result = _sdkCorePedestrianprofileCreateHandle(_walkingSpeedInMetersPerSecondHandle);
  
  return _result;
}

PedestrianProfile sdkCorePedestrianprofileFromFfi(Pointer<Void> handle) {
  final _walkingSpeedInMetersPerSecondHandle = _sdkCorePedestrianprofileGetFieldwalkingSpeedInMetersPerSecond(handle);
  try {
    return PedestrianProfile._(
      (_walkingSpeedInMetersPerSecondHandle)
    );
  } finally {
    
  }
}

void sdkCorePedestrianprofileReleaseFfiHandle(Pointer<Void> handle) => _sdkCorePedestrianprofileReleaseHandle(handle);

// Nullable PedestrianProfile

final _sdkCorePedestrianprofileCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_PedestrianProfile_create_handle_nullable'));
final _sdkCorePedestrianprofileReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_PedestrianProfile_release_handle_nullable'));
final _sdkCorePedestrianprofileGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_PedestrianProfile_get_value_nullable'));

Pointer<Void> sdkCorePedestrianprofileToFfiNullable(PedestrianProfile? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkCorePedestrianprofileToFfi(value);
  final result = _sdkCorePedestrianprofileCreateHandleNullable(_handle);
  sdkCorePedestrianprofileReleaseFfiHandle(_handle);
  return result;
}

PedestrianProfile? sdkCorePedestrianprofileFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkCorePedestrianprofileGetValueNullable(handle);
  final result = sdkCorePedestrianprofileFromFfi(_handle);
  sdkCorePedestrianprofileReleaseFfiHandle(_handle);
  return result;
}

void sdkCorePedestrianprofileReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkCorePedestrianprofileReleaseHandleNullable(handle);

// End of PedestrianProfile "private" section.


