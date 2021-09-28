import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

import '../customText.dart';

class ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){},
      child: Container(
        width: ScreenHelper.screenHeight(context,23),
        height: ScreenHelper.screenHeight(context,23),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context, 20)),
          color: Color(0xffE7E7E7),
        ),
        child: Center(
          child: Image.asset(
            'assets/icons/share.png',
            color: TAGCOLOR,
            height: ScreenHelper.screenHeight(context,12.5),
          ),
        ),
      ),
    );
  }
}
