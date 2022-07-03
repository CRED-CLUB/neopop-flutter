// Copyright 2022 Dreamplug Technologies Private Limited
//
// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License in the LICENSE file or at
// http://www.apache.org/licenses/LICENSE-2.0

part of 'neopop_tilted_button.dart';

/// A custom painter to paint the [NeoPopTiltedButton] along with the plunk and border.
class NeoPopTiltedButtonPainter extends CustomPainter {
  const NeoPopTiltedButtonPainter({
    required this.color,
    required this.depth,
    required this.tiltAngle,
    required this.plunkAngle,
    this.plunkColor,
    this.buttonBorder,
  });

  /// Depth of the button
  final double depth;

  /// Angle at which the edges of the button
  /// are tilted.
  ///
  /// The angle between the bottom and left/right edges is
  /// the [tiltAngle].
  ///
  /// Default is [kTiltedButtonAngle].
  final double tiltAngle;

  /// Angle at which the plunk of the button
  /// is tilted.
  ///
  /// Defaults to [kTiltedButtonPlunkAngle].
  final double plunkAngle;

  /// The color of the button.
  final Color color;

  /// The color of the shadow.
  ///
  /// If null, the shadow color will be derived from the [color].
  final Color? plunkColor;

  /// The border of the button.
  final Border? buttonBorder;

  @override
  void paint(Canvas canvas, Size size) {
    /// tangent of the tilt angle
    final tanTheta = math.tan(tiltAngle);

    /// tangent of the (pi - shadow's tilt angle)
    final tanAlpha = math.tan(math.pi - plunkAngle);

    /// sine of the tilt angle
    final sinTheta = math.sin(tiltAngle);
    final width = size.width;
    final height = size.height;

    // Corner points of the button
    final a = Offset(height / tanTheta, 0);
    final b = Offset(width - (height / tanTheta), 0);
    final c = Offset(width, height);
    final d = Offset(0, height);

    final Path buttonPath = Path()..addPolygon([a, b, c, d], true);
    final Path plunkPath = Path()
      ..addPolygon(
        [
          d,
          c,
          Offset(c.dx - (depth / tanAlpha).abs(), height + depth),
          Offset((depth / tanAlpha).abs(), height + depth),
        ],
        true,
      );

    final Paint buttonPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final Paint plunkPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = plunkColor ?? ColorUtils.getVerticalShadow(color).toColor();

    // canvas.drawPath(shadowPath, shadowPaint);
    canvas.drawPath(buttonPath, buttonPaint);
    canvas.drawPath(plunkPath, plunkPaint);

    if (buttonBorder != null) {
      final border = buttonBorder as Border;
      paintBorder(
        border: border,
        canvas: canvas,
        tanTheta: tanTheta,
        sinTheta: sinTheta,
        a: a,
        b: b,
        c: c,
        d: d,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  /// Paint the border of the [NeoPopTiltedButton]
  ///
  /// The border is painted as a polygon with the following points:
  /// a, b, c, d. Theta is the angle of the tilt of the button.
  void paintBorder({
    required Border border,
    required Canvas canvas,
    required Offset a,
    required Offset b,
    required Offset c,
    required Offset d,
    required double tanTheta,
    required double sinTheta,
  }) {
    final Path borderPath = Path();
    final Paint borderPaint = Paint()..strokeWidth = 0.0;

    switch (border.top.style) {
      case BorderStyle.solid:
        borderPaint.color = border.top.color;
        borderPath.reset();
        borderPath.moveTo(a.dx, a.dy);
        borderPath.lineTo(b.dx, b.dy);

        final borderWidth = border.top.width;
        if (borderWidth == 0) {
          borderPaint.style = PaintingStyle.stroke;
        } else {
          borderPaint.style = PaintingStyle.fill;
          borderPath.lineTo(
              b.dx - (borderWidth / tanTheta), b.dy + borderWidth);
          borderPath.lineTo(
              a.dx + (borderWidth / tanTheta), a.dy + borderWidth);
        }

        canvas.drawPath(borderPath, borderPaint);
        break;
      default:
        break;
    }

    switch (border.right.style) {
      case BorderStyle.solid:
        borderPaint.color = border.right.color;
        borderPath.reset();
        borderPath.moveTo(b.dx, b.dy);
        borderPath.lineTo(c.dx, c.dy);

        final borderWidth = border.right.width;
        if (borderWidth == 0) {
          borderPaint.style = PaintingStyle.stroke;
        } else {
          borderPaint.style = PaintingStyle.fill;
          borderPath.lineTo(c.dx - (borderWidth / sinTheta), c.dy);
          borderPath.lineTo(b.dx - (borderWidth / sinTheta), b.dy);
        }

        canvas.drawPath(borderPath, borderPaint);
        break;
      default:
        break;
    }

    switch (border.bottom.style) {
      case BorderStyle.solid:
        borderPaint.color = border.bottom.color;
        borderPath.reset();
        borderPath.moveTo(c.dx, c.dy);
        borderPath.lineTo(d.dx, d.dy);

        final borderWidth = border.bottom.width;
        if (borderWidth == 0) {
          borderPaint.style = PaintingStyle.stroke;
        } else {
          borderPaint.style = PaintingStyle.fill;
          borderPath.lineTo(
              d.dx + (borderWidth / tanTheta), d.dy - borderWidth);
          borderPath.lineTo(
              c.dx - (borderWidth / tanTheta), c.dy - borderWidth);
        }

        canvas.drawPath(borderPath, borderPaint);
        break;
      default:
        break;
    }

    switch (border.left.style) {
      case BorderStyle.solid:
        borderPaint.color = border.left.color;
        borderPath.reset();
        borderPath.moveTo(d.dx, d.dy);
        borderPath.lineTo(a.dx, a.dy);

        final borderWidth = border.left.width;
        if (borderWidth == 0) {
          borderPaint.style = PaintingStyle.stroke;
        } else {
          borderPaint.style = PaintingStyle.fill;
          borderPath.lineTo(a.dx + (borderWidth / sinTheta), a.dy);
          borderPath.lineTo(d.dx + (borderWidth / sinTheta), d.dy);
        }

        canvas.drawPath(borderPath, borderPaint);
        break;
      default:
        break;
    }
  }
}
