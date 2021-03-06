import 'package:flutter/material.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
import 'onboarding_dot.dart';


class OnBoardingDot extends StatefulWidget {
  bool isActive;

  OnBoardingDot({this.isActive = false});

  @override
  _OnBoardingDotState createState() => _OnBoardingDotState();
}

class _OnBoardingDotState extends State<OnBoardingDot> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        width: ScreenHelper.screenWidth(context, widget.isActive ? 15 : 7),
        height: ScreenHelper.screenWidth(context, 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(ScreenHelper.screenRadius(context, 5))),
          color: widget.isActive ? Colors.white : Color(0xff616681),
        ));
  }
}
