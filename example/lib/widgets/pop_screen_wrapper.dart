import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neopop_example/utils/constants.dart';

class PopScreenWrapper extends StatelessWidget {
  const PopScreenWrapper({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isSmallHeight = MediaQuery.of(context).size.height < 592;
    final isMobileWidth = MediaQuery.of(context).size.width < 583;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset('assets/svg/wrapper_bg.svg', fit: BoxFit.fill),
            if (isMobileWidth)
              Image.asset('assets/bg_lights.png', fit: BoxFit.fill),
            Container(
              height: double.maxFinite,
              width: double.maxFinite,
              margin: EdgeInsets.fromLTRB(
                isMobileWidth ? 45 : 140,
                isSmallHeight ? 50 : 60,
                isMobileWidth ? 45 : 140,
                isSmallHeight ? 90 : 115,
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
