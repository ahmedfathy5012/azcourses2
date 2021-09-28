import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/start_welcome_screen.dart';
import 'package:azcourses/ui/screens/global/welcome_screen.dart';
import 'package:azcourses/ui/screens/onboarding/onboarding_screen.dart';
import 'package:azcourses/ui/screens/student/tabs_screen.dart';
import 'package:azcourses/ui/widgets/global/back_ground.dart';
import 'package:azcourses/ui/widgets/global/logo.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'menu_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  GetStorage box = GetStorage();
  GetStorage onBoardingBox = GetStorage("onBoarding");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
//      box.hasData("api_token")
//          ? Get.offAll(MenuDashboardPage(), transition: Transition.cupertino)
//          :

      if(onBoardingBox.hasData("onBoarding")){
        if(box.hasData("login")){
          Get.offAll(MenuDashboardPage(),duration: Duration(milliseconds: 150),transition: Transition.leftToRight);
        }else{
          Get.offAll(StartWelcomeScreen(),duration: Duration(milliseconds: 150),transition: Transition.leftToRight);
        }
      }else{
        Get.offAll(OnBoardingScreen(),duration: Duration(milliseconds: 150),transition: Transition.leftToRight);
      }

    });
  }

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
              alignment: Alignment.center,
              child: Container(
                height: ScreenHelper.screenHeight(context, 200),
                child: Image.asset(
                  "assets/reicons/logolarge.png"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff7C7C8C)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
