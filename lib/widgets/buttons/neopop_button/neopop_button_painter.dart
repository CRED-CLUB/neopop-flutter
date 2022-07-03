// Copyright 2022 Dreamplug Technologies Private Limited
//
// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License in the LICENSE file or at
// http://www.apache.org/licenses/LICENSE-2.0

part of 'neopop_button.dart';

/// [NeoPopButtonPainter] is a custom painter for [NeoPopButton]. It paints
/// the 3D faces of the button.
class NeoPopButtonPainter extends CustomPainter {
  const NeoPopButtonPainter(
    this.depth,
    this.top,
    this.left,
    this.bottom,
    this.right,
  );

  /// The depth of the button.
  final double depth;

  /// Color of the top depth area.
  final Color top;

  /// Color of the left depth area.
  final Color left;

  /// Color of the bottom depth area.
  final Color bottom;

  /// Color of the right depth area.
  final Color right;

  @override
  void paint(Canvas canvas, Size size) {
    // paint the right depth area
    if (right != Colors.transparent) {
      canvas.drawPath(
        Path()
          ..moveTo(size.width, 0)
          ..lineTo(size.width + depth, depth)
          ..lineTo(size.width + depth, size.height + depth)
          ..lineTo(size.width, size.height),
        Paint()
          ..style = PaintingStyle.fill
          ..color = right
          ..strokeWidth = 1,
      );
    }

    // paint the left depth area
    if (left != Colors.transparent) {
      canvas.drawPath(
        Path()
          ..moveTo(0, 0)
          ..lineTo(-depth, -depth)
          ..lineTo(-depth, size.height - depth)
          ..lineTo(0, size.height),
        Paint()
          ..style = PaintingStyle.fill
          ..color = left
          ..strokeWidth = 1,
      );
    }

    // paint the bottom depth area
    if (bottom != Colors.transparent) {
      canvas.drawPath(
        Path()
          ..moveTo(size.width, size.height)
          ..lineTo(size.width + depth, size.height + depth)
          ..lineTo(0 + depth, size.height + depth)
          ..lineTo(0, size.height),
        Paint()
          ..style = PaintingStyle.fill
          ..color = bottom
          ..strokeWidth = 1,
      );
    }

    // paint the top depth area
    if (top != Colors.transparent) {
      canvas.drawPath(
        Path()
          ..moveTo(0, 0)
          ..lineTo(-depth, -depth)
          ..lineTo(size.width - depth, -depth)
          ..lineTo(size.width, 0),
        Paint()
          ..style = PaintingStyle.fill
          ..color = top
          ..strokeWidth = 1,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
