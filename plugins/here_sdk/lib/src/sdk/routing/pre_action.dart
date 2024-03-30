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
import 'package:here_sdk/src/sdk/routing/pre_action_type.dart';

/// An action that must be done prior to the section, i.e.
///
/// boarding a ferry.

class PreAction {
  /// Type of this action.
  /// Defaults to [PreActionType.board].
  PreActionType action;

  /// Estimated duration of this action.
  /// Defaults to 0 seconds.
  Duration duration;

  /// Creates a new instance.

  /// [action] Type of this action.
  /// Defaults to [PreActionType.board].

  /// [duration] Estimated duration of this action.
  /// Defaults to 0 seconds.

  PreAction._(this.action, this.duration);
  PreAction()
    : action = PreActionType.board, duration = const Duration(seconds: 0);
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PreAction) return false;
    PreAction _other = other;
    return action == _other.action &&
        duration == _other.duration;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + action.hashCode;
    result = 31 * result + duration.hashCode;
    return result;
  }
}


// PreAction "private" section, not exported.

final _sdkRoutingPreactionCreateHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32, Uint64),
    Pointer<Void> Function(int, int)
  >('here_sdk_sdk_routing_PreAction_create_handle'));
final _sdkRoutingPreactionReleaseHandle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PreAction_release_handle'));
final _sdkRoutingPreactionGetFieldaction = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PreAction_get_field_action'));
final _sdkRoutingPreactionGetFieldduration = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PreAction_get_field_duration'));



Pointer<Void> sdkRoutingPreactionToFfi(PreAction value) {
  final _actionHandle = sdkRoutingPreactiontypeToFfi(value.action);
  final _durationHandle = durationToFfi(value.duration);
  final _result = _sdkRoutingPreactionCreateHandle(_actionHandle, _durationHandle);
  sdkRoutingPreactiontypeReleaseFfiHandle(_actionHandle);
  durationReleaseFfiHandle(_durationHandle);
  return _result;
}

PreAction sdkRoutingPreactionFromFfi(Pointer<Void> handle) {
  final _actionHandle = _sdkRoutingPreactionGetFieldaction(handle);
  final _durationHandle = _sdkRoutingPreactionGetFieldduration(handle);
  try {
    return PreAction._(
      sdkRoutingPreactiontypeFromFfi(_actionHandle), 
      durationFromFfi(_durationHandle)
    );
  } finally {
    sdkRoutingPreactiontypeReleaseFfiHandle(_actionHandle);
    durationReleaseFfiHandle(_durationHandle);
  }
}

void sdkRoutingPreactionReleaseFfiHandle(Pointer<Void> handle) => _sdkRoutingPreactionReleaseHandle(handle);

// Nullable PreAction

final _sdkRoutingPreactionCreateHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PreAction_create_handle_nullable'));
final _sdkRoutingPreactionReleaseHandleNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PreAction_release_handle_nullable'));
final _sdkRoutingPreactionGetValueNullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PreAction_get_value_nullable'));

Pointer<Void> sdkRoutingPreactionToFfiNullable(PreAction? value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdkRoutingPreactionToFfi(value);
  final result = _sdkRoutingPreactionCreateHandleNullable(_handle);
  sdkRoutingPreactionReleaseFfiHandle(_handle);
  return result;
}

PreAction? sdkRoutingPreactionFromFfiNullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdkRoutingPreactionGetValueNullable(handle);
  final result = sdkRoutingPreactionFromFfi(_handle);
  sdkRoutingPreactionReleaseFfiHandle(_handle);
  return result;
}

void sdkRoutingPreactionReleaseFfiHandleNullable(Pointer<Void> handle) =>
  _sdkRoutingPreactionReleaseHandleNullable(handle);

// End of PreAction "private" section.


