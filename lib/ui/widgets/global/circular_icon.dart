import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';


class CircularIcon extends StatelessWidget {
  final String icon;


  CircularIcon({this.icon=' '});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHelper.screenHeight(context,36),
      height: ScreenHelper.screenHeight(context,36),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context, 30)),
        color: Color(0xffF7F8FF),
      ),
      child: Center(
        child: Image.asset(
          'assets/icons/$icon',
        height: ScreenHelper.screenHeight(context,15),
          color: TAGCOLOR,
        ),
      ),
    );
  }
}
