/// Copyright 2022 Dreamplug Technologies Private Limited
///
/// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License in the LICENSE file or at
/// http://www.apache.org/licenses/LICENSE-2.0

part of 'neopop_button.dart';

abstract class NeoPopButtonParent {
  Color getLeftColor();
  Color getRightColor();
  Color getTopColor();
  Color getBottomColor();
  CustomClipper<Path> getClipper();
}

/// Possible positions of the [NeoPopButton] in the layout.
///
/// You can imagine nine of the twelve positions as being
/// the nine boxes of a tic-tac-toe game. The other three positions cover
/// the cases when the [NeoPopButton] covers or appears to cover full width of the
/// layout.
enum Position {
  /// BottomRight
  bottomRight,

  /// BottomCenter
  bottomCenter,

  /// BottomLeft
  bottomLeft,

  /// TopRight
  topRight,

  /// TopCenter
  topCenter,

  /// TopLeft
  topLeft,

  /// Center
  center,

  /// Center Left
  centerLeft,

  /// Center Rigth
  centerRight,

  /// Full top
  fullTop,

  /// Full center
  fullCenter,

  /// Full bottom
  fullBottom,
}
