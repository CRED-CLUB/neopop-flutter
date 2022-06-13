/// Copyright 2022 Dreamplug Technologies Private Limited
///
/// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License in the LICENSE file or at
/// http://www.apache.org/licenses/LICENSE-2.0

import 'package:flutter/material.dart';

class ColorUtils {
  /// Get the horizontal shadow [HSLColor] from the given color. The
  /// shadow color depends on the lightness of the given color.
  static HSLColor getHorizontalShadow(Color color) {
    HSLColor hslColor = HSLColor.fromColor(color);
    if (hslColor.lightness >= 0.3) {
      return hslColor.withLightness(hslColor.lightness - 0.1);
    } else {
      return hslColor.withLightness(hslColor.lightness + 0.2);
    }
  }

  /// Get the vertical shadow [HSLColor] from the given color. The
  /// shadow color depends on the lightness of the given color.
  static HSLColor getVerticalShadow(Color color) {
    HSLColor hslColor = HSLColor.fromColor(color);
    if (hslColor.lightness >= 0.3) {
      return hslColor.withLightness(hslColor.lightness - 0.2);
    } else {
      return hslColor.withLightness(hslColor.lightness + 0.1);
    }
  }
}
