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
import 'package:here_sdk/src/sdk/core/localized_text.dart';
import 'package:here_sdk/src/sdk/routing/localized_road_number.dart';

/// Details of a signpost representing a particular direction or destination.

class SignpostLabel {
  /// Text of signpost label.
  /// Can be null for unnamed road.
  LocalizedText? localizedText;

  /// Road number.
  /// Can be null if the road has no number assigned.
  LocalizedRoadNumber? localizedRoadNumber;

  /// Creates a new instance.

  /// [localizedText] Text of signpost label.
  /// Can be null for unnamed road.

  /// [localizedRoadNumber] Road number.
  /// Can be null if the road has no number assigned.

  SignpostLabel._(this.localizedText, this.localizedRoadNumber);
  SignpostLabel()
    : localizedText = null, localizedRoadNumber = null;
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SignpostLabel) return false;
    SignpostLabel _other = other;
    return localizedText == _other.localizedText &&
        localizedRoadNumber == _other.localizedRoadNumber;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + localizedText.hashCode;
    result = 31 * result + localizedRoadNumber.hashCode;
    return result;
  }
}


// SignpostLabel "private" section, not exported.

final _sdkRoutingSignpostlabelCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_SignpostLabel_create_handle'));
final _sdkRoutingSignpostlabelReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SignpostLabel_release_handle'));
final _sdkRoutingSignpostlabelGetFieldlocalizedText = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SignpostLabel_get_field_localizedText'));
final _sdkRoutingSignpostlabelGetFieldlocalizedRoadNumber = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SignpostLabel_get_field_localizedRoadNumber'));



Pointer<Void> sdkRoutingSignpostlabelToFfi(SignpostLabel value) {
  final _localizedTextHandle = sdkCoreLocalizedtextToFfiNullable(value.localizedText);
  final _localizedRoadNumberHandle = sdkRoutingLocalizedroadnumberToFfiNullable(value.localizedRoadNumber);
  final _result = _sdkRoutingSignpostlabelCreateHandle(_localizedTextHandle, _localizedRoadNumberHandle);
  sdkCoreLocalizedtextReleaseFfiHandleNullable(_localizedTextHandle);
  sdkRoutingLocalizedroadnumberReleaseFfiHandleNullable(_localizedRoadNumberHandle);
  return _result;
}

SignpostLabel sdkRoutingSignpostlabelFromFfi(Pointer<Void> handle) {
  final _localizedTextHandle = _sdkRoutingSignpostlabelGetFieldlocalizedText(handle);
  final _localizedRoadNumberHandle = _sdkRoutingSignpostlabelGetFieldlocalizedRoadNumber(handle);
  try {
    return SignpostLabel._(
      sdkCoreLocalizedtextFromFfiNullable(_localizedTextHandle), 
      sdkRoutingLocalizedroadnumberFromFfiNullable(_localizedRoadNumberHandle)
    );
  } finally {
    sdkCoreLocalizedtextReleaseFfiHandleNullable(_localizedTextHandle);
    sdkRoutingLocalizedroadnumberReleaseFfiHandleNullable(_localizedRoadNumberHandle);
  }
}

void sdkRoutingSignpostlabelReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingSignpostlabelReleaseHandle(handle);

// Nullable SignpostLabel

final _sdkRoutingSignpostlabelCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SignpostLabel_create_handle_nullable'));
final _sdkRoutingSignpostlabelReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SignpostLabel_release_handle_nullable'));
final _sdkRoutingSignpostlabelGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SignpostLabel_get_value_nullable'));

Pointer<Void> sdkRoutingSignpostlabelToFfiNullable(SignpostLabel? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingSignpostlabelToFfi(value);
  final result = _sdkRoutingSignpostlabelCreateHandleNullable(_handle);
  sdkRoutingSignpostlabelReleaseFfiHandle(_handle);
  return result;
}

SignpostLabel? sdkRoutingSignpostlabelFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingSignpostlabelGetValueNullable(handle);
  final result = sdkRoutingSignpostlabelFromFfi(_handle);
  sdkRoutingSignpostlabelReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingSignpostlabelReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingSignpostlabelReleaseHandleNullable(handle);

// End of SignpostLabel "private" section.


