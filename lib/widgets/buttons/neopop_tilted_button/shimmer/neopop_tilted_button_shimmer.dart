// Copyright 2022 Dreamplug Technologies Private Limited
//
// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License in the LICENSE file or at
// http://www.apache.org/licenses/LICENSE-2.0

part of '../neopop_tilted_button.dart';

/// Shimmer widget for the [NeoPopTiltedButton]
class NeoPopTiltedButtonShimmer extends StatefulWidget {
  const NeoPopTiltedButtonShimmer({
    Key? key,
    required this.child,
    this.duration,
    this.delay,
    this.color,
    this.plunkColor,
    this.shimmerWidth,
    this.buttonDepth,
    this.tiltAngle,
    this.plunkAngle,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  /// Duration of one shimmer cycle
  final Duration? duration;

  /// Delay between two shimmer cycles
  final Duration? delay;

  /// Color of the shimmer
  ///
  /// Defaults to [kTiltedButtonShimmerColor]
  final Color? color;

  /// Color of the shimmer over plunk
  ///
  /// If null, it defaults to [kTiltedButtonShimmerPlunkColor]
  final Color? plunkColor;

  /// Width of the shimmer
  ///
  /// Defaults to [kTiltedButtonShimmerWidth]
  final double? shimmerWidth;

  /// Depth of the tilted button
  ///
  /// Defaults to [kTiltedButtonDepth]
  final double? buttonDepth;

  /// Angle of the tilt of the button
  ///
  /// Defaults to [kTiltedButtonAngle]
  final double? tiltAngle;

  /// Angle at which the plunk of the button is tilted
  ///
  /// Defaults to [kTiltedButtonPlunkAngle]
  final double? plunkAngle;

  @override
  State<NeoPopTiltedButtonShimmer> createState() =>
      _NeoPopTiltedButtonShimmerState();
}

class _NeoPopTiltedButtonShimmerState extends State<NeoPopTiltedButtonShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    controller.forward();
    controller.addStatusListener(shimmerStatusListener);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NeoPopTiltedButtonShimmerPainter(
        tiltAngle: widget.tiltAngle ?? kTiltedButtonAngle,
        plunkAngle: widget.plunkAngle ?? kTiltedButtonPlunkAngle,
        depth: widget.buttonDepth ?? kTiltedButtonDepth,
        shimmerWidth: widget.shimmerWidth ?? kTiltedButtonShimmerWidth,
        color: widget.color ?? kTiltedButtonShimmerColor,
        plunkColor: widget.plunkColor ?? kTiltedButtonShimmerPlunkColor,
        ticker: controller,
      ),
      child: widget.child,
    );
  }

  void shimmerStatusListener(status) async {
    if (status == AnimationStatus.completed && mounted) {
      if (mounted) controller.reset();
      await Future.delayed(widget.delay ?? kTiltedButtonShimmerDelay);
      if (mounted) controller.forward();
    }
  }
}
