import 'dart:async';

import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/login_screen.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MustLoginDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
          color: Colors.transparent,
          child: Container(
            height: ScreenHelper.screenHeight(context,358),
            width:  ScreenHelper.screenWidth(context,306),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenHelper.screenRadius(context, 8))
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: ScreenHelper.screenWidth(context,24)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/reicons/keys.png",
                    height: ScreenHelper.screenHeight(context, 150),
                  ),
                  SizedBox(height: ScreenHelper.screenHeight(context,32),),
                  Text(
                    "يجب تسجيل الدخول اولا",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                      color: BLACKCOLOR,
                      fontSize: ScreenHelper.screenFont(context,18)
                    ),
                  ),
                  SizedBox(height: ScreenHelper.screenHeight(context,9),),
                  Text(
                    "من فضلك قم بتسجيل الدخول او انشاء حساب جديد للاستمرار",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Color(0xff858585),
                        fontSize: ScreenHelper.screenFont(context,14)
                    ),
                  ),
                  SizedBox(height: ScreenHelper.screenHeight(context,25),),
                  UsedButton(
                    title: "تسجيل الدخول",
                    onTap: (){
                      Get.to(LoginScreen(),duration: Duration(milliseconds: 150),transition: Transition.leftToRight);
                    },
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
