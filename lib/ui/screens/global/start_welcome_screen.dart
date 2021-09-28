import 'package:azcourses/ui/screens/global/signup_second_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:azcourses/helpers/screen_helper.dart';
import 'package:azcourses/ui/screens/global/add_center_register.dart';
import 'package:azcourses/ui/screens/global/login_screen.dart';
import 'package:azcourses/ui/screens/global/signup_screen.dart';
import 'package:azcourses/ui/screens/onboarding/onboarding_item.dart';
import 'package:azcourses/ui/widgets/global/back_ground.dart';
import 'package:azcourses/ui/widgets/global/square_image_container.dart';
import 'package:azcourses/ui/widgets/global/used_button.dart';
import 'package:get_storage/get_storage.dart';

class StartWelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackGround(),
            Column(
              children: [
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 100),
                ),

                Image.asset(
                    "assets/reicons/logolarge.png",
                  height: ScreenHelper.screenHeight(context,220),
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 40),
                ),
                Text(
                  "مرحبا بك من جديد",
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.headline2.copyWith(
                      fontSize: ScreenHelper.screenFont(context, 24),
                      color: Colors.white,
                      fontFamily: "simebold"
                  ),
                ),
                SizedBox(
                  height: ScreenHelper.screenHeight(context, 5),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenHelper.screenWidth(context, 53)),
                  child:
                  Text(
                    "سجل في منصة الكورسات الخاصة بك الان او يمكنك تصفح المنصات و الدخول كزائر",
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        fontSize: ScreenHelper.screenFont(context, 14),
                        color: Colors.white,
                        fontFamily: "light"
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.screenWidth(context, 20),
                  vertical: ScreenHelper.screenHeight(context, 230)
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: UsedButton(
                  widthFraction: 343,
                  onTap: () {
                    Get.to(LoginScreen(),duration: Duration(milliseconds: 150),transition: Transition.leftToRight);
                  },
                  title: "تسجيل الدخول",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.screenWidth(context, 20),
                  vertical: ScreenHelper.screenHeight(context, 150)
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: UsedButton(
                  widthFraction: 343,
                  onTap: () {

                    Get.to(SignUpScreen(),duration: Duration(milliseconds: 150),transition: Transition.leftToRight);
                  },
                  title: "الدخول الي منصة az courses",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenHelper.screenWidth(context, 20),
                  vertical: ScreenHelper.screenHeight(context, 70)
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: UsedButton(
                  widthFraction: 343,
                  onTap: () {
                    Get.to(AddCenterRegister(),duration: Duration(milliseconds: 150),transition: Transition.leftToRight);
                  },
                  title: "الدخول الي منصة معينة",
                ),
              ),
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: ScreenHelper.screenHeight(context, 30),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenHelper.screenWidth(context, 16)),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child:  GestureDetector(
                      onTap: (){
                        GetStorage box = GetStorage();
                        if(box.hasData("api_token")){
                          box.remove("api_token");
                        }
                        Get.to(
                          SignUpSecondScreen(isVisitor: true,),
                          transition: Transition.leftToRight,
                          duration: Duration(milliseconds: 150)
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "الدخول كزائر",
                            style: TextStyle(
                              fontFamily: "simebold",
                              color: Colors.white,
                              fontSize: ScreenHelper.screenFont(context,16),
                            ),
                          ),
                          SizedBox(
                            width: ScreenHelper.screenWidth(context,5),
                          ),
                          Icon(Icons.arrow_back_ios_outlined,color: Colors.white,size: ScreenHelper.screenWidth(context,11),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
