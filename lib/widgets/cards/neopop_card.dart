// Copyright 2022 Dreamplug Technologies Private Limited
//
// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License in the LICENSE file or at
// http://www.apache.org/licenses/LICENSE-2.0

import 'package:flutter/material.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';

part 'neopop_card_painter.dart';

/// [NeoPopCard] is a custom painted container with horizontal and vertical
/// edge shadows painted by [NeoPopCardPainter].
///
/// If [hShadowColor] and [vShadowColor] are not provided, then the
/// [NeoPopCardPainter] will use the [color] to derive the shadow color.
class NeoPopCard extends StatelessWidget {
  /// Create a NeoPop card.
  ///
  /// The [child] and [color] properties are required.
  const NeoPopCard({
    Key? key,
    required this.child,
    required this.color,
    this.depth,
    this.size,
    this.borderColor,
    this.hShadowColor,
    this.vShadowColor,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  /// The color of the card.
  ///
  /// The shadow color will be derived from this color if [hShadowColor] and
  /// [vShadowColor] are not provided.
  final Color color;

  /// The depth of the card
  final double? depth;

  /// The size of the card.
  ///
  /// If not provided, the card will be painted as per the child's size.
  final Size? size;

  /// The color of the border.
  final Color? borderColor;

  /// The color of the horizontal shadow of the card.
  final Color? hShadowColor;

  /// The color of the vertical shadow of the card.
  final Color? vShadowColor;

  @override
  Widget build(BuildContext context) {
    HSLColor? hShadow, vShadow;
    if (hShadowColor == null) hShadow = ColorUtils.getHorizontalShadow(color);
    if (vShadowColor == null) vShadow = ColorUtils.getVerticalShadow(color);

    return CustomPaint(
      painter: NeoPopCardPainter(
        hShadowColor: hShadowColor ?? hShadow?.toColor(),
        vShadowColor: vShadowColor ?? vShadow?.toColor(),
        depth: depth ?? kButtonDepth,
      ),
      size: size ?? Size.zero,
      willChange: false,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: borderColor != null
              ? Border(
                  left: BorderSide(color: borderColor!),
                  top: BorderSide(color: borderColor!),
                  bottom: BorderSide(color: borderColor!),
                  right: BorderSide(color: borderColor!),
                )
              : null,
        ),
        child: child,
      ),
    );
  }
}
