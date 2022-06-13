/// Copyright 2022 Dreamplug Technologies Private Limited
///
/// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License in the LICENSE file or at
/// http://www.apache.org/licenses/LICENSE-2.0

part of 'neopop_button.dart';

/// A widget with [GestureDetector] that forms the basis of the [NeoPopButton].
class NeoPopButtonTranslator extends StatefulWidget {
  const NeoPopButtonTranslator({
    required this.child,
    required this.depth,
    required this.animationDuration,
    required this.onTapUp,
    this.onTapDown,
    this.onLongPress,
    this.forwardDuration,
    this.reverseDuration,
    Key? key,
  }) : super(key: key);

  /// The child widget.
  final Widget child;

  /// The depth of the button.
  final double depth;

  /// The duration of the animation in milliseconds.
  final int animationDuration;

  /// The duration of the forward animation.
  final Duration? forwardDuration;

  /// The duration of the reverse animation.
  final Duration? reverseDuration;

  final VoidCallback onTapUp;
  final VoidCallback? onTapDown;
  final VoidCallback? onLongPress;

  @override
  State<NeoPopButtonTranslator> createState() => _NeoPopButtonTranslatorState();
}

class _NeoPopButtonTranslatorState extends State<NeoPopButtonTranslator>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
      duration: widget.forwardDuration ??
          Duration(milliseconds: widget.animationDuration ~/ 2),
      reverseDuration: widget.reverseDuration ??
          Duration(milliseconds: widget.animationDuration ~/ 2),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        widget.onTapDown?.call();
        controller.forward();
      },
      onTapUp: (_) {
        if (controller.isCompleted) {
          controller.reverse().whenComplete(() => widget.onTapUp());
        } else {
          controller.forward().whenComplete(
                () => controller.reverse().whenComplete(() => widget.onTapUp()),
              );
        }
      },
      onTapCancel: () => controller.reverse(),
      onLongPress: widget.onLongPress == null
          ? null
          : () {
              widget.onLongPress?.call();
              controller.forward();
            },
      onLongPressEnd: widget.onLongPress == null
          ? null
          : (_) {
              if (controller.isCompleted) {
                controller.reverse();
              } else {
                controller.forward().whenComplete(() => controller.reverse());
              }
            },
      child: AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          final double depth = widget.depth * controller.value;
          return Transform.translate(
            offset: Offset(depth, depth),
            child: widget.child,
          );
        },
      ),
    );
  }
}
