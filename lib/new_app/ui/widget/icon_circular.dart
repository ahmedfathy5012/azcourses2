import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';


class IconCircular extends StatelessWidget {
  final String icon;
  final Function onTap;


  IconCircular({this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap??(){},
      child: Container(
        height: ScreenHelper.screenHeight(context,29),
        width: ScreenHelper.screenHeight(context,29),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context, 29)),
         color: Colors.white,
       ),
        child: Center(
          child: Image.asset(
            'assets/icons/$icon',
            height: ScreenHelper.screenHeight(context, 13),
            color: MAINCOLOR,
          ),
        ),
      ),
    );
  }
}
