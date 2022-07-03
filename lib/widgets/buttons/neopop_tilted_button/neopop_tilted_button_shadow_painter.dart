// Copyright 2022 Dreamplug Technologies Private Limited
//
// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License in the LICENSE file or at
// http://www.apache.org/licenses/LICENSE-2.0

part of 'neopop_tilted_button.dart';

/// A custom painter to paint the shadow of the floating [NeoPopTiltedButton].
class NeoPopTiltedBtnShadowPainter extends CustomPainter {
  const NeoPopTiltedBtnShadowPainter({
    required this.color,
    required this.tiltAngle,
    this.yOffset,
    this.posFactor,
    this.shadowDistance,
  }) : super(repaint: yOffset);

  final Color color;
  final double tiltAngle;
  final Animation<double>? yOffset;
  final double? posFactor;
  final double? shadowDistance;

  @override
  void paint(Canvas canvas, Size size) {
    /// tangent of the tilt angle
    final tanTheta = math.tan(tiltAngle);
    final width = size.width;
    final height = size.height;
    final posOffset = yOffset != null
        ? Offset(
            0,
            (1 - (yOffset?.value ?? 0) / (posFactor ?? 1)) *
                (shadowDistance ?? kTiltedButtonShadowDistance))
        : Offset.zero;
    const shadowPadding = kTiltedButtonShadowPadding;

    // Corner points of the button
    final a = Offset(shadowPadding + (height / tanTheta), 0);
    final b = Offset(width - (height / tanTheta) - shadowPadding, 0);
    final c = Offset(width - shadowPadding, height);
    final d = Offset(shadowPadding, height);

    final path = Path()
      ..addPolygon(
        [posOffset + a, posOffset + b, posOffset + c, posOffset + d],
        true,
      );
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
