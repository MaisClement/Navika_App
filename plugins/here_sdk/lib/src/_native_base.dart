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
import 'package:meta/meta.dart';

/// For internal use only.
/// @nodoc
class NativeBase {
  /// For internal use only.
  /// @nodoc
  Pointer<Void> handle = Pointer<Void>.fromAddress(0);

  /// For internal use only.
  /// @nodoc
  @protected
  NativeBase(this.handle);
}
