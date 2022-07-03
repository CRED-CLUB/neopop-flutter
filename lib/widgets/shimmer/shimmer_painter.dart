// Copyright 2022 Dreamplug Technologies Private Limited
//
// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License in the LICENSE file or at
// http://www.apache.org/licenses/LICENSE-2.0

import 'package:flutter/material.dart';

/// CustomPainter that paints the shimmer lines
class ShimmerPainter extends CustomPainter {
  ShimmerPainter({
    required this.offset,
    required this.shimmerWidth,
    required this.shimmerColor,
    required this.isTiltedLeft,
    this.shimmerGapWidth = 5.0,
  });

  /// The offset of the shimmer lines.
  double offset;

  /// The width of the shimmer lines.
  final double shimmerWidth;

  /// The space b/w the shimmer lines.
  final double shimmerGapWidth;

  /// The color of the shimmer lines.
  final Color shimmerColor;

  /// Whether the lines are tilted to left or right.
  final bool isTiltedLeft;

  @override
  void paint(Canvas canvas, Size size) {
    final smallShimmerWidth = shimmerWidth / 2;
    final double x = (size.width +
            (2 * shimmerWidth) +
            shimmerGapWidth +
            smallShimmerWidth) *
        offset;
    final double y = size.height;

    if (!isTiltedLeft) {
      final x1 = x - smallShimmerWidth - shimmerGapWidth - (2 * shimmerWidth);
      final x2 = x1 + shimmerWidth;
      final x3 = x2 + shimmerWidth;
      final x4 = x2;

      final x5 = x4 + shimmerGapWidth;
      final x6 = x3 + shimmerGapWidth;
      final x7 = x6 + smallShimmerWidth;
      final x8 = x5 + smallShimmerWidth;

      canvas.drawPath(
        Path()
          ..moveTo(x1, y)
          ..lineTo(x2, 0)
          ..lineTo(x3, 0)
          ..lineTo(x4, y)
          ..close(),
        Paint()..color = shimmerColor,
      );

      canvas.drawPath(
        Path()
          ..moveTo(x5, y)
          ..lineTo(x6, 0)
          ..lineTo(x7, 0)
          ..lineTo(x8, y)
          ..close(),
        Paint()..color = shimmerColor,
      );
    } else {
      final x8 = x;
      final x7 = x8 - shimmerWidth;
      final x6 = x7 - shimmerWidth;
      final x5 = x7;

      final x4 = x5 - shimmerGapWidth;
      final x3 = x6 - shimmerGapWidth;
      final x2 = x3 - smallShimmerWidth;
      final x1 = x4 - smallShimmerWidth;

      canvas.drawPath(
        Path()
          ..moveTo(x1, y)
          ..lineTo(x2, 0)
          ..lineTo(x3, 0)
          ..lineTo(x4, y)
          ..close(),
        Paint()..color = shimmerColor,
      );

      canvas.drawPath(
        Path()
          ..moveTo(x5, y)
          ..lineTo(x6, 0)
          ..lineTo(x7, 0)
          ..lineTo(x8, y)
          ..close(),
        Paint()..color = shimmerColor,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
