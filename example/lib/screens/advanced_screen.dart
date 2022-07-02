import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neopop/neopop.dart';
import 'package:neopop_example/utils/constants.dart';
import 'package:neopop_example/utils/page_controller_extension.dart';
import 'package:neopop_example/widgets/bottom_nav_widget.dart';

class PopAdvancedScreen extends StatelessWidget {
  const PopAdvancedScreen({Key? key, required this.controller})
      : super(key: key);

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(flex: 7, child: SizedBox()),
        SvgPicture.asset('assets/svg/heading_advanced.svg'),
        const Expanded(flex: 5, child: SizedBox()),
        SvgPicture.asset('assets/svg/text_adjacent_buttons.svg'),
        const SizedBox(height: 20),
        const _AdjacentButtons(),
        const Expanded(flex: 2, child: SizedBox()),
        SvgPicture.asset('assets/svg/text_config_buttons.svg'),
        const SizedBox(height: 20),
        const _ConfigButtons(),
        const Expanded(flex: 4, child: SizedBox()),
        BottomNavWidget(
          onLeftTap: () => controller.slideToPrevPage(),
          onRightTap: () => controller.slideToNextPage(),
        ),
        const Expanded(flex: 2, child: SizedBox()),
      ],
    );
  }
}

class _AdjacentButtons extends StatelessWidget {
  const _AdjacentButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  _WhiteHorizontal(),
                  _BlackHorizontal(),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  _BlackHorizontal(),
                  _WhiteHorizontal(),
                ],
              ),
            ],
          ),
        ),
        const Spacer(flex: 1),
        Expanded(
          flex: 5,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    _WhiteVertical(),
                    _BlackVertical(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    _BlackVertical(),
                    _WhiteVertical(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WhiteHorizontal extends StatelessWidget {
  const _WhiteHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NeoPopButton(
        color: kPrimaryButtonColor,
        animationDuration: kButtonAnimationDuration,
        buttonPosition: Position.fullBottom,
        depth: kButtonDepth,
        onTapUp: () => HapticFeedback.vibrate(),
        onTapDown: () => HapticFeedback.vibrate(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
          child: SvgPicture.asset('assets/svg/cta_text_button.svg'),
        ),
      ),
    );
  }
}

class _BlackHorizontal extends StatelessWidget {
  const _BlackHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NeoPopButton(
        color: kSecondaryButtonLightColor,
        animationDuration: kButtonAnimationDuration,
        bottomShadowColor: kShadowColorDarkGreen,
        rightShadowColor: kShadowColorGreen,
        buttonPosition: Position.fullBottom,
        depth: kButtonDepth,
        onTapUp: () => HapticFeedback.vibrate(),
        onTapDown: () => HapticFeedback.vibrate(),
        border: Border.all(color: kBorderColorGreen, width: kButtonBorderWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
          child: SvgPicture.asset(
            'assets/svg/cta_text_button.svg',
            color: kPrimaryButtonColor,
          ),
        ),
      ),
    );
  }
}

class _WhiteVertical extends StatelessWidget {
  const _WhiteVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      color: kPrimaryButtonColor,
      animationDuration: kButtonAnimationDuration,
      buttonPosition: Position.fullBottom,
      depth: kButtonDepth,
      onTapUp: () => HapticFeedback.vibrate(),
      onTapDown: () => HapticFeedback.vibrate(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 17.5),
        child: SvgPicture.asset('assets/svg/cta_text_button.svg'),
      ),
    );
  }
}

class _BlackVertical extends StatelessWidget {
  const _BlackVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeoPopButton(
      color: kSecondaryButtonLightColor,
      animationDuration: kButtonAnimationDuration,
      bottomShadowColor: kShadowColorDarkGreen,
      rightShadowColor: kShadowColorGreen,
      buttonPosition: Position.fullBottom,
      depth: kButtonDepth,
      onTapUp: () => HapticFeedback.vibrate(),
      onTapDown: () => HapticFeedback.vibrate(),
      border: Border.all(color: kBorderColorGreen, width: kButtonBorderWidth),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 17.5),
        child: SvgPicture.asset(
          'assets/svg/cta_text_button.svg',
          color: kPrimaryButtonColor,
        ),
      ),
    );
  }
}

class _ConfigButtons extends StatelessWidget {
  const _ConfigButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 190,
      height: 190,
      child: NeoPopCard(
        color: kCardColor,
        depth: kButtonDepth,
        vShadowColor: kCardVShadowColor,
        hShadowColor: kCardHShadowColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                _BlackButton(position: Position.topLeft),
                SizedBox(height: 10),
                _BlackButton(position: Position.centerLeft),
                SizedBox(height: 10),
                _BlackButton(position: Position.bottomLeft),
              ],
            ),
            const Expanded(child: SizedBox()),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                _BlackButton(position: Position.topCenter),
                SizedBox(height: 10),
                _BlackButton(position: Position.center),
                SizedBox(height: 10),
                _BlackButton(position: Position.bottomCenter),
              ],
            ),
            const Expanded(child: SizedBox()),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                _BlackButton(position: Position.topRight),
                SizedBox(height: 10),
                _BlackButton(position: Position.centerRight),
                SizedBox(height: 10),
                _BlackButton(position: Position.bottomRight),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BlackButton extends StatelessWidget {
  const _BlackButton({Key? key, this.position = Position.bottomRight})
      : super(key: key);

  final Position position;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: NeoPopButton(
        color: kSecondaryButtonLightColor,
        animationDuration: kButtonAnimationDuration,
        bottomShadowColor: kShadowColorDarkGreen,
        rightShadowColor: kShadowColorGreen,
        parentColor: kCardColor,
        grandparentColor: kBackgroundColor,
        buttonPosition: position,
        depth: kButtonDepth,
        onTapUp: () => HapticFeedback.vibrate(),
        onTapDown: () => HapticFeedback.vibrate(),
        border: Border.all(color: kBorderColorGreen, width: kButtonBorderWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
          child: SvgPicture.asset(
            'assets/svg/cta_text_button.svg',
            color: kPrimaryButtonColor,
          ),
        ),
      ),
    );
  }
}
