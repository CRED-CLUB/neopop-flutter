import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neopop/neopop.dart';
import 'package:neopop_example/utils/constants.dart';
import 'package:neopop_example/utils/page_controller_extension.dart';
import 'package:neopop_example/widgets/bottom_nav_widget.dart';

class PopButtonScreen extends StatefulWidget {
  const PopButtonScreen({Key? key, required this.controller}) : super(key: key);

  final PageController controller;

  @override
  State<PopButtonScreen> createState() => _PopButtonScreenState();
}

class _PopButtonScreenState extends State<PopButtonScreen> {
  final _shimmerKey = GlobalKey<NeoPopShimmerState>();

  @override
  void initState() {
    super.initState();
    _shimmerKey.currentState?.startShimmer();
  }

  @override
  void dispose() {
    _shimmerKey.currentState?.stopShimmer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          const Expanded(flex: 4, child: SizedBox()),
          SvgPicture.asset('assets/svg/heading_buttons.svg'),
          const Expanded(flex: 4, child: SizedBox()),
          SvgPicture.asset('assets/svg/text_win_button.svg'),
          const SizedBox(height: 15),
          NeoPopButton(
            color: kPopYellowColor,
            bottomShadowColor: kShadowColorYellow,
            rightShadowColor: kShadowColorYellow,
            depth: kButtonDepth,
            animationDuration: kButtonAnimationDuration,
            buttonPosition: Position.bottomRight,
            onTapUp: () => HapticFeedback.vibrate(),
            onTapDown: () => HapticFeedback.vibrate(),
            child: ClipRRect(
              child: NeoPopShimmer(
                key: _shimmerKey,
                enabled: true,
                shimmerColor: kShimmerColor,
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 1500),
                shimmerWidth: 15.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70.0,
                    vertical: 15,
                  ),
                  child: SvgPicture.asset('assets/svg/cta_text_play_now.svg'),
                ),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          SvgPicture.asset('assets/svg/text_bw_plunk.svg'),
          const SizedBox(height: 15),
          NeoPopButton(
            color: kPrimaryButtonColor,
            depth: kButtonDepth,
            animationDuration: kButtonAnimationDuration,
            buttonPosition: Position.bottomRight,
            onTapUp: () => HapticFeedback.vibrate(),
            onTapDown: () => HapticFeedback.vibrate(),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 80.0,
                vertical: 15,
              ),
              child: SvgPicture.asset('assets/svg/cta_text_view.svg'),
            ),
          ),
          const Expanded(child: SizedBox()),
          SvgPicture.asset('assets/svg/text_scan_button.svg'),
          const SizedBox(height: 18),
          NeoPopButton(
            color: kSecondaryButtonLightColor,
            bottomShadowColor: kShadowColorDarkGreen,
            rightShadowColor: kShadowColorGreen,
            animationDuration: kButtonAnimationDuration,
            depth: kButtonDepth,
            onTapUp: () => HapticFeedback.vibrate(),
            onTapDown: () => HapticFeedback.vibrate(),
            border: Border.all(
              color: kBorderColorGreen,
              width: kButtonBorderWidth,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 50.0,
                vertical: 13,
              ),
              child: SvgPicture.asset('assets/svg/cta_text_scan.svg'),
            ),
          ),
          const Expanded(flex: 4, child: SizedBox()),
          BottomNavWidget(
            onLeftTap: () =>
                Navigator.of(context).popUntil((route) => route.isFirst),
            onRightTap: () => widget.controller.slideToNextPage(),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }
}
