// Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
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

import 'dart:ui';
import 'color.dart';


class ColorConverter {
  static Color convertFromInternal(ColorInternal internalColor) =>
    Color.fromARGB(
      colorComponentFromDouble(internalColor.a),
      colorComponentFromDouble(internalColor.r),
      colorComponentFromDouble(internalColor.g),
      colorComponentFromDouble(internalColor.b));

  static ColorInternal convertToInternal(Color color) =>
    ColorInternal(
      colorComponentToDouble(color.red),
      colorComponentToDouble(color.green),
      colorComponentToDouble(color.blue),
      colorComponentToDouble(color.alpha));

  static double colorComponentToDouble(int colorComponent) {
      return (colorComponent.toDouble() / 255.0).clamp(0.0, 1.0);
  }

  static int colorComponentFromDouble(double colorComponent) {
    return (colorComponent * 255.0).round().toInt().clamp(0, 255);
  }
}