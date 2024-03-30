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
import 'package:collection/collection.dart';
import 'package:here_sdk/src/_library_context.dart' as __lib;
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/signpost_label.dart';

/// Signpost information.

class Signpost {
  /// List of signpost labels.
  List<SignpostLabel> labels;

  /// Creates a new instance.

  /// [labels] List of signpost labels.

  Signpost(this.labels);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Signpost) return false;
    Signpost _other = other;
    return DeepCollectionEquality().equals(labels, _other.labels);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + DeepCollectionEquality().hash(labels);
    return result;
  }
}


// Signpost "private" section, not exported.

final _sdkRoutingSignpostCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Signpost_create_handle'));
final _sdkRoutingSignpostReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Signpost_release_handle'));
final _sdkRoutingSignpostGetFieldlabels = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Signpost_get_field_labels'));



Pointer<Void> sdkRoutingSignpostToFfi(Signpost value) {
  final _labelsHandle = heresdkRoutingCommonBindingslistofSdkRoutingSignpostlabelToFfi(value.labels);
  final _result = _sdkRoutingSignpostCreateHandle(_labelsHandle);
  heresdkRoutingCommonBindingslistofSdkRoutingSignpostlabelReleaseFfiHandle(_labelsHandle);
  return _result;
}

Signpost sdkRoutingSignpostFromFfi(Pointer<Void> handle) {
  final _labelsHandle = _sdkRoutingSignpostGetFieldlabels(handle);
  try {
    return Signpost(
      heresdkRoutingCommonBindingslistofSdkRoutingSignpostlabelFromFfi(_labelsHandle)
    );
  } finally {
    heresdkRoutingCommonBindingslistofSdkRoutingSignpostlabelReleaseFfiHandle(_labelsHandle);
  }
}

void sdkRoutingSignpostReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingSignpostReleaseHandle(handle);

// Nullable Signpost

final _sdkRoutingSignpostCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Signpost_create_handle_nullable'));
final _sdkRoutingSignpostReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Signpost_release_handle_nullable'));
final _sdkRoutingSignpostGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Signpost_get_value_nullable'));

Pointer<Void> sdkRoutingSignpostToFfiNullable(Signpost? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingSignpostToFfi(value);
  final result = _sdkRoutingSignpostCreateHandleNullable(_handle);
  sdkRoutingSignpostReleaseFfiHandle(_handle);
  return result;
}

Signpost? sdkRoutingSignpostFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingSignpostGetValueNullable(handle);
  final result = sdkRoutingSignpostFromFfi(_handle);
  sdkRoutingSignpostReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingSignpostReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingSignpostReleaseHandleNullable(handle);

// End of Signpost "private" section.


