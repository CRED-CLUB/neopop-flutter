/// Copyright 2022 Dreamplug Technologies Private Limited
///
/// Use of this source code is governed by the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License in the LICENSE file or at
/// http://www.apache.org/licenses/LICENSE-2.0

import 'package:flutter/material.dart';
import 'package:neopop/utils/color_utils.dart';

part 'neopop_button_utils.dart';
part 'neopop_button_clippers.dart';
part 'neopop_button_translator.dart';
part 'neopop_button_painter.dart';

/// A neopop design button.
///
/// Use this to implement neopop design button in your layouts. This can be used
/// on normal surfaces like cards, dialogs, etc as well as on [NeoPopCard].
///
/// A [NeoPopButton] is a custom painted container wrapped with a [ClipPath].
/// The painter and clipper depends on the position of the [NeoPopButton] in
/// the layout. The [NeoPopButton] can be positioned in one of the 12 positions defined
/// in the enum [Position]. You can imagine nine of the twelve positions as being
/// the nine boxes of a tic-tac-toe game. The other three positions cover
/// the cases when the [NeoPopButton] covers or appears to cover full width of the
/// layout.
///
/// If [onTapUp] is null or [enabled] is set to false, the button will be disabled.
///
/// See code in example for the sample.
///
/// See also:
///
/// * [NeoPopCard], a card styled in neopop design.
/// * [Position], the enum that defines the position of the [NeoPopButton].
class NeoPopButton extends StatefulWidget {
  /// Creates a neopop button.
  ///
  /// The [child] and [color] parameters are required. [color] is the
  /// color of the button. If the shadow colors are not specified,
  /// they will be derived from the [color] parameter.
  ///
  /// The [animationDuration] parameter specifies the duration of the
  /// animation when the button is pressed. Forward and reversed animation
  /// durations can be specified separately using the [forwardDuration]
  /// and [reversedDuration] parameters. By default, the animation duration
  /// is set to 50.0.
  ///
  /// The [onTapUp] parameter specifies the callback that is called when
  /// the button is tapped. The [onTapDown] parameter specifies the callback
  /// that is called when the pointer that might cause a tap with button
  /// touches the screen. The [onLongPress] parameter specifies the callback
  /// that is called when the button is long pressed.
  ///
  /// The [parentColor] and [grandparentColor] are the colors of the parent
  /// and grandparent widgets of the button. These are used to derive the
  /// edge and shadow colors. If the colors are not specified, they will be
  /// derived from the [color] parameter. You can also specify the [shadowColor]
  /// using which the different shadow colors will be derived.
  /// Alternatively, you can specify the color of each shadow separately using
  /// the [topShadowColor], [bottomShadowColor], [leftShadowColor], and
  /// [rightShadowColor] parameters.
  ///
  /// The depth of the button can be specified using the [depth] parameter.
  const NeoPopButton({
    required this.child,
    required this.color,
    this.onTapUp,
    this.onTapDown,
    this.onLongPress,
    this.disabledColor = const Color.fromRGBO(138, 138, 138, 1),
    this.parentColor = Colors.transparent,
    this.grandparentColor = Colors.transparent,
    this.buttonPosition = Position.fullBottom,
    this.animationDuration = 50,
    this.forwardDuration,
    this.reverseDuration,
    this.border,
    this.depth = 3,
    this.enabled = true,
    this.shadowColor,
    this.rightShadowColor,
    this.leftShadowColor,
    this.topShadowColor,
    this.bottomShadowColor,
    Key? key,
  }) : super(key: key);

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget child;

  /// The position of the button in the layout.
  ///
  /// By default, the button position is [Position.fullBottom].
  final Position buttonPosition;

  /// The depth of the button.
  ///
  /// By default, the depth is set to 3.
  final double depth;

  /// A pointer that will trigger a tap with a neopop button has stopped
  /// contacting the screen at a particular location.
  ///
  /// This is called after [onTapDown] is called.
  ///
  /// If [onTapUp] is null, the button will be disabled.
  final VoidCallback? onTapUp;

  /// A pointer that might cause a tap with a neopop button has contacted the
  /// screen at a particular location.
  ///
  /// This is called after a short timeout, even if the winning gesture has not
  /// yet been selected. If the tap gesture wins, [onTapUp] will be called.
  final VoidCallback? onTapDown;

  /// Called when a long press gesture with a neopop button has been recognized.
  ///
  /// Triggered when a pointer has remained in contact with the screen at the
  /// same location for a long period of time.
  final VoidCallback? onLongPress;

  /// The border to be painted around the button.
  final Border? border;

  /// If set to false, the button will be disabled.
  final bool enabled;

  /// The color of the button.
  ///
  /// If the shadow colors are not specified, they will be derived from the
  /// [color] parameter.
  final Color color;

  /// The color of the button when it is disabled.
  ///
  /// By default, the disabled color is set to [Color.fromRGBO(138, 138, 138, 1)].
  final Color disabledColor;

  /// The color of the parent widget.
  ///
  /// It is used to derive the shadow colors. If not specified, it will be
  /// derived from the [color] or [shadowColor] parameter.
  ///
  /// By default, the parent color is set to [Colors.transparent].
  final Color parentColor;

  /// The color of the grandparent widget.
  ///
  /// It is used to derive the shadow colors. If not specified, it will be
  /// derived from the [color] or [shadowColor] parameter.
  ///
  /// By default, the grandparent color is set to [Colors.transparent].
  final Color grandparentColor;

  /// The base color of the shadow. The shadow colors will be derived from this.
  final Color? shadowColor;

  /// The color of the right shadow.
  final Color? rightShadowColor;

  /// The color of the left shadow.
  final Color? leftShadowColor;

  /// The color of the top shadow.
  final Color? topShadowColor;

  /// The color of the bottom shadow.
  final Color? bottomShadowColor;

  /// The combined duration of the forward and reverse animation in milliseconds
  /// when the button is pressed.
  /// forwardDuration = animationDuration ~/ 2
  /// reverseDuration = animationDuration ~/ 2
  ///
  /// The default value is 50.0.
  ///
  /// In the case when different durations are needed, use the [forwardDuration] and
  /// [reverseDuration] parameters.
  final int animationDuration;

  /// Forward duration for button pressed animation
  final Duration? forwardDuration;

  /// Reverse duration for button pressed animation
  final Duration? reverseDuration;

  @override
  State<NeoPopButton> createState() => _NeoPopButtonState();
}

class _NeoPopButtonState extends State<NeoPopButton>
    implements NeoPopButtonParent {
  late Color ctaColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setCtaColor();
  }

  void setCtaColor() {
    if (widget.onTapUp == null) {
      ctaColor = widget.disabledColor;
    } else {
      ctaColor = widget.color;
    }
  }

  @override
  void didUpdateWidget(NeoPopButton oldState) {
    super.didUpdateWidget(oldState);
    setCtaColor();
  }

  Widget customPaintButton() {
    return CustomPaint(
      painter: NeoPopButtonPainter(
        getButtonDepth,
        getTopColor(),
        getLeftColor(),
        getBottomColor(),
        getRightColor(),
      ),
      child: Container(
        decoration: BoxDecoration(color: ctaColor, border: widget.border),
        child: widget.child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: getClipper(),
      clipBehavior: Clip.hardEdge,
      child: widget.enabled && widget.onTapUp != null
          ? NeoPopButtonTranslator(
              depth: getButtonDepth,
              animationDuration: widget.animationDuration,
              forwardDuration: widget.forwardDuration,
              reverseDuration: widget.reverseDuration,
              onTapUp: () => widget.onTapUp?.call(),
              onTapDown: widget.onTapDown,
              onLongPress: widget.onLongPress,
              child: customPaintButton(),
            )
          : widget.onTapUp != null
              ? GestureDetector(
                  child: customPaintButton(),
                  onTapUp: (_) => widget.onTapUp?.call(),
                )
              : customPaintButton(),
    );
  }

  Position get getButtonPosition => widget.buttonPosition;
  double get getButtonDepth => widget.depth;

  @override
  CustomClipper<Path> getClipper() {
    switch (getButtonPosition) {
      case Position.bottomCenter:
        return RBottomCenterClipper(getButtonDepth);
      case Position.bottomRight:
      case Position.fullBottom:
        return RBottomRightClipper(getButtonDepth);
      case Position.bottomLeft:
        return RBottomLeftClipper(getButtonDepth);
      case Position.topRight:
      case Position.centerRight:
      case Position.fullTop:
      case Position.fullCenter:
        return RTopRightClipper(getButtonDepth);
      case Position.centerLeft:
      case Position.center:
      case Position.topLeft:
      case Position.topCenter:
        return CenterClipper(getButtonDepth);
    }
  }

  @override
  Color getRightColor() {
    switch (getButtonPosition) {
      case Position.bottomRight:
      case Position.topRight:
      case Position.centerRight:
      case Position.fullTop:
      case Position.fullCenter:
      case Position.fullBottom:
        return widget.rightShadowColor ??
            ColorUtils.getHorizontalShadow(widget.shadowColor ?? ctaColor)
                .toColor();
      case Position.bottomCenter:
      case Position.center:
      case Position.topCenter:
      case Position.bottomLeft:
      case Position.topLeft:
      case Position.centerLeft:
        return Colors.transparent;
    }
  }

  @override
  Color getLeftColor() {
    switch (getButtonPosition) {
      case Position.bottomRight:
      case Position.topRight:
      case Position.centerRight:
      case Position.bottomCenter:
      case Position.center:
      case Position.topCenter:
        return widget.leftShadowColor ??
            ColorUtils.getHorizontalShadow(widget.parentColor).toColor();
      case Position.bottomLeft:
      case Position.topLeft:
      case Position.centerLeft:
      case Position.fullTop:
      case Position.fullCenter:
      case Position.fullBottom:
        return widget.grandparentColor;
    }
  }

  @override
  Color getBottomColor() {
    switch (getButtonPosition) {
      case Position.bottomLeft:
      case Position.bottomRight:
      case Position.bottomCenter:
      case Position.fullBottom:
        return widget.bottomShadowColor ??
            ColorUtils.getVerticalShadow(widget.shadowColor ?? ctaColor)
                .toColor();
      case Position.topRight:
      case Position.topCenter:
      case Position.topLeft:
      case Position.centerRight:
      case Position.center:
      case Position.centerLeft:
      case Position.fullTop:
      case Position.fullCenter:
        return Colors.transparent;
    }
  }

  @override
  Color getTopColor() {
    switch (getButtonPosition) {
      case Position.topRight:
      case Position.topCenter:
      case Position.topLeft:
      case Position.fullTop:
        return widget.grandparentColor;
      case Position.bottomRight:
      case Position.bottomCenter:
      case Position.bottomLeft:
      case Position.centerRight:
      case Position.centerLeft:
      case Position.center:
      case Position.fullCenter:
      case Position.fullBottom:
        return widget.topShadowColor ??
            ColorUtils.getVerticalShadow(widget.parentColor).toColor();
    }
  }
}
