// Copyright 2022 Dreamplug Technologies Private Limited
//
// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License in the LICENSE file or at
// http://www.apache.org/licenses/LICENSE-2.0

part of 'neopop_tilted_button.dart';

/// A [Clipper] that clips the [NeoPopTiltedButton] at the corners to maintain the shape.
class NeoPopTiltedButtonClipper extends CustomClipper<Path> {
  const NeoPopTiltedButtonClipper({
    required this.depth,
    required this.tiltAngle,
    required this.plunkAngle,
  });

  final double depth;
  final double tiltAngle;
  final double plunkAngle;

  @override
  Path getClip(Size size) {
    /// tangent of the tilt angle
    final tanTheta = math.tan(tiltAngle);

    /// tangent of the (pi - shadow's tilt angle)
    final tanAlpha = math.tan(math.pi - plunkAngle);
    final height = size.height;
    final width = size.width;

    // Corner points of the button
    final a = Offset(height / tanTheta, 0);
    final b = Offset(width - (height / tanTheta), 0);
    final c = Offset(width, height);
    final d = Offset(0, height);
    final e = Offset((depth / tanAlpha).abs(), height + depth);
    final f = Offset(c.dx - (depth / tanAlpha).abs(), height + depth);

    final Path path = Path()..addPolygon([a, b, c, f, e, d], true);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
