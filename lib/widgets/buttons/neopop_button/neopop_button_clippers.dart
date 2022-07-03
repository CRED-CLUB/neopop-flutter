// Copyright 2022 Dreamplug Technologies Private Limited
//
// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License in the LICENSE file or at
// http://www.apache.org/licenses/LICENSE-2.0

part of 'neopop_button.dart';

/// [CustomClipper] for [NeoPopButton] in case of [Position.bottomCenter].
class RBottomCenterClipper extends CustomClipper<Path> {
  RBottomCenterClipper(this.depth);
  final double depth;
  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, 0)
    ..lineTo(0, size.height + depth)
    ..lineTo(size.width + depth, size.height + depth)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width, 0)
    ..close();

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

/// [CustomClipper] for [NeoPopButton] in case of [Position.bottomRight] and
/// [Position.fullBottom].
class RBottomRightClipper extends CustomClipper<Path> {
  RBottomRightClipper(this.depth);
  final double depth;
  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, 0)
    ..lineTo(0, size.height)
    ..lineTo(0 + depth, size.height + depth)
    ..lineTo(size.width + depth, size.height + depth)
    ..lineTo(size.width + depth, depth)
    ..lineTo(size.width, 0)
    ..close();

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

/// [CustomClipper] for [NeoPopButton] in case of [Position.bottomLeft].
class RBottomLeftClipper extends CustomClipper<Path> {
  RBottomLeftClipper(this.depth);
  final double depth;
  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, 0)
    ..lineTo(0, size.height)
    ..lineTo(0 + depth, size.height + depth)
    ..lineTo(size.width + depth, size.height + depth)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width, 0)
    ..close();

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

/// [CustomClipper] for [NeoPopButton] in case of [Position.topRight],
/// [Position.fullTop], [Position.fullCenter] and [Position.centerRight].
class RTopRightClipper extends CustomClipper<Path> {
  RTopRightClipper(this.depth);
  final double depth;

  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, 0)
    ..lineTo(0, size.height)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width + depth, size.height + depth)
    ..lineTo(size.width + depth, depth)
    ..lineTo(size.width, 0)
    ..close();

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}

/// [CustomClipper] for [NeoPopButton] in case of [Position.center],
/// [Position.centerLeft], [Position.topCenter] and [Position.topLeft].
class CenterClipper extends CustomClipper<Path> {
  CenterClipper(this.depth);
  final double depth;

  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, 0)
    ..lineTo(0, size.height)
    ..lineTo(size.width, size.height)
    ..lineTo(size.width, 0)
    ..close();

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
