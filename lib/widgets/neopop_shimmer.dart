/// Copyright 2022 Dreamplug Technologies Private Limited
///
/// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License in the LICENSE file or at
/// http://www.apache.org/licenses/LICENSE-2.0

import 'dart:async';

import 'package:flutter/material.dart';

/// A NeoPop style shimmer effect.
///
/// The shimmer is painted on the [child] widget. The [shimmerColor]
/// and [shimmerWidth] are used to paint the shimmer.
///
/// By default the shimmer is in disabled state.
///
/// To create a shimmer:
/// ```dart
/// final shimmerKey = GlobalKey<PopShimmerState>();
///
/// PopShimmer(
///   key: shimmerKey,
///   enabled: true,
///   child: child
/// ),
///```
/// * To start the shimmer:
/// `shimmerKey.currentState?.startShimmer();`
///
/// * To stop the shimmer
/// `shimmerKey.currentState?.stopShimmer();`
///
/// ```
class NeoPopShimmer extends StatefulWidget {
  /// Create NeoPop shimmer effect.
  ///
  /// The [child] is the widget over which the shimmer effect is painted.
  /// The [shimmerColor] and [shimmerWidth] are used to paint the shimmer.
  /// Shimmer consists of two lines. The width of the first line is
  /// [shimmerWidth] and the width of the second line is [shimmerWidth]/2.
  ///
  /// By default the animation duration of the shimmer is set to
  /// 3 seconds and the width is set to 10.0. The [delay] property
  /// can be used to set the delay between the two shimmer cycles.
  ///
  /// The tilt of the shimmer can be controlled by the [isTiltedLeft] property.
  /// By default the shimmer is tilted to the right.
  const NeoPopShimmer({
    required this.child,
    this.duration = const Duration(seconds: 3),
    this.enabled = false,
    this.isTiltedLeft = false,
    this.shimmerWidth = 10.0,
    this.shimmerColor = const Color.fromRGBO(255, 248, 229, 0.5),
    this.delay = const Duration(seconds: 2),
    Key? key,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  /// The shimmer is enabled or disabled.
  ///
  /// By default the shimmer is disabled.
  final bool enabled;

  /// The shimmer is tilted to the left or right.
  ///
  /// By default it is set to false
  final bool isTiltedLeft;

  /// Width of the shimmer.
  ///
  /// Shimmer consists of two lines. The width of the first line is
  /// [shimmerWidth] and the width of the second line is [shimmerWidth]/2.
  ///
  /// The default value is 10.0.
  final double shimmerWidth;

  /// The color of the shimmer.
  ///
  /// The default value is [Color.fromRGBO(255, 248, 229, 0.5)].
  final Color shimmerColor;

  /// Duration for the shimmer effect
  final Duration duration;

  /// Delay after one shimmer cycle is completed.
  final Duration delay;

  @override
  NeoPopShimmerState createState() => NeoPopShimmerState();
}

class NeoPopShimmerState extends State<NeoPopShimmer>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Timer? _timer;

  @override
  void initState() {
    if (widget.enabled) {
      _controller = AnimationController(vsync: this, duration: widget.duration);
      _controller?.addStatusListener(_listener);
      startShimmer();
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _timer = Timer(widget.delay, () {
        _controller?.reset();
        _controller?.forward();
      });
    }
  }

  /// Start the shimmer animation.
  void startShimmer() {
    _controller?.forward();
  }

  /// Stop the shimmer animation.
  void stopShimmer() {
    _controller?.stop();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) {
      return widget.child;
    }
    if (_controller != null) {
      return AnimatedBuilder(
        animation: _controller!,
        child: widget.child,
        builder: (context, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return CustomPaint(
                painter: ShimmerPainter(
                  offset: _controller?.value ?? 0.0,
                  isTiltedLeft: widget.isTiltedLeft,
                  shimmerWidth: widget.shimmerWidth,
                  shimmerColor: widget.shimmerColor,
                ),
                child: child,
              );
            },
          );
        },
      );
    }
    return const SizedBox();
  }
}

/// CustomPainter that paints the shimmer lines
class ShimmerPainter extends CustomPainter {
  ShimmerPainter({
    required this.offset,
    required this.shimmerWidth,
    required this.shimmerColor,
    required this.isTiltedLeft,
  });

  /// The offset of the shimmer lines.
  double offset;

  /// The width of the shimmer lines.
  final double shimmerWidth;

  /// The color of the shimmer lines.
  final Color shimmerColor;

  /// Whether the lines are tilted to left or right.
  final bool isTiltedLeft;

  @override
  void paint(Canvas canvas, Size size) {
    final double x = size.width * offset;
    final double y = size.height;
    const spaceWidth = 5.0;
    final smallShimmerWidth = shimmerWidth / 2;

    if (!isTiltedLeft) {
      canvas.drawPath(
        Path()
          ..moveTo(x, y)
          ..lineTo(x + shimmerWidth, 0)
          ..lineTo(x + (2 * shimmerWidth), 0)
          ..lineTo(x + shimmerWidth, y)
          ..close(),
        Paint()..color = shimmerColor,
      );

      final x1 = x + shimmerWidth + spaceWidth;
      canvas.drawPath(
        Path()
          ..moveTo(x1, y)
          ..lineTo(x1 + (2 * smallShimmerWidth), 0)
          ..lineTo(x1 + (3 * smallShimmerWidth), 0)
          ..lineTo(x1 + smallShimmerWidth, y)
          ..close(),
        Paint()..color = shimmerColor,
      );
    } else {
      canvas.drawPath(
        Path()
          ..moveTo(x, 0)
          ..lineTo(x + (2 * smallShimmerWidth), y)
          ..lineTo(x + (3 * smallShimmerWidth), y)
          ..lineTo(x + smallShimmerWidth, 0)
          ..close(),
        Paint()..color = shimmerColor,
      );

      final x1 = x + smallShimmerWidth + spaceWidth;
      canvas.drawPath(
        Path()
          ..moveTo(x1, 0)
          ..lineTo(x1 + shimmerWidth, y)
          ..lineTo(x1 + (2 * shimmerWidth), y)
          ..lineTo(x1 + shimmerWidth, 0)
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
