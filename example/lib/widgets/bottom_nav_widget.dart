import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    Key? key,
    required this.onLeftTap,
    required this.onRightTap,
  }) : super(key: key);

  final VoidCallback onLeftTap;
  final VoidCallback onRightTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        _NavCta(svgPath: 'assets/svg/left_nav_cta.svg', onTap: onLeftTap),
        const SizedBox(width: 10),
        _NavCta(
          svgPath: 'assets/svg/cross_nav_cta.svg',
          onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
        ),
        const SizedBox(width: 10),
        _NavCta(svgPath: 'assets/svg/right_nav_cta.svg', onTap: onRightTap),
      ],
    );
  }
}

class _NavCta extends StatelessWidget {
  const _NavCta({Key? key, required this.svgPath, this.onTap})
      : super(key: key);

  final VoidCallback? onTap;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(svgPath, height: 40.0, width: 40.0),
    );
  }
}
