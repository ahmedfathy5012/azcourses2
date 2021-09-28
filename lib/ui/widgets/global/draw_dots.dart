import 'package:flutter/material.dart';
// Dart Packages
// Flutter packages
// Screens
// Widgets
// Providers
// Models
// Helpers
import '../../../utils/constants.dart';
import '../../../helpers/screen_helper.dart';

class DrawDot extends StatelessWidget {
  bool isActive;
  DrawDot(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: isActive ? ScreenHelper.screenWidth(context, 10) : ScreenHelper.screenWidth(context, 8),
      width: isActive ? ScreenHelper.screenWidth(context, 10) : ScreenHelper.screenWidth(context, 8),
      decoration: BoxDecoration(
        color: isActive ? MAINCOLOR : MAINCOLOR.withOpacity(.6),
        borderRadius: BorderRadius.all(Radius.circular(ScreenHelper.screenWidth(context, 6))),
      ),
    );
  }
}