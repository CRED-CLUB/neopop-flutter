// Copyright 2022 Dreamplug Technologies Private Limited
//
// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License in the LICENSE file or at
// http://www.apache.org/licenses/LICENSE-2.0

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:neopop/utils/color_utils.dart';
import 'package:neopop/utils/constants.dart';

part 'neopop_tilted_button_painter.dart';
part 'neopop_tilted_button_clipper.dart';
part 'neopop_tilted_button_shadow_painter.dart';
part 'neopop_tilted_button_decoration.dart';
part 'shimmer/neopop_tilted_button_shimmer.dart';
part 'shimmer/neopop_tilted_button_shimmer_painter.dart';

/// A neopop design tilted button.
///
/// A [NeoPopTiltedButton] is a custom painted button with a shadow and a plunk.
/// [NeoPopTiltedButtonDecoration] is used to paint the button. The shimmer layer
/// forms the top layer of the button. The [color] layer is painted below it
/// along with `border`. The shadow is painted at the last.
///
/// ![](https://d2tecn3vwkchpd.cloudfront.net/fabrik/patterns/neopop_tilted_button)
///
/// * If [showShimmer] is set to `true`, the shimmer layer is painted.
/// * If [onTapUp] is null or [enabled] is set to false, the button will be disabled.
/// * If [color] is provided, default decoration with this color will be used to paint the button.
///
/// {@tool snippet}
///
/// The following sample code shows a basic [NeoPopTiltedButton]:
///
/// ```dart
/// NeoPopTiltedButton(
///   decoration: NeoPopTiltedButtonDecoration(
///     color: Colors.white,
///     plunkColor: Colors.grey,
///   ),
///   child: Padding(
///     padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 45),
///     child: Text('CRED'),
///   ),
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
/// * [NeoPopTiltedButtonDecoration], decoration for the neopop tilted button.
class NeoPopTiltedButton extends StatefulWidget {
  /// Create a neopop tilted button.
  ///
  /// By default the button is enabled and non-floating. If `onTapUp` is null,
  /// the button will be in disabled state.
  ///
  /// ![](https://d2tecn3vwkchpd.cloudfront.net/fabrik/patterns/neopop_tilted_button)
  ///
  /// The `color` and `decoration` arguments cannot both be supplied, since
  /// it would potentially result in the decoration drawing over the background
  /// color. To supply a decoration with a color, use `decoration:
  /// NeoPopTiltedButtonDecoration(color: color)`.
  /// If `color` is provided then a default `decoration` with that color is applied
  /// to the button.
  const NeoPopTiltedButton({
    Key? key,
    required this.child,
    this.isFloating = false,
    this.enabled = true,
    this.color,
    this.decoration,
    this.shadowDistance,
    this.buttonDepth,
    this.tapDuration,
    this.floatingDuration,
    this.floatingDelay,
    this.yPosFactor,
    this.onTapUp,
    this.onTapDown,
  })  : assert(
          color == null || decoration == null,
          'Cannot provide both a color and a decoration\n'
          'To provide both, use "decoration: NeoPopTiltedButtonDecoration(color: color)".',
        ),
        super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  /// The decoration to paint the button.
  ///
  /// Use the [color] property to specify the button's color.
  /// By default shimmer is not painted. To paint shimmer, set [showShimmer]
  final NeoPopTiltedButtonDecoration? decoration;

  /// Color of the button
  final Color? color;

  /// The maximum distance from the button at which the
  /// shadow is painted.
  ///
  /// Defaults to [kTiltedButtonShadowDistance]
  final double? shadowDistance;

  /// Factor that defines the floating positions of buttons and
  /// shadow along vertical-axis.
  ///
  /// The [shadowDistance] is divided into [yPosFactor] parts. During
  /// floating, the button floats over the first segment of these parts, while
  /// the shadow floats over the last segment.
  ///
  /// Defaults to [kTiltedButtonYPosFactor]
  final double? yPosFactor;

  /// The depth of the tilted button
  ///
  /// Defaults to [kTiltedButtonDepth]
  final double? buttonDepth;

  /// Is the button floating
  ///
  /// For floating button shadow is shown along with the
  /// shimmer.
  ///
  /// Defaults to `false`
  final bool isFloating;

  /// The duration of the animation when button is pressed or released
  ///
  /// Defaults to [kTiltedButtonTapDuration]
  final Duration? tapDuration;

  /// The duration of the floating animation. One floating cycle i.e to-and-fro
  /// movement of the button and shadow accounts for two floating durations.
  ///
  /// Defaults to [kTiltedButtonFloatingDuration]
  final Duration? floatingDuration;

  /// The delay between two floating cycles.
  ///
  /// Defaults to [kTiltedButtonFloatingDelay]
  final Duration? floatingDelay;

  /// Whether the button is enabled
  final bool enabled;

  /// A pointer that might cause a tap with a neopop button has contacted the
  /// screen at a particular location.
  ///
  /// This is called after a short timeout, even if the winning gesture has not
  /// yet been selected. If the tap gesture wins, [onTapUp] will be called.
  final VoidCallback? onTapDown;

  /// A pointer that will trigger a tap with a neopop button has stopped
  /// contacting the screen at a particular location.
  ///
  /// This is called after [onTapDown] is called.
  ///
  /// If [onTapUp] is null, the button will be disabled.
  final VoidCallback? onTapUp;

  @override
  State<NeoPopTiltedButton> createState() => _NeoPopTiltedButtonState();
}

class _NeoPopTiltedButtonState extends State<NeoPopTiltedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation animation;
  late double posFactor;
  late NeoPopTiltedButtonDecoration decoration;

  @override
  void initState() {
    posFactor = widget.yPosFactor ?? kTiltedButtonYPosFactor;
    decoration = widget.decoration ??
        (widget.color != null
            ? NeoPopTiltedButtonDecoration(
                color: widget.color ?? Colors.transparent,
              )
            : const NeoPopTiltedButtonDecoration());
    controller = AnimationController(
      vsync: this,
      duration: widget.isFloating
          ? (widget.floatingDuration ?? kTiltedButtonFloatingDuration)
          : (widget.tapDuration ?? kTiltedButtonTapDuration),
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutSine,
    );

    bool enabled = widget.enabled || widget.onTapUp != null;
    if (enabled && widget.isFloating) startFloating();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // build basic button with shimmer
    Widget button = widget.child;
    bool enabled = widget.enabled && widget.onTapUp != null;

    if (enabled && decoration.showShimmer) {
      button = NeoPopTiltedButtonShimmer(
        buttonDepth: widget.buttonDepth,
        shimmerWidth: decoration.shimmerWidth,
        color: decoration.shimmerColor,
        plunkColor: decoration.shimmerPlunkColor,
        delay: decoration.shimmerDelay,
        duration: decoration.shimmerDuration,
        child: button,
      );
    }

    // draw color and plunk layer
    button = CustomPaint(
      isComplex: true,
      painter: NeoPopTiltedButtonPainter(
        color: enabled ? decoration.color : decoration.disabledColor,
        depth: widget.buttonDepth ?? kTiltedButtonDepth,
        plunkAngle: kTiltedButtonPlunkAngle,
        tiltAngle: kTiltedButtonAngle,
        buttonBorder: decoration.border,
        plunkColor:
            enabled ? decoration.plunkColor : decoration.disabledPlunkColor,
      ),
      child: button,
    );

    // add button clipper
    button = ClipPath(
      clipper: NeoPopTiltedButtonClipper(
        depth: widget.buttonDepth ?? kTiltedButtonDepth,
        plunkAngle: kTiltedButtonPlunkAngle,
        tiltAngle: kTiltedButtonAngle,
      ),
      child: button,
    );

    // if disabled then return the button
    if (!enabled) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: widget.buttonDepth ?? kTiltedButtonDepth,
        ),
        child: button,
      );
    }

    // add gesture detector
    bool floating = widget.isFloating;
    button = GestureDetector(
      onTapDown: (_) {
        if (floating) {
          floatingOnTapDown();
        } else {
          controller.forward();
        }

        widget.onTapDown?.call();
      },
      onTapUp: (_) async {
        if (floating) {
          await floatingOnTapUp();
        } else {
          if (!controller.isCompleted) await controller.forward();
          await controller.reverse();
        }

        widget.onTapUp?.call();
      },
      onTapCancel: () async {
        if (floating) {
          floatingOnTapCancel();
        } else {
          controller.reverse();
        }
      },
      child: button,
    );

    // if foating then wrap with shadow painter else wrap it with
    // non-floating clipper
    if (floating) {
      button = Padding(
        padding: EdgeInsets.only(
          bottom: widget.shadowDistance ?? kTiltedButtonShadowDistance,
        ),
        child: CustomPaint(
          isComplex: true,
          painter: NeoPopTiltedBtnShadowPainter(
            color: decoration.shadowColor,
            tiltAngle: kTiltedButtonAngle,
            yOffset: animation,
            posFactor: posFactor,
            shadowDistance: widget.shadowDistance,
          ),
          child: AnimatedBuilder(
            animation: controller,
            builder: (_, child) {
              final shadowDistance =
                  widget.shadowDistance ?? kTiltedButtonShadowDistance;
              final yPos = animation.value * (shadowDistance / posFactor);
              return Transform.translate(
                offset: Offset(0, yPos),
                child: child,
              );
            },
            child: button,
          ),
        ),
      );
    } else {
      final depth = widget.buttonDepth ?? kTiltedButtonDepth;
      button = ClipPath(
        child: AnimatedBuilder(
          animation: animation,
          builder: (_, child) {
            return Transform.translate(
              offset: Offset(0, animation.value * depth),
              child: child,
            );
          },
          child: Padding(
            padding: EdgeInsets.only(bottom: depth),
            child: button,
          ),
        ),
      );
    }

    if (decoration.showShimmer || widget.isFloating) {
      button = RepaintBoundary(child: button);
    }

    // return final tilted button
    return button;
  }

  Future<void> floatingOnTapUp() async {
    if (!controller.isCompleted) await continueDown();
    await moveUp();
    posFactor = widget.yPosFactor ?? kTiltedButtonYPosFactor;
    startFloating();
  }

  void floatingOnTapDown() {
    posFactor = 2;
    controller.removeStatusListener(floatingStatusListener);
    moveDown();
  }

  Future<void> floatingOnTapCancel() async {
    await moveUp();
    posFactor = widget.yPosFactor ?? kTiltedButtonYPosFactor;
    startFloating();
  }

  void floatingStatusListener(status) async {
    if (status == AnimationStatus.completed) {
      if (mounted) controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      await Future.delayed(widget.floatingDelay ?? kTiltedButtonFloatingDelay);
      if (mounted) controller.forward();
    }
  }

  void startFloating() {
    controller.addStatusListener(floatingStatusListener);
    controller.forward();
  }

  Future<void> moveDown() {
    return controller.animateTo(
      controller.upperBound,
      duration: widget.tapDuration ?? kTiltedButtonTapDuration,
    );
  }

  Future<void> moveUp() {
    return controller.animateTo(
      controller.lowerBound,
      duration: widget.tapDuration ?? kTiltedButtonTapDuration,
    );
  }

  Future<void> continueDown() {
    final tapDur = widget.tapDuration ?? kTiltedButtonTapDuration;
    final pendingDurMilliSec = tapDur.inMilliseconds * (1 - controller.value);
    final duration = Duration(milliseconds: pendingDurMilliSec.toInt());
    return controller.animateTo(controller.upperBound, duration: duration);
  }
}
