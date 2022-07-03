// Copyright 2022 Dreamplug Technologies Private Limited
//
// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License in the LICENSE file or at
// http://www.apache.org/licenses/LICENSE-2.0

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neopop/utils/constants.dart';
import 'package:neopop/widgets/shimmer/shimmer_painter.dart';

/// A NeoPop style shimmer effect.
///
/// The shimmer is painted on the [child] widget. The [shimmerColor]
/// and [shimmerWidth] are used to paint the shimmer.
///
/// By default the shimmer is in enabled state.
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
    Key? key,
    required this.child,
    this.controller,
    this.duration = kShimmerDuration,
    this.enabled = true,
    this.isTiltedLeft = false,
    this.shimmerWidth = kShimmerWidth,
    this.shimmerGapWidth = kShimmerGapWidth,
    this.shimmerColor = kShimmerColor,
    this.delay = kShimmerDelay,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  /// Animation Controller for controlling the shimmer animation
  final AnimationController? controller;

  /// The shimmer is enabled or disabled.
  ///
  /// By default the shimmer is enabled.
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

  /// Space b/w the shimmer.
  ///
  /// This is the space b/w the two shimmer lines
  /// defaulting to 5.0
  final double shimmerGapWidth;

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
  Timer? _timer;
  late AnimationController _controller;
  @override
  void initState() {
    _controller = widget.controller ??
        AnimationController(vsync: this, duration: widget.duration);
    _controller.addStatusListener(_listener);
    if (widget.enabled) _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _timer = Timer(widget.delay, () {
        _controller.reset();
        _controller.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: AnimatedBuilder(
        animation: _controller,
        child: widget.child,
        builder: (context, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return CustomPaint(
                painter: ShimmerPainter(
                  offset: _controller.value,
                  isTiltedLeft: widget.isTiltedLeft,
                  shimmerWidth: widget.shimmerWidth,
                  shimmerColor: widget.shimmerColor,
                  shimmerGapWidth: widget.shimmerGapWidth,
                ),
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}
