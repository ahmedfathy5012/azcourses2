import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:azcourses/bloc/model/center_model.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/login_screen.dart';
import 'package:azcourses/ui/screens/global/signup_screen.dart';
import 'package:azcourses/ui/widgets/global/back_ground.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:azcourses/utils/constants.dart';

import 'create_account.dart';
import 'google_map_screen.dart';

class WelcomeScreen extends StatelessWidget {
  CenterModel centerModel;


  WelcomeScreen({this.centerModel});

  @override
  Widget build(BuildContext context) {
    //
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            BackGround(),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  // Container(
                  //   height: MediaQuery.of(context).size.width,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: Image(
                  //     image: AssetImage("assets/images/study.png"),
                  //     fit: BoxFit.fill,
                  //   ),
                  // ),
                  SizedBox(
                    height: ScreenHelper.screenHeight(context,130),
                  ),
                  Container(
                    height: ScreenHelper.screenHeight(context,250),
                    width: ScreenHelper.screenHeight(context,250),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(ScreenHelper.screenHeight(context,250)),
                      border: Border.all(
                        width: 1,
                        color: Colors.white
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          centerModel.printSplash,
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  SizedBox(
                    height: ScreenHelper.screenHeight(context, 43),
                  ),
                  Text(
                    "مرحبا بك في منصة ${centerModel.name}",
                    style: Theme.of(context).textTheme.headline3.copyWith(
                        fontSize: ScreenHelper.screenFont(context, 31)),
                  ),
                  SizedBox(
                    height: ScreenHelper.screenHeight(context, 10),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenHelper.screenWidth(context, 80)),
                    child: Text(
                      "سجل الدخول الان و احصل علي اجدد الدروس او انشأ حسابك الخاص و اشترك في المنصة التعلمي",
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            fontSize: ScreenHelper.screenFont(context, 14),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.screenWidth(context, 16)),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: ScreenHelper.screenHeight(context, 100),
                    child: Column(
                      children: [
                        // UsedButton(
                        //   title: "تسجيل الدخول",
                        //   onTap: () {
                        //     Get.to(LoginScreen(),
                        //         transition: Transition.cupertino);
                        //   },
                        // ),
                        // SizedBox(
                        //   height: ScreenHelper.screenHeight(context, 20),
                        // ),
                        UsedButton(
                          widthFraction: 343,
                          title: "إنشاء حساب",
                          buttonColor: Color(0xff2C3960),
                          onTap: () {
                            Get.to(SignUpScreen(),
//                                GoogleMapScreen(),
                                transition: Transition.cupertino);
                          },
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
