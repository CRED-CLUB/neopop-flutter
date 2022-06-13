/// Copyright 2022 Dreamplug Technologies Private Limited
///
/// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License in the LICENSE file or at
/// http://www.apache.org/licenses/LICENSE-2.0

part of 'neopop_card.dart';

/// The painter for the NeoPop card.
///
/// [hShadow] and [vShadow] are the horizontal and vertical shadow colors
/// respectively.
class NeoPopCardPainter extends CustomPainter {
  final double depth;
  final Color? hShadowColor, vShadowColor;

  const NeoPopCardPainter({
    this.hShadowColor,
    this.vShadowColor,
    this.depth = 3.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // right shadow
    canvas
      ..drawPath(
        Path()
          ..moveTo(size.width, 0)
          ..lineTo(size.width + depth, depth)
          ..lineTo(size.width + depth, size.height + depth)
          ..lineTo(size.width, size.height),
        Paint()
          ..style = PaintingStyle.fill
          ..color = hShadowColor ?? Colors.transparent
          ..strokeWidth = 1,
      )

      // bottom shadow
      ..drawPath(
        Path()
          ..moveTo(size.width, size.height)
          ..lineTo(size.width + depth, size.height + depth)
          ..lineTo(0 + depth, size.height + depth)
          ..lineTo(0, size.height),
        Paint()
          ..style = PaintingStyle.fill
          ..color = vShadowColor ?? Colors.transparent
          ..strokeWidth = 1,
      );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
