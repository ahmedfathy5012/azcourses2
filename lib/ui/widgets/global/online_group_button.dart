import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';

import '../customText.dart';

class OnlineGroupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){},
      child: Container(
        width: ScreenHelper.screenWidth(context,71),
        height: ScreenHelper.screenHeight(context,23),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context, 20)),
          color: Color(0xffE7E7E7),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: 'أنضم الان',
                fontW: FW.semibold,
                fontSize: 8,
                color: TAGCOLOR,
              ),
              SizedBox(
                width: ScreenHelper.screenWidth(context,5),
              ),
              Image.asset(
                'assets/icons/cam.png',
                color: TAGCOLOR,
                height: ScreenHelper.screenHeight(context,12.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
