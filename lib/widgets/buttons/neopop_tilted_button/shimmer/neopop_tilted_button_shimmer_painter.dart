/// Copyright 2022 Dreamplug Technologies Private Limited
///
/// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License in the LICENSE file or at
/// http://www.apache.org/licenses/LICENSE-2.0

part of '../neopop_tilted_button.dart';

/// A custom painter to paint the shimmer on the [NeoPopTiltedButton] along
/// with the shimmer on the plunk.
class NeoPopTiltedButtonShimmerPainter extends CustomPainter {
  const NeoPopTiltedButtonShimmerPainter({
    required this.tiltAngle,
    required this.plunkAngle,
    required this.depth,
    required this.shimmerWidth,
    required this.color,
    required this.ticker,
    required this.plunkColor,
  }) : super(repaint: ticker);

  /// Angle at which the shimmer is tilted.
  final double tiltAngle;

  /// Angle at which the plunk of the shimmer is tilted.
  final double plunkAngle;

  /// Width of the shimmer.
  final double shimmerWidth;

  /// Depth of the button
  final double depth;

  /// Color of the shimmer
  final Color color;

  /// Color of the shimmer over plunk
  final Color plunkColor;

  /// Ticker to animate the shimmer position and angle
  final Animation<double> ticker;

  @override
  void paint(Canvas canvas, Size size) {
    final smallShimmer = shimmerWidth / 2;
    const padding = 5.0;
    final width = size.width + padding + (2 * shimmerWidth);
    final perUnitTiltAngleChange = (math.pi - (2 * tiltAngle)) / size.width;
    final y = size.height;
    double x = width * ticker.value;

    /// dynamic tangent of the tilt angle
    final endTiltAngle = tiltAngle + (perUnitTiltAngleChange * width);
    final tanTheta =
        math.tan(tiltAngle + ((endTiltAngle - tiltAngle) * ticker.value));

    /// tangent of the (pi - shadow's tilt angle)
    final endPlunkAngle =
        plunkAngle + ((math.pi - (2 * plunkAngle)) * width / size.width);
    final tanAlpha =
        math.tan(plunkAngle + ((endPlunkAngle - plunkAngle) * ticker.value));

    final p = y / tanTheta;
    final q = depth / tanAlpha;

    final Path path = Path();
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // paint large shimmer
    canvas.drawPath(
      path
        ..addPolygon(
          [
            Offset(x, y),
            Offset(x + p, 0),
            Offset(x + p - shimmerWidth, 0),
            Offset(x - shimmerWidth, y),
          ],
          true,
        ),
      paint,
    );

    path.reset();
    paint.color = plunkColor;
    canvas.drawPath(
      path
        ..addPolygon(
          [
            Offset(x, y),
            Offset(x - shimmerWidth, y),
            Offset(x - shimmerWidth + q, y + depth),
            Offset(x + q, y + depth),
          ],
          true,
        ),
      paint,
    );

    // paint small shimmer
    x = x - shimmerWidth - padding;
    path.reset();
    paint.color = color;

    canvas.drawPath(
      path
        ..addPolygon(
          [
            Offset(x, y),
            Offset(x - smallShimmer, y),
            Offset(x - smallShimmer + p, 0),
            Offset(x + p, 0),
          ],
          true,
        ),
      paint,
    );

    path.reset();
    paint.color = plunkColor;
    canvas.drawPath(
      path
        ..addPolygon(
          [
            Offset(x, y),
            Offset(x - smallShimmer, y),
            Offset(x - smallShimmer + q, y + depth),
            Offset(x + q, y + depth),
          ],
          true,
        ),
      paint,
    );

    path.reset();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
